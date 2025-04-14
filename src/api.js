const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Database connection pool configuration
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'hrms_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Test database connection
pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error connecting to database:', err);
    if (err.code === 'PROTOCOL_CONNECTION_LOST') {
      console.error('Database connection was closed.');
    }
    if (err.code === 'ER_CON_COUNT_ERROR') {
      console.error('Database has too many connections.');
    }
    if (err.code === 'ECONNREFUSED') {
      console.error('Database connection was refused.');
    }
    return;
  }
  console.log('Connected to MySQL database');
  connection.release();
});

// Promisify pool query for better error handling
const query = (sql, values) => {
  return new Promise((resolve, reject) => {
    pool.query(sql, values, (error, results) => {
      if (error) return reject(error);
      resolve(results);
    });
  });
};

// Default /api endpoint
app.get('/api', (req, res) => {
  res.json({ message: 'Welcome to the API' });
});

// Departments API endpoints
app.get('/api/departments', (req, res) => {
  query('SELECT * FROM departments')
    .then(results => res.json(results))
    .catch(err => {
      console.error('Error fetching departments:', err);
      res.status(500).json({ error: 'Failed to fetch departments', details: err.message });
    });
});

app.post('/api/departments', (req, res) => {
  const { name } = req.body;
  if (!name) {
    return res.status(400).json({ error: 'Department name is required' });
  }
  
  query('INSERT INTO departments (name) VALUES (?)', [name])
    .then(result => res.status(201).json({ id: result.insertId, name }))
    .catch(err => {
      console.error('Error creating department:', err);
      res.status(500).json({ error: 'Failed to create department', details: err.message });
    });
});

// Employees API endpoints
app.get('/api/employees', (req, res) => {
  const sql = `
    SELECT 
      id, Emp_No, Employee_Name, Designation, 
      Section_Outlet, Department, DOB, DOJ, DOL 
    FROM employees 
    ORDER BY id DESC`;
  
  query(sql)
    .then(results => res.json(results))
    .catch(err => {
      console.error('Error fetching employees:', err);
      res.status(500).json({ error: 'Failed to fetch employees', details: err.message });
    });
});
  
app.get('/api/employees/:id', (req, res) => {
  const employeeId = req.params.id;
  const sql = `
    SELECT 
      id, Emp_No, Employee_Name, Designation, 
      Section_Outlet, Department, DOB, DOJ, DOL 
    FROM employees 
    WHERE id = ?`;
  
  query(sql, [employeeId])
    .then(results => {
      if (results.length === 0) {
        return res.status(404).json({ error: 'Employee not found' });
      }
      res.json(results[0]);
    })
    .catch(err => {
      console.error('Error fetching employee:', err);
      res.status(500).json({ error: 'Failed to fetch employee', details: err.message });
    });
});
  
