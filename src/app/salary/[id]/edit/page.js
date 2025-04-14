'use client';

import { useState, useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { ArrowLeftIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import DashboardLayout from '../../../components/layout/DashboardLayout';

export default function EditSalary() {
  const { id } = useParams();
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [successMessage, setSuccessMessage] = useState('');
  const [formData, setFormData] = useState({
    Emp_No: '',
    Basic: 0,
    HRA: 0,
    CONV: 0,
    DA: 0,
    Empee_PF: 0,
    Empee_ESIC: 0,
    PT: 0,
    TDS: 0,
    Month: '',
    Monthly_Net_Salary: 0
  });

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
      setFormData({
        ...data,
        Month: data.Month.slice(0, 7) // Format YYYY-MM
      });
      setError(null);
    } catch (err) {
      setError('Error loading salary details: ' + err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: name === 'Month' ? value : parseFloat(value) || 0
    }));
  };

  const calculateNetSalary = () => {
    const allowances = formData.HRA + formData.CONV + formData.DA;
    const deductions = formData.Empee_PF + formData.Empee_ESIC + formData.PT + formData.TDS;
    return formData.Basic + allowances - deductions;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const updatedData = {
        ...formData,
        Monthly_Net_Salary: calculateNetSalary()
      };

      const response = await fetch(`http://localhost:3001/api/salary/${id}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(updatedData),
      });

      if (!response.ok) {
        throw new Error('Failed to update salary record');
      }

      setSuccessMessage('Salary record updated successfully');
      setTimeout(() => {
        router.push('/salary');
      }, 2000);
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
          <div className="flex items-center gap-4">
            <Link
              href="/salary"
              className="p-2 rounded-lg hover:bg-gray-100 transition-colors"
            >
              <ArrowLeftIcon className="h-6 w-6 text-gray-500" />
            </Link>
            <h1 className="text-3xl font-semibold text-gray-900">Edit Salary Details</h1>
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
                  <label htmlFor="Emp_No" className="block text-sm font-medium text-gray-700">Employee Number</label>
                  <input
                    type="text"
                    name="Emp_No"
                    id="Emp_No"
                    value={formData.Emp_No}
                    readOnly
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 bg-gray-50"
                  />
                </div>

                <div>
                  <label htmlFor="Month" className="block text-sm font-medium text-gray-700">Month</label>
                  <input
                    type="month"
                    name="Month"
                    id="Month"
                    required
                    value={formData.Month}
                    onChange={handleChange}
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>

                <div>
                  <label htmlFor="Basic" className="block text-sm font-medium text-gray-700">Basic Salary</label>
                  <input
                    type="number"
                    name="Basic"
                    id="Basic"
                    required
                    min="0"
                    step="0.01"
                    value={formData.Basic}
                    onChange={handleChange}
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>

                <div>
                  <label htmlFor="HRA" className="block text-sm font-medium text-gray-700">HRA</label>
                  <input
                    type="number"
                    name="HRA"
                    id="HRA"
                    min="0"
                    step="0.01"
                    value={formData.HRA}
                    onChange={handleChange}
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>

                <div>
                  <label htmlFor="CONV" className="block text-sm font-medium text-gray-700">Conveyance</label>
                  <input
                    type="number"
                    name="CONV"
                    id="CONV"
                    min="0"
                    step="0.01"
                    value={formData.CONV}
                    onChange={handleChange}
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>

                <div>
                  <label htmlFor="DA" className="block text-sm font-medium text-gray-700">DA</label>
                  <input
                    type="number"
                    name="DA"
                    id="DA"
                    min="0"
                    step="0.01"
                    value={formData.DA}
                    onChange={handleChange}
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>

                <div>
                  <label htmlFor="Empee_PF" className="block text-sm font-medium text-gray-700">Employee PF</label>
                  <input
                    type="number"
                    name="Empee_PF"
                    id="Empee_PF"
                    min="0"
                    step="0.01"
                    value={formData.Empee_PF}
                    onChange={handleChange}
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>

                <div>
                  <label htmlFor="Empee_ESIC" className="block text-sm font-medium text-gray-700">Employee ESIC</label>
                  <input
                    type="number"
                    name="Empee_ESIC"
                    id="Empee_ESIC"
                    min="0"
                    step="0.01"
                    value={formData.Empee_ESIC}
                    onChange={handleChange}
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>

                <div>
                  <label htmlFor="PT" className="block text-sm font-medium text-gray-700">Professional Tax</label>
                  <input
                    type="number"
                    name="PT"
                    id="PT"
                    min="0"
                    step="0.01"
                    value={formData.PT}
                    onChange={handleChange}
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>

                <div>
                  <label htmlFor="TDS" className="block text-sm font-medium text-gray-700">TDS</label>
                  <input
                    type="number"
                    name="TDS"
                    id="TDS"
                    min="0"
                    step="0.01"
                    value={formData.TDS}
                    onChange={handleChange}
                    className="mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                  />
                </div>
              </div>

              <div className="flex justify-end gap-4">
                <button
                  type="button"
                  onClick={() => router.push('/salary')}
                  disabled={loading}
                  className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
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
                      <span>Saving...</span>
                    </>
                  ) : 'Update Salary Details'}
                </button>
              </div>
            </form>
          </div>
        )}
      </div>
    </DashboardLayout>
  );
}