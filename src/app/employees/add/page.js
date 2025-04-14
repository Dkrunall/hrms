'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import DashboardLayout from '../../components/layout/DashboardLayout';

export default function AddEmployee() {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [formData, setFormData] = useState({
    Emp_No: '',
    Employee_Name: '',
    Designation: '',
    Section_Outlet: '',
    Department: '',
    DOB: '',
    DOJ: '',
    DOL: ''
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError('');

    try {
      const response = await fetch('http://localhost:3000/api/employees', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      if (!response.ok) {
        throw new Error('Failed to create employee');
      }

      router.push('/employees');
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <h1 className="text-3xl font-semibold text-gray-900">Add New Employee</h1>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
          {error && (
            <div className="mb-4 p-4 bg-red-50 border border-red-200 text-red-600 rounded-lg">
              {error}
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label htmlFor="Emp_No" className="block text-sm font-medium text-gray-700">Employee Number</label>
                <input
                  type="text"
                  name="Emp_No"
                  id="Emp_No"
                  value={formData.Emp_No}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                />
              </div>

              <div>
                <label htmlFor="Employee_Name" className="block text-sm font-medium text-gray-700">Employee Name*</label>
                <input
                  type="text"
                  name="Employee_Name"
                  id="Employee_Name"
                  required
                  value={formData.Employee_Name}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                />
              </div>

              <div>
                <label htmlFor="Designation" className="block text-sm font-medium text-gray-700">Designation</label>
                <input
                  type="text"
                  name="Designation"
                  id="Designation"
                  value={formData.Designation}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                />
              </div>

              <div>
                <label htmlFor="Section_Outlet" className="block text-sm font-medium text-gray-700">Section/Outlet</label>
                <input
                  type="text"
                  name="Section_Outlet"
                  id="Section_Outlet"
                  value={formData.Section_Outlet}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                />
              </div>

              <div>
                <label htmlFor="Department" className="block text-sm font-medium text-gray-700">Department*</label>
                <input
                  type="text"
                  name="Department"
                  id="Department"
                  required
                  value={formData.Department}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                />
              </div>

              <div>
                <label htmlFor="DOB" className="block text-sm font-medium text-gray-700">Date of Birth</label>
                <input
                  type="date"
                  name="DOB"
                  id="DOB"
                  value={formData.DOB}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                />
              </div>

              <div>
                <label htmlFor="DOJ" className="block text-sm font-medium text-gray-700">Date of Joining</label>
                <input
                  type="date"
                  name="DOJ"
                  id="DOJ"
                  value={formData.DOJ}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                />
              </div>

              <div>
                <label htmlFor="DOL" className="block text-sm font-medium text-gray-700">Date of Leaving</label>
                <input
                  type="date"
                  name="DOL"
                  id="DOL"
                  value={formData.DOL}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                />
              </div>
            </div>

            <div className="flex justify-end gap-4">
              <button
                type="button"
                onClick={() => router.push('/employees')}
                className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50"
              >
                Cancel
              </button>
              <button
                type="submit"
                disabled={loading}
                className="px-4 py-2 text-sm font-medium text-white bg-gray-900 rounded-lg hover:bg-gray-800 disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
              >
                {loading ? (
                  <>
                    <div className="animate-spin rounded-full h-4 w-4 border-t-2 border-b-2 border-white"></div>
                    Saving...
                  </>
                ) : 'Save Employee'}
              </button>
            </div>
          </form>
        </div>
      </div>
    </DashboardLayout>
  );
}