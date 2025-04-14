'use client';

import { useState } from 'react';
import { EnvelopeIcon, PhoneIcon, MapPinIcon, CameraIcon } from '@heroicons/react/24/outline';
import DashboardLayout from '../components/layout/DashboardLayout';

export default function Profile() {
  const [isEditing, setIsEditing] = useState(false);

  const userProfile = {
    name: 'John Doe',
    role: 'Senior Developer',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    location: 'New York, USA',
    department: 'Engineering',
    joinDate: 'January 15, 2023',
    bio: 'Passionate developer with expertise in full-stack development and cloud technologies. Always eager to learn and contribute to innovative projects.',
  };

  const activities = [
    {
      id: 1,
      type: 'leave',
      description: 'Requested annual leave',
      date: '2 days ago',
    },
    {
      id: 2,
      type: 'payslip',
      description: 'Downloaded November payslip',
      date: '1 week ago',
    },
    {
      id: 3,
      type: 'profile',
      description: 'Updated profile information',
      date: '2 weeks ago',
    },
  ];

  return (
    <DashboardLayout>
      <div className="py-6 px-4 sm:px-6 lg:px-8">
        <div className="max-w-4xl mx-auto">
          {/* Profile Header */}
          <div className="bg-gradient-to-br from-gray-900 to-gray-800 rounded-xl p-6 shadow-xl mb-6">
            <div className="flex flex-col sm:flex-row items-center gap-6">
              <div className="relative group">
                <div className="h-24 w-24 rounded-full bg-gray-200 flex items-center justify-center overflow-hidden border-4 border-white/20">
                  <span className="text-3xl font-medium text-gray-600">{userProfile.name.split(' ').map(n => n[0]).join('')}</span>
                </div>
                <button className="absolute bottom-0 right-0 bg-white rounded-full p-1.5 shadow-lg hover:bg-gray-50 transition-colors">
                  <CameraIcon className="h-4 w-4 text-gray-600" />
                </button>
              </div>
              <div className="text-center sm:text-left">
                <h1 className="text-2xl font-bold text-white">{userProfile.name}</h1>
                <p className="text-gray-300">{userProfile.role}</p>
                <div className="mt-3 flex flex-wrap justify-center sm:justify-start gap-3">
                  <span className="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-500/10 text-blue-400">
                    {userProfile.department}
                  </span>
                  <span className="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-500/10 text-green-400">
                    Active
                  </span>
                </div>
              </div>
              <button
                onClick={() => setIsEditing(!isEditing)}
                className="ml-auto px-4 py-2 text-sm font-medium text-white bg-white/10 rounded-lg hover:bg-white/20 transition-colors"
              >
                Edit Profile
              </button>
            </div>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            {/* Main Profile Info */}
            <div className="lg:col-span-2 space-y-6">
              <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div className="p-6">
                  <h2 className="text-lg font-semibold text-gray-900 mb-4">About</h2>
                  <p className="text-gray-600">{userProfile.bio}</p>
                </div>
                <div className="border-t border-gray-200 px-6 py-4">
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div className="flex items-center gap-3">
                      <EnvelopeIcon className="h-5 w-5 text-gray-400" />
                      <div>
                        <p className="text-sm text-gray-500">Email</p>
                        <p className="text-sm font-medium text-gray-900">{userProfile.email}</p>
                      </div>
                    </div>
                    <div className="flex items-center gap-3">
                      <PhoneIcon className="h-5 w-5 text-gray-400" />
                      <div>
                        <p className="text-sm text-gray-500">Phone</p>
                        <p className="text-sm font-medium text-gray-900">{userProfile.phone}</p>
                      </div>
                    </div>
                    <div className="flex items-center gap-3">
                      <MapPinIcon className="h-5 w-5 text-gray-400" />
                      <div>
                        <p className="text-sm text-gray-500">Location</p>
                        <p className="text-sm font-medium text-gray-900">{userProfile.location}</p>
                      </div>
                    </div>
                    <div className="flex items-center gap-3">
                      <div className="h-5 w-5 flex items-center justify-center">
                        <span className="text-sm font-medium text-gray-400">📅</span>
                      </div>
                      <div>
                        <p className="text-sm text-gray-500">Joined</p>
                        <p className="text-sm font-medium text-gray-900">{userProfile.joinDate}</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div className="p-6">
                  <h2 className="text-lg font-semibold text-gray-900 mb-4">Recent Activity</h2>
                  <div className="space-y-4">
                    {activities.map((activity) => (
                      <div key={activity.id} className="flex items-start gap-4">
                        <div className="h-8 w-8 rounded-full bg-gray-100 flex items-center justify-center">
                          <span className="text-sm">🔔</span>
                        </div>
                        <div>
                          <p className="text-sm font-medium text-gray-900">{activity.description}</p>
                          <p className="text-sm text-gray-500">{activity.date}</p>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </div>

            {/* Side Stats */}
            <div className="space-y-6">
              <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div className="p-6">
                  <h2 className="text-lg font-semibold text-gray-900 mb-4">Statistics</h2>
                  <div className="space-y-4">
                    <div>
                      <div className="flex justify-between items-center mb-2">
                        <span className="text-sm text-gray-600">Attendance Rate</span>
                        <span className="text-sm font-medium text-gray-900">98%</span>
                      </div>
                      <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
                        <div className="h-full bg-green-500 rounded-full" style={{ width: '98%' }} />
                      </div>
                    </div>
                    <div>
                      <div className="flex justify-between items-center mb-2">
                        <span className="text-sm text-gray-600">Leave Balance</span>
                        <span className="text-sm font-medium text-gray-900">12 days</span>
                      </div>
                      <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
                        <div className="h-full bg-blue-500 rounded-full" style={{ width: '60%' }} />
                      </div>
                    </div>
                    <div>
                      <div className="flex justify-between items-center mb-2">
                        <span className="text-sm text-gray-600">Performance</span>
                        <span className="text-sm font-medium text-gray-900">Excellent</span>
                      </div>
                      <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
                        <div className="h-full bg-purple-500 rounded-full" style={{ width: '95%' }} />
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div className="p-6">
                  <h2 className="text-lg font-semibold text-gray-900 mb-4">Skills</h2>
                  <div className="flex flex-wrap gap-2">
                    <span className="px-3 py-1 rounded-full text-sm font-medium bg-gray-100 text-gray-800">React</span>
                    <span className="px-3 py-1 rounded-full text-sm font-medium bg-gray-100 text-gray-800">Node.js</span>
                    <span className="px-3 py-1 rounded-full text-sm font-medium bg-gray-100 text-gray-800">TypeScript</span>
                    <span className="px-3 py-1 rounded-full text-sm font-medium bg-gray-100 text-gray-800">AWS</span>
                    <span className="px-3 py-1 rounded-full text-sm font-medium bg-gray-100 text-gray-800">Docker</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}