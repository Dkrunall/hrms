# HRMS Deployment Guide for Hostinger

## Prerequisites
- A Hostinger hosting account with Node.js support
- MySQL database access
- Domain or subdomain configured in Hostinger

## Database Setup
1. Access Hostinger's MySQL Database section
2. Create a new database for HRMS
3. Import the database schema:
   - Use phpMyAdmin to import `hrms_db.sql` and `payslip.sql`
   - Note down the database credentials

## Backend Deployment
1. Create a new Node.js project in Hostinger
2. Upload backend files to Hostinger via FTP or Git
3. Install dependencies:
   ```bash
   npm install
   ```
4. Create `.env` file in the backend directory:
   ```env
   DB_HOST=your_hostinger_mysql_host
   DB_USER=your_database_username
   DB_PASSWORD=your_database_password
   DB_NAME=your_database_name
   PORT=3001
   ```
5. Update CORS configuration in backend to allow your domain:
   ```javascript
   app.use(cors({
     origin: 'https://your-domain.com'
   }));
   ```
6. Start the backend server:
   ```bash
   npm start
   ```

## Frontend Deployment
1. Update API endpoints in frontend code:
   - Replace all instances of `http://localhost:3001` with your backend URL
   - Update `next.config.js`:
     ```javascript
     async rewrites() {
       return [
         {
           source: '/api/:path*',
           destination: 'https://your-backend-url/api/:path*',
         },
       ];
     }
     ```
2. Build the Next.js application:
   ```bash
   npm run build
   ```
3. Upload the build files to Hostinger:
   - Upload the `.next` directory
   - Upload `package.json` and `package-lock.json`
   - Upload `public` directory
4. Install production dependencies:
   ```bash
   npm install --production
   ```
5. Start the Next.js server:
   ```bash
   npm start
   ```

## SSL Configuration
1. Enable SSL in Hostinger control panel
2. Update all frontend URLs to use HTTPS
3. Update backend CORS and other security configurations

## Post-Deployment Checklist
- [ ] Verify database connection
- [ ] Test all API endpoints
- [ ] Check PDF generation functionality
- [ ] Verify file uploads and downloads
- [ ] Test user authentication
- [ ] Monitor error logs
- [ ] Set up regular backups

## Troubleshooting
- Check Hostinger's Node.js logs for backend errors
- Verify environment variables are correctly set
- Ensure database permissions are properly configured
- Check file permissions for uploaded content

## Security Considerations
- Keep all npm packages updated
- Regularly update security patches
- Use environment variables for sensitive data
- Enable rate limiting for API endpoints
- Implement proper error handling
- Set up logging for security monitoring