app.post('/api/employees', (req, res) => {
  const { Emp_No, Employee_Name, Designation, Section_Outlet, Department, DOB, DOJ, DOL } = req.body;
  
  if (!Employee_Name || !Department) {
    return res.status(400).json({ error: 'Employee name and department are required' });
  }
  
  const sql = `
    INSERT INTO employees 
    (Emp_No, Employee_Name, Designation, Section_Outlet, Department, DOB, DOJ, DOL) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
  const values = [Emp_No, Employee_Name, Designation, Section_Outlet, Department, DOB, DOJ, DOL];
  
  query(sql, values)
    .then(result => {
      const newEmployee = {
        id: result.insertId,
        Emp_No,
        Employee_Name,
        Designation,
        Section_Outlet,
        Department,
        DOB,
        DOJ,
        DOL
      };
      res.status(201).json(newEmployee);
    })
    .catch(err => {
      console.error('Error creating employee:', err);
      res.status(500).json({ error: 'Failed to create employee', details: err.message });
    });
});
  
app.put('/api/employees/:id', (req, res) => {
  const employeeId = req.params.id;
  const updateData = req.body;
  
  // Remove id from updateData if it exists
  delete updateData.id;
  
  const sql = 'UPDATE employees SET ? WHERE id = ?';
  
  query(sql, [updateData, employeeId])
    .then(result => {
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Employee not found' });
      }
      res.json({ id: employeeId, ...updateData });
    })
    .catch(err => {
      console.error('Error updating employee:', err);
      res.status(500).json({ error: 'Failed to update employee', details: err.message });
    });
});
  
app.delete('/api/employees/:id', (req, res) => {
  const employeeId = req.params.id;
  
  const sql = 'DELETE FROM employees WHERE id = ?';
  
  query(sql, [employeeId])
    .then(result => {
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Employee not found' });
      }
      res.json({ message: 'Employee deleted successfully' });
    })
    .catch(err => {
      console.error('Error deleting employee:', err);
      res.status(500).json({ error: 'Failed to delete employee', details: err.message });
    });
});

// Salary API endpoints
app.get('/api/salary', (req, res) => {
  const sql = `
    SELECT s.*, e.Employee_Name 
    FROM salary s
    JOIN employees e ON s.Emp_No = e.Emp_No
    ORDER BY s.id DESC`;

  query(sql)
    .then(results => res.json(results))
    .catch(err => {
      console.error('Error fetching salary records:', err);
      res.status(500).json({ error: 'Failed to fetch salary records', details: err.message });
    });
});

app.get('/api/salary/:id', (req, res) => {
  const salaryId = req.params.id;
  const sql = `
    SELECT s.*, e.Employee_Name 
    FROM salary_payments s
    JOIN employees e ON s.Emp_No = e.Emp_No
    WHERE s.id = ?`;

  query(sql, [salaryId])
    .then(results => {
      if (results.length === 0) {
        return res.status(404).json({ error: 'Salary record not found' });
      }
      res.json(results[0]);
    })
    .catch(err => {
      console.error('Error fetching salary record:', err);
      res.status(500).json({ error: 'Failed to fetch salary record', details: err.message });
    });
});

app.post('/api/salary', (req, res) => {
  const { 
    Emp_No, Basic, HRA, CONV, DA, 
    Empee_PF, Empee_ESIC, PT, TDS, 
    Month, Monthly_Net_Salary 
  } = req.body;

  if (!Emp_No || !Basic || !Month) {
    return res.status(400).json({ error: 'Employee number, basic salary, and month are required' });
  }

  const sql = `
    INSERT INTO salary 
    (Emp_No, Basic, HRA, CONV, DA, Empee_PF, Empee_ESIC, PT, TDS, Month, Monthly_Net_Salary) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  const values = [Emp_No, Basic, HRA, CONV, DA, Empee_PF, Empee_ESIC, PT, TDS, Month, Monthly_Net_Salary];

  query(sql, values)
    .then(result => {
      const newSalary = {
        id: result.insertId,
        Emp_No, Basic, HRA, CONV, DA,
        Empee_PF, Empee_ESIC, PT, TDS,
        Month, Monthly_Net_Salary
      };
      res.status(201).json(newSalary);
    })
    .catch(err => {
      console.error('Error creating salary record:', err);
      res.status(500).json({ error: 'Failed to create salary record', details: err.message });
    });
});

app.put('/api/salary/:id', (req, res) => {
  const salaryId = req.params.id;
  const updateData = req.body;

  delete updateData.id;

  const sql = 'UPDATE salary SET ? WHERE id = ?';

  query(sql, [updateData, salaryId])
    .then(result => {
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Salary record not found' });
      }
      res.json({ id: salaryId, ...updateData });
    })
    .catch(err => {
      console.error('Error updating salary record:', err);
      res.status(500).json({ error: 'Failed to update salary record', details: err.message });
    });
});

app.delete('/api/salary/:id', (req, res) => {
  const salaryId = req.params.id;

  const sql = 'DELETE FROM salary WHERE id = ?';

  query(sql, [salaryId])
    .then(result => {
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Salary record not found' });
      }
      res.json({ message: 'Salary record deleted successfully' });
    })
    .catch(err => {
      console.error('Error deleting salary record:', err);
      res.status(500).json({ error: 'Failed to delete salary record', details: err.message });
    });
});

// Attendance API endpoints
app.get('/api/attendance', (req, res) => {
  query('SELECT * FROM attendance')
    .then(results => res.json(results))
    .catch(err => {
      console.error('Error fetching attendance:', err);
      res.status(500).json({ error: 'Failed to fetch attendance', details: err.message });
    });
});
  
app.get('/api/attendance/:employeeId', (req, res) => {
  const employeeId = req.params.employeeId;
  query('SELECT * FROM attendance WHERE employee_id = ?', [employeeId])
    .then(results => res.json(results))
    .catch(err => {
      console.error('Error fetching employee attendance:', err);
      res.status(500).json({ error: 'Failed to fetch employee attendance', details: err.message });
    });
});
  
