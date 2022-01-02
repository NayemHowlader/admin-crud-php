-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2022 at 05:26 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oweb_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `web_role`
--

CREATE TABLE `web_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_role`
--

INSERT INTO `web_role` (`role_id`, `role_name`) VALUES
(2, 'Admin'),
(3, 'Author'),
(4, 'Editor'),
(5, 'Subscriber'),
(1, 'SuperAdmin');

-- --------------------------------------------------------

--
-- Table structure for table `web_user`
--

CREATE TABLE `web_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_username` varchar(30) NOT NULL,
  `user_password` varchar(40) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_photo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_user`
--

INSERT INTO `web_user` (`user_id`, `user_name`, `user_phone`, `user_email`, `user_username`, `user_password`, `role_id`, `user_photo`) VALUES
(2, 'Liana Afrin Orpa', '01762100185', 'nayemhowlader77@gmail.com', 'nayem110', '698d51a19d8a121ce581499d7b701668', 2, 'user-1639767638-3215251.jpg'),
(4, 'Liana Afrin Orpa', '01762100187', 'orpa@gmail.com', 'orpa', 'c4ca4238a0b923820dcc509a6f75849b', 1, 'user-1638819874-3893878.jpg'),
(6, 'ALbi islam', '344434', 'albi@gmail.com', 'albi', 'c4ca4238a0b923820dcc509a6f75849b', 4, 'user-1638821718-463228.JPG'),
(7, 'Sopno khan', '2222222222222222', 'nsd@gmail.com', 'shopno', 'c4ca4238a0b923820dcc509a6f75849b', 5, 'user-1639848695-5661763.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `web_role`
--
ALTER TABLE `web_role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `web_user`
--
ALTER TABLE `web_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `web_role`
--
ALTER TABLE `web_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `web_user`
--
ALTER TABLE `web_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `web_user`
--
ALTER TABLE `web_user`
  ADD CONSTRAINT `web_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `web_role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
