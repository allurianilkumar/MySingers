-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2016 at 02:07 PM
-- Server version: 5.5.49
-- PHP Version: 5.3.10-1ubuntu3.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `MySingers`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `admin_mobile` varchar(200) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_password` varchar(200) NOT NULL,
  `admin_repassword` varchar(200) NOT NULL,
  `admin_gender` varchar(200) NOT NULL,
  `admin_dob` varchar(200) NOT NULL,
  `admin_address` text NOT NULL,
  PRIMARY KEY (`event_name`),
  KEY `admin_email` (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `event_mobile` varchar(200) NOT NULL,
  `event_email` varchar(200) NOT NULL,
  `event_gender` varchar(200) NOT NULL,
  `event_dob` varchar(200) NOT NULL,
  `event_address` text NOT NULL,
  `admin_name` varchar(200) NOT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_name` (`admin_name`),
  KEY `event_name` (`event_name`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(11) NOT NULL,
  `reg_name` varchar(200) NOT NULL,
  `reg_mobile` bigint(15) NOT NULL,
  `reg_email` varchar(200) NOT NULL,
  `reg_password` varchar(200) NOT NULL,
  `reg_repassword` varchar(200) NOT NULL,
  `reg_gender` varchar(200) NOT NULL,
  `reg_dob` varchar(200) NOT NULL,
  `reg_address` text NOT NULL,
  `reg_type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reg_email` (`reg_email`),
  KEY `reg_name` (`reg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `reg_name`, `reg_mobile`, `reg_email`, `reg_password`, `reg_repassword`, `reg_gender`, `reg_dob`, `reg_address`, `reg_type`) VALUES
(2, 'user', 1234567890, 'user@gmail.com', 'user', 'user', 'male', '10-10-2010', 'USA', '');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE IF NOT EXISTS `songs` (
  `id` int(11) NOT NULL,
  `s_event_id` int(200) NOT NULL,
  `s_event_name` varchar(200) NOT NULL,
  `s_user_name` varchar(200) NOT NULL,
  `s_song_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `s_user_name` (`s_user_name`),
  KEY `s_song_name` (`s_song_name`),
  KEY `s_event_name` (`s_event_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `u_name` varchar(200) NOT NULL,
  `u_mobile` int(20) NOT NULL,
  `u_email` varchar(200) NOT NULL,
  `u_password` varchar(200) NOT NULL,
  `u_repassword` varchar(200) NOT NULL,
  `u_gender` varchar(200) NOT NULL,
  `u_dob` varchar(200) NOT NULL,
  `u_address` text NOT NULL,
  `u_type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_email` (`u_email`),
  KEY `u_name` (`u_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `u_name`, `u_mobile`, `u_email`, `u_password`, `u_repassword`, `u_gender`, `u_dob`, `u_address`, `u_type`) VALUES
(1, 'user', 1234567890, 'user@gmail.com', 'user', 'user', 'male', '10-10-2010', 'USA', '');

-- --------------------------------------------------------

--
-- Table structure for table `winners`
--

CREATE TABLE IF NOT EXISTS `winners` (
  `id` int(11) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `winner_name` varchar(200) NOT NULL,
  `winner_mobile` varchar(200) NOT NULL,
  `winner_email` varchar(200) NOT NULL,
  `winner_password` varchar(200) NOT NULL,
  `winner_repassword` varchar(200) NOT NULL,
  `winner_gender` varchar(200) NOT NULL,
  `winner_dob` varchar(200) NOT NULL,
  `winner_address` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `winner_name` (`winner_name`),
  KEY `winner_gender` (`winner_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`admin_email`) REFERENCES `registration` (`reg_email`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`event_name`) REFERENCES `admin` (`event_name`),
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`user_name`) REFERENCES `user` (`u_name`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`s_event_name`) REFERENCES `admin` (`event_name`),
  ADD CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`s_user_name`) REFERENCES `user` (`u_name`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`u_email`) REFERENCES `registration` (`reg_email`);

--
-- Constraints for table `winners`
--
ALTER TABLE `winners`
  ADD CONSTRAINT `winners_ibfk_2` FOREIGN KEY (`winner_name`) REFERENCES `user` (`u_name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