app.post('/api/attendance', (req, res) => {
  const { employee_id, clock_in, clock_out, date } = req.body;
  
  if (!employee_id || !date) {
    return res.status(400).json({ error: 'Employee ID and date are required' });
  }
  
  const sql = 'INSERT INTO attendance (employee_id, clock_in, clock_out, date) VALUES (?, ?, ?, ?)';
  const values = [employee_id, clock_in, clock_out, date];
  
  query(sql, values)
    .then(result => res.status(201).json({ id: result.insertId, ...req.body }))
    .catch(err => {
      console.error('Error creating attendance:', err);
      res.status(500).json({ error: 'Failed to create attendance', details: err.message });
    });
});
  
app.put('/api/attendance/:id', (req, res) => {
  const attendanceId = req.params.id;
  const { clock_in, clock_out } = req.body;
  
  const sql = 'UPDATE attendance SET clock_in = ?, clock_out = ? WHERE id = ?';
  query(sql, [clock_in, clock_out, attendanceId])
    .then(result => {
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Attendance record not found' });
      }
      res.json({ id: attendanceId, ...req.body });
    })
    .catch(err => {
      console.error('Error updating attendance:', err);
      res.status(500).json({ error: 'Failed to update attendance', details: err.message });
    });
});
  
// Payslip API endpoints
// GET /api/payslips: Retrieve all payslip records
app.get('/api/payslips', async (req, res) => {
  const sql = `
    SELECT 
      sp.id, sp.Emp_No, sp.Month, sp.Title, sp.Employee_Name, 
      sp.Designation, sp.Department, sp.Section_Outlet, sp.Gender, 
      sp.DOB, sp.DOJ, sp.DOL, sp.Actual_Salary, sp.Basic, sp.DA, 
      sp.HRA, sp.CONV, sp.Monthly_Gross_Salary, sp.Emper_PF, 
      sp.Emper_ESIC, sp.Stat_Bonus, sp.Grauity, sp.Monthly_CTC, 
      sp.Empee_PF, sp.Empee_ESIC, sp.PT, sp.TDS, 
      sp.Monthly_Net_Salary, sp.Total_Days
    FROM salary_payments sp
    ORDER BY sp.id DESC
  `;
  try {
    const results = await query(sql);
    const payslips = results.map(row => ({
      id: row.id,
      employeeId: row.Emp_No,
      employeeName: row.Employee_Name,
      month: row.Month,
      year: new Date(row.Month).getFullYear(),
      title: row.Title,
      designation: row.Designation,
      department: row.Department,
      sectionOutlet: row.Section_Outlet,
      gender: row.Gender,
      dob: row.DOB,
      doj: row.DOJ,
      dol: row.DOL,
      actualSalary: row.Actual_Salary,
      basicSalary: row.Basic,
      da: row.DA,
      hra: row.HRA,
      conv: row.CONV,
      monthlyGrossSalary: row.Monthly_Gross_Salary,
      emprPf: row.Emper_PF,
      emprEsic: row.Emper_ESIC,
      statBonus: row.Stat_Bonus,
      gratuity: row.Grauity,
      monthlyCTC: row.Monthly_CTC,
      empePf: row.Empee_PF,
      empeEsic: row.Empee_ESIC,
      pt: row.PT,
      tds: row.TDS,
      monthlyNetSalary: row.Monthly_Net_Salary,
      totalDays: row.Total_Days,
      status: 'Generated'
    }));
    res.json(payslips);
  } catch (err) {
    console.error('Error fetching payslips:', err);
    res.status(500).json({ error: 'Failed to fetch payslips', details: err.message });
  }
});

