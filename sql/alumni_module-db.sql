-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 15, 2021 at 09:02 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


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
  `alumniID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alumniAddress1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniAddress2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniAddressCity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniAddressCountry` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniAddressPostCode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00000',
  `alumniAddressState` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniBatchBachelor` int(11) NOT NULL DEFAULT 0,
  `alumniCurEmployer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniCurJob` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniCurSalary` double NOT NULL DEFAULT 0,
  `alumniFieldOfSpecializationBachelor` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniGraduateYearBachelor` year(4) NOT NULL DEFAULT 0000,
  `alumniPrevEmployer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniPrevJob` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniPrevSalary` double NOT NULL DEFAULT 0,
  `alumniProfilePicture` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `alumniProfStatus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sir',
  `alumniProfStatusYearGained` year(4) NOT NULL DEFAULT 0000,
  `alumniStartStudyYearBachelor` year(4) NOT NULL DEFAULT 0000,
  `employerAddress1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employerAddress2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employerAddressCity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employerAddressCountry` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `employerAddressPostCode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00000',
  `employerAddressState` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniFieldOfSpecializationDiploma` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniGraduateYearDiploma` year(4) NOT NULL DEFAULT 0000,
  `alumniBatchDiploma` int(11) NOT NULL DEFAULT 0,
  `alumniStartStudyYearDiploma` year(4) NOT NULL DEFAULT 0000,
  `alumniFieldOfSpecializationMaster` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniGraduateYearMaster` year(4) NOT NULL DEFAULT 0000,
  `alumniBatchMaster` int(11) NOT NULL DEFAULT 0,
  `alumniStartStudyYearMaster` year(4) NOT NULL DEFAULT 0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`alumniID`, `alumniAddress1`, `alumniAddress2`, `alumniAddressCity`, `alumniAddressCountry`, `alumniAddressPostCode`, `alumniAddressState`, `alumniBatchBachelor`, `alumniCurEmployer`, `alumniCurJob`, `alumniCurSalary`, `alumniFieldOfSpecializationBachelor`, `alumniGraduateYearBachelor`, `alumniPrevEmployer`, `alumniPrevJob`, `alumniPrevSalary`, `alumniProfilePicture`, `alumniProfStatus`, `alumniProfStatusYearGained`, `alumniStartStudyYearBachelor`, `employerAddress1`, `employerAddress2`, `employerAddressCity`, `employerAddressCountry`, `employerAddressPostCode`, `employerAddressState`, `alumniFieldOfSpecializationDiploma`, `alumniGraduateYearDiploma`, `alumniBatchDiploma`, `alumniStartStudyYearDiploma`, `alumniFieldOfSpecializationMaster`, `alumniGraduateYearMaster`, `alumniBatchMaster`, `alumniStartStudyYearMaster`) VALUES
('1', 'Peace YALL', 'none', 'none', 'none', '00000', 'none', 6, 'none', 'none', 0, 'noneeqwe', 2010, 'none', 'none', 0, 'default.png', 'Sir', 2006, 2012, 'none', 'none', 'none', 'none', '00000', 'none', 'eqweqw', 2009, 8, 2011, '-eqweq', 2015, 9, 2013),
('4', 'none', 'none', 'none', 'none', '00000', 'none', 0, 'none', 'none', 0, 'none', 0000, 'none', 'none', 0, 'default.png', 'Sir', 0000, 2000, 'none', 'none', 'none', 'none', '00000', 'none', '-', 2000, 0, 2000, '-', 2000, 0, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(300) NOT NULL,
  `role` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `email`, `role`, `password`, `created_at`) VALUES
(1, 'Azman Hasyim', '01111999621', 'azman@gmail.com', 'alumni', 'test@123', '2020-12-29 15:09:57'),
(2, 'Fadilah', '0132079332', 'fadilah@gmail.com', 'admin', 'test@123', '2020-12-29 15:09:57'),
(3, 'Kamal', '0199382231', 'kamal123@gmail.com', 'staff', 'test@123', '2020-12-29 15:09:57'),
(4, 'Kamal Abdullah', '01111962721', 'kamal.abdullah@gmail.com', 'alumni', 'test@123', '2020-12-29 15:13:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`alumniID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
