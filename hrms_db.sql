-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2025 at 08:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `clock_in` datetime DEFAULT NULL,
  `clock_out` datetime DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `Emp_No` int(11) DEFAULT NULL,
  `Employee_Name` varchar(255) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Section_Outlet` varchar(255) DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `DOB` varchar(255) DEFAULT NULL,
  `DOJ` varchar(255) DEFAULT NULL,
  `DOL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `Emp_No`, `Employee_Name`, `Designation`, `Section_Outlet`, `Department`, `DOB`, `DOJ`, `DOL`) VALUES
(1, 1, 'Shashikanthi Shetty', 'MD ', 'Corporate', 'Corporate', '11-Apr-69', '01-Jul-07', ''),
(2, 2, 'Karunakar Shetty', 'CMD', 'Corporate', 'Corporate', '', '01-Dec-22', ''),
(3, 3, 'Vinaya Shetty', 'CMD', 'Corporate', 'Corporate', '', '01-Dec-22', ''),
(4, 4, 'Satish Shetty', 'MD ', 'Corporate', 'Corporate', '', '01-Apr-22', ''),
(5, 5, 'Rahul Shetty', 'Director', 'Corporate', 'Corporate', '', '01-Apr-22', ''),
(6, 6, 'Gautam Shetty', 'Director', 'Corporate', 'Corporate', '', '01-Mar-22', ''),
(7, 7, 'Gaurav Shetty', 'Director', 'Corporate', 'Corporate', '01-Jan-70', '01-Mar-22', ''),
(8, 8, 'Diksha Shetty', 'Director', 'Corporate', 'Corporate', '', '01-May-22', ''),
(9, 2368, 'Kusum Yadav', 'Restaurant Manager', 'Café Crema', 'F&B Service', '15-May-97', '24-Jun-24', ''),
(10, 238, 'Rajesh Ramesh Kamble', 'Assistant Rest. Manager', 'Café Crema', 'F&B Service', '06-Sep-74', '13-Mar-12', ''),
(11, 2369, 'Carolyn', 'GRE', 'Café Crema', 'F&B Service', '04-Jun-01', '25-Jun-24', ''),
(12, 1806, 'Dhiraj Lokhande', 'Barista ', 'Café Crema', 'F&B Service', '19-Sep-99', '15-May-23', ''),
(13, 2569, 'Mohd Hanif Chandsaheb Baig', 'Barista', 'Café Crema', 'F&B Service', '', '04-Jan-25', ''),
(14, 253, 'Akhtar Ali', 'Sr. Captain', 'Café Crema', 'F&B Service', '20-Aug-88', '28-Dec-13', ''),
(15, 243, 'Sudam Charan Mahanty', 'Sr. Captain', 'Café Crema ', 'F&B Service', '', '18-Apr-13', ''),
(16, 2352, 'Nikhil Bakode', 'Captain', 'Café Crema', 'F&B Service', '03-Jun-85', '1-Jun-24', ''),
(17, 2408, 'Raju Ram Luhar', 'Captain', 'Café Crema ', 'F&B Service', '27-Jul-86', '20-Aug-24', ''),
(18, 2568, 'Vishnu Suresh Kuldipake', 'Tr. Captain', 'Café Crema', '', '', '1-Jan-25', ''),
(19, 1530, 'Kalpit Kishor Mhatre', 'Asst. Bartender', 'Café Crema', 'F&B Service', '27-Apr-93', '22-Jun-22', ''),
(20, 2526, 'Abhijit Dhirendra Satapathy', 'Sr. Steward', 'Café Crema ', 'IRD', '04-Nov-06', '22-Nov-24', ''),
(21, 151, 'Nirpa Budha', 'Sr. Steward', 'Café Crema', 'F&B Service', '13-Nov-97', '25-Oct-21', ''),
(22, 2561, 'Shahid Akhtar Ansari', 'Sr. Steward', 'Café Crema ', 'F&B - Service', '19-Sep-00', '21-Dec-24', ''),
(23, 2554, 'Rubita Murgesh Shetty', 'Steward', 'Café Crema ', 'F&B - Service', '20-Mar-01', '20-Dec-24', ''),
(24, 429, 'Vinod Rajak', 'Steward', 'Café Crema', 'F&B Service', '11-Apr-84', '12-Feb-16', ''),
(25, 1407, 'Md Ibrar', 'Steward', 'Café Crema', 'F&B Service', '01-Jan-92', '10-Jan-22', ''),
(26, 1779, 'Raja Ansari', 'Steward', 'Café Crema', 'F&B Service', '01-Jan-96', '19-Apr-23', ''),
(27, 1799, 'Sanwar Alam', 'Steward', 'Café Crema', 'F&B Service', '19-Nov-00', '11-May-23', ''),
(28, 2140, 'Amar Znje', 'Steward', 'Café Crema', 'F&B Service', '05-Jan-03', '23-Jan-24', ''),
(29, 2267, 'Rohan Vaity', 'Steward', 'Café Crema', 'F&B Service', '29-Jan-02', '19-Mar-24', ''),
(30, 2539, 'Alex Thomas', 'Steward', 'Café Crema ', 'Café Crema ', '09-Jun-90', '05-Dec-24', ''),
(31, 2577, 'Sankar Mahakur', 'Steward', 'Café Crema', '', '', '10-Jan-25', ''),
(32, 2065, 'Noori Firoz', 'Asst. Stewards', 'Café Crema', 'F&B Service', '16-Jul-04', '01-Nov-23', ''),
(33, 2064, 'Kainath Firoz', 'Asst. Stewards', 'Café Crema', 'F&B Service', '22-May-03', '01-Nov-23', ''),
(34, 2567, 'Khushi Manjeet Chandaliya', 'Tr Steward', 'Café Crema', '', '', '3-Jan-25', ''),
(35, 478, 'Sudarshan Shekhar Shetty', 'Operation Manager', 'Mitron - Service', 'F&B Service', '04-Jul-80', '08-Oct-21', ''),
(36, 891, 'Mahesh Londhe', 'A.R.M', 'Mitron - Service', 'F&B Service', '14-Jun-89', '26-Dec-19', ''),
(37, 256, 'Ramesh K Poojari', 'Floor Manager', 'Mitron - Service', 'F&B Service', '01-Feb-77', '01-Jan-15', ''),
(38, 938, 'Vivek Kadam', 'Floor Supervisor', 'Mitron - Service', 'F&B Service', '25-Aug-90', '01-Mar-19', ''),
(39, 730, 'Arshad Choudhary', 'GRM', 'Mitron - Service', 'F&B Service', '03-Feb-98', '18-Jul-18', ''),
(40, 833, 'Suhas Devdas Panchal', 'Cashier', 'Mitron - Service', 'F&B Service', '16-Nov-85', '13-Jan-19', ''),
(41, 1507, 'Ritesh Sharma', 'Cashier', 'Mitron - Service', 'F&B Service', '20-Jul-93', '02-Jun-22', ''),
(42, 1442, 'Sandesh Kumar Bayarabettu', 'Cashier', 'Mitron - Service', 'F&B Service', '05-Oct-82', '25-Mar-22', ''),
(43, 1254, 'Ruvel  Viegas', 'Sr. Bartender', 'Mitron - Service', 'F&B Service', '20-Nov-95', '16-Oct-21', ''),
(44, 2516, 'Saurabh Singh Dafouti', 'Bartender', 'Mitron - Service', 'F&B Service', '11-Feb-04', '15-Nov-24', ''),
(45, 1417, 'Darshan Jayram Patil', 'Bartender', 'Mitron - Service', 'F&B Service', '18-Jun-98', '03-Mar-22', ''),
(46, 1869, 'Sumit Kumar', ' Bartender', 'Mitron - Service', 'F&B Service', '24-Mar-91', '24-Jun-23', ''),
(47, 2026, 'Nitai Bachhar', 'Asst. Bartender', 'Mitron - Service', 'F&B Service', '25-Jan-98', '09-Sep-23', ''),
(48, 2602, 'Titus George Murzello', 'Asst Bartender', 'Mitron - Service', 'F&B Service', '10-Apr-04', '07-Feb-25', ''),
(49, 1640, 'Anand Philip Rosario', 'Sr. Captain', 'Mitron - Service', 'F&B Service', '25-Feb-87', '10-Oct-22', ''),
(50, 2434, 'Leon Vincent Vasaikar', 'Steward', 'Mitron - Service', 'F&B - Service', '31-Aug-99', '01-Oct-24', ''),
(51, 1414, 'Ashish Rajesh Mastan', 'Steward', 'Mitron - Service', 'F&B Service', '26-Jun-01', '03-Mar-22', ''),
(52, 1255, 'Adhiraj Sumeet Shetye', 'Steward', 'Mitron - Service', 'F&B Service', '23-Dec-01', '25-Oct-21', ''),
(53, 236, 'Irshad Khan', 'Steward', 'Mitron - Service', 'F&B Service', '27-May-84', '19-Nov-18', ''),
(54, 1412, 'Pintu Naik', 'Steward', 'Mitron - Service', 'F&B Service', '07-Apr-97', '02-Mar-22', ''),
(55, 1686, 'Yash Ganpat Lohar', 'Steward', 'Mitron - Service', 'F&B Service', '24-Jun-02', '15-Dec-22', ''),
(56, 1434, 'Nikhil More', 'Steward', 'Mitron - Service', 'F&B Service', '24-Nov-97', '05-Mar-24', ''),
(57, 1772, 'Jay Rabad', 'Steward', 'Mitron - Service', 'F&B Service', '25-Jan-01', '16-Apr-24', ''),
(58, 2571, 'Harshad Anandam Sirra', 'Steward', 'Mitron - Service', '', '', '07-Jan-25', ''),
(59, 2578, 'Darshan Sanjay Satdive', 'Steward', 'Mitron - Service ', '', '', '10-Jan-25', ''),
(60, 1305, 'Guddu Anvar', 'Sheesha Maker', 'Mitron - Service', 'F&B Service', '25-Jan-01', '13-Dec-21', ''),
(61, 1501, 'Sushant Ashok Panchal', 'DJ', 'Mitron - Others', 'F&B - Others', '03-Jul-92', '01-May-22', ''),
(62, 706, 'Sanjay Ganpat Papale', 'Jr. Sous Chef', 'Mitron - Kitchen', 'F&B - Kitchen', '01-Jun-80', '14-Nov-18', ''),
(63, 2500, 'Jamaluddin Ansari', 'C.D.P.', 'Mitron - Kitchen', 'F&B - Kitchen', '12-Jul-00', '02-Nov-24', ''),
(64, 2040, 'Dipak Jena', 'C.D.P.', 'Mitron - Kitchen', 'F&B - Kitchen', '04-Feb-80', '01-Oct-23', ''),
(65, 2464, 'Md Rizwan', 'D.C.D.P.', 'Mitron - Kitchen', 'F&B - Kitchen', '14-Oct-97', '24-Oct-24', ''),
(66, 2584, 'Tejas Harichandra More', 'D.C.D.P.', 'Mitron - Kitchen', '', '', '13-Jan-25', ''),
(67, 1828, 'Ajaysingh Shersingh Saud', 'Commi - I', 'Mitron - Kitchen', 'F&B - Kitchen', '22-Apr-88', '01-Sep-23', ''),
(68, 2186, 'Vivek Singh', 'Commi - I', 'Mitron - Kitchen', 'F&B - Kitchen', '01-May-01', '12-Jun-23', ''),
(69, 2512, 'Biswanath Majumdar', 'Commi - I', 'Mitron - Kitchen', 'F&B - Kitchen', '06-Feb-03', '12-Nov-24', ''),
(70, 1735, 'Jay Prakash', 'Commi - II', 'Mitron - Kitchen', 'F&B - Kitchen', '01-Jan-95', '15-Aug-22', ''),
(71, 2084, 'Virendra', 'Commi - II', 'Mitron - Kitchen', 'F&B - Kitchen', '10-Jul-88', '01-Dec-23', ''),
(72, 2329, 'Jullul Hoque', 'KST', 'Mitron - Kitchen', 'F&B - Kitchen', '01-Jan-03', '8-May-24', ''),
(73, 1880, 'Parth Dharmen Joshi', 'PR', 'OPA - Others', 'F&B - Others', '22-Jun-93', '14-Jul-23', ''),
(74, 156, 'Karamvir Singh Gandhi', 'PR', 'OPA - Others', 'F&B - Others', '27-Apr-92', '01-Oct-15', ''),
(75, 1540, 'Saniya Khan', 'PR', 'OPA - Others', 'F&B - Others', '11-Jul-95', '01-Jun-22', ''),
(76, 1208, 'Asif Shaikh', 'PR', 'OPA - Others', 'F&B - Others', '14-Aug-88', '01-Nov-19', ''),
(77, 1567, 'Vaibhav Lodha', 'PR', 'OPA - Others', 'F&B - Others', '15-Nov-97', '01-Dec-18', ''),
(78, 1209, 'Darshak Shetty', 'PR', 'OPA - Others', 'F&B - Others', '24-Mar-96', '19-Sep-21', ''),
(79, 2012, 'Sushant Chowta', 'PR', 'OPA - Others', 'F&B - Others', '11-May-90', '01-Aug-23', ''),
(80, 1400, 'Hitesh Sharma', 'PR', 'OPA - Others', 'F&B - Others', '21-Sep-89', '01-Aug-23', ''),
(81, 1141, 'Afzal Siddique', 'PR', 'OPA - Others', 'F&B - Others', '25-Sep-85', '01-Mar-24', ''),
(82, 1894, 'Nadeem Barbar', 'PR', 'OPA - Others', 'F&B - Others', '31-May-94', '13-Aug-24', ''),
(83, 2431, 'Kamna Puran Singh', 'PR', 'OPA - Others', 'F&B - Others', '13-May-99', '24-Sep-24', ''),
(84, 2513, 'Mohd Juned Khan', 'PR', 'OPA - Others', 'F&B - Others', '11-Dec-98', '08-Nov-24', ''),
(85, 1883, 'Antonio Ernest Jude', 'Light Designer', 'OPA - Others', 'F&B - Others', '07-Jun-73', '20-Jul-23', ''),
(86, 160, 'Rohit Jadhav', 'DJ', 'OPA - Others', 'F&B - Others', '07-Jul-92', '01-May-16', ''),
(87, 2194, 'Akshay Patil', 'Assistant DJ', 'OPA - Others', 'F&B - Others', '18-May-95', '01-Jan-24', ''),
(88, 2401, 'Saurabh Bhagat Singh Parmar', 'DJ', 'OPA - Others', 'F&B - Others', '18-May-95', '01-Aug-24', ''),
(89, 1450, 'Bipin Rai', 'Operation Manager', 'OPA -  Service', 'F&B Service', '18-Oct-85', '01-Apr-22', ''),
(90, 805, 'Sabinus Barbose', 'ARM', 'OPA -  Service', 'F&B Service', '28-Mar-86', '10-Jan-19', ''),
(91, 200, 'Sagar Katak Shahi', 'ARM', 'OPA -  Service', 'F&B Service', '11-Jun-93', '07-Nov-15', ''),
(92, 2435, 'Sharan Shankar Shetty', 'Mixologist', 'OPA -  Service', 'F&B Service', '27-Dec-91', '04-Oct-24', ''),
(93, 2372, 'Precious Thapa', 'Asst. GRM', 'OPA -  Service', 'F&B Service', '24-Jan-96', '25-Jun-24', ''),
(94, 1488, 'Mohammed Hannan Mohammed Asif Shaikh', 'Sr. GRE', 'OPA -  Service', 'F&B Service', '29-Nov-97', '17-May-22', ''),
(95, 2314, 'Prakriti Rai', 'GRE', 'OPA -  Service', 'F&B Service', '07-Feb-03', '23-Apr-24', ''),
(96, 2320, 'Wahid - Ur - Rahman', 'GRE', 'OPA -  Service', 'F&B Service', '23-Apr-01', '18-Apr-24', ''),
(97, 2350, 'Satish Khaire', 'Cashier', 'OPA -  Service', 'F&B Service', '07-Jun-98', '27-May-24', ''),
(98, 1718, 'Atul More', 'Cashier', 'OPA -  Service', 'F&B Service', '04-Feb-94', '03-Feb-23', ''),
(99, 2563, 'Vinay Pratap Rao', 'Cashier', 'OPA -  Service', 'OPA - Service', '', '28-Dec-24', ''),
(100, 2388, 'Vipin Rajesh Gupta', 'Barista Supervisor', 'OPA -  Service', 'F&B - Service', '', '10-Jul-24', ''),
(101, 561, 'Lawerence Coutinho', 'Sr. Bartender', 'OPA -  Service', 'F&B Service', '27-Jan-79', '01-Aug-18', ''),
(102, 198, 'Mahesh Gowda', 'Sr. Bartender', 'OPA -  Service', 'F&B Service', '30-Mar-95', '12-Aug-16', ''),
(103, 1555, 'Dashrathi Bairi', 'Bar Supervisor', 'OPA -  Service', 'F&B Service', '07-Aug-24', '07-Aug-24', ''),
(104, 2453, 'Karan Viran ', 'Bartender', 'OPA -  Service', 'F&B Service', '08-Jan-02', '14-Oct-24', ''),
(105, 1497, 'Deependra Nirpa Singh', 'Bartender', 'OPA -  Service', 'F&B Service', '12-May-98', '23-May-22', ''),
(106, 1576, 'Nitin Kishore Jadhav', 'Bartender', 'OPA -  Service', 'F&B Service', '28-Jan-90', '20-Aug-22', ''),
(107, 2533, 'Sagar Punit Shukla', 'Bartender', 'OPA -  Service', 'OPA - Service', '18-Nov-02', '02-Dec-24', ''),
(108, 2565, 'Basudeva Behera', 'Bartender', 'OPA -  Service', '', '', '02-Jan-25', ''),
(109, 1510, 'Ashutosh Vikas Khandage', 'Asst Bartender', 'OPA -  Service', 'F&B Service', '11-Sep-98', '01-Jun-22', ''),
(110, 1755, 'Ravikaran Manohar Nadar', 'Asst Bartender', 'OPA -  Service', 'F&B Service', '20-Apr-96', '23-Mar-23', ''),
(111, 2514, 'Krishna Kashinath Das', 'Bar Back', 'OPA -  Service', 'F&B Service', '15-Oct-01', '07-Nov-24', ''),
(112, 1866, 'Deepak Omprakash Rajbhar', 'Bar Back', 'OPA -  Service', 'F&B Service', '21-Jun-01', '22-Jun-23', ''),
(113, 202, 'Bidyadhar Ojha', 'Sr. Captain', 'OPA -  Service', 'F&B Service', '14-Jun-91', '18-Apr-17', ''),
(114, 899, 'Mangal Chand', 'Captain', 'OPA -  Service', 'F&B Service', '21-May-94', '16-Feb-19', ''),
(115, 2076, 'Sumeet Chand', 'Captain', 'OPA -  Service', 'F&B Service', '22-Jul-02', '10-Nov-23', ''),
(116, 1834, 'Bijay Kumar Mahakud', 'Tr. Captain', 'OPA -  Service', 'F&B Service', '05-Apr-96', '01-Jun-23', ''),
(117, 1349, 'Suraj Dilip Hode', 'Sr. Steward', 'OPA -  Service', 'F&B Service', '08-Nov-95', '03-Feb-20', ''),
(118, 2572, 'MD Atthar Hussain', 'Sr. Steward', 'OPA -  Service', '', '', '07-Jan-25', ''),
(119, 1624, 'Darshan Santosh Pawar', 'Steward', 'OPA -  Service', 'F&B Service', '11-Feb-98', '01-Oct-22', ''),
(120, 967, 'Chetan Babu Shibe', 'Steward', 'OPA -  Service', 'F&B Service', '13-Sep-93', '06-Apr-19', ''),
(121, 796, 'Noor Mohammad', 'Steward', 'OPA -  Service', 'F&B Service', '11-Nov-99', '27-Nov-18', ''),
(122, 207, 'Ram Bogati ', 'Steward', 'OPA -  Service', 'F&B Service', '12-Mar-93', '17-Jul-16', ''),
(123, 1435, 'Alden Allan D\'Souza', 'Steward', 'OPA -  Service', 'F&B Service', '30-Oct-89', '16-Mar-22', ''),
(124, 1689, 'Ajinkya Manohar Nagotkar', 'Steward', 'OPA -  Service', 'F&B Service', '31-Dec-90', '19-Dec-22', ''),
(125, 234, 'Mohd Rajakul', 'Steward', 'OPA -  Service', 'F&B Service', '20-May-97', '12-Aug-17', ''),
(126, 1424, 'Raushan Kumar', 'Asst Steward', 'OPA -  Service', 'F&B Service', '02-Nov-99', '08-Mar-22', ''),
(127, 1431, 'Rizwan Alam', 'Asst Steward', 'OPA -  Service', 'F&B Service', '03-Oct-04', '12-Mar-22', ''),
(128, 2552, 'Shebaj Alam', 'Asst. Steward', 'OPA -  Service', 'OPA - Service', '11-Aug-04', '18-Dec-24', ''),
(129, 1627, 'Nitesh Kahar', 'Asst. Steward', 'OPA -  Service', 'OPA - Service', '', '19-Dec-24', ''),
(130, 1729, 'Mousar Alam', 'Tr. Steward', 'OPA -  Service', 'F&B Service', '12-Apr-04', '17-Feb-23', ''),
(131, 1563, 'Amin Dawood Shaikh', 'Sheesha Executive', 'OPA -  Service', 'F&B Service', '25-Jul-97', '01-Dec-20', ''),
(132, 1204, 'Abu Fazal', 'Sheesha Maker', 'OPA -  Service', 'F&B Service', '01-Jan-95', '15-Sep-19', ''),
(133, 1201, 'Md Mudassir', 'Sheesha Maker', 'OPA -  Service', 'F&B Service', '15-Jan-98', '18-Feb-22', ''),
(134, 1565, 'Md Najim Raja', 'Sheesha Maker', 'OPA -  Service', 'F&B Service', '01-Jan-93', '01-Nov-21', ''),
(135, 2027, 'Arun Das', 'Sheesha Maker', 'OPA -  Service', 'F&B Service', '01-Jan-96', '13-Sep-23', ''),
(136, 1710, 'Rajkumar Malo Saheblal Malo', 'Sheesha Maker', 'OPA -  Service', 'F&B Service', '25-Apr-96', '23-Jan-23', ''),
(137, 2098, 'Akmal Hussain', 'Sheesha Maker', 'OPA -  Service', 'F&B Service', '05-Feb-99', '11-Feb-23', ''),
(138, 2104, 'Suneet Bharadwaj', 'Sous Chef', 'OPA -  Kitchen', 'OPA -  Kitchen', '09-Nov-89', '18-Dec-23', ''),
(139, 167, 'Rajkumar Singh', 'Sous Chef', 'OPA -  Kitchen', 'OPA -  Kitchen', '20-Mar-88', '21-Sep-15', ''),
(140, 171, 'Shivkumar Markandey Singh', 'C.D.P.', 'OPA -  Kitchen', 'OPA -  Kitchen', '05-Nov-91', '01-Jul-21', ''),
(141, 2200, 'Raj Mondal', 'C.D.P.', 'OPA -  Kitchen', 'OPA -  Kitchen', '01-Jan-96', '05-Mar-24', ''),
(142, 1658, 'Ravi Naike Singh', 'D.C.D.P.', 'OPA -  Kitchen', 'OPA -  Kitchen', '24-Apr-87', '01-Nov-22', ''),
(143, 767, 'Mithun Biswas', 'D.C.D.P.', 'OPA -  Kitchen', 'OPA -  Kitchen', '25-Apr-94', '18-Nov-15', ''),
(144, 177, 'Kishor Debnath', 'D.C.D.P.', 'OPA -  Kitchen', 'OPA -  Kitchen', '19-Sep-91', '12-Apr-17', ''),
(145, 1436, 'Balram Singh', 'Commi - I', 'OPA -  Kitchen', 'OPA -  Kitchen', '12-May-95', '17-Mar-22', ''),
(146, 1856, 'Amit Mondal', 'Commi - I', 'OPA -  Kitchen', 'OPA -  Kitchen', '05-Aug-95', '15-Jun-23', ''),
(147, 1307, 'Rahul Kamlesh Singh', 'Commi - I', 'OPA -  Kitchen', 'OPA -  Kitchen', '06-Jul-94', '01-Jul-21', ''),
(148, 2604, 'Manik Bairagi', 'Commi - I', 'F&B Production', 'F&B Kitchen', '10-Jan-89', '13-Feb-25', ''),
(149, 2576, 'Amit Shailendr Shinde', 'Commi - III', 'OPA -  Kitchen', '', '', '13-Jan-25', ''),
(150, 1096, 'Brojen Saha', 'KST', 'OPA -  Kitchen', 'OPA -  Kitchen', '03-Jul-74', '01-Jul-21', ''),
(151, 1677, 'Rahul Saroj', 'KST', 'OPA -  Kitchen', 'OPA -  Kitchen', '01-Jan-96', '25-Nov-22', ''),
(152, 2062, 'Mozafar Ali', 'KST', 'OPA -  Kitchen', 'OPA -  Kitchen', '02-Apr-04', '16-Jan-24', ''),
(153, 1260, 'Dhirendra', 'KST', 'OPA -  Kitchen', 'OPA -  Kitchen', '', '27-Sep-24', ''),
(154, 2510, 'Nigel Pereira', 'RM', 'Waikiki - Service', 'F&B Service', '09-Jun-90', '11-Jul-24', ''),
(155, 2323, 'Arun Kanoujiya', 'ARM', 'Waikiki - Service', 'F&B Service', '26-Jun-84', '6-May-24', ''),
(156, 2118, 'Deepak Korango', 'Beverage Manager', 'Waikiki - Service', 'F&B Service', '20-Apr-86', '02-Jan-24', ''),
(157, 2165, 'Namjailungliu Ngonamai', 'Asst. GRM', 'Waikiki - Service', 'F&B Service', '07-Aug-95', '13-Feb-24', ''),
(158, 2590, 'Prashika Pariyar', 'GRM', 'Waikiki - Service', 'F&B Service', '07-Aug-95', '29-Jan-25', ''),
(159, 2432, 'Fiza Akram Khan', 'GRE ', 'Waikiki - Service', 'F&B Service', '02-Jun-01', '24-Sep-24', ''),
(160, 2203, 'Santosh Rawlo', 'Sr. Cashier', 'Waikiki - Service', 'F&B Service', '18-Aug-83', '05-Mar-24', ''),
(161, 2120, 'Gulam Rabbani', 'Cashier', 'Waikiki - Service', 'F&B Service', '05-May-00', '04-Jan-24', ''),
(162, 2305, 'Rohid Alam', 'Cashier', 'Waikiki - Service', 'F&B Service', '15-Oct-04', '18-Apr-24', ''),
(163, 2138, 'Darshan Raut', 'F&B Executive', 'Waikiki - Service', 'F&B Service', '27-Jul-97', '23-Jan-24', ''),
(164, 2290, 'Javed Ansari', 'F&B Executive', 'Waikiki - Service', 'F&B Service', '07-Sep-94', '02-Apr-24', ''),
(165, 2415, 'Jameer Rasool Ahmed Umbardi', 'F&B Executive', 'Waikiki - Service', 'F&B Service', '24-Jul-94', '03-Sep-24', ''),
(166, 2586, 'Samir Rasool Ahmad Umbardi', 'F&B Executive', 'Waikiki - Service', 'F&B Service', '', '15-Jan-25', ''),
(167, 2595, 'Abhishek Tiwari', 'F&B Execitive', 'Waikiki - Service', 'F&B Service', '27-May-97', '04-Feb-25', ''),
(168, 2522, 'Toiying W Konyak', 'Runner', 'Waikiki - Service', 'F&B Service', '16-Jul-02', '21-Nov-24', ''),
(169, 2192, 'Arun Rathod', 'Runner', 'Waikiki - Service', 'F&B Service', '01-Apr-02', '27-Feb-24', ''),
(170, 2274, 'Vaillabh Amberkar', 'Bar Supervisor', 'Waikiki - Service', 'F&B Service', '05-Sep-96', '19-Mar-24', ''),
(171, 2276, 'Arjun Rathod', 'Sr. Bartender', 'Waikiki - Service', 'F&B Service', '18-May-93', '19-Mar-24', ''),
(172, 2164, 'Naresh Khangaha', 'Asst. Bar Supervisor', 'Waikiki - Service', 'F&B Service', '29-Dec-99', '13-Feb-24', ''),
(173, 2277, 'Japit Kannojiya', 'Asst. Bartender', 'Waikiki - Service', 'F&B Service', '04-May-00', '19-Mar-24', ''),
(174, 2313, 'Kishan Singh', 'Bartender', 'Waikiki - Service', 'F&B Service', '16-Jul-98', '23-Apr-24', ''),
(175, 2142, 'Mayuresh Sawant', 'Bartender', 'Waikiki - Service', 'F&B Service', '15-Apr-97', '23-Jan-24', ''),
(176, 2177, 'Ankur Shetye', 'Bartender', 'Waikiki - Service', 'F&B Service', '23-May-96', '20-Feb-24', ''),
(177, 2275, 'Manoj Sonar', 'Bartender', 'Waikiki - Service', 'F&B Service', '15-Nov-99', '19-Mar-24', ''),
(178, 2357, 'Sunil Guguloth', 'Bartender', 'Waikiki - Service', 'F&B Service', '13-May-01', '11-Jun-24', ''),
(179, 2156, 'Shailesh Dhegabhai', 'Barback', 'Waikiki - Service', 'F&B Service', '24-Aug-01', '06-Feb-24', ''),
(180, 2171, 'Shubham Bhumbak', 'Barback', 'Waikiki - Service', 'F&B Service', '14-Dec-02', '13-Feb-24', ''),
(181, 2266, 'Sonu Singh Bora', 'Barback', 'Waikiki - Service', 'F&B Service', '06-Feb-04', '19-Mar-24', ''),
(182, 2392, 'Pauthianlam', 'Barback', 'Waikiki - Service', 'F&B Service', '03-Feb-99', '16-Jul-24', ''),
(183, 2404, 'Juned Hashmi', 'Barback', 'Waikiki - Service', 'F&B Service', '01-Jan-05', '02-Aug-24', ''),
(184, 2414, 'Alex Felix D\'souza', 'Sr. Steward', 'Waikiki - Service', 'F&B Service', '05-May-92', '3-Sep-24', ''),
(185, 2439, 'Athang Tayade', 'Steward', 'Waikiki - Service', 'F&B Service', '19-Apr-99', '8-Oct-24', ''),
(186, 2597, 'Adarsh Mishra', 'Steward', 'Waikiki - Service', 'Waikiki - Service', '01-Jul-01', '06-Feb-25', ''),
(187, 2508, 'Zoramsangi', 'Stewardess', 'Waikiki - Service', 'F&B Service', '10-Jan-99', '7-Nov-24', ''),
(188, 2546, 'Sarfraj', 'Sheesha Maker', 'Waikiki - Service', 'F&B Service', '01-Jan-92', '08-Mar-22', ''),
(189, 2367, 'Sahil Gaikwad', 'DJ', 'Waikiki - Others', 'F&B Others', '06-Mar-97', '8-May-24', ''),
(190, 2462, 'Rahul Chaudhary', 'PR ', 'Waikiki - Others', 'F&B - Others', '12-Jun-91', '25-Oct-24', ''),
(191, 2589, 'Tejaswini Raghunath Honkhande', 'PR ', 'Waikiki - Others', 'F&B Others', '28-Jul-00', '01-Oct-24', ''),
(192, 2379, 'Harpreet Singh Bhatti', 'Head Chef', 'Waikiki - Kitchen', 'F&B Kitchen', '03-Jan-94', '28-Jun-24', ''),
(193, 2270, 'Sujit Mondal', 'Jr. Sous Chef', 'Waikiki - Kitchen', 'F&B Kitchen', '28-Apr-93', '19-Mar-24', ''),
(194, 2387, 'Narendra Magar', 'C.D.P.', 'Waikiki - Kitchen', 'F&B - Kitchen', '10-Aug-94', '11-Jul-24', ''),
(195, 2520, 'Jagu Ram', 'C.D.P.', 'Waikiki - Kitchen', 'F&B - Kitchen', '10-Aug-94', '19-Nov-24', ''),
(196, 2531, 'Ashis Maity', 'DCDP', 'Waikiki - Kitchen', '', '', '30-Nov-24', ''),
(197, 2511, 'Bharat Khadka', 'Commi - I', 'Waikiki - Kitchen', 'F&B Kitchen', '01-Nov-00', '01-Nov-24', ''),
(198, 2519, 'Abodh Bilekh Mandal', 'Commi - I', 'Waikiki - Kitchen', 'F&B Kitchen', '01-Jan-97', '20-Nov-24', ''),
(199, 2523, 'Navraj Girir', 'Commi - I', 'Waikiki - Kitchen', 'F&B - Kitchen', '01-Jan-00', '20-Nov-24', ''),
(200, 2529, 'Sandeep Singh', 'Commi - II', 'Waikiki - Kitchen', 'F&B Kitchen', '15-Jun-97', '26-Nov-24', ''),
(201, 2461, 'Rehan Shaikh', 'Commi - II', 'Waikiki - Kitchen', 'F&B - Kitchen', '12-Nov-03', '22-Oct-24', ''),
(202, 2341, 'Shabez Khan', 'Commi - III', 'Waikiki - Kitchen', 'F&B Kitchen', '27-Jul-99', '21-May-24', ''),
(203, 2459, 'Deepak Saini', 'Commi - III', 'Waikiki - Kitchen', 'F&B - Kitchen', '11-Nov-01', '19-Oct-24', ''),
(204, 2537, 'Kailash Dhani Singh', 'Commi - III', 'Waikiki - Kitchen', '', '', '01-Nov-24', ''),
(205, 2255, 'Manoj Kumar', 'KST', 'Waikiki - Kitchen', 'Waikiki - Kitchen', '05-Apr-97', '13-Mar-24', ''),
(206, 2449, 'Jitendra Kumar', 'KST', 'Waikiki - Kitchen', 'F&B - Kitchen', '01-Jan-97', '12-Oct-24', ''),
(207, 1882, 'Aparna Ashok Shinde', 'Sous Chef', 'Cocomaya ', 'F&B Kitchen', '25-Mar-92', '01-Jun-22', ''),
(208, 2283, 'Amol Khanvilkar', 'C.D.P.', 'Cocomaya ', 'F&B Kitchen', '28-Feb-93', '26-Mar-24', ''),
(209, 2502, 'Manoj Maruti Salvi', 'C.D.P.', 'Cocomaya ', 'F&B - Kitchen', '07-Jan-87', '01-Nov-24', ''),
(210, 2562, 'Neha Tabassum', 'C.D.P.', 'Cocomaya', 'Pastry', '', '26-Dec-24', ''),
(211, 2553, 'Mahesh Prabhu Chinde', 'C.D.P.', 'Cocomaya', 'Bakery', '20-Apr-85', '20-Dec-24', ''),
(212, 2409, 'Himanshu Kundan Singh', 'Commi - II', 'Cocomaya ', 'Cocoamaya', '28-Jan-01', '20-Aug-24', ''),
(213, 2600, 'Virendra Pathani', 'Commi - II', 'Cocoamaya', 'Bakery', '01-Dec-01', '01-Dec-25', ''),
(214, 2418, 'Ashish Singh', 'Commi - III', 'Cocomaya ', 'F&B Kitchen', '31-Jul-05', '11-Sep-24', ''),
(215, 2601, 'Sanjana Kailas Jadhav', 'Commi - III', 'Cocoamaya', 'Bakery', '07-Feb-02', '08-Feb-25', ''),
(216, 1808, 'Md Mubarak', 'KST', 'Cocomaya ', 'F&B Kitchen', '29-Oct-05', '01-May-23', ''),
(217, 1840, 'Dharamraj', 'KST', 'Cocomaya ', 'F&B Kitchen', '09-Jul-88', '08-Jun-23', ''),
(218, 2457, 'Sanni Shroff', 'KST', 'Cocomaya ', 'F&B - Kitchen', '26-Feb-02', '17-Oct-24', ''),
(219, 2398, 'Babbi Laljibaba Patni', 'Shopkeeper', 'Cocomaya ', 'F&B Kitchen', '23-Jan-98', '22-Jul-24', ''),
(220, 35, 'Sikandar Asgar Ansari', 'Executive Chef', 'F&B Production', 'Main Kitchen', '04-Jun-86', '01-Oct-24', ''),
(221, 2371, 'Anil Chhetri', 'Sr. Sous Chef', 'F&B Production', 'Main Kitchen', '16-Aug-71', '26-Jun-24', ''),
(222, 2196, 'Sunil Bohat', 'Sous Chef', 'F&B Production', 'Main Kitchen', '12-May-77', '05-Mar-24', ''),
(223, 269, 'Satendra Rajendra Singh', 'Sous Chef', 'F&B Production', 'Main Kitchen', '01-Jan-71', '08-May-07', ''),
(224, 280, 'Ajay Bahadur Thapa', 'Sous Chef', 'F&B Production', 'Main Kitchen', '10-Jan-82', '16-Oct-08', ''),
(225, 304, 'Sunil Thale', 'Sous Chef', 'F&B Production', 'Butchary', '29-Jun-65', '02-Mar-07', ''),
(226, 1554, 'Sohansingh Dayalsingh Rawat', 'Jr. Sous Chef', 'F&B Production', 'Main Kitchen', '27-Jul-73', '20-Jul-22', ''),
(227, 270, 'Jodh Singh Jeet Singh Chauhan', 'Jr. Sous Chef', 'F&B Production', 'Main Kitchen', '20-Apr-64', '24-Sep-07', ''),
(228, 291, 'Kamaljeet', 'Sr. C.D.P', 'F&B Production', 'Main Kitchen', '15-Sep-82', '17-Dec-10', ''),
(229, 1693, 'Prakash Dev Chand', 'C.D.P.', 'F&B Production', 'Halwai', '27-Oct-91', '23-Dec-22', ''),
(230, 1663, 'Ganesh Dev Balayar', 'C.D.P.', 'F&B Production', 'Main Kitchen', '20-Jul-85', '07-Nov-22', ''),
(231, 2420, 'Anish Sunar', 'C.D.P.', 'F&B Production', 'Main Kitchen', '17-Jan-04', '17-Sep-24', ''),
(232, 281, 'Surendra Thakur', 'C.D.P.', 'F&B Production', 'Main Kitchen', '04-Apr-91', '01-Nov-21', ''),
(233, 2556, 'Ramesh Lokbahadur Bishukarma', 'CDP', 'F&B Production', 'Asian', '30-Dec-88', '21-Dec-24', ''),
(234, 1287, 'Sanjay Shankar Kaintura', 'D.C.D.P.', 'F&B Production', 'Main Kitchen', '19-Jul-84', '01-Oct-21', ''),
(235, 282, 'Rajendra Kumar Raut', 'D.C.D.P.', 'F&B Production', 'Main Kitchen', '02-Jun-90', '18-Oct-13', ''),
(236, 286, 'Basudev Dhanuk Roy', 'D.C.D.P.', 'F&B Production', 'Main Kitchen', '31-Dec-87', '19-Oct-10', ''),
(237, 1158, 'Mohd Said', 'D.C.D.P.', 'F&B Production', 'Halwai', '15-Oct-95', '15-Feb-13', ''),
(238, 1459, 'Suresh Kumar', 'D.C.D.P.', 'F&B Production', 'Main Kitchen', '14-May-96', '01-Nov-24', ''),
(239, 288, 'Khimanand', 'Commi - I', 'F&B Production', 'Main Kitchen', '01-Jan-93', '06-Nov-21', ''),
(240, 353, 'Dayal Singh ', 'Commi - I', 'F&B Production', 'Main Kitchen', '19-Oct-92', '06-Nov-21', ''),
(241, 362, 'Md. Musha', 'Commi - I', 'F&B Production', 'Main Kitchen', '13-Nov-96', '01-Oct-23', ''),
(242, 1825, 'Ranjeet Singh', 'Commi - I', 'F&B Production', 'Main Kitchen', '15-May-97', '11-Oct-23', ''),
(243, 2042, 'Sunder Jitsingh Vishwakarma', 'Commi - I', 'F&B Production', 'Sushi', '07-Jan-98', '27-Feb-24', ''),
(244, 299, 'Brenden Peris', 'Commi - I', 'F&B Production', 'Main Kitchen', '19-Sep-94', '08-Nov-21', ''),
(245, 398, 'Sanjay Kumar', 'Commi - I', 'F&B Production', 'Halwai', '10-Oct-98', '04-Nov-22', ''),
(246, 2162, 'Adesh BK', 'Commi - I', 'F&B Production', 'Main Kitchen', '08-Jul-02', '13-Feb-24', ''),
(247, 2579, 'Ishvar Trivedi', 'Commi - I', 'F&B Production', '', '', '11-Jan-25', ''),
(248, 2589, 'Chait Singh Negi', 'Commi - I', 'F&B Production', '', '', '24-Jan-25', ''),
(249, 2594, 'Hariram Gangaram Chaudhari', 'Commi - I', 'F&B Production', 'Indian', '15-Nov-00', '01-Feb-25', ''),
(250, 2082, 'Ashish Satavalekar', 'Commi - II', 'F&B Production', 'Main Kitchen', '21-Feb-01', '24-Nov-23', ''),
(251, 1570, 'Santosh', 'Commi - II', 'F&B Production', 'Butchary', '13-Apr-93', '11-Aug-22', ''),
(252, 2134, 'Rajesh Panwar', 'Commi - II', 'F&B Production', 'Main Kitchen', '24-Jun-98', '06-Feb-24', ''),
(253, 2155, 'Sahil Anant Narkar', 'Commi - II', 'F&B Production', 'Main Kitchen', '14-Mar-02', '08-Sep-22', ''),
(254, 1877, 'Jahedul', 'Commi - II', 'F&B Production', 'Main Kitchen', '01-Jan-98', '13-Feb-24', ''),
(255, 1256, 'Julmat Ali', 'Commi - II', 'F&B Production', 'Main Kitchen', '10-Dec-03', '20-May-22', ''),
(256, 1319, 'Bablu Ghatwar', 'Commi - II', 'F&B Production', 'Main Kitchen', '02-Mar-98', '21-Dec-18', ''),
(257, 2551, 'Ravi Kumar', 'Commi - II', 'F&B Production', 'Asian', '', '17-Dec-24', ''),
(258, 2592, 'Suraj Rawat', 'Commi - II', 'F&B Production', 'Indian', '06-Feb-02', '01-Feb-25', ''),
(259, 2593, 'Dharamveer Pujari', 'Commi - II', 'F&B Production', 'Conti', '15-Aug-03', '01-Feb-25', ''),
(260, 1702, 'Prathik Raghu Shetty', 'Commi - III', 'F&B Production', 'Main Kitchen', '15-Dec-99', '15-Jul-23', ''),
(261, 2046, 'Suresh Bishwakarma', 'Commi - III', 'F&B Production', 'Main Kitchen', '16-Jul-05', '06-Oct-18', ''),
(262, 2143, 'Mohammad Naushad Ansari', 'Commi - III', 'F&B Production', 'Main Kitchen', '05-Jul-95', '17-Nov-24', ''),
(263, 2048, 'Akshata Amol Jadhav', 'Commi - III', 'F&B Production', 'Main Kitchen', '14-Jun-01', '27-Dec-11', ''),
(264, 2159, 'Tejas Makwana', 'Commi - III', 'F&B Production', 'Main Kitchen', '17-Jan-06', '27-Oct-21', ''),
(265, 1896, 'Niyaz Alam', 'Commi - III', 'F&B Production', 'Main Kitchen', '15-Nov-01', '16-Jan-24', ''),
(266, 1813, 'Mukesh Kumar', 'Commi - III', 'F&B Production', 'Staff Cafeteria', '11-May-89', '11-Oct-23', ''),
(267, 1490, 'Vaibhav', 'Commi - III', 'F&B Production', 'Staff Cafeteria', '15-Apr-02', '28-Apr-17', ''),
(268, 1496, 'Rahul Ghatwar', 'Commi - III', 'F&B Production', 'Asian', '01-Jan-01', '03-Sep-22', ''),
(269, 1680, 'Shivam', 'Commi - III', 'F&B Production', 'Staff Cafeteria', '05-Sep-01', '03-Dec-22', ''),
(270, 2548, 'Ramzan Israil Chaudhary', 'Commi - III', 'F&B Production', 'Asian', '02-Dec-01', '17-Dec-24', ''),
(271, 2549, 'Ansari Mohammed Tariq Mohammed Arif', 'Commi - III', 'F&B Production', 'Asian', '02-Nov-01', '16-Dec-24', ''),
(272, 2201, 'Dhruv Naik', 'Commi - III', 'F&B Production', 'Main Kitchen', '', '05-Mar-24', ''),
(273, 395, 'Ashok Singh', 'KST Supervisor', 'F&B Production', 'Main Kitchen', '03-Oct-93', '19-May-22', ''),
(274, 1645, 'Hira Singh', 'KST Supervisor', 'F&B Production', 'Main Kitchen', '14-Apr-80', '20-May-22', ''),
(275, 1492, 'Mohammad Majod', 'KST', 'F&B Production', 'Main Kitchen', '01-May-97', '15-Feb-22', ''),
(276, 1584, 'Istiyak Ahmad', 'KST', 'F&B Production', 'Main Kitchen', '06-Feb-85', '16-Feb-23', ''),
(277, 1707, 'Akash', 'KST', 'F&B Production', 'Main Kitchen', '15-Apr-04', '05-Aug-23', ''),
(278, 2061, 'Jiaraf Ali ', 'KST', 'F&B Production', 'Main Kitchen', '22-Jun-05', '06-Feb-24', ''),
(279, 2330, 'Sukur Ali', 'KST', 'F&B Production', 'Main Kitchen', '29-Aug-95', '8-May-24', ''),
(280, 400, 'Parvati', 'KST', 'F&B Production', 'Staff Cafeteria', '01-Jan-75', '04-Dec-22', ''),
(281, 2280, 'Asadul Islam', 'KST', 'F&B Production', 'Staff Cafeteria', '01-Jan-05', '23-Mar-24', ''),
(282, 2285, 'Rahyan Raja', 'KST', 'F&B Production', 'Staff Cafeteria', '02-Mar-93', '27-Mar-24', ''),
(283, 2427, 'Imran Ali', 'KST', 'F&B Production', 'Main Kitchen', '03-Jul-06', '01-Sep-24', ''),
(284, 2446, 'Salman Sahil', 'KST', 'F&B Production', 'Main Kitchen', '09-Oct-01', '09-Oct-24', ''),
(285, 2425, 'Ashraful Alam', 'KST', 'F&B Production', 'Main Kitchen', '27-Nov-03', '20-Sep-24', ''),
(286, 1657, 'Amar Saroj', 'KST', 'F&B Production', 'Main Kitchen', '27-Nov-03', '26-Nov-24', ''),
(287, 2536, 'Aktar', 'KST', 'F&B Production', 'F&B Production', '16-Aug-00', '03-Dec-24', ''),
(288, 2555, 'Manish', 'KST', 'F&B Production', 'F&B Production', '10-Jan-02', '21-Dec-24', ''),
(289, 2535, 'Anwar', 'KST', 'F&B Production', 'F&B Production', '15-Dec-01', '03-Dec-24', ''),
(290, 1320, 'Amanat Ulla', 'KST', 'F&B Production', 'F&B Production', '', '07-Feb-25', ''),
(291, 17, 'Santosh K Shetty', 'Asst Bqt Mgr', 'Banquets', 'F&B Service', '07-Nov-79', '14-Oct-09', ''),
(292, 352, 'Manoj Chandra Joshi', 'Asst Bqt Mgr', 'Banquets', 'F&B Service', '08-Jul-85', '16-Jun-07', ''),
(293, 1508, 'Amit Lavesh Bhosale', 'Sr. Captain', 'Banquets', 'F&B Service', '04-Aug-84', '31-Aug-21', ''),
(294, 351, 'Harish Hari Bisht', 'Sr. Captain', 'Banquets', 'F&B Service', '21-Apr-88', '07-Aug-07', ''),
(295, 1646, 'Pawan Dhani Singh', 'Captain', 'Banquets', 'F&B Service', '05-Jun-82', '11-Oct-22', ''),
(296, 261, 'Bisikesan Malik', 'Captain', 'Banquets', 'F&B Service', '14-Jan-96', '08-Mar-16', ''),
(297, 1504, 'Sanjay Kumar Bind', 'Sr. Steward', 'Banquets', 'F&B Service', '26-Dec-93', '26-Sep-20', ''),
(298, 260, 'Umesh Vasant Kamble', 'Sr. Steward', 'Banquets', 'F&B Service', '06-May-91', '01-Jan-16', ''),
(299, 1532, 'Hemant Ashok Gaonkar', 'Steward', 'Banquets', 'F&B Service', '29-Nov-96', '23-Jun-22', ''),
(300, 1717, 'Shibaraj Kunwar', 'Steward', 'Banquets', 'F&B Service', '25-Mar-87', '03-Feb-23', ''),
(301, 1742, 'Raj Bahadur', 'Steward', 'Banquets', 'F&B Service', '01-Jan-94', '09-Mar-23', ''),
(302, 1480, 'Anita Maurya', 'Steward', 'Banquets ', 'F&B - Service', '17-Jun-97', '05-Nov-24', ''),
(303, 1649, 'Sumit Kumar Pradhan', 'Bartender', 'Banquets', 'F&B Service', '10-Aug-99', '19-Oct-22', ''),
(304, 1452, 'Sampada Rane', 'Asst DM', 'Front Office', 'Front Office', '04-Dec-86', '03-Apr-23', ''),
(305, 1559, 'Abhishek Sarat Mohanty', 'Sr. FOE', 'Front Office', 'Front Office', '05-Feb-95', '01-Aug-22', ''),
(306, 1310, 'Akash Mithilesh Kumar Singh', 'FOE', 'Front Office', 'Front Office', '13-May-99', '03-Jan-22', ''),
(307, 2085, 'Rohit Bhosale', 'FOE', 'Front Office', 'Front Office', '05-Sep-98', '25-Nov-23', ''),
(308, 2445, 'Rohit Satish Paradkar', 'FOS', 'Front Office', 'Front Office', '25-May-91', '09-Oct-24', ''),
(309, 2150, 'Ruchita Banadavara', 'FOA', 'Front Office', 'Front Office', '13-Aug-00', '01-Feb-24', ''),
(310, 2296, 'Rishita Baranwal', 'FOA', 'Front Office', 'Front Office', '24-May-01', '09-Apr-24', ''),
(311, 995, 'Ramesh Rawat', 'Bell Boy', 'Front Office', 'Front Office', '15-Oct-89', '18-Jul-21', ''),
(312, 1589, 'Rahul Tripathi', 'Bell Boy', 'Front Office', 'Front Office', '24-May-88', '07-Sep-22', ''),
(313, 2585, 'Atharva Sharad Vichare', 'Bell Boy', 'Front Office', '', '', '15-Jan-25', ''),
(314, 2133, 'Mohammed Tariq Chaudhary', 'Transport Cashier', 'Front Office', 'Front Office', '17-Oct-02', '16-Jan-24', ''),
(315, 727, 'Vimal Kumar Harigen Pal ', 'Chauffeur', 'Front Office', 'Front Office', '20-Feb-80', '01-Jan-19', ''),
(316, 384, 'Arjun Singh Nandram Singh', 'Chauffeur', 'Front Office', 'Front Office', '18-Sep-83', '24-Dec-11', ''),
(317, 383, 'Hark Bahadur Rawat', 'Chauffeur', 'Front Office', 'Front Office', '18-Jan-83', '06-Mar-11', ''),
(318, 1138, 'Dhirendra Singh', 'Chauffeur', 'Front Office', 'Front Office', '11-Jul-85', '02-Oct-19', ''),
(319, 387, 'Santosh B. Prasad Dwivedi', 'Chauffeur', 'Front Office', 'Front Office', '02-Jun-70', '26-Jul-15', ''),
(320, 229, 'Afsar Kadar Khan', 'Chauffeur', 'Front Office', 'Front Office', '16-Sep-77', '14-Dec-14', ''),
(321, 386, 'Kuldeep Yadav', 'Chauffeur', 'Front Office', 'Front Office', '01-Jan-85', '13-Feb-16', ''),
(322, 1272, 'Umesh Yadav', 'Chauffeur', 'Front Office', 'Front Office', '15-Jul-79', '15-Nov-21', ''),
(323, 391, 'Rajendra Prasad Yadav', 'Chauffeur', 'Front Office', 'Front Office', '14-Aug-80', '12-Jun-23', ''),
(324, 2050, 'Sunil Singh', 'Chauffeur', 'Front Office', 'Front Office', '01-Jan-88', '17-Oct-23', ''),
(325, 2336, 'Ashok Yadav', 'Chauffeur', 'Front Office', 'Front Office', '01-Jan-85', '14-May-24', ''),
(326, 2400, 'Ram Pal', 'Chauffeur', 'Front Office', 'Front Office', '30-Aug-76', '29-Jul-24', ''),
(327, 2024, 'Hira Tej Singh', 'Chauffeur', 'Front Office', 'Front Office', '26-Apr-84', '17-Jul-24', ''),
(328, 2515, 'Abhishek Pal', 'Chauffeur', 'Front Office', 'Front Office', '16-Mar-02', '15-Nov-24', ''),
(329, 1263, 'Tulasi Ram', 'Hotel Vehicle Cleaner', 'Front Office', 'Front Office', '07-Mar-03', '01-Nov-21', ''),
(330, 2575, 'Mahendra Singh Bhandari', 'Chauffeur', 'Front Office', 'Front Office', '', '13-Jan-25', ''),
(331, 1276, 'Madhu Chandrika Vichare', 'Executive Housekeeper ', 'House Keeping', 'House Keeping', '04-Jun-86', '21-Oct-21', ''),
(332, 373, 'Rahul Dinkar Waghode', 'H.K.Executive', 'House Keeping', 'House Keeping', '22-Mar-85', '20-Sep-12', ''),
(333, 753, 'Kamal Singh Kunwar Singh Negi', 'Linen Supervisor', 'House Keeping', 'House Keeping', '01-Jan-92', '15-Dec-18', ''),
(334, 1761, 'Naresh Sawardekar', 'HK Supervisor', 'House Keeping', 'House Keeping', '02-Jun-75', '27-Mar-23', ''),
(335, 1294, 'Anup Patel', 'HK Supervisor', 'House Keeping', 'House Keeping', '01-Jul-98', '17-Nov-21', ''),
(336, 2058, 'Kiran Rajaram Bandgar', 'HK Supervisor', 'House Keeping', 'House Keeping', '07-Oct-91', '23-Oct-23', ''),
(337, 328, 'Indra Mohan Kumar', 'Supervisor Horticulture', 'House Keeping', 'House Keeping', '01-Jan-91', '17-Jul-21', ''),
(338, 2122, 'Arif Ahmed', 'HK Supervisor', 'House Keeping', 'House Keeping', '02-May-99', '08-Jan-24', ''),
(339, 2365, 'Ashish Shinde', 'HK Supervisor', 'House Keeping', 'House Keeping', '18-Oct-89', '18-Jun-24', ''),
(340, 367, 'N Srihari Dora', 'HK Associate', 'House Keeping', 'House Keeping', '23-Aug-74', '15-Mar-08', ''),
(341, 701, 'Seema Opendra Singh', 'HK Associate', 'House Keeping', 'House Keeping', '24-Jan-98', '17-Nov-18', ''),
(342, 2136, 'Usha Singh', 'HK Associate', 'House Keeping', 'House Keeping', '24-Nov-92', '23-Jan-24', ''),
(343, 902, 'Usha  Rajesh  Patekar', 'HK Associate', 'House Keeping', 'House Keeping', '19-Jul-82', '23-Jul-16', ''),
(344, 336, 'Santosh Parbat Shinde', 'HK Associate', 'House Keeping', 'House Keeping', '01-Jun-80', '09-Dec-14', ''),
(345, 1461, 'Hira Rakesh Barshingnath', 'HK Associate', 'House Keeping', 'House Keeping', '17-Apr-85', '09-Apr-15', ''),
(346, 486, 'Amit Sah', 'HK Associate', 'House Keeping', 'House Keeping', '01-Jan-93', '14-Jul-21', ''),
(347, 339, 'Balaram Mahalik', 'HK Associate', 'House Keeping', 'House Keeping', '16-May-89', '21-Nov-17', ''),
(348, 1301, 'Sarika Pandurang Gorad', 'HK Associate', 'House Keeping', 'House Keeping', '23-Jul-89', '12-Dec-21', ''),
(349, 2123, 'Vindeshwar Ram', 'HK Associate', 'House Keeping', 'House Keeping', '16-Aug-98', '23-Jan-24', ''),
(350, 2448, 'Noor Afsa Khan', 'HK Associate', 'House Keeping', 'House Keeping', '14-Jan-03', '10-Oct-24', ''),
(351, 1433, 'Shamshad Khan', 'HK Associate', 'House Keeping', 'House Keeping', '01-Jun-96', '15-Mar-22', ''),
(352, 1612, 'Uday Ghatwar', 'HK Associate', 'House Keeping', 'House Keeping', '12-May-03', '21-Sep-22', ''),
(353, 2447, 'Sagar Santosh Ingle', 'HK Associate', 'House Keeping', 'House Keeping', '04-Aug-05', '11-Oct-24', ''),
(354, 1668, 'Afzal Umar Ali Shaikh', 'HK Associate', 'House Keeping', 'House Keeping', '13-Apr-87', '12-Nov-22', ''),
(355, 1674, 'Ramesh Ram', 'HK Associate', 'House Keeping', 'House Keeping', '05-Jan-03', '21-Nov-22', ''),
(356, 2528, 'Ruthik Shinde', 'HK Associate', 'House Keeping', 'House Keeping', '', '', ''),
(357, 1722, 'Karim Uddin', 'HK Associate', 'House Keeping', 'House Keeping', '11-May-02', '11-Feb-23', ''),
(358, 1760, 'Abhisek Ghatwar', 'HK Associate', 'House Keeping', 'House Keeping', '01-Jan-04', '26-Mar-23', ''),
(359, 1827, 'Anil Shantaram Pawar', 'Gardner', 'House Keeping', 'House Keeping', '25-Jun-84', '24-May-23', ''),
(360, 1835, 'Nadim ', 'HK Associate', 'House Keeping', 'House Keeping', '27-Jan-99', '02-Jun-23', ''),
(361, 1895, 'Nitish Kamat', 'HK Associate', 'House Keeping', 'House Keeping', '11-Sep-05', '05-Aug-23', ''),
(362, 1651, 'MD. Naimul Haque', 'HK Associate', 'House Keeping', 'House Keeping', '03-Jan-99', '19-Oct-23', ''),
(363, 1688, 'Mohammed Irfan Shaikh', 'HK Associate', 'House Keeping', 'House Keeping', '07-May-00', '23-Dec-23', ''),
(364, 2198, 'Ashish Kumar', 'HK Associate', 'House Keeping', 'House Keeping', '15-May-02', '05-Mar-24', ''),
(365, 2252, 'Samir Pardale', 'HK Associate', 'House Keeping', 'House Keeping', '05-Sep-91', '13-Mar-24', ''),
(366, 2282, 'Surendra Madas', 'HK Associate', 'House Keeping', 'House Keeping', '01-Jun-93', '27-Mar-24', ''),
(367, 2334, 'Shamsir Ali', 'HK Associate', 'House Keeping', 'House Keeping', '06-Feb-02', '15-May-24', ''),
(368, 2335, 'Anamika Vishwakarma', 'HK Desk Attendant', 'House Keeping', 'House Keeping', '01-Feb-01', '15-May-24', ''),
(369, 2430, 'Musud Raza ', 'HK Associate', 'House Keeping', 'House Keeping', '11-May-95', '23-Sep-24', ''),
(370, 2530, 'Akshat Mahale', 'HK Associate', 'House Keeping', 'House Keeping', '11-May-95', '17-Nov-24', ''),
(371, 2560, 'Ronjon Tisso', 'HK Associate', 'House Keeping', 'Housekeeping', '17-Oct-98', '12-Dec-24', ''),
(372, 2574, 'Irmiya Bading', 'HK Associate', 'House Keeping', 'Housekeeping', '', '09-Jan-25', ''),
(373, 2580, 'Ribul Haque', 'HK Associate', 'House Keeping', 'Housekeeping', '', '14-Jan-25', ''),
(374, 2599, 'Rohitson Tisso', 'HK Associate', 'House Keeping', 'Housekeeping', '27-Feb-02', '05-Feb-25', ''),
(375, 1795, 'Ghanshyam', 'Junior Engineer Trainee', 'Engineering', 'Engineering', '12-Oct-91', '08-May-23', ''),
(376, 129, 'Ajay Pratap Singh', 'A.C. Technician', 'Engineering', 'Engineering', '20-Apr-87', '13-Sep-12', ''),
(377, 140, 'Pramod Kumar Behera', 'Sr. Electrician', 'Engineering', 'Engineering', '22-Aug-82', '01-Jan-20', ''),
(378, 128, 'Biswojit Biswas', 'Sr. AC Technician ', 'Engineering', 'Engineering', '01-Aug-69', '11-May-12', ''),
(379, 136, 'Ajay Kumar Yadav', 'Electrician', 'Engineering', 'Engineering', '10-Jul-93', '08-Feb-12', ''),
(380, 135, 'Santosh Prabhakar Patra', 'Electrician', 'Engineering', 'Engineering', '21-Jul-73', '26-Nov-10', ''),
(381, 1111, 'Manoj Kumar', 'Carpenter', 'Engineering', 'Engineering', '22-Dec-95', '19-Aug-19', ''),
(382, 1275, 'Durgesh Kumar Gupta', 'Carpenter', 'Engineering', 'Engineering', '10-Sep-90', '15-Nov-21', ''),
(383, 1309, 'Umesh Mohan Aravandekar', 'Electrician', 'Engineering', 'Engineering', '11-Sep-79', '24-Mar-07', ''),
(384, 1474, 'Rupesh Shantaram Rasal', 'Electrician', 'Engineering', 'Engineering', '11-Dec-91', '26-Apr-22', ''),
(385, 1494, 'Kallu Makku Saroj', 'Painter', 'Engineering', 'Engineering', '01-Jan-71', '20-May-22', ''),
(386, 1487, 'Leeroy Lyan Martis', 'Electrician', 'Engineering', 'Engineering', '11-Aug-95', '10-May-22', ''),
(387, 1536, 'Swarajya Pani Grahi', 'Mason', 'Engineering', 'Engineering', '01-Jan-73', '25-Jun-22', ''),
(388, 1577, 'Vinod Kumar', 'Painter', 'Engineering', 'Engineering', '01-Jan-96', '22-Aug-22', ''),
(389, 1422, 'Rakesh Raju Malayattil', ' Vigilance & Security', 'Security', 'Security', '05-Dec-89', '24-Feb-22', ''),
(390, 2410, 'Ajay Narayan Khedekar', 'Vigilance and Safety Officer', 'Security', 'Security', '31-Oct-75', '23-Aug-24', ''),
(391, 2386, 'Saif Ali Qureshi', 'Vigilance Officer', 'Security', 'Security', '20-Apr-97', '25-Jun-24', ''),
(392, 1429, 'Irfan Hussain Chunawala', 'Protection Officer', 'Security', 'Security', '30-Jul-87', '01-Mar-22', ''),
(393, 1428, 'Chandrakala Muddu Kotian', 'Lady Protection Officer', 'Security', 'Security', '04-Jun-78', '01-Mar-22', ''),
(394, 1591, 'Rukhsana Siraj Sayyed', 'Protection Officer', 'Security', 'Security', '15-Oct-80', '06-Sep-22', ''),
(395, 1616, 'Seema Vishnu Yadav', 'Security Guard', 'Security', 'Security', '02-May-86', '26-Sep-22', ''),
(396, 884, 'Nishikant Painingankar', 'Protection Officer', 'Security', 'Security', '20-Jul-90', '10-Feb-18', ''),
(397, 1768, 'Nilu Gupta', 'Security Controller', 'Security', 'Security', '26-Aug-94', '01-Apr-23', ''),
(398, 1871, 'Sandesh Vijay Singh', 'Protection Officer', 'Security', 'Security', '07-Sep-93', '05-Jul-23', ''),
(399, 2009, 'Jayesh Solanki', 'Protection Officer', 'Security', 'Security', '24-Mar-90', '16-Aug-23', ''),
(400, 2008, 'Aarti Chawan', 'Protection Officer', 'Security', 'Security', '08-Sep-90', '16-Aug-23', ''),
(401, 2021, 'Rohit Suresh Singh', 'Head Protection Officer', 'Security', 'Security', '30-Jun-93', '02-Sep-23', ''),
(402, 2109, 'Shahzeb Khan', 'Protection Officer', 'Security', 'Security', '10-Mar-03', '01-Dec-23', ''),
(403, 2382, 'Priya Dinesh Pawar', 'Lady Protection Office', 'Security', 'Security', '17-Dec-91', '01-Jul-24', ''),
(404, 2532, 'Mohd Zuher Khan', 'Vigilance Officer', 'Security', 'Security', '20-Aug-00', '01-Dec-24', ''),
(405, 2363, 'Balbinder Santosh Sharma', 'Purchase Manager', 'Procurement', 'Procurement', '23-Jul-76', '12-Jun-24', ''),
(406, 1317, 'Swapnil Shankar Gurav', 'Purchase Manager', 'Procurement', 'Procurement', '14-Jul-89', '01-Dec-16', ''),
(407, 2302, 'Lavu Dahibavkar', 'Store Manager', 'Procurement', 'Procurement', '16-Oct-89', '17-Apr-24', ''),
(408, 1129, 'Rupesh Krishna Karve', 'Storekeeper', 'Procurement', 'Procurement', '01-Jul-89', '03-Dec-19', ''),
(409, 2052, 'Ketan Ashok Ghavali', 'Storekeeper', 'Procurement', 'Procurement', '04-Nov-93', '14-Jan-24', ''),
(410, 2160, 'Saharabano Shaikh', 'Storekeeper', 'Procurement', 'Procurement', '19-Mar-00', '13-Feb-24', ''),
(411, 1575, 'Dinesh Laxman Ghadge', 'Storekeeper', 'Procurement', 'Procurement', '16-Dec-80', '15-Aug-24', ''),
(412, 1546, 'Ravikant Ramhajur Vishwakarma', 'IT Associate', 'IT', 'IT', '20-Jul-89', '06-Jul-22', ''),
(413, 2471, 'Vinothkumar', 'IT Manager', 'IT', 'IT', '22-Aug-90', '11-Sep-24', ''),
(414, 2451, 'Shadab Akhter', 'IT Executive', 'IT', 'IT', '05-Nov-94', '14-Oct-24', ''),
(415, 2581, 'Mohd Qaddafi Qureshi', 'IT Associate', 'IT', 'IT', '05-Nov-94', '15-Jan-25', ''),
(416, 116, 'Rohit J Shetty', 'Liasoning Executive', 'Liasioning', 'Liasioning', '20-Feb-84', '21-Aug-08', ''),
(417, 120, 'Sudhakar Annappa Shellyagol', 'Liasoning Officer', 'Liasioning', 'Liasioning', '22-Jun-80', '03-Jul-12', ''),
(418, 25, 'Suresh Mohan Singh', 'Liasoning Officer', 'Liasioning', 'Liasioning', '08-Oct-75', '20-Jun-08', ''),
(419, 2364, 'Kedar Harchilkar', 'Finance Head', 'Accounts', 'Accounts', '03-Jun-73', '17-Jun-24', ''),
(420, 188, 'Shamrao Bhimrao Waghode', 'Asst. Acc Manager', 'Accounts', 'Accounts', '26-Apr-98', '01-Apr-05', ''),
(421, 2403, 'Harshavardhan Dnyandev Kadam', 'Accounts Executive', 'Accounts', 'Accounts', '01-Apr-95', '01-Aug-24', ''),
(422, 2455, 'Bhavika Vikas Katekar', 'Accounts Executive', 'Accounts', 'Accounts', '12-Oct-02', '17-Oct-24', ''),
(423, 2541, 'Anjana Iyer', 'Accounts Executive', 'Accounts', 'Accounts', '', '09-Dec-24', ''),
(424, 2053, 'Mahesh Anand Devadiga', 'Asst. Manager Controls', 'F&B Control', 'F&B Control', '20-Jan-86', '20-Oct-23', ''),
(425, 764, 'Paresh Ravindra Kambli', 'Assistant F&B Controller', 'F&B Control', 'F&B Control', '03-Jan-83', '07-Dec-21', ''),
(426, 2316, 'Sachin Vaidya', 'HR Manager', 'Human Resources', 'Human Resources', '06-Feb-76', '24-Apr-24', ''),
(427, 1723, 'Priyanka Munnalal Valmiki', 'HR Associate', 'Human Resources', 'Human Resources', '09-Sep-97', '13-Feb-23', ''),
(428, 2091, 'Aryan Opendra Singh', 'HR Associate', 'Human Resources', 'Human Resources', '26-Jan-04', '04-Dec-23', ''),
(429, 2543, 'Wajid Ali Khan', 'HR Executive', 'Human Resources', 'Human Resources', '05-Jul-89', '11-Dec-24', ''),
(430, 2573, 'Pawan Samarth  Bansod', 'Sales Manager', 'Sales', '', '', '08-Jan-25', ''),
(431, 2319, 'Kirthi Shetty', 'Hotel Operations Manager', 'Admin', 'Admin', '27-Oct-77', '26-Apr-24', ''),
(432, NULL, 'Rohit Iyer', 'Consultant', 'OPA - Others', 'F&B - Others', '', '', ''),
(433, 1438, 'Jagdish Rai', 'Consultant', 'Café Crema ', 'F&B Service', '', '19-Mar-22', ''),
(434, 1329, 'Hitesh Prataprai Goradia', 'Consultant', 'Accounts', 'Accounts', '', '01-Apr-21', ''),
(435, 2564, 'Ankit Arjun Singh', 'OJT Chinese', 'Main Kitchen', '', '', '01-Jan-25', ''),
(436, 2606, 'Bishes Singh', 'OJT', 'F&B Production', 'F&B Production', '', '15-Feb-25', ''),
(437, 2591, 'Emmanuel Fernandes', 'OJT ', 'Waikiki Service', '', '', '28-Jan-25', ''),
(438, 2605, 'Hrishikesh Borkar', 'OJT', 'Waikiki - Service', 'Waikiki - Service', '', '14-Feb-25', ''),
(439, 2351, 'Vaishnavi Patil', 'OJT', 'Café Crema ', 'Café Crema', '', '1-Jun-24', ''),
(440, NULL, 'Narayan Gujar', 'Trafic Controler', 'Security', 'Security', '', '01-Aug-22', ''),
(441, NULL, 'Pradip Dhivar Kumar', 'Trafic Controler', 'Security', 'Security', '', '24-Nov-21', '');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `leave_type` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `employee_id`, `leave_type`, `start_date`, `end_date`, `reason`, `status`, `created_at`) VALUES
(1, NULL, 'Sick', '2025-03-02', '2025-03-03', '', 'Pending', '2025-03-02 09:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `salary_payments`
--

CREATE TABLE `salary_payments` (
  `id` int(11) NOT NULL,
  `Emp_No` int(11) DEFAULT NULL,
  `Month` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Employee_Name` varchar(255) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `Section_Outlet` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `DOB` varchar(255) DEFAULT NULL,
  `DOJ` varchar(255) DEFAULT NULL,
  `DOL` int(11) DEFAULT NULL,
  `Actual_Salary` varchar(255) DEFAULT NULL,
  `Basic` varchar(255) DEFAULT NULL,
  `DA` varchar(255) DEFAULT NULL,
  `HRA` varchar(255) DEFAULT NULL,
  `CONV` varchar(255) DEFAULT NULL,
  `Monthly_Gross_Salary` varchar(255) DEFAULT NULL,
  `Emper_PF` varchar(255) DEFAULT NULL,
  `Emper_ESIC` varchar(255) DEFAULT NULL,
  `Stat_Bonus` varchar(255) DEFAULT NULL,
  `Grauity` varchar(255) DEFAULT NULL,
  `Monthly_CTC` varchar(255) DEFAULT NULL,
  `Empee_PF` varchar(255) DEFAULT NULL,
  `Empee_ESIC` varchar(255) DEFAULT NULL,
  `PT` varchar(255) DEFAULT NULL,
  `TDS` varchar(255) DEFAULT NULL,
  `Monthly_Net_Salary` varchar(255) DEFAULT NULL,
  `Total_Days` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary_payments`
--

INSERT INTO `salary_payments` (`id`, `Emp_No`, `Month`, `Title`, `Employee_Name`, `Designation`, `Department`, `Section_Outlet`, `Gender`, `DOB`, `DOJ`, `DOL`, `Actual_Salary`, `Basic`, `DA`, `HRA`, `CONV`, `Monthly_Gross_Salary`, `Emper_PF`, `Emper_ESIC`, `Stat_Bonus`, `Grauity`, `Monthly_CTC`, `Empee_PF`, `Empee_ESIC`, `PT`, `TDS`, `Monthly_Net_Salary`, `Total_Days`) VALUES
(1, 1, 'Feb\'25', 'Mr.', 'Shashikanthi Shetty', 'MD ', 'Corporate', 'Corporate', 'Male', '11-Apr-69', '01-Jul-07', NULL, '1,50,616', '75,308', '7,616', '37,654', '30,038', '1,50,616', '1,800', ' ', '-   ', ' ', '-   ', '3,989', '1,56,405', '1,800', ' ', '-   ', ' '),
(2, 2, 'Feb\'25', 'Mr.', 'Karunakar Shetty', 'CMD', 'Corporate', 'Corporate', 'Male', '17-Jul-50', '01-Dec-22', NULL, '7,00,000', '3,50,000', '7,616', '1,75,000', '1,67,384', '7,00,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '17,201', '7,17,201', ' ', '-   ', ' '),
(3, 3, 'Feb\'25', 'Ms.', 'Vinaya Shetty', 'CMD', 'Corporate', 'Corporate', 'Female', '', '01-Dec-22', NULL, '3,00,000', '1,50,000', '7,616', '75,000', '67,384', '3,00,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '7,581', '3,07,581', ' ', '-   ', ' '),
(4, 4, 'Feb\'25', 'Mr.', 'Satish Shetty', 'MD ', 'Corporate', 'Corporate', 'Male', '10-Jun-60', '01-Apr-22', NULL, '1,50,000', '75,000', '7,616', '37,500', '29,884', '1,50,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '3,974', '1,53,974', ' ', '-   ', ' '),
(5, 5, 'Feb\'25', 'Mr.', 'Rahul Shetty', 'Director', 'Corporate', 'Corporate', 'Male', '04-Mar-86', '01-Apr-22', NULL, '1,50,000', '75,000', '7,616', '37,500', '29,884', '1,50,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '3,974', '1,53,974', ' ', '-   ', ' '),
(6, 6, 'Feb\'25', 'Mr.', 'Gautam Shetty', 'Director', 'Corporate', 'Corporate', 'Male', '29-Mar-90', '01-Mar-22', NULL, '1,50,000', '75,000', '7,616', '37,500', '29,884', '1,50,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '3,974', '1,53,974', ' ', '-   ', ' '),
(7, 7, 'Feb\'25', 'Mr.', 'Gaurav Shetty', 'Director', 'Corporate', 'Corporate', 'Male', '01-Jan-70', '01-Mar-22', NULL, '3,00,000', '1,50,000', '7,616', '75,000', '67,384', '3,00,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '7,581', '3,07,581', ' ', '-   ', ' '),
(8, 8, 'Feb\'25', 'Ms.', 'Diksha Shetty', 'Director', 'Corporate', 'Corporate', 'Female', '23-Aug-', '01-May-22', NULL, '70,000', '35,000', '7,616', '17,500', '9,884', '70,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '2,050', '72,050', ' ', '-   ', ' '),
(9, 2368, 'Feb\'25', 'Ms.', 'Kusum Yadav', 'Restaurant Manager', 'Café Crema ', 'F&B - Service', 'Female', '15-May-97', '24-Jun-24', NULL, '50,000', '25,000', '7,616', '12,500', '4,884', '50,000', '1,800', ' ', '-   ', ' ', '-   ', '1,569', '53,369', '1,800', ' ', '-   ', '200'),
(10, 238, 'Feb\'25', 'Mr.', 'Rajesh Ramesh Kamble', 'Assistant Rest. Manager', 'Café Crema ', 'F&B - Service', 'Male', '06-Sep-74', '13-Mar-12', NULL, '41,372', '20,686', '7,616', '10,343', '2,727', '41,372', '1,800', ' ', '-   ', ' ', '-   ', '1,361', '44,533', '1,800', ' ', '-   ', '200'),
(11, 2369, 'Feb\'25', 'Ms.', 'Carolyn', 'GRE', 'Café Crema ', 'F&B - Service', 'Female', '04-Jun-01', '25-Jun-24', NULL, '22,000', '11,000', '7,616', '1,100', '2,284', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', ' '),
(12, 1806, 'Feb\'25', 'Mr.', 'Dhiraj Lokhande', 'Barista ', 'Café Crema ', 'F&B - Service', 'Male', '19-Sep-99', '15-May-23', NULL, '18,672', '9,336', '7,616', '934', '786', '18,672', '1,800', '607', ' ', '-   ', '815', '21,894', '1,800', '141', '200', '', '16,531'),
(13, 2569, 'Feb\'25', 'Mr.', 'Md.Hanif Chandsaheb Baig', 'Barista ', 'Café Crema ', 'F&B - Service', 'Male', '02-Oct-92', '04-Jan-25', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', '1,800', ' ', '-   ', ' ', '-   ', '968', '27,768', '1,800', ' ', '-   ', '200'),
(14, 253, 'Feb\'25', 'Mr.', 'Akhtar Ali', 'Sr. Captain', 'Café Crema ', 'F&B - Service', 'Male', '20-Aug-88', '28-Dec-13', NULL, '21,672', '10,836', '7,616', '1,084', '2,136', '21,672', ' ', '-   ', ' ', '-   ', ' ', '-   ', '888', '22,560', ' ', '-   ', ' '),
(15, 243, 'Feb\'25', 'Mr.', 'Sudam Charan Mahanty', 'Sr. Captain', 'Café Crema ', 'IRD', 'Male', '17-Jun-92', '18-Apr-13', NULL, '21,672', '10,836', '7,616', '1,084', '2,136', '21,672', '1,800', ' ', '-   ', ' ', '-   ', '888', '24,360', '1,800', ' ', '-   ', '200'),
(16, 2352, 'Feb\'25', 'Mr.', 'Nikhil Bakore', 'Captain', 'Café Crema ', 'F&B - Service', 'Male', '03-Jun-85', '01-Jun-24', NULL, '17,000', '8,500', '7,616', '850', '34', '17,000', '1,800', '553', ' ', '-   ', '775', '20,128', '1,800', '128', '200', '', '14,872'),
(17, 2408, 'Feb\'25', 'Mr.', 'Raju Ram Luhar', 'Captain', 'Café Crema ', 'IRD', 'Male', '27-Jul-86', '20-Aug-24', NULL, '18,000', '9,000', '7,616', '900', '484', '18,000', ' ', '-   ', '585', ' ', '-   ', '799', '19,384', ' ', '-   ', '135', '200'),
(18, 2568, 'Feb\'25', 'Mr.', 'Vishnu Suresh Kuldipake', 'Tr. Captain', 'Café Crema ', 'F&B - Service', 'Male', '04-Dec-98', '01-Jan-25', NULL, '17,000', '8,500', '7,616', '850', '34', '17,000', '1,800', '553', ' ', '-   ', '775', '20,128', '1,800', '128', '200', '', '14,872'),
(19, 1530, 'Feb\'25', 'Mr.', 'Kalpit Kishor Mhatre', 'Asst. Bartender', 'Café Crema ', 'F&B - Service', 'Male', '06-Feb-03', '22-Jun-22', NULL, '17,420', '8,710', '7,616', '1,094', ' ', '-   ', '17,420', '1,800', '567', ' ', '-   ', '785', '20,572', '1,800', '131', '200', ''),
(20, 2526, 'Feb\'25', 'Mr.', 'Abhijit Dhirendra Satapathy', 'Sr. Steward', 'Café Crema ', 'F&B - Service', 'Male', '15-May-00', '22-Nov-24', NULL, '17,000', '8,500', '7,616', '850', '34', '17,000', ' ', '-   ', '553', ' ', '-   ', '775', '18,328', ' ', '-   ', '128', '200'),
(21, 151, 'Feb\'25', 'Mr.', 'Nirpa Budha', 'Sr. Steward', 'Café Crema ', 'IRD', 'Male', '22-Dec-80', '25-Oct-21', NULL, '17,420', '8,710', '7,616', '1,094', ' ', '-   ', '17,420', '1,800', '567', ' ', '-   ', '785', '20,572', '1,800', '131', '200', ''),
(22, 2561, 'Feb\'25', 'Mr.', 'Shahid Akhtar Ansari', 'Sr. Steward', 'Café Crema ', 'F&B - Service', 'Male', '17-Dec-78', '21-Dec-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', ' ', '-   ', '520', ' ', '-   ', '751', '17,271', ' ', '-   ', '120'),
(23, 2554, 'Feb\'25', 'Ms.', 'Rubita Murgesh Shetty', 'Steward', 'Café Crema ', 'F&B - Service', 'Female', '20-Mar-01', '20-Dec-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(24, 429, 'Feb\'25', 'Mr.', 'Vinod Rajak', 'Steward', 'Café Crema ', 'IRD', 'Male', '11-Apr-84', '12-Feb-16', NULL, '22,420', '11,210', '7,616', '1,121', '2,473', '22,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '906', '23,326', ' ', '-   ', ' '),
(25, 1407, 'Feb\'25', 'Mr.', 'Md Ibrar', 'Steward', 'Café Crema ', 'IRD', 'Male', '01-Jan-92', '10-Jan-22', NULL, '17,420', '8,710', '7,616', '1,094', ' ', '-   ', '17,420', '1,800', '567', ' ', '-   ', '785', '20,572', '1,800', '131', '200', ''),
(26, 1779, 'Feb\'25', 'Mr.', 'Raja Ansari', 'Steward', 'Café Crema ', 'IRD', 'Male', '01-Jan-96', '19-Apr-23', NULL, '15,500', '7,884', '7,616', ' ', '-   ', ' ', '-   ', '15,500', '1,800', '504', ' ', '-   ', '746', '18,550', '1,800', '117', '200'),
(27, 1799, 'Feb\'25', 'Mr.', 'Sanwar Alam', 'Steward', 'Café Crema ', 'IRD', 'Male', '19-Nov-00', '11-May-23', NULL, '14,672', '7,056', '7,616', ' ', '-   ', ' ', '-   ', '14,672', '1,761', '477', ' ', '-   ', '706', '17,616', '1,761', '111', '200'),
(28, 2140, 'Feb\'25', 'Mr.', 'Amar Znje', 'Steward', 'Café Crema ', 'IRD', 'Male', '05-Jan-03', '23-Jan-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(29, 2267, 'Feb\'25', 'Mr.', 'Rohan Vaity', 'Steward', 'Café Crema ', 'F&B - Service', 'Male', '29-Jan-02', '19-Mar-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(30, 2539, 'Feb\'25', 'Mr.', 'Alex Thomas', 'Steward', 'Café Crema ', 'F&B - Service', 'Male', '09-Jun-90', '05-Dec-24', NULL, '18,000', '9,000', '7,616', '900', '484', '18,000', '1,800', '585', ' ', '-   ', '799', '21,184', '1,800', '135', '200', '', '15,865'),
(31, 2577, 'Feb\'25', 'Mr.', 'Sankar Mahakur', 'Steward', 'Café Crema ', 'IRD', 'Male', '31-Aug-05', '10-Jan-25', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(32, 2065, 'Feb\'25', 'Ms.', 'Noori Firoz', 'Asst. Stewards', 'Café Crema ', 'F&B - Service', 'Female', '16-Jul-04', '01-Nov-23', 196, '14,616', '7,000', '7,616', '', ' ', '-   ', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', ' ', '-   '),
(33, 2064, 'Feb\'25', 'Ms.', 'Kainath Firoz', 'Asst. Stewards', 'Café Crema ', 'F&B - Service', 'Female', '22-May-03', '01-Nov-23', 196, '14,616', '7,000', '7,616', '', ' ', '-   ', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', ' ', '-   '),
(34, 2567, 'Feb\'25', 'Ms.', 'Khushi Manjeet Chandaliya', 'Tr Steward', 'Café Crema ', 'F&B - Service', 'Female', '18-May-05', '03-Jan-25', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', ' '),
(35, 478, 'Feb\'25', 'Mr.', 'Sudarshan Shekhar Shetty', 'Operation Manager', 'Mitron - Service', 'F&B - Service', 'Male', '04-Jul-80', '08-Oct-21', NULL, '53,122', '26,561', '7,616', '13,280', '5,665', '53,122', '1,800', ' ', '-   ', ' ', '-   ', '1,644', '56,566', '1,800', ' ', '-   ', '200'),
(36, 891, 'Feb\'25', 'Mr.', 'Mahesh Londhe', 'Restaurant Manager', 'Mitron - Service', 'F&B - Service', 'Male', '14-Jun-89', '26-Dec-19', NULL, '42,000', '21,000', '7,616', '10,500', '2,884', '42,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,376', '43,376', ' ', '-   ', ' '),
(37, 256, 'Feb\'25', 'Mr.', 'Ramesh K Poojari', 'Floor Manager', 'Mitron - Service', 'F&B - Service', 'Male', '01-Feb-77', '01-Jan-15', NULL, '38,036', '19,018', '7,616', '9,509', '1,893', '38,036', '1,800', ' ', '-   ', ' ', '-   ', '1,281', '41,117', '1,800', ' ', '-   ', '200'),
(38, 938, 'Feb\'25', 'Mr.', 'Vivek Kadam', 'ARM', 'Mitron - Service', 'F&B - Service', 'Male', '25-Aug-90', '01-Mar-19', NULL, '35,000', '17,500', '7,616', '8,750', '1,134', '35,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,208', '36,208', ' ', '-   ', ' '),
(39, 730, 'Feb\'25', 'Mr.', 'Arshad Choudhary', 'GRM', 'Mitron - Service', 'F&B - Service', 'Male', '03-Feb-98', '18-Jul-18', NULL, '29,672', '14,836', '7,616', '1,484', '5,736', '29,672', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,080', '30,752', ' ', '-   ', ' '),
(40, 833, 'Feb\'25', 'Mr.', 'Suhas Devdas Panchal', 'Cashier', 'Mitron - Service', 'F&B - Service', 'Male', '16-Nov-85', '13-Jan-19', NULL, '24,420', '12,210', '7,616', '1,221', '3,373', '24,420', '1,800', ' ', '-   ', ' ', '-   ', '954', '27,174', '1,800', ' ', '-   ', '200'),
(41, 1507, 'Feb\'25', 'Mr.', 'Ritesh Sharma', 'Cashier', 'Mitron - Service', 'F&B - Service', 'Male', '20-Jul-93', '02-Jun-22', NULL, '24,420', '12,210', '7,616', '1,221', '3,373', '24,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '954', '25,374', ' ', '-   ', ' '),
(42, 1442, 'Feb\'25', 'Mr.', 'Sandesh Kumar Bayarabettu', 'Cashier', 'Mitron - Service', 'F&B - Service', 'Male', '05-Oct-82', '25-Mar-22', NULL, '18,420', '9,210', '7,616', '921', '673', '18,420', '1,800', '599', ' ', '-   ', '809', '21,628', '1,800', '139', '200', '', '16,281'),
(43, 1254, 'Feb\'25', 'Mr.', 'Ruvel  Viegas', 'Sr. Bartender', 'Mitron - Service', 'F&B - Service', 'Male', '20-Nov-95', '16-Oct-21', NULL, '24,000', '12,000', '7,616', '1,200', '3,184', '24,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '944', '24,944', ' ', '-   ', ' '),
(44, 2516, 'Feb\'25', 'Mr.', 'Saurabh Singh Dafouti', 'Bartender', 'Mitron - Service', 'F&B - Service', 'Male', '11-Feb-04', '15-Nov-24', NULL, '17,000', '8,500', '7,616', '800', '84', '17,000', ' ', '-   ', '553', ' ', '-   ', '775', '18,328', ' ', '-   ', '128', '200'),
(45, 1417, 'Feb\'25', 'Mr.', 'Darshan Jayram Patil', 'Bartender', 'Mitron - Service', 'F&B - Service', 'Male', '18-Jun-98', '03-Mar-22', NULL, '22,000', '11,000', '7,616', '1,100', '2,284', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', '200'),
(46, 1869, 'Feb\'25', 'Mr.', 'Sumit Kumar', ' Bartender', 'Mitron - Service', 'F&B - Service', 'Male', '24-Mar-91', '24-Jun-23', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', '200', '', '17,850'),
(47, 2026, 'Feb\'25', 'Mr.', 'Nitai Bachhar', 'Asst. Bartender', 'Mitron - Service', 'F&B - Service', 'Male', '25-Jan-98', '09-Sep-23', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(48, 2602, 'Feb\'25', 'Mr.', 'Titus George Murzello', 'Asst Bartender', 'Mitron - Service', 'F&B Service', 'Male', '10-Apr-04', '07-Feb-25', NULL, '17,000', '8,500', '7,616', '766', '118', '17,000', '1,800', '553', ' ', '-   ', '775', '20,128', '1,800', '128', '200', '', '14,872'),
(49, 1640, 'Feb\'25', 'Mr.', 'Anand Philip Rosario', 'Sr. Captain', 'Mitron - Service', 'F&B - Service', 'Male', '25-Feb-87', '10-Oct-22', NULL, '22,920', '11,460', '7,616', '1,146', '2,698', '22,920', '1,800', ' ', '-   ', ' ', '-   ', '918', '25,638', '1,800', ' ', '-   ', '200'),
(50, 2434, 'Feb\'25', 'Mr.', 'Leon Vincent Vasaikar', 'Steward', 'Mitron - Service', 'F&B - Service', 'Male', '31-Aug-99', '01-Oct-24', NULL, '16,500', '8,250', '7,616', '634', ' ', '-   ', '16,500', '', '537', '', '763', '17,800', '', '124', '200', '', '16,176'),
(51, 1414, 'Feb\'25', 'Mr.', 'Ashish Rajesh Mastan', 'Steward', 'Mitron - Service', 'F&B - Service', 'Male', '26-Jun-01', '03-Mar-22', NULL, '17,920', '8,960', '7,616', '896', '448', '17,920', '1,800', '583', ' ', '-   ', '797', '21,100', '1,800', '135', '200', '', '15,785'),
(52, 1255, 'Feb\'25', 'Mr.', 'Adhiraj Sumeet Shetye', 'Steward', 'Mitron - Service', 'F&B - Service', 'Male', '23-Dec-01', '25-Oct-21', NULL, '17,920', '8,960', '7,616', '896', '448', '17,920', '1,800', '583', ' ', '-   ', '797', '21,100', '1,800', '135', '200', '', '15,785'),
(53, 236, 'Feb\'25', 'Mr.', 'Irshad Khan', 'Steward', 'Mitron - Service', 'F&B - Service', 'Male', '27-May-84', '19-Nov-18', NULL, '17,920', '8,960', '7,616', '896', '448', '17,920', '1,800', '583', ' ', '-   ', '797', '21,100', '1,800', '135', '200', '', '15,785'),
(54, 1412, 'Feb\'25', 'Mr.', 'Pintu Naik', 'Steward', 'Mitron - Service', 'F&B - Service', 'Male', '07-Apr-97', '02-Mar-22', NULL, '16,920', '8,460', '7,616', '844', ' ', '-   ', '16,920', '1,800', '550', ' ', '-   ', '773', '20,043', '1,800', '127', '200', ''),
(55, 1686, 'Feb\'25', 'Mr.', 'Yash Ganpat Lohar', 'Steward', 'Mitron - Service', 'F&B - Service', 'Male', '24-Jun-02', '15-Dec-22', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(56, 1434, 'Feb\'25', 'Mr.', 'Nikhil More', 'Steward', 'Mitron - Service', 'F&B - Service', 'Male', '24-Nov-97', '05-Mar-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(57, 1772, 'Feb\'25', 'Mr.', 'Jay Rabad', 'Steward', 'Mitron - Service', 'F&B - Service', 'Male', '25-Jan-01', '16-Apr-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(58, 2571, 'Feb\'25', 'Mr.', 'Harshad Anandam Sirra', 'Steward', 'Mitron - Service', 'F&B - Service', 'Male', '21-Jul-01', '07-Jan-25', NULL, '18,000', '9,000', '7,616', '900', '484', '18,000', '1,800', '585', ' ', '-   ', '799', '21,184', '1,800', '135', '200', '', '15,865'),
(59, 2578, 'Feb\'25', 'Mr.', 'Darshan Sanjay Satdive', 'Steward', 'Mitron - Service ', 'F&B - Service', 'Male', '11-Dec-02', '10-Jan-25', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', ' ', '-   ', '488', ' ', '-   ', '722', '16,210', ' ', '-   '),
(60, 1305, 'Feb\'25', 'Mr.', 'Guddu Anvar', 'Sheesha Maker', 'Mitron - Service', 'F&B - Service', 'Male', '25-Jan-01', '13-Dec-21', NULL, '18,420', '9,210', '7,616', '921', '673', '18,420', '1,800', '599', ' ', '-   ', '809', '21,628', '1,800', '139', '200', '', '16,281'),
(61, 1501, 'Feb\'25', 'Mr.', 'Sushant Ashok Panchal', 'DJ', 'Mitron - Others', 'F&B - Others', 'Male', '03-Jul-92', '01-May-22', NULL, '35,420', '17,710', '7,616', '8,855', '1,239', '35,420', '1,800', ' ', '-   ', ' ', '-   ', '1,218', '38,438', '1,800', ' ', '-   ', '200'),
(62, 706, 'Feb\'25', 'Mr.', 'Sanjay Ganpat Papale', 'Jr. Sous Chef', 'Mitron - Kitchen', 'F&B - Kitchen', 'Male', '01-Jun-80', '14-Nov-18', NULL, '38,420', '19,210', '7,616', '9,605', '1,989', '38,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,290', '39,710', ' ', '-   ', ' '),
(63, 2500, 'Feb\'25', 'Mr.', 'Jamaluddin Ansari', 'C.D.P.', 'Mitron - Kitchen', 'F&B - Kitchen', 'Male', '12-Jul-00', '02-Nov-24', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', '1,800', ' ', '-   ', ' ', '-   ', '968', '27,768', '1,800', ' ', '-   ', '200'),
(64, 2040, 'Feb\'25', 'Mr.', 'Dipak Jena', 'C.D.P.', 'Mitron - Kitchen', 'F&B - Kitchen', 'Male', '04-Feb-80', '01-Oct-23', NULL, '40,420', '20,210', '7,616', '10,105', '2,489', '40,420', '1,800', ' ', '-   ', ' ', '-   ', '1,338', '43,558', '1,800', ' ', '-   ', '200'),
(65, 2464, 'Feb\'25', 'Mr.', 'Md Rizwan', 'D.C.D.P.', 'Mitron - Kitchen', 'F&B - Kitchen', 'Male', '01-Jan-89', '24-Oct-24', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', '1,800', '', ' ', '-   ', '968', '27,768', '1,800', '', '200', '', '23,000'),
(66, 2584, 'Feb\'25', 'Mr.', 'Tejas Harichandra More', 'D.C.D.P.', 'Mitron - Kitchen', 'Pizza', 'Male', '11-Jan-01', '13-Jan-25', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', '1,800', ' ', '-   ', ' ', '-   ', '968', '27,768', '1,800', ' ', '-   ', '200'),
(67, 1828, 'Feb\'25', 'Mr.', 'Ajaysingh Shersingh Saud', 'Commi - I', 'Mitron - Kitchen', 'F&B - Kitchen', 'Male', '22-Apr-88', '01-Sep-23', NULL, '22,672', '11,336', '7,616', '1,134', '2,586', '22,672', '1,800', ' ', '-   ', ' ', '-   ', '912', '25,384', '1,800', ' ', '-   ', '200'),
(68, 2186, 'Feb\'25', 'Mr.', 'Vivek Singh', 'Commi - I', 'F&B Production', 'Indian', 'Male', '01-May-01', '12-Jun-23', NULL, '22,420', '11,210', '7,616', '1,121', '2,473', '22,420', '1,800', ' ', '-   ', ' ', '-   ', '906', '25,126', '1,800', ' ', '-   ', '200'),
(69, 2512, 'Feb\'25', 'Mr.', 'Biswanath Majumdar', 'Commi - I', 'Mitron - Kitchen', 'F&B - Kitchen', 'Male', '06-Feb-03', '12-Nov-24', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', '200', '', '17,850'),
(70, 1735, 'Feb\'25', 'Mr.', 'Jay Prakash', 'Commi - II', 'Mitron - Kitchen', 'F&B - Kitchen', 'Male', '01-Jan-95', '15-Aug-22', NULL, '21,000', '10,500', '7,616', '1,050', '1,834', '21,000', '1,800', '683', ' ', '-   ', '871', '24,354', '1,800', '158', '200', '', '18,842'),
(71, 2084, 'Feb\'25', 'Mr.', 'Virendra', 'Commi - II', 'Mitron - Kitchen', 'F&B - Kitchen', 'Male', '10-Jul-88', '01-Dec-23', NULL, '25,420', '12,710', '7,616', '1,271', '3,823', '25,420', '1,800', ' ', '-   ', ' ', '-   ', '978', '28,198', '1,800', ' ', '-   ', '200'),
(72, 2329, 'Feb\'25', 'Mr.', 'Jullul Hoque', 'KST', 'Mitron - Kitchen', 'F&B - Kitchen', 'Male', '01-Jan-03', '08-May-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(73, 1880, 'Feb\'25', 'Mr.', 'Parth Dharmen Joshi', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '22-Jun-93', '14-Jul-23', NULL, '80,420', '40,210', '7,616', '20,105', '12,489', '80,420', '1,800', ' ', '-   ', ' ', '-   ', '2,300', '84,520', '1,800', ' ', '-   ', '200'),
(74, 156, 'Feb\'25', 'Mr.', 'Karamvir Singh Gandhi', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '27-Apr-92', '01-Oct-15', NULL, '1,02,520', '51,260', '7,616', '25,630', '18,014', '1,02,520', '1,800', ' ', '-   ', ' ', '-   ', '2,832', '1,07,152', '1,800', ' ', '-   ', '200'),
(75, 1540, 'Feb\'25', 'Ms.', 'Saniya Khan', 'PR', 'OPA - Others', 'F&B - Others', 'Female', '11-Jul-95', '01-Jun-22', NULL, '81,372', '40,686', '7,616', '20,343', '12,727', '81,372', ' ', '-   ', ' ', '-   ', ' ', '-   ', '2,323', '83,695', ' ', '-   ', ' '),
(76, 1208, 'Feb\'25', 'Mr.', 'Asif Shaikh', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '14-Aug-88', '01-Nov-19', NULL, '55,420', '27,710', '7,616', '13,855', '6,239', '55,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,699', '57,119', ' ', '-   ', ' '),
(77, 1567, 'Feb\'25', 'Mr.', 'Vaibhav Lodha', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '15-Nov-97', '01-Dec-18', NULL, '42,128', '21,064', '7,616', '10,532', '2,916', '42,128', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,380', '43,508', ' ', '-   ', ' '),
(78, 1209, 'Feb\'25', 'Mr.', 'Darshak Shetty', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '24-Mar-96', '19-Sep-21', NULL, '1,50,000', '75,000', '7,616', '37,500', '29,884', '1,50,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '3,974', '1,53,974', ' ', '-   ', ' '),
(79, 2012, 'Feb\'25', 'Mr.', 'Sushant Chowta', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '11-May-90', '01-Aug-23', NULL, '77,420', '38,710', '7,616', '19,355', '11,739', '77,420', '1,800', ' ', '-   ', ' ', '-   ', '2,228', '81,448', '1,800', ' ', '-   ', '200'),
(80, 1400, 'Feb\'25', 'Mr.', 'Hitesh Sharma', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '21-Sep-89', '01-Aug-23', NULL, '50,420', '25,210', '7,616', '12,605', '4,989', '50,420', '1,800', ' ', '-   ', ' ', '-   ', '1,579', '53,799', '1,800', ' ', '-   ', '200'),
(81, 1141, 'Feb\'25', 'Mr.', 'Afzal Siddique', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '25-Sep-85', '01-Mar-24', NULL, '1,00,000', '50,000', '7,616', '25,000', '17,384', '1,00,000', '1,800', ' ', '-   ', ' ', '-   ', '2,771', '1,04,571', '1,800', ' ', '-   ', '200'),
(82, 1894, 'Feb\'25', 'Mr.', 'Nadeem Barbar', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '31-May-94', '13-Aug-24', NULL, '32,000', '16,000', '7,616', '8,000', '384', '32,000', '1,800', ' ', '-   ', ' ', '-   ', '1,136', '34,936', '1,800', ' ', '-   ', '200'),
(83, 2431, 'Feb\'25', 'Ms.', 'Kamana Puran Singh', 'PR', 'OPA - Others', 'F&B - Others', 'Female', '13-May-99', '24-Sep-24', NULL, '32,000', '16,000', '7,616', '8,000', '384', '32,000', '1,800', ' ', '-   ', ' ', '-   ', '1,136', '34,936', '1,800', ' ', '-   ', '200'),
(84, 2513, 'Feb\'25', 'Mr.', 'Mohd Juned Khan', 'PR', 'OPA - Others', 'F&B - Others', 'Male', '11-Dec-98', '08-Nov-24', NULL, '25,200', '12,350', '7,616', '1,235', '3,999', '25,200', '', ' ', '-   ', ' ', '-   ', '960', '26,160', ' ', '-   ', ' ', '-   '),
(85, 1883, 'Feb\'25', 'Mr.', 'Antonio Ernest Jude', 'Light Designer', 'OPA - Others', 'F&B - Others', 'Male', '07-Jun-73', '20-Jul-23', NULL, '60,420', '30,210', '7,616', '15,105', '7,489', '60,420', '1,800', ' ', '-   ', ' ', '-   ', '1,819', '64,039', '1,800', ' ', '-   ', '200'),
(86, 160, 'Feb\'25', 'Mr.', 'Rohit Jadhav', 'DJ', 'OPA - Others', 'F&B - Others', 'Male', '07-Jul-92', '01-May-16', NULL, '60,420', '30,210', '7,616', '15,105', '7,489', '60,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,819', '62,239', ' ', '-   ', ' '),
(87, 2194, 'Feb\'25', 'Mr.', 'Akshay Patil', 'Assistant DJ', 'OPA - Others', 'F&B - Others', 'Male', '18-May-95', '01-Jan-24', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', '1,800', ' ', '-   ', ' ', '-   ', '968', '27,768', '1,800', ' ', '-   ', '200'),
(88, 2401, 'Feb\'25', 'Mr.', 'Saurabh Bhagatsingh Parmar', 'DJ', 'OPA - Others', 'F&B - Others', 'Male', '18-Oct-85', '01-Aug-24', NULL, '30,000', '15,000', '7,616', '1,500', '5,884', '30,000', '1,800', ' ', '-   ', ' ', '-   ', '1,088', '32,888', '1,800', ' ', '-   ', '200'),
(89, 1450, 'Feb\'25', 'Mr.', 'Bipin Rai', 'Operation Manager', 'OPA - Service', 'F&B - Service', 'Male', '18-Oct-85', '01-Apr-22', NULL, '70,420', '35,210', '7,616', '17,605', '9,989', '70,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '2,060', '72,480', ' ', '-   ', ' '),
(90, 805, 'Feb\'25', 'Mr.', 'Sabinus Barbose', 'ARM', 'OPA - Service', 'F&B - Service', 'Male', '28-Mar-86', '10-Jan-19', NULL, '56,372', '28,186', '7,616', '14,093', '6,477', '56,372', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,722', '58,094', ' ', '-   ', ' '),
(91, 200, 'Feb\'25', 'Mr.', 'Sagar Katak Shahi', 'ARM', 'OPA - Service', 'F&B - Service', 'Male', '11-Jun-93', '07-Nov-15', NULL, '41,372', '20,686', '7,616', '10,343', '2,727', '41,372', '1,800', ' ', '-   ', ' ', '-   ', '1,361', '44,533', '1,800', ' ', '-   ', '200'),
(92, 2435, 'Feb\'25', 'Mr.', 'Sharan Shankar Shetty', 'Mixologist', 'OPA - Service', 'F&B - Service', 'Male', '27-Dec-91', '04-Oct-24', NULL, '40,000', '20,000', '7,616', '10,000', '2,384', '40,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,328', '41,328', ' ', '-   ', ' '),
(93, 2372, 'Feb\'25', 'Ms.', 'Precious Thapa', 'Asst. GRM', 'OPA - Service', 'F&B - Service', 'Female', '24-Jan-96', '25-Jun-24', NULL, '52,000', '26,000', '7,616', '13,000', '5,384', '52,000', '1,800', ' ', '-   ', ' ', '-   ', '1,617', '55,417', '1,800', ' ', '-   ', '200'),
(94, 1488, 'Feb\'25', 'Mr.', 'Md.Hannan Md.Asif Shaikh', 'Sr. GRE', 'OPA - Service', 'F&B - Service', 'Male', '29-Nov-97', '17-May-22', NULL, '27,000', '13,500', '7,616', '1,350', '4,534', '27,000', '1,800', ' ', '-   ', ' ', '-   ', '1,016', '29,816', '1,800', ' ', '-   ', '200'),
(95, 2314, 'Feb\'25', 'Ms.', 'Prakriti Rai', 'GRE', 'OPA - Service', 'F&B - Service', 'Female', '07-Feb-03', '23-Apr-24', NULL, '22,000', '11,000', '7,616', '1,100', '2,284', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', ' '),
(96, 2320, 'Feb\'25', 'Mr.', 'Wahid Ur Rahman', 'GRE', 'OPA - Service', 'F&B - Service', 'Male', '23-Apr-01', '18-Apr-24', NULL, '17,420', '8,710', '7,616', '871', '223', '17,420', '1,800', '567', ' ', '-   ', '785', '20,572', '1,800', '131', '200', '', '15,289'),
(97, 2350, 'Feb\'25', 'Mr.', 'Satish Khaire', 'Cashier', 'OPA - Service', 'F&B - Service', 'Male', '07-Jun-98', '27-May-24', NULL, '18,000', '9,000', '7,616', '900', '484', '18,000', '1,800', '585', ' ', '-   ', '799', '21,184', '1,800', '135', '200', '', '15,865'),
(98, 1718, 'Feb\'25', 'Mr.', 'Atul More', 'Cashier', 'OPA - Service', 'F&B - Service', 'Male', '04-Feb-94', '03-Feb-23', NULL, '18,672', '9,336', '7,616', '934', '786', '18,672', '1,800', '607', ' ', '-   ', '815', '21,894', '1,800', '141', '200', '', '16,531'),
(99, 2563, 'Feb\'25', 'Mr.', 'Vinay Pratap Rao', 'Cashier', 'OPA - Service', 'F&B - Service', 'Male', '25-Sep-91', '28-Dec-24', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', '200', '', '17,850'),
(100, 2388, 'Feb\'25', 'Mr.', 'Vipin Rajesh Gupta', 'Barista Supervisor', 'OPA - Service', 'F&B - Service', 'Male', '', '10-Jul-24', NULL, '26,000', '13,000', '7,616', '1,300', '4,084', '26,000', '1,800', ' ', '-   ', ' ', '-   ', '992', '28,792', '1,800', ' ', '-   ', '200'),
(101, 561, 'Feb\'25', 'Mr.', 'Lawerence Coutinho', 'Sr. Bartender', 'OPA - Service', 'F&B - Service', 'Male', '27-Jan-79', '01-Aug-18', NULL, '23,920', '11,960', '7,616', '1,196', '3,148', '23,920', ' ', '-   ', ' ', '-   ', ' ', '-   ', '942', '24,862', ' ', '-   ', ' '),
(102, 198, 'Feb\'25', 'Mr.', 'Mahesh Gowda', 'Sr. Bartender', 'OPA - Service', 'F&B - Service', 'Male', '30-Mar-95', '12-Aug-16', NULL, '21,372', '10,686', '7,616', '1,069', '2,001', '21,372', ' ', '-   ', ' ', '-   ', ' ', '-   ', '880', '22,252', ' ', '-   ', ' '),
(103, 1555, 'Feb\'25', 'Mr.', 'Dashrathi Bairi', 'Bar Supervisor', 'OPA - Service', 'F&B - Service', 'Male', '07-Aug-24', '07-Aug-24', NULL, '27,000', '13,500', '7,616', '1,350', '4,534', '27,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,016', '28,016', ' ', '-   ', ' '),
(104, 2453, 'Feb\'25', 'Mr.', 'Karan Viran ', 'Bartender', 'OPA - Service', 'F&B - Service', 'Male', '13-Mar-00', '14-Oct-24', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', '200', '', '17,850'),
(105, 1497, 'Feb\'25', 'Mr.', 'Deependra Nirpa Singh', 'Bartender', 'OPA - Service', 'F&B - Service', 'Male', '12-May-98', '23-May-22', NULL, '21,420', '10,710', '7,616', '1,071', '2,023', '21,420', '1,800', ' ', '-   ', ' ', '-   ', '881', '24,101', '1,800', ' ', '-   ', '200'),
(106, 1576, 'Feb\'25', 'Mr.', 'Nitin Kishore Jadhav', 'Bartender', 'OPA - Service', 'F&B - Service', 'Male', '28-Jan-90', '20-Aug-22', NULL, '22,884', '11,442', '7,616', '1,144', '2,682', '22,884', '1,800', ' ', '-   ', ' ', '-   ', '917', '25,601', '1,800', ' ', '-   ', '200'),
(107, 2533, 'Feb\'25', 'Mr.', 'Sagar Punit Shukla', 'Bartender', 'OPA - Service', 'F&B - Service', 'Male', '18-Nov-02', '02-Dec-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(108, 2565, 'Feb\'25', 'Mr.', 'Basudeva Behera', 'Bartender', 'OPA - Service', 'F&B - Service', 'Male', '03-Feb-94', '02-Jan-25', NULL, '22,000', '11,000', '7,616', '1,100', '2,284', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', '200'),
(109, 1510, 'Feb\'25', 'Mr.', 'Ashutosh Vikas Khandage', 'Asst Bartender', 'OPA - Service', 'F&B - Service', 'Male', '11-Sep-98', '01-Jun-22', NULL, '19,420', '9,710', '7,616', '971', '1,123', '19,420', '1,800', '632', ' ', '-   ', '833', '22,685', '1,800', '146', '200', '', '17,274'),
(110, 1755, 'Feb\'25', 'Mr.', 'Ravikaran Manohar Nadar', 'Asst Bartender', 'OPA - Service', 'F&B - Service', 'Male', '20-Apr-96', '23-Mar-23', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', '200', '', '17,850'),
(111, 2514, 'Feb\'25', 'Mr.', 'Krishna Kashinath Das', 'Bar Back', 'OPA - Service', 'F&B - Service', 'Male', '15-Oct-01', '07-Nov-24', 116, '14,616', '7,000', '7,616', ' ', '-   ', '', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', '200', ' '),
(112, 1866, 'Feb\'25', 'Mr.', 'Deepak Omprakash Rajbhar', 'Bar Back', 'OPA - Service', 'F&B - Service', 'Male', '21-Jun-01', '22-Jun-23', NULL, '15,172', '7,556', '7,616', ' ', '-   ', ' ', '-   ', '15,172', '1,800', '494', ' ', '-   ', '730', '18,196', '1,800', '114', '200'),
(113, 202, 'Feb\'25', 'Mr.', 'Bidyadhar Ojha', 'Sr. Captain', 'OPA - Service', 'F&B - Service', 'Male', '14-Jun-91', '18-Apr-17', NULL, '25,872', '12,936', '7,616', '1,294', '4,026', '25,872', '1,800', ' ', '-   ', ' ', '-   ', '989', '28,661', '1,800', ' ', '-   ', '200'),
(114, 899, 'Feb\'25', 'Mr.', 'Mangal Chand', 'Captain', 'OPA - Service', 'F&B - Service', 'Male', '21-May-94', '16-Feb-19', NULL, '23,420', '11,710', '7,616', '1,171', '2,923', '23,420', '1,800', ' ', '-   ', ' ', '-   ', '930', '26,150', '1,800', ' ', '-   ', '200'),
(115, 2076, 'Feb\'25', 'Mr.', 'Sumeet Chand', 'Captain', 'OPA - Service', 'F&B - Service', 'Male', '22-Jul-02', '10-Nov-23', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', '200', '', '18,266'),
(116, 1834, 'Feb\'25', 'Mr.', 'Bijay Kumar Mahakud', 'Tr. Captain', 'OPA - Service', 'F&B - Service', 'Male', '05-Apr-96', '01-Jun-23', NULL, '17,672', '8,836', '7,616', '884', '336', '17,672', '1,800', '575', ' ', '-   ', '791', '20,838', '1,800', '133', '200', '', '15,539'),
(117, 1349, 'Feb\'25', 'Mr.', 'Suraj Dilip Hode', 'Sr. Steward', 'OPA - Service', 'F&B - Service', 'Male', '08-Nov-95', '03-Feb-20', NULL, '19,420', '9,710', '7,616', '971', '1,123', '19,420', '1,800', '632', ' ', '-   ', '833', '22,685', '1,800', '146', '200', '', '17,274'),
(118, 2572, 'Feb\'25', 'Mr.', 'MD Atthar Hussain', 'Sr. Steward', 'OPA - Service', 'F&B - Service', 'Male', '08-Jan-97', '07-Jan-25', NULL, '17,000', '8,500', '7,616', '800', '84', '17,000', ' ', '-   ', '553', ' ', '-   ', '775', '18,328', ' ', '-   ', '128', '200'),
(119, 1624, 'Feb\'25', 'Mr.', 'Darshan Santosh Pawar', 'Steward', 'OPA - Service', 'F&B - Service', 'Male', '11-Feb-98', '01-Oct-22', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', '200', ''),
(120, 967, 'Feb\'25', 'Mr.', 'Chetan Babu Shibe', 'Steward', 'OPA - Service', 'F&B - Service', 'Male', '13-Sep-93', '06-Apr-19', NULL, '19,320', '9,660', '7,616', '966', '1,078', '19,320', '1,800', '628', ' ', '-   ', '831', '22,579', '1,800', '145', '200', '', '17,175'),
(121, 796, 'Feb\'25', 'Mr.', 'Noor Mohammad', 'Steward', 'OPA - Service', 'F&B - Service', 'Male', '11-Nov-99', '27-Nov-18', NULL, '19,320', '9,660', '7,616', '966', '1,078', '19,320', '1,800', '628', ' ', '-   ', '831', '22,579', '1,800', '145', '200', '', '17,175'),
(122, 207, 'Feb\'25', 'Mr.', 'Ram Bogati ', 'Steward', 'OPA - Service', 'F&B - Service', 'Male', '12-Mar-93', '17-Jul-16', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', '200', '', '18,266'),
(123, 1435, 'Feb\'25', 'Mr.', 'Alden Allan D\'Souza', 'Steward', 'OPA - Service', 'F&B - Service', 'Male', '30-Oct-89', '16-Mar-22', NULL, '17,420', '8,710', '7,616', '871', '223', '17,420', '1,800', '567', ' ', '-   ', '785', '20,572', '1,800', '131', '200', '', '15,289'),
(124, 1689, 'Feb\'25', 'Mr.', 'Ajinkya Manohar Nagotkar', 'Steward', 'OPA - Service', 'F&B - Service', 'Male', '31-Dec-90', '19-Dec-22', NULL, '16,036', '8,018', '7,616', '402', ' ', '-   ', '16,036', '1,800', '522', ' ', '-   ', '752', '19,110', '1,800', '121', '200', ''),
(125, 234, 'Feb\'25', 'Mr.', 'Mohd Rajakul', 'Steward', 'OPA - Service', 'F&B - Service', 'Male', '20-May-97', '12-Aug-17', NULL, '18,420', '9,210', '7,616', '921', '673', '18,420', '1,800', '599', ' ', '-   ', '809', '21,628', '1,800', '139', '200', '', '16,281'),
(126, 1424, 'Feb\'25', 'Mr.', 'Raushan Kumar', 'Asst Steward', 'OPA - Service', 'F&B - Service', 'Male', '02-Nov-99', '08-Mar-22', NULL, '17,420', '8,710', '7,616', '871', '223', '17,420', '1,800', '567', ' ', '-   ', '785', '20,572', '1,800', '131', '200', '', '15,289'),
(127, 1431, 'Feb\'25', 'Mr.', 'Rizwan Alam', 'Asst Steward', 'OPA - Service', 'F&B - Service', 'Male', '03-Oct-04', '12-Mar-22', NULL, '14,872', '7,256', '7,616', ' ', '-   ', ' ', '-   ', '14,872', '1,785', '484', ' ', '-   ', '715', '17,856', '1,785', '112', '200'),
(128, 2552, 'Feb\'25', 'Mr.', 'Shebaj Alam', 'Asst. Steward', 'OPA - Service', 'F&B - Service', 'Male', '11-Aug-04', '18-Dec-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(129, 1627, 'Feb\'25', 'Mr.', 'Nitesh Kahar', 'Asst. Steward', 'OPA - Service', 'F&B - Service', 'Male', '08-Aug-00', '19-Dec-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(130, 1729, 'Feb\'25', 'Mr.', 'Mousar Alam', 'Tr. Steward', 'OPA - Service', 'F&B - Service', 'Male', '12-Apr-04', '17-Feb-23', 444, '14,616', '7,000', '7,616', '', ' ', '-   ', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', '200', ''),
(131, 1563, 'Feb\'25', 'Mr.', 'Amin Dawood Shaikh', 'Sheesha Executive', 'OPA - Service', 'F&B - Service', 'Male', '25-Jul-97', '01-Dec-20', NULL, '30,672', '15,336', '7,616', '7,668', '52', '30,672', '1,800', ' ', '-   ', ' ', '-   ', '1,104', '33,576', '1,800', ' ', '-   ', '200'),
(132, 1204, 'Feb\'25', 'Mr.', 'Abu Fazal', 'Sheesha Maker', 'OPA - Service', 'F&B - Service', 'Male', '01-Jan-95', '15-Sep-19', NULL, '19,172', '9,586', '7,616', '958', '1,012', '19,172', '1,800', '624', ' ', '-   ', '827', '22,423', '1,800', '144', '200', '', '17,028'),
(133, 1201, 'Feb\'25', 'Mr.', 'Md Mudassir', 'Sheesha Maker', 'OPA - Service', 'F&B - Service', 'Male', '15-Jan-98', '18-Feb-22', NULL, '16,372', '8,186', '7,616', '570', ' ', '-   ', '16,372', '1,800', '533', ' ', '-   ', '760', '19,465', '1,800', '123', '200', ''),
(134, 1565, 'Feb\'25', 'Mr.', 'Md Najim Raja', 'Sheesha Maker', 'OPA - Service', 'F&B - Service', 'Male', '01-Jan-93', '01-Nov-21', NULL, '17,424', '8,712', '7,616', '871', '225', '17,424', '1,800', '567', ' ', '-   ', '785', '20,576', '1,800', '131', '200', '', '15,293'),
(135, 2027, 'Feb\'25', 'Mr.', 'Arun Das', 'Sheesha Maker', 'OPA - Service', 'F&B - Service', 'Male', '01-Jan-96', '13-Sep-23', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(136, 1710, 'Feb\'25', 'Mr.', 'Rajkumar Saheblal Malo', 'Sheesha Maker', 'OPA - Service', 'F&B - Service', 'Male', '25-Apr-96', '23-Jan-23', NULL, '16,036', '8,018', '7,616', '402', ' ', '-   ', '16,036', '1,800', '522', ' ', '-   ', '752', '19,110', '1,800', '121', '200', ''),
(137, 2098, 'Feb\'25', 'Mr.', 'Akmal Hussain', 'Sheesha Maker', 'OPA - Service', 'F&B - Service', 'Male', '05-Feb-99', '11-Feb-23', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(138, 2104, 'Feb\'25', 'Mr.', 'Suneet Bharadwaj', 'Sous Chef', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '09-Nov-89', '18-Dec-23', NULL, '60,420', '30,210', '7,616', '15,105', '7,489', '60,420', '1,800', ' ', '-   ', ' ', '-   ', '1,819', '64,039', '1,800', ' ', '-   ', '200'),
(139, 167, 'Feb\'25', 'Mr.', 'Rajkumar Singh', 'Sous Chef', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '20-Mar-88', '21-Sep-15', NULL, '42,420', '21,210', '7,616', '10,605', '2,989', '42,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,387', '43,807', ' ', '-   ', ' '),
(140, 171, 'Feb\'25', 'Mr.', 'Shivkumar Markandey Singh', 'C.D.P.', 'OPA - Kitchen', 'Bakery', 'Male', '05-Nov-91', '01-Jul-21', NULL, '28,420', '14,210', '7,616', '1,421', '5,173', '28,420', '1,800', ' ', '-   ', ' ', '-   ', '1,050', '31,270', '1,800', ' ', '-   ', '200'),
(141, 2200, 'Feb\'25', 'Mr.', 'Raj Mondal', 'C.D.P.', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '01-Jan-96', '05-Mar-24', NULL, '35,420', '17,710', '7,616', '8,855', '1,239', '35,420', '1,800', ' ', '-   ', ' ', '-   ', '1,218', '38,438', '1,800', ' ', '-   ', '200'),
(142, 1658, 'Feb\'25', 'Mr.', 'Ravi Naike Singh', 'D.C.D.P.', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '24-Apr-87', '01-Nov-22', NULL, '25,420', '12,710', '7,616', '1,271', '3,823', '25,420', '1,800', ' ', '-   ', ' ', '-   ', '978', '28,198', '1,800', ' ', '-   ', '200'),
(143, 767, 'Feb\'25', 'Mr.', 'Mithun Biswas', 'D.C.D.P.', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '25-Apr-94', '18-Nov-15', NULL, '23,420', '11,710', '7,616', '1,171', '2,923', '23,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '930', '24,350', ' ', '-   ', ' '),
(144, 177, 'Feb\'25', 'Mr.', 'Kishor Debnath', 'D.C.D.P.', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '19-Sep-91', '12-Apr-17', NULL, '22,420', '11,210', '7,616', '1,121', '2,473', '22,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '906', '23,326', ' ', '-   ', ' '),
(145, 1436, 'Feb\'25', 'Mr.', 'Balram Singh', 'Commi - I', 'OPA - Kitchen', 'Bakery', 'Male', '12-May-95', '17-Mar-22', NULL, '22,420', '11,210', '7,616', '1,121', '2,473', '22,420', '1,800', ' ', '-   ', ' ', '-   ', '906', '25,126', '1,800', ' ', '-   ', '200'),
(146, 1856, 'Feb\'25', 'Mr.', 'Amit Mondal', 'Commi - I', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '05-Aug-95', '15-Jun-23', NULL, '18,672', '9,336', '7,616', '934', '786', '18,672', '1,800', '607', ' ', '-   ', '815', '21,894', '1,800', '141', '200', '', '16,531'),
(147, 1307, 'Feb\'25', 'Mr.', 'Rahul Kamlesh Singh', 'Commi - I', 'OPA - Kitchen', 'Bakery', 'Male', '06-Jul-94', '01-Jul-21', NULL, '22,420', '11,210', '7,616', '1,121', '2,473', '22,420', '1,800', ' ', '-   ', ' ', '-   ', '906', '25,126', '1,800', ' ', '-   ', '200'),
(148, 2604, 'Feb\'25', 'Mr.', 'Manik Bairagi', 'Commi - I', 'OPA - Kitchen', 'OPA - Kitchen', 'Male', '10-Jan-89', '13-Feb-25', NULL, '24,000', '12,000', '7,616', '1,200', '3,184', '24,000', '1,800', ' ', '-   ', ' ', '-   ', '944', '26,744', '1,800', ' ', '-   ', '200'),
(149, 2576, 'Feb\'25', 'Mr.', 'Amit Shailendr Shinde', 'Commi - III', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '12-Dec-02', '13-Jan-25', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', ' ', '-   ', '488', ' ', '-   ', '722', '16,210', ' ', '-   '),
(150, 1096, 'Feb\'25', 'Mr.', 'Brojen Saha', 'KST', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '03-Jul-74', '01-Jul-21', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(151, 1677, 'Feb\'25', 'Mr.', 'Rahul Saroj', 'KST', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '01-Jan-96', '25-Nov-22', NULL, '15,084', '7,468', '7,616', ' ', '-   ', ' ', '-   ', '15,084', '1,800', '491', ' ', '-   ', '726', '18,101', '1,800', '114', '200'),
(152, 2062, 'Feb\'25', 'Mr.', 'Mozafar Ali', 'KST', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '02-Apr-04', '16-Jan-24', 396, '14,616', '7,000', '7,616', '', ' ', '-   ', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', '200', ''),
(153, 1260, 'Feb\'25', 'Mr.', 'Dhirendra', 'KST', 'OPA - Kitchen', 'F&B - Kitchen', 'Male', '09-Aug-00', '27-Sep-24', NULL, '15,600', '7,800', '7,616', '184', ' ', '-   ', '15,600', ' ', '-   ', '507', ' ', '-   ', '742', '16,849', ' ', '-   ', '117'),
(154, 2510, 'Feb\'25', 'Mr.', 'Nigel Pereira', 'RM', 'Waikiki - Service', 'F&B - Service', 'Male', '09-Jun-90', '11-Jul-24', NULL, '42,000', '21,000', '7,616', '10,500', '2,884', '42,000', '1,800', ' ', '-   ', ' ', '-   ', '1,376', '45,176', '1,800', ' ', '-   ', '200'),
(155, 2323, 'Feb\'25', 'Mr.', 'Arun Kanoujiya', 'ARM', 'Waikiki - Service', 'F&B - Service', 'Male', '26-Jun-84', '06-May-24', NULL, '37,000', '17,500', '7,616', '8,750', '3,134', '37,000', '1,800', ' ', '-   ', ' ', '-   ', '1,208', '40,008', '1,800', ' ', '-   ', '200'),
(156, 2118, 'Feb\'25', 'Mr.', 'Deepak Korango', 'Beverage Manager', 'Waikiki - Service', 'F&B - Service', 'Male', '20-Apr-86', '02-Jan-24', NULL, '1,00,420', '50,210', '7,616', '25,105', '17,489', '1,00,420', '1,800', ' ', '-   ', ' ', '-   ', '2,781', '1,05,001', '1,800', ' ', '-   ', '200'),
(157, 2165, 'Feb\'25', 'Ms.', 'Namjailungliu Ngonamai', 'Asst. GRM', 'Waikiki - Service', 'F&B - Service', 'Female', '07-Aug-95', '13-Feb-24', NULL, '40,420', '20,210', '7,616', '10,105', '2,489', '40,420', '1,800', ' ', '-   ', ' ', '-   ', '1,338', '43,558', '1,800', ' ', '-   ', '200'),
(158, 2590, 'Feb\'25', 'Ms.', 'Prashika Pariyar', 'GRM', 'Waikiki - Service', 'F&B - Service', 'Female', '13-Dec-94', '29-Jan-25', NULL, '32,000', '16,000', '7,616', '8,000', '384', '32,000', '1,800', ' ', '-   ', ' ', '-   ', '1,136', '34,936', '1,800', ' ', '-   ', '200'),
(159, 2432, 'Feb\'25', 'Ms.', 'Fiza Akram Khan', 'GRE ', 'Waikiki - Service', 'F&B Service', 'Female', '02-Jun-01', '24-Sep-24', NULL, '30,000', '15,000', '7,616', '7,384', ' ', '-   ', '30,000', '1,800', ' ', '-   ', ' ', '-   ', '1,088', '32,888', '1,800', ' ', '-   '),
(160, 2203, 'Feb\'25', 'Mr.', 'Santosh Rawlo', 'Sr. Cashier', 'Waikiki - Service', 'F&B - Service', 'Male', '18-Aug-83', '05-Mar-24', NULL, '21,520', '10,760', '7,616', '1,076', '2,068', '21,520', '1,800', ' ', '-   ', ' ', '-   ', '884', '24,204', '1,800', ' ', '-   ', '200'),
(161, 2120, 'Feb\'25', 'Mr.', 'Gulam Rabbani', 'Cashier', 'Waikiki - Service', 'F&B - Service', 'Male', '05-May-00', '04-Jan-24', NULL, '19,420', '9,710', '7,616', '971', '1,123', '19,420', '1,800', '632', ' ', '-   ', '833', '22,685', '1,800', '146', '200', '', '17,274'),
(162, 2305, 'Feb\'25', 'Mr.', 'Rohid Alam', 'Cashier', 'Waikiki - Service', 'F&B - Service', 'Male', '15-Oct-04', '18-Apr-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(163, 2138, 'Feb\'25', 'Mr.', 'Darshan Raut', 'F&B Executive', 'Waikiki - Service', 'F&B - Service', 'Male', '27-Jul-97', '23-Jan-24', NULL, '23,420', '11,710', '7,616', '1,171', '2,923', '23,420', '1,800', ' ', '-   ', ' ', '-   ', '930', '26,150', '1,800', ' ', '-   ', '200'),
(164, 2290, 'Feb\'25', 'Mr.', 'Javed Ansari', 'F&B Executive', 'Waikiki - Service', 'F&B - Service', 'Male', '07-Sep-94', '02-Apr-24', NULL, '32,000', '16,000', '7,616', '8,000', '384', '32,000', '1,800', ' ', '-   ', ' ', '-   ', '1,136', '34,936', '1,800', ' ', '-   ', '200'),
(165, 2415, 'Feb\'25', 'Mr.', 'Jameer RasoolAhmed Umbardi', 'F&B Executive', 'Waikiki - Service', 'F&B - Service', 'Male', '24-Jul-94', '03-Sep-24', NULL, '27,000', '13,500', '7,616', '1,350', '4,534', '27,000', '1,800', ' ', '-   ', ' ', '-   ', '1,016', '29,816', '1,800', ' ', '-   ', '200'),
(166, 2586, 'Feb\'25', 'Mr.', 'Samir RasoolAhmad Umbardi', 'F&B Executive', 'Waikiki - Service', 'F&B - Service', 'Male', '10-Jan-01', '15-Jan-25', NULL, '28,000', '14,000', '7,616', '6,384', '', '28,000', '1,800', ' ', '-   ', ' ', '-   ', '1,040', '30,840', '1,800', ' ', '-   ', '200'),
(167, 2595, 'Feb\'25', 'Mr.', 'Abhishek Tiwari', 'F&B Execitive', 'Waikiki - Service', 'Waikiki - Service', 'Male', '27-May-97', '04-Feb-25', NULL, '27,000', '13,500', '7,616', '1,350', '4,534', '27,000', '1,800', ' ', '-   ', ' ', '-   ', '1,016', '29,816', '1,800', ' ', '-   ', '200'),
(168, 2522, 'Feb\'25', 'Ms.', 'Toiying W Konyak', 'Runner', 'Waikiki - Service', 'F&B - Service', 'Female', '16-Jul-02', '21-Nov-24', 116, '14,616', '7,000', '7,616', ' ', '-   ', ' ', '-   ', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', ' '),
(169, 2192, 'Feb\'25', 'Mr.', 'Arun Rathod', 'Runner', 'Waikiki - Service', 'F&B - Service', 'Male', '01-Apr-02', '27-Feb-24', NULL, '14,920', '7,304', '7,616', ' ', '-   ', ' ', '-   ', '14,920', '1,790', '485', ' ', '-   ', '718', '17,913', '1,790', '112', '200'),
(170, 2274, 'Feb\'25', 'Mr.', 'Vaillabh Amberkar', 'Bar Supervisor', 'Waikiki - Service', 'F&B - Service', 'Male', '05-Sep-96', '19-Mar-24', NULL, '32,420', '16,210', '7,616', '8,105', '489', '32,420', '1,800', ' ', '-   ', ' ', '-   ', '1,146', '35,366', '1,800', ' ', '-   ', '200'),
(171, 2276, 'Feb\'25', 'Mr.', 'Arjun Rathod', 'Sr. Bartender', 'Waikiki - Service', 'F&B - Service', 'Male', '18-May-93', '19-Mar-24', NULL, '27,420', '13,710', '7,616', '1,371', '4,723', '27,420', '1,800', ' ', '-   ', ' ', '-   ', '1,026', '30,246', '1,800', ' ', '-   ', '200'),
(172, 2164, 'Feb\'25', 'Mr.', 'Naresh Khangaha', 'Asst. Bar Supervisor', 'Waikiki - Service', 'F&B - Service', 'Male', '29-Dec-99', '13-Feb-24', NULL, '27,420', '13,710', '7,616', '1,371', '4,723', '27,420', '1,800', ' ', '-   ', ' ', '-   ', '1,026', '30,246', '1,800', ' ', '-   ', '200'),
(173, 2277, 'Feb\'25', 'Mr.', 'Japit Kannojiya', 'Asst. Bartender', 'Waikiki - Service', 'F&B - Service', 'Male', '04-May-00', '19-Mar-24', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', '200', '', '18,266'),
(174, 2313, 'Feb\'25', 'Mr.', 'Kishan Singh', 'Bartender', 'Waikiki - Service', 'F&B - Service', 'Male', '16-Jul-98', '23-Apr-24', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', '1,800', ' ', '-   ', ' ', '-   ', '968', '27,768', '1,800', ' ', '-   ', '200'),
(175, 2142, 'Feb\'25', 'Mr.', 'Mayuresh Sawant', 'Bartender', 'Waikiki - Service', 'F&B - Service', 'Male', '15-Apr-97', '23-Jan-24', NULL, '26,420', '13,210', '7,616', '1,321', '4,273', '26,420', '1,800', ' ', '-   ', ' ', '-   ', '1,002', '29,222', '1,800', ' ', '-   ', '200'),
(176, 2177, 'Feb\'25', 'Mr.', 'Ankur Shetye', 'Bartender', 'Waikiki - Service', 'F&B - Service', 'Male', '23-May-96', '20-Feb-24', NULL, '25,420', '12,710', '7,616', '1,271', '3,823', '25,420', '1,800', ' ', '-   ', ' ', '-   ', '978', '28,198', '1,800', ' ', '-   ', '200'),
(177, 2275, 'Feb\'25', 'Mr.', 'Manoj Sonar', 'Bartender', 'Waikiki - Service', 'F&B - Service', 'Male', '15-Nov-99', '19-Mar-24', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', '200', '', '18,266'),
(178, 2357, 'Feb\'25', 'Mr.', 'Sunil Guguloth', 'Bartender', 'Waikiki - Service', 'F&B - Service', 'Male', '13-May-01', '11-Jun-24', NULL, '23,000', '11,500', '7,616', '1,150', '2,734', '23,000', '1,800', ' ', '-   ', ' ', '-   ', '919', '25,719', '1,800', ' ', '-   ', '200'),
(179, 2156, 'Feb\'25', 'Mr.', 'Shailesh Dhegabhai', 'Barback', 'Waikiki - Service', 'F&B - Service', 'Male', '24-Aug-01', '06-Feb-24', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(180, 2171, 'Feb\'25', 'Mr.', 'Shubham Bhumbak', 'Barback', 'Waikiki - Service', 'F&B - Service', 'Male', '14-Dec-02', '13-Feb-24', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(181, 2266, 'Feb\'25', 'Mr.', 'Sonu Singh Bora', 'Barback', 'Waikiki - Service', 'F&B - Service', 'Male', '06-Feb-04', '19-Mar-24', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(182, 2392, 'Feb\'25', 'Mr.', 'Pauthianlam', 'Barback', 'Waikiki - Service', 'F&B - Service', 'Male', '03-Feb-99', '16-Jul-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(183, 2404, 'Feb\'25', 'Mr.', 'Juned Hashmi', 'Barback', 'Waikiki - Service', 'F&B - Service', 'Male', '01-Jan-05', '02-Aug-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(184, 2414, 'Feb\'25', 'Mr.', 'Alex Felix D\'souza', 'Sr. Steward', 'Waikiki - Service', 'F&B - Service', 'Male', '05-May-92', '03-Sep-24', NULL, '18,000', '9,000', '7,616', '900', '484', '18,000', ' ', '-   ', '585', ' ', '-   ', '799', '19,384', ' ', '-   ', '135', '200');
INSERT INTO `salary_payments` (`id`, `Emp_No`, `Month`, `Title`, `Employee_Name`, `Designation`, `Department`, `Section_Outlet`, `Gender`, `DOB`, `DOJ`, `DOL`, `Actual_Salary`, `Basic`, `DA`, `HRA`, `CONV`, `Monthly_Gross_Salary`, `Emper_PF`, `Emper_ESIC`, `Stat_Bonus`, `Grauity`, `Monthly_CTC`, `Empee_PF`, `Empee_ESIC`, `PT`, `TDS`, `Monthly_Net_Salary`, `Total_Days`) VALUES
(185, 2439, 'Feb\'25', 'Mr.', 'Athang Tayade', 'Steward', 'Waikiki - Service', 'F&B Service', 'Male', '19-Apr-99', '08-Oct-24', NULL, '16,500', '8,250', '7,616', '634', ' ', '-   ', '16,500', '1,800', '537', ' ', '-   ', '763', '19,600', '1,800', '124', '200', ''),
(186, 2597, 'Feb\'25', 'Mr.', 'Adarsh Mishra', 'Steward', 'Waikiki - Service', 'Waikiki - Service', 'Male', '01-Jul-01', '06-Feb-25', NULL, '18,000', '9,000', '7,616', '900', '484', '18,000', '1,800', '585', ' ', '-   ', '799', '21,184', '1,800', '135', '200', '', '15,865'),
(187, 2508, 'Feb\'25', 'Ms.', 'Zoramsangi', 'Stewardess', 'Waikiki - Service', 'F&B Service', 'Female', '14-Feb-04', '07-Nov-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', ' ', '-   '),
(188, 2546, 'Feb\'25', 'Mr.', 'Sarfraj', 'Sheesha Maker', 'Waikiki - Service', 'F&B - Service', 'Male', '01-Jan-92', '08-Mar-22', NULL, '16,372', '8,186', '7,616', '570', ' ', '-   ', '16,372', '1,800', '533', ' ', '-   ', '760', '19,465', '1,800', '123', '200', ''),
(189, 2367, 'Feb\'25', 'Mr.', 'Sahil Gaikwad', 'DJ', 'Waikiki - Others', 'F&B - Others', 'Male', '06-Mar-97', '08-May-24', NULL, '27,000', '13,500', '7,616', '1,350', '4,534', '27,000', '1,800', ' ', '-   ', ' ', '-   ', '1,016', '29,816', '1,800', ' ', '-   ', '200'),
(190, 2462, 'Feb\'25', 'Mr.', 'Rahul Choudhry', 'PR ', 'Waikiki - Others', 'F&B - Others', 'Male', '12-Jun-91', '25-Oct-24', NULL, '52,000', '26,000', '7,616', '13,000', '5,384', '52,000', '1,800', '', '', '1,617', '55,417', '1,800', '', '200', '', '50,000', '0'),
(191, 2498, 'Feb\'25', 'Ms.', 'Tejaswini Raghunath Honkhande', 'PR ', 'Waikiki - Others', 'F&B Others', 'Female', '28-Jul-00', '01-Oct-24', NULL, '55,000', '27,500', '7,616', '13,750', '6,134', '55,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,689', '56,689', ' ', '-   ', ' '),
(192, 2379, 'Feb\'25', 'Mr.', 'Harpreet Singh Bhatti', 'Head Chef', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '03-Jan-94', '28-Jun-24', NULL, '80,000', '40,000', '7,616', '20,000', '12,384', '80,000', '1,800', ' ', '-   ', ' ', '-   ', '2,290', '84,090', '1,800', ' ', '-   ', '200'),
(193, 2270, 'Feb\'25', 'Mr.', 'Sujit Mondal', 'Jr. Sous Chef', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '28-Apr-93', '19-Mar-24', NULL, '52,420', '26,210', '7,616', '13,105', '5,489', '52,420', '1,800', ' ', '-   ', ' ', '-   ', '1,627', '55,847', '1,800', ' ', '-   ', '200'),
(194, 2387, 'Feb\'25', 'Mr.', 'Narendra Magar', 'C.D.P.', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '10-Aug-94', '11-Jul-24', NULL, '37,000', '18,500', '7,616', '9,250', '1,634', '37,000', '1,800', ' ', '-   ', ' ', '-   ', '1,256', '40,056', '1,800', ' ', '-   ', '200'),
(195, 2520, 'Feb\'25', 'Mr.', 'Jagu Ram', 'C.D.P.', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '10-Aug-94', '19-Nov-24', NULL, '47,000', '23,500', '7,616', '11,750', '4,134', '47,000', '1,800', ' ', '-   ', ' ', '-   ', '1,497', '50,297', '1,800', ' ', '-   ', '200'),
(196, 2531, 'Feb\'25', 'Mr.', 'Ashis Maity', 'DCDP', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '30-Nov-24', '30-Nov-24', NULL, '30,000', '15,000', '7,616', '7,384', ' ', '-   ', '30,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,088', '31,088', ' ', '-   '),
(197, 2511, 'Feb\'25', 'Mr.', 'Bharat Khadka', 'Commi - I', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '01-Jan-00', '01-Nov-24', NULL, '22,000', '11,000', '7,616', '1,100', '2,284', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', '200'),
(198, 2519, 'Feb\'25', 'Mr.', 'Abodh Bilekh Mondal', 'Commi - I', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '01-Jan-97', '20-Nov-24', NULL, '24,000', '12,000', '7,616', '1,200', '3,184', '24,000', '1,800', ' ', '-   ', ' ', '-   ', '944', '26,744', '1,800', ' ', '-   ', '200'),
(199, 2523, 'Feb\'25', 'Mr.', 'Navraj Girir', 'Commi - I', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '01-Jan-00', '20-Nov-24', NULL, '22,000', '11,000', '7,616', '1,100', '2,284', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', '200'),
(200, 2529, 'Feb\'25', 'Mr.', 'Sandeep Singh', 'Commi - II', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '15-Jun-97', '26-Nov-24', NULL, '18,000', '9,000', '7,616', '900', '484', '18,000', '1,800', '585', ' ', '-   ', '799', '21,184', '1,800', '135', '200', '', '15,865'),
(201, 2461, 'Feb\'25', 'Mr.', 'Rehan Shaikh', 'Commi - II', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '12-Nov-03', '22-Oct-24', NULL, '16,500', '8,250', '7,616', '634', ' ', '-   ', '16,500', '1,800', '537', ' ', '-   ', '763', '19,600', '1,800', '124', '200', ''),
(202, 2341, 'Feb\'25', 'Mr.', 'Shabez Khan', 'Commi - III', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '27-Jul-99', '19-Oct-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(203, 2459, 'Feb\'25', 'Mr.', 'Deepak Saini', 'Commi - III', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '20-Jan-02', '19-Oct-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(204, 2537, 'Feb\'25', 'Mr.', 'Kailash Dhani Singh', 'Commi - III', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '15-Oct-00', '01-Dec-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(205, 2255, 'Feb\'25', 'Mr.', 'Manoj Kumar', 'KST', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '05-Apr-97', '13-Mar-24', NULL, '15,420', '7,710', '7,616', '94', '', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', '', '13,304'),
(206, 2449, 'Feb\'25', 'Mr.', 'Jitendra Kumar', 'KST', 'Waikiki - Kitchen', 'F&B - Kitchen', 'Male', '01-Jan-97', '12-Oct-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(207, 1882, 'Feb\'25', 'Ms.', 'Aparna Ashok Shinde', 'Sous Chef', 'Cocomaya ', 'F&B - Kitchen', 'Female', '25-Mar-92', '01-Jun-22', NULL, '80,000', '40,000', '7,616', '20,000', '12,384', '80,000', '1,800', ' ', '-   ', ' ', '-   ', '2,290', '84,090', '1,800', ' ', '-   ', '200'),
(208, 2283, 'Feb\'25', 'Mr.', 'Amol Khanvilkar', 'C.D.P.', 'Cocomaya ', 'F&B - Kitchen', 'Male', '28-Feb-93', '26-Mar-24', NULL, '42,000', '21,000', '7,616', '10,500', '2,884', '42,000', '1,800', ' ', '-   ', ' ', '-   ', '1,376', '45,176', '1,800', ' ', '-   ', '200'),
(209, 2502, 'Feb\'25', 'Mr.', 'Manoj Maruti Salvi', 'C.D.P.', 'Cocomaya ', 'F&B - Kitchen', 'Male', '07-Jan-87', '01-Nov-24', NULL, '45,000', '22,500', '7,616', '11,250', '3,634', '45,000', '1,800', ' ', '-   ', ' ', '-   ', '1,449', '48,249', '1,800', ' ', '-   ', '200'),
(210, 2562, 'Feb\'25', 'Ms.', 'Neha Tabassum', 'C.D.P.', 'Cocomaya ', 'F&B - Kitchen', 'Female', '16-May-93', '26-Dec-24', NULL, '29,000', '14,500', '7,616', '1,450', '5,434', '29,000', '1,800', ' ', '-   ', ' ', '-   ', '1,064', '31,864', '1,800', ' ', '-   ', '200'),
(211, 2553, 'Feb\'25', 'Mr.', 'Mahesh Prabhu Chinde', 'C.D.P.', 'Cocomaya ', 'F&B - Kitchen', 'Male', '20-Apr-85', '20-Dec-24', NULL, '45,000', '22,500', '7,616', '11,250', '3,634', '45,000', '1,800', ' ', '-   ', ' ', '-   ', '1,449', '48,249', '1,800', ' ', '-   ', '200'),
(212, 2409, 'Feb\'25', 'Mr.', 'Himanshu Kundan Singh', 'Commi - II', 'Cocomaya ', 'F&B - Kitchen', 'Male', '28-Jan-01', '20-Aug-24', NULL, '17,200', '8,600', '7,616', '860', '124', '17,200', '1,800', '559', ' ', '-   ', '780', '20,339', '1,800', '129', '200', '', '15,071'),
(213, 2600, 'Feb\'25', 'Mr.', 'Virendra Pathani', 'Commi - II', 'Cocoamaya', 'Bakery', 'Male', '01-Dec-01', '01-Dec-25', NULL, '21,000', '10,500', '7,616', '1,050', '1,834', '21,000', '1,800', '683', ' ', '-   ', '871', '24,354', '1,800', '158', '200', '', '18,842'),
(214, 2418, 'Feb\'25', 'Mr.', 'Ashish Singh', 'Commi - III', 'Cocomaya ', 'F&B - Kitchen', 'Male', '31-Jul-05', '11-Sep-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(215, 2601, 'Feb\'25', 'Mr.', 'Sanjana Kailas Jadhav', 'Commi - III', 'Cocoamaya', 'Bakery', 'Male', '07-Feb-02', '08-Feb-25', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', ' '),
(216, 1808, 'Feb\'25', 'Mr.', 'Md Mubarak', 'KST', 'Cocomaya ', 'F&B - Kitchen', 'Male', '29-Oct-05', '01-May-23', NULL, '17,129', '8,600', '7,616', '860', '53', '17,129', '1,800', '557', ' ', '-   ', '780', '20,266', '1,800', '129', '200', '', '15,000'),
(217, 1840, 'Feb\'25', 'Mr.', 'Dharamraj', 'KST', 'Cocomaya ', 'F&B - Kitchen', 'Male', '09-Jul-88', '08-Jun-23', NULL, '17,129', '8,600', '7,616', '860', '53', '17,129', '1,800', '557', ' ', '-   ', '780', '20,266', '1,800', '129', '200', '', '15,000'),
(218, 2457, 'Feb\'25', 'Mr.', 'Sanni Shroff', 'KST', 'Cocomaya ', 'F&B - Kitchen', 'Male', '26-Feb-02', '17-Oct-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(219, 2398, 'Feb\'25', 'Mr.', 'Babbi Laljibaba Patni', 'Shopkeeper', 'Cocomaya ', 'F&B - Kitchen', 'Male', '23-Jan-98', '22-Jul-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(220, 35, 'Feb\'25', 'Mr.', 'Sikandar Asgar Ansari', 'Executive Chef', 'F&B Production', 'Main Kitchen', 'Male', '04-Jun-86', '01-Oct-24', NULL, '85,000', '42,500', '7,616', '21,250', '13,634', '85,000', '1,800', '', ' ', '-   ', '2,411', '89,211', '1,800', '', '200', '', '83,000'),
(221, 2371, 'Feb\'25', 'Mr.', 'Anil Chhetri', 'Sr. Sous Chef', 'F&B Production', 'Asian', 'Male', '16-Aug-71', '26-Jun-24', NULL, '80,000', '40,000', '7,616', '20,000', '12,384', '80,000', '1,800', ' ', '-   ', ' ', '-   ', '2,290', '84,090', '1,800', ' ', '-   ', '200'),
(222, 2196, 'Feb\'25', 'Mr.', 'Sunil Bohat', 'Sous Chef', 'F&B Production', 'Conti', 'Male', '12-May-77', '05-Mar-24', NULL, '50,420', '25,210', '7,616', '12,605', '4,989', '50,420', '1,800', ' ', '-   ', ' ', '-   ', '1,579', '53,799', '1,800', ' ', '-   ', '200'),
(223, 269, 'Feb\'25', 'Mr.', 'Satendra Rajendra Singh', 'Sous Chef', 'F&B Production', 'Indian', 'Male', '01-Jan-71', '08-May-07', NULL, '40,715', '20,357', '7,616', '10,179', '2,563', '40,715', '1,800', ' ', '-   ', ' ', '-   ', '1,346', '43,861', '1,800', ' ', '-   ', '200'),
(224, 280, 'Feb\'25', 'Mr.', 'Ajay Bahadur Thapa', 'Sous Chef', 'F&B Production', 'Asian', 'Male', '10-Jan-82', '16-Oct-08', NULL, '40,000', '20,000', '7,616', '10,000', '2,384', '40,000', '1,800', ' ', '-   ', ' ', '-   ', '1,328', '43,128', '1,800', ' ', '-   ', '200'),
(225, 304, 'Feb\'25', 'Mr.', 'Sunil Thale', 'Sous Chef', 'F&B Production', 'Butchary', 'Male', '29-Jun-65', '02-Mar-07', NULL, '38,420', '19,210', '7,616', '9,605', '1,989', '38,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,290', '39,710', ' ', '-   ', ' '),
(226, 1554, 'Feb\'25', 'Mr.', 'Sohansingh Dayalsingh Rawat', 'Jr. Sous Chef', 'F&B Production', 'Indian', 'Male', '27-Jul-73', '20-Jul-22', NULL, '38,420', '19,210', '7,616', '9,605', '1,989', '38,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,290', '39,710', ' ', '-   ', ' '),
(227, 270, 'Feb\'25', 'Mr.', 'JodhSingh JeetSingh Chauhan', 'Jr. Sous Chef', 'F&B Production', 'Indian', 'Male', '20-Apr-64', '24-Sep-07', NULL, '40,546', '20,273', '7,616', '10,136', '2,521', '40,546', '1,800', ' ', '-   ', ' ', '-   ', '1,341', '43,687', '1,800', ' ', '-   ', '200'),
(228, 291, 'Feb\'25', 'Mr.', 'Kamaljeet', 'Sr. C.D.P', 'F&B Production', 'South India', 'Male', '15-Sep-82', '17-Dec-10', NULL, '34,128', '17,064', '7,616', '8,532', '916', '34,128', '1,800', ' ', '-   ', ' ', '-   ', '1,187', '37,115', '1,800', ' ', '-   ', '200'),
(229, 1693, 'Feb\'25', 'Mr.', 'Prakash Dev Chand', 'C.D.P.', 'F&B Production', 'Halwai', 'Male', '27-Oct-91', '23-Dec-22', NULL, '37,000', '18,500', '7,616', '9,250', '1,634', '37,000', '1,800', ' ', '-   ', ' ', '-   ', '1,256', '40,056', '1,800', ' ', '-   ', '200'),
(230, 1663, 'Feb\'25', 'Mr.', 'Ganesh Dev Balayar', 'C.D.P.', 'F&B Production', 'Tandoor', 'Male', '20-Jul-85', '07-Nov-22', NULL, '33,672', '16,836', '7,616', '8,418', '802', '33,672', '1,800', ' ', '-   ', ' ', '-   ', '1,176', '36,648', '1,800', ' ', '-   ', '200'),
(231, 2420, 'Feb\'25', 'Mr.', 'Anish Sunar', 'C.D.P.', 'F&B Production', 'Asian Sushi', 'Male', '17-Jan-04', '17-Sep-24', NULL, '32,000', '16,000', '7,616', '8,000', '384', '32,000', '1,800', ' ', '-   ', ' ', '-   ', '1,136', '34,936', '1,800', ' ', '-   ', '200'),
(232, 281, 'Feb\'25', 'Mr.', 'Surendra Thakur', 'C.D.P.', 'F&B Production', 'Asian', 'Male', '04-Apr-91', '01-Nov-21', NULL, '30,672', '15,336', '7,616', '7,668', '52', '30,672', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,104', '31,776', ' ', '-   ', ' '),
(233, 2556, 'Feb\'25', 'Mr.', 'Ramesh Lokbahadur Bishukarma', 'C.D.P.', 'F&B Production', 'Asian', 'Male', '30-Dec-88', '21-Dec-24', NULL, '29,000', '14,500', '7,616', '1,450', '5,434', '29,000', '1,800', ' ', '-   ', ' ', '-   ', '1,064', '31,864', '1,800', ' ', '-   ', '200'),
(234, 1287, 'Feb\'25', 'Mr.', 'Sanjay Shankar Kaintura', 'D.C.D.P.', 'F&B Production', 'Indian', 'Male', '19-Jul-84', '01-Oct-21', NULL, '26,420', '13,210', '7,616', '1,321', '4,273', '26,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,002', '27,422', ' ', '-   ', ' '),
(235, 282, 'Feb\'25', 'Mr.', 'Rajendra Kumar Raut', 'D.C.D.P.', 'F&B Production', 'Asian', 'Male', '02-Jun-90', '18-Oct-13', NULL, '27,672', '13,836', '7,616', '1,384', '4,836', '27,672', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,032', '28,704', ' ', '-   ', ' '),
(236, 286, 'Feb\'25', 'Mr.', 'Basudev Dhanuk Roy', 'D.C.D.P.', 'F&B Production', 'Tandoor', 'Male', '31-Dec-87', '19-Oct-10', NULL, '24,715', '12,358', '7,616', '1,236', '3,506', '24,715', '1,800', ' ', '-   ', ' ', '-   ', '961', '27,476', '1,800', ' ', '-   ', '200'),
(237, 1158, 'Feb\'25', 'Mr.', 'Mohd Said', 'D.C.D.P.', 'F&B Production', 'Halwai', 'Male', '15-Oct-95', '15-Feb-13', NULL, '26,128', '13,064', '7,616', '1,306', '4,142', '26,128', ' ', '-   ', ' ', '-   ', ' ', '-   ', '995', '27,123', ' ', '-   ', ' '),
(238, 1459, 'Feb\'25', 'Mr.', 'Suresh Kumar', 'D.C.D.P.', 'F&B Production', 'Asian', 'Male', '14-May-96', '01-Nov-24', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '968', '25,968', ' ', '-   ', ' '),
(239, 288, 'Feb\'25', 'Mr.', 'Khimanand', 'Commi - I', 'F&B Production', 'Tandoor', 'Male', '01-Jan-93', '06-Nov-21', NULL, '25,420', '12,710', '7,616', '1,271', '3,823', '25,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '978', '26,398', ' ', '-   ', ' '),
(240, 353, 'Feb\'25', 'Mr.', 'Dayal Singh ', 'Commi - I', 'F&B Production', 'Tandoor', 'Male', '19-Oct-92', '06-Nov-21', NULL, '25,420', '12,710', '7,616', '1,271', '3,823', '25,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '978', '26,398', ' ', '-   ', ' '),
(241, 362, 'Feb\'25', 'Mr.', 'Md. Musha', 'Commi - I', 'F&B Production', 'Tandoor', 'Male', '13-Nov-96', '01-Oct-23', NULL, '21,420', '10,710', '7,616', '1,071', '2,023', '21,420', '1,800', ' ', '-   ', ' ', '-   ', '881', '24,101', '1,800', ' ', '-   ', '200'),
(242, 1825, 'Feb\'25', 'Mr.', 'Ranjeet Singh', 'Commi - I', 'F&B Production', 'Indian', 'Male', '15-May-97', '11-Oct-23', NULL, '20,672', '10,336', '7,616', '1,034', '1,686', '20,672', '1,800', '672', ' ', '-   ', '863', '24,007', '1,800', '156', '200', '', '18,516'),
(243, 2042, 'Feb\'25', 'Mr.', 'Sunder Jitsingh Vishwakarma', 'Commi - I', 'F&B Production', 'Asian Sushi', 'Male', '07-Jan-98', '27-Feb-24', NULL, '26,000', '13,000', '7,616', '1,300', '4,084', '26,000', '1,800', ' ', '-   ', ' ', '-   ', '992', '28,792', '1,800', ' ', '-   ', '200'),
(244, 299, 'Feb\'25', 'Mr.', 'Brenden Peris', 'Commi - I', 'F&B Production', 'Conti', 'Male', '19-Sep-94', '08-Nov-21', NULL, '22,420', '11,210', '7,616', '1,121', '2,473', '22,420', '1,800', ' ', '-   ', ' ', '-   ', '906', '25,126', '1,800', ' ', '-   ', '200'),
(245, 398, 'Feb\'25', 'Mr.', 'Sanjay Kumar', 'Commi - I', 'F&B Production', 'Halwai', 'Male', '10-Oct-98', '04-Nov-22', NULL, '18,372', '9,186', '7,616', '919', '651', '18,372', '1,800', '598', ' ', '-   ', '808', '21,578', '1,800', '138', '200', '', '16,234'),
(246, 2162, 'Feb\'25', 'Mr.', 'Adesh Bk', 'Commi - I', 'F&B Production', 'Asian Dimsum', 'Male', '08-Jul-02', '13-Feb-24', NULL, '26,000', '13,000', '7,616', '1,300', '4,084', '26,000', '1,800', ' ', '-   ', ' ', '-   ', '992', '28,792', '1,800', ' ', '-   ', '200'),
(247, 2579, 'Feb\'25', 'Mr.', 'Ishvar Trivedi', 'Commi - I', 'F&B Production', 'Asian Dimsum', 'Male', '15-Feb-02', '11-Jan-25', NULL, '22,000', '11,000', '7,616', '1,100', '2,284', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', '200'),
(248, 2589, 'Feb\'25', 'Mr.', 'Chait Singh Negi', 'Commi - I', 'F&B Production', 'Tandoor', 'Male', '28-Jul-00', '24-Jan-25', NULL, '24,000', '12,000', '7,616', '1,200', '3,184', '24,000', '1,800', ' ', '-   ', ' ', '-   ', '944', '26,744', '1,800', ' ', '-   ', '200'),
(249, 2594, 'Feb\'25', 'Mr.', 'Hariram Gangaram Chaudhari', 'Commi - I', 'F&B Production', 'Indian', 'Male', '15-Nov-00', '01-Feb-25', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', '200', '', '17,850'),
(250, 2082, 'Feb\'25', 'Mr.', 'Ashish Satavalekar', 'Commi - II', 'F&B Production', 'Conti', 'Male', '21-Feb-01', '24-Nov-23', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', '200', '', '18,266'),
(251, 1570, 'Feb\'25', 'Mr.', 'Santosh', 'Commi - II', 'F&B Production', 'Butchary', 'Male', '13-Apr-93', '11-Aug-22', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', '200', '', '17,850'),
(252, 2134, 'Feb\'25', 'Mr.', 'Rajesh Panwar', 'Commi - II', 'F&B Production', 'Indian', 'Male', '24-Jun-98', '06-Feb-24', NULL, '19,420', '9,710', '7,616', '971', '1,123', '19,420', '1,800', '632', ' ', '-   ', '833', '22,685', '1,800', '146', '200', '', '17,274'),
(253, 2155, 'Feb\'25', 'Mr.', 'Sahil Anant Narkar', 'Commi - II', 'F&B Production', 'Conti', 'Male', '14-Mar-02', '08-Sep-22', NULL, '18,420', '9,210', '7,616', '921', '673', '18,420', '1,800', '599', ' ', '-   ', '809', '21,628', '1,800', '139', '200', '', '16,281'),
(254, 1877, 'Feb\'25', 'Mr.', 'Jahedul', 'Commi - II', 'F&B Production', 'Tandoor', 'Male', '01-Jan-98', '13-Feb-24', NULL, '18,420', '9,210', '7,616', '921', '673', '18,420', '1,800', '599', ' ', '-   ', '809', '21,628', '1,800', '139', '200', '', '16,281'),
(255, 1256, 'Feb\'25', 'Mr.', 'Julmat Ali', 'Commi - II', 'F&B Production', 'South India', 'Male', '10-Dec-03', '20-May-22', NULL, '17,420', '8,710', '7,616', '871', '223', '17,420', '1,800', '567', ' ', '-   ', '785', '20,572', '1,800', '131', '200', '', '15,289'),
(256, 1319, 'Feb\'25', 'Mr.', 'Bablu Ghatwar', 'Commi - II', 'F&B Production', 'South India', 'Male', '02-Mar-98', '21-Dec-18', NULL, '15,872', '7,936', '7,616', '320', ' ', '-   ', '15,872', '1,800', '516', ' ', '-   ', '748', '18,936', '1,800', '120', '200', ''),
(257, 2551, 'Feb\'25', 'Mr.', 'Ravi Kumar', 'Commi - II', 'F&B Production', 'Asian', 'Male', '01-Jan-95', '17-Dec-24', NULL, '18,000', '9,000', '7,616', '900', '484', '18,000', '1,800', '585', ' ', '-   ', '799', '21,184', '1,800', '135', '200', '', '15,865'),
(258, 2592, 'Feb\'25', 'Mr.', 'Suraj Rawat', 'Commi - II', 'F&B Production', 'Indian', 'Male', '06-Feb-02', '01-Feb-25', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', '200', '', '17,850'),
(259, 2593, 'Feb\'25', 'Mr.', 'Dharamveer Pujari', 'Commi - II', 'F&B Production', 'Conti', 'Male', '15-Aug-03', '01-Feb-25', NULL, '22,000', '11,000', '7,616', '1,100', '2,284', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', '200'),
(260, 1702, 'Feb\'25', 'Mr.', 'Prathik Raghu Shetty', 'Commi - III', 'F&B Production', 'Conti', 'Male', '15-Dec-99', '15-Jul-23', 944, '14,616', '7,000', '7,616', '', ' ', '-   ', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', '200', ''),
(261, 2046, 'Feb\'25', 'Mr.', 'Suresh Bishwakarma', 'Commi - III', 'F&B Production', 'Asian', 'Male', '16-Jul-05', '06-Oct-18', 196, '14,616', '7,000', '7,616', '', ' ', '-   ', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', '200', ''),
(262, 2143, 'Feb\'25', 'Mr.', 'Mohammad Naushad Ansari', 'Commi - III', 'F&B Production', 'Indian', 'Male', '05-Jul-95', '17-Nov-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(263, 2048, 'Feb\'25', 'Mr.', 'Akshata Amol Jadhav', 'Commi - III', 'F&B Production', 'Indian', 'Female', '14-Jun-01', '27-Dec-11', NULL, '14,920', '7,304', '7,616', ' ', '-   ', ' ', '-   ', '14,920', '1,790', '485', ' ', '-   ', '718', '17,913', '1,790', '112', ' '),
(264, 2159, 'Feb\'25', 'Mr.', 'Tejas Makwana', 'Commi - III', 'F&B Production', 'Conti', 'Male', '17-Jan-06', '27-Oct-21', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(265, 1896, 'Feb\'25', 'Mr.', 'Niyaz Alam', 'Commi - III', 'F&B Production', 'South India', 'Male', '15-Nov-01', '16-Jan-24', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(266, 1813, 'Feb\'25', 'Mr.', 'Mukesh Kumar', 'Commi - III', 'F&B Production', 'Staff Cafeteria', 'Male', '11-May-89', '11-Oct-23', NULL, '14,712', '7,096', '7,616', ' ', '-   ', ' ', '-   ', '14,712', '1,765', '479', ' ', '-   ', '708', '17,664', '1,765', '111', '200'),
(267, 1490, 'Feb\'25', 'Mr.', 'Vaibhav', 'Commi - III', 'F&B Production', 'Staff Cafeteria', 'Male', '15-Apr-02', '28-Apr-17', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', '200', ''),
(268, 1496, 'Feb\'25', 'Mr.', 'Rahul Ghatwar', 'Commi - III', 'F&B Production', 'Asian', 'Male', '01-Jan-01', '03-Sep-22', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', '200', ''),
(269, 1680, 'Feb\'25', 'Mr.', 'Shivam', 'Commi - III', 'F&B Production', 'Staff Cafeteria', 'Male', '05-Sep-01', '03-Dec-22', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', '200', ''),
(270, 2548, 'Feb\'25', 'Mr.', 'Ramzan Israil Chaudhary', 'Commi - III', 'F&B Production', 'Conti', 'Male', '02-Dec-01', '17-Dec-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(271, 2549, 'Feb\'25', 'Mr.', 'MohammadTariq MohammadArif Ansari ', 'Commi - III', 'F&B Production', 'Conti', 'Male', '02-Nov-01', '16-Dec-24', NULL, '17,000', '8,500', '7,616', '850', '34', '17,000', '1,800', '553', ' ', '-   ', '775', '20,128', '1,800', '128', '200', '', '14,872'),
(272, 2201, 'Feb\'25', 'Mr.', 'Dhruv Naik', 'Commi - III', 'F&B Production', 'Main Kitchen', 'Male', '', '05-Mar-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(273, 395, 'Feb\'25', 'Mr.', 'Ashok Singh', 'KST Supervisor', 'F&B Production', 'Main Kitchen', 'Male', '03-Oct-93', '19-May-22', NULL, '22,628', '11,314', '7,616', '1,131', '2,567', '22,628', ' ', '-   ', ' ', '-   ', ' ', '-   ', '911', '23,539', ' ', '-   ', ' '),
(274, 1645, 'Feb\'25', 'Mr.', 'Hira Singh', 'KST Supervisor', 'F&B Production', 'Main Kitchen', 'Male', '14-Apr-80', '20-May-22', NULL, '19,036', '9,518', '7,616', '952', '950', '19,036', '1,800', '619', ' ', '-   ', '824', '22,279', '1,800', '143', '200', '', '16,893'),
(275, 1492, 'Feb\'25', 'Mr.', 'Mohammad Majod', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '01-May-97', '15-Feb-22', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', '200', ''),
(276, 1584, 'Feb\'25', 'Mr.', 'Istiyak Ahmad', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '06-Feb-85', '16-Feb-23', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', '200', ''),
(277, 1707, 'Feb\'25', 'Mr.', 'Akash', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '15-Apr-04', '05-Aug-23', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', '200', ''),
(278, 2061, 'Feb\'25', 'Mr.', 'Jiaraf Ali ', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '22-Jun-05', '06-Feb-24', 396, '14,616', '7,000', '7,616', '', ' ', '-   ', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', '200', ''),
(279, 2330, 'Feb\'25', 'Mr.', 'Sukur Ali', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '29-Aug-95', '08-May-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(280, 400, 'Feb\'25', 'Ms.', 'Parvati', 'KST', 'F&B Production', 'Staff Cafeteria', 'Female', '01-Jan-75', '04-Dec-22', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', ' ', '-   '),
(281, 2280, 'Feb\'25', 'Mr.', 'Asadul Islam', 'KST', 'F&B Production', 'Staff Cafeteria', 'Male', '01-Jan-05', '23-Mar-24', NULL, '15,420', '7,710', '7,616', '94', '', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', '', '13,304'),
(282, 2285, 'Feb\'25', 'Mr.', 'Rahyan Raja', 'KST', 'F&B Production', 'Staff Cafeteria', 'Male', '02-Mar-93', '27-Mar-24', NULL, '15,420', '7,710', '7,616', '94', '', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', '', '13,304'),
(283, 2427, 'Feb\'25', 'Mr.', 'Imran Ali', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '03-Jul-06', '01-Sep-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(284, 2446, 'Feb\'25', 'Mr.', 'Salman Sahil', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '09-Oct-01', '09-Oct-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '0', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(285, 2425, 'Feb\'25', 'Mr.', 'Ashraful Islam', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '27-Nov-03', '20-Sep-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '0', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(286, 1657, 'Feb\'25', 'Mr.', 'Amar Saroj', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '10-May-90', '26-Nov-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '0', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(287, 2536, 'Feb\'25', 'Mr.', 'Aktar Ali', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '11-May-05', '03-Dec-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(288, 2555, 'Feb\'25', 'Mr.', 'Manish', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '13-May-04', '21-Dec-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(289, 2535, 'Feb\'25', 'Mr.', 'Anuwar Hussain', 'KST', 'F&B Production', 'Main Kitchen', 'Male', '06-Nov-97', '03-Dec-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(290, 1320, 'Feb\'25', 'Mr.', 'Amanat Ulla', 'KST', 'F&B Production', 'F&B Production', 'Male', '', '07-Feb-25', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(291, 17, 'Feb\'25', 'Mr.', 'Santosh K Shetty', 'Asst Bqt Mgr', 'Banquets ', 'F&B - Service', 'Male', '27-Nov-03', '26-Nov-24', NULL, '55,420', '27,710', '7,616', '13,855', '6,239', '55,420', '1,800', ' ', '-   ', ' ', '-   ', '1,699', '58,919', '1,800', ' ', '-   ', '200'),
(292, 352, 'Feb\'25', 'Mr.', 'Manoj Chandra Joshi', 'Asst Bqt Mgr', 'Banquets ', 'F&B - Service', 'Male', '08-Jul-85', '16-Jun-07', NULL, '35,420', '17,710', '7,616', '8,855', '1,239', '35,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,218', '36,638', ' ', '-   ', ' '),
(293, 1508, 'Feb\'25', 'Mr.', 'Amit Lavesh Bhosale', 'Sr. Captain', 'Banquets ', 'F&B - Service', 'Male', '04-Aug-84', '31-Aug-21', NULL, '29,372', '14,686', '7,616', '2,937', '4,133', '29,372', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,073', '30,445', ' ', '-   ', ' '),
(294, 351, 'Feb\'25', 'Mr.', 'Harish Hari Bisht', 'Sr. Captain', 'Banquets ', 'F&B - Service', 'Male', '21-Apr-88', '07-Aug-07', NULL, '30,372', '15,186', '7,616', '7,570', ' ', '-   ', '30,372', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,097', '31,469', ' ', '-   '),
(295, 1646, 'Feb\'25', 'Mr.', 'Pawan Dhani Singh', 'Captain', 'Banquets ', 'F&B - Service', 'Male', '05-Jun-82', '11-Oct-22', NULL, '26,036', '13,018', '7,616', '2,604', '2,798', '26,036', ' ', '-   ', ' ', '-   ', ' ', '-   ', '992', '27,028', ' ', '-   ', ' '),
(296, 261, 'Feb\'25', 'Mr.', 'Bisikesan Malik', 'Captain', 'Banquets ', 'F&B - Service', 'Male', '14-Jan-96', '08-Mar-16', NULL, '24,128', '12,064', '7,616', '1,206', '3,242', '24,128', '1,800', ' ', '-   ', ' ', '-   ', '947', '26,875', '1,800', ' ', '-   ', '200'),
(297, 1504, 'Feb\'25', 'Mr.', 'Sanjay Kumar Bind', 'Sr. Steward', 'Banquets ', 'F&B - Service', 'Male', '26-Dec-93', '26-Sep-20', NULL, '22,128', '11,064', '7,616', '1,106', '2,342', '22,128', ' ', '-   ', ' ', '-   ', ' ', '-   ', '899', '23,027', ' ', '-   ', ' '),
(298, 260, 'Feb\'25', 'Mr.', 'Umesh Vasant Kamble', 'Sr. Steward', 'Banquets ', 'F&B - Service', 'Male', '06-May-91', '01-Jan-16', NULL, '22,128', '11,064', '7,616', '1,106', '2,342', '22,128', '1,800', ' ', '-   ', ' ', '-   ', '899', '24,827', '1,800', ' ', '-   ', '200'),
(299, 1532, 'Feb\'25', 'Mr.', 'Hemant Ashok Gaonkar', 'Steward', 'Banquets ', 'F&B - Service', 'Male', '29-Nov-96', '23-Jun-22', NULL, '17,372', '8,686', '7,616', '869', '201', '17,372', '1,800', '565', ' ', '-   ', '784', '20,521', '1,800', '131', '200', '', '15,241'),
(300, 1717, 'Feb\'25', 'Mr.', 'Shibaraj Kunwar', 'Steward', 'Banquets ', 'F&B - Service', 'Male', '25-Mar-87', '03-Feb-23', NULL, '15,672', '7,836', '7,616', '220', ' ', '-   ', '15,672', '1,800', '510', ' ', '-   ', '743', '18,725', '1,800', '118', '200', ''),
(301, 1742, 'Feb\'25', 'Mr.', 'Raj Bahadur', 'Steward', 'Banquets ', 'F&B - Service', 'Male', '01-Jan-94', '09-Mar-23', NULL, '14,672', '7,056', '7,616', ' ', '-   ', ' ', '-   ', '14,672', '1,761', '477', ' ', '-   ', '706', '17,616', '1,761', '111', '200'),
(302, 1480, 'Feb\'25', 'Ms.', 'Anita Maurya', 'Banquets Co - Ordinator', 'Banquets ', 'F&B - Service', 'Female', '21-Mar-22', '29-Nov-24', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', ' ', '-   ', ''),
(303, 1649, 'Feb\'25', 'Mr.', 'Sumit Kumar Pradhan', 'Bartender', 'Banquets ', 'F&B - Service', 'Male', '10-Aug-99', '19-Oct-22', NULL, '21,036', '10,518', '7,616', '1,052', '1,850', '21,036', '1,800', ' ', '-   ', ' ', '-   ', '872', '23,708', '1,800', ' ', '-   ', '200'),
(304, 1452, 'Feb\'25', 'Ms.', 'Sampada Rane', 'Asst DM', 'Front Office', 'Front Office', 'Female', '04-Dec-86', '03-Apr-23', NULL, '27,672', '13,836', '7,616', '1,384', '4,836', '27,672', '1,800', ' ', '-   ', ' ', '-   ', '1,032', '30,504', '1,800', ' ', '-   ', '200'),
(305, 1559, 'Feb\'25', 'Mr.', 'Abhishek Sarat Mohanty', 'Sr. FOE', 'Front Office', 'Front Office', 'Male', '05-Feb-95', '01-Aug-22', NULL, '25,672', '12,836', '7,616', '1,284', '3,936', '25,672', '1,800', ' ', '-   ', ' ', '-   ', '984', '28,456', '1,800', ' ', '-   ', '200'),
(306, 1310, 'Feb\'25', 'Mr.', 'Akash Mithileshkumar Singh', 'FOE', 'Front Office', 'Front Office', 'Male', '13-May-99', '03-Jan-22', NULL, '25,420', '12,710', '7,616', '1,271', '3,823', '25,420', '1,800', ' ', '-   ', ' ', '-   ', '978', '28,198', '1,800', ' ', '-   ', '200'),
(307, 2085, 'Feb\'25', 'Mr.', 'Rohit Bhosale', 'FOE', 'Front Office', 'Front Office', 'Male', '05-Sep-98', '25-Nov-23', NULL, '26,420', '13,210', '7,616', '1,321', '4,273', '26,420', '1,800', ' ', '-   ', ' ', '-   ', '1,002', '29,222', '1,800', ' ', '-   ', '200'),
(308, 2445, 'Feb\'25', 'Mr.', 'Rohit Satish Paradkar', 'FOS', 'Front Office', 'Front Office', 'Male', '25-May-91', '09-Oct-24', NULL, '22,000', '11,000', '7,616', '1,100', '2,284', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', '200'),
(309, 2150, 'Feb\'25', 'Ms.', 'Ruchita Banadavara', 'FOA', 'Front Office', 'Front Office', 'Female', '13-Aug-00', '01-Feb-24', NULL, '17,420', '8,710', '7,616', '871', '223', '17,420', '1,800', '567', ' ', '-   ', '785', '20,572', '1,800', '131', '', '', '15,489'),
(310, 2296, 'Feb\'25', 'Ms.', 'Rishita Baranwal', 'FOA', 'Front Office', 'Front Office', 'Female', '24-May-01', '09-Apr-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', ' ', '-   '),
(311, 995, 'Feb\'25', 'Mr.', 'Ramesh Rawat', 'Bell Boy', 'Front Office', 'Front Office', 'Male', '15-Oct-89', '18-Jul-21', NULL, '19,536', '9,768', '7,616', '977', '1,175', '19,536', '1,800', '635', ' ', '-   ', '836', '22,807', '1,800', '147', '200', '', '17,389'),
(312, 1589, 'Feb\'25', 'Mr.', 'Rahul Tripathi', 'Bell Boy', 'Front Office', 'Front Office', 'Male', '24-May-88', '07-Sep-22', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', '200', ''),
(313, 2585, 'Feb\'25', 'Mr.', 'Atharva Sharad Vichare', 'Bell Boy', 'Front Office', 'Front Office', 'Male', '30-Apr-04', '15-Jan-25', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', ' ', '-   ', '488', ' ', '-   ', '722', '16,210', ' ', '-   ', '113'),
(314, 2133, 'Feb\'25', 'Mr.', 'MohammedTariq Chaudhary', 'Transport Cashier', 'Front Office', 'Front Office', 'Male', '17-Oct-02', '16-Jan-24', NULL, '14,920', '7,304', '7,616', ' ', '-   ', ' ', '-   ', '14,920', '1,790', '485', ' ', '-   ', '718', '17,913', '1,790', '112', '200'),
(315, 727, 'Feb\'25', 'Mr.', 'Vimalkumar Harigen Pal ', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '20-Feb-80', '01-Jan-19', NULL, '19,372', '9,686', '7,616', '969', '1,101', '19,372', ' ', '-   ', '630', ' ', '-   ', '832', '20,834', ' ', '-   ', '146', '200'),
(316, 384, 'Feb\'25', 'Mr.', 'Arjunsingh Nandram Singh', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '18-Sep-83', '24-Dec-11', NULL, '15,872', '7,936', '7,616', '320', ' ', '-   ', '15,872', '1,800', '516', ' ', '-   ', '748', '18,936', '1,800', '120', '200', ''),
(317, 383, 'Feb\'25', 'Mr.', 'Hark Bahadur Rawat', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '18-Jan-83', '06-Mar-11', NULL, '16,672', '8,336', '7,616', '720', ' ', '-   ', '16,672', '1,800', '542', ' ', '-   ', '767', '19,781', '1,800', '126', '200', ''),
(318, 1138, 'Feb\'25', 'Mr.', 'Dhirendra Singh', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '11-Jul-85', '02-Oct-19', NULL, '15,872', '7,936', '7,616', '320', ' ', '-   ', '15,872', '1,800', '516', ' ', '-   ', '748', '18,936', '1,800', '120', '200', ''),
(319, 387, 'Feb\'25', 'Mr.', 'Santosh Prasad Dwivedi', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '02-Jun-70', '26-Jul-15', NULL, '15,872', '7,936', '7,616', '320', ' ', '-   ', '15,872', '1,800', '516', ' ', '-   ', '748', '18,936', '1,800', '120', '200', ''),
(320, 229, 'Feb\'25', 'Mr.', 'Afsar Kadar Khan', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '16-Sep-77', '14-Dec-14', NULL, '15,872', '7,936', '7,616', '320', ' ', '-   ', '15,872', '1,800', '516', ' ', '-   ', '748', '18,936', '1,800', '120', '200', ''),
(321, 386, 'Feb\'25', 'Mr.', 'Kuldeep Yadav', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '01-Jan-85', '13-Feb-16', NULL, '15,872', '7,936', '7,616', '320', ' ', '-   ', '15,872', '1,800', '516', ' ', '-   ', '748', '18,936', '1,800', '120', '200', ''),
(322, 1272, 'Feb\'25', 'Mr.', 'Umesh Yadav', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '15-Jul-79', '15-Nov-21', NULL, '15,872', '7,936', '7,616', '320', ' ', '-   ', '15,872', '1,800', '516', ' ', '-   ', '748', '18,936', '1,800', '120', '200', ''),
(323, 391, 'Feb\'25', 'Mr.', 'Rajendra Prasad Yadav', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '14-Aug-80', '12-Jun-23', NULL, '15,872', '7,936', '7,616', '320', ' ', '-   ', '15,872', '1,800', '516', ' ', '-   ', '748', '18,936', '1,800', '120', '200', ''),
(324, 2050, 'Feb\'25', 'Mr.', 'Sunil Singh', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '01-Jan-88', '17-Oct-23', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(325, 2336, 'Feb\'25', 'Mr.', 'Ashok Yadav', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '01-Jan-85', '14-May-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200', ''),
(326, 2400, 'Feb\'25', 'Mr.', 'Ram Pal', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '30-Aug-76', '29-Jul-24', NULL, '18,200', '9,100', '7,616', '910', '574', '18,200', ' ', '-   ', '592', ' ', '-   ', '804', '19,596', ' ', '-   ', '137', '200'),
(327, 2024, 'Feb\'25', 'Mr.', 'Hira Tej Singh', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '26-Apr-84', '17-Jul-24', NULL, '15,420', '7,710', '7,616', '94', '', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', '', '13,304'),
(328, 2515, 'Feb\'25', 'Mr.', 'Abhishek Pal', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '16-Mar-02', '15-Nov-24', NULL, '15,100', '7,300', '7,616', '184', '', '15,100', ' ', '-   ', '491', ' ', '-   ', '717', '16,308', ' ', '-   ', '114', '200'),
(329, 1263, 'Feb\'25', 'Mr.', 'Tulasi Ram', 'Hotel Vehicle Cleaner', 'Front Office', 'Front Office', 'Male', '07-Mar-03', '01-Nov-21', NULL, '15,420', '7,710', '7,616', '94', ' ', '-   ', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', ''),
(330, 2575, 'Feb\'25', 'Mr.', 'Mahendra Singh Bhandari', 'Chauffeur', 'Front Office', 'Front Office', 'Male', '14-Feb-83', '13-Jan-25', NULL, '15,000', '7,384', '7,616', ' ', '-   ', '', '15,000', ' ', '-   ', '488', ' ', '-   ', '722', '16,210', ' ', '-   ', '113'),
(331, 1276, 'Feb\'25', 'Mr.', 'Madhu Chandrika Vichare', 'Executive Housekeeper ', 'House Keeping', 'House Keeping', 'Male', '04-Jun-86', '21-Oct-21', NULL, '50,672', '25,336', '7,616', '12,668', '5,052', '50,672', '1,800', ' ', '-   ', ' ', '-   ', '1,585', '54,057', '1,800', ' ', '-   ', '200'),
(332, 373, 'Feb\'25', 'Mr.', 'Rahul Dinkar Waghode', 'H.K.Executive', 'House Keeping', 'House Keeping', 'Male', '22-Mar-85', '20-Sep-12', NULL, '32,672', '16,336', '7,616', '8,168', '552', '32,672', '1,800', ' ', '-   ', ' ', '-   ', '1,152', '35,624', '1,800', ' ', '-   ', '200'),
(333, 753, 'Feb\'25', 'Mr.', 'Kamalsingh Kunwarsingh Negi', 'Linen Supervisor', 'House Keeping', 'House Keeping', 'Male', '01-Jan-92', '15-Dec-18', NULL, '25,978', '12,989', '7,616', '1,299', '4,074', '25,978', ' ', '-   ', ' ', '-   ', ' ', '-   ', '991', '26,969', ' ', '-   ', ' '),
(334, 1761, 'Feb\'25', 'Mr.', 'Naresh Sawardekar', 'HK Supervisor', 'House Keeping', 'House Keeping', 'Male', '02-Jun-75', '27-Mar-23', NULL, '24,672', '12,336', '7,616', '1,234', '3,486', '24,672', ' ', '-   ', ' ', '-   ', ' ', '-   ', '960', '25,632', ' ', '-   ', ' '),
(335, 1294, 'Feb\'25', 'Mr.', 'Anup Patel', 'HK Supervisor', 'House Keeping', 'House Keeping', 'Male', '01-Jul-98', '17-Nov-21', NULL, '21,372', '10,686', '7,616', '1,069', '2,001', '21,372', '1,800', ' ', '-   ', ' ', '-   ', '880', '24,052', '1,800', ' ', '-   ', '200'),
(336, 2058, 'Feb\'25', 'Mr.', 'Kiran Rajaram Bandgar', 'HK Supervisor', 'House Keeping', 'House Keeping', 'Male', '07-Oct-91', '23-Oct-23', NULL, '23,420', '11,710', '7,616', '1,171', '2,923', '23,420', '1,800', ' ', '-   ', ' ', '-   ', '930', '26,150', '1,800', ' ', '-   ', '200'),
(337, 328, 'Feb\'25', 'Mr.', 'Indra Mohan Kumar', 'Supervisor Horticulture', 'House Keeping', 'House Keeping', 'Male', '01-Jan-91', '17-Jul-21', NULL, '20,628', '10,314', '7,616', '1,031', '1,667', '20,628', '1,800', '671', ' ', '-   ', '862', '23,961', '1,800', '155', '200', '', '18,473'),
(338, 2122, 'Feb\'25', 'Mr.', 'Arif Ahmed', 'HK Supervisor', 'House Keeping', 'House Keeping', 'Male', '02-May-99', '08-Jan-24', NULL, '21,100', '10,550', '7,616', '1,055', '1,879', '21,100', '1,800', ' ', '-   ', ' ', '-   ', '874', '23,774', '1,800', ' ', '-   ', '200'),
(339, 2365, 'Feb\'25', 'Mr.', 'Ashish Shinde', 'HK Supervisor', 'House Keeping', 'House Keeping', 'Male', '18-Oct-89', '18-Jun-24', NULL, '23,500', '11,750', '7,616', '1,175', '2,959', '23,500', '1,800', ' ', '-   ', ' ', '-   ', '932', '26,232', '1,800', ' ', '-   ', '200'),
(340, 367, 'Feb\'25', 'Mr.', 'N Srihari Dora', 'HK Associate', 'House Keeping', 'Linan Attendant', 'Male', '23-Aug-74', '15-Mar-08', NULL, '20,628', '10,314', '7,616', '1,031', '1,667', '20,628', '1,800', '671', ' ', '-   ', '862', '23,961', '1,800', '155', '200', '', '18,473'),
(341, 701, 'Feb\'25', 'Ms.', 'Seema Opendra Singh', 'HK Associate', 'House Keeping', 'Linan Attendant', 'Female', '24-Jan-98', '17-Nov-18', NULL, '18,128', '9,064', '7,616', '906', '542', '18,128', '1,800', '590', ' ', '-   ', '802', '21,320', '1,800', '136', ' ', '-   ', ''),
(342, 2136, 'Feb\'25', 'Ms.', 'Usha Singh', 'HK Associate', 'House Keeping', 'Linan Attendant', 'Female', '24-Nov-92', '23-Jan-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', ' '),
(343, 902, 'Feb\'25', 'Ms.', 'Usha Rajesh Patekar', 'HK Associate', 'House Keeping', 'Public Area', 'Female', '19-Jul-82', '23-Jul-16', NULL, '15,372', '7,686', '7,616', '70', ' ', '-   ', '15,372', '1,800', '500', ' ', '-   ', '736', '18,408', '1,800', '116', ' ', '-   '),
(344, 336, 'Feb\'25', 'Mr.', 'Santosh Parbat Shinde', 'HK Associate', 'House Keeping', 'Room Attendant', 'Male', '01-Jun-80', '09-Dec-14', NULL, '18,420', '9,210', '7,616', '921', '673', '18,420', '1,800', '599', ' ', '-   ', '809', '21,628', '1,800', '139', '200', '', '16,281'),
(345, 1461, 'Feb\'25', 'Mr.', 'Hira Rakesh Barshingnath', 'HK Associate', 'House Keeping', 'Public Area', 'Female', '17-Apr-85', '09-Apr-15', NULL, '15,372', '7,686', '7,616', '70', ' ', '-   ', '15,372', '1,800', '500', ' ', '-   ', '736', '18,408', '1,800', '116', ' ', '-   '),
(346, 486, 'Feb\'25', 'Mr.', 'Amit Sah', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '01-Jan-93', '14-Jul-21', NULL, '17,372', '8,686', '7,616', '869', '201', '17,372', '1,800', '565', ' ', '-   ', '784', '20,521', '1,800', '131', '200', '', '15,241'),
(347, 339, 'Feb\'25', 'Mr.', 'Balaram Mahalik', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '16-May-89', '21-Nov-17', NULL, '17,372', '8,686', '7,616', '869', '201', '17,372', '1,800', '565', ' ', '-   ', '784', '20,521', '1,800', '131', '200', '', '15,241'),
(348, 1301, 'Feb\'25', 'Ms.', 'Sarika Pandurang Gorad', 'HK Associate', 'House Keeping', 'Room Attendant', 'Female', '23-Jul-89', '12-Dec-21', NULL, '16,372', '8,186', '7,616', '570', ' ', '-   ', '16,372', '1,800', '533', ' ', '-   ', '760', '19,465', '1,800', '123', ' ', '-   '),
(349, 2123, 'Feb\'25', 'Mr.', 'Vindeshwar Ram', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '16-Aug-98', '23-Jan-24', NULL, '16,000', '8,000', '7,616', '384', '', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', '', '13,880'),
(350, 2448, 'Feb\'25', 'Mr.', 'Noor Afsa Khan', 'HK Associate', 'House Keeping', 'Public Area', 'Female', '16-Dec-93', '10-Oct-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', ' ', '-   '),
(351, 1433, 'Feb\'25', 'Mr.', 'Shamshad Khan', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '01-Jun-96', '15-Mar-22', NULL, '16,372', '8,186', '7,616', '570', ' ', '-   ', '16,372', '1,800', '533', ' ', '-   ', '760', '19,465', '1,800', '123', '200', ''),
(352, 1612, 'Feb\'25', 'Mr.', 'Uday Ghatwar', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '12-May-03', '21-Sep-22', NULL, '15,036', '7,420', '7,616', ' ', '-   ', ' ', '-   ', '15,036', '1,800', '489', ' ', '-   ', '723', '18,048', '1,800', '113', '200'),
(353, 2447, 'Feb\'25', 'Mr.', 'Sagar Santosh Ingle', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '04-Aug-05', '11-Oct-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(354, 1668, 'Feb\'25', 'Mr.', 'Afzal UmarAli Shaikh', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '13-Apr-87', '12-Nov-22', NULL, '16,536', '8,268', '7,616', '652', ' ', '-   ', '16,536', '1,800', '538', ' ', '-   ', '764', '19,638', '1,800', '125', '200', ''),
(355, 1674, 'Feb\'25', 'Mr.', 'Ramesh Ram', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '05-Jan-03', '21-Nov-22', 580, '14,616', '7,000', '7,616', '', '', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', '200', '', '12,552'),
(356, 2528, 'Feb\'25', 'Mr.', 'Rutik Rajendra Shinde', 'HK Associate', 'House Keeping', 'Room Attendant', 'Male', '', '17-Nov-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(357, 1722, 'Feb\'25', 'Mr.', 'Karim Uddin', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '11-May-02', '11-Feb-23', NULL, '15,172', '7,556', '7,616', ' ', '-   ', ' ', '-   ', '15,172', '1,800', '494', ' ', '-   ', '730', '18,196', '1,800', '114', '200'),
(358, 1760, 'Feb\'25', 'Mr.', 'Abhisek Ghatwar', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '01-Jan-04', '26-Mar-23', 944, '14,616', '7,000', '7,616', '', '', '14,616', '1,754', '476', ' ', '-   ', '703', '17,549', '1,754', '110', '200', '', '12,552'),
(359, 1827, 'Feb\'25', 'Mr.', 'Anil Shantaram Pawar', 'Gardner', 'House Keeping', 'Gardner', 'Male', '25-Jun-84', '24-May-23', NULL, '17,672', '8,836', '7,616', '884', '336', '17,672', '1,800', '575', ' ', '-   ', '791', '20,838', '1,800', '133', '200', '', '15,539'),
(360, 1835, 'Feb\'25', 'Mr.', 'Nadim ', 'HK Associate', 'House Keeping', 'Room Attendant', 'Male', '27-Jan-99', '02-Jun-23', NULL, '14,672', '7,056', '7,616', ' ', '-   ', ' ', '-   ', '14,672', '1,761', '477', ' ', '-   ', '706', '17,616', '1,761', '111', '200'),
(361, 1895, 'Feb\'25', 'Mr.', 'Nitish Kamat', 'HK Associate', 'House Keeping', 'Room Attendant', 'Male', '11-Sep-05', '05-Aug-23', NULL, '15,420', '7,710', '7,616', '94', '', '15,420', '1,800', '502', ' ', '-   ', '737', '18,459', '1,800', '116', '200', '', '13,304'),
(362, 1651, 'Feb\'25', 'Mr.', 'MD.Naimul Haque', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '03-Jan-99', '19-Oct-23', NULL, '15,220', '7,604', '7,616', ' ', '-   ', ' ', '-   ', '15,220', '1,800', '495', ' ', '-   ', '732', '18,247', '1,800', '115', '200'),
(363, 1688, 'Feb\'25', 'Mr.', 'Mohammed Irfan Shaikh', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '07-May-00', '23-Dec-23', NULL, '15,920', '7,960', '7,616', '344', '', '15,920', '1,800', '518', ' ', '-   ', '749', '18,987', '1,800', '120', '200', '', '13,800'),
(364, 2198, 'Feb\'25', 'Mr.', 'Ashish Kumar', 'HK Associate', 'House Keeping', 'Room Attendant', 'Male', '15-May-02', '05-Mar-24', NULL, '15,500', '7,750', '7,616', '134', ' ', '-   ', '15,500', '1,800', '504', ' ', '-   ', '739', '18,543', '1,800', '117', '200', ''),
(365, 2252, 'Feb\'25', 'Mr.', 'Samir Pardale', 'HK Associate', 'House Keeping', 'Room Attendant', 'Male', '05-Sep-91', '13-Mar-24', NULL, '16,000', '8,000', '7,616', '384', '', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', '', '13,880'),
(366, 2282, 'Feb\'25', 'Mr.', 'Surendra Madas', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '01-Jun-93', '27-Mar-24', NULL, '15,000', '7,384', '7,616', ' ', '-   ', ' ', '-   ', '15,000', '1,800', '488', ' ', '-   ', '722', '18,010', '1,800', '113', '200'),
(367, 2334, 'Feb\'25', 'Mr.', 'Shamsir Ali', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '06-Feb-02', '15-May-24', NULL, '16,500', '8,250', '7,616', '634', ' ', '-   ', '16,500', '1,800', '537', ' ', '-   ', '763', '19,600', '1,800', '124', '200', ''),
(368, 2335, 'Feb\'25', 'Ms.', 'Anamika Vishwakarma', 'HK Desk Attendant', 'House Keeping', 'Desk Attendant', 'Female', '01-Feb-01', '15-May-24', NULL, '16,000', '8,000', '7,616', '384', '', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', ' ', '-   ', ''),
(369, 2430, 'Feb\'25', 'Mr.', 'Musud Raza ', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '11-May-95', '23-Sep-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', '');
INSERT INTO `salary_payments` (`id`, `Emp_No`, `Month`, `Title`, `Employee_Name`, `Designation`, `Department`, `Section_Outlet`, `Gender`, `DOB`, `DOJ`, `DOL`, `Actual_Salary`, `Basic`, `DA`, `HRA`, `CONV`, `Monthly_Gross_Salary`, `Emper_PF`, `Emper_ESIC`, `Stat_Bonus`, `Grauity`, `Monthly_CTC`, `Empee_PF`, `Empee_ESIC`, `PT`, `TDS`, `Monthly_Net_Salary`, `Total_Days`) VALUES
(370, 2530, 'Feb\'25', 'Mr.', 'Akshat Mahale', 'HK Associate', 'House Keeping', 'Public Area', 'Male', '02-Jul-04', '17-Nov-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(371, 2560, 'Feb\'25', 'Mr.', 'Ronjon Tisso', 'H.K.Associate', 'House Keeping', 'Public Area', 'Male', '17-Oct-98', '12-Dec-24', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', ' ', '-   ', '520', ' ', '-   ', '751', '17,271', ' ', '-   ', '120'),
(372, 2574, 'Feb\'25', 'Mr.', 'Irmiya Bading', 'H.K.Associate', 'House Keeping', 'Public Area', 'Male', '01-Jan-05', '09-Jan-25', 616, '14,616', '7,000', '7,616', '', '', '14,616', ' ', '-   ', '476', ' ', '-   ', '703', '15,795', ' ', '-   ', '110', '200'),
(373, 2580, 'Feb\'25', 'Mr.', 'Ribul Haque', 'H.K.Associate', 'House Keeping', 'Room Attendant', 'Male', '20-Jun-05', '14-Jan-25', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', ' ', '-   ', '520', ' ', '-   ', '751', '17,271', ' ', '-   ', '120'),
(374, 2599, 'Feb\'25', 'Mr.', 'Rohitson Tisso', 'H.K.Associate', 'House Keeping', 'Public Area', 'Male', '27-Feb-02', '05-Feb-25', NULL, '16,000', '8,000', '7,616', '384', ' ', '-   ', '16,000', '1,800', '520', ' ', '-   ', '751', '19,071', '1,800', '120', '200', ''),
(375, 1795, 'Feb\'25', 'Mr.', 'Ghanshyam', 'Junior Engineer ', 'Engineering', 'Engineering', 'Male', '12-Oct-91', '08-May-23', NULL, '22,672', '11,336', '7,616', '1,134', '2,586', '22,672', '1,800', ' ', '-   ', ' ', '-   ', '912', '25,384', '1,800', ' ', '-   ', '200'),
(376, 129, 'Feb\'25', 'Mr.', 'Ajay Pratap Singh', 'A.C. Technician', 'Engineering', 'Engineering', 'Male', '20-Apr-87', '13-Sep-12', NULL, '28,878', '14,439', '7,616', '1,444', '5,379', '28,878', '1,800', ' ', '-   ', ' ', '-   ', '1,061', '31,739', '1,800', ' ', '-   ', '200'),
(377, 140, 'Feb\'25', 'Mr.', 'Pramod Kumar Behera', 'Sr. Electrician', 'Engineering', 'Engineering', 'Male', '22-Aug-82', '01-Jan-20', NULL, '31,699', '15,850', '7,616', '7,925', '308', '31,699', '1,800', ' ', '-   ', ' ', '-   ', '1,129', '34,628', '1,800', ' ', '-   ', '200'),
(378, 128, 'Feb\'25', 'Mr.', 'Biswojit Biswas', 'Sr. AC Technician ', 'Engineering', 'Engineering', 'Male', '01-Aug-69', '11-May-12', NULL, '31,473', '15,737', '7,616', '7,868', '252', '31,473', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,123', '32,596', ' ', '-   ', ' '),
(379, 136, 'Feb\'25', 'Mr.', 'Ajay Kumar Yadav', 'Electrician', 'Engineering', 'Engineering', 'Male', '10-Jul-93', '08-Feb-12', NULL, '25,202', '12,601', '7,616', '1,260', '3,725', '25,202', ' ', '-   ', ' ', '-   ', ' ', '-   ', '972', '26,174', ' ', '-   ', ' '),
(380, 135, 'Feb\'25', 'Mr.', 'Santosh Prabhakar Patra', 'Electrician', 'Engineering', 'Engineering', 'Male', '21-Jul-73', '26-Nov-10', NULL, '25,807', '12,904', '7,616', '1,290', '3,997', '25,807', '1,800', ' ', '-   ', ' ', '-   ', '987', '28,594', '1,800', ' ', '-   ', '200'),
(381, 1111, 'Feb\'25', 'Mr.', 'Manoj Kumar', 'Carpenter', 'Engineering', 'Engineering', 'Male', '22-Dec-95', '19-Aug-19', NULL, '27,237', '13,619', '7,616', '1,362', '4,640', '27,237', '1,800', ' ', '-   ', ' ', '-   ', '1,021', '30,058', '1,800', ' ', '-   ', '200'),
(382, 1275, 'Feb\'25', 'Mr.', 'Durgesh Kumar Gupta', 'Carpenter', 'Engineering', 'Engineering', 'Male', '10-Sep-90', '15-Nov-21', NULL, '27,237', '13,619', '7,616', '1,362', '4,640', '27,237', '1,800', ' ', '-   ', ' ', '-   ', '1,021', '30,058', '1,800', ' ', '-   ', '200'),
(383, 1309, 'Feb\'25', 'Mr.', 'Umesh Mohan Aravandekar', 'Electrician', 'Engineering', 'Engineering', 'Male', '11-Sep-79', '24-Mar-07', NULL, '25,301', '12,651', '7,616', '1,265', '3,769', '25,301', ' ', '-   ', ' ', '-   ', ' ', '-   ', '975', '26,276', ' ', '-   ', ' '),
(384, 1474, 'Feb\'25', 'Mr.', 'Rupesh Shantaram Rasal', 'Electrician', 'Engineering', 'Engineering', 'Male', '11-Dec-91', '26-Apr-22', NULL, '25,306', '12,653', '7,616', '1,265', '3,772', '25,306', '1,800', ' ', '-   ', ' ', '-   ', '975', '28,081', '1,800', ' ', '-   ', '200'),
(385, 1494, 'Feb\'25', 'Mr.', 'Kallu Makku Saroj', 'Painter', 'Engineering', 'Engineering', 'Male', '01-Jan-71', '20-May-22', NULL, '27,372', '13,686', '7,616', '1,369', '4,701', '27,372', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,025', '28,397', ' ', '-   ', ' '),
(386, 1487, 'Feb\'25', 'Mr.', 'Leeroy Lyan Martis', 'Electrician', 'Engineering', 'Engineering', 'Male', '11-Aug-95', '10-May-22', NULL, '25,856', '12,928', '7,616', '1,293', '4,019', '25,856', '1,800', ' ', '-   ', ' ', '-   ', '988', '28,644', '1,800', ' ', '-   ', '200'),
(387, 1536, 'Feb\'25', 'Mr.', 'Swarajya Pani Grahi', 'Mason', 'Engineering', 'Engineering', 'Male', '01-Jan-73', '25-Jun-22', NULL, '24,872', '12,436', '7,616', '1,244', '3,576', '24,872', ' ', '-   ', ' ', '-   ', ' ', '-   ', '965', '25,837', ' ', '-   ', ' '),
(388, 1577, 'Feb\'25', 'Mr.', 'Vinod Kumar', 'Painter', 'Engineering', 'Engineering', 'Male', '01-Jan-96', '22-Aug-22', NULL, '23,036', '11,518', '7,616', '1,152', '2,750', '23,036', '1,800', ' ', '-   ', ' ', '-   ', '920', '25,756', '1,800', ' ', '-   ', '200'),
(389, 1422, 'Feb\'25', 'Mr.', 'Rakesh Raju Malayattil', 'Head Protection Officer', 'Security', 'Security', 'Male', '05-Dec-89', '24-Feb-22', NULL, '35,000', '17,500', '7,616', '8,750', '1,134', '35,000', '1,800', ' ', '-   ', ' ', '-   ', '1,208', '38,008', '1,800', ' ', '-   ', '200'),
(390, 2410, 'Feb\'25', 'Mr.', 'Ajay Narayan Khedekar', 'Security & Safety Officer', 'Security', 'Security', 'Male', '31-Oct-75', '23-Aug-24', NULL, '24,000', '12,000', '7,616', '1,200', '3,184', '24,000', '1,800', ' ', '-   ', ' ', '-   ', '944', '26,744', '1,800', ' ', '-   ', '200'),
(391, 2386, 'Feb\'25', 'Mr.', 'Saif Ali Qureshi', 'Vigilance Officer', 'Security', 'Security', 'Male', '20-Apr-97', '25-Jun-24', NULL, '24,000', '12,000', '7,616', '1,200', '3,184', '24,000', '1,800', ' ', '-   ', ' ', '-   ', '944', '26,744', '1,800', ' ', '-   ', '200'),
(392, 1429, 'Feb\'25', 'Mr.', 'Irfan Hussain Chunawala', 'Protection Officer', 'Security', 'Security', 'Male', '30-Jul-87', '01-Mar-22', NULL, '21,372', '10,686', '7,616', '1,069', '2,001', '21,372', ' ', '-   ', ' ', '-   ', ' ', '-   ', '880', '22,252', ' ', '-   ', ' '),
(393, 1428, 'Feb\'25', 'Ms.', 'Chandrakala Muddu Kotian', 'Lady Protection Officer', 'Security', 'Security', 'Female', '04-Jun-78', '01-Mar-22', NULL, '21,372', '10,686', '7,616', '1,069', '2,001', '21,372', '1,800', ' ', '-   ', ' ', '-   ', '880', '24,052', '1,800', ' ', '-   ', ' '),
(394, 1591, 'Feb\'25', 'Ms.', 'Rukhsana Siraj Sayyed', 'Protection Officer', 'Security', 'Security', 'Female', '15-Oct-80', '06-Sep-22', NULL, '21,036', '10,518', '7,616', '1,052', '1,850', '21,036', '1,800', ' ', '-   ', ' ', '-   ', '872', '23,708', '1,800', ' ', '-   ', ' '),
(395, 1616, 'Feb\'25', 'Ms.', 'Seema Vishnu Yadav', 'Security Guard', 'Security', 'Security', 'Female', '02-May-86', '26-Sep-22', NULL, '21,036', '10,518', '7,616', '1,052', '1,850', '21,036', '1,800', ' ', '-   ', ' ', '-   ', '872', '23,708', '1,800', ' ', '-   ', ' '),
(396, 884, 'Feb\'25', 'Mr.', 'Nishikant Painingankar', 'Protection Officer', 'Security', 'Security', 'Male', '20-Jul-90', '10-Feb-18', NULL, '21,372', '10,686', '7,616', '1,069', '2,001', '21,372', ' ', '-   ', ' ', '-   ', ' ', '-   ', '880', '22,252', ' ', '-   ', ' '),
(397, 1768, 'Feb\'25', 'Mr.', 'Nilu Gupta', 'Security Controller', 'Security', 'Security', 'Female', '26-Aug-94', '01-Apr-23', NULL, '20,672', '10,336', '7,616', '1,034', '1,686', '20,672', '1,800', '672', ' ', '-   ', '863', '24,007', '1,800', '156', ' ', '-   ', ''),
(398, 1871, 'Feb\'25', 'Mr.', 'Sandesh Vijay Singh', 'Protection Officer', 'Security', 'Security', 'Male', '07-Sep-93', '05-Jul-23', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', '200', '', '18,266'),
(399, 2009, 'Feb\'25', 'Mr.', 'Jayesh Solanki', 'Protection Officer', 'Security', 'Security', 'Male', '24-Mar-90', '16-Aug-23', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', '200', '', '18,266'),
(400, 2008, 'Feb\'25', 'Ms.', 'Aarti Chawan', 'Protection Officer', 'Security', 'Security', 'Female', '08-Sep-90', '16-Aug-23', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', ' ', '-   ', ''),
(401, 2021, 'Feb\'25', 'Mr.', 'Rohit Suresh Singh', 'Head Protection Officer', 'Security', 'Security', 'Male', '30-Jun-93', '02-Sep-23', NULL, '28,000', '14,000', '7,616', '1,400', '4,984', '28,000', '1,800', ' ', '-   ', ' ', '-   ', '1,040', '30,840', '1,800', ' ', '-   ', '200'),
(402, 2109, 'Feb\'25', 'Mr.', 'Shahzeb Khan', 'Protection Officer', 'Security', 'Security', 'Male', '10-Mar-03', '01-Dec-23', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', '200', '', '18,266'),
(403, 2382, 'Feb\'25', 'Ms.', 'Priya Dinesh Pawar', 'Lady Protection Office', 'Security', 'Security', 'Female', '17-Dec-91', '01-Jul-24', NULL, '20,000', '10,000', '7,616', '1,000', '1,384', '20,000', '1,800', '650', ' ', '-   ', '847', '23,297', '1,800', '150', ' ', '-   ', ''),
(404, 2532, 'Feb\'25', 'Mr.', 'Mohd Zuher Khan', 'Secuirty Officer', 'Security', 'Security', 'Male', '01-Dec-24', '01-Dec-24', NULL, '22,000', '11,000', '7,616', '1,100', '2,676', '22,000', '1,800', ' ', '-   ', ' ', '-   ', '895', '24,695', '1,800', ' ', '-   ', '200'),
(405, 2363, 'Feb\'25', 'Mr.', 'Balbinders Sharma', 'Purchase Manager', 'Procurement', 'Procurement', 'Male', '23-Jul-76', '12-Jun-24', NULL, '70,000', '35,000', '7,616', '17,500', '9,884', '70,000', '1,800', ' ', '-   ', ' ', '-   ', '2,050', '73,850', '1,800', ' ', '-   ', '200'),
(406, 1317, 'Feb\'25', 'Mr.', 'Swapnil Shankar Gurav', 'Purchase Manager', 'Procurement', 'Procurement', 'Male', '14-Jul-89', '01-Dec-16', NULL, '55,420', '27,710', '7,616', '13,855', '6,239', '55,420', '1,800', ' ', '-   ', ' ', '-   ', '1,699', '58,919', '1,800', ' ', '-   ', '200'),
(407, 2302, 'Feb\'25', 'Mr.', 'Lavu Dahibavkar', 'Store Manager', 'Procurement', 'Procurement', 'Male', '16-Oct-89', '17-Apr-24', NULL, '50,000', '25,000', '7,616', '12,500', '4,884', '50,000', '1,800', ' ', '-   ', ' ', '-   ', '1,569', '53,369', '1,800', ' ', '-   ', '200'),
(408, 1129, 'Feb\'25', 'Mr.', 'Rupesh Krishna Karve', 'Storekeeper', 'Procurement', 'Procurement', 'Male', '01-Jul-89', '03-Dec-19', NULL, '23,420', '11,710', '7,616', '1,171', '2,923', '23,420', '1,800', ' ', '-   ', ' ', '-   ', '930', '26,150', '1,800', ' ', '-   ', '200'),
(409, 2052, 'Feb\'25', 'Mr.', 'Ketan Ashok Ghavali', 'Storekeeper', 'Procurement', 'Procurement', 'Male', '04-Nov-93', '14-Jan-24', NULL, '20,420', '10,210', '7,616', '1,021', '1,573', '20,420', '1,800', '664', ' ', '-   ', '857', '23,741', '1,800', '154', '200', '', '18,266'),
(410, 2160, 'Feb\'25', 'Mr.', 'Saharabano Shaikh', 'Storekeeper', 'Procurement', 'Procurement', 'Male', '19-Mar-00', '13-Feb-24', NULL, '18,500', '9,250', '7,616', '925', '709', '18,500', '1,800', '602', ' ', '-   ', '811', '21,713', '1,800', '139', ' ', '-   ', ''),
(411, 1575, 'Feb\'25', 'Mr.', 'Dinesh Laxuman Ghadge', 'Storekeeper', 'Procurement', 'Procurement', 'Male', '16-Dec-80', '15-Aug-24', NULL, '18,500', '9,250', '7,616', '925', '709', '18,500', '1,800', '602', ' ', '-   ', '811', '21,713', '1,800', '139', '200', '', '16,361'),
(412, 1546, 'Feb\'25', 'Mr.', 'Ravikant Ramhajur Vishwakarma', 'IT Associate', 'IT', 'IT', 'Male', '20-Jul-89', '06-Jul-22', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', '1,800', ' ', '-   ', ' ', '-   ', '968', '27,768', '1,800', ' ', '-   ', '200'),
(413, 2471, 'Feb\'25', 'Mr.', 'Vinothkumar', 'IT Manager', 'IT', 'IT', 'Male', '22-Aug-90', '11-Sep-24', NULL, '55,000', '27,500', '7,616', '13,750', '6,134', '55,000', '1,800', ' ', '-   ', ' ', '-   ', '1,689', '58,489', '1,800', ' ', '-   ', '200'),
(414, 2451, 'Feb\'25', 'Mr.', 'Shadab Akhter', 'IT Associate', 'IT', 'IT', 'Male', '05-Nov-94', '14-Oct-24', NULL, '24,000', '12,000', '7,616', '1,200', '3,184', '24,000', '1,800', ' ', '-   ', ' ', '-   ', '944', '26,744', '1,800', ' ', '-   ', '200'),
(415, 2581, 'Feb\'25', 'Mr.', 'Mohd Qaddafi Qureshi', 'IT Associate', 'IT', 'IT', 'Male', '05-Nov-94', '15-Jan-25', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', '1,800', ' ', '-   ', ' ', '-   ', '968', '27,768', '1,800', ' ', '-   ', '200'),
(416, 116, 'Feb\'25', 'Mr.', 'Rohit J Shetty', 'Liasoning Executive', 'Liasioning', 'Liasioning', 'Male', '20-Feb-84', '21-Aug-08', NULL, '53,036', '26,518', '7,616', '13,259', '5,643', '53,036', ' ', '-   ', ' ', '-   ', ' ', '-   ', '1,642', '54,678', ' ', '-   ', ' '),
(417, 120, 'Feb\'25', 'Mr.', 'Sudhakar Annappa Shellyagol', 'Liasoning Officer', 'Liasioning', 'Liasioning', 'Male', '22-Jun-80', '03-Jul-12', NULL, '28,172', '14,086', '7,616', '1,409', '5,061', '28,172', '1,800', ' ', '-   ', ' ', '-   ', '1,044', '31,016', '1,800', ' ', '-   ', '200'),
(418, 25, 'Feb\'25', 'Mr.', 'Suresh Mohan Singh', 'Liasoning Officer', 'Liasioning', 'Liasioning', 'Male', '08-Oct-75', '20-Jun-08', NULL, '41,036', '20,518', '7,616', '10,268', '2,634', '41,036', '1,800', ' ', '-   ', ' ', '-   ', '1,353', '44,189', '1,800', ' ', '-   ', '200'),
(419, 2364, 'Feb\'25', 'Mr.', 'Kedar Harchilkar', 'Finance Head', 'Accounts', 'Accounts', 'Male', '03-Jun-73', '17-Jun-24', NULL, '1,50,000', '75,000', '7,616', '37,500', '29,884', '1,50,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '3,974', '1,53,974', ' ', '-   ', ' '),
(420, 188, 'Feb\'25', 'Mr.', 'Shamrao Bhimrao Waghode', 'Asst. Acc Manager', 'Accounts', 'Accounts', 'Male', '26-Apr-98', '01-Apr-05', NULL, '42,672', '21,336', '7,616', '10,668', '3,052', '42,672', '1,800', ' ', '-   ', ' ', '-   ', '1,393', '45,865', '1,800', ' ', '-   ', '200'),
(421, 2403, 'Feb\'25', 'Mr.', 'Harshavardhan Dnyandev Kadam', 'Accounts Executive', 'Accounts', 'Accounts', 'Male', '01-Apr-95', '01-Aug-24', NULL, '30,000', '15,000', '7,616', '1,500', '5,884', '30,000', '1,800', ' ', '-   ', ' ', '-   ', '1,088', '32,888', '1,800', ' ', '-   ', '200'),
(422, 2455, 'Feb\'25', 'Ms.', 'Bhavika Vikas Katekar', 'Accounts Executive', 'Accounts', 'Accounts', 'Female', '12-Oct-02', '17-Oct-24', NULL, '17,000', '8,500', '7,616', '766', '118', '17,000', '1,800', '553', ' ', '-   ', '775', '20,128', '1,800', '128', ' ', '-   ', ''),
(423, 2541, 'Feb\'25', 'Ms.', 'Anjana Iyer', 'Accounts Executive', 'Accounts', 'Accounts', 'Female', '05-Jul-75', '09-Dec-24', NULL, '25,000', '12,500', '7,616', '1,250', '3,634', '25,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '968', '25,968', ' ', '-   ', ' '),
(424, 2053, 'Feb\'25', 'Mr.', 'Mahesh Anand Devadiga', 'Asst. Manager Controls', 'F&B Control', 'Accounts', 'Male', '20-Jan-86', '20-Oct-23', NULL, '50,420', '25,210', '7,616', '12,605', '4,989', '50,420', '1,800', ' ', '-   ', ' ', '-   ', '1,579', '53,799', '1,800', ' ', '-   ', '200'),
(425, 764, 'Feb\'25', 'Mr.', 'Paresh Ravindra Kambli', 'Assistant F&B Controller', 'F&B Control', 'Accounts', 'Male', '03-Jan-83', '07-Dec-21', NULL, '36,420', '18,210', '7,616', '9,105', '1,489', '36,420', '1,800', ' ', '-   ', ' ', '-   ', '1,242', '39,462', '1,800', ' ', '-   ', '200'),
(426, 2316, 'Feb\'25', 'Mr.', 'Sachin Vaidya', 'HR Manager', 'Human Resources', 'Human Resources', 'Male', '06-Feb-76', '24-Apr-24', NULL, '1,00,000', '50,000', '7,616', '25,000', '17,384', '1,00,000', '1,800', ' ', '-   ', ' ', '-   ', '2,771', '1,04,571', '1,800', ' ', '-   ', '200'),
(427, 1723, 'Feb\'25', 'Ms.', 'Priyanka Munnalal Valmiki', 'HR Associate', 'Human Resources', 'Human Resources', 'Female', '09-Sep-97', '13-Feb-23', NULL, '17,672', '8,836', '7,616', '884', '336', '17,672', '1,800', '575', ' ', '-   ', '791', '20,838', '1,800', '133', ' ', '-   ', ''),
(428, 2091, 'Feb\'25', 'Mr.', 'Aryan Opendra Singh', 'HR Associate', 'Human Resources', 'Human Resources', 'Male', '26-Jan-04', '04-Dec-23', NULL, '16,420', '8,210', '7,616', '594', ' ', '-   ', '16,420', '1,800', '534', ' ', '-   ', '761', '19,515', '1,800', '124', '200', ''),
(429, 2543, 'Feb\'25', 'Mr.', 'Wajid Ali Khan', 'HR Executive', 'Human Resources', 'Human Resources', 'Male', '05-Jul-89', '11-Dec-24', NULL, '35,000', '17,500', '7,616', '8,750', '1,134', '35,000', '1,800', ' ', '-   ', ' ', '-   ', '1,208', '38,008', '1,800', ' ', '-   ', '200'),
(430, 2573, 'Feb\'25', 'Mr.', 'Pawan Samarth  Bansod', 'Sales Manager', 'Sales', 'Sales', 'Male', '04-Aug-89', '08-Jan-25', NULL, '42,000', '21,000', '7,616', '10,500', '2,884', '42,000', '1,800', ' ', '-   ', ' ', '-   ', '1,376', '45,176', '1,800', ' ', '-   ', '200'),
(431, 2319, 'Feb\'25', 'Mr.', 'Kirthi Shetty', 'Hotel Operations Manager', 'Admin', 'Admin', 'Male', '27-Oct-77', '26-Apr-24', NULL, '1,80,000', '90,000', '7,616', '45,000', '37,384', '1,80,000', '1,800', ' ', '-   ', ' ', '-   ', '4,695', '1,86,495', '1,800', ' ', '-   ', '200'),
(432, NULL, 'Feb\'25', 'Mr.', 'Rohit Iyer', 'Consultant', 'OPA - Others', 'F&B - Others', 'Male', '', '', NULL, '40,000', '40,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '40,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', ' ', '-   '),
(433, 1438, 'Feb\'25', 'Mr.', 'Jagdish Rai', 'Consultant', 'Café Crema ', 'F&B - Service', 'Male', '', '19-Mar-22', NULL, '29,592', '29,592', ' ', '-   ', ' ', '-   ', ' ', '-   ', '29,592', ' ', '-   ', ' ', '-   ', ' ', '-   ', ' ', '-   '),
(434, 1329, 'Feb\'25', 'Mr.', 'Hitesh Prataprai Goradia', 'Consultant', 'Accounts', 'Accounts', 'Male', '17-Jan-64', '01-Apr-21', NULL, '36,420', '36,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', '36,420', ' ', '-   ', ' ', '-   ', ' ', '-   ', ' ', '-   '),
(435, 2564, 'Feb\'25', 'Mr.', 'Ankit Arjun Singh', 'OJT (Chinees)', 'F&B Production', 'Main Kitchen', 'Male', '01-Nov-06', '01-Jan-25', NULL, '10,000', '10,000', '', '', ' ', '-   ', '10,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', ' ', '-   ', '10,000', ' '),
(436, 2606, 'Feb\'25', 'Mr.', 'Bishes Singh', 'OJT', 'F&B Production', 'Main Kitchen', 'Male', '', '15-Feb-25', NULL, '10,000', '10,000', '', '', ' ', '-   ', '10,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', ' ', '-   ', '10,000', ' '),
(437, 2591, 'Feb\'25', 'Mr.', 'Emmanuel Fernandes', 'OJT', 'Waikiki - Service', 'Waikiki - Service', 'Male', '11-Nov-02', '28-Jan-25', NULL, '10,000', '10,000', '', '', ' ', '-   ', '10,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', ' ', '-   ', '10,000', ' '),
(438, 2605, 'Feb\'25', 'Mr.', 'Hrishikesh Borkar', 'OJT', 'Waikiki - Service', 'Waikiki - Service', 'Male', '', '14-Feb-25', NULL, '5,000', '5,000', '', '', ' ', '-   ', '5,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', ' ', '-   ', '5,000', ' '),
(439, 2351, 'Feb\'25', 'Ms.', 'Vaishnavi Patil', 'OJT', 'Café Crema ', 'F&B - Service', 'Female', '', '01-Jun-24', NULL, '12,000', '12,000', ' ', '-   ', ' ', '-   ', ' ', '-   ', '12,000', ' ', '-   ', ' ', '-   ', '', ' ', '-   ', '12,000'),
(440, NULL, 'Feb\'25', 'Mr.', 'Narayan Gujar', 'Trafic Controler', 'Security', 'Security', 'Male', '', '01-Aug-22', NULL, '12,500', '12,500', ' ', '-   ', ' ', '-   ', ' ', '-   ', '12,500', ' ', '-   ', ' ', '-   ', ' ', '-   ', ' ', '-   '),
(441, NULL, 'Feb\'25', 'Mr.', 'Pradip Dhivar Kumar', 'Trafic Controler', 'Security', 'Security', 'Male', '', '24-Nov-21', NULL, '12,500', '12,500', ' ', '-   ', ' ', '-   ', ' ', '-   ', '12,500', ' ', '-   ', ' ', '-   ', ' ', '-   ', ' ', '-   ');

-- --------------------------------------------------------

--
-- Table structure for table `salary_structure`
--

CREATE TABLE `salary_structure` (
  `id` int(11) NOT NULL,
  `basic_percent` decimal(5,2) NOT NULL,
  `da_percent` decimal(5,2) NOT NULL,
  `hra_percent` decimal(5,2) NOT NULL,
  `conv_percent` decimal(5,2) NOT NULL,
  `medical_percent` decimal(5,2) NOT NULL,
  `pf_percent` decimal(5,2) NOT NULL,
  `esic_percent` decimal(5,2) NOT NULL,
  `effective_from` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary_structure`
--

INSERT INTO `salary_structure` (`id`, `basic_percent`, `da_percent`, `hra_percent`, `conv_percent`, `medical_percent`, `pf_percent`, `esic_percent`, `effective_from`, `created_at`) VALUES
(1, 50.00, 10.00, 20.00, 10.00, 10.00, 12.00, 1.75, '2025-01-01', '2025-03-24 17:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `email` varchar(155) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('Admin','Manager','Employee') DEFAULT 'Employee',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `email`, `username`, `password`, `role`, `created_at`) VALUES
(1, 1, 'admin@example.com', 'admin', '$2y$10$Po4mt77JN1E1WJTfBp6KZuMX6Yq8qIwR5RoFVH9FgY4QxPRTOP45S', 'Admin', '2025-03-29 18:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `push_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `marketing_notifications` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `salary_payments`
--
ALTER TABLE `salary_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_structure`
--
ALTER TABLE `salary_structure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salary_payments`
--
ALTER TABLE `salary_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=443;

--
-- AUTO_INCREMENT for table `salary_structure`
--
ALTER TABLE `salary_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD CONSTRAINT `user_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