// POST /api/payslip/generate: Generate a payslip using the record's primary key (id) and the Month column
app.post('/api/payslip/generate', async (req, res) => {
  console.log("Payslip generate endpoint hit, request body:", req.body);

  // Destructure required values (now using payslipId)
  const { employeeId, month, year } = req.body;

   // Validate the required fields
   if (!employeeId || !month || !year) {
    return res.status(400).json({ error: 'Employee ID, month, and year are required' });
   }

  try {
    // Format the targetYearMonth as "YYYY-MM", for example "2025-04"
    const targetYearMonth = `${year}-${month.toString().padStart(2, '0')}`;
    console.log("Target Year-Month:", targetYearMonth);
    console.log("Parameters:", { employeeId, targetYearMonth });

    // Use the new SQL query filtering by primary key (id) and comparing the formatted Month column
    const salaryPaymentSql = `
      SELECT *, DATE_FORMAT(\`Month\`, '%Y-%m') AS formattedMonth
      FROM salary_payments
      WHERE id = ? 
        AND DATE_FORMAT(\`Month\`, '%Y-%m') = ?
    `;
    const results = await query(salaryPaymentSql, [employeeId, targetYearMonth]);
    console.log("Query Results:", results);

    if (results.length === 0) {
      return res.status(404).json({ error: 'No salary record found for the specified month' });
    }

    const salaryData = results[0];
    const payslip = {
      id: salaryData.id,
      employeeId: salaryData.Emp_No,
      employeeName: salaryData.Employee_Name,
      month: salaryData.Month,
      year: year,
      title: salaryData.Title,
      designation: salaryData.Designation,
      department: salaryData.Department,
      sectionOutlet: salaryData.Section_Outlet,
      gender: salaryData.Gender,
      dob: salaryData.DOB,
      doj: salaryData.DOJ,
      dol: salaryData.DOL,
      actualSalary: salaryData.Actual_Salary,
      basicSalary: salaryData.Basic,
      da: salaryData.DA,
      hra: salaryData.HRA,
      conv: salaryData.CONV,
      monthlyGrossSalary: salaryData.Monthly_Gross_Salary,
      emprPf: salaryData.Emper_PF,
      emprEsic: salaryData.Emper_ESIC,
      statBonus: salaryData.Stat_Bonus,
      gratuity: salaryData.Grauity,
      monthlyCTC: salaryData.Monthly_CTC,
      empePf: salaryData.Empee_PF,
      empeEsic: salaryData.Empee_ESIC,
      pt: salaryData.PT,
      tds: salaryData.TDS,
      monthlyNetSalary: salaryData.Monthly_Net_Salary,
      totalDays: salaryData.Total_Days,
      status: 'Generated'
    };

    res.json(payslip);
  } catch (err) {
    console.error('Error generating payslip:', err);
    res.status(500).json({ error: 'Failed to generate payslip', details: err.message });
  }
});

  
// Salary Payments API endpoints
app.get('/api/salary-payments', (req, res) => {
  const sql = `
    SELECT id, Emp_No, Month, Title, Employee_Name, Designation, Department,
    Section_Outlet, Gender, DOB, DOJ, DOL, Actual_Salary, Basic, DA, HRA,
    CONV, Monthly_Gross_Salary, Emper_PF, Emper_ESIC, Stat_Bonus, Grauity,
    Monthly_CTC, Empee_PF, Empee_ESIC, PT, TDS, Monthly_Net_Salary, Total_Days
    FROM salary_payments
    ORDER BY id DESC
  `;

  query(sql)
    .then(results => {
      if (results.length === 0) {
        return res.status(404).json({ message: 'No salary payment records found' });
      }
      res.json(results);
    })
    .catch(err => {
      console.error('Error fetching salary payments:', err);
      res.status(500).json({ error: 'Failed to fetch salary payments', details: err.message });
    });
});

// Leaves API endpoints
app.get('/api/leaves', (req, res) => {
  const sql = `
    SELECT l.*, e.Employee_Name 
    FROM leave_requests l
    JOIN employees e ON l.employee_id = e.id
    ORDER BY l.start_date DESC
  `;

  query(sql)
    .then(results => res.json(results))
    .catch(err => {
      console.error('Error fetching leaves:', err);
      res.status(500).json({ error: 'Failed to fetch leaves', details: err.message });
    });
});

app.get('/api/leaves/:id', (req, res) => {
  const leaveId = req.params.id;
  const sql = `
    SELECT l.*, e.Employee_Name 
    FROM leave_requests l
    JOIN employees e ON l.employee_id = e.id
    WHERE l.id = ?
  `;

  query(sql, [leaveId])
    .then(results => {
      if (results.length === 0) {
        return res.status(404).json({ error: 'Leave request not found' });
      }
      res.json(results[0]);
    })
    .catch(err => {
      console.error('Error fetching leave:', err);
      res.status(500).json({ error: 'Failed to fetch leave', details: err.message });
    });
});

