-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2022 at 07:03 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eirish_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendancee`
--

CREATE TABLE `attendancee` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `dateTime` varchar(50) NOT NULL,
  `logType` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendancee`
--

INSERT INTO `attendancee` (`id`, `emp_id`, `name`, `dateTime`, `logType`) VALUES
(2, 1002, 'luka', '17-11-2022 21:39:17', 'IN'),
(3, 1003, 'ungas', '17-11-2022 21:39:17', 'IN'),
(4, 1001, 'barok', '17-11-2022 21:39:17', 'OUT');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `rate` double NOT NULL,
  `phonenumber` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `birth_date` date NOT NULL,
  `civil_status` varchar(45) NOT NULL,
  `emergency_name` varchar(45) NOT NULL,
  `emergency_contact` varchar(45) NOT NULL,
  `job_id` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_id`, `name`, `address`, `position`, `rate`, `phonenumber`, `sex`, `birth_date`, `civil_status`, `emergency_name`, `emergency_contact`, `job_id`, `salary_id`) VALUES
(26, '26', 'Jordan', 'Bulacans', 'Staff', 10000, '09489600121', 'Male', '0000-00-00', 'Married', 'Mae', '0975432451', 0, 0),
(31, '31', 'Leo Santos', 'Bulacan', 'Owner', 10000000000, '09489600121', 'bading', '0000-00-00', 'Married', 'Mae', '0975432451', 0, 0),
(32, '', 'John Ellery Manlapas', 'Bulacan', 'Owner', 10000, '09489600121', 'Male', '0000-00-00', 'Married', 'Roi', '0975432451', 0, 0),
(33, '', 'Kenn Arthel', 'Bulacan', 'Staff', 10000000000, '09489600121', 'Female', '0000-00-00', 'Separated', 'Roi', '0975432451', 0, 0),
(34, '', 'Julianne Santos', 'Bulacan', 'mason', 10000, '09489600121', 'Male', '0000-00-00', 'Married', 'Mae', '0975432451', 0, 0),
(35, '', 'Eunice Dimaapi', 'Bulacan', 'mason', 10000, '09489600121', 'Female', '0000-00-00', 'Married', 'Mae', '0975432451', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `days` varchar(50) NOT NULL,
  `rate` double NOT NULL,
  `overtime` varchar(50) NOT NULL,
  `gross_salary` varchar(100) NOT NULL,
  `deductions` varchar(100) NOT NULL,
  `net_salary` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `reg_date`) VALUES
(1, 'Roi', 'pogisiroi26@gmail.com', '$2y$10$tiLkknaeRhB0hPqiIDSpoONjOq/VnfVlqr3TlDzUlb8V06SBmZtEi', '2022-11-06 13:54:06'),
(2, 'admin', 'roi.albert.90@gmail.com', '$2y$10$yzo.6mRJUrPlqn5THioWUebJl5LEwLKBHqdBCSgICmpOXPN1.X.n.', '2022-11-06 14:53:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendancee`
--
ALTER TABLE `attendancee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendancee`
--
ALTER TABLE `attendancee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
