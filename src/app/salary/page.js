'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { MagnifyingGlassIcon, ArrowUpIcon, ArrowDownIcon } from '@heroicons/react/24/outline';
import DashboardLayout from '../components/layout/DashboardLayout';

export default function Salary() {
  const router = useRouter();
  const [salaryData, setSalaryData] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [sortConfig, setSortConfig] = useState({ key: null, direction: 'ascending' });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;

  useEffect(() => {
    fetchSalaryData();
  }, []);

  const fetchSalaryData = async () => {
    try {
      const response = await fetch('http://localhost:3001/api/salary-payments');
      if (!response.ok) throw new Error('Failed to fetch salary data');
      const data = await response.json();
      setSalaryData(data);
      setLoading(false);
    } catch (err) {
      setError(err.message);
      setLoading(false);
    }
  };

  const sortedData = [...salaryData].sort((a, b) => {
    if (!sortConfig.key) return 0;
    
    if (a[sortConfig.key] < b[sortConfig.key]) {
      return sortConfig.direction === 'ascending' ? -1 : 1;
    }
    if (a[sortConfig.key] > b[sortConfig.key]) {
      return sortConfig.direction === 'ascending' ? 1 : -1;
    }
    return 0;
  });

  const filteredData = sortedData.filter(item =>
    item.Employee_Name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    item.Emp_No.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const requestSort = (key) => {
    let direction = 'ascending';
    if (sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    }
    setSortConfig({ key, direction });
  };

  const formatCurrency = (amount) => {
    if (amount === null || amount === undefined || isNaN(amount)) return '₹0.00';
    return new Intl.NumberFormat('en-IN', {
      style: 'currency',
      currency: 'INR',
      minimumFractionDigits: 2
    }).format(amount);
  };

  // Calculate pagination
  const indexOfLastItem = currentPage * itemsPerPage;
  const indexOfFirstItem = indexOfLastItem - itemsPerPage;
  const currentItems = filteredData.slice(indexOfFirstItem, indexOfLastItem);
  const totalPages = Math.ceil(filteredData.length / itemsPerPage);

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-8">
          <div>
            <h1 className="text-3xl font-semibold text-gray-900">Salary Management</h1>
            <p className="mt-2 text-sm text-gray-600">Manage employee compensation and benefits</p>
          </div>
          <button 
            onClick={() => router.push('/salary/add')}
            className="px-4 py-2 text-sm font-medium text-white bg-gray-900 rounded-lg hover:bg-gray-800 flex items-center gap-2"
          >
            Add Salary
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
              <select className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900">
                <option>Department</option>
                {Array.from(new Set(salaryData.map(item => item.Department))).map(dept => (
                  <option key={dept}>{dept}</option>
                ))}
              </select>
              <select className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900">
                <option>Salary Range</option>
                <option>$0 - $5,000</option>
                <option>$5,000 - $10,000</option>
                <option>$10,000+</option>
              </select>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
            <div className="overflow-x-auto relative">
              <table className="min-w-full table-auto">
                <thead className="bg-gray-50">
                  <tr>
                    <th scope="col" className="pl-6 py-3 text-left">
                      <input type="checkbox" className="rounded border-gray-300 text-gray-900 focus:ring-gray-900" />
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider whitespace-nowrap">
                      Employee
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider whitespace-nowrap">
                      Basic Salary
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider whitespace-nowrap">
                      Allowances
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider whitespace-nowrap">
                      Deductions
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider whitespace-nowrap">
                      Net Salary
                    </th>
                    <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider whitespace-nowrap">
                      Month
                    </th>
                    <th scope="col" className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Actions
                    </th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {currentItems.map((item) => (
                    <tr key={item.id} className="hover:bg-gray-50">
                      <td className="pl-6 py-4 whitespace-nowrap">
                        <input type="checkbox" className="rounded border-gray-300 text-gray-900 focus:ring-gray-900" />
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="flex items-center">
                          <div className="h-10 w-10 flex-shrink-0">
                            <div className="h-10 w-10 rounded-full bg-gray-200 flex items-center justify-center">
                              <span className="text-sm font-medium text-gray-600">{item.Employee_Name.split(' ').map(n => n[0]).join('')}</span>
                            </div>
                          </div>
                          <div className="ml-4">
                            <div className="text-sm font-medium text-gray-900">{item.Employee_Name}</div>
                            <div className="text-sm text-gray-500">{item.Emp_No}</div>
                          </div>
                        </div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="text-sm font-medium text-gray-900">{formatCurrency(item.Basic)}</div>
                        <div className="text-xs text-gray-500">Monthly</div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="text-sm font-medium text-green-600">+{formatCurrency(item.HRA + item.CONV + item.DA)}</div>
                        <div className="text-xs text-gray-500">Benefits</div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="text-sm font-medium text-red-600">-{formatCurrency(item.Empee_PF + item.Empee_ESIC + item.PT + item.TDS)}</div>
                        <div className="text-xs text-gray-500">Tax & Others</div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <div className="text-sm font-medium text-gray-900">{formatCurrency(item.Monthly_Net_Salary)}</div>
                        <div className="text-xs text-gray-500">Net Pay</div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {item.Month}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-right text-sm font-medium space-x-2">
                        <button
                          onClick={() => router.push(`/salary/${item.id}/view`)}
                          className="text-gray-400 hover:text-gray-900"
                          title="View"
                        >
                          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-5 h-5">
                            <path strokeLinecap="round" strokeLinejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                            <path strokeLinecap="round" strokeLinejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                          </svg>
                        </button>
                        <button
                          onClick={() => router.push(`/salary/${item.id}/edit`)}
                          className="text-gray-400 hover:text-gray-900"
                          title="Edit"
                        >
                          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-5 h-5">
                            <path strokeLinecap="round" strokeLinejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                          </svg>
                        </button>
                        <button
                          onClick={() => {
                            if (confirm('Are you sure you want to delete this salary record?')) {
                              // Add delete functionality here
                              fetch(`http://localhost:3001/api/salary/${item.id}`, {
                                method: 'DELETE',
                              }).then(() => {
                                // Refresh the salary data
                                fetchSalaryData();
                              });
                            }
                          }}
                          className="text-gray-400 hover:text-red-600"
                          title="Delete"
                        >
                          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-5 h-5">
                            <path strokeLinecap="round" strokeLinejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                          </svg>
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            {totalPages > 1 && (
              <div className="px-6 py-4 flex items-center justify-between border-t border-gray-200">
                <div className="flex-1 flex justify-between sm:hidden">
                  <button
                    onClick={() => handlePageChange(currentPage - 1)}
                    disabled={currentPage === 1}
                    className="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    Previous
                  </button>
                  <button
                    onClick={() => handlePageChange(currentPage + 1)}
                    disabled={currentPage === totalPages}
                    className="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    Next
                  </button>
                </div>
                <div className="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
                  <div>
                    <p className="text-sm text-gray-700">
                      Showing <span className="font-medium">{indexOfFirstItem + 1}</span> to{' '}
                      <span className="font-medium">
                        {Math.min(indexOfLastItem, filteredData.length)}
                      </span>{' '}
                      of <span className="font-medium">{filteredData.length}</span> results
                    </p>
                  </div>
                  <div>
                    <nav className="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                      <button
                        onClick={() => handlePageChange(1)}
                        disabled={currentPage === 1}
                        className="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        <span className="sr-only">First Page</span>
                        <ArrowUpIcon className="h-5 w-5 rotate-90" />
                        <ArrowUpIcon className="h-5 w-5 rotate-90 -ml-1" />
                      </button>
                      <button
                        onClick={() => handlePageChange(currentPage - 1)}
                        disabled={currentPage === 1}
                        className="relative inline-flex items-center px-2 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        <span className="sr-only">Previous</span>
                        <ArrowUpIcon className="h-5 w-5 rotate-90" />
                      </button>
                      {[...Array(totalPages)].map((_, index) => {
                        const pageNumber = index + 1;
                        // Show first page, last page, current page, and pages around current page
                        const shouldShowPage = pageNumber === 1 ||
                          pageNumber === totalPages ||
                          (pageNumber >= currentPage - 2 && pageNumber <= currentPage + 2) ||
                          (currentPage <= 3 && pageNumber <= 5) ||
                          (currentPage >= totalPages - 2 && pageNumber >= totalPages - 4);
                      
                        if (!shouldShowPage) {
                          if (pageNumber === currentPage - 3 || pageNumber === currentPage + 3) {
                            return (
                              <span key={pageNumber} className="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700">
                                ...
                              </span>
                            );
                          }
                          return null;
                        }
                      
                        return (
                          <button
                            key={pageNumber}
                            onClick={() => handlePageChange(pageNumber)}
                            className={`relative inline-flex items-center px-4 py-2 border text-sm font-medium ${currentPage === pageNumber
                              ? 'z-10 bg-gray-900 border-gray-900 text-white'
                              : 'border-gray-300 bg-white text-gray-500 hover:bg-gray-50'
                              }`}
                          >
                            {pageNumber}
                          </button>
                        );
                      })}
                      <button
                        onClick={() => handlePageChange(currentPage + 1)}
                        disabled={currentPage === totalPages}
                        className="relative inline-flex items-center px-2 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        <span className="sr-only">Next</span>
                        <ArrowDownIcon className="h-5 w-5 rotate-90" />
                      </button>
                      <button
                        onClick={() => handlePageChange(totalPages)}
                        disabled={currentPage === totalPages}
                        className="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        <span className="sr-only">Last Page</span>
                        <ArrowDownIcon className="h-5 w-5 rotate-90" />
                        <ArrowDownIcon className="h-5 w-5 rotate-90 -ml-1" />
                      </button>
                    </nav>
                  </div>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}