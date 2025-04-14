'use client';

import { usePathname } from 'next/navigation';
import Link from 'next/link';
import { 
  HomeIcon,
  UsersIcon,
  CurrencyDollarIcon,
  CalendarIcon,
  DocumentTextIcon,
  ChevronDoubleLeftIcon,
  ChevronDoubleRightIcon
} from '@heroicons/react/24/outline';

const menuItems = [
  { name: 'Dashboard', icon: HomeIcon, path: '/dashboard' },
  { name: 'Employees', icon: UsersIcon, path: '/employees' },
  { name: 'Salary', icon: CurrencyDollarIcon, path: '/salary' },
  { name: 'Leaves', icon: CalendarIcon, path: '/leaves' },
  { name: 'Payslip', icon: DocumentTextIcon, path: '/payslip' },
];

export default function Sidebar({ collapsed, onCollapse }) {
  const pathname = usePathname();

  return (
    <div className={`bg-gradient-to-b from-indigo-700 via-purple-700 to-pink-700 text-white transition-all duration-300 ease-in-out ${collapsed ? 'w-16' : 'w-64'} min-h-screen fixed left-0 top-0 shadow-xl z-50 border-r border-white/10`}>
      <div className="p-4 flex justify-between items-center border-b border-white/10 bg-black/20 backdrop-blur-sm">
        <h1 className={`font-bold text-xl transition-all duration-200 ${collapsed ? 'opacity-0 scale-0 w-0' : 'opacity-100 scale-100'} text-transparent bg-clip-text bg-gradient-to-r from-pink-300 to-purple-300 whitespace-nowrap overflow-hidden`}>
          HRMS
        </h1>
        <button
          onClick={() => onCollapse(!collapsed)}
          className="p-1.5 rounded-lg hover:bg-white/20 transition-all duration-200 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-white/20"
          aria-label={collapsed ? 'Expand sidebar' : 'Collapse sidebar'}
        >
          {collapsed ? (
            <ChevronDoubleRightIcon className="w-5 h-5 text-purple-200" />
          ) : (
            <ChevronDoubleLeftIcon className="w-5 h-5 text-purple-200" />
          )}
        </button>
      </div>

      <nav className="mt-6 px-2">
        {menuItems.map((item) => {
          const isActive = pathname === item.path;
          return (
            <Link
              key={item.name}
              href={item.path}
              className={`flex items-center px-4 py-3 my-1 rounded-lg transition-all duration-200 group relative overflow-hidden ${isActive
                ? 'bg-white/20 shadow-lg'
                : 'hover:bg-white/10 hover:shadow-md'
              }`}
            >
              <item.icon className={`w-6 h-6 ${isActive ? 'text-pink-300' : 'text-purple-200 group-hover:text-pink-300'} transition-colors duration-200`} />
              <span className={`ml-3 transition-all duration-200 ${collapsed ? 'opacity-0 translate-x-4 hidden' : 'opacity-100 translate-x-0'} font-medium whitespace-nowrap`}>
                {item.name}
              </span>
              {isActive && (
                <div className="absolute inset-0 bg-gradient-to-r from-pink-500/10 to-purple-500/10 pointer-events-none" />
              )}
            </Link>
          );
        })}
      </nav>
    </div>
  );
}