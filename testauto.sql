-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2013 at 09:43 PM
-- Server version: 5.5.29
-- PHP Version: 5.4.6-1ubuntu1.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `testauto`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=193 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add log entry', 7, 'add_logentry'),
(20, 'Can change log entry', 7, 'change_logentry'),
(21, 'Can delete log entry', 7, 'delete_logentry'),
(22, 'Can add registration profile', 8, 'add_registrationprofile'),
(23, 'Can change registration profile', 8, 'change_registrationprofile'),
(24, 'Can delete registration profile', 8, 'delete_registrationprofile'),
(25, 'Can add report', 9, 'add_report'),
(26, 'Can change report', 9, 'change_report'),
(27, 'Can delete report', 9, 'delete_report'),
(28, 'Can add user profile', 10, 'add_userprofile'),
(29, 'Can change user profile', 10, 'change_userprofile'),
(30, 'Can delete user profile', 10, 'delete_userprofile'),
(31, 'Can add auto_number', 11, 'add_auto_number'),
(32, 'Can change auto_number', 11, 'change_auto_number'),
(33, 'Can delete auto_number', 11, 'delete_auto_number'),
(34, 'Can add lab', 12, 'add_lab'),
(35, 'Can change lab', 12, 'change_lab'),
(36, 'Can delete lab', 12, 'delete_lab'),
(37, 'Can add material', 13, 'add_material'),
(38, 'Can change material', 13, 'change_material'),
(39, 'Can delete material', 13, 'delete_material'),
(40, 'Can add test', 14, 'add_test'),
(41, 'Can change test', 14, 'change_test'),
(42, 'Can delete test', 14, 'delete_test'),
(43, 'Can add govt', 15, 'add_govt'),
(44, 'Can change govt', 15, 'change_govt'),
(45, 'Can delete govt', 15, 'delete_govt'),
(46, 'Can add payment', 16, 'add_payment'),
(47, 'Can change payment', 16, 'change_payment'),
(48, 'Can delete payment', 16, 'delete_payment'),
(49, 'Can add job', 17, 'add_job'),
(50, 'Can change job', 17, 'change_job'),
(51, 'Can delete job', 17, 'delete_job'),
(52, 'Can add client job', 18, 'add_clientjob'),
(53, 'Can change client job', 18, 'change_clientjob'),
(54, 'Can delete client job', 18, 'delete_clientjob'),
(55, 'Can add suspence job', 19, 'add_suspencejob'),
(56, 'Can change suspence job', 19, 'change_suspencejob'),
(57, 'Can delete suspence job', 19, 'delete_suspencejob'),
(58, 'Can add test total', 20, 'add_testtotal'),
(59, 'Can change test total', 20, 'change_testtotal'),
(60, 'Can delete test total', 20, 'delete_testtotal'),
(64, 'Can add bill', 22, 'add_bill'),
(65, 'Can change bill', 22, 'change_bill'),
(66, 'Can delete bill', 22, 'delete_bill'),
(67, 'Can add amount', 23, 'add_amount'),
(68, 'Can change amount', 23, 'change_amount'),
(69, 'Can delete amount', 23, 'delete_amount'),
(70, 'Can add cdf amount', 24, 'add_cdfamount'),
(71, 'Can change cdf amount', 24, 'change_cdfamount'),
(72, 'Can delete cdf amount', 24, 'delete_cdfamount'),
(73, 'Can add suspence', 25, 'add_suspence'),
(74, 'Can change suspence', 25, 'change_suspence'),
(75, 'Can delete suspence', 25, 'delete_suspence'),
(76, 'Can add organisation', 26, 'add_organisation'),
(77, 'Can change organisation', 26, 'change_organisation'),
(78, 'Can delete organisation', 26, 'delete_organisation'),
(79, 'Can add department', 27, 'add_department'),
(80, 'Can change department', 27, 'change_department'),
(81, 'Can delete department', 27, 'delete_department'),
(82, 'Can add staff', 28, 'add_staff'),
(83, 'Can change staff', 28, 'change_staff'),
(84, 'Can delete staff', 28, 'delete_staff'),
(88, 'Can add profroma tax', 30, 'add_profromatax'),
(89, 'Can change profroma tax', 30, 'change_profromatax'),
(90, 'Can delete profroma tax', 30, 'delete_profromatax'),
(94, 'Can add transportation', 32, 'add_transportation'),
(95, 'Can change transportation', 32, 'change_transportation'),
(96, 'Can delete transportation', 32, 'delete_transportation'),
(97, 'Can add transport', 33, 'add_transport'),
(98, 'Can change transport', 33, 'change_transport'),
(99, 'Can delete transport', 33, 'delete_transport'),
(100, 'Can add bankdetails', 34, 'add_bankdetails'),
(101, 'Can change bankdetails', 34, 'change_bankdetails'),
(102, 'Can delete bankdetails', 34, 'delete_bankdetails'),
(103, 'Can add distance', 35, 'add_distance'),
(104, 'Can change distance', 35, 'change_distance'),
(105, 'Can delete distance', 35, 'delete_distance'),
(106, 'Can add tag', 36, 'add_tag'),
(107, 'Can change tag', 36, 'change_tag'),
(108, 'Can delete tag', 36, 'delete_tag'),
(109, 'Can add tagged item', 37, 'add_taggeditem'),
(110, 'Can change tagged item', 37, 'change_taggeditem'),
(111, 'Can delete tagged item', 37, 'delete_taggeditem'),
(112, 'Can add clientadd', 38, 'add_clientadd'),
(113, 'Can change clientadd', 38, 'change_clientadd'),
(114, 'Can delete clientadd', 38, 'delete_clientadd'),
(115, 'Can add edit job', 39, 'add_editjob'),
(116, 'Can change edit job', 39, 'change_editjob'),
(117, 'Can delete edit job', 39, 'delete_editjob'),
(118, 'Can add client edit job', 40, 'add_clienteditjob'),
(119, 'Can change client edit job', 40, 'change_clienteditjob'),
(120, 'Can delete client edit job', 40, 'delete_clienteditjob'),
(121, 'Can add ta da', 41, 'add_tada'),
(122, 'Can change ta da', 41, 'change_tada'),
(123, 'Can delete ta da', 41, 'delete_tada'),
(124, 'Can add test total perf', 42, 'add_testtotalperf'),
(125, 'Can change test total perf', 42, 'change_testtotalperf'),
(126, 'Can delete test total perf', 42, 'delete_testtotalperf'),
(127, 'Can add bill perf', 43, 'add_billperf'),
(128, 'Can change bill perf', 43, 'change_billperf'),
(129, 'Can delete bill perf', 43, 'delete_billperf'),
(130, 'Can add edit clientadd', 44, 'add_editclientadd'),
(131, 'Can change edit clientadd', 44, 'change_editclientadd'),
(132, 'Can delete edit clientadd', 44, 'delete_editclientadd'),
(133, 'Can add suspence edit job', 45, 'add_suspenceeditjob'),
(134, 'Can change suspence edit job', 45, 'change_suspenceeditjob'),
(135, 'Can delete suspence edit job', 45, 'delete_suspenceeditjob'),
(136, 'Can add search', 46, 'add_search'),
(137, 'Can change search', 46, 'change_search'),
(138, 'Can delete search', 46, 'delete_search'),
(139, 'Can add report', 47, 'add_report'),
(140, 'Can change report', 47, 'change_report'),
(141, 'Can delete report', 47, 'delete_report'),
(142, 'Can add cube', 48, 'add_cube'),
(143, 'Can change cube', 48, 'change_cube'),
(144, 'Can delete cube', 48, 'delete_cube'),
(145, 'Can add chem_analysis', 49, 'add_chem_analysis'),
(146, 'Can change chem_analysis', 49, 'change_chem_analysis'),
(147, 'Can delete chem_analysis', 49, 'delete_chem_analysis'),
(148, 'Can add steel', 50, 'add_steel'),
(149, 'Can change steel', 50, 'change_steel'),
(150, 'Can delete steel', 50, 'delete_steel'),
(151, 'Can add ground_ water', 51, 'add_ground_water'),
(152, 'Can change ground_ water', 51, 'change_ground_water'),
(153, 'Can delete ground_ water', 51, 'delete_ground_water'),
(154, 'Can add concrete_ paver', 52, 'add_concrete_paver'),
(155, 'Can change concrete_ paver', 52, 'change_concrete_paver'),
(156, 'Can delete concrete_ paver', 52, 'delete_concrete_paver'),
(157, 'Can add interlock_ tiles', 53, 'add_interlock_tiles'),
(158, 'Can change interlock_ tiles', 53, 'change_interlock_tiles'),
(159, 'Can delete interlock_ tiles', 53, 'delete_interlock_tiles'),
(160, 'Can add pc', 54, 'add_pc'),
(161, 'Can change pc', 54, 'change_pc'),
(162, 'Can delete pc', 54, 'delete_pc'),
(163, 'Can add rebound_ hammer_ testing', 55, 'add_rebound_hammer_testing'),
(164, 'Can change rebound_ hammer_ testing', 55, 'change_rebound_hammer_testing'),
(165, 'Can delete rebound_ hammer_ testing', 55, 'delete_rebound_hammer_testing'),
(166, 'Can add brick', 56, 'add_brick'),
(167, 'Can change brick', 56, 'change_brick'),
(168, 'Can delete brick', 56, 'delete_brick'),
(169, 'Can add water', 57, 'add_water'),
(170, 'Can change water', 57, 'change_water'),
(171, 'Can delete water', 57, 'delete_water'),
(172, 'Can add soil_ ohsr', 58, 'add_soil_ohsr'),
(173, 'Can change soil_ ohsr', 58, 'change_soil_ohsr'),
(174, 'Can delete soil_ ohsr', 58, 'delete_soil_ohsr'),
(175, 'Can add soil_ building', 59, 'add_soil_building'),
(176, 'Can change soil_ building', 59, 'change_soil_building'),
(177, 'Can delete soil_ building', 59, 'delete_soil_building'),
(178, 'Can add admixture', 60, 'add_admixture'),
(179, 'Can change admixture', 60, 'change_admixture'),
(180, 'Can delete admixture', 60, 'delete_admixture'),
(181, 'Can add cement_ppc', 61, 'add_cement_ppc'),
(182, 'Can change cement_ppc', 61, 'change_cement_ppc'),
(183, 'Can delete cement_ppc', 61, 'delete_cement_ppc'),
(184, 'Can add cement_op c_33', 62, 'add_cement_opc_33'),
(185, 'Can change cement_op c_33', 62, 'change_cement_opc_33'),
(186, 'Can delete cement_op c_33', 62, 'delete_cement_opc_33'),
(187, 'Can add cement_op c_43', 63, 'add_cement_opc_43'),
(188, 'Can change cement_op c_43', 63, 'change_cement_opc_43'),
(189, 'Can delete cement_op c_43', 63, 'delete_cement_opc_43'),
(190, 'Can add cement_op c_53', 64, 'add_cement_opc_53'),
(191, 'Can change cement_op c_53', 64, 'change_cement_opc_53'),
(192, 'Can delete cement_op c_53', 64, 'delete_cement_opc_53');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'admin', '', '', 'mkaurkhalsa@gmail.com', 'pbkdf2_sha256$10000$VNNayID77j5V$jV2LjG7ECNyZoA29P5SWI0uJeEbgLKzxOuG9cdO/DHw=', 1, 1, 1, '2013-02-27 21:27:33', '2012-10-06 23:38:22'),
(2, 'sahib', '', '', 'mkaurkhalsa@gmail.com', 'pbkdf2_sha256$10000$VNNayID77j5V$jV2LjG7ECNyZoA29P5SWI0uJeEbgLKzxOuG9cdO/DHw=', 0, 1, 0, '2013-02-27 21:41:46', '2012-11-26 09:00:00'),
(3, 'sandy', '', '', 'mkaurkhalsa@gmail.com', 'pbkdf2_sha256$10000$LV2povPo7QUd$AveudfacMrNdhIl5hRXViyW4stKoj82cT/v2ii/oO6g=', 1, 1, 1, '2013-01-27 16:24:39', '2012-11-16 13:46:33'),
(4, 'daman', '', '', 'mkaurkhalsa@gmail.com', 'pbkdf2_sha256$10000$ChIyKfpvXmCI$DFzJGmakwWoiN6aV+0t4Qmxq/VS3BCzk2qfpeXS1HhE=', 0, 1, 0, '2012-12-04 10:46:38', '2012-11-19 19:46:20'),
(6, 'manvir', '', '', 'mkaurkhalsa@gmail.com', 'pbkdf2_sha256$10000$noIuBWw5clzh$TAsSJudl7Gz7iKAtGRiP+SF6++HFTchIMkrn6TuBx0k=', 0, 0, 0, '2013-01-12 20:32:36', '2013-01-12 20:32:36'),
(7, 'mee', '', '', 'mkaurkhalsa@gmail.com', 'pbkdf2_sha256$10000$CElJVnr1qcg8$K7vV0XKG7guAb31NZsg2XYwmwPDvfoycvuNI3r+RT8Y=', 1, 1, 1, '2013-02-27 02:31:16', '2013-02-27 02:31:16');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=115 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2012-10-07 00:21:41', 1, 16, '1', 'CASH', 1, ''),
(2, '2012-10-07 00:21:45', 1, 16, '2', 'CHEQUE', 1, ''),
(3, '2012-10-07 00:21:50', 1, 16, '3', 'ONLINE', 1, ''),
(4, '2012-10-07 00:21:53', 1, 16, '4', 'DD', 1, ''),
(5, '2012-10-07 00:22:16', 1, 15, '1', 'GOVERNMENT', 1, ''),
(6, '2012-10-07 00:22:24', 1, 15, '2', 'SEMI-GOVERNMENT', 1, ''),
(7, '2012-10-07 00:22:31', 1, 15, '3', 'PRIVATE', 1, ''),
(8, '2012-10-07 00:23:09', 1, 9, '1', 'LAB', 1, ''),
(9, '2012-10-07 00:23:14', 1, 9, '2', 'FIELD', 1, ''),
(10, '2012-10-07 00:24:43', 1, 26, '1', 'Guru Nanak Dev Engineering College', 1, ''),
(11, '2012-10-07 00:25:22', 1, 27, '1', 'Testing and Consultancy Cell', 1, ''),
(12, '2012-10-07 00:25:39', 1, 12, '1', 'ENVIRONMENT', 1, ''),
(13, '2012-10-07 00:25:59', 1, 12, '2', 'CEMENT', 1, ''),
(14, '2012-10-07 00:26:42', 1, 12, '2', 'SOM', 2, 'Changed name and tags.'),
(15, '2012-10-07 00:26:57', 1, 12, '3', 'SOIL', 1, ''),
(16, '2012-10-07 00:27:16', 1, 12, '4', 'WATER/WASTE WATER', 1, ''),
(17, '2012-10-07 00:28:35', 1, 12, '5', 'CHEMICAL', 1, ''),
(18, '2012-10-07 00:29:08', 1, 13, '1', 'BRICKS', 1, ''),
(19, '2012-10-07 00:29:25', 1, 13, '2', 'FINE AGGREGATES', 1, ''),
(20, '2012-10-07 00:29:53', 1, 13, '3', 'PAVERS/BEAMS', 1, ''),
(21, '2012-10-07 00:30:26', 1, 13, '4', 'CEMENT', 1, ''),
(22, '2012-10-07 00:31:51', 1, 13, '5', 'SOIL FOR BC', 1, ''),
(23, '2012-10-07 00:32:18', 1, 13, '6', 'OHSR', 1, ''),
(24, '2012-10-07 01:38:35', 1, 14, '1', 'AIV', 1, ''),
(25, '2012-10-07 01:39:21', 1, 14, '2', 'SILT CONTENT', 1, ''),
(26, '2012-10-07 01:39:55', 1, 14, '3', 'FINENESS MODULUS', 1, ''),
(27, '2012-10-09 17:24:36', 1, 14, '4', 'depth 0 to10', 1, ''),
(28, '2012-10-31 14:51:38', 1, 14, '5', ' 25000 Litre Capacity', 1, ''),
(29, '2012-10-31 14:53:18', 1, 14, '6', '50000 Litres Capacity', 1, ''),
(30, '2012-10-31 14:54:07', 1, 14, '7', '75000 Litre Capacity', 1, ''),
(31, '2012-10-31 14:54:58', 1, 14, '8', '1.0 Lac Litres Capacity ', 1, ''),
(32, '2012-10-31 14:55:38', 1, 14, '9', '1.5 Lac Litres Capacity ', 1, ''),
(33, '2012-10-31 14:56:22', 1, 14, '10', '2.0 Lac Litres Capacity ', 1, ''),
(34, '2012-10-31 15:00:30', 1, 14, '11', '2.5 Lac Litres Capacity ', 1, ''),
(35, '2012-10-31 15:02:06', 1, 14, '12', '5.0 Lac Litres Capacity ', 1, ''),
(36, '2012-11-01 00:22:35', 1, 14, '13', 'depth 20 to 30 m', 1, ''),
(37, '2012-11-01 00:23:22', 1, 14, '14', 'depth 20 to 30 m', 1, ''),
(38, '2012-11-01 00:24:34', 1, 14, '15', 'depth more than 30 m', 1, ''),
(39, '2012-11-09 17:53:51', 1, 14, '16', 'Comp. Strength  ', 1, ''),
(40, '2012-11-09 17:54:43', 1, 14, '17', 'Water Absorption  ', 1, ''),
(41, '2012-11-09 17:56:42', 1, 14, '18', 'Effloroscence  ', 1, ''),
(42, '2012-11-09 17:57:59', 1, 14, '19', 'Comp. Strength  ', 1, ''),
(43, '2012-11-09 17:59:00', 1, 14, '20', 'Flexural Strength  ', 1, ''),
(44, '2012-11-09 18:00:21', 1, 14, '21', 'Water Absorption  ', 1, ''),
(45, '2012-11-09 18:02:59', 1, 14, '22', 'Initial & Final Setting time Comp. Strength (at 7 day’s  curing) , at 28 day’s curing, Soundness, Fineness, Consistency  ', 1, ''),
(46, '2012-11-16 02:33:54', 1, 28, '1', 'DR. J.N. Jha', 1, ''),
(47, '2012-11-16 02:34:19', 1, 28, '2', 'Prof. Kulbir Singh Gill', 1, ''),
(48, '2012-11-16 02:35:38', 1, 28, '3', 'Dr. Jagbir Singh', 1, ''),
(49, '2012-11-16 02:36:23', 1, 28, '4', 'Prof. Kanwaljit Singh Bedi', 1, ''),
(50, '2012-11-16 02:37:07', 1, 28, '5', 'Dr. R.P.Singh', 1, ''),
(51, '2012-11-16 02:37:43', 1, 28, '6', 'Prof.Puneet Pal  Singh', 1, ''),
(52, '2012-11-21 17:07:55', 1, 13, '7', 'Coarse Aggregate', 1, ''),
(53, '2012-11-21 17:14:47', 1, 13, '8', 'Cubes', 1, ''),
(54, '2012-11-21 17:16:56', 1, 13, '9', 'Steel', 1, ''),
(55, '2012-11-21 17:17:16', 1, 13, '10', 'Mix Design', 1, ''),
(56, '2012-11-21 17:17:34', 1, 13, '11', 'Wood', 1, ''),
(57, '2012-11-21 17:20:38', 1, 13, '12', 'Chemical testing', 1, ''),
(58, '2012-11-21 17:21:03', 1, 13, '13', 'Water/Waster Water', 1, ''),
(59, '2012-11-21 17:22:07', 1, 14, '23', 'Sieve Analysis  ', 1, ''),
(60, '2012-11-21 17:23:52', 1, 14, '24', 'Abrasion Value  ', 1, ''),
(61, '2012-11-21 17:24:34', 1, 14, '25', 'Crushing Value/Strength', 1, ''),
(62, '2012-11-21 17:25:54', 1, 14, '26', 'Flakiness Index  ', 1, ''),
(63, '2012-11-21 17:26:40', 1, 14, '27', 'Impact Value  ', 1, ''),
(64, '2012-11-21 17:27:48', 1, 14, '28', 'Specific Gravity  ', 1, ''),
(65, '2012-11-21 17:29:05', 1, 14, '29', 'Soundness Tests  ', 1, ''),
(66, '2012-11-21 17:29:46', 1, 14, '30', 'C.B.R. Test  (Soaked)  ', 1, ''),
(67, '2012-11-21 17:31:10', 1, 14, '31', 'C.B.R. Test  (Unsoaked)  ', 1, ''),
(68, '2012-11-21 17:33:36', 1, 14, '1', 'Sieve Analysis  ', 2, 'Changed name and tags.'),
(69, '2012-11-21 17:34:25', 1, 14, '32', 'Moisture  Content  ', 1, ''),
(70, '2012-11-21 17:35:03', 1, 14, '33', 'Liquid Limit &  Plastic Limit  ', 1, ''),
(71, '2012-11-21 17:36:07', 1, 14, '34', 'Compaction Test  (Dry Bulk Density)  ', 1, ''),
(72, '2012-11-21 17:36:52', 1, 14, '35', 'Specific Gravity  ', 1, ''),
(73, '2012-11-21 17:37:43', 1, 14, '36', 'Comp. Strength  ', 1, ''),
(74, '2012-11-21 17:40:09', 1, 14, '37', 'a) Ultimate Tensile Strength, b) Percentage Elongation, c) Bend test,  d) 0.2 Proof Stress  below 25 mm dia  ', 1, ''),
(75, '2012-11-21 17:41:06', 1, 14, '38', 'a) Ultimate Tensile Strength, b) Percentage Elongation, c) Bend test,  d) 0.2 Proof Stress 25 mm & above   ', 1, ''),
(76, '2012-11-21 17:43:12', 1, 14, '39', 'Barbed Wire ', 1, ''),
(77, '2012-11-21 17:44:12', 1, 14, '40', 'Hing Tension', 1, ''),
(78, '2012-11-21 17:44:59', 1, 14, '41', 'Structural', 1, ''),
(79, '2012-11-21 17:45:53', 1, 14, '42', 'Angle', 1, ''),
(80, '2012-11-21 17:46:34', 1, 14, '43', 'Flats ', 1, ''),
(81, '2012-11-21 17:47:38', 1, 14, '44', 'Tees Channel ', 1, ''),
(82, '2012-11-21 17:50:45', 1, 14, '45', 'Mix Design upto M-30', 1, ''),
(83, '2012-11-21 17:51:46', 1, 14, '46', 'Mix Design M-35 & M-40', 1, ''),
(84, '2012-11-21 17:52:26', 1, 14, '47', 'Mix Design with fly ash', 1, ''),
(85, '2012-12-08 14:39:47', 1, 27, '2', 'Civil Engineering', 1, ''),
(86, '2012-12-08 14:56:46', 1, 27, '5', 'Mechanical Engineering', 1, ''),
(87, '2012-12-08 14:58:30', 1, 27, '6', 'Computer Science Engineering & Information Technol', 1, ''),
(88, '2012-12-08 14:58:46', 1, 27, '7', 'Electrical Engineering', 1, ''),
(89, '2012-12-08 14:59:11', 1, 27, '8', 'Applied Sciences', 1, ''),
(90, '2012-12-08 14:59:20', 1, 27, '9', 'MBA', 1, ''),
(91, '2012-12-08 15:15:24', 1, 12, '1', 'ENVIRONMENT', 2, 'Changed department.'),
(92, '2012-12-08 15:15:35', 1, 12, '2', 'SOM', 2, 'Changed department.'),
(93, '2012-12-08 15:15:51', 1, 12, '3', 'SOIL', 2, 'Changed department.'),
(94, '2012-12-08 15:21:54', 1, 12, '6', 'IT & Computer', 1, ''),
(95, '2012-12-08 15:22:32', 1, 12, '7', 'MBA ', 1, ''),
(96, '2012-12-08 15:23:14', 1, 13, '14', '2 week training', 1, ''),
(97, '2012-12-08 15:23:40', 1, 13, '15', '6 week training', 1, ''),
(98, '2012-12-08 15:24:05', 1, 13, '16', '6 months training', 1, ''),
(99, '2012-12-08 18:43:43', 1, 12, '8', 'Survery', 1, ''),
(100, '2012-12-08 18:45:00', 1, 13, '17', 'Survey', 1, ''),
(101, '2012-12-08 18:45:54', 1, 14, '48', 'Plain area ', 1, ''),
(102, '2012-12-08 18:48:02', 1, 14, '49', 'Semi-Hilly area ', 1, ''),
(103, '2012-12-08 18:48:47', 1, 14, '50', 'Hilly area ', 1, ''),
(104, '2012-12-08 18:52:45', 1, 28, '7', 'Dr. Hardeep Singh Rai', 1, ''),
(105, '2013-01-26 20:19:39', 1, 13, '16', '6 months training (IT, CSE)', 2, 'Changed name and tags.'),
(106, '2013-01-26 20:20:22', 1, 13, '15', '6 week training (IT, CSE)', 2, 'Changed name and tags.'),
(107, '2013-01-26 20:22:01', 1, 13, '14', '2 week training (IT, CSE)', 2, 'Changed name and tags.'),
(108, '2013-01-26 20:23:50', 1, 14, '51', '6 months training ', 1, ''),
(109, '2013-01-26 20:26:41', 1, 14, '52', '6 week training ', 1, ''),
(110, '2013-02-17 10:48:45', 1, 12, '8', 'Survey', 2, 'Changed name.'),
(111, '2013-02-17 10:48:47', 1, 12, '8', 'Survey', 2, 'No fields changed.'),
(112, '2013-02-17 10:57:43', 1, 13, '17', 'Survey', 2, 'No fields changed.'),
(113, '2013-02-17 10:58:33', 1, 13, '2', 'Fine Aggregate (Soil)', 2, 'Changed image.'),
(114, '2013-02-17 10:58:51', 1, 13, '7', 'Coarse Aggregate ( Soil)', 2, 'Changed image.');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'log entry', 'admin', 'logentry'),
(8, 'registration profile', 'registration', 'registrationprofile'),
(9, 'report', 'tcc', 'report'),
(10, 'user profile', 'tcc', 'userprofile'),
(11, 'auto_number', 'tcc', 'auto_number'),
(12, 'lab', 'tcc', 'lab'),
(13, 'material', 'tcc', 'material'),
(14, 'test', 'tcc', 'test'),
(15, 'govt', 'tcc', 'govt'),
(16, 'payment', 'tcc', 'payment'),
(17, 'job', 'tcc', 'job'),
(18, 'client job', 'tcc', 'clientjob'),
(19, 'suspence job', 'tcc', 'suspencejob'),
(20, 'test total', 'tcc', 'testtotal'),
(22, 'bill', 'tcc', 'bill'),
(23, 'amount', 'tcc', 'amount'),
(24, 'cdf amount', 'tcc', 'cdfamount'),
(25, 'suspence', 'tcc', 'suspence'),
(26, 'organisation', 'tcc', 'organisation'),
(27, 'department', 'tcc', 'department'),
(28, 'staff', 'tcc', 'staff'),
(30, 'profroma tax', 'tcc', 'profromatax'),
(32, 'transportation', 'tcc', 'transportation'),
(33, 'transport', 'tcc', 'transport'),
(34, 'bankdetails', 'tcc', 'bankdetails'),
(35, 'distance', 'tcc', 'distance'),
(36, 'tag', 'tagging', 'tag'),
(37, 'tagged item', 'tagging', 'taggeditem'),
(38, 'clientadd', 'tcc', 'clientadd'),
(39, 'edit job', 'tcc', 'editjob'),
(40, 'client edit job', 'tcc', 'clienteditjob'),
(41, 'ta da', 'tcc', 'tada'),
(42, 'test total perf', 'tcc', 'testtotalperf'),
(43, 'bill perf', 'tcc', 'billperf'),
(44, 'edit clientadd', 'tcc', 'editclientadd'),
(45, 'suspence edit job', 'tcc', 'suspenceeditjob'),
(46, 'search', 'report', 'search'),
(47, 'report', 'report', 'report'),
(48, 'cube', 'report', 'cube'),
(49, 'chem_analysis', 'report', 'chem_analysis'),
(50, 'steel', 'report', 'steel'),
(51, 'ground_ water', 'report', 'ground_water'),
(52, 'concrete_ paver', 'report', 'concrete_paver'),
(53, 'interlock_ tiles', 'report', 'interlock_tiles'),
(54, 'pc', 'report', 'pc'),
(55, 'rebound_ hammer_ testing', 'report', 'rebound_hammer_testing'),
(56, 'brick', 'report', 'brick'),
(57, 'water', 'report', 'water'),
(58, 'soil_ ohsr', 'report', 'soil_ohsr'),
(59, 'soil_ building', 'report', 'soil_building'),
(60, 'admixture', 'report', 'admixture'),
(61, 'cement_ppc', 'report', 'cement_ppc'),
(62, 'cement_op c_33', 'report', 'cement_opc_33'),
(63, 'cement_op c_43', 'report', 'cement_opc_43'),
(64, 'cement_op c_53', 'report', 'cement_opc_53');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`, `user_id`) VALUES
('04c08beee53b83744cbd0d81ebfa7f7a', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-12-28 23:48:52', NULL),
('1afa704be235b0787ed23d7ebe26fc28', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-12-03 17:35:17', 1),
('1b38a0492eec9f50f4a3bbcc9f43a7ec', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-02-27 14:55:14', NULL),
('28d2d44c1f7cab10296c834305760701', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-03-10 22:10:43', NULL),
('4796af20a398324c0f67003f775f41fc', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-02-27 15:12:12', NULL),
('4baf31d0be642c774bcaeb7397cb3da5', 'ODY1ODAyYjFlZjc3YTdiZTIyZmJhZDFhZTE5YjIxMTNjNDQ2NmYyYjqAAn1xAS4=\n', '2013-03-13 21:31:01', NULL),
('50059ecc07309f241a14c5e707fd4dfb', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-03-02 23:32:29', NULL),
('58fc85eb2be08b43b9c5da4f3629615a', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-12-19 13:24:44', 1),
('65c17073c4b6bdd6193da876063f6d33', 'YTA1ODZlMTE4NGMzZTVmYjAxNmNmY2M1ZWYzODI3ZWE3NzViZmM3MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n', '2013-03-13 21:41:46', NULL),
('6ac4953fd980c9290ff05a83289b023e', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-02-28 23:36:24', NULL),
('6e1f841d94926c48523b20464291ae6a', 'OGEwM2FlMTdmZWEwZDdhODBlN2JlYjVmNDgyNzMzNzliNzIwMTk1ODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n', '2013-02-27 11:32:36', NULL),
('75b49464ea6b579415e551263f554479', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-10-21 00:02:22', 1),
('8fcd0b41fb0c3c2cd9ceccf61c7db1b9', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-10-20 23:42:35', 1),
('c9949a35ca39c06f66da87dfb56e3d5e', 'Yjg5ODQxMDRhOTlkNzFmY2E1M2NiNmM3OTk4ZWE3ODA5NjhjNzQ0OTqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n', '2013-02-27 12:34:47', NULL),
('cafcf422677c89b7fb863d9cf6ce6c40', 'YWFmNWNmMjhmMjhlOTgyNWEyODA4YjlmNjE4NTkxNDcxZjI2OTk5YTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kVQ1fYXV0aF91c2VyX2lkigEBdS4=\n', '2012-12-27 19:27:20', 1),
('cb2ddd26bae581a5e3225bc237589968', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-01-17 00:42:50', NULL),
('d98db3c9547a06439209e41990bdfc5b', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-11-12 03:44:20', 1),
('d9ce6f15655217be3d5c0adeec80e2ed', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-11-12 02:52:45', 1),
('ea4395a1173ad138f761b406d00e381e', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-10-26 00:43:28', 1),
('ee70ae7a07fd5829bbc9027a18b46381', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-11-30 15:06:07', 1),
('fd60492171f0ef8b3686af3b18e56cf2', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-03-02 10:49:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'localhost', 'localhost');

-- --------------------------------------------------------

--
-- Table structure for table `registration_registrationprofile`
--

CREATE TABLE IF NOT EXISTS `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `tagging_tag`
--

