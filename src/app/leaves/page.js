'use client';

import { useState, useEffect } from 'react';
import { CalendarIcon, CheckIcon, XMarkIcon } from '@heroicons/react/24/outline';
import DashboardLayout from '../components/layout/DashboardLayout';

const leaveTypes = [
  'Annual Leave',
  'Sick Leave',
  'Personal Leave',
  'Maternity Leave',
  'Paternity Leave',
];

export default function Leaves() {
  const [showNewRequest, setShowNewRequest] = useState(false);
  const [filterStatus, setFilterStatus] = useState('all');
  const [leaveRequests, setLeaveRequests] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetchLeaveRequests();
  }, []);

  const fetchLeaveRequests = async () => {
    try {
      const response = await fetch('http://localhost:3001/api/leaves');
      if (!response.ok) {
        throw new Error('Failed to fetch leave requests');
      }
      const data = await response.json();
      setLeaveRequests(data);
      setLoading(false);
    } catch (err) {
      setError(err.message);
      setLoading(false);
    }
  };

  const handleLeaveAction = async (requestId, action) => {
    try {
      const response = await fetch(`http://localhost:3001/api/leaves/${requestId}/${action}`, {
        method: 'PUT',
      });
      if (!response.ok) {
        throw new Error(`Failed to ${action} leave request`);
      }
      fetchLeaveRequests(); // Refresh the list after action
    } catch (err) {
      setError(err.message);
    }
  };

  const filteredRequests = leaveRequests.filter(request => 
    filterStatus === 'all' ? true : request.status.toLowerCase() === filterStatus.toLowerCase()
  );

  const getStatusColor = (status) => {
    switch (status.toLowerCase()) {
      case 'approved':
        return 'bg-green-100 text-green-800';
      case 'rejected':
        return 'bg-red-100 text-red-800';
      default:
        return 'bg-yellow-100 text-yellow-800';
    }
  };

  const formatDate = (dateString) => {
    if (!dateString) return '';
    const date = new Date(dateString);
    const day = date.getDate();
    const month = date.toLocaleString('en-US', { month: 'long' });
    const year = date.getFullYear();
    const suffix = ['th', 'st', 'nd', 'rd'][(day % 10 > 3 ? 0 : day % 10) * (day < 10 || day > 20 ? 1 : 0)] || 'th';
    return `${day}${suffix} ${month} ${year}`;
  };

  if (loading) {
    return (
      <DashboardLayout>
        <div className="flex items-center justify-center h-64">
          <div className="text-gray-600">Loading...</div>
        </div>
      </DashboardLayout>
    );
  }

  if (error) {
    return (
      <DashboardLayout>
        <div className="flex items-center justify-center h-64">
          <div className="text-red-600">Error: {error}</div>
        </div>
      </DashboardLayout>
    );
  }

  return (
    <DashboardLayout>
      <div className="py-6">
        <div className="flex justify-between items-center">
          <h1 className="text-2xl font-semibold text-gray-900">Leave Management</h1>
          <button 
            onClick={() => setShowNewRequest(true)}
            className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors"
          >
            Request Leave
          </button>
        </div>

        <div className="mt-6 bg-white shadow rounded-lg overflow-hidden">
          <div className="p-4 border-b border-gray-200">
            <div className="flex space-x-4">
              <button 
                onClick={() => setFilterStatus('all')}
                className={`px-3 py-1 rounded-full text-sm font-medium ${filterStatus === 'all' ? 'bg-blue-100 text-blue-800' : 'text-gray-600 hover:bg-gray-100'}`}
              >
                All
              </button>
              <button 
                onClick={() => setFilterStatus('pending')}
                className={`px-3 py-1 rounded-full text-sm font-medium ${filterStatus === 'pending' ? 'bg-yellow-100 text-yellow-800' : 'text-gray-600 hover:bg-gray-100'}`}
              >
                Pending
              </button>
              <button 
                onClick={() => setFilterStatus('approved')}
                className={`px-3 py-1 rounded-full text-sm font-medium ${filterStatus === 'approved' ? 'bg-green-100 text-green-800' : 'text-gray-600 hover:bg-gray-100'}`}
              >
                Approved
              </button>
              <button 
                onClick={() => setFilterStatus('rejected')}
                className={`px-3 py-1 rounded-full text-sm font-medium ${filterStatus === 'rejected' ? 'bg-red-100 text-red-800' : 'text-gray-600 hover:bg-gray-100'}`}
              >
                Rejected
              </button>
            </div>
          </div>

          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Employee
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Leave Type
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Duration
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Status
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Reason
                  </th>
                  <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Actions
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {filteredRequests.map((request) => (
                  <tr key={request.id} className="hover:bg-gray-50">
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                      {request.Employee_Name}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {request.leave_type}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {formatDate(request.start_date)} to {formatDate(request.end_date)}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`px-2 inline-flex text-xs leading-5 font-semibold rounded-full ${getStatusColor(request.status)}`}>
                        {request.status}
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {request.reason}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                      <div className="flex justify-end space-x-2">
                        {request.status.toLowerCase() === 'pending' && (
                          <>
                            <button
                              onClick={() => handleLeaveAction(request.id, 'approve')}
                              className="p-1.5 rounded-lg text-green-600 hover:text-white hover:bg-green-600 transition-colors relative group"
                              title="Approve"
                            >
                              <CheckIcon className="h-5 w-5" />
                              <span className="absolute hidden group-hover:block bg-gray-800 text-white text-xs py-1 px-2 rounded -top-8 -left-1/2 transform -translate-x-1/4 whitespace-nowrap">
                                Approve
                              </span>
                            </button>
                            <button
                              onClick={() => handleLeaveAction(request.id, 'reject')}
                              className="p-1.5 rounded-lg text-red-600 hover:text-white hover:bg-red-600 transition-colors relative group"
                              title="Reject"
                            >
                              <XMarkIcon className="h-5 w-5" />
                              <span className="absolute hidden group-hover:block bg-gray-800 text-white text-xs py-1 px-2 rounded -top-8 -left-1/2 transform -translate-x-1/4 whitespace-nowrap">
                                Reject
                              </span>
                            </button>
                          </>
                        )}
                        {request.status === 'pending' && (
                          <>
                            <button 
                              onClick={() => handleLeaveAction(request.id, 'approve')}
                              className="p-1.5 rounded-lg text-green-600 hover:text-white hover:bg-green-600 transition-colors relative group"
                              title="Approve Leave"
                            >
                              <CheckIcon className="h-5 w-5" />
                              <span className="absolute hidden group-hover:block bg-gray-800 text-white text-xs py-1 px-2 rounded -top-8 -left-1/2 transform -translate-x-1/4 whitespace-nowrap">
                                Approve Leave
                              </span>
                            </button>
                            <button 
                              onClick={() => handleLeaveAction(request.id, 'reject')}
                              className="p-1.5 rounded-lg text-red-600 hover:text-white hover:bg-red-600 transition-colors relative group"
                              title="Reject Leave"
                            >
                              <XMarkIcon className="h-5 w-5" />
                              <span className="absolute hidden group-hover:block bg-gray-800 text-white text-xs py-1 px-2 rounded -top-8 -left-1/2 transform -translate-x-1/4 whitespace-nowrap">
                                Reject Leave
                              </span>
                            </button>
                          </>
                        )}
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        {showNewRequest && (
          <div className="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">
            <div className="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
              <div className="mt-3">
                <h3 className="text-lg font-medium leading-6 text-gray-900">New Leave Request</h3>
                <div className="mt-2 space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700">Leave Type</label>
                    <select className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                      {leaveTypes.map((type) => (
                        <option key={type} value={type}>{type}</option>
                      ))}
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700">Start Date</label>
                    <input type="date" className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700">End Date</label>
                    <input type="date" className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700">Reason</label>
                    <textarea className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500" rows="3"></textarea>
                  </div>
                </div>
                <div className="mt-4 flex justify-end space-x-3">
                  <button
                    onClick={() => setShowNewRequest(false)}
                    className="bg-white px-4 py-2 rounded-md text-gray-600 hover:bg-gray-50 border border-gray-300"
                  >
                    Cancel
                  </button>
                  <button className="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">
                    Submit Request
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </DashboardLayout>
  );
}