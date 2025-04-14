'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { ArrowLeftIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import DashboardLayout from '../../../components/layout/DashboardLayout';

export default function ViewSalary() {
  const { id } = useParams();
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [salaryData, setSalaryData] = useState(null);

  useEffect(() => {
    fetchSalaryDetails();
  }, [id]);

  const fetchSalaryDetails = async () => {
    try {
      const response = await fetch(`http://localhost:3001/api/salary/${id}`);
      if (!response.ok) {
        throw new Error('Failed to fetch salary details');
      }
      const data = await response.json();
      setSalaryData(data);
      setError(null);
    } catch (err) {
      setError('Error loading salary details: ' + err.message);
    } finally {
      setLoading(false);
    }
  };

  const formatCurrency = (amount) => {
    if (amount === null || amount === undefined) return '₹0.00';
    // Remove commas and convert to number
    const numericAmount = typeof amount === 'string' ? parseFloat(amount.replace(/,/g, '')) : amount;
    if (isNaN(numericAmount)) return '₹0.00';
    return new Intl.NumberFormat('en-IN', {
      style: 'currency',
      currency: 'INR',
      minimumFractionDigits: 2
    }).format(numericAmount);
  };

  const handleDelete = async () => {
    if (confirm('Are you sure you want to delete this salary record?')) {
      try {
        const response = await fetch(`http://localhost:3001/api/salary/${id}`, {
          method: 'DELETE',
        });

        if (!response.ok) {
          throw new Error('Failed to delete salary record');
        }

        router.push('/salary');
      } catch (err) {
        setError('Error deleting salary record: ' + err.message);
      }
    }
  };

  if (loading) {
    return (
      <DashboardLayout>
        <div className="flex items-center justify-center p-8">
          <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-gray-900"></div>
        </div>
      </DashboardLayout>
    );
  }

  if (error) {
    return (
      <DashboardLayout>
        <div className="p-4 text-center text-red-500 bg-red-50 rounded-lg">{error}</div>
      </DashboardLayout>
    );
  }

  if (!salaryData) {
    return (
      <DashboardLayout>
        <div className="p-4 text-center text-gray-500">No salary data found</div>
      </DashboardLayout>
    );
  }

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <Link
                href="/salary"
                className="p-2 rounded-lg hover:bg-gray-100 transition-colors"
              >
                <ArrowLeftIcon className="h-6 w-6 text-gray-500" />
              </Link>
              <h1 className="text-3xl font-semibold text-gray-900">Salary Details</h1>
            </div>
            <div className="flex gap-3">
              <button
                onClick={() => router.push(`/salary/${id}/edit`)}
                className="px-4 py-2 text-sm font-medium text-white bg-gray-900 rounded-lg hover:bg-gray-800"
              >
                Edit
              </button>
              <button
                onClick={handleDelete}
                className="px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-lg hover:bg-red-700"
              >
                Delete
              </button>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
          <div className="p-6 space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <h2 className="text-lg font-medium text-gray-900 mb-4">Employee Information</h2>
                <div className="space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-500">Employee Number</label>
                    <div className="mt-1 text-base text-gray-900">{salaryData.Emp_No}</div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-500">Name</label>
                    <div className="mt-1 text-base text-gray-900">{salaryData.Title} {salaryData.Employee_Name}</div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-500">Designation</label>
                    <div className="mt-1 text-base text-gray-900">{salaryData.Designation}</div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-500">Department</label>
                    <div className="mt-1 text-base text-gray-900">{salaryData.Department}</div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-500">Section/Outlet</label>
                    <div className="mt-1 text-base text-gray-900">{salaryData.Section_Outlet}</div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-500">Month</label>
                    <div className="mt-1 text-base text-gray-900">{salaryData.Month}</div>
                  </div>
                </div>
              </div>

              <div>
                <h2 className="text-lg font-medium text-gray-900 mb-4">Personal Information</h2>
                <div className="space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-500">Gender</label>
                    <div className="mt-1 text-base text-gray-900">{salaryData.Gender}</div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-500">Date of Birth</label>
                    <div className="mt-1 text-base text-gray-900">{salaryData.DOB}</div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-500">Date of Joining</label>
                    <div className="mt-1 text-base text-gray-900">{salaryData.DOJ}</div>
                  </div>
                  {salaryData.DOL && (
                    <div>
                      <label className="block text-sm font-medium text-gray-500">Date of Leaving</label>
                      <div className="mt-1 text-base text-gray-900">{salaryData.DOL}</div>
                    </div>
                  )}
                </div>
              </div>
            </div>

            <div className="pt-6 border-t border-gray-200">
              <div className="mb-6">
                <h2 className="text-lg font-medium text-gray-900 mb-4">Salary Summary</h2>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  <div className="p-4 bg-gray-50 rounded-lg">
                    <div className="text-2xl font-semibold text-gray-900">
                      {formatCurrency(salaryData.Actual_Salary)}
                    </div>
                    <div className="text-sm text-gray-500">Actual Salary</div>
                  </div>
                  <div className="p-4 bg-gray-50 rounded-lg">
                    <div className="text-2xl font-semibold text-gray-900">
                      {formatCurrency(salaryData.Monthly_Gross_Salary)}
                    </div>
                    <div className="text-sm text-gray-500">Monthly Gross Salary</div>
                  </div>
                  <div className="p-4 bg-gray-50 rounded-lg">
                    <div className="text-2xl font-semibold text-gray-900">
                      {formatCurrency(salaryData.Monthly_Net_Salary)}
                    </div>
                    <div className="text-sm text-gray-500">Monthly Net Salary</div>
                  </div>
                </div>
              </div>
              
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <h3 className="text-lg font-medium text-gray-900 mb-4">Earnings</h3>
                <div className="space-y-4">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-500">Basic Salary</span>
                    <span className="text-gray-900 font-medium">{formatCurrency(salaryData.Basic)}</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-500">HRA</span>
                    <span className="text-gray-900 font-medium">{formatCurrency(salaryData.HRA)}</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-500">Conveyance</span>
                    <span className="text-gray-900 font-medium">{formatCurrency(salaryData.CONV)}</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-500">DA</span>
                    <span className="text-gray-900 font-medium">{formatCurrency(salaryData.DA)}</span>
                  </div>
                  <div className="flex justify-between items-center pt-2 border-t border-gray-200">
                    <span className="font-medium text-gray-900">Total Earnings</span>
                    <span className="font-medium text-gray-900">
                      {formatCurrency(Number(salaryData.Basic || 0) + Number(salaryData.HRA || 0) + Number(salaryData.CONV || 0) + Number(salaryData.DA || 0))}
                    </span>
                  </div>
                </div>
              </div>

              <div>
                <h3 className="text-lg font-medium text-gray-900 mb-4">Deductions</h3>
                <div className="space-y-4">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-500">Employee PF</span>
                    <span className="text-gray-900 font-medium">{formatCurrency(salaryData.Empee_PF)}</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-500">Employee ESIC</span>
                    <span className="text-gray-900 font-medium">{formatCurrency(salaryData.Empee_ESIC)}</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-500">Professional Tax</span>
                    <span className="text-gray-900 font-medium">{formatCurrency(salaryData.PT)}</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-500">TDS</span>
                    <span className="text-gray-900 font-medium">{formatCurrency(salaryData.TDS)}</span>
                  </div>
                  <div className="flex justify-between items-center pt-2 border-t border-gray-200">
                    <span className="font-medium text-gray-900">Total Deductions</span>
                    <span className="font-medium text-gray-900">
                      {formatCurrency(Number(salaryData.Empee_PF || 0) + Number(salaryData.Empee_ESIC || 0) + Number(salaryData.PT || 0) + Number(salaryData.TDS || 0))}
                    </span>
                  </div>
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 pt-6 border-t border-gray-200">
                <div>
                  <h3 className="text-lg font-medium text-gray-900 mb-4">Employer Contributions</h3>
                  <div className="space-y-4">
                    <div className="flex justify-between items-center">
                      <span className="text-gray-500">Employer PF</span>
                      <span className="text-gray-900 font-medium">{formatCurrency(salaryData.Emper_PF)}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-gray-500">Employer ESIC</span>
                      <span className="text-gray-900 font-medium">{formatCurrency(salaryData.Emper_ESIC)}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-gray-500">Statutory Bonus</span>
                      <span className="text-gray-900 font-medium">{formatCurrency(salaryData.Stat_Bonus)}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-gray-500">Gratuity</span>
                      <span className="text-gray-900 font-medium">{formatCurrency(salaryData.Grauity)}</span>
                    </div>
                  </div>
                </div>

                <div>
                  <h3 className="text-lg font-medium text-gray-900 mb-4">Additional Details</h3>
                  <div className="space-y-4">
                    <div className="flex justify-between items-center">
                      <span className="text-gray-500">Monthly CTC</span>
                      <span className="text-gray-900 font-medium">{formatCurrency(salaryData.Monthly_CTC)}</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-gray-500">Total Days</span>
                      <span className="text-gray-900 font-medium">{salaryData.Total_Days}</span>
                    </div>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
    </DashboardLayout>
  );
}