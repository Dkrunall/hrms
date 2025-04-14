'use client';

import { useState, useEffect } from 'react';
import { useParams } from 'next/navigation';
import { ArrowLeftIcon, BriefcaseIcon, CalendarIcon, MapPinIcon, UserCircleIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import DashboardLayout from '../../components/layout/DashboardLayout';

export default function EmployeeView() {
  const { id } = useParams();
  const [employee, setEmployee] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchEmployeeDetails();
  }, [id]);

  const fetchEmployeeDetails = async () => {
    try {
      const response = await fetch(`http://localhost:3000/api/employees/${id}`);
      if (!response.ok) {
        throw new Error('Failed to fetch employee details');
      }
      const data = await response.json();
      setEmployee(data);
      setError(null);
    } catch (err) {
      setError('Error loading employee details: ' + err.message);
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateString) => {
    if (!dateString) return 'N/A';
    return new Date(dateString).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  };

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="mb-8">
          <div className="flex items-center gap-4">
            <Link
              href="/employees"
              className="p-2 rounded-lg hover:bg-gray-100 transition-colors"
            >
              <ArrowLeftIcon className="h-6 w-6 text-gray-500" />
            </Link>
            <h1 className="text-3xl font-semibold text-gray-900">Employee Details</h1>
          </div>
        </div>

        {loading ? (
          <div className="flex items-center justify-center p-8">
            <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-gray-900"></div>
          </div>
        ) : error ? (
          <div className="p-8 text-center text-red-500">{error}</div>
        ) : employee ? (
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            {/* Main Info Card */}
            <div className="lg:col-span-2 bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
              <div className="p-6">
                <div className="flex items-center gap-6">
                  <div className="h-24 w-24 rounded-full bg-gradient-to-br from-blue-500 via-purple-500 to-pink-500 flex items-center justify-center shadow-lg">
                    <span className="text-2xl font-bold text-white">
                      {employee.Employee_Name?.split(' ').map(n => n[0]).join('')}
                    </span>
                  </div>
                  <div>
                    <h2 className="text-2xl font-bold text-gray-900">{employee.Employee_Name}</h2>
                    <p className="text-lg text-gray-600">{employee.Designation}</p>
                    <p className="text-sm text-gray-500">Employee ID: {employee.Emp_No}</p>
                  </div>
                </div>

                <div className="mt-8 grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="flex items-start gap-3">
                    <BriefcaseIcon className="h-6 w-6 text-gray-400" />
                    <div>
                      <p className="text-sm font-medium text-gray-500">Department</p>
                      <p className="text-base text-gray-900">{employee.Department}</p>
                    </div>
                  </div>
                  <div className="flex items-start gap-3">
                    <MapPinIcon className="h-6 w-6 text-gray-400" />
                    <div>
                      <p className="text-sm font-medium text-gray-500">Section/Outlet</p>
                      <p className="text-base text-gray-900">{employee.Section_Outlet || 'N/A'}</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* Timeline Card */}
            <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
              <div className="p-6">
                <h3 className="text-lg font-semibold text-gray-900 mb-4">Employment Timeline</h3>
                <div className="space-y-6">
                  <div className="flex items-start gap-3">
                    <CalendarIcon className="h-6 w-6 text-emerald-500" />
                    <div>
                      <p className="text-sm font-medium text-gray-500">Date of Joining</p>
                      <p className="text-base text-gray-900">{formatDate(employee.DOJ)}</p>
                    </div>
                  </div>
                  <div className="flex items-start gap-3">
                    <UserCircleIcon className="h-6 w-6 text-blue-500" />
                    <div>
                      <p className="text-sm font-medium text-gray-500">Date of Birth</p>
                      <p className="text-base text-gray-900">{formatDate(employee.DOB)}</p>
                    </div>
                  </div>
                  {employee.DOL && (
                    <div className="flex items-start gap-3">
                      <CalendarIcon className="h-6 w-6 text-red-500" />
                      <div>
                        <p className="text-sm font-medium text-gray-500">Date of Leaving</p>
                        <p className="text-base text-gray-900">{formatDate(employee.DOL)}</p>
                      </div>
                    </div>
                  )}
                </div>
              </div>
            </div>

            {/* Additional Details */}
            <div className="lg:col-span-3 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
              {/* Attendance Summary Card */}
              <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div className="p-6">
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">Attendance Summary</h3>
                  <div className="space-y-4">
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-gray-500">Present Days</span>
                      <span className="text-sm font-medium text-gray-900">22</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-gray-500">Absent Days</span>
                      <span className="text-sm font-medium text-gray-900">3</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-gray-500">Late Arrivals</span>
                      <span className="text-sm font-medium text-gray-900">1</span>
                    </div>
                  </div>
                </div>
              </div>

              {/* Leave Balance Card */}
              <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div className="p-6">
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">Leave Balance</h3>
                  <div className="space-y-4">
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-gray-500">Annual Leave</span>
                      <span className="text-sm font-medium text-gray-900">12 days</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-gray-500">Sick Leave</span>
                      <span className="text-sm font-medium text-gray-900">7 days</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-gray-500">Casual Leave</span>
                      <span className="text-sm font-medium text-gray-900">5 days</span>
                    </div>
                  </div>
                </div>
              </div>

              {/* Performance Card */}
              <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div className="p-6">
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">Performance Overview</h3>
                  <div className="space-y-4">
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-gray-500">Last Review</span>
                      <span className="text-sm font-medium text-gray-900">Excellent</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-gray-500">Projects Completed</span>
                      <span className="text-sm font-medium text-gray-900">8</span>
                    </div>
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-gray-500">Goals Achieved</span>
                      <span className="text-sm font-medium text-gray-900">92%</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        ) : (
          <div className="p-8 text-center text-gray-500">No employee data found</div>
        )}
      </div>
    </DashboardLayout>
  );
}