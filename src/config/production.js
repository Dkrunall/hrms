// Production environment configuration

const config = {
  // Database configuration
  database: {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'hrms_db',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  },
  
  // API configuration
  api: {
    baseUrl: process.env.API_BASE_URL || 'https://your-domain.com/api',
    timeout: 30000, // 30 seconds
    headers: {
      'Content-Type': 'application/json'
    }
  },

  // Server configuration
  server: {
    port: process.env.PORT || 3001,
    corsOptions: {
      origin: process.env.FRONTEND_URL || 'https://your-domain.com',
      methods: ['GET', 'POST', 'PUT', 'DELETE'],
      allowedHeaders: ['Content-Type', 'Authorization']
    }
  },

  // Security configuration
  security: {
    rateLimitRequests: 100, // requests per window
    rateLimitWindow: 15 * 60 * 1000, // 15 minutes
    bcryptSaltRounds: 10
  }
};

module.exports = config;