'use client';

import { useState, useEffect } from 'react';
import Sidebar from './Sidebar';
import Header from './Header';

export default function DashboardLayout({ children }) {
  const [mounted, setMounted] = useState(false);
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);

  // Prevent hydration mismatch
  useEffect(() => {
    setMounted(true);
  }, []);

  if (!mounted) return null;

  return (
    <div className="min-h-screen bg-gradient-to-br from-indigo-50/80 via-purple-50/80 to-pink-50/80 overflow-hidden">
      <Sidebar collapsed={sidebarCollapsed} onCollapse={setSidebarCollapsed} />
      <div className={`transition-all duration-300 ease-in-out ${sidebarCollapsed ? 'ml-16' : 'ml-64'} min-h-screen bg-white/40 backdrop-blur-xl relative`}>
        <Header />
        <main className="transition-all duration-300 ease-in-out p-4 sm:p-6 lg:p-8 relative">
          <div className="max-w-7xl mx-auto space-y-6 sm:space-y-8 relative z-10 bg-white/50 rounded-2xl shadow-lg backdrop-blur-lg p-6 border border-white/20">
            {children}
          </div>
          <div className="absolute inset-0 bg-gradient-to-br from-blue-500/5 via-purple-500/5 to-pink-500/5 rounded-3xl blur-3xl pointer-events-none animate-pulse"></div>
          <div className="absolute inset-x-0 -top-40 -z-10 transform-gpu overflow-hidden blur-3xl sm:-top-80">
            <div className="relative left-[calc(50%-20rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-purple-100 to-pink-100 opacity-20 sm:left-[calc(50%-30rem)] sm:w-[72.1875rem]"></div>
          </div>
        </main>
      </div>
    </div>
  );
}