CREATE TABLE IF NOT EXISTS `tagging_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `tagging_tag`
--

INSERT INTO `tagging_tag` (`id`, `name`) VALUES
(88, '&'),
(20, '0'),
(28, '1.5laclitre'),
(21, '10'),
(27, '1laclitre'),
(92, '2'),
(106, '2 week training (IT'),
(30, '2.5laclitre'),
(32, '20'),
(68, '2500'),
(24, '25000litre'),
(29, '2laclitre'),
(33, '30'),
(31, '5laclitre'),
(95, '6'),
(103, '6 months training (IT'),
(105, '6 week training (IT'),
(25, '75000'),
(26, '75000litre'),
(71, 'above'),
(52, 'abrasion'),
(38, 'absorption'),
(42, 'aggregate'),
(8, 'aggregates'),
(50, 'analysis'),
(77, 'angle'),
(99, 'area'),
(85, 'ash'),
(72, 'barbed'),
(13, 'bc'),
(10, 'beams'),
(69, 'below'),
(2, 'bricks'),
(60, 'CBR'),
(12, 'cement'),
(79, 'channel'),
(7, 'chemical'),
(58, 'coarse'),
(36, 'comp.'),
(66, 'compaction'),
(89, 'Computer'),
(16, 'content'),
(43, 'course'),
(53, 'crushing'),
(104, 'CSE)'),
(44, 'cube'),
(67, 'cubes'),
(46, 'deign'),
(22, 'depth'),
(82, 'design'),
(70, 'dia'),
(39, 'effloroscence'),
(1, 'environment'),
(9, 'fine'),
(18, 'fineness'),
(62, 'fines'),
(54, 'flakiness'),
(78, 'flat'),
(40, 'flexural'),
(86, 'fly'),
(14, 'for'),
(56, 'gravity'),
(102, 'hilly'),
(74, 'hing'),
(55, 'impact'),
(90, 'IT'),
(64, 'limit'),
(65, 'liquid'),
(81, 'M-30'),
(83, 'M-40'),
(98, 'material'),
(91, 'mba'),
(47, 'mix'),
(84, 'mix design M-35'),
(19, 'modulus'),
(63, 'moisture'),
(96, 'months'),
(34, 'more'),
(15, 'ohsr'),
(11, 'pavers'),
(100, 'plain'),
(101, 'semi-hilly'),
(51, 'sieve'),
(17, 'silt'),
(4, 'soil'),
(3, 'som'),
(59, 'soundness'),
(57, 'specific'),
(45, 'steel'),
(37, 'strength'),
(76, 'structural'),
(97, 'survey'),
(80, 'tees'),
(75, 'tension'),
(49, 'test'),
(41, 'tests'),
(35, 'than'),
(23, 'to'),
(93, 'training'),
(61, 'unsoaked'),
(5, 'waste water'),
(6, 'water'),
(94, 'week'),
(73, 'wire'),
(87, 'with'),
(48, 'wood');

-- --------------------------------------------------------

--
-- Table structure for table `tagging_taggeditem`
--

CREATE TABLE IF NOT EXISTS `tagging_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_id` (`tag_id`,`content_type_id`,`object_id`),
  KEY `tagging_taggeditem_3747b463` (`tag_id`),
  KEY `tagging_taggeditem_1bb8f392` (`content_type_id`),
  KEY `tagging_taggeditem_7d61c803` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=198 ;

--
-- Dumping data for table `tagging_taggeditem`
--

INSERT INTO `tagging_taggeditem` (`id`, `tag_id`, `content_type_id`, `object_id`) VALUES
(1, 1, 12, 1),
(8, 2, 13, 1),
(3, 3, 12, 2),
(4, 4, 12, 3),
(16, 4, 13, 5),
(5, 5, 12, 4),
(6, 6, 12, 4),
(80, 6, 13, 13),
(55, 6, 14, 17),
(68, 6, 14, 21),
(7, 7, 12, 5),
(78, 7, 13, 12),
(9, 8, 13, 2),
(18, 8, 14, 1),
(10, 9, 13, 2),
(19, 9, 14, 1),
(116, 9, 14, 33),
(121, 9, 14, 34),
(123, 9, 14, 35),
(11, 10, 13, 3),
(12, 11, 13, 3),
(59, 11, 14, 19),
(63, 11, 14, 20),
(67, 11, 14, 21),
(13, 12, 13, 4),
(69, 12, 14, 22),
(14, 13, 13, 5),
(15, 14, 13, 5),
(58, 14, 14, 19),
(62, 14, 14, 20),
(66, 14, 14, 21),
(179, 14, 14, 48),
(17, 15, 13, 6),
(27, 15, 14, 4),
(40, 15, 14, 13),
(45, 15, 14, 14),
(50, 15, 14, 15),
(20, 16, 14, 2),
(112, 16, 14, 32),
(21, 17, 14, 2),
(22, 18, 14, 3),
(23, 19, 14, 3),
(24, 20, 14, 4),
(25, 21, 14, 4),
(37, 21, 14, 13),
(26, 22, 14, 4),
(39, 22, 14, 13),
(44, 22, 14, 14),
(48, 22, 14, 15),
(28, 23, 14, 4),
(41, 23, 14, 13),
(46, 23, 14, 14),
(29, 24, 14, 5),
(30, 25, 14, 6),
(31, 26, 14, 7),
(32, 27, 14, 8),
(33, 28, 14, 9),
(34, 29, 14, 10),
(35, 30, 14, 11),
(36, 31, 14, 12),
(38, 32, 14, 13),
(42, 32, 14, 14),
(43, 33, 14, 14),
(47, 33, 14, 15),
(49, 34, 14, 15),
(51, 35, 14, 15),
(52, 36, 14, 16),
(57, 36, 14, 19),
(126, 36, 14, 36),
(53, 37, 14, 16),
(60, 37, 14, 19),
(64, 37, 14, 20),
(128, 37, 14, 36),
(54, 38, 14, 17),
(65, 38, 14, 21),
(56, 39, 14, 18),
(61, 40, 14, 20),
(70, 41, 14, 22),
(71, 42, 13, 7),
(85, 42, 14, 24),
(87, 42, 14, 25),
(90, 42, 14, 26),
(93, 42, 14, 27),
(96, 42, 14, 28),
(100, 42, 14, 29),
(105, 42, 14, 30),
(107, 42, 14, 31),
(111, 42, 14, 32),
(115, 42, 14, 33),
(119, 42, 14, 34),
(122, 42, 14, 35),
(72, 43, 13, 7),
(82, 43, 14, 23),
(86, 43, 14, 24),
(88, 43, 14, 25),
(91, 43, 14, 26),
(94, 43, 14, 27),
(97, 43, 14, 28),
(73, 44, 13, 8),
(74, 45, 13, 9),
(132, 45, 14, 37),
(136, 45, 14, 38),
(138, 45, 14, 39),
(141, 45, 14, 40),
(143, 45, 14, 41),
(146, 45, 14, 42),
(148, 45, 14, 43),
(150, 45, 14, 44),
(75, 46, 13, 10),
(76, 47, 13, 10),
(154, 47, 14, 45),
(160, 47, 14, 47),
(77, 48, 13, 11),
(79, 49, 13, 12),
(103, 49, 14, 29),
(81, 50, 14, 23),
(110, 51, 14, 1),
(83, 51, 14, 23),
(84, 52, 14, 24),
(89, 53, 14, 25),
(92, 54, 14, 26),
(95, 55, 14, 27),
(98, 56, 14, 28),
(124, 56, 14, 35),
(99, 57, 14, 28),
(125, 57, 14, 35),
(101, 58, 14, 29),
(106, 58, 14, 30),
(108, 58, 14, 31),
(102, 59, 14, 29),
(104, 60, 14, 30),
(109, 61, 14, 31),
(113, 62, 14, 32),
(114, 63, 14, 32),
(117, 64, 14, 33),
(118, 65, 14, 33),
(120, 66, 14, 34),
(127, 67, 14, 36),
(129, 68, 14, 37),
(133, 68, 14, 38),
(130, 69, 14, 37),
(131, 70, 14, 37),
(135, 70, 14, 38),
(134, 71, 14, 38),
(137, 72, 14, 39),
(139, 73, 14, 39),
(140, 74, 14, 40),
(142, 75, 14, 40),
(144, 76, 14, 41),
(145, 77, 14, 42),
(147, 78, 14, 43),
(149, 79, 14, 44),
(151, 80, 14, 44),
(152, 81, 14, 45),
(153, 82, 14, 45),
(158, 82, 14, 47),
(155, 83, 14, 46),
(156, 84, 14, 46),
(157, 85, 14, 47),
(159, 86, 14, 47),
(161, 87, 14, 47),
(162, 88, 12, 6),
(163, 89, 12, 6),
(164, 90, 12, 6),
(165, 91, 12, 7),
(175, 97, 12, 8),
(177, 97, 13, 17),
(181, 97, 14, 48),
(184, 97, 14, 49),
(187, 97, 14, 50),
(176, 98, 13, 17),
(178, 99, 14, 48),
(182, 99, 14, 49),
(185, 99, 14, 50),
(180, 100, 14, 48),
(183, 101, 14, 49),
(186, 102, 14, 50),
(188, 103, 13, 16),
(194, 103, 14, 51),
(193, 104, 13, 14),
(191, 104, 13, 15),
(189, 104, 13, 16),
(195, 104, 14, 51),
(197, 104, 14, 52),
(190, 105, 13, 15),
(196, 105, 14, 52),
(192, 106, 13, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tcc_amount`
--

