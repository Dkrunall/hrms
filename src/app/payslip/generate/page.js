'use client';

import { useState, useEffect } from 'react';
import DashboardLayout from '../../components/layout/DashboardLayout';
import { jsPDF } from 'jspdf';
import autoTable from 'jspdf-autotable';

export default function GenerateMinimalPayslip() {
  const [employees, setEmployees] = useState([]);
  const [selectedEmployee, setSelectedEmployee] = useState('');
  const [employeeDetails, setEmployeeDetails] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  // Months are 0-indexed in JavaScript; we add 1 later for display.
  const [month, setMonth] = useState(new Date().getMonth());
  const [year, setYear] = useState(new Date().getFullYear());

  useEffect(() => {
    fetchEmployees();
  }, []);

  const fetchEmployees = async () => {
    try {
      const res = await fetch('http://localhost:3001/api/employees');
      if (!res.ok) throw new Error('Failed to fetch employees');
      const data = await res.json();
      setEmployees(data);
    } catch (err) {
      setError('Error fetching employees: ' + err.message);
    }
  };

  const fetchEmployeeDetails = async (id) => {
    if (!id) return;
    try {
      setLoading(true);
      const res = await fetch(`http://localhost:3001/api/employees/${id}`);
      if (!res.ok) throw new Error('Failed to fetch employee details');
      const data = await res.json();
      setEmployeeDetails(data);
    } catch (err) {
      setError('Error fetching employee details: ' + err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleEmployeeChange = (e) => {
    const id = e.target.value;
    setSelectedEmployee(id);
    fetchEmployeeDetails(id);
  };

  // Minimal and modern PDF generation with jsPDF & AutoTable
  const generatePDF = (payslipData) => {
    const doc = new jsPDF({ unit: 'mm', format: 'a4', orientation: 'portrait' });

    // --- Header (Minimal) ---
    doc.setFont('helvetica', 'bold');
    doc.setFontSize(18);
    doc.text('Hotel Peninsula Grand', doc.internal.pageSize.getWidth() / 2, 15, { align: 'center' });
    doc.setFont('helvetica', 'normal');
    doc.setFontSize(10);
    doc.text('90 Feet Road, Lokmanya Tilak Nagar, Saki Naka,', doc.internal.pageSize.getWidth() / 2, 21, { align: 'center' });
    doc.text('Mumbai, Maharashtra - 400072', doc.internal.pageSize.getWidth() / 2, 26, { align: 'center' });
    
    // --- Employee Info (Minimal) ---
    doc.setFontSize(10);
    doc.text(`Employee Name: ${payslipData.employeeName}`, 20, 35);
    doc.text(`Designation: ${payslipData.designation}`, 20, 40);
    doc.text(`Date of Joining: ${payslipData.doj}`, 20, 45);
    doc.text(`Employee ID: ${payslipData.employeeId}`, 120, 35);
    
    // --- Payslip Title ---
    const monthNames = ["January","February","March","April","May","June","July","August","September","October","November","December"];
    const title = `Payslip - ${monthNames[payslipData.month - 1]}, ${payslipData.year}`;
    doc.setFont('helvetica', 'bold');
    doc.setFontSize(12);
    doc.text(title, doc.internal.pageSize.getWidth() / 2, 55, { align: 'center' });
    
    // --- Table for Earnings & Deductions (Minimal style) ---
    // Build data arrays (you may replace fallback values with dynamic payslipData)
    const earnings = [
      ["Gross Salary", payslipData.grossSalary || "₹ 50000"],
      ["Basic Salary", payslipData.basicSalary || "₹ 33500"],
      ["HRA", payslipData.hra || "₹ 16500"],
      ["Reimbursements", payslipData.reimbursements || "₹ 1000"],
      ["Bonus", payslipData.bonus || "₹ 0"],
    ];
    const deductions = [
      ["Leave Deductions", payslipData.leaveDeductions || "₹ 3846"],
      ["Other Deductions", payslipData.otherDeductions || "₹ 0"],
      ["TDS", payslipData.tds || "₹ 0"],
      ["ESIC Contribution", payslipData.esicContribution || "₹ 0"],
      ["Professional Tax", payslipData.professionalTax || "₹ 200"],
    ];
    // Combine rows: each row shows earning and deduction pair
    const tableRows = [];
    const rowCount = Math.max(earnings.length, deductions.length);
    for (let i = 0; i < rowCount; i++) {
      const earning = earnings[i] ? `${earnings[i][0]}: ${earnings[i][1]}` : "";
      const deduction = deductions[i] ? `${deductions[i][0]}: ${deductions[i][1]}` : "";
      tableRows.push([earning, deduction]);
    }

    autoTable(doc, {
      startY: 60,
      head: [["Earnings", "Deductions"]],
      body: tableRows,
      theme: "plain",  // plain theme ensures minimal borders and styling
      styles: { fontSize: 9, cellPadding: 2, textColor: 50 },
      headStyles: { fillColor: false, textColor: 0, fontStyle: 'bold', lineWidth: 0.1 },
      tableLineColor: 200,
      tableLineWidth: 0.1,
      margin: { left: 20, right: 20 }
    });

    // --- Totals & Net Salary ---
    let finalY = doc.lastAutoTable.finalY + 10;
    doc.setFont('helvetica', 'bold');
    doc.setFontSize(10);
    doc.text(`Total Earnings: ${payslipData.totalEarnings || "₹ 51000"}`, 20, finalY);
    doc.text(`Total Deductions: ${payslipData.totalDeductions || "₹ 4046"}`, 120, finalY);
    finalY += 10;
    doc.setFontSize(12);
    doc.text(`Net Salary: ${payslipData.netSalary || "₹ 46954"}`, doc.internal.pageSize.getWidth() / 2, finalY, { align: "center" });

    // --- Footer (Minimal) ---
    finalY += 15;
    doc.setFontSize(9);
    doc.setFont('helvetica', 'normal');
    doc.text(`Authorized by: ${payslipData.authorizedBy || "Managing Director"}`, 20, finalY);
    finalY += 8;
    doc.text("(Computer-generated payslip)", doc.internal.pageSize.getWidth() / 2, finalY, { align: "center" });

    return doc;
  };

  const generatePayslip = async () => {
    if (!selectedEmployee) {
      setError("Please select an employee");
      return;
    }
    try {
      setLoading(true);
      const res = await fetch("http://localhost:3001/api/payslip/generate", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        // Add 1 to month (JavaScript months are 0-indexed)
        body: JSON.stringify({ employeeId: selectedEmployee, month: month + 1, year }),
      });
      if (!res.ok) throw new Error("Failed to generate payslip");
      const data = await res.json();
      const payslipData = {
        ...data,
        grossSalary: data.grossSalary,
        basicSalary: data.basicSalary,
        hra: data.hra,
        reimbursements: data.reimbursements,
        bonus: data.bonus,
        leaveDeductions: data.leaveDeductions,
        otherDeductions: data.otherDeductions,
        tds: data.tds,
        esicContribution: data.esicContribution,
        professionalTax: data.professionalTax,
        totalEarnings: data.totalEarnings,
        totalDeductions: data.totalDeductions,
        netSalary: data.monthlyNetSalary,
        authorizedBy: data.authorizedBy,
        month: month + 1,
        year,
      };
      const doc = generatePDF(payslipData);
      const pdfBlob = doc.output("blob");
      const url = window.URL.createObjectURL(pdfBlob);
      const a = document.createElement("a");
      a.href = url;
      a.download = `payslip-${payslipData.employeeId}-${month + 1}-${year}.pdf`;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      window.URL.revokeObjectURL(url);
    } catch (err) {
      setError("Error generating payslip: " + err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <h1 className="text-3xl font-semibold text-gray-900">Generate Payslip</h1>
          <p className="mt-2 text-sm text-gray-600">Generate payslip for employees</p>
        </div>
        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
          {error && (
            <div className="mb-4 p-4 bg-red-50 border border-red-200 rounded-lg text-red-600">
              {error}
            </div>
          )}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Select Employee</label>
              <select
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                value={selectedEmployee}
                onChange={handleEmployeeChange}
                disabled={loading}
              >
                <option value="">Select an employee</option>
                {employees.map((employee) => (
                  <option key={employee.id} value={employee.id}>
                    {employee.Employee_Name} ({employee.Emp_No})
                  </option>
                ))}
              </select>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Month</label>
                <select
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  value={month}
                  onChange={(e) => setMonth(parseInt(e.target.value))}
                  disabled={loading}
                >
                  {[
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December"
                  ].map((mName, index) => (
                    <option key={mName} value={index}>
                      {mName}
                    </option>
                  ))}
                </select>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Year</label>
                <select
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  value={year}
                  onChange={(e) => setYear(parseInt(e.target.value))}
                  disabled={loading}
                >
                  {Array.from({ length: 5 }, (_, i) => new Date().getFullYear() - i).map((yr) => (
                    <option key={yr} value={yr}>
                      {yr}
                    </option>
                  ))}
                </select>
              </div>
            </div>
          </div>
          {employeeDetails && (
            <div className="mt-6 p-4 bg-gray-50 rounded-lg">
              <h3 className="text-lg font-medium text-gray-900 mb-4">Employee Details</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <div>
                  <p className="text-sm text-gray-500">Employee ID</p>
                  <p className="text-sm font-medium">{employeeDetails.Emp_No}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-500">Department</p>
                  <p className="text-sm font-medium">{employeeDetails.Department}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-500">Designation</p>
                  <p className="text-sm font-medium">{employeeDetails.Designation}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-500">Date of Joining</p>
                  <p className="text-sm font-medium">{new Date(employeeDetails.DOJ).toLocaleDateString()}</p>
                </div>
              </div>
            </div>
          )}
          <div className="mt-6 flex justify-end">
            <button
              onClick={generatePayslip}
              disabled={loading || !selectedEmployee}
              className="px-6 py-2 text-sm font-medium text-white bg-gray-900 rounded-lg hover:bg-gray-800 flex items-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {loading ? "Generating..." : "Generate & Download Payslip"}
            </button>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}
