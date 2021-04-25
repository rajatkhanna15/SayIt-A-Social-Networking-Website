-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2021 at 09:17 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sayit`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `comment` varchar(140) NOT NULL,
  `commentOn` int(11) NOT NULL,
  `commentBy` int(11) NOT NULL,
  `commentAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `followID` int(11) NOT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `followOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`followID`, `sender`, `receiver`, `followOn`) VALUES
(35, 11, 1, '2021-04-22 18:15:13'),
(36, 12, 1, '2021-04-22 21:39:27'),
(39, 11, 12, '2021-04-22 23:13:35'),
(40, 12, 11, '2021-04-22 23:29:25'),
(42, 13, 11, '2021-04-22 23:42:49'),
(44, 13, 12, '2021-04-22 23:42:56'),
(46, 11, 13, '2021-04-23 23:54:28'),
(51, 12, 13, '2021-04-24 16:09:50'),
(52, 13, 1, '2021-04-24 16:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likeID` int(11) NOT NULL,
  `likeBy` int(11) NOT NULL,
  `likeOn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likeID`, `likeBy`, `likeOn`) VALUES
(59, 2, 67),
(60, 2, 66),
(61, 2, 65),
(62, 2, 69),
(63, 2, 91),
(65, 6, 91),
(66, 2, 90),
(67, 8, 95),
(68, 8, 94),
(69, 13, 106),
(72, 12, 116),
(73, 12, 119),
(74, 13, 116),
(75, 13, 119),
(76, 11, 121),
(77, 13, 123),
(78, 13, 121),
(79, 13, 122),
(80, 13, 124);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `message` text NOT NULL,
  `messageTo` int(11) NOT NULL,
  `messageFrom` int(11) NOT NULL,
  `messageOn` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageID`, `message`, `messageTo`, `messageFrom`, `messageOn`, `status`) VALUES
(4, 'Hii', 1, 13, '2021-04-23 13:31:07', 0),
(5, 'Hii', 11, 13, '2021-04-23 15:31:16', 1),
(6, 'Heyy!!', 13, 11, '2021-04-23 19:46:39', 1),
(7, 'hii', 11, 13, '2021-04-24 12:44:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL,
  `notificationFor` int(11) NOT NULL,
  `notificationFrom` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('follow','retweet','like','mention') NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`ID`, `notificationFor`, `notificationFrom`, `target`, `type`, `time`, `status`) VALUES
(1, 13, 11, 13, 'mention', '2021-04-23 23:57:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `trendID` int(11) NOT NULL,
  `hashtag` varchar(140) NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`trendID`, `hashtag`, `createdOn`) VALUES
(8, 'java', '2021-04-05 16:31:00'),
(9, 'netflix', '2021-04-05 16:37:12'),
(10, 'php', '2021-04-15 15:15:27'),
(14, 'GSOC', '2021-04-18 15:28:04'),
(16, 'selmonbhai', '2021-04-21 21:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `tweetID` int(11) NOT NULL,
  `status` varchar(140) NOT NULL,
  `tweetBy` int(11) NOT NULL,
  `retweetID` int(11) NOT NULL,
  `retweetBy` int(11) NOT NULL,
  `tweetImage` varchar(255) NOT NULL,
  `likesCount` int(11) NOT NULL,
  `retweetCount` int(11) NOT NULL,
  `postedOn` datetime NOT NULL,
  `retweetMsg` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`tweetID`, `status`, `tweetBy`, `retweetID`, `retweetBy`, `tweetImage`, `likesCount`, `retweetCount`, `postedOn`, `retweetMsg`) VALUES
(106, 'Watching Queens Gambit\r\n#netflix', 13, 0, 0, '', 1, 1, '2021-04-23 07:41:42', ''),
(107, 'Ludo is a great movie..\r\n#netflix', 12, 0, 0, '', 0, 0, '2021-04-23 17:51:34', ''),
(116, '#netflix', 13, 0, 0, 'users/netflix.jpeg', 2, 1, '2021-04-23 18:07:07', ''),
(117, 'Watching Queens Gambit\r\n#netflix', 13, 106, 11, '', 1, 1, '2021-04-23 07:41:42', 'Great watch..'),
(118, '#netflix', 13, 116, 12, 'users/netflix.jpeg', 3, 1, '2021-04-23 18:07:07', 'Goals..'),
(121, '@palakmaheshwari69 hiiii', 11, 0, 0, '', 2, 1, '2021-04-24 13:49:43', ''),
(122, '@marksolomon12 hii', 11, 0, 0, '', 1, 0, '2021-04-24 14:06:28', ''),
(123, '@palakmaheshwari69 hiiii', 11, 121, 11, '', 2, 2, '2021-04-24 13:49:43', 'h'),
(124, '@palakmaheshwari69 hiiii', 11, 123, 13, '', 3, 2, '2021-04-24 13:49:43', 'Heyy');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `screenName` varchar(40) NOT NULL,
  `profileImage` varchar(255) NOT NULL,
  `profileCover` varchar(255) NOT NULL,
  `following` int(11) NOT NULL,
  `followers` int(11) NOT NULL,
  `bio` varchar(140) NOT NULL,
  `country` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `screenName`, `profileImage`, `profileCover`, `following`, `followers`, `bio`, `country`, `website`) VALUES
(1, 'rajatkhannasds', 'rajatkhannasds@gmail.com', '7d0540d6753c07f2535cf2854643b078', 'Rajat Khanna', 'users/Rajat1.jpg', 'users/rajat2.jpg', 3, 7, '', '', ''),
(11, 'somiljain15', 'somiljain15@gmail.com', 'd90d7845af4eaeccb3d8d4e1beab7dc7', 'Somil Jain', 'users/somil1.jpg', 'users/somil2.jpg', 3, 3, '', '', ''),
(12, 'marksolomon12', 'marksolomon12@gmail.com', 'd1af90699f2a2c983e6ccb7bee874414', 'Mark Solomon', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 3, 2, '', '', ''),
(13, 'palakmaheshwari69', 'palakmaheshwari69@gmail.com', '227427408891f86d76ed7588521adb2f', 'Palak Maheshwari', 'users/Palak1.jpeg', 'users/palak3.jpeg', 3, 2, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`followID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likeID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`trendID`),
  ADD UNIQUE KEY `hashtag` (`hashtag`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`tweetID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `followID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `trendID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `tweetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
