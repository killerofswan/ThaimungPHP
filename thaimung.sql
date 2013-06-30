-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2013 at 01:42 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `thaimung`
--

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filter-tags`
--

CREATE TABLE IF NOT EXISTS `filter-tags` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter-tags`
--

INSERT INTO `filter-tags` (`id`, `tag_id`) VALUES
(59, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(2, 1),
(44, 1),
(66, 1),
(2, 2),
(44, 2),
(66, 2),
(2, 3),
(44, 3),
(66, 3),
(2, 4),
(44, 4),
(66, 4),
(2, 5),
(44, 5),
(66, 5),
(2, 6),
(44, 6),
(66, 6),
(2, 7),
(44, 7),
(66, 7),
(2, 8),
(44, 8),
(66, 8),
(44, 9),
(66, 9),
(44, 10),
(66, 10),
(44, 11),
(66, 11);

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `time` varchar(10) NOT NULL DEFAULT '3 HOUR',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`id`, `status`, `time`) VALUES
(1, 2, '3 HOUR'),
(2, 2, '30 HOUR'),
(44, 2, '3 HOUR'),
(59, 2, '3 HOUR'),
(62, 2, '3 HOUR'),
(63, 2, '3 HOUR'),
(64, 2, '3 HOUR'),
(65, 2, '3 HOUR'),
(66, 2, '3 HOUR');

-- --------------------------------------------------------

--
-- Table structure for table `post-tags`
--

CREATE TABLE IF NOT EXISTS `post-tags` (
  `p_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post-tags`
--

INSERT INTO `post-tags` (`p_id`, `tag_id`) VALUES
(1, 1),
(31, 1),
(35, 1),
(1, 2),
(5, 2),
(31, 2),
(32, 2),
(35, 2),
(1, 3),
(31, 3),
(35, 3),
(36, 3),
(37, 3),
(32, 4),
(35, 4),
(5, 5),
(31, 5),
(35, 5),
(35, 6),
(1, 7),
(5, 7),
(31, 7),
(32, 8),
(5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL DEFAULT '0',
  `longtitude` double NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id` int(11) NOT NULL,
  `description` text,
  `status` int(10) NOT NULL DEFAULT '0',
  `count_solved` int(11) NOT NULL DEFAULT '0',
  `count_seen` int(11) NOT NULL DEFAULT '0',
  `count_spam` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`p_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`p_id`, `latitude`, `longtitude`, `date_time`, `id`, `description`, `status`, `count_solved`, `count_seen`, `count_spam`) VALUES
(1, 14.123, 100.012, '2013-03-21 13:30:20', 2, '1455555', 0, 0, 0, 0),
(5, 14.455, 102.456, '2013-03-08 22:49:00', 1, 'grgrggrgr', 0, 0, 0, 0),
(31, 14.276527, 100.281194, '2013-03-23 02:37:12', 44, 'rod tid jung bei\n\nflooding\n-Vorachart Chinvanthananond\n\nZomBieeeeeeeeee!!!!!!\n-Vorachart Chinvanthananond\n\nKiller!!!\n-Vorachart Chinvanthananond', 0, 0, 0, 0),
(32, 14.296527, 101.351194, '2013-03-23 04:57:20', 44, 'Car bump!!!\n\ncar bomb\n-Vorachart Chinvanthananond\n\npoiuytrew\n-Vorachart Chinvanthananond\n\ntrrtrr\n-Vorachart Chinvanthananond\n\nfgfgrgrg\n-Vorachart Chinvanthananond', 0, 0, 0, 0),
(35, 10.5, 103.5, '2013-03-23 04:57:20', 2, '555\n\n555\n-user user', 0, 0, 0, 0),
(36, 14.276527, 101.281195, '2013-03-23 07:42:16', 44, 'wq11\n\n\n-admin eiei', 0, 0, 0, 0),
(37, 14.132401, 101.043363, '2013-03-23 11:20:32', 66, '.......', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seens`
--

CREATE TABLE IF NOT EXISTS `seens` (
  `p_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`,`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seens`
--

INSERT INTO `seens` (`p_id`, `id`) VALUES
(1, 2),
(1, 44);

-- --------------------------------------------------------

--
-- Table structure for table `solves`
--

CREATE TABLE IF NOT EXISTS `solves` (
  `p_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`,`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `solves`
--

INSERT INTO `solves` (`p_id`, `id`) VALUES
(5, 1),
(1, 59),
(1, 66);

-- --------------------------------------------------------

--
-- Table structure for table `spams`
--

CREATE TABLE IF NOT EXISTS `spams` (
  `p_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`,`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spams`
--

INSERT INTO `spams` (`p_id`, `id`) VALUES
(1, 2),
(1, 44);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `nametag` varchar(40) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `nametag`) VALUES
(0, 'All'),
(1, 'Traffic'),
(2, 'Accident'),
(3, 'Crime'),
(4, 'Fireaccident'),
(5, 'Protesting'),
(6, 'Blackout'),
(7, 'Flood'),
(8, 'Earthquake'),
(9, 'Construction'),
(10, 'Terrorist'),
(11, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `password` varchar(40) NOT NULL,
  `name` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `countspam` int(11) NOT NULL DEFAULT '0',
  `countban` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`password`, `name`, `lastname`, `phone`, `status`, `countspam`, `countban`, `id`, `email`) VALUES
('21232f297a57a5a743894a0e4a801fc3', 'admin', 'hodsus', '9999999', 1, 0, 0, 1, 'admin'),
('ee11cbb19052e40b07aac0ca060c23ee', 'user', 'user', '99000000', 0, 0, 0, 2, 'user'),
('1533e0bad5b534e90853c8ed3aeeb37d', 'Vorachart', 'Chinvanthananond', '0859174553', 0, 0, 0, 44, 'TwinKiller'),
('c4ca4238a0b923820dcc509a6f75849b', 'a', 'b', '1111111111', 0, 0, 0, 59, 'got'),
('8200ebb076e45fd04875607c017c7398', 'prot', 'ponsawat', '1234567890', 0, 0, 0, 62, 'parata.momo@gmail.com'),
('81dc9bdb52d04dc20036dbd8313ed055', 'Banharn', 'Ohyeah', '0800000000', 0, 0, 0, 63, 'xyz@live.com'),
('c4ca4238a0b923820dcc509a6f75849b', '1', '1', '1', 0, 0, 0, 64, '1'),
('1c752eac982553cf3f89cb1223a3bfe6', 'lnw', 'lnw', '1114156789', 0, 0, 0, 65, 'kamiZero'),
('e00cf25ad42683b3df678c61f42c6bda', 'admin', 'eiei', '0000000', 1, 0, 0, 66, 'admin1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bans`
--
ALTER TABLE `bans`
  ADD CONSTRAINT `Bans_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `filter-tags`
--
ALTER TABLE `filter-tags`
  ADD CONSTRAINT `Filter@002dTags_ibfk_1` FOREIGN KEY (`id`) REFERENCES `filters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Filter@002dTags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `filters`
--
ALTER TABLE `filters`
  ADD CONSTRAINT `Filters_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post-tags`
--
ALTER TABLE `post-tags`
  ADD CONSTRAINT `Post@002dTags_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `posts` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Post@002dTags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `Posts_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seens`
--
ALTER TABLE `seens`
  ADD CONSTRAINT `Seens_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `posts` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Seens_ibfk_2` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `solves`
--
ALTER TABLE `solves`
  ADD CONSTRAINT `Solves_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `posts` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Solves_ibfk_2` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spams`
--
ALTER TABLE `spams`
  ADD CONSTRAINT `Spams_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `posts` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Spams_ibfk_2` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
