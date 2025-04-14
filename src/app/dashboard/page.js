'use client';

import { 
  UsersIcon, 
  BanknotesIcon,
  ClockIcon,
  DocumentCheckIcon 
} from '@heroicons/react/24/outline';
import DashboardLayout from '../components/layout/DashboardLayout';

const stats = [
  {
    name: 'Total Employees',
    value: '248',
    icon: UsersIcon,
    change: '+4.75%',
    changeType: 'positive'
  },
  {
    name: 'Total Salary',
    value: '$284,356.48',
    icon: BanknotesIcon,
    change: '+2.45%',
    changeType: 'positive'
  },
  {
    name: 'Leave Requests',
    value: '12',
    icon: ClockIcon,
    change: '-1.25%',
    changeType: 'negative'
  },
  {
    name: 'Pending Payslips',
    value: '38',
    icon: DocumentCheckIcon,
    change: '+8.36%',
    changeType: 'positive'
  },
];

export default function Dashboard() {
  return (
    <DashboardLayout>
      <div className="py-6">
        <h1 className="text-3xl font-bold bg-gradient-to-r from-purple-600 to-blue-600 bg-clip-text text-transparent">Dashboard</h1>
        <div className="mt-8 grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
          {stats.map((item) => (
            <div
              key={item.name}
              className="group bg-white/80 backdrop-blur-sm overflow-hidden shadow-lg rounded-xl p-6 hover:shadow-xl hover:scale-[1.02] transition-all duration-300 border border-white/20"
            >
              <div className="flex items-center">
                <div className="flex-shrink-0 p-3 rounded-lg bg-gradient-to-br from-blue-500/10 to-purple-500/10 group-hover:from-blue-500/20 group-hover:to-purple-500/20 transition-colors">
                  <item.icon className="h-8 w-8 text-purple-600 group-hover:text-blue-600 transition-colors" />
                </div>
                <div className="ml-5 w-0 flex-1">
                  <dl>
                    <dt className="text-sm font-medium text-gray-600 truncate">
                      {item.name}
                    </dt>
                    <dd className="flex items-baseline">
                      <div className="text-2xl font-bold text-gray-900">
                        {item.value}
                      </div>
                      <div
                        className={`ml-2 flex items-baseline text-sm font-semibold ${item.changeType === 'positive' ? 'text-emerald-600' : 'text-rose-600'}`}
                      >
                        {item.change}
                      </div>
                    </dd>
                  </dl>
                </div>
              </div>
            </div>
          ))}
        </div>

        <div className="mt-8 bg-white shadow rounded-lg p-6">
          <h2 className="text-lg font-medium text-gray-900">Recent Activities</h2>
          <div className="mt-6 border-t border-gray-200 pt-4">
            <div className="space-y-4">
              {/* Activity items will be added here */}
              <p className="text-gray-500 text-sm">No recent activities to display</p>
            </div>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}