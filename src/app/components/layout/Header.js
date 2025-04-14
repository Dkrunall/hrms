'use client';

import { useState, useRef, useEffect } from 'react';
import { MagnifyingGlassIcon, BellIcon, UserCircleIcon, Cog6ToothIcon, ArrowRightOnRectangleIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import Image from 'next/image';

export default function Header() {
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const [isNotificationsOpen, setIsNotificationsOpen] = useState(false);
  const dropdownRef = useRef(null);
  const notificationsRef = useRef(null);
  const [notifications] = useState([
    { id: 1, text: 'New leave request from John Doe', time: '5m ago', type: 'leave' },
    { id: 2, text: 'Payroll processing completed', time: '1h ago', type: 'payroll' },
    { id: 3, text: 'New employee onboarding', time: '2h ago', type: 'employee' },
  ]);

  useEffect(() => {
    function handleClickOutside(event) {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setIsDropdownOpen(false);
      }
      if (notificationsRef.current && !notificationsRef.current.contains(event.target)) {
        setIsNotificationsOpen(false);
      }
    }

    function handleEscapeKey(event) {
      if (event.key === 'Escape') {
        setIsDropdownOpen(false);
        setIsNotificationsOpen(false);
      }
    }

    document.addEventListener('mousedown', handleClickOutside);
    document.addEventListener('keydown', handleEscapeKey);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
      document.removeEventListener('keydown', handleEscapeKey);
    };
  }, []);

  return (
    <header className="sticky top-0 z-50 bg-white/70 backdrop-blur-2xl shadow-lg border-b border-white/20">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Search Bar */}
          <div className="flex-1 max-w-lg">
            <div className="relative group">
              <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <MagnifyingGlassIcon className="h-5 w-5 text-gray-400 group-hover:text-purple-500 transition-colors duration-200" />
              </div>
              <input
                type="text"
                className="block w-full pl-10 pr-3 py-2 border-none rounded-full leading-5 bg-white/40 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:bg-white/90 hover:bg-white/60 transition-all duration-200 sm:text-sm shadow-sm"
                placeholder="Search anything..."
              />
            </div>
          </div>

          <div className="flex items-center space-x-4">
            {/* Notifications */}
            <div className="relative" ref={notificationsRef}>
              <button
                className="relative p-2.5 rounded-full text-gray-600 hover:text-purple-600 hover:bg-white/60 focus:outline-none focus:ring-2 focus:ring-purple-500 transition-all duration-200"
                onClick={() => setIsNotificationsOpen(!isNotificationsOpen)}
                aria-expanded={isNotificationsOpen}
                aria-haspopup="true"
              >
                <span className="sr-only">View notifications</span>
                <BellIcon className="h-6 w-6" />
                <span className="absolute -top-0.5 -right-0.5 block h-3 w-3 rounded-full bg-gradient-to-r from-pink-500 to-purple-500 ring-2 ring-white animate-pulse" />
              </button>

              <div
                className={`absolute right-0 mt-2 w-80 rounded-lg shadow-xl py-1.5 bg-white/90 backdrop-blur-2xl border border-white/20 focus:outline-none z-20 transform origin-top-right transition-all duration-200 ${isNotificationsOpen ? 'scale-100 opacity-100' : 'scale-95 opacity-0 pointer-events-none'}`}
                role="menu"
                aria-orientation="vertical"
              >
                <div className="px-4 py-2 border-b border-gray-100/20">
                  <h3 className="text-sm font-semibold text-gray-900">Notifications</h3>
                </div>
                <div className="max-h-96 overflow-y-auto scrollbar-thin scrollbar-thumb-gray-300 scrollbar-track-transparent">
                  {notifications.map((notification) => (
                    <div
                      key={notification.id}
                      className="px-4 py-3 hover:bg-white/60 transition-colors cursor-pointer group"
                      role="menuitem"
                    >
                      <div className="flex items-start">
                        <div className="flex-shrink-0">
                          <div className={`h-8 w-8 rounded-full flex items-center justify-center transform transition-transform group-hover:scale-110 ${notification.type === 'leave' ? 'bg-blue-100' : notification.type === 'payroll' ? 'bg-green-100' : 'bg-purple-100'}`}>
                            <BellIcon className={`h-4 w-4 ${notification.type === 'leave' ? 'text-blue-600' : notification.type === 'payroll' ? 'text-green-600' : 'text-purple-600'}`} />
                          </div>
                        </div>
                        <div className="ml-3 w-0 flex-1">
                          <p className="text-sm text-gray-900 font-medium">{notification.text}</p>
                          <p className="mt-1 text-xs text-gray-500">{notification.time}</p>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
                <div className="px-4 py-2 border-t border-gray-100/20">
                  <Link
                    href="/notifications"
                    className="text-xs text-purple-600 hover:text-purple-800 font-medium hover:underline transition-colors"
                  >
                    View all notifications
                  </Link>
                </div>
              </div>
            </div>

            {/* Profile dropdown */}
            <div className="relative" ref={dropdownRef}>
              <button
                className="flex items-center space-x-3 p-1.5 rounded-full hover:bg-white/60 focus:outline-none focus:ring-2 focus:ring-purple-500 transition-all duration-200"
                onClick={() => setIsDropdownOpen(!isDropdownOpen)}
                aria-expanded={isDropdownOpen}
                aria-haspopup="true"
              >
                <div className="h-8 w-8 rounded-full bg-gradient-to-br from-blue-500 via-purple-500 to-pink-500 flex items-center justify-center shadow-lg ring-2 ring-white/20 transform transition-transform hover:scale-110">
                  <span className="text-sm font-medium text-white">JD</span>
                </div>
                <div className="text-sm font-medium text-gray-700 hover:text-purple-600 transition-colors">John Doe</div>
              </button>

              <div
                className={`absolute right-0 mt-2 w-56 rounded-lg shadow-xl py-1.5 bg-white/90 backdrop-blur-2xl border border-white/20 focus:outline-none divide-y divide-gray-100/20 z-20 transform origin-top-right transition-all duration-200 ${isDropdownOpen ? 'scale-100 opacity-100' : 'scale-95 opacity-0 pointer-events-none'}`}
                role="menu"
                aria-orientation="vertical"
              >
                <div className="px-4 py-3 border-b border-gray-100/20">
                  <p className="text-sm text-gray-900 font-semibold">John Doe</p>
                  <p className="text-xs text-gray-500 mt-0.5">john.doe@example.com</p>
                </div>
                <div className="py-1" role="none">
                  <Link
                    href="/profile"
                    className="flex items-center px-4 py-2.5 text-sm text-gray-700 hover:bg-white/60 hover:text-purple-600 transition-colors group"
                    role="menuitem"
                  >
                    <UserCircleIcon className="h-5 w-5 mr-3 text-gray-400 group-hover:text-purple-600 transition-colors" />
                    Your Profile
                  </Link>
                  <Link
                    href="/settings"
                    className="flex items-center px-4 py-2.5 text-sm text-gray-700 hover:bg-white/60 hover:text-purple-600 transition-colors group"
                    role="menuitem"
                  >
                    <Cog6ToothIcon className="h-5 w-5 mr-3 text-gray-400 group-hover:text-purple-600 transition-colors" />
                    Settings
                  </Link>
                </div>
                <div className="py-1" role="none">
                  <Link
                    href="/auth/signout"
                    className="flex items-center px-4 py-2.5 text-sm text-red-600 hover:bg-red-50 transition-colors group"
                    role="menuitem"
                  >
                    <ArrowRightOnRectangleIcon className="h-5 w-5 mr-3 text-red-500" />
                    Sign out
                  </Link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}