app.post('/api/leaves', (req, res) => {
  const { employee_id, leave_type, start_date, end_date, reason, status = 'pending' } = req.body;

  if (!employee_id || !leave_type || !start_date || !end_date) {
    return res.status(400).json({ error: 'Employee ID, leave type, start date, and end date are required' });
  }

  const sql = `
    INSERT INTO leave_requests 
    (employee_id, leave_type, start_date, end_date, reason, status) 
    VALUES (?, ?, ?, ?, ?, ?)
  `;
  const values = [employee_id, leave_type, start_date, end_date, reason, status];

  query(sql, values)
    .then(result => {
      const newLeave = {
        id: result.insertId,
        employee_id,
        leave_type,
        start_date,
        end_date,
        reason,
        status
      };
      res.status(201).json(newLeave);
    })
    .catch(err => {
      console.error('Error creating leave request:', err);
      res.status(500).json({ error: 'Failed to create leave request', details: err.message });
    });
});

app.put('/api/leaves/:id', (req, res) => {
  const leaveId = req.params.id;
  const updateData = req.body;

  delete updateData.id;

  const sql = 'UPDATE leave_requests SET ? WHERE id = ?';

  query(sql, [updateData, leaveId])
    .then(result => {
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Leave request not found' });
      }
      res.json({ id: leaveId, ...updateData });
    })
    .catch(err => {
      console.error('Error updating leave request:', err);
      res.status(500).json({ error: 'Failed to update leave request', details: err.message });
    });
});

app.delete('/api/leaves/:id', (req, res) => {
  const leaveId = req.params.id;

  const sql = 'DELETE FROM leave_requests WHERE id = ?';

  query(sql, [leaveId])
    .then(result => {
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Leave request not found' });
      }
      res.json({ message: 'Leave request deleted successfully' });
    })
    .catch(err => {
      console.error('Error deleting leave request:', err);
      res.status(500).json({ error: 'Failed to delete leave request', details: err.message });
    });
});

// Leave approval endpoint
app.put('/api/leaves/:id/approve', (req, res) => {
  const leaveId = req.params.id;
  const sql = 'UPDATE leave_requests SET status = "approved" WHERE id = ?';

  query(sql, [leaveId])
    .then(result => {
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Leave request not found' });
      }
      res.json({ message: 'Leave request approved successfully' });
    })
    .catch(err => {
      console.error('Error approving leave request:', err);
      res.status(500).json({ error: 'Failed to approve leave request', details: err.message });
    });
});

// Leave rejection endpoint
app.put('/api/leaves/:id/reject', (req, res) => {
  const leaveId = req.params.id;
  const sql = 'UPDATE leave_requests SET status = "rejected" WHERE id = ?';

  query(sql, [leaveId])
    .then(result => {
      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Leave request not found' });
      }
      res.json({ message: 'Leave request rejected successfully' });
    })
    .catch(err => {
      console.error('Error rejecting leave request:', err);
      res.status(500).json({ error: 'Failed to reject leave request', details: err.message });
    });
});


// Payslip API endpoints
app.get('/api/payslips', (req, res) => {
  const sql = `
    SELECT p.*, e.Employee_Name, e.Designation, e.Department, e.Section_Outlet
    FROM payslips p
    JOIN employees e ON p.employee_id = e.id
    ORDER BY p.generated_date DESC
  `;

  query(sql)
    .then(results => res.json(results))
    .catch(err => {
      console.error('Error fetching payslips:', err);
      res.status(500).json({ error: 'Failed to fetch payslips', details: err.message });
    });
});