CREATE TABLE IF NOT EXISTS `tcc_amount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `college_income` int(11) DEFAULT NULL,
  `admin_charge` int(11) DEFAULT NULL,
  `consultancy_asst` int(11) DEFAULT NULL,
  `development_fund` int(11) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `report_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_amount_751f44ae` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_auto_number`
--

CREATE TABLE IF NOT EXISTS `tcc_auto_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_no` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_no` (`job_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_bankdetails`
--

CREATE TABLE IF NOT EXISTS `tcc_bankdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accname` varchar(50) NOT NULL,
  `accountno` int(11) NOT NULL,
  `accountcode` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_bill`
--

CREATE TABLE IF NOT EXISTS `tcc_bill` (
  `job_no` int(11) NOT NULL,
  `education_tax` int(11) DEFAULT NULL,
  `higher_education_tax` int(11) DEFAULT NULL,
  `service_tax` int(11) DEFAULT NULL,
  `net_total` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_billperf`
--

CREATE TABLE IF NOT EXISTS `tcc_billperf` (
  `job_no` int(11) NOT NULL,
  `education_tax` int(11) DEFAULT NULL,
  `higher_education_tax` int(11) DEFAULT NULL,
  `service_tax` int(11) DEFAULT NULL,
  `net_total` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_cdfamount`
--

CREATE TABLE IF NOT EXISTS `tcc_cdfamount` (
  `job_no` int(11) NOT NULL,
  `date` date NOT NULL,
  `lab` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `field` varchar(10) NOT NULL,
  `other_field` varchar(100) DEFAULT NULL,
  `report_type` varchar(20) NOT NULL,
  PRIMARY KEY (`job_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_clientadd`
--

CREATE TABLE IF NOT EXISTS `tcc_clientadd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_clientadd_fbfc09f1` (`user_id`),
  KEY `tcc_clientadd_4a4e8ffb` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_clienteditjob`
--

CREATE TABLE IF NOT EXISTS `tcc_clienteditjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_clienteditjob_751f44ae` (`job_id`),
  KEY `tcc_clienteditjob_fab9ba43` (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_clienteditjob_test`
--

CREATE TABLE IF NOT EXISTS `tcc_clienteditjob_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clienteditjob_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clienteditjob_id` (`clienteditjob_id`,`test_id`),
  KEY `tcc_clienteditjob_test_cbd9e9bb` (`clienteditjob_id`),
  KEY `tcc_clienteditjob_test_a88de8dc` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_clientjob`
--

CREATE TABLE IF NOT EXISTS `tcc_clientjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_clientjob_751f44ae` (`job_id`),
  KEY `tcc_clientjob_fab9ba43` (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_clientjob_test`
--

CREATE TABLE IF NOT EXISTS `tcc_clientjob_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientjob_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clientjob_id` (`clientjob_id`,`test_id`),
  KEY `tcc_clientjob_test_244d514d` (`clientjob_id`),
  KEY `tcc_clientjob_test_a88de8dc` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_department`
--

CREATE TABLE IF NOT EXISTS `tcc_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organisation_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `dean` varchar(50) DEFAULT NULL,
  `faxno` int(11) DEFAULT NULL,
  `email_1` varchar(75) NOT NULL,
  `email_2` varchar(75) NOT NULL,
  `url` varchar(50) NOT NULL,
  `about` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_department_28b1ef86` (`organisation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tcc_department`
--

INSERT INTO `tcc_department` (`id`, `organisation_id`, `name`, `address`, `phone`, `dean`, `faxno`, `email_1`, `email_2`, `url`, `about`) VALUES
(1, 1, 'Testing & Consultancy Cell', 'Gill Road, Gill Park, GNDEC Ludhiana', '0161-2491193, 506450', 'Dr. Hardeep Singh Rai', 1615064742, '', '', '', ''),
(2, 1, 'Civil Engineering', 'Gill Park, Gill Road, Ludhiana', '82347582', 'Dr. J.N. Jha', NULL, '', '', '', ''),
(5, 1, 'Mechanical Engineering', 'GNDEC,  Ludhiana', '', '', NULL, '', '', '', ''),
(6, 1, 'Computer Science Engineering & Information Technol', 'GNDEC,  Ludhiana', '', '', NULL, '', '', '', ''),
(7, 1, 'Electrical Engineering', 'GNDEC,  Ludhiana', '', '', NULL, '', '', '', ''),
(8, 1, 'Applied Sciences', 'GNDEC,  Ludhiana', '', '', NULL, '', '', '', ''),
(9, 1, 'MBA', 'GNDEC,  Ludhiana', '', '', NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_distance`
--

CREATE TABLE IF NOT EXISTS `tcc_distance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` int(11) NOT NULL,
  `sandy` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_editclientadd`
--

CREATE TABLE IF NOT EXISTS `tcc_editclientadd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_editclientadd_fbfc09f1` (`user_id`),
  KEY `tcc_editclientadd_4a4e8ffb` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_editjob`
--

CREATE TABLE IF NOT EXISTS `tcc_editjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `job_no` int(11) NOT NULL,
  `sample` varchar(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `site` varchar(600) NOT NULL,
  `type_of_work_id` int(11) NOT NULL,
  `report_type_id` int(11) NOT NULL,
  `pay` varchar(600) NOT NULL,
  `date` date NOT NULL,
  `check_number` varchar(15) NOT NULL,
  `check_dd_date` varchar(15) NOT NULL,
  `letter_no` int(11) DEFAULT NULL,
  `letter_date` date DEFAULT NULL,
  `tds` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_editjob_4a4e8ffb` (`client_id`),
  KEY `tcc_editjob_ca5d2cd8` (`type_of_work_id`),
  KEY `tcc_editjob_3d4f9c7e` (`report_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_govt`
--

CREATE TABLE IF NOT EXISTS `tcc_govt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(600) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tcc_govt`
--

INSERT INTO `tcc_govt` (`id`, `name`) VALUES
(1, 'GOVERNMENT'),
(2, 'SEMI-GOVERNMENT'),
(3, 'PRIVATE');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_job`
--

CREATE TABLE IF NOT EXISTS `tcc_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `job_no` int(11) NOT NULL,
  `sample` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `site` varchar(1000) NOT NULL,
  `type_of_work_id` int(11) NOT NULL,
  `report_type_id` int(11) NOT NULL,
  `pay` varchar(600) NOT NULL,
  `check_number` varchar(15) NOT NULL,
  `check_dd_date` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `letter_no` int(11) DEFAULT NULL,
  `letter_date` date DEFAULT NULL,
  `tds` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_job_4a4e8ffb` (`client_id`),
  KEY `tcc_job_ca5d2cd8` (`type_of_work_id`),
  KEY `tcc_job_3d4f9c7e` (`report_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_lab`
--

CREATE TABLE IF NOT EXISTS `tcc_lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(300) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tcc_lab`
--

INSERT INTO `tcc_lab` (`id`, `code`, `name`, `tags`, `department_id`) VALUES
(1, '01', 'ENVIRONMENT', 'environment', 2),
(2, '02', 'SOM', 'som', 2),
(3, '03', 'SOIL', 'soil', 2),
(4, '04', 'WATER/WASTE WATER', 'water, waste water', 0),
(5, '05', 'CHEMICAL', 'chemical', 0),
(6, '01', 'IT & Computer', 'IT & Computer', 6),
(7, '01', 'MBA ', 'mba', 9),
(8, '06', 'Survey', 'survey', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tcc_material`
--

CREATE TABLE IF NOT EXISTS `tcc_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(300) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `report_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_material_4a1410c6` (`lab_id`),
  KEY `tcc_material_29fa1030` (`report_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tcc_material`
--

INSERT INTO `tcc_material` (`id`, `lab_id`, `code`, `name`, `tags`, `report_id`, `image`) VALUES
(1, 2, '01', 'Bricks', 'bricks', 1, ''),
(2, 3, '01', 'Fine Aggregate (Soil)', 'fine aggregates', 1, 'logo/fine.jpeg'),
(3, 2, '02', 'Pavers/Beams', 'pavers, beams', 1, ''),
(4, 2, '03', 'Cement', 'cement', 1, ''),
(5, 3, '03', 'Soil for BC', 'soil for bc', 2, ''),
(6, 3, '04', 'OHSR', 'ohsr', 2, ''),
(7, 3, '02', 'Coarse Aggregate ( Soil)', 'course aggregate', 1, 'logo/CAggregate.JPG'),
(8, 2, '04', 'Cubes', 'cube', 1, ''),
(9, 2, '05', 'Steel', 'steel', 1, ''),
(10, 2, '06', 'Mix Design', 'mix deign', 1, ''),
(11, 2, '07', 'Wood', 'wood', 1, ''),
(12, 5, '01', 'Chemical testing', 'chemical test', 1, ''),
(13, 1, '01', 'Water/Waster Water', 'water', 1, ''),
(14, 6, '01', '2 week training (IT, CSE)', '2 week training (IT, CSE)', 1, ''),
(15, 6, '02', '6 week training (IT, CSE)', '6 week training (IT, CSE)', 1, ''),
(16, 6, '03', '6 months training (IT, CSE)', '6 months training (IT, CSE)', 1, ''),
(17, 8, '01 ', 'Survey', 'survey material', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_organisation`
--

CREATE TABLE IF NOT EXISTS `tcc_organisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `director` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tcc_organisation`
--

INSERT INTO `tcc_organisation` (`id`, `name`, `address`, `phone`, `director`) VALUES
(1, 'Guru Nanak Dev Engineering College', 'Gill Road, Gill Park, GNDEC Ludhiana', '0161-2491193, 506450', 'Dr. M.S. Saini');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_payment`
--

CREATE TABLE IF NOT EXISTS `tcc_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tcc_payment`
--

INSERT INTO `tcc_payment` (`id`, `name`) VALUES
(1, 'CASH'),
(2, 'CHEQUE'),
(3, 'ONLINE'),
(4, 'DD');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_proformabill`
--

CREATE TABLE IF NOT EXISTS `tcc_proformabill` (
  `pro_no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(210) NOT NULL,
  `address` varchar(750) NOT NULL,
  `charges_for` varchar(450) NOT NULL,
  `site` varchar(750) NOT NULL,
  `sample` varchar(270) NOT NULL,
  `ref_no` varchar(300) NOT NULL,
  `rate` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `transpotation` int(11) NOT NULL,
  `labour` varchar(300) NOT NULL,
  PRIMARY KEY (`pro_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_profromatax`
--

CREATE TABLE IF NOT EXISTS `tcc_profromatax` (
  `pro_no` int(11) NOT NULL,
  `service_tax` int(11) NOT NULL,
  `higher_education_tax` int(11) NOT NULL,
  `education_tax` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`pro_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_report`
--

CREATE TABLE IF NOT EXISTS `tcc_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_report`
--

INSERT INTO `tcc_report` (`id`, `name`) VALUES
(1, 'LAB'),
(2, 'FIELD');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_sessiondata`
--

CREATE TABLE IF NOT EXISTS `tcc_sessiondata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_staff`
--

CREATE TABLE IF NOT EXISTS `tcc_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `daily_income` int(11) NOT NULL,
  `position` varchar(15) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_staff_2ae7390` (`department_id`),
  KEY `tcc_staff_4a1410c6` (`lab_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tcc_staff`
--

INSERT INTO `tcc_staff` (`id`, `department_id`, `code`, `name`, `daily_income`, `position`, `lab_id`, `email`) VALUES
(1, 1, 'A', 'DR. J.N. Jha', 160, 'Prof.', 3, ''),
(2, 1, 'B', 'Prof. Kulbir Singh Gill', 120, 'A.P', 3, ''),
(3, 1, 'C', 'Dr. Jagbir Singh', 120, 'A.P', 2, ''),
(4, 1, 'D', 'Prof. Kanwaljit Singh Bedi', 120, 'A.P', 2, ''),
(5, 1, 'E', 'Dr. R.P.Singh', 100, 'A.P', 5, ''),
(6, 1, 'F', 'Prof.Puneet Pal  Singh', 100, 'AP', 1, ''),
(7, 2, 'G', 'Dr. Hardeep Singh Rai', 180, 'Prof.', 8, 'hsrai@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_suspence`
--

CREATE TABLE IF NOT EXISTS `tcc_suspence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `sus_id` int(11) NOT NULL,
  `work_charge` int(11) DEFAULT NULL,
  `labour_charge` int(11) DEFAULT NULL,
  `boring_charge_external` int(11) DEFAULT NULL,
  `boring_charge_internal` int(11) DEFAULT NULL,
  `car_taxi_charge` int(11) DEFAULT NULL,
  `lab_testing_staff` varchar(90) NOT NULL,
  `field_testing_staff` varchar(90) NOT NULL,
  `test_date` date DEFAULT NULL,
  `suspence_bill_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_suspence_751f44ae` (`job_id`),
  KEY `tcc_suspence_c13e1de8` (`sus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_suspenceeditjob`
--

CREATE TABLE IF NOT EXISTS `tcc_suspenceeditjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `other` varchar(600) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_suspenceeditjob_751f44ae` (`job_id`),
  KEY `tcc_suspenceeditjob_b49f3317` (`field_id`),
  KEY `tcc_suspenceeditjob_a88de8dc` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_suspencejob`
--

CREATE TABLE IF NOT EXISTS `tcc_suspencejob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `other` varchar(600) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_suspencejob_751f44ae` (`job_id`),
  KEY `tcc_suspencejob_b49f3317` (`field_id`),
  KEY `tcc_suspencejob_a88de8dc` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_tada`
--

CREATE TABLE IF NOT EXISTS `tcc_tada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `departure_time_up` time NOT NULL,
  `arrival_time_up` time NOT NULL,
  `departure_time_down` time NOT NULL,
  `arrival_time_down` time NOT NULL,
  `tada_amount` int(11) DEFAULT NULL,
  `reach_site` varchar(60) NOT NULL,
  `test_date` varchar(15) NOT NULL,
  `end_date` varchar(15) NOT NULL,
  `testing_staff_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_tada_751f44ae` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_test`
--

CREATE TABLE IF NOT EXISTS `tcc_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(300) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(15) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  `tags` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_test_54645bd` (`material_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `tcc_test`
--

INSERT INTO `tcc_test` (`id`, `material_id`, `code`, `name`, `quantity`, `unit`, `cost`, `tags`) VALUES
(1, 2, '01', 'Sieve Analysis  ', 3, 'kg', 800, 'fine aggregates sieve'),
(2, 2, '02', 'SILT CONTENT', 3, 'kg', 800, 'silt content'),
(3, 2, '03', 'FINENESS MODULUS', 3, 'kg', 800, 'fineness modulus'),
(4, 5, '01', 'depth 0 to10', 6000, 'meter', 0, 'ohsr depth 0 to 10'),
(5, 6, '01', ' 25000 Litre Capacity', 1, 'litre', 6000, '25000litre'),
(6, 6, '02', '50000 Litres Capacity', 1, 'litre', 6000, '75000'),
(7, 6, '03', '75000 Litre Capacity', 1, 'litre', 6000, '75000litre'),
(8, 6, '04', '1.0 Lac Litres Capacity ', 1, 'litre', 8200, '1laclitre'),
(9, 6, '05', '1.5 Lac Litres Capacity ', 1, 'litre', 8200, '1.5laclitre'),
(10, 6, '06', '2.0 Lac Litres Capacity ', 1, 'litre', 8200, '2laclitre'),
(11, 6, '07', '2.5 Lac Litres Capacity ', 1, 'litre', 8200, '2.5laclitre'),
(12, 6, '08', '5.0 Lac Litres Capacity ', 1, 'litre', 10600, '5laclitre'),
(13, 5, '02', 'depth 10 to 20 m', 6000, 'meter', 900, 'ohsr depth 10 to 20'),
(14, 5, '03', 'depth 20 to 30 m', 6000, 'meter', 1200, 'ohsr depth 20 to 30'),
(15, 5, '04', 'depth more than 30 m', 6000, 'meter', 1500, 'ohsr depth more than 30'),
(16, 1, '01', 'Comp. Strength  ', 10, 'Bricks', 1200, 'comp. strength'),
(17, 1, '02', 'Water Absorption  ', 10, 'Bricks', 1200, 'water absorption'),
(18, 1, '03', 'Effloroscence  ', 10, 'Bricks', 1200, 'effloroscence'),
(19, 3, '01', 'Comp. Strength  ', 1, 'C.paver', 300, 'comp. strength for pavers'),
(20, 3, '02', 'Flexural Strength  ', 1, 'C.paver', 300, 'flexural strength for pavers'),
(21, 3, '03', 'Water Absorption  ', 1, 'C.paver', 300, 'water absorption for pavers'),
(22, 4, '01', 'Initial & Final Setting time Comp. Strength (at 7 day’s  curing) , at 28 day’s curing, Soundness, Fineness, Consistency  ', 15, 'kg', 2500, 'cement tests'),
(23, 7, '01', 'Sieve Analysis  ', 10, 'kg', 800, 'course sieve analysis'),
(24, 7, '02', 'Abrasion Value  ', 10, 'kg', 800, 'course aggregate abrasion'),
(25, 7, '03', 'Crushing Value/Strength', 10, 'kg', 800, 'course aggregate crushing'),
(26, 7, '04', 'Flakiness Index  ', 10, 'kg', 800, 'course aggregate flakiness'),
(27, 7, '05', 'Impact Value  ', 5, 'kg', 800, 'course aggregate impact'),
(28, 7, '06', 'Specific Gravity  ', 5, 'kg', 800, 'course aggregate specific gravity'),
(29, 7, '07', 'Soundness Tests  ', 5, 'kg', 800, 'coarse aggregate soundness test'),
(30, 7, '08', 'C.B.R. Test  (Soaked)  ', 10, 'kg', 1800, 'coarse aggregate CBR '),
(31, 7, '09', 'C.B.R. Test  (Unsoaked)  ', 10, 'kg', 1800, 'coarse aggregate unsoaked'),
(32, 2, '04', 'Moisture  Content  ', 3, 'kg', 800, 'fines aggregate moisture content'),
(33, 2, '05', 'Liquid Limit &  Plastic Limit  ', 3, 'kg', 800, 'fine aggregate liquid limit'),
(34, 2, '06', 'Compaction Test  (Dry Bulk Density)  ', 5, 'kg', 1500, 'fine aggregate compaction'),
(35, 2, '07', 'Specific Gravity  ', 5, 'kg', 800, 'fine aggregate specific gravity'),
(36, 8, '01', 'Comp. Strength  ', 3, 'Cubes', 500, 'cubes comp. strength'),
(37, 9, '01', 'a) Ultimate Tensile Strength, b) Percentage Elongation, c) Bend test,  d) 0.2 Proof Stress  below 25 mm dia  ', 2, 'feet', 1500, 'steel below 2500 dia'),
(38, 9, '02', 'a) Ultimate Tensile Strength, b) Percentage Elongation, c) Bend test,  d) 0.2 Proof Stress 25 mm & above   ', 2, 'feet', 2500, 'steel above 2500 dia'),
(39, 9, '03', 'Barbed Wire ', 2, 'feet', 2500, 'steel barbed wire'),
(40, 9, '04', 'Hing Tension', 2, 'feet', 2500, 'steel hing tension'),
(41, 9, '05', 'Structural', 2, 'feet', 2500, 'steel structural'),
(42, 9, '06', 'Angle', 2, 'feet', 2500, 'steel angle'),
(43, 9, '07', 'Flats ', 2, 'feet', 2500, 'steel flat'),
(44, 9, '08', 'Tees Channel ', 2, 'feet', 2500, 'steel tees channel'),
(45, 10, '01', 'Mix Design upto M-30', 1, 'Bag', 8000, 'mix design M-30'),
(46, 10, '02', 'Mix Design M-35 & M-40', 2, 'Bag', 10000, 'mix design M-35, M-40'),
(47, 10, '03', 'Mix Design with fly ash', 2, 'Bag', 15000, 'mix design with fly ash'),
(48, 17, '01', 'Plain area ', 1, 'acre', 1000, 'survey for plain area'),
(49, 17, '02', 'Semi-Hilly area ', 1, 'acre', 1500, 'survey semi-hilly area'),
(50, 17, '03', 'Hilly area ', 1, 'acre', 2000, 'survey hilly area'),
(51, 16, '01', '6 months training ', 6, 'months', 6000, '6 months training (IT, CSE)'),
(52, 15, '01', '6 week training ', 6, 'week', 2000, '6 week training (IT, CSE)');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_testtotal`
--

CREATE TABLE IF NOT EXISTS `tcc_testtotal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_no` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `mat` int(11) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_testtotal_751f44ae` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_testtotalperf`
--

CREATE TABLE IF NOT EXISTS `tcc_testtotalperf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_no` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `mat` int(11) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_testtotalperf_751f44ae` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_transport`
--

CREATE TABLE IF NOT EXISTS `tcc_transport` (
  `vehicle_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_no` int(11) NOT NULL,
  `bill_no` int(11) DEFAULT NULL,
  `kilometer` varchar(150) NOT NULL,
  `amounts` varchar(180) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `test_date` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_transport_4bffff7` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_transportation`
--

CREATE TABLE IF NOT EXISTS `tcc_transportation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleno` varchar(150) NOT NULL,
  `rate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_userprofile`
--

CREATE TABLE IF NOT EXISTS `tcc_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `state` varchar(30) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `contact_no` varchar(25) NOT NULL,
  `type_of_organisation` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_userprofile_fbfc09f1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `registration_registrationprofile`
--
ALTER TABLE `registration_registrationprofile`
  ADD CONSTRAINT `user_id_refs_id_cecd7f3c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tagging_taggeditem`
--
ALTER TABLE `tagging_taggeditem`
  ADD CONSTRAINT `content_type_id_refs_id_e07b113` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `tag_id_refs_id_60aefff3` FOREIGN KEY (`tag_id`) REFERENCES `tagging_tag` (`id`);

--
-- Constraints for table `tcc_amount`
--
ALTER TABLE `tcc_amount`
  ADD CONSTRAINT `job_id_refs_id_6018e7df` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`);

--
-- Constraints for table `tcc_clientadd`
--
ALTER TABLE `tcc_clientadd`
  ADD CONSTRAINT `user_id_refs_id_8335da6c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `client_id_refs_id_7f3a75eb` FOREIGN KEY (`client_id`) REFERENCES `tcc_userprofile` (`id`);

--
-- Constraints for table `tcc_clienteditjob`
--
ALTER TABLE `tcc_clienteditjob`
  ADD CONSTRAINT `job_id_refs_id_eea896a0` FOREIGN KEY (`job_id`) REFERENCES `tcc_editjob` (`id`),
  ADD CONSTRAINT `material_id_refs_id_cac842a5` FOREIGN KEY (`material_id`) REFERENCES `tcc_material` (`id`);

--
-- Constraints for table `tcc_clienteditjob_test`
--
ALTER TABLE `tcc_clienteditjob_test`
  ADD CONSTRAINT `clienteditjob_id_refs_id_8826c265` FOREIGN KEY (`clienteditjob_id`) REFERENCES `tcc_clienteditjob` (`id`),
  ADD CONSTRAINT `test_id_refs_id_92a6bad2` FOREIGN KEY (`test_id`) REFERENCES `tcc_test` (`id`);

--
-- Constraints for table `tcc_clientjob`
--
ALTER TABLE `tcc_clientjob`
  ADD CONSTRAINT `material_id_refs_id_d47d0f5b` FOREIGN KEY (`material_id`) REFERENCES `tcc_material` (`id`),
  ADD CONSTRAINT `job_id_refs_id_cf851ff0` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`);

--
-- Constraints for table `tcc_clientjob_test`
--
ALTER TABLE `tcc_clientjob_test`
  ADD CONSTRAINT `clientjob_id_refs_id_8691d49b` FOREIGN KEY (`clientjob_id`) REFERENCES `tcc_clientjob` (`id`),
  ADD CONSTRAINT `test_id_refs_id_fbfdbbd2` FOREIGN KEY (`test_id`) REFERENCES `tcc_test` (`id`);

--
-- Constraints for table `tcc_department`
--
ALTER TABLE `tcc_department`
  ADD CONSTRAINT `organisation_id_refs_id_52a18e23` FOREIGN KEY (`organisation_id`) REFERENCES `tcc_organisation` (`id`);

--
-- Constraints for table `tcc_editclientadd`
--
ALTER TABLE `tcc_editclientadd`
  ADD CONSTRAINT `user_id_refs_id_277f0ac4` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `client_id_refs_id_fd489edd` FOREIGN KEY (`client_id`) REFERENCES `tcc_userprofile` (`id`);

--
-- Constraints for table `tcc_editjob`
--
ALTER TABLE `tcc_editjob`
  ADD CONSTRAINT `client_id_refs_id_475d7782` FOREIGN KEY (`client_id`) REFERENCES `tcc_editclientadd` (`id`),
  ADD CONSTRAINT `report_type_id_refs_id_715128a7` FOREIGN KEY (`report_type_id`) REFERENCES `tcc_report` (`id`),
  ADD CONSTRAINT `type_of_work_id_refs_id_3ff866ab` FOREIGN KEY (`type_of_work_id`) REFERENCES `tcc_govt` (`id`);

--
-- Constraints for table `tcc_job`
--
ALTER TABLE `tcc_job`
  ADD CONSTRAINT `report_type_id_refs_id_bd662a09` FOREIGN KEY (`report_type_id`) REFERENCES `tcc_report` (`id`),
  ADD CONSTRAINT `client_id_refs_id_fd23af76` FOREIGN KEY (`client_id`) REFERENCES `tcc_clientadd` (`id`),
  ADD CONSTRAINT `type_of_work_id_refs_id_4da5e95b` FOREIGN KEY (`type_of_work_id`) REFERENCES `tcc_govt` (`id`);

--
-- Constraints for table `tcc_material`
--
ALTER TABLE `tcc_material`
  ADD CONSTRAINT `lab_id_refs_id_57b853fe` FOREIGN KEY (`lab_id`) REFERENCES `tcc_lab` (`id`),
  ADD CONSTRAINT `report_id_refs_id_378be35e` FOREIGN KEY (`report_id`) REFERENCES `tcc_report` (`id`);

--
-- Constraints for table `tcc_staff`
--
ALTER TABLE `tcc_staff`
  ADD CONSTRAINT `department_id_refs_id_6f4e591c` FOREIGN KEY (`department_id`) REFERENCES `tcc_department` (`id`),
  ADD CONSTRAINT `lab_id_refs_id_67a3244` FOREIGN KEY (`lab_id`) REFERENCES `tcc_lab` (`id`);

--
-- Constraints for table `tcc_suspence`
--
ALTER TABLE `tcc_suspence`
  ADD CONSTRAINT `sus_id_refs_id_4acb203f` FOREIGN KEY (`sus_id`) REFERENCES `tcc_suspencejob` (`id`),
  ADD CONSTRAINT `job_id_refs_id_25fd0307` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`);

--
-- Constraints for table `tcc_suspenceeditjob`
--
ALTER TABLE `tcc_suspenceeditjob`
  ADD CONSTRAINT `test_id_refs_id_84316b4f` FOREIGN KEY (`test_id`) REFERENCES `tcc_test` (`id`),
  ADD CONSTRAINT `field_id_refs_id_8efd9e88` FOREIGN KEY (`field_id`) REFERENCES `tcc_material` (`id`),
  ADD CONSTRAINT `job_id_refs_id_7e90c6bd` FOREIGN KEY (`job_id`) REFERENCES `tcc_editjob` (`id`);

--
-- Constraints for table `tcc_suspencejob`
--
ALTER TABLE `tcc_suspencejob`
  ADD CONSTRAINT `test_id_refs_id_faa2f6f` FOREIGN KEY (`test_id`) REFERENCES `tcc_test` (`id`),
  ADD CONSTRAINT `field_id_refs_id_f9dd1268` FOREIGN KEY (`field_id`) REFERENCES `tcc_material` (`id`),
  ADD CONSTRAINT `job_id_refs_id_cafb41b3` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`);

--
-- Constraints for table `tcc_tada`
--
ALTER TABLE `tcc_tada`
  ADD CONSTRAINT `job_id_refs_id_67cf5ad5` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`);

--
-- Constraints for table `tcc_test`
--
ALTER TABLE `tcc_test`
  ADD CONSTRAINT `material_id_refs_id_138a3cc4` FOREIGN KEY (`material_id`) REFERENCES `tcc_material` (`id`);

--
-- Constraints for table `tcc_testtotal`
--
ALTER TABLE `tcc_testtotal`
  ADD CONSTRAINT `job_id_refs_id_4aaa37b8` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`);

--
-- Constraints for table `tcc_testtotalperf`
--
ALTER TABLE `tcc_testtotalperf`
  ADD CONSTRAINT `job_id_refs_id_56adbb8d` FOREIGN KEY (`job_id`) REFERENCES `tcc_editjob` (`id`);

--
-- Constraints for table `tcc_transport`
--
ALTER TABLE `tcc_transport`
  ADD CONSTRAINT `vehicle_id_refs_id_b0f5c5` FOREIGN KEY (`vehicle_id`) REFERENCES `tcc_transportation` (`id`);

--
-- Constraints for table `tcc_userprofile`
--
ALTER TABLE `tcc_userprofile`
  ADD CONSTRAINT `user_id_refs_id_3f595074` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
