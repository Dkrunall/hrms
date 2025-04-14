'use client';

import { useState, useEffect } from 'react';
import { MagnifyingGlassIcon, DocumentArrowDownIcon } from '@heroicons/react/24/outline';
import DashboardLayout from '../components/layout/DashboardLayout';

export default function Payslip() {
  const [payslips, setPayslips] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedMonth, setSelectedMonth] = useState('November');
  const [selectedYear, setSelectedYear] = useState('2023');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchPayslips();
  }, [selectedMonth, selectedYear]);

  const fetchPayslips = async () => {
    try {
      setLoading(true);
      const response = await fetch('http://localhost:3001/api/payslips');
      if (!response.ok) throw new Error('Failed to fetch payslips');
      const data = await response.json();
      setPayslips(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const filteredPayslips = payslips.filter(payslip => {
    const payslipDate = new Date(payslip.month);
    const monthName = new Date(payslipDate).toLocaleString('default', { month: 'long' });
    const yearStr = payslipDate.getFullYear().toString();
    
    return (payslip.Employee_Name?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      payslip.employee_id?.toString().toLowerCase().includes(searchTerm.toLowerCase())) &&
      monthName === selectedMonth &&
      yearStr === selectedYear;
  });

  const formatCurrency = (amount) => {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD'
    }).format(amount);
  };

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-8">
          <div>
            <h1 className="text-3xl font-semibold text-gray-900">Payslip Management</h1>
            <p className="mt-2 text-sm text-gray-600">Generate and manage employee payslips</p>
          </div>
          <button 
            onClick={() => window.location.href = '/payslip/generate'}
            className="px-4 py-2 text-sm font-medium text-white bg-gray-900 rounded-lg hover:bg-gray-800 flex items-center gap-2"
          >
            Generate New Payslip
          </button>
        </div>

        <div className="mt-6">
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 mb-6">
            <div className="flex flex-wrap gap-4 items-center">
              <div className="flex-1 min-w-[200px]">
                <div className="relative">
                  <MagnifyingGlassIcon className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-400" />
                  <input
                    type="text"
                    placeholder="Search by name or ID..."
                    className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                  />
                </div>
              </div>
              <select
                className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                value={selectedMonth}
                onChange={(e) => setSelectedMonth(e.target.value)}
              >
                {['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'].map((month) => (
                  <option key={month} value={month}>{month}</option>
                ))}
              </select>
              <select
                className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                value={selectedYear}
                onChange={(e) => setSelectedYear(e.target.value)}
              >
                {['2023', '2022', '2021'].map((year) => (
                  <option key={year} value={year}>{year}</option>
                ))}
              </select>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
            <div className="overflow-x-auto">
              <table className="min-w-full divide-y divide-gray-200">
                <thead className="bg-gray-50">
                  <tr>
                    <th scope="col" className="pl-6 py-3 text-left">
                      <input type="checkbox" className="rounded border-gray-300 text-gray-900 focus:ring-gray-900" />
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Employee
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Period
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Basic Salary
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Allowances
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Deductions
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Net Salary
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Status
                    </th>
                    <th scope="col" className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Actions
                    </th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {filteredPayslips.map((payslip) => (
                    <tr key={payslip.id} className="hover:bg-gray-50">
                      <td className="pl-6 py-4 whitespace-nowrap">
                        <input type="checkbox" className="rounded border-gray-300 text-gray-900 focus:ring-gray-900" />
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="flex items-center">
                          <div className="h-10 w-10 flex-shrink-0">
                            <div className="h-10 w-10 rounded-full bg-gray-200 flex items-center justify-center">
                              <span className="text-sm font-medium text-gray-600">{payslip.employeeName.split(' ').map(n => n[0]).join('')}</span>
                            </div>
                          </div>
                          <div className="ml-4">
                            <div className="text-sm font-medium text-gray-900">{payslip.employeeName}</div>
                            <div className="text-sm text-gray-500">{payslip.employeeId}</div>
                          </div>
                        </div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="text-sm font-medium text-gray-900">{payslip.month} {payslip.year}</div>
                        <div className="text-xs text-gray-500">Pay Period</div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="text-sm font-medium text-gray-900">{formatCurrency(payslip.basicSalary)}</div>
                        <div className="text-xs text-gray-500">Base Pay</div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="text-sm font-medium text-green-600">+{formatCurrency(payslip.allowances)}</div>
                        <div className="text-xs text-gray-500">Benefits</div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="text-sm font-medium text-red-600">-{formatCurrency(payslip.deductions)}</div>
                        <div className="text-xs text-gray-500">Tax & Others</div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="text-sm font-medium text-gray-900">{formatCurrency(payslip.netSalary)}</div>
                        <div className="text-xs text-gray-500">Net Pay</div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${payslip.status === 'Generated' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'}`}>
                          {payslip.status}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        {payslip.status === 'Generated' && (
                          <button 
                            onClick={() => {
                              // Create PDF blob and trigger download
                              const content = JSON.stringify(payslip, null, 2);
                              const blob = new Blob([content], { type: 'application/pdf' });
                              const url = window.URL.createObjectURL(blob);
                              const a = document.createElement('a');
                              a.href = url;
                              a.download = `payslip-${payslip.employeeId}-${payslip.month}-${payslip.year}.pdf`;
                              document.body.appendChild(a);
                              a.click();
                              window.URL.revokeObjectURL(url);
                              document.body.removeChild(a);
                            }}
                            className="text-gray-900 hover:text-gray-700 flex items-center gap-1"
                          >
                            <DocumentArrowDownIcon className="h-5 w-5" />
                            Download
                          </button>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}