app.post('/api/payslip/generate', async (req, res) => {
  const { employeeId, month, year } = req.body;

  if (!employeeId || !month || !year) {
    return res.status(400).json({ error: 'Employee ID, month, and year are required' });
  }

  try {
    // First check if employee exists
    const employeeQuery = 'SELECT id, Emp_No, Employee_Name FROM employees WHERE id = ?';
    const employeeResults = await query(employeeQuery, [employeeId]);

    if (employeeResults.length === 0) {
      return res.status(404).json({ error: 'Employee not found' });
    }

    const employee = employeeResults[0];

    // Get available salary months for this employee
    const availableMonthsQuery = `
      SELECT DISTINCT DATE_FORMAT(Month, '%Y-%m') as available_month 
      FROM salary_payments 
      WHERE Emp_No = ? 
      ORDER BY Month DESC
      LIMIT 12`;
    const availableMonths = await query(availableMonthsQuery, [employee.Emp_No]);

    // Format the target month
    const targetMonth = `${year}-${month.toString().padStart(2, '0')}-01`;

    // Fetch employee and salary details
    const sql = `
      SELECT 
        e.Employee_Name, e.Emp_No, e.Designation, e.Department,
        e.Section_Outlet, e.DOJ,
        COALESCE(s.Basic, 0) as Basic,
        COALESCE(s.HRA, 0) as HRA,
        COALESCE(s.CONV, 0) as CONV,
        COALESCE(s.DA, 0) as DA,
        COALESCE(s.Empee_PF, 0) as Empee_PF,
        COALESCE(s.Empee_ESIC, 0) as Empee_ESIC,
        COALESCE(s.PT, 0) as PT,
        COALESCE(s.TDS, 0) as TDS,
        COALESCE(s.Monthly_Net_Salary, 0) as Monthly_Net_Salary
      FROM employees e
      LEFT JOIN salary_payments s ON e.Emp_No = s.Emp_No AND DATE_FORMAT(s.Month, '%Y-%m-%d') = ?
      WHERE e.id = ?`;

    const results = await query(sql, [targetMonth, employeeId]);
    
    if (!results[0]?.Monthly_Net_Salary) {
      return res.status(404).json({
        error: 'No salary record found for the specified month',
        employee: {
          id: employee.id,
          name: employee.Employee_Name,
          emp_no: employee.Emp_No
        },
        available_months: availableMonths.map(m => m.available_month)
      });
    }

    const employeeData = results[0];
      
      // Insert into payslips table
      const insertSql = `
        INSERT INTO payslips (
          employee_id, month, basic_salary, hra, conv, da,
          empee_pf, empee_esic, pt, tds, monthly_net_salary
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      `;
      
      const insertValues = [
        employeeId,
        `${year}-${month}-01`,
        employeeData.Basic,
        employeeData.HRA,
        employeeData.CONV,
        employeeData.DA,
        employeeData.Empee_PF,
        employeeData.Empee_ESIC,
        employeeData.PT,
        employeeData.TDS,
        employeeData.Monthly_Net_Salary
      ];

      const result = await query(insertSql, insertValues);

      const payslip = {
        id: result.insertId,
        employeeName: employeeData.Employee_Name,
        employeeId: employeeData.Emp_No,
        designation: employeeData.Designation,
        department: employeeData.Department,
        section: employeeData.Section_Outlet,
        month: month,
        year: year,
        dateOfJoining: employeeData.DOJ,
        earnings: {
          basic: employeeData.Basic,
          hra: employeeData.HRA,
          conveyance: employeeData.CONV,
          da: employeeData.DA,
          totalEarnings: employeeData.Basic + employeeData.HRA + employeeData.CONV + employeeData.DA
        },
        deductions: {
          pf: employeeData.Empee_PF,
          esic: employeeData.Empee_ESIC,
          pt: employeeData.PT,
          tds: employeeData.TDS,
          totalDeductions: employeeData.Empee_PF + employeeData.Empee_ESIC + employeeData.PT + employeeData.TDS
        },
        netSalary: employeeData.Monthly_Net_Salary,
        generatedDate: new Date().toISOString(),
        status: 'Generated'
      };

      res.json(payslip);
    } catch (err) {
      console.error('Error generating payslip:', err);
      res.status(500).json({ error: 'Failed to generate payslip', details: err.message });
    }
  });


app.get('/api/payslips/:id', (req, res) => {
  const payslipId = req.params.id;
  const sql = `
    SELECT p.*, e.Employee_Name, e.Designation, e.Department, e.Section_Outlet
    FROM payslips p
    JOIN employees e ON p.employee_id = e.id
    WHERE p.id = ?
  `;

  query(sql, [payslipId])
    .then(results => {
      if (results.length === 0) {
        return res.status(404).json({ error: 'Payslip not found' });
      }
      res.json(results[0]);
    })
    .catch(err => {
      console.error('Error fetching payslip:', err);
      res.status(500).json({ error: 'Failed to fetch payslip', details: err.message });
    });
});

// Start server
const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
