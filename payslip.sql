-- Create payslip table
CREATE TABLE `payslips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `month` date NOT NULL,
  `basic_salary` decimal(10,2) NOT NULL,
  `hra` decimal(10,2) DEFAULT 0.00,
  `conv` decimal(10,2) DEFAULT 0.00,
  `da` decimal(10,2) DEFAULT 0.00,
  `empee_pf` decimal(10,2) DEFAULT 0.00,
  `empee_esic` decimal(10,2) DEFAULT 0.00,
  `pt` decimal(10,2) DEFAULT 0.00,
  `tds` decimal(10,2) DEFAULT 0.00,
  `monthly_net_salary` decimal(10,2) NOT NULL,
  `status` enum('Generated','Pending') DEFAULT 'Generated',
  `generated_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `payslips_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;