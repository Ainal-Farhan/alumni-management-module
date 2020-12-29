-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 29, 2020 at 09:57 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+08:00";


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
  `alumniID` int(11) NOT NULL,
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
  `alumniFieldOfSpecialization` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniGraduateYear` year(4) NOT NULL DEFAULT 0000,
  `alumniPrevEmployer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniPrevJob` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `alumniPrevSalary` double NOT NULL DEFAULT 0,
  `alumniProfilePicture` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `alumniProfStatus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sir',
  `alumniProfStatusYearGained` year(4) NOT NULL DEFAULT 0000,
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

INSERT INTO `alumni` (`alumniID`, `alumniAddress1`, `alumniAddress2`, `alumniAddressCity`, `alumniAddressCountry`, `alumniAddressPostCode`, `alumniAddressState`, `alumniBatch`, `alumniCurEmployer`, `alumniCurJob`, `alumniCurSalary`, `alumniDegree`, `alumniFieldOfSpecialization`, `alumniGraduateYear`, `alumniPrevEmployer`, `alumniPrevJob`, `alumniPrevSalary`, `alumniProfilePicture`, `alumniProfStatus`, `alumniProfStatusYearGained`, `employerAddress1`, `employerAddress2`, `employerAddressCity`, `employerAddressCountry`, `employerAddressPostCode`, `employerAddressState`) VALUES
(1, 'none', 'none', 'none', 'none', '00000', 'none', 3, 'none', 'none', 0, 'none', 'none', 2003, 'none', 'none', 0, 'default.png', 'Sir', 2006, 'none', 'none', 'none', 'none', 'none', '00000'),
(4, 'none', 'none', 'none', 'none', '00000', 'none', 0, 'none', 'none', 0, 'none', 'none', 0000, 'none', 'none', 0, 'default.png', 'Sir', 0000, 'none', 'none', 'none', 'none', '00000', 'none');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
