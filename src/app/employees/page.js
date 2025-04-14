'use client';

import { useState, useEffect } from 'react';
import { MagnifyingGlassIcon, PencilIcon, TrashIcon, PlusIcon, AdjustmentsHorizontalIcon, ChevronLeftIcon, ChevronRightIcon, BuildingOfficeIcon, BuildingStorefrontIcon } from '@heroicons/react/24/outline';
import DashboardLayout from '../components/layout/DashboardLayout';
import Link from 'next/link';

export default function Employees() {
  const [employees, setEmployees] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchTerm, setSearchTerm] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage] = useState(10);
  const [deleteConfirmation, setDeleteConfirmation] = useState({ show: false, employeeId: null });
  const [successMessage, setSuccessMessage] = useState('');

  useEffect(() => {
    fetchEmployees();
  }, []);

  const fetchEmployees = async () => {
    try {
      const response = await fetch('http://localhost:3000/api/employees');
      if (!response.ok) {
        throw new Error('Failed to fetch employees');
      }
      const data = await response.json();
      setEmployees(data);
      setError(null);
    } catch (err) {
      setError('Error loading employees: ' + err.message);
    } finally {
      setLoading(false);
    }
  };

  const filteredEmployees = employees.filter(employee =>
    (employee.Employee_Name?.toLowerCase() || '').includes(searchTerm.toLowerCase()) ||
    (employee.Department?.toLowerCase() || '').includes(searchTerm.toLowerCase()) ||
    (employee.Designation?.toLowerCase() || '').includes(searchTerm.toLowerCase())
  );

  // Get current employees for pagination
  const indexOfLastEmployee = currentPage * itemsPerPage;
  const indexOfFirstEmployee = indexOfLastEmployee - itemsPerPage;
  const currentEmployees = filteredEmployees.slice(indexOfFirstEmployee, indexOfLastEmployee);

  // Change page
  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  // Calculate total pages
  const totalPages = Math.ceil(filteredEmployees.length / itemsPerPage);

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-8">
          <div>
            <h1 className="text-3xl font-semibold text-gray-900">People</h1>
            <div className="mt-2 flex items-center gap-4">
              <div className="flex items-center gap-2">
                <span className="text-sm font-medium text-gray-500">Interviews</span>
                <span className="px-2 py-1 text-xs font-semibold bg-gray-900 text-white rounded-full">25%</span>
              </div>
              <div className="flex items-center gap-2">
                <span className="text-sm font-medium text-gray-500">Hired</span>
                <span className="px-2 py-1 text-xs font-semibold bg-yellow-400 text-yellow-900 rounded-full">51%</span>
              </div>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <button className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50">
              <AdjustmentsHorizontalIcon className="h-5 w-5" />
            </button>
            <Link href="/employees/add" className="px-4 py-2 text-sm font-medium text-white bg-gray-900 rounded-lg hover:bg-gray-800 flex items-center gap-2">
              <PlusIcon className="h-5 w-5" />
              Add Employee
            </Link>
          </div>
        </div>

        <div className="mt-6">
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 mb-6">
            <div className="flex flex-wrap gap-4 items-center">
              <div className="flex-1 min-w-[200px]">
                <div className="relative">
                  <MagnifyingGlassIcon className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-400" />
                  <input
                    type="text"
                    placeholder="Search..."
                    className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                  />
                </div>
              </div>
              <select className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900">
                <option>Department</option>
                <option>Engineering</option>
                <option>HR</option>
                <option>Sales</option>
              </select>
              <select className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900">
                <option>Status</option>
                <option>Active</option>
                <option>Inactive</option>
              </select>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
            <div className="overflow-x-auto">
            {loading ? (
              <div className="flex items-center justify-center p-8">
                <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-gray-900"></div>
              </div>
            ) : error ? (
              <div className="p-8 text-center text-red-500">{error}</div>
            ) : (
              <>
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th scope="col" className="pl-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        <input type="checkbox" className="rounded border-gray-300 text-gray-900 focus:ring-gray-900" />
                      </th>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Employee No</th>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Designation</th>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Section/Outlet</th>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Department</th>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {currentEmployees.map((employee) => (
                      <tr key={employee.id} className="hover:bg-gray-50 transition-colors duration-200">
                        <td className="pl-6 py-4 whitespace-nowrap">
                          <input type="checkbox" className="rounded border-gray-300 text-gray-900 focus:ring-gray-900" />
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{employee.Employee_Name}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{employee.Emp_No}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{employee.Designation}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{employee.Section_Outlet}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{employee.Department}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                          <div className="flex items-center gap-3">
                            <Link
                              href={`/employees/${employee.id}`}
                              className="text-blue-600 hover:text-blue-800 transition-colors duration-200 group relative"
                              title="View Details"
                            >
                              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-5 h-5">
                                <path strokeLinecap="round" strokeLinejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                                <path strokeLinecap="round" strokeLinejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                              </svg>
                              <span className="absolute -top-10 left-1/2 -translate-x-1/2 bg-gray-800 text-white text-xs px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity duration-200">View</span>
                            </Link>
                            <Link
                              href={`/employees/${employee.id}/edit`}
                              className="text-yellow-600 hover:text-yellow-800 transition-colors duration-200 group relative"
                              title="Edit Employee"
                            >
                              <PencilIcon className="h-5 w-5" />
                              <span className="absolute -top-10 left-1/2 -translate-x-1/2 bg-gray-800 text-white text-xs px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity duration-200">Edit</span>
                            </Link>
                            <button
                              onClick={() => setDeleteConfirmation({ show: true, employeeId: employee.id })}
                              className="text-red-600 hover:text-red-800 transition-colors duration-200 group relative"
                              title="Delete Employee"
                            >
                              <TrashIcon className="h-5 w-5 transition-transform duration-200 group-hover:scale-110" />
                              <span className="absolute -top-10 left-1/2 -translate-x-1/2 bg-gray-800 text-white text-xs px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-all duration-200 shadow-lg">Delete</span>
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
                
                {/* Pagination */}
                <div className="px-6 py-4 flex items-center justify-between border-t border-gray-200">
                  <div className="flex-1 flex justify-between sm:hidden">
                    <button
                      onClick={() => paginate(currentPage - 1)}
                      disabled={currentPage === 1}
                      className="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                      Previous
                    </button>
                    <button
                      onClick={() => paginate(currentPage + 1)}
                      disabled={currentPage === totalPages}
                      className="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                      Next
                    </button>
                  </div>
                  <div className="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
                    <div>
                      <p className="text-sm text-gray-700">
                        Showing <span className="font-medium">{indexOfFirstEmployee + 1}</span> to{' '}
                        <span className="font-medium">
                          {Math.min(indexOfLastEmployee, filteredEmployees.length)}
                        </span>{' '}
                        of <span className="font-medium">{filteredEmployees.length}</span> results
                      </p>
                    </div>
                    <div>
                      <nav className="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                        <button
                          onClick={() => paginate(1)}
                          disabled={currentPage === 1}
                          className="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                        >
                          <span className="sr-only">First Page</span>
                          <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                            <path fillRule="evenodd" d="M15.707 15.707a1 1 0 01-1.414 0L9 10.414l5.293-5.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 010 1.414zm-6 0a1 1 0 01-1.414 0L3 10.414 8.293 5.121a1 1 0 011.414 1.414L5.414 10l4.293 4.293a1 1 0 010 1.414z" clipRule="evenodd" />
                          </svg>
                        </button>
                        <button
                          onClick={() => paginate(currentPage - 1)}
                          disabled={currentPage === 1}
                          className="relative inline-flex items-center px-2 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                        >
                          <span className="sr-only">Previous</span>
                          <ChevronLeftIcon className="h-5 w-5" aria-hidden="true" />
                        </button>
                        {[...Array(totalPages)].map((_, index) => {
                          const pageNumber = index + 1;
                          // Show only current page, 4 pages before and after
                          if (
                            pageNumber === 1 ||
                            pageNumber === totalPages ||
                            (pageNumber >= currentPage - 4 && pageNumber <= currentPage + 4)
                          ) {
                            return (
                              <button
                                key={pageNumber}
                                onClick={() => paginate(pageNumber)}
                                className={`relative inline-flex items-center px-4 py-2 border text-sm font-medium ${currentPage === pageNumber
                                  ? 'z-10 bg-gray-900 border-gray-900 text-white'
                                  : 'bg-white border-gray-300 text-gray-500 hover:bg-gray-50'
                                }`}
                              >
                                {pageNumber}
                              </button>
                            );
                          }
                          // Show dots if there's a gap
                          if (
                            (pageNumber === currentPage - 5 && currentPage > 6) ||
                            (pageNumber === currentPage + 5 && currentPage < totalPages - 5)
                          ) {
                            return (
                              <span
                                key={pageNumber}
                                className="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700"
                              >
                                ...
                              </span>
                            );
                          }
                          return null;
                        })}
                        <button
                          onClick={() => paginate(currentPage + 1)}
                          disabled={currentPage === totalPages}
                          className="relative inline-flex items-center px-2 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                        >
                          <span className="sr-only">Next</span>
                          <ChevronRightIcon className="h-5 w-5" aria-hidden="true" />
                        </button>
                        <button
                          onClick={() => paginate(totalPages)}
                          disabled={currentPage === totalPages}
                          className="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                        >
                          <span className="sr-only">Last Page</span>
                          <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                            <path fillRule="evenodd" d="M4.293 15.707a1 1 0 001.414 0L11 10.414l-5.293-5.293a1 1 0 00-1.414 1.414L8.586 10l-4.293 4.293a1 1 0 000 1.414zm6 0a1 1 0 001.414 0L17 10.414l-5.293-5.293a1 1 0 00-1.414 1.414L14.586 10l-4.293 4.293a1 1 0 000 1.414z" clipRule="evenodd" />
                          </svg>
                        </button>
                      </nav>
                    </div>
                  </div>
                </div>
              </>
            )}
            </div>
          </div>

          {/* Delete Confirmation Modal */}
          {deleteConfirmation.show && (
            <div className="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50 flex items-center justify-center">
              <div className="relative bg-white rounded-lg shadow-xl max-w-md w-full mx-4">
                <div className="p-6">
                  <h3 className="text-lg font-medium text-gray-900 mb-4">Confirm Delete</h3>
                  <p className="text-sm text-gray-500 mb-6">Are you sure you want to delete this employee? This action cannot be undone.</p>
                  <div className="flex justify-end gap-3">
                    <button
                      onClick={() => setDeleteConfirmation({ show: false, employeeId: null })}
                      className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50"
                    >
                      Cancel
                    </button>
                    <button
                      onClick={async () => {
                        try {
                          const response = await fetch(`http://localhost:3000/api/employees/${deleteConfirmation.employeeId}`, {
                            method: 'DELETE',
                          });
                          
                          if (!response.ok) {
                            throw new Error('Failed to delete employee');
                          }
                          
                          setSuccessMessage('Employee deleted successfully');
                          fetchEmployees();
                          setDeleteConfirmation({ show: false, employeeId: null });
                          
                          // Clear success message after 3 seconds
                          setTimeout(() => setSuccessMessage(''), 3000);
                        } catch (err) {
                          setError('Error deleting employee: ' + err.message);
                        }
                      }}
                      className="px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-lg hover:bg-red-700"
                    >
                      Delete
                    </button>
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* Success Message Toast */}
          {successMessage && (
            <div className="fixed bottom-4 right-4 bg-green-50 text-green-800 px-6 py-3 rounded-lg shadow-lg border border-green-100 z-50">
              {successMessage}
            </div>
          )}
        </div>
      </div>
    </DashboardLayout>
  );
}