-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 21, 2021 at 05:42 PM
-- Server version: 5.6.34
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdb_33381`
--

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `ID` int(11) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `dosage_quantity` int(11) NOT NULL,
  `dosage_unit` varchar(10) NOT NULL,
  `milligram_quantity` int(11) NOT NULL,
  `milligram_unit` varchar(10) NOT NULL,
  `frequency_quantity` int(11) NOT NULL,
  `frequency_unit` varchar(25) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dosages`
--

CREATE TABLE `tbl_dosages` (
  `dosage_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_taken` varchar(20) NOT NULL,
  `time_taken` varchar(10) NOT NULL,
  `date_inputted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userregister`
--

CREATE TABLE `userregister` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `UserPassword` varchar(200) NOT NULL,
  `DateRegistered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userregister`
--

INSERT INTO `userregister` (`UserID`, `FullName`, `username`, `Email`, `UserPassword`, `DateRegistered`) VALUES
(9, 'Evelyn Sattu Lamin', 'coolesteve', 'evelynsattu@gmail.com', '$2y$10$9TjNYX1GFwZTDGhXSdkY9O.l7eVPoavH2Q5xeT8jNZKRMYsTHvz3u', '2021-06-21 15:09:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Medicine_User` (`user_ID`);

--
-- Indexes for table `tbl_dosages`
--
ALTER TABLE `tbl_dosages`
  ADD PRIMARY KEY (`dosage_id`),
  ADD KEY `FK_Dosage_Medicine` (`medicine_id`),
  ADD KEY `FK_Dosage_User` (`user_id`);

--
-- Indexes for table `userregister`
--
ALTER TABLE `userregister`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_dosages`
--
ALTER TABLE `tbl_dosages`
  MODIFY `dosage_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userregister`
--
ALTER TABLE `userregister`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
  ADD CONSTRAINT `FK_Medicine_User` FOREIGN KEY (`user_ID`) REFERENCES `userregister` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_dosages`
--
ALTER TABLE `tbl_dosages`
  ADD CONSTRAINT `FK_Dosage_Medicine` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Dosage_User` FOREIGN KEY (`user_id`) REFERENCES `userregister` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
