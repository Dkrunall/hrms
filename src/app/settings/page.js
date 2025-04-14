'use client';

import { useState } from 'react';
import { BellIcon, KeyIcon, UserCircleIcon, SunIcon, ShieldCheckIcon } from '@heroicons/react/24/outline';
import DashboardLayout from '../components/layout/DashboardLayout';

export default function Settings() {
  const [activeTab, setActiveTab] = useState('account');
  const [notifications, setNotifications] = useState({
    email: true,
    push: false,
    monthly_report: true,
    leave_updates: true,
  });
  const [theme, setTheme] = useState('light');

  const tabs = [
    { id: 'account', name: 'Account', icon: UserCircleIcon },
    { id: 'notifications', name: 'Notifications', icon: BellIcon },
    { id: 'security', name: 'Security', icon: ShieldCheckIcon },
    { id: 'appearance', name: 'Appearance', icon: SunIcon },
  ];

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        <div className="max-w-4xl mx-auto">
          <div className="flex flex-col sm:flex-row gap-8">
            {/* Sidebar */}
            <nav className="w-full sm:w-64 flex-shrink-0">
              <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div className="p-2">
                  {tabs.map((tab) => (
                    <button
                      key={tab.id}
                      onClick={() => setActiveTab(tab.id)}
                      className={`w-full flex items-center gap-3 px-4 py-3 text-sm font-medium rounded-lg transition-colors ${activeTab === tab.id ? 'bg-gray-900 text-white' : 'text-gray-600 hover:bg-gray-50'}`}
                    >
                      <tab.icon className="h-5 w-5" />
                      {tab.name}
                    </button>
                  ))}
                </div>
              </div>
            </nav>

            {/* Content */}
            <div className="flex-1">
              {activeTab === 'account' && (
                <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                  <div className="p-6">
                    <h2 className="text-lg font-semibold text-gray-900 mb-4">Account Settings</h2>
                    <div className="space-y-6">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">Name</label>
                        <input
                          type="text"
                          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                          defaultValue="John Doe"
                        />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">Email</label>
                        <input
                          type="email"
                          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                          defaultValue="john.doe@example.com"
                        />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">Bio</label>
                        <textarea
                          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                          rows="4"
                          defaultValue="Passionate developer with expertise in full-stack development and cloud technologies."
                        />
                      </div>
                      <div className="pt-4">
                        <button className="px-4 py-2 bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors">
                          Save Changes
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              )}

              {activeTab === 'notifications' && (
                <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                  <div className="p-6">
                    <h2 className="text-lg font-semibold text-gray-900 mb-4">Notification Preferences</h2>
                    <div className="space-y-4">
                      <div className="flex items-center justify-between">
                        <div>
                          <h3 className="text-sm font-medium text-gray-900">Email Notifications</h3>
                          <p className="text-sm text-gray-500">Receive notifications via email</p>
                        </div>
                        <button
                          onClick={() => setNotifications({ ...notifications, email: !notifications.email })}
                          className={`relative inline-flex h-6 w-11 flex-shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none ${notifications.email ? 'bg-gray-900' : 'bg-gray-200'}`}
                        >
                          <span
                            className={`inline-block h-5 w-5 transform rounded-full bg-white transition duration-200 ease-in-out ${notifications.email ? 'translate-x-5' : 'translate-x-0'}`}
                          />
                        </button>
                      </div>
                      <div className="flex items-center justify-between">
                        <div>
                          <h3 className="text-sm font-medium text-gray-900">Push Notifications</h3>
                          <p className="text-sm text-gray-500">Receive push notifications</p>
                        </div>
                        <button
                          onClick={() => setNotifications({ ...notifications, push: !notifications.push })}
                          className={`relative inline-flex h-6 w-11 flex-shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none ${notifications.push ? 'bg-gray-900' : 'bg-gray-200'}`}
                        >
                          <span
                            className={`inline-block h-5 w-5 transform rounded-full bg-white transition duration-200 ease-in-out ${notifications.push ? 'translate-x-5' : 'translate-x-0'}`}
                          />
                        </button>
                      </div>
                      <div className="flex items-center justify-between">
                        <div>
                          <h3 className="text-sm font-medium text-gray-900">Monthly Report</h3>
                          <p className="text-sm text-gray-500">Receive monthly activity report</p>
                        </div>
                        <button
                          onClick={() => setNotifications({ ...notifications, monthly_report: !notifications.monthly_report })}
                          className={`relative inline-flex h-6 w-11 flex-shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none ${notifications.monthly_report ? 'bg-gray-900' : 'bg-gray-200'}`}
                        >
                          <span
                            className={`inline-block h-5 w-5 transform rounded-full bg-white transition duration-200 ease-in-out ${notifications.monthly_report ? 'translate-x-5' : 'translate-x-0'}`}
                          />
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              )}

              {activeTab === 'security' && (
                <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                  <div className="p-6">
                    <h2 className="text-lg font-semibold text-gray-900 mb-4">Security Settings</h2>
                    <div className="space-y-6">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">Current Password</label>
                        <input
                          type="password"
                          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                        />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">New Password</label>
                        <input
                          type="password"
                          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                        />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">Confirm New Password</label>
                        <input
                          type="password"
                          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-gray-900"
                        />
                      </div>
                      <div className="pt-4">
                        <button className="px-4 py-2 bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors">
                          Update Password
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              )}

              {activeTab === 'appearance' && (
                <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                  <div className="p-6">
                    <h2 className="text-lg font-semibold text-gray-900 mb-4">Appearance Settings</h2>
                    <div className="space-y-4">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-3">Theme</label>
                        <div className="grid grid-cols-2 gap-3">
                          <button
                            onClick={() => setTheme('light')}
                            className={`flex items-center justify-center px-4 py-3 border rounded-lg ${theme === 'light' ? 'border-gray-900 bg-gray-50' : 'border-gray-200 hover:border-gray-300'}`}
                          >
                            <SunIcon className="h-5 w-5 mr-2 text-gray-900" />
                            Light
                          </button>
                          <button
                            onClick={() => setTheme('dark')}
                            className={`flex items-center justify-center px-4 py-3 border rounded-lg ${theme === 'dark' ? 'border-gray-900 bg-gray-50' : 'border-gray-200 hover:border-gray-300'}`}
                          >
                            <KeyIcon className="h-5 w-5 mr-2 text-gray-900" />
                            Dark
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}