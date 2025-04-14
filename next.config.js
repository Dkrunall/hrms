/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  async rewrites() {
    return [
      {
        source: '/api/:path*',
        destination: 'https://hrms-rho-gilt.vercel.app/api/:path*', // Ensure the port matches your Express server
      },
    ];
  },
};

module.exports = nextConfig;
