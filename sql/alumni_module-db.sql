-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 19, 2021 at 11:36 AM
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
  `alumniID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alumniAddress1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniAddress2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniAddressCity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniAddressCountry` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniAddressPostCode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniAddressState` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniBatchBachelor` int(11) NOT NULL DEFAULT 0,
  `alumniCurEmployer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniCurJob` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniCurSalary` double NOT NULL DEFAULT 0,
  `alumniFieldOfSpecializationBachelor` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniGraduateYearBachelor` year(4) NOT NULL DEFAULT 0000,
  `alumniPrevEmployer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniPrevJob` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniPrevSalary` double NOT NULL DEFAULT 0,
  `alumniProfilePicture` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `alumniProfStatus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `alumniProfStatusYearGained` year(4) NOT NULL DEFAULT 0000,
  `alumniStartStudyYearBachelor` year(4) NOT NULL DEFAULT 0000,
  `employerAddress1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `employerAddress2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `employerAddressCity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `employerAddressCountry` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `employerAddressPostCode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `employerAddressState` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
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
('ALU118011', 'aladdress1', 'aladdress2', 'alcity', 'alcountry', '22222', 'alstate', 0, 'none', 'none', 0, '-', 0000, 'none', 'none', 0, 'default.png', 'Sir', 0000, 0000, 'address1', 'address2', 'city', 'country', '11111', 'state', '-', 0000, 0, 0000, '-', 0000, 0, 0000),
('ALU127012', 'rumah', 'ladang', 'Bentong', 'Malaysia', '28800', 'Pahang', 2, 'Malaysian Architect SDN BHD', 'Architect', 10000, 'Bachelor in Architecture', 2010, 'Malaysian Architect SDN BHD', 'Junior Architect', 5000, 'default.png', 'Sir', 2002, 2006, 'Level 5 No 5', 'Malaysian Architect SDN BHD', 'Kuala Lumpur', 'Malaysia', '54700', 'Wilayah Persekutuan Kuala Lumpur', 'Diploma in Architecture', 2006, 1, 2002, 'Master in Architecture', 2014, 3, 2010),
('ALU129012', '-', '-', '-', '-', '-', '-', 0, '-', '-', 0, '-', 0000, '-', '-', 0, 'default.png', '-', 0000, 0000, '-', '-', '-', '-', '-', '-', '-', 2006, 1, 2002, '-', 0000, 0, 0000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `userID` varchar(100) DEFAULT NULL,
  `name` varchar(300) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(300) NOT NULL,
  `role` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userID`, `name`, `phone`, `email`, `role`, `password`) VALUES
(116, 'ADM116011', 'Nur Fatin Atiqah Binti Rozadin', '01125678404', 'nurfatinatiqahrozadin@gmail.com', 'ADMIN', 'fatinatiqah'),
(117, 'STF117018', 'Rocco X. Nolen', '0186558624', 'ixrocco23@gmail.com', 'STAFF', '1234567890'),
(118, 'ALU118011', 'Patrick U. Oneal', '0119777865', 'jupatrick20@gmail.com', 'ALUMNI', '1234567890'),
(127, 'ALU127012', 'Juanita L. Rentas', '0123456278', 'juanita@gmail.com', 'ALUMNI', '1234567890'),
(128, 'STF128019', 'Lalie X. Corley', '0192899191', 'cylola24@yopmail.com', 'STAFF', '1234567890'),
(129, 'ALU129012', 'Kandy S. Bankhead', '0128899199', 'kandy@gmail.com', 'ALUMNI', '12345678'),
(130, 'STF130019', 'Lynda V. Stickler', '0191223085', 'jvlynda21@gmail.com', 'STAFF', '1234567890');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`alumniID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
