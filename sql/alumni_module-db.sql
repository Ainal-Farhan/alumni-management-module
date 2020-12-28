-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 28, 2020 at 05:57 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET @@global.time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alumni_module-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `alumniID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniAddress1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniAddress2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniAddressCity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniAddressCountry` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniAddressPostCode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00000',
  `alumniAddressState` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniBatch` int(11) NOT NULL DEFAULT 0,
  `alumniCurEmployer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniCurJob` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniCurSalary` double NOT NULL DEFAULT 0,
  `alumniDegree` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniEmail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniFieldOfSpecialization` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniGraduateYear` year(4) NOT NULL DEFAULT 0000,
  `alumniName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniPhoneNumber` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniPrevEmployer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniPrevJob` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniPrevSalary` double NOT NULL DEFAULT 0,
  `alumniProfilePicture` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `alumniProfStatus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sir',
  `alumniProfStatusYearGained` year(4) NOT NULL DEFAULT 0000,
  `alumniUsername` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniUserPassword` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employerAddress1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employerAddress2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employerAddressCity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employerAddressCountry` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employerAddressPostCode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00000',
  `employerAddressState` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`alumniID`, `alumniAddress1`, `alumniAddress2`, `alumniAddressCity`, `alumniAddressCountry`, `alumniAddressPostCode`, `alumniAddressState`, `alumniBatch`, `alumniCurEmployer`, `alumniCurJob`, `alumniCurSalary`, `alumniDegree`, `alumniEmail`, `alumniFieldOfSpecialization`, `alumniGraduateYear`, `alumniName`, `alumniPhoneNumber`, `alumniPrevEmployer`, `alumniPrevJob`, `alumniPrevSalary`, `alumniProfilePicture`, `alumniProfStatus`, `alumniProfStatusYearGained`, `alumniUsername`, `alumniUserPassword`, `employerAddress1`, `employerAddress2`, `employerAddressCity`, `employerAddressCountry`, `employerAddressPostCode`, `employerAddressState`) VALUES
('A18CS0193', 'No L3-2017', 'Jalan Gemilang', 'Lurah Bilut', 'Malaysia', '28800', 'Pahang', 21, 'Government Architect Sdn Bhd', 'Senior Architect', 10000, 'Bachelor in Architecture', 'mohd.zakuan@gmail.com', 'SeniBina', 2014, 'Mohd Zakuan bin Zamri', '01111883722', 'Government Architect Sdn Bhd', 'Junior Architect', 5000, 'default.png', 'Tan Sri', 2020, 'none', 'none', 'Government Architect Sdn Bhd', 'Jalan 3, Gemilang 1', 'Bentong', '28800', 'Pahang', 'Malaysia'),
('A18CS0992', 'none', 'none', 'none', 'none', '00000', 'none', 0, 'none', 'none', 0, 'none', 'none', 'none', 0000, 'none', 'none', 'none', 'none', 0, 'default.png', 'Sir', 0000, 'none', 'none', 'none', 'none', 'none', 'none', '00000', 'none'),
('none', 'none', 'none', 'none', 'none', '00000', 'none', 21, 'none', 'none', 0, 'none', 'none', 'none', 2009, 'none', 'none', 'none', 'none', 0, 'default.png', 'Sir', 0000, 'none', 'none', 'none', 'none', 'none', 'none', '00000', 'none');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`alumniID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
