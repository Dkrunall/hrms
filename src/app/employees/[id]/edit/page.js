'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { ArrowLeftIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import DashboardLayout from '../../../components/layout/DashboardLayout';

export default function EditEmployee() {
  const { id } = useParams();
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [successMessage, setSuccessMessage] = useState('');
  const [employee, setEmployee] = useState({
    Employee_Name: '',
    Emp_No: '',
    Designation: '',
    Department: '',
    Section_Outlet: '',
    DOB: '',
    DOJ: '',
    DOL: ''
  });

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

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const response = await fetch(`http://localhost:3000/api/employees/${id}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(employee),
      });

      if (!response.ok) {
        throw new Error('Failed to update employee');
      }

      setSuccessMessage('Employee updated successfully');
      setTimeout(() => {
        router.push(`/employees/${id}`);
      }, 2000);
    } catch (err) {
      setError('Error updating employee: ' + err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setEmployee(prev => ({
      ...prev,
      [name]: value
    }));
  };

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <div className="flex items-center gap-4">
            <Link
              href={`/employees/${id}`}
              className="p-2 rounded-lg hover:bg-gray-100 transition-colors"
            >
              <ArrowLeftIcon className="h-6 w-6 text-gray-500" />
            </Link>
            <h1 className="text-3xl font-semibold text-gray-900">Edit Employee</h1>
          </div>
        </div>

        {loading ? (
          <div className="flex items-center justify-center p-8">
            <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-gray-900"></div>
          </div>
        ) : error ? (
          <div className="p-4 text-center text-red-500 bg-red-50 rounded-lg">{error}</div>
        ) : (
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
            {successMessage && (
              <div className="p-4 bg-green-50 text-green-700 border-b border-green-100">
                {successMessage}
              </div>
            )}
            <form onSubmit={handleSubmit} className="p-6 space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Employee Name
                  </label>
                  <input
                    type="text"
                    name="Employee_Name"
                    value={employee.Employee_Name}
                    onChange={handleChange}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Employee Number
                  </label>
                  <input
                    type="text"
                    name="Emp_No"
                    value={employee.Emp_No}
                    onChange={handleChange}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Designation
                  </label>
                  <input
                    type="text"
                    name="Designation"
                    value={employee.Designation}
                    onChange={handleChange}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Department
                  </label>
                  <input
                    type="text"
                    name="Department"
                    value={employee.Department}
                    onChange={handleChange}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Section/Outlet
                  </label>
                  <input
                    type="text"
                    name="Section_Outlet"
                    value={employee.Section_Outlet}
                    onChange={handleChange}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Date of Birth
                  </label>
                  <input
                    type="date"
                    name="DOB"
                    value={employee.DOB ? employee.DOB.split('T')[0] : ''}
                    onChange={handleChange}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Date of Joining
                  </label>
                  <input
                    type="date"
                    name="DOJ"
                    value={employee.DOJ ? employee.DOJ.split('T')[0] : ''}
                    onChange={handleChange}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                    required
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Date of Leaving
                  </label>
                  <input
                    type="date"
                    name="DOL"
                    value={employee.DOL ? employee.DOL.split('T')[0] : ''}
                    onChange={handleChange}
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>
              </div>

              <div className="flex justify-end space-x-3 pt-6 border-t">
                <Link
                  href={`/employees/${id}`}
                  className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-900"
                >
                  Cancel
                </Link>
                <button
                  type="submit"
                  disabled={loading}
                  className="px-4 py-2 text-sm font-medium text-white bg-gray-900 rounded-lg hover:bg-gray-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-900 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {loading ? 'Saving...' : 'Save Changes'}
                </button>
              </div>
            </form>
          </div>
        )}
      </div>
    </DashboardLayout>
  );
}