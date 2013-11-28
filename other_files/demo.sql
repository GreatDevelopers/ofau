-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 14, 2013 at 08:38 PM
-- Server version: 5.5.32-0ubuntu0.13.04.1
-- PHP Version: 5.4.9-4ubuntu2.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Automationa`
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
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
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
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=226 ;

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
(31, 'Can add soundexsearch', 11, 'add_soundexsearch'),
(32, 'Can change soundexsearch', 11, 'change_soundexsearch'),
(33, 'Can delete soundexsearch', 11, 'delete_soundexsearch'),
(34, 'Can add organisation', 12, 'add_organisation'),
(35, 'Can change organisation', 12, 'change_organisation'),
(36, 'Can delete organisation', 12, 'delete_organisation'),
(37, 'Can add department', 13, 'add_department'),
(38, 'Can change department', 13, 'change_department'),
(39, 'Can delete department', 13, 'delete_department'),
(40, 'Can add distribution', 14, 'add_distribution'),
(41, 'Can change distribution', 14, 'change_distribution'),
(42, 'Can delete distribution', 14, 'delete_distribution'),
(43, 'Can add lab', 15, 'add_lab'),
(44, 'Can change lab', 15, 'change_lab'),
(45, 'Can delete lab', 15, 'delete_lab'),
(46, 'Can add mat comment', 16, 'add_matcomment'),
(47, 'Can change mat comment', 16, 'change_matcomment'),
(48, 'Can delete mat comment', 16, 'delete_matcomment'),
(49, 'Can add material', 17, 'add_material'),
(50, 'Can change material', 17, 'change_material'),
(51, 'Can delete material', 17, 'delete_material'),
(52, 'Can add test', 18, 'add_test'),
(53, 'Can change test', 18, 'change_test'),
(54, 'Can delete test', 18, 'delete_test'),
(55, 'Can add clientadd', 19, 'add_clientadd'),
(56, 'Can change clientadd', 19, 'change_clientadd'),
(57, 'Can delete clientadd', 19, 'delete_clientadd'),
(58, 'Can add edit clientadd', 20, 'add_editclientadd'),
(59, 'Can change edit clientadd', 20, 'change_editclientadd'),
(60, 'Can delete edit clientadd', 20, 'delete_editclientadd'),
(61, 'Can add govt', 21, 'add_govt'),
(62, 'Can change govt', 21, 'change_govt'),
(63, 'Can delete govt', 21, 'delete_govt'),
(64, 'Can add payment', 22, 'add_payment'),
(65, 'Can change payment', 22, 'change_payment'),
(66, 'Can delete payment', 22, 'delete_payment'),
(67, 'Can add job', 23, 'add_job'),
(68, 'Can change job', 23, 'change_job'),
(69, 'Can delete job', 23, 'delete_job'),
(70, 'Can add non payment job', 24, 'add_nonpaymentjob'),
(71, 'Can change non payment job', 24, 'change_nonpaymentjob'),
(72, 'Can delete non payment job', 24, 'delete_nonpaymentjob'),
(73, 'Can add edit job', 25, 'add_editjob'),
(74, 'Can change edit job', 25, 'change_editjob'),
(75, 'Can delete edit job', 25, 'delete_editjob'),
(76, 'Can add client job', 26, 'add_clientjob'),
(77, 'Can change client job', 26, 'change_clientjob'),
(78, 'Can delete client job', 26, 'delete_clientjob'),
(79, 'Can add client edit job', 27, 'add_clienteditjob'),
(80, 'Can change client edit job', 27, 'change_clienteditjob'),
(81, 'Can delete client edit job', 27, 'delete_clienteditjob'),
(82, 'Can add suspence job', 28, 'add_suspencejob'),
(83, 'Can change suspence job', 28, 'change_suspencejob'),
(84, 'Can delete suspence job', 28, 'delete_suspencejob'),
(85, 'Can add suspence edit job', 29, 'add_suspenceeditjob'),
(86, 'Can change suspence edit job', 29, 'change_suspenceeditjob'),
(87, 'Can delete suspence edit job', 29, 'delete_suspenceeditjob'),
(88, 'Can add test total', 30, 'add_testtotal'),
(89, 'Can change test total', 30, 'change_testtotal'),
(90, 'Can delete test total', 30, 'delete_testtotal'),
(91, 'Can add test total perf', 31, 'add_testtotalperf'),
(92, 'Can change test total perf', 31, 'change_testtotalperf'),
(93, 'Can delete test total perf', 31, 'delete_testtotalperf'),
(94, 'Can add bill', 32, 'add_bill'),
(95, 'Can change bill', 32, 'change_bill'),
(96, 'Can delete bill', 32, 'delete_bill'),
(97, 'Can add bill perf', 33, 'add_billperf'),
(98, 'Can change bill perf', 33, 'change_billperf'),
(99, 'Can delete bill perf', 33, 'delete_billperf'),
(100, 'Can add amount', 34, 'add_amount'),
(101, 'Can change amount', 34, 'change_amount'),
(102, 'Can delete amount', 34, 'delete_amount'),
(103, 'Can add cdf amount', 35, 'add_cdfamount'),
(104, 'Can change cdf amount', 35, 'change_cdfamount'),
(105, 'Can delete cdf amount', 35, 'delete_cdfamount'),
(106, 'Can add distance', 36, 'add_distance'),
(107, 'Can change distance', 36, 'change_distance'),
(108, 'Can delete distance', 36, 'delete_distance'),
(109, 'Can add distanceperf', 37, 'add_distanceperf'),
(110, 'Can change distanceperf', 37, 'change_distanceperf'),
(111, 'Can delete distanceperf', 37, 'delete_distanceperf'),
(112, 'Can add suspence', 38, 'add_suspence'),
(113, 'Can change suspence', 38, 'change_suspence'),
(114, 'Can delete suspence', 38, 'delete_suspence'),
(115, 'Can add staff', 39, 'add_staff'),
(116, 'Can change staff', 39, 'change_staff'),
(117, 'Can delete staff', 39, 'delete_staff'),
(118, 'Can add profroma tax', 40, 'add_profromatax'),
(119, 'Can change profroma tax', 40, 'change_profromatax'),
(120, 'Can delete profroma tax', 40, 'delete_profromatax'),
(121, 'Can add ta da', 41, 'add_tada'),
(122, 'Can change ta da', 41, 'change_tada'),
(123, 'Can delete ta da', 41, 'delete_tada'),
(124, 'Can add transportation', 42, 'add_transportation'),
(125, 'Can change transportation', 42, 'change_transportation'),
(126, 'Can delete transportation', 42, 'delete_transportation'),
(127, 'Can add transport', 43, 'add_transport'),
(128, 'Can change transport', 43, 'change_transport'),
(129, 'Can delete transport', 43, 'delete_transport'),
(130, 'Can add bankdetails', 44, 'add_bankdetails'),
(131, 'Can change bankdetails', 44, 'change_bankdetails'),
(132, 'Can delete bankdetails', 44, 'delete_bankdetails'),
(139, 'Can add search', 47, 'add_search'),
(140, 'Can change search', 47, 'change_search'),
(141, 'Can delete search', 47, 'delete_search'),
(142, 'Can add report', 48, 'add_report'),
(143, 'Can change report', 48, 'change_report'),
(144, 'Can delete report', 48, 'delete_report'),
(145, 'Can add cube', 49, 'add_cube'),
(146, 'Can change cube', 49, 'change_cube'),
(147, 'Can delete cube', 49, 'delete_cube'),
(148, 'Can add chem_analysis', 50, 'add_chem_analysis'),
(149, 'Can change chem_analysis', 50, 'change_chem_analysis'),
(150, 'Can delete chem_analysis', 50, 'delete_chem_analysis'),
(151, 'Can add steel', 51, 'add_steel'),
(152, 'Can change steel', 51, 'change_steel'),
(153, 'Can delete steel', 51, 'delete_steel'),
(154, 'Can add m s_steel_plate', 52, 'add_ms_steel_plate'),
(155, 'Can change m s_steel_plate', 52, 'change_ms_steel_plate'),
(156, 'Can delete m s_steel_plate', 52, 'delete_ms_steel_plate'),
(157, 'Can add m s_1786_fe_415', 53, 'add_ms_1786_fe_415'),
(158, 'Can change m s_1786_fe_415', 53, 'change_ms_1786_fe_415'),
(159, 'Can delete m s_1786_fe_415', 53, 'delete_ms_1786_fe_415'),
(160, 'Can add m s_1786_fe_500', 54, 'add_ms_1786_fe_500'),
(161, 'Can change m s_1786_fe_500', 54, 'change_ms_1786_fe_500'),
(162, 'Can delete m s_1786_fe_500', 54, 'delete_ms_1786_fe_500'),
(163, 'Can add i s_432_m s_grade_1_a_20mm_dia', 55, 'add_is_432_ms_grade_1_a_20mm_dia'),
(164, 'Can change i s_432_m s_grade_1_a_20mm_dia', 55, 'change_is_432_ms_grade_1_a_20mm_dia'),
(165, 'Can delete i s_432_m s_grade_1_a_20mm_dia', 55, 'delete_is_432_ms_grade_1_a_20mm_dia'),
(166, 'Can add i s_2062_2006', 56, 'add_is_2062_2006'),
(167, 'Can change i s_2062_2006', 56, 'change_is_2062_2006'),
(168, 'Can delete i s_2062_2006', 56, 'delete_is_2062_2006'),
(169, 'Can add ground_ water', 57, 'add_ground_water'),
(170, 'Can change ground_ water', 57, 'change_ground_water'),
(171, 'Can delete ground_ water', 57, 'delete_ground_water'),
(172, 'Can add concrete_ paver', 58, 'add_concrete_paver'),
(173, 'Can change concrete_ paver', 58, 'change_concrete_paver'),
(174, 'Can delete concrete_ paver', 58, 'delete_concrete_paver'),
(175, 'Can add interlock_ tiles', 59, 'add_interlock_tiles'),
(176, 'Can change interlock_ tiles', 59, 'change_interlock_tiles'),
(177, 'Can delete interlock_ tiles', 59, 'delete_interlock_tiles'),
(178, 'Can add pc', 60, 'add_pc'),
(179, 'Can change pc', 60, 'change_pc'),
(180, 'Can delete pc', 60, 'delete_pc'),
(181, 'Can add rebound_ hammer_ testing', 61, 'add_rebound_hammer_testing'),
(182, 'Can change rebound_ hammer_ testing', 61, 'change_rebound_hammer_testing'),
(183, 'Can delete rebound_ hammer_ testing', 61, 'delete_rebound_hammer_testing'),
(184, 'Can add brick', 62, 'add_brick'),
(185, 'Can change brick', 62, 'change_brick'),
(186, 'Can delete brick', 62, 'delete_brick'),
(187, 'Can add water', 63, 'add_water'),
(188, 'Can change water', 63, 'change_water'),
(189, 'Can delete water', 63, 'delete_water'),
(190, 'Can add soil_ ohsr', 64, 'add_soil_ohsr'),
(191, 'Can change soil_ ohsr', 64, 'change_soil_ohsr'),
(192, 'Can delete soil_ ohsr', 64, 'delete_soil_ohsr'),
(193, 'Can add soil_ building', 65, 'add_soil_building'),
(194, 'Can change soil_ building', 65, 'change_soil_building'),
(195, 'Can delete soil_ building', 65, 'delete_soil_building'),
(196, 'Can add admixture', 66, 'add_admixture'),
(197, 'Can change admixture', 66, 'change_admixture'),
(198, 'Can delete admixture', 66, 'delete_admixture'),
(199, 'Can add cement_ppc', 67, 'add_cement_ppc'),
(200, 'Can change cement_ppc', 67, 'change_cement_ppc'),
(201, 'Can delete cement_ppc', 67, 'delete_cement_ppc'),
(202, 'Can add cement_op c_33', 68, 'add_cement_opc_33'),
(203, 'Can change cement_op c_33', 68, 'change_cement_opc_33'),
(204, 'Can delete cement_op c_33', 68, 'delete_cement_opc_33'),
(205, 'Can add cement_op c_43', 69, 'add_cement_opc_43'),
(206, 'Can change cement_op c_43', 69, 'change_cement_opc_43'),
(207, 'Can delete cement_op c_43', 69, 'delete_cement_opc_43'),
(208, 'Can add cement_op c_53', 70, 'add_cement_opc_53'),
(209, 'Can change cement_op c_53', 70, 'change_cement_opc_53'),
(210, 'Can delete cement_op c_53', 70, 'delete_cement_opc_53'),
(211, 'Can add soil_ sample', 71, 'add_soil_sample'),
(212, 'Can change soil_ sample', 71, 'change_soil_sample'),
(213, 'Can delete soil_ sample', 71, 'delete_soil_sample'),
(214, 'Can add drinking_water', 72, 'add_drinking_water'),
(215, 'Can change drinking_water', 72, 'change_drinking_water'),
(216, 'Can delete drinking_water', 72, 'delete_drinking_water'),
(217, 'Can add tag', 73, 'add_tag'),
(218, 'Can change tag', 73, 'change_tag'),
(219, 'Can delete tag', 73, 'delete_tag'),
(220, 'Can add tagged item', 74, 'add_taggeditem'),
(221, 'Can change tagged item', 74, 'change_taggeditem'),
(222, 'Can delete tagged item', 74, 'delete_taggeditem'),
(223, 'Can add sel staff', 75, 'add_selstaff'),
(224, 'Can change sel staff', 75, 'change_selstaff'),
(225, 'Can delete sel staff', 75, 'delete_selstaff');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'jass', '', '', 'jassigrewal91@gmail.com', 'pbkdf2_sha256$10000$SWOQDn42Up2s$LjERHrj/maA0fj/NLqtpho1gS1/O1OgfJjyDQ/E/3cc=', 1, 1, 1, '2013-08-14 20:36:02', '2013-08-12 19:05:52');

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
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
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
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
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
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

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
(11, 'soundexsearch', 'tcc', 'soundexsearch'),
(12, 'organisation', 'tcc', 'organisation'),
(13, 'department', 'tcc', 'department'),
(14, 'distribution', 'tcc', 'distribution'),
(15, 'lab', 'tcc', 'lab'),
(16, 'mat comment', 'tcc', 'matcomment'),
(17, 'material', 'tcc', 'material'),
(18, 'test', 'tcc', 'test'),
(19, 'clientadd', 'tcc', 'clientadd'),
(20, 'edit clientadd', 'tcc', 'editclientadd'),
(21, 'govt', 'tcc', 'govt'),
(22, 'payment', 'tcc', 'payment'),
(23, 'job', 'tcc', 'job'),
(24, 'non payment job', 'tcc', 'nonpaymentjob'),
(25, 'edit job', 'tcc', 'editjob'),
(26, 'client job', 'tcc', 'clientjob'),
(27, 'client edit job', 'tcc', 'clienteditjob'),
(28, 'suspence job', 'tcc', 'suspencejob'),
(29, 'suspence edit job', 'tcc', 'suspenceeditjob'),
(30, 'test total', 'tcc', 'testtotal'),
(31, 'test total perf', 'tcc', 'testtotalperf'),
(32, 'bill', 'tcc', 'bill'),
(33, 'bill perf', 'tcc', 'billperf'),
(34, 'amount', 'tcc', 'amount'),
(35, 'cdf amount', 'tcc', 'cdfamount'),
(36, 'distance', 'tcc', 'distance'),
(37, 'distanceperf', 'tcc', 'distanceperf'),
(38, 'suspence', 'tcc', 'suspence'),
(39, 'staff', 'tcc', 'staff'),
(40, 'profroma tax', 'tcc', 'profromatax'),
(41, 'ta da', 'tcc', 'tada'),
(42, 'transportation', 'tcc', 'transportation'),
(43, 'transport', 'tcc', 'transport'),
(44, 'bankdetails', 'tcc', 'bankdetails'),
(47, 'search', 'report', 'search'),
(48, 'report', 'report', 'report'),
(49, 'cube', 'report', 'cube'),
(50, 'chem_analysis', 'report', 'chem_analysis'),
(51, 'steel', 'report', 'steel'),
(52, 'm s_steel_plate', 'report', 'ms_steel_plate'),
(53, 'm s_1786_fe_415', 'report', 'ms_1786_fe_415'),
(54, 'm s_1786_fe_500', 'report', 'ms_1786_fe_500'),
(55, 'i s_432_m s_grade_1_a_20mm_dia', 'report', 'is_432_ms_grade_1_a_20mm_dia'),
(56, 'i s_2062_2006', 'report', 'is_2062_2006'),
(57, 'ground_ water', 'report', 'ground_water'),
(58, 'concrete_ paver', 'report', 'concrete_paver'),
(59, 'interlock_ tiles', 'report', 'interlock_tiles'),
(60, 'pc', 'report', 'pc'),
(61, 'rebound_ hammer_ testing', 'report', 'rebound_hammer_testing'),
(62, 'brick', 'report', 'brick'),
(63, 'water', 'report', 'water'),
(64, 'soil_ ohsr', 'report', 'soil_ohsr'),
(65, 'soil_ building', 'report', 'soil_building'),
(66, 'admixture', 'report', 'admixture'),
(67, 'cement_ppc', 'report', 'cement_ppc'),
(68, 'cement_op c_33', 'report', 'cement_opc_33'),
(69, 'cement_op c_43', 'report', 'cement_opc_43'),
(70, 'cement_op c_53', 'report', 'cement_opc_53'),
(71, 'soil_ sample', 'report', 'soil_sample'),
(72, 'drinking_water', 'report', 'drinking_water'),
(73, 'tag', 'tagging', 'tag'),
(74, 'tagged item', 'tagging', 'taggeditem'),
(75, 'sel staff', 'tcc', 'selstaff');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('373125abfc846d10620da3af2d7bcb82', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-08-28 20:36:02'),
('b6a4c70c37ff9d564f33cad8c99fc493', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-08-26 19:08:36'),
('b952e16f839445d795df56c18707296e', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-08-26 19:06:15'),
('bca8acc488c5d40d7a611c1558a276ae', 'OGEwM2FlMTdmZWEwZDdhODBlN2JlYjVmNDgyNzMzNzliNzIwMTk1ODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n', '2013-08-26 19:06:51');

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
(1, 'example.com', 'example.com');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_admixture`
--

CREATE TABLE IF NOT EXISTS `report_admixture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Physical_state` varchar(100) NOT NULL,
  `Specific_Gravity` varchar(100) NOT NULL,
  `PH_Value` varchar(100) NOT NULL,
  `Dry_Material_Content` varchar(100) NOT NULL,
  `Ash_Content` varchar(100) NOT NULL,
  `Chloride_Content` varchar(100) NOT NULL,
  `Control_Mix` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_admixture_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_brick`
--

CREATE TABLE IF NOT EXISTS `report_brick` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Comp_Strength` varchar(255) NOT NULL,
  `Water_Absorption` varchar(255) NOT NULL,
  `Efflorescence` varchar(255) NOT NULL,
  `Dimension_Test` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_brick_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_cement_opc_33`
--

CREATE TABLE IF NOT EXISTS `report_cement_opc_33` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Initial_Time` varchar(100) NOT NULL,
  `Final_Time` varchar(100) NOT NULL,
  `Fineness` varchar(100) NOT NULL,
  `Unaerated_Cement_Le` varchar(100) NOT NULL,
  `After_7_Days_Areation_Le` varchar(100) NOT NULL,
  `Consistency` varchar(100) NOT NULL,
  `Hours_72` varchar(100) NOT NULL,
  `Hours_168` varchar(100) NOT NULL,
  `Hours_672` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_cement_opc_33_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_cement_opc_43`
--

CREATE TABLE IF NOT EXISTS `report_cement_opc_43` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Initial_Time` varchar(100) NOT NULL,
  `Final_Time` varchar(100) NOT NULL,
  `Fineness` varchar(100) NOT NULL,
  `Unaerated_Cement_Le` varchar(100) NOT NULL,
  `After_7_Days_Areation_Le` varchar(100) NOT NULL,
  `Consistency` varchar(100) NOT NULL,
  `Hours_72` varchar(100) NOT NULL,
  `Hours_168` varchar(100) NOT NULL,
  `Hours_672` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_cement_opc_43_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_cement_opc_53`
--

CREATE TABLE IF NOT EXISTS `report_cement_opc_53` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Initial_Time` varchar(100) NOT NULL,
  `Final_Time` varchar(100) NOT NULL,
  `Fineness` varchar(100) NOT NULL,
  `Unaerated_Cement_Le` varchar(100) NOT NULL,
  `After_7_Days_Areation_Le` varchar(100) NOT NULL,
  `Consistency` varchar(100) NOT NULL,
  `Hours_72` varchar(100) NOT NULL,
  `Hours_168` varchar(100) NOT NULL,
  `Hours_672` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_cement_opc_53_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_cement_ppc`
--

CREATE TABLE IF NOT EXISTS `report_cement_ppc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Initial_Time` varchar(100) NOT NULL,
  `Final_Time` varchar(100) NOT NULL,
  `Fineness` varchar(100) NOT NULL,
  `Unaerated_Cement_Le` varchar(100) NOT NULL,
  `After_7_Days_Areation_Le` varchar(100) NOT NULL,
  `Consistency` varchar(100) NOT NULL,
  `Hours_72` varchar(100) NOT NULL,
  `Hours_168` varchar(100) NOT NULL,
  `Hours_672` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_cement_ppc_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_chem_analysis`
--

CREATE TABLE IF NOT EXISTS `report_chem_analysis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_chem_analysis_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_concrete_paver`
--

CREATE TABLE IF NOT EXISTS `report_concrete_paver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Thickness` varchar(255) NOT NULL,
  `Comp_Strength_MPa` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_concrete_paver_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_cube`
--

CREATE TABLE IF NOT EXISTS `report_cube` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Description` varchar(150) NOT NULL,
  `Breaking_load` varchar(150) NOT NULL,
  `Mix` varchar(255) NOT NULL,
  `Comp_strength` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_cube_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_drinking_water`
--

CREATE TABLE IF NOT EXISTS `report_drinking_water` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Color_Hazen_Units` varchar(100) NOT NULL,
  `pH` varchar(100) NOT NULL,
  `Turbidity` varchar(100) NOT NULL,
  `TDS` varchar(100) NOT NULL,
  `Total_hardness` varchar(100) NOT NULL,
  `Calcium` varchar(100) NOT NULL,
  `Magnesium` varchar(100) NOT NULL,
  `Chlorides` varchar(100) NOT NULL,
  `Odour` varchar(100) NOT NULL,
  `Iron` varchar(100) NOT NULL,
  `Sulphates` varchar(100) NOT NULL,
  `Nitrates` varchar(100) NOT NULL,
  `Arsenic` varchar(100) NOT NULL,
  `Flurides` varchar(100) NOT NULL,
  `Total_Califorms` varchar(100) NOT NULL,
  `E_Coli` varchar(100) NOT NULL,
  `Alkalinity` varchar(100) NOT NULL,
  `Phenolic_compounds` varchar(100) NOT NULL,
  `Copper` varchar(100) NOT NULL,
  `Cadmium` varchar(100) NOT NULL,
  `Lead` varchar(100) NOT NULL,
  `Zinc` varchar(100) NOT NULL,
  `Mercury` varchar(100) NOT NULL,
  `Chromium` varchar(100) NOT NULL,
  `Aluminium` varchar(100) NOT NULL,
  `Boron` varchar(100) NOT NULL,
  `Cyanide` varchar(100) NOT NULL,
  `Manganese` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_drinking_water_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_ground_water`
--

CREATE TABLE IF NOT EXISTS `report_ground_water` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Result_1` varchar(255) NOT NULL,
  `Result_2` varchar(255) NOT NULL,
  `Result_3` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_ground_water_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_interlock_tiles`
--

CREATE TABLE IF NOT EXISTS `report_interlock_tiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Thickness` varchar(255) NOT NULL,
  `Comp_Strength_MPa` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_interlock_tiles_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_is_432_ms_grade_1_a_20mm_dia`
--

CREATE TABLE IF NOT EXISTS `report_is_432_ms_grade_1_a_20mm_dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Mech_Prop` varchar(255) NOT NULL,
  `Proof_stress` varchar(255) NOT NULL,
  `Ultimate_tensile_stress` varchar(255) NOT NULL,
  `Elongation` varchar(255) NOT NULL,
  `Bend_Rebend_test` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_is_432_ms_grade_1_a_20mm_dia_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_is_2062_2006`
--

CREATE TABLE IF NOT EXISTS `report_is_2062_2006` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Chemical_test` varchar(255) NOT NULL,
  `Carbon` varchar(255) NOT NULL,
  `Sulphur` varchar(255) NOT NULL,
  `Phosphorous` varchar(255) NOT NULL,
  `Silicon` varchar(255) NOT NULL,
  `Manganese` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_is_2062_2006_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_ms_1786_fe_415`
--

CREATE TABLE IF NOT EXISTS `report_ms_1786_fe_415` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Mech_Prop` varchar(255) NOT NULL,
  `Proof_stress` varchar(255) NOT NULL,
  `Ultimate_tensile_stress` varchar(255) NOT NULL,
  `Elongation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_ms_1786_fe_415_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_ms_1786_fe_500`
--

CREATE TABLE IF NOT EXISTS `report_ms_1786_fe_500` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Mech_Prop` varchar(255) NOT NULL,
  `Proof_stress` varchar(255) NOT NULL,
  `Ultimate_tensile_stress` varchar(255) NOT NULL,
  `Elongation` varchar(255) NOT NULL,
  `Bend_Rebend_test` varchar(255) NOT NULL,
  `Unit_wt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_ms_1786_fe_500_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_ms_steel_plate`
--

CREATE TABLE IF NOT EXISTS `report_ms_steel_plate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Mech_Prop` varchar(255) NOT NULL,
  `Proof_stress` varchar(255) NOT NULL,
  `Ultimate_tensile_stress` varchar(255) NOT NULL,
  `Elongation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_ms_steel_plate_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_pc`
--

CREATE TABLE IF NOT EXISTS `report_pc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Bitumen_Content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_pc_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_rebound_hammer_testing`
--

CREATE TABLE IF NOT EXISTS `report_rebound_hammer_testing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Striking_Angle` varchar(255) NOT NULL,
  `Average_Rebound_No` varchar(255) NOT NULL,
  `Comp_Strength_MPa` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_rebound_hammer_testing_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_report`
--

CREATE TABLE IF NOT EXISTS `report_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `Sample_no` varchar(100) NOT NULL,
  `Header_column_1` varchar(255) NOT NULL,
  `Header_column_2` varchar(255) NOT NULL,
  `Footer_column_3` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_report_751f44ae` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_search`
--

CREATE TABLE IF NOT EXISTS `report_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(10) NOT NULL,
  `report` varchar(10) NOT NULL,
  `material` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_soil_building`
--

CREATE TABLE IF NOT EXISTS `report_soil_building` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Latitude_N` varchar(100) NOT NULL,
  `Longitude_E` varchar(100) NOT NULL,
  `Site_Name` varchar(100) NOT NULL,
  `Submitted_1` varchar(100) NOT NULL,
  `Submitted_2` varchar(100) NOT NULL,
  `Submitted_3` varchar(100) NOT NULL,
  `Date_of_Testing` varchar(100) NOT NULL,
  `Presence_1` varchar(100) NOT NULL,
  `Presence_2` varchar(100) NOT NULL,
  `Type_of_Str` varchar(100) NOT NULL,
  `Wall_Dt` varchar(100) NOT NULL,
  `Wall_B` varchar(100) NOT NULL,
  `Wall_C` varchar(100) NOT NULL,
  `Wall_Phay` varchar(100) NOT NULL,
  `Wall_Phay_Fe` varchar(100) NOT NULL,
  `Wall_Nc` varchar(100) NOT NULL,
  `Wall_Nq` varchar(100) NOT NULL,
  `Wall_Ny` varchar(100) NOT NULL,
  `Wall_Sc` varchar(100) NOT NULL,
  `Wall_Sq` varchar(100) NOT NULL,
  `Wall_Sy` varchar(100) NOT NULL,
  `Wall_dc` varchar(100) NOT NULL,
  `Wall_dq_dy` varchar(100) NOT NULL,
  `Wall_w` varchar(100) NOT NULL,
  `Gama_wall` varchar(100) NOT NULL,
  `Wall_peq` varchar(100) NOT NULL,
  `Wall_Total` varchar(100) NOT NULL,
  `Wall_T_2` varchar(100) NOT NULL,
  `Col_Df` varchar(100) NOT NULL,
  `Col_L` varchar(100) NOT NULL,
  `Col_B` varchar(100) NOT NULL,
  `Col_Sc` varchar(100) NOT NULL,
  `Col_Sq` varchar(100) NOT NULL,
  `Col_Sy` varchar(100) NOT NULL,
  `Col_dc` varchar(100) NOT NULL,
  `Col_dq_dy` varchar(100) NOT NULL,
  `Col_peq` varchar(100) NOT NULL,
  `Col_Total` varchar(100) NOT NULL,
  `Col_T_2` varchar(100) NOT NULL,
  `Dt_1` varchar(100) NOT NULL,
  `Dt_2` varchar(100) NOT NULL,
  `Dt_3` varchar(100) NOT NULL,
  `Dt_4` varchar(100) NOT NULL,
  `Dt_5` varchar(100) NOT NULL,
  `Dt_6` varchar(100) NOT NULL,
  `Dt_7` varchar(100) NOT NULL,
  `Dt_8` varchar(100) NOT NULL,
  `Ob_Pr_1` varchar(100) NOT NULL,
  `Ob_Pr_2` varchar(100) NOT NULL,
  `Ob_Pr_3` varchar(100) NOT NULL,
  `Ob_Pr_4` varchar(100) NOT NULL,
  `Ob_Pr_5` varchar(100) NOT NULL,
  `Ob_Pr_6` varchar(100) NOT NULL,
  `Ob_Pr_7` varchar(100) NOT NULL,
  `Ob_Pr_8` varchar(100) NOT NULL,
  `Corr_F_1` varchar(100) NOT NULL,
  `Corr_F_2` varchar(100) NOT NULL,
  `Corr_F_3` varchar(100) NOT NULL,
  `Corr_F_4` varchar(100) NOT NULL,
  `Corr_F_5` varchar(100) NOT NULL,
  `Corr_F_6` varchar(100) NOT NULL,
  `Corr_F_7` varchar(100) NOT NULL,
  `Corr_F_8` varchar(100) NOT NULL,
  `Ob_N_V1` varchar(100) NOT NULL,
  `Ob_N_V2` varchar(100) NOT NULL,
  `Ob_N_V3` varchar(100) NOT NULL,
  `Ob_N_V4` varchar(100) NOT NULL,
  `Ob_N_V5` varchar(100) NOT NULL,
  `Ob_N_V6` varchar(100) NOT NULL,
  `Ob_N_V7` varchar(100) NOT NULL,
  `Ob_N_V8` varchar(100) NOT NULL,
  `Corr_N_V1` varchar(100) NOT NULL,
  `Corr_N_V2` varchar(100) NOT NULL,
  `Corr_N_V3` varchar(100) NOT NULL,
  `Corr_N_V4` varchar(100) NOT NULL,
  `Corr_N_V5` varchar(100) NOT NULL,
  `Corr_N_V6` varchar(100) NOT NULL,
  `Corr_N_V7` varchar(100) NOT NULL,
  `Corr_N_V8` varchar(100) NOT NULL,
  `Wall_Net_V` varchar(100) NOT NULL,
  `Wall_Value` varchar(100) NOT NULL,
  `Wall_G_V` varchar(100) NOT NULL,
  `Col_Value` varchar(100) NOT NULL,
  `Col_Net_V` varchar(100) NOT NULL,
  `Col_G_V` varchar(100) NOT NULL,
  `Col_N_V` varchar(100) NOT NULL,
  `Wall_N_V` varchar(100) NOT NULL,
  `Water_Table` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_soil_building_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_soil_ohsr`
--

CREATE TABLE IF NOT EXISTS `report_soil_ohsr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Date_of_testing` date NOT NULL,
  `Type_of_str` varchar(255) NOT NULL,
  `Latitude_N` varchar(255) NOT NULL,
  `Longitude_E` varchar(255) NOT NULL,
  `Presence_1` varchar(255) NOT NULL,
  `Presence_2` varchar(255) NOT NULL,
  `Submitted_1` varchar(255) NOT NULL,
  `Submitted_2` varchar(255) NOT NULL,
  `Submitted_3` varchar(255) NOT NULL,
  `Site_name` varchar(255) NOT NULL,
  `Water_table` varchar(255) NOT NULL,
  `Depth_D` varchar(255) NOT NULL,
  `Diameter_B` varchar(255) NOT NULL,
  `Gama_G` varchar(255) NOT NULL,
  `C` varchar(255) NOT NULL,
  `Phay` varchar(255) NOT NULL,
  `Phay_fe` varchar(255) NOT NULL,
  `Nc` varchar(255) NOT NULL,
  `Nq` varchar(255) NOT NULL,
  `Ny` varchar(255) NOT NULL,
  `dc` varchar(255) NOT NULL,
  `dqdy` varchar(255) NOT NULL,
  `Water` varchar(255) NOT NULL,
  `Pulse_Pulse` varchar(255) NOT NULL,
  `Eq_Total` varchar(255) NOT NULL,
  `Total_Dby_2` varchar(255) NOT NULL,
  `Dt_1` varchar(255) NOT NULL,
  `Dt_2` varchar(255) NOT NULL,
  `Dt_3` varchar(255) NOT NULL,
  `Dt_4` varchar(255) NOT NULL,
  `Dt_5` varchar(255) NOT NULL,
  `Dt_6` varchar(255) NOT NULL,
  `Dt_7` varchar(255) NOT NULL,
  `Dt_8` varchar(255) NOT NULL,
  `Ob_Pr_1` varchar(255) NOT NULL,
  `Ob_Pr_2` varchar(255) NOT NULL,
  `Ob_Pr_3` varchar(255) NOT NULL,
  `Ob_Pr_4` varchar(255) NOT NULL,
  `Ob_Pr_5` varchar(255) NOT NULL,
  `Ob_Pr_6` varchar(255) NOT NULL,
  `Ob_Pr_7` varchar(255) NOT NULL,
  `Ob_Pr_8` varchar(255) NOT NULL,
  `Corr_F_1` varchar(255) NOT NULL,
  `Corr_F_2` varchar(255) NOT NULL,
  `Corr_F_3` varchar(255) NOT NULL,
  `Corr_F_4` varchar(255) NOT NULL,
  `Corr_F_5` varchar(255) NOT NULL,
  `Corr_F_6` varchar(255) NOT NULL,
  `Corr_F_7` varchar(255) NOT NULL,
  `Corr_F_8` varchar(255) NOT NULL,
  `Ob_N_V1` varchar(255) NOT NULL,
  `Ob_N_V2` varchar(255) NOT NULL,
  `Ob_N_V3` varchar(255) NOT NULL,
  `Ob_N_V4` varchar(255) NOT NULL,
  `Ob_N_V5` varchar(255) NOT NULL,
  `Ob_N_V6` varchar(255) NOT NULL,
  `Ob_N_V7` varchar(255) NOT NULL,
  `Ob_N_V8` varchar(255) NOT NULL,
  `Corr_N_V1` varchar(255) NOT NULL,
  `Corr_N_V2` varchar(255) NOT NULL,
  `Corr_N_V3` varchar(255) NOT NULL,
  `Corr_N_V4` varchar(255) NOT NULL,
  `Corr_N_V5` varchar(255) NOT NULL,
  `Corr_N_V6` varchar(255) NOT NULL,
  `Corr_N_V7` varchar(255) NOT NULL,
  `Corr_N_V8` varchar(255) NOT NULL,
  `N_Value` varchar(255) NOT NULL,
  `S` varchar(255) NOT NULL,
  `Value` varchar(255) NOT NULL,
  `Net_Value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_soil_ohsr_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_soil_sample`
--

CREATE TABLE IF NOT EXISTS `report_soil_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Max_Dry_Density` varchar(100) NOT NULL,
  `Optimum_Moisture_Content` varchar(100) NOT NULL,
  `Liquid_limit` varchar(100) NOT NULL,
  `Plastic_limit` varchar(100) NOT NULL,
  `Cohesion_Intercept` varchar(100) NOT NULL,
  `Angle_of_Shearing_Resistence` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_soil_sample_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_steel`
--

CREATE TABLE IF NOT EXISTS `report_steel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `Description_of_Test` varchar(255) NOT NULL,
  `Acceptable_limit_as_per` varchar(255) NOT NULL,
  `Result_1` varchar(255) NOT NULL,
  `Result_2` varchar(255) NOT NULL,
  `Result_3` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_steel_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_water`
--

CREATE TABLE IF NOT EXISTS `report_water` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  `Report_id_id` int(11) NOT NULL,
  `PH_Value` varchar(255) NOT NULL,
  `Color` varchar(255) NOT NULL,
  `COD_Total` varchar(255) NOT NULL,
  `COD_Filtered` varchar(255) NOT NULL,
  `BOD5_Total` varchar(255) NOT NULL,
  `BOD5_Filtered` varchar(255) NOT NULL,
  `Sulphide` varchar(255) NOT NULL,
  `Sulphate` varchar(255) NOT NULL,
  `Alkalinity` varchar(255) NOT NULL,
  `Total_Suspended_Solids` varchar(255) NOT NULL,
  `Volatile_Suspended_Solids` varchar(255) NOT NULL,
  `Chloride_as_Cl` varchar(255) NOT NULL,
  `Nickel` varchar(255) NOT NULL,
  `Iron` varchar(255) NOT NULL,
  `Maganese` varchar(255) NOT NULL,
  `Copper` varchar(255) NOT NULL,
  `Hardness` varchar(255) NOT NULL,
  `Nitrates` varchar(255) NOT NULL,
  `Nitrites` varchar(255) NOT NULL,
  `Turbidity` varchar(255) NOT NULL,
  `Faecal_coliform` varchar(255) NOT NULL,
  `TDS` varchar(255) NOT NULL,
  `Taste_and_Odour` varchar(255) NOT NULL,
  `Calcium_and_Ca_Mg_per_l` varchar(255) NOT NULL,
  `Residual_Free_Chloride` varchar(255) NOT NULL,
  `Florides` varchar(255) NOT NULL,
  `Ammonia_Nitrogen` varchar(255) NOT NULL,
  `Total_Phosphorus` varchar(255) NOT NULL,
  `TKN` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_water_a6e5aad9` (`Report_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tagging_tag`
--

CREATE TABLE IF NOT EXISTS `tagging_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `tagging_taggeditem_e4470c6e` (`content_type_id`),
  KEY `tagging_taggeditem_829e37fd` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_amount`
--

INSERT INTO `tcc_amount` (`id`, `job_id`, `college_income`, `admin_charge`, `consultancy_asst`, `development_fund`, `unit_price`, `report_type`) VALUES
(1, 1, 308, 103, 656, 983, 2050, 'General_report'),
(2, 2, 90, 30, 192, 288, 600, 'General_report');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_no` int(11) NOT NULL,
  `education_tax` int(11) DEFAULT NULL,
  `higher_education_tax` int(11) DEFAULT NULL,
  `service_tax` int(11) DEFAULT NULL,
  `net_total` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount_total` int(11) DEFAULT NULL,
  `trans_total` int(11) DEFAULT NULL,
  `trans_net_total` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_bill`
--

INSERT INTO `tcc_bill` (`id`, `job_no`, `education_tax`, `higher_education_tax`, `service_tax`, `net_total`, `price`, `discount_total`, `trans_total`, `trans_net_total`, `balance`) VALUES
(1, 1, 5, 2, 246, 2303, 2050, 0, NULL, 2050, 2303),
(2, 2, 1, 1, 72, 674, 600, 0, NULL, 600, 674);

-- --------------------------------------------------------

--
-- Table structure for table `tcc_billperf`
--

CREATE TABLE IF NOT EXISTS `tcc_billperf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_no` int(11) NOT NULL,
  `education_tax` int(11) DEFAULT NULL,
  `higher_education_tax` int(11) DEFAULT NULL,
  `service_tax` int(11) DEFAULT NULL,
  `net_total` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount_total` int(11) DEFAULT NULL,
  `trans_total` int(11) DEFAULT NULL,
  `trans_net_total` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `job_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_clientadd_fbfc09f1` (`user_id`),
  KEY `tcc_clientadd_4a4e8ffb` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_clientadd`
--

INSERT INTO `tcc_clientadd` (`id`, `user_id`, `client_id`, `job_no`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tcc_clienteditjob`
--

CREATE TABLE IF NOT EXISTS `tcc_clienteditjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `other_test` varchar(400) NOT NULL,
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
  `other_test` varchar(400) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_clientjob_751f44ae` (`job_id`),
  KEY `tcc_clientjob_fab9ba43` (`material_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_clientjob`
--

INSERT INTO `tcc_clientjob` (`id`, `job_id`, `material_id`, `other_test`) VALUES
(1, 1, 13, ''),
(2, 2, 3, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tcc_clientjob_test`
--

INSERT INTO `tcc_clientjob_test` (`id`, `clientjob_id`, `test_id`) VALUES
(2, 1, 183),
(1, 1, 187),
(3, 1, 191),
(4, 2, 19),
(5, 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tcc_department`
--

CREATE TABLE IF NOT EXISTS `tcc_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organisation_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `dean` varchar(50) NOT NULL,
  `faxno` varchar(100) NOT NULL,
  `email_1` varchar(75) NOT NULL,
  `email_2` varchar(75) NOT NULL,
  `url` varchar(50) NOT NULL,
  `about` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_department_28b1ef86` (`organisation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tcc_department`
--

INSERT INTO `tcc_department` (`id`, `organisation_id`, `name`, `address`, `phone`, `dean`, `faxno`, `email_1`, `email_2`, `url`, `about`) VALUES
(1, 1, 'TCC', 'GNDEC', '016146723', 'Dr. H.S Rai', '0908434', '', '', '', '');

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
-- Table structure for table `tcc_distanceperf`
--

CREATE TABLE IF NOT EXISTS `tcc_distanceperf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` int(11) NOT NULL,
  `sandy` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_distribution`
--

CREATE TABLE IF NOT EXISTS `tcc_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tcc_distribution`
--

INSERT INTO `tcc_distribution` (`id`, `name`) VALUES
(1, 'Routine'),
(2, 'Institutional'),
(3, 'Individual');

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
  `site` varchar(600) DEFAULT NULL,
  `type_of_work_id` int(11) NOT NULL,
  `report_type_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `letter_no` varchar(200) DEFAULT NULL,
  `letter_date` date DEFAULT NULL,
  `tds` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
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
  `site` varchar(5000) DEFAULT NULL,
  `type_of_work_id` int(11) NOT NULL,
  `report_type_id` int(11) NOT NULL,
  `pay` varchar(600) NOT NULL,
  `check_number` varchar(15) NOT NULL,
  `check_dd_date` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `letter_no` varchar(400) NOT NULL,
  `letter_date` date DEFAULT NULL,
  `tds` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_job_4a4e8ffb` (`client_id`),
  KEY `tcc_job_ca5d2cd8` (`type_of_work_id`),
  KEY `tcc_job_3d4f9c7e` (`report_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_job`
--

INSERT INTO `tcc_job` (`id`, `client_id`, `job_no`, `sample`, `ip`, `site`, `type_of_work_id`, `report_type_id`, `pay`, `check_number`, `check_dd_date`, `date`, `letter_no`, `letter_date`, `tds`, `discount`) VALUES
(1, 1, 1, 1, '127.0.0.1', 'ldh', 1, 1, 'cash', '', '', '2013-08-12', '12', '2013-08-11', 0, 0),
(2, 2, 2, 1, '127.0.0.1', 'ldh', 1, 1, 'cash', '', '', '2013-08-14', '12', '2013-08-14', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcc_lab`
--

CREATE TABLE IF NOT EXISTS `tcc_lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `department_id` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_lab_2ae7390` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_matcomment`
--

CREATE TABLE IF NOT EXISTS `tcc_matcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tcc_matcomment`
--

INSERT INTO `tcc_matcomment` (`id`, `name`) VALUES
(1, 'Testing of'),
(2, ' '),
(3, 'Analysis of'),
(4, 'Preparation of'),
(5, 'Evauation of Rough Cost Estimate prepare by B & R'),
(6, 'Checking of');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_material`
--

CREATE TABLE IF NOT EXISTS `tcc_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NOT NULL,
  `distribution_id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `matcomment_id` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `report_id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_material_4a1410c6` (`lab_id`),
  KEY `tcc_material_29fa1030` (`report_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `tcc_material`
--

INSERT INTO `tcc_material` (`id`, `lab_id`, `distribution_id`, `name`, `matcomment_id`, `tags`, `report_id`, `image`) VALUES
(1, 2, 1, 'Bricks', 1, 'bricks', 1, ''),
(2, 3, 1, 'Fine Aggregate', 1, 'fine aggregates', 1, 'logo/fine.jpeg'),
(3, 2, 1, 'Pavers', 1, 'pavers', 1, 'logo/baka.png'),
(4, 2, 1, 'Cement', 1, 'cement', 1, ''),
(5, 3, 2, 'Soil for BC', 1, 'soil for bc', 2, ''),
(6, 3, 2, 'OHSR', 2, 'ohsr', 2, ''),
(7, 3, 1, 'Coarse Aggregate', 1, 'course aggregate', 1, 'logo/CAggregate.JPG'),
(8, 2, 1, 'Cubes', 1, 'cube', 1, ''),
(9, 2, 1, 'Steel', 1, 'steel', 1, ''),
(10, 2, 3, 'Mix Design', 2, 'mix deign', 1, 'logo/train.png'),
(11, 2, 2, 'Wood', 1, 'wood', 1, ''),
(12, 5, 2, 'Chemical testing', 2, 'chemical test', 1, ''),
(13, 1, 2, 'Sewage Water', 2, 'water', 1, ''),
(14, 6, 2, '2 week training (IT, CSE)', 2, '2 week training (IT, CSE)', 1, ''),
(15, 6, 2, '6 week training (IT, CSE)', 2, '6 week training (IT, CSE)', 1, ''),
(16, 6, 2, '6 months training (IT, CSE)', 2, '6 months training (IT, CSE)', 1, ''),
(17, 8, 2, 'Survey', 2, 'survey material', 2, ''),
(18, 9, 3, 'Structural Design (OHSR)', 2, 'Structural Design (OHSR)', 1, 'logo/Sunset-Ship1.jpg'),
(19, 9, 3, 'Structural Design(Building)', 4, 'Structural Design(Building)', 1, 'logo/ATT33506.jpg'),
(20, 9, 3, 'Structural Design (Treatment Plant)', 2, 'Structural Design (Treatment Plant)', 1, 'logo/failure.jpg'),
(21, 2, 1, 'Tiles', 1, 'Tiles', 1, 'logo/.png'),
(22, 3, 1, 'BM/PC', 1, 'BM/PC', 1, 'logo/SAM_0793.JPG'),
(23, 3, 1, 'BM & PC Mix', 1, 'BM & PC Mix', 1, 'logo/SAM_0793_1.JPG'),
(24, 3, 1, 'Coarse & Fine Aggregates', 1, 'Coarse & Fine Aggregates', 1, 'logo/SAM_0792.JPG'),
(25, 1, 2, 'Water for Construction', 1, 'Water for Construction', 1, 'logo/SAM_0795.JPG'),
(26, 3, 1, 'Soil Samples', 1, 'Soil Samples', 1, 'logo/SAM_0793_2.JPG'),
(27, 3, 1, 'Plastic Limit/Liquid Limit', 0, 'Plastic Limit/Liquid Limit', 1, 'logo/SAM_0795_1.JPG'),
(28, 3, 1, 'Uniformity Coefficient (D60/D10) in Graph as per RDSO', 0, 'Uniformity Coefficient (D60/D10) in Graph as per RDSO', 1, 'logo/SAM_0795_2.JPG'),
(29, 3, 1, 'The Coefficient of Curvature', 0, 'The Coefficient of Curvature', 1, 'logo/SAM_0795_3.JPG'),
(30, 3, 1, 'Blanketing Materials', 1, 'Blanketing Materials', 1, 'logo/SAM_0795_4.JPG'),
(31, 3, 1, 'BM', 1, 'BM', 1, 'logo/SAM_0795_5.JPG'),
(32, 3, 1, 'SDBC', 1, 'SDBC', 1, 'logo/SAM_0795_6.JPG'),
(33, 2, 2, 'Hammer', 0, 'Hammer', 2, 'logo/SAM_0795_7.JPG'),
(34, 2, 1, 'M.S.Plate', 1, 'M.S.Plate', 1, 'logo/SAM_0795_8.JPG'),
(35, 3, 1, 'PC', 1, 'PC', 1, 'logo/SAM_0795_9.JPG'),
(36, 3, 1, 'DBM', 0, 'DBM', 1, 'logo/skunkling-QUOTE.png'),
(37, 3, 1, 'GSB Material', 0, 'GSB Material', 1, 'logo/SAM_0795_10.JPG'),
(38, 1, 2, 'Coarse Aggregates & Fine Aggregates (Delterious Material)', 0, 'Coarse Aggregates & Fine Aggregates (Delterious Material)', 1, 'logo/1.JPG'),
(39, 3, 1, 'Coarse Sand', 0, 'Coarse Sand', 1, 'logo/1_1.JPG'),
(41, 2, 1, 'Laminated Particle Board Grade-I, Type-II', 0, 'Laminated Particle Board Grade-I, Type-I', 1, 'logo/1_3.JPG'),
(42, 1, 2, 'Corase Aggregate (Deleterious Material)', 0, 'Corase Aggregate (Deleterious Material)', 1, 'logo/SAM_0795_11.JPG'),
(43, 1, 2, 'Fine Aggregates (Deleterious Material)', 0, 'Fine Aggregates (Deleterious Material)', 1, 'logo/SAM_0795_12.JPG'),
(44, 9, 3, 'Checking of Revised Drawing', 0, 'Checking of Revised Drawing', 1, 'logo/SAM_0795_13.JPG'),
(45, 10, 2, 'Six Week Training (Electronic Circuit Design using VHDL)', 0, '', 1, 'logo/baka_1.png'),
(46, 11, 2, 'Six Week Training (CAD Modeling & Analysis using Solid Works)', 0, '', 1, 'logo/309712_204869969652754_1702175504_n.jpg'),
(47, 1, 2, 'Water for Construction & Drinking', 1, 'Water for Construction & Drinking', 1, 'logo/SAM_0795_14.JPG'),
(48, 9, 3, 'Structural Design (Bridge)', 0, 'Structural Design (Bridge)', 1, 'logo/SAM_0795_15.JPG'),
(49, 9, 3, 'Estimate ', 0, 'Estimate', 1, 'logo/1_4.JPG'),
(50, 1, 2, 'Soil Sample/s for Chemical tests', 0, 'Soil Sample/s for Chemical tests', 1, 'logo/1_5.JPG'),
(51, 1, 2, 'Raw Water/Treated Sewage Water', 0, 'Raw Water/Treated Sewage Water', 1, 'logo/SAM_0795_16.JPG'),
(52, 1, 2, 'Preparation of status report of Batteries', 0, 'Preparation of status report of Batteries', 2, 'logo/SAM_0795_17.JPG'),
(53, 3, 1, 'Soil Sample/s', 0, 'Soil Sample/s', 1, 'logo/1_6.JPG'),
(54, 12, 3, 'Mock Test/Paper Analysis', 0, '', 1, 'logo/309712_204869969652754_1702175504_n_1.jpg'),
(55, 1, 2, 'Water sample/s  for Construction Purpose', 3, 'Water for Construction Purpose', 1, 'logo/1_7.JPG'),
(56, 1, 2, 'Water sample/s for Drinking  Purpose', 3, 'Water sample/s for Drinking  Purpose', 1, 'logo/1_8.JPG'),
(57, 1, 2, 'Complete Drinking Water Analysis', 3, 'Complete Drinking Water Analysis', 1, 'logo/SAM_0795_18.JPG'),
(58, 2, 1, 'Kerb Stone', 1, 'Kerb Stone', 1, 'logo/SAM_0795_19.JPG'),
(59, 2, 1, 'Angle', 1, 'Angle', 1, 'logo/SAM_0795_20.JPG'),
(61, 3, 1, 'SAND', 2, '', 1, ''),
(62, 3, 3, 'Job Mix Formula', 2, '', 1, ''),
(63, 2, 1, 'Steel Chemical', 2, '', 1, ''),
(64, 2, 1, 'Stainless Steel - 304', 2, '', 1, ''),
(65, 2, 1, 'Concrete Pavers/ Concrete Beam', 2, '', 1, ''),
(66, 2, 3, 'Non destructive ', 2, '', 1, ''),
(67, 2, 3, 'Ultrasonic ', 2, '', 1, ''),
(68, 2, 3, 'Admixture', 2, '', 1, ''),
(69, 3, 1, 'Bitumen', 1, 'Bitumen', 1, 'logo/1_9.JPG'),
(70, 3, 2, 'Benkelman Beam Deflection Test', 1, 'Benkelman Beam Deflection Test', 2, 'logo/SAM_0795_21.JPG'),
(71, 1, 2, 'Water & Sewage Samples Testing', 2, '', 1, ''),
(72, 2, 1, 'MS Rod', 1, 'MS Rod', 1, 'logo/SAM_0795_22.JPG'),
(73, 3, 1, 'Bitumenons Concrete', 1, 'Bitumenons Concrete', 1, 'logo/SAM_0795_23.JPG'),
(74, 9, 3, 'Evauation of Rough Cost Estimate prepare by B & R', 4, 'Evauation of Rough Cost Estimate prepare by B & R', 1, 'logo/1_10.JPG'),
(75, 3, 3, 'Project & Guidance', 2, 'Project & Guidance', 1, 'logo/SAM_0795_24.JPG'),
(76, 9, 3, 'Structural Design (Shed)', 4, 'Strutural Design (Shed)', 1, 'logo/prospectus.pnm'),
(77, 2, 1, 'Hollow Block', 1, 'Hollow Block', 1, 'logo/SAM_0795_25.JPG'),
(78, 3, 3, 'Field Visit', 1, 'Field Visit', 2, 'logo/SAM_0795_26.JPG'),
(79, 9, 3, 'Structural Design Revised', 2, 'Structural Design Revised', 1, 'logo/SAM_0795_27.JPG'),
(80, 9, 3, 'Checking of Structural Design', 6, 'Checking of Structural Design', 1, 'logo/1_11.JPG'),
(81, 9, 3, 'Structural Design', 2, 'Structural Design', 1, 'logo/SAM_0795_28.JPG'),
(82, 3, 1, 'Coarse Sand & Find Sand', 1, 'Coarse Sand & Find Sand', 1, 'logo/SAM_0795_29.JPG'),
(83, 3, 1, 'Red Granite', 1, 'Red Granite', 1, 'logo/SAM_0795_30.JPG'),
(84, 3, 1, 'White Sandstone', 1, 'White Sandstone', 1, 'logo/SAM_0793_3.JPG'),
(85, 14, 2, 'STAD PRO Software', 2, 'STAD PRO Software', 1, 'logo/SAM_0792_1.JPG'),
(86, 9, 3, 'Structural Design', 4, 'Structural Design', 1, 'logo/1_12.JPG'),
(87, 2, 2, 'Core Cutting', 1, 'Core Cutting', 2, 'logo/1_13.JPG'),
(88, 16, 3, 'Training', 2, 'Training', 1, 'logo/SAM_0795_31.JPG'),
(89, 3, 2, 'Plate Load Test', 1, 'Plate Load Test', 2, 'logo/SAM_0795_32.JPG'),
(90, 3, 1, 'Bentonite', 1, '', 1, ''),
(91, 2, 1, 'Ceramic Glazed Tiles', 1, 'Ceramic Glazed Tiles', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_nonpaymentjob`
--

CREATE TABLE IF NOT EXISTS `tcc_nonpaymentjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_no` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `ref_no` varchar(400) NOT NULL,
  `dated` date DEFAULT NULL,
  `site` varchar(5000) DEFAULT NULL,
  `material_type` varchar(500) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_nonpaymentjob_4a4e8ffb` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `status` varchar(5000) NOT NULL,
  `logo_upload` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tcc_organisation`
--

INSERT INTO `tcc_organisation` (`id`, `name`, `address`, `phone`, `director`, `status`, `logo_upload`) VALUES
(1, 'Guru Nanak Dev Engineering College', 'Gill Park, Gill Road, Ludhiana - 141006 ', '0161-2491193, 506450', 'Dr. M.S. Saini', 'Punjab Govt. Aided Status, NBA Accredited ISO-9001-2008 Certified', 'logo/gndeclogo.jpg');

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
-- Table structure for table `tcc_programme`
--

CREATE TABLE IF NOT EXISTS `tcc_programme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_department_name` varchar(50) NOT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `on` date NOT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `at` time NOT NULL,
  `site` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_prog_letter`
--

CREATE TABLE IF NOT EXISTS `tcc_prog_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_report`
--

CREATE TABLE IF NOT EXISTS `tcc_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tcc_report`
--

INSERT INTO `tcc_report` (`id`, `name`) VALUES
(1, 'LAB'),
(2, 'FIELD'),
(3, 'ADVANCE'),
(4, 'CDF');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_selstaff`
--

CREATE TABLE IF NOT EXISTS `tcc_selstaff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_selstaff_staff`
--

CREATE TABLE IF NOT EXISTS `tcc_selstaff_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selstaff_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selstaff_id` (`selstaff_id`,`staff_id`),
  KEY `tcc_selstaff_staff_1c938192` (`selstaff_id`),
  KEY `tcc_selstaff_staff_a2044c77` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcc_soundexsearch`
--

CREATE TABLE IF NOT EXISTS `tcc_soundexsearch` (
  `id_id` int(11) NOT NULL AUTO_INCREMENT,
  `soundex_fname` varchar(100) NOT NULL,
  `soundex_mname` varchar(100) DEFAULT NULL,
  `soundex_lname` varchar(100) DEFAULT NULL,
  `soundex_address` varchar(255) DEFAULT NULL,
  `soundex_company` varchar(255) DEFAULT NULL,
  `soundex_city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_soundexsearch`
--

INSERT INTO `tcc_soundexsearch` (`id_id`, `soundex_fname`, `soundex_mname`, `soundex_lname`, `soundex_address`, `soundex_company`, `soundex_city`) VALUES
(1, 'hjkh', NULL, NULL, NULL, NULL, NULL),
(2, 'J216', 'S520', 'G640', '#235', 'G640', 'L300');

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
  `position` varchar(100) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_staff_2ae7390` (`department_id`),
  KEY `tcc_staff_4a1410c6` (`lab_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `tcc_staff`
--

INSERT INTO `tcc_staff` (`id`, `department_id`, `code`, `name`, `daily_income`, `position`, `lab_id`, `email`) VALUES
(1, 2, 'A', 'Dr. Harpal Singh', 120, 'Proffessor', 9, ''),
(2, 2, 'R', 'Dr. Hardeep Singh Rai', 180, 'Proffessor', 9, 'hsrai@gmail.com'),
(3, 1, 'L', 'DR. J.N. Jha', 160, 'Proffessor', 3, ''),
(4, 1, 'I', 'Prof. Kulbir Singh Gill', 120, 'Assoc.Prof', 3, ''),
(5, 2, 'J', 'Prof. B. S. Walia', 160, 'Proffessor', 8, ''),
(6, 2, 'F', 'Prof. Gurdeepak Singh', 160, 'Assoc. Prof', 3, ''),
(7, 2, 'N', 'Prof. K. S. Bedi', 160, 'Assoc. Prof', 3, ''),
(8, 2, 'H', 'Harjinder Singh', 160, 'Assoc. Prof', 3, ''),
(9, 2, 'K', 'Dr. HarvinderSingh', 120, 'Assoc. Prof.', 9, ''),
(10, 1, 'G', 'Prof.Puneet Pal  Singh', 100, 'Asstt.Prof', 1, ''),
(11, 2, 'O', 'Prof Prashant Garg', 120, 'Asstt. Prof.', 9, ''),
(12, 1, 'D', 'Dr. Jagbir Singh', 120, 'Assoc.Prof', 2, ''),
(14, 2, '1', 'Sh. Balraj Singh', 60, 'Attendant ', 1, ''),
(15, 10, 'I', 'Er. Nirmal Singh grewal', 120, 'HOD', 10, ''),
(16, 10, 'J', 'Er. Narwant Singh grewal', 100, 'Coordinator & Lect.', 10, ''),
(17, 10, '206', 'Er. Harminder Kaur', 100, 'Lect.', 10, ''),
(18, 10, 'L', 'Er. Gurjot Kaur Walia', 10, 'Lect.', 10, ''),
(19, 10, 'M', 'Er. Rohin Gupta', 100, 'Lect.', 10, ''),
(20, 10, '204', 'Er. Navneet Kaur', 100, 'Lect.', 10, ''),
(21, 10, 'Z', 'Ms. Gagandeep Kaur', 80, 'Lab Tech.', 10, ''),
(22, 10, 'P', 'Mr. Jaspal Singh', 80, 'Lab Attendent', 10, ''),
(23, 5, '45', 'Dr. Sehijpal Singh', 120, 'Proffessor', 11, ''),
(24, 5, '62', 'Prof. Balwinder Singh', 100, 'Asstt. Prof.', 11, ''),
(25, 5, '64', 'Dr. Gurinder Singh Brar', 100, 'Asstt. Prof.', 11, ''),
(26, 5, 'T', 'Prof. Arpinder Singh', 100, 'Asstt. Prof.', 11, ''),
(27, 8, 'E', 'Dr. R. P. Singh', 160, 'Proffessor', 12, ''),
(28, 8, '51', 'Dr. D. S. Pathania', 160, 'Proffessor', 12, ''),
(29, 8, '53', 'Prof. Randhir Singh', 120, 'Asstt. Prof.', 12, ''),
(30, 8, '56', 'Prof. Rajbir Kaur', 120, 'Asstt. Prof.', 12, ''),
(31, 8, '57', 'Prof. Sukhminder Singh', 120, 'Asstt. Prof.', 12, ''),
(32, 8, '58', 'Prof. Mandeep Kaur', 120, 'Asstt. Prof.', 12, ''),
(33, 8, '54', 'Prof. Amandeep Kaur', 120, 'Asstt. Prof.', 12, ''),
(34, 8, '55', 'Prof. Gurpreet Kaur', 120, 'Asstt. Prof.', 12, ''),
(35, 8, '203', 'Prof. Jatinder Singh', 120, 'Asstt. Prof.', 12, ''),
(36, 8, 'AD', 'Prof. Harpreet Singh', 120, 'Asstt. Prof.', 12, ''),
(38, 2, 'Q', 'Prof. Amandeep Singh', 120, 'Asstt. Prof.', 14, ''),
(40, 2, '9', 'S. Jasvir Singh', 60, 'Attdt.', 14, ''),
(41, 0, 'C', 'Sh. Yogesh Kumar', 0, 'D/M', 0, ''),
(42, 2, '5', 'Sh. Avtar Singh', 60, 'Lab Attendent', 2, ''),
(44, 1, 'N', 'Prof. Kanwaljit Singh Bedi', 120, 'Assoc.Prof', 2, ''),
(45, 2, 'M', 'Prof. Manpreet Singh', 160, 'Proffessor', 3, ''),
(46, 2, '2', 'S. Baljinder Singh', 60, 'Lab Attendent', 2, ''),
(47, 2, '3', 'S. Amarjit Singh', 60, 'Lab Attendent', 8, ''),
(48, 2, '7', 'S. Jaswant Singh', 60, 'Lab Attendent', 8, ''),
(49, 2, '1', 'S. Balraj Singh', 60, 'Lab Attendent', 1, ''),
(50, 2, '9', 'S. Jasvir Singh', 60, 'Lab Attendent', 14, ''),
(51, 2, '11', 'S. Sukhchain Singh', 60, 'Lab Attendent', 2, ''),
(52, 1, 'Y', 'S. Sukhdeep Singh', 60, 'Lab Attendent', 15, ''),
(53, 2, '12', 'S. Surjeet Singh', 60, 'Lab Attendent', 2, ''),
(54, 1, 'W', 'Sh. Ramtirath', 30, 'Driver', 15, ''),
(56, 1, 'V', 'S. Rajpal Singh', 30, 'B/M', 15, ''),
(57, 2, 'B5', 'S. Balaur Singh', 30, 'B/M', 15, ''),
(58, 8, '8', 'S. Kuldip Singh', 60, 'Lab Attendent', 13, ''),
(59, 2, '6', 'Sh. Nandan Singh', 60, 'Lab Attendent', 3, ''),
(60, 2, 'S', 'Sh. Amarjit Singh', 100, 'Mechanic', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_suspence`
--

CREATE TABLE IF NOT EXISTS `tcc_suspence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `sus_id` int(11) DEFAULT NULL,
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
  `test_id` int(11) DEFAULT NULL,
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
  `test_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_tada`
--

INSERT INTO `tcc_tada` (`id`, `job_id`, `departure_time_up`, `arrival_time_up`, `departure_time_down`, `arrival_time_down`, `tada_amount`, `reach_site`, `test_date`, `end_date`, `testing_staff_code`) VALUES
(1, 17, '00:00:00', '00:00:00', '00:00:00', '00:00:00', NULL, 'Ludhiana', '2013-06-14', '2013-06-16', 'W,V,X'),
(2, 651, '00:00:00', '00:00:00', '00:00:00', '00:00:00', 120, '1', '2013-07-31', '2013-07-31', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_test`
--

CREATE TABLE IF NOT EXISTS `tcc_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(15) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  `tags` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_test_54645bd` (`material_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=247 ;

--
-- Dumping data for table `tcc_test`
--

INSERT INTO `tcc_test` (`id`, `material_id`, `name`, `quantity`, `unit`, `cost`, `tags`) VALUES
(1, 2, 'Sieve Analysis  ', 3, 'kg', 800, 'fine aggregates sieve'),
(2, 2, 'SILT CONTENT', 3, 'kg', 800, 'silt content'),
(3, 2, 'FINENESS MODULUS', 3, 'kg', 800, 'fineness modulus'),
(4, 5, 'depth 0 to10', 6000, 'meter', 0, 'ohsr depth 0 to 10'),
(5, 6, ' 25000 Litre Capacity', 1, 'litre', 6000, '25000litre'),
(6, 6, '50000 Litres Capacity', 1, 'litre', 6000, '75000'),
(7, 6, '75000 Litre Capacity', 1, 'litre', 6000, '75000litre'),
(8, 6, '1.0 Lac Litres Capacity ', 1, 'litre', 8200, '1laclitre'),
(9, 6, '1.5 Lac Litres Capacity ', 1, 'litre', 8200, '1.5laclitre'),
(10, 6, '2.0 Lac Litres Capacity ', 1, 'litre', 8200, '2laclitre'),
(11, 6, '2.5 Lac Litres Capacity ', 1, 'litre', 8200, '2.5laclitre'),
(12, 6, '5.0 Lac Litres Capacity ', 1, 'litre', 10600, '5laclitre'),
(13, 5, 'depth 10 to 20 m', 6000, 'meter', 900, 'ohsr depth 10 to 20'),
(14, 5, 'depth 20 to 30 m', 6000, 'meter', 1200, 'ohsr depth 20 to 30'),
(15, 5, 'depth more than 30 m', 6000, 'meter', 1500, 'ohsr depth more than 30'),
(16, 1, 'Comp. Strength  ', 10, 'Bricks', 400, 'comp. strength'),
(17, 1, 'Water Absorption  ', 10, 'Bricks', 400, 'water absorption'),
(18, 1, 'Effloroscence  ', 10, 'Bricks', 400, 'effloroscence'),
(19, 3, 'Comp. Strength  ', 1, 'C.paver', 300, 'comp. strength for pavers'),
(20, 3, 'Flexural Strength  ', 1, 'C.paver', 300, 'flexural strength for pavers'),
(21, 3, 'Water Absorption  ', 1, 'C.paver', 300, 'water absorption for pavers'),
(22, 4, 'Initial & Final Setting time Comp. Strength (at 7 day’s  curing) , at 28 day’s curing, Soundness, Fineness, Consistency  ', 1, 'Sealed Bag', 2500, 'cement tests'),
(23, 7, 'Sieve Analysis  ', 10, 'kg', 800, 'course sieve analysis'),
(24, 7, 'Abrasion Value  ', 3, 'kg', 800, 'course aggregate abrasion'),
(25, 7, 'Crushing Value/Strength', 3, 'kg', 800, 'course aggregate crushing'),
(26, 7, 'Flakiness Index  ', 3, 'kg', 800, 'course aggregate flakiness'),
(27, 7, 'Impact Value  ', 3, 'kg', 800, 'course aggregate impact'),
(28, 7, 'Specific Gravity  ', 3, 'kg', 800, 'course aggregate specific gravity'),
(29, 7, 'Soundness Tests  ', 5, 'kg', 800, 'coarse aggregate soundness test'),
(30, 7, 'C.B.R. Test  (Soaked)  ', 10, 'kg', 1800, 'coarse aggregate CBR '),
(31, 7, 'C.B.R. Test  (Unsoaked)  ', 10, 'kg', 1800, 'coarse aggregate unsoaked'),
(32, 2, 'Moisture  Content  ', 3, 'kg', 800, 'fines aggregate moisture content'),
(33, 2, 'Liquid Limit &  Plastic Limit  ', 3, 'kg', 800, 'fine aggregate liquid limit'),
(34, 2, 'Bulk Density', 5, 'kg', 800, 'fine aggregate compaction'),
(35, 2, 'Specific Gravity  ', 5, 'kg', 800, 'fine aggregate specific gravity'),
(36, 8, 'Comp. Strength  ', 3, 'Cubes', 500, 'cubes comp. strength'),
(37, 9, 'a) Ultimate Tensile Strength, b) Percentage Elongation, c) Bend test,  d) 0.2 Proof Stress  below 25 mm dia  ', 2, 'feet', 1500, 'steel below 2500 dia'),
(38, 9, 'a) Ultimate Tensile Strength, b) Percentage Elongation, c) Bend test,  d) 0.2 Proof Stress 25 mm & above   ', 2, 'feet', 2500, 'steel above 2500 dia'),
(39, 9, 'Barbed Wire ', 2, 'feet', 2500, 'steel barbed wire'),
(40, 9, 'Hing Tension', 2, 'feet', 2500, 'steel hing tension'),
(41, 9, 'Structural', 2, 'feet', 2500, 'steel structural'),
(42, 9, 'Angle', 2, 'feet', 2500, 'steel angle'),
(43, 9, 'Flats ', 2, 'feet', 2500, 'steel flat'),
(44, 9, 'Tees Channel ', 2, 'feet', 2500, 'steel tees channel'),
(45, 10, 'Mix Design upto M-30', 1, 'Bag', 8000, 'mix design M-30'),
(46, 10, 'Mix Design M-35 & M-40', 2, 'Bag', 10000, 'mix design M-35, M-40'),
(47, 10, 'Mix Design with fly ash', 2, 'Bag', 15000, 'mix design with fly ash'),
(48, 17, 'Plain area ', 1, 'acre', 1000, 'survey for plain area'),
(49, 17, 'Semi-Hilly area ', 1, 'acre', 1500, 'survey semi-hilly area'),
(50, 17, 'Hilly area ', 1, 'acre', 2000, 'survey hilly area'),
(51, 16, '6 months training ', 6, 'months', 6000, '6 months training (IT, CSE)'),
(52, 15, '6 week training ', 6, 'week', 2000, '6 week training (IT, CSE)'),
(53, 22, 'BM', 10, 'Kg', 1500, 'BM'),
(54, 22, 'PC', 10, 'Kg', 1500, 'PC'),
(55, 23, 'Bitumen Content', 10, 'Kg', 1500, 'Bitumen Content'),
(56, 25, 'Water for Construction', 10, 'Litres', 1500, 'Water for Construction'),
(57, 26, 'Lab. MDD & OMC', 15, 'kg', 1800, 'Lab. MDD & OMC'),
(58, 27, 'Plastic Limit/Liquid Limit', 15, 'kg', 800, 'Plastic Limit/Liquid Limit'),
(59, 28, 'Uniformity Coefficient (D60/D10) in Graph as per RDSO', 15, 'Kg', 800, 'Uniformity Coefficient (D60/D10) in Graph as per RDSO'),
(60, 29, 'The Coefficient of Curvature', 15, 'kg', 800, 'The Coefficient of Curvature'),
(61, 30, 'Lab. MDD & OMC', 15, 'Kg', 1800, 'Lab. MDD & OMC'),
(62, 30, 'Plastic Limit/Liquid Limit', 15, 'kg', 800, 'Plastic Limit/Liquid Limit'),
(63, 30, 'Uniformity Coefficient (D60/D10) in Graph as per RDSO', 15, 'Kg', 800, 'Uniformity Coefficient (D60/D10) in Graph as per RDSO'),
(64, 30, 'The Coefficient of Curvature', 15, 'Kg', 800, 'The Coefficient of Curvature'),
(65, 31, 'BM', 15, 'Kg', 1500, 'BM'),
(66, 32, 'SDBC', 15, 'Kg', 1500, 'SDBC'),
(67, 33, ' Hammer 10', 0, 'o', 10000, 'Hammer'),
(68, 34, 'M.S.Plate', 1, 'm', 2500, 'M.S.Plate'),
(69, 35, 'PC', 15, 'Kg', 1500, 'PC'),
(70, 36, 'DBM', 15, 'kg', 1500, 'DBM'),
(71, 26, 'Lab Density', 15, 'Kg', 1800, 'Lab Density'),
(72, 26, 'PI Value', 15, 'Kg', 800, 'PI Value'),
(73, 37, 'CRB Value', 15, 'Kg', 1800, 'CRB Value'),
(74, 37, 'PI Value', 15, 'Kg', 800, 'PI Value'),
(75, 2, 'Flakiness Index', 15, 'Kg', 800, 'Flakiness Index'),
(76, 2, 'Crushing Value', 15, 'Kg', 800, 'Crushing Value'),
(77, 38, 'Coarse Aggregates & Fine Aggregates (Delterious Material)', 15, 'Kg', 1500, 'Coarse Aggregates & Fine Aggregates (Delterious Material)'),
(78, 39, 'F.M', 15, 'Kg', 800, 'F.M'),
(79, 39, 'Silt Content', 15, 'Kg', 800, 'Silt Content'),
(84, 41, 'Moisture Content', 1, 'Pc', 800, 'Moisture Content'),
(85, 41, '24 Hour Water absorption', 1, 'Pc', 800, '24 Hour Water absorption'),
(86, 41, '2 Hour Swelling in Water', 1, 'Pc', 800, '2 Hour Swelling in Water'),
(87, 41, 'Cigarette Burn Resistance', 1, 'Pc', 800, 'Cigarette Burn Resistance'),
(88, 42, 'Deleterious Material', 15, 'Kg', 1500, 'Deleterious Material'),
(89, 43, 'Deleterious Material', 15, 'Kg', 1500, 'Deleterious Material'),
(90, 2, 'Gradation/Determination of Particle size', 15, 'Kg', 800, 'Gradation/Determination of Particle size'),
(91, 44, 'Checking of Revised Drawing', 1, 'drawing', 15000, 'Checking of Revised Drawing'),
(92, 45, 'Six Weeks Training', 1, 'No.', 4450, ''),
(93, 46, 'Six Week Training (CAD Modeling & Analysis using Solid Works)', 1, 'No.', 5340, ''),
(94, 47, 'Water for Construction & Drinking', 15, 'L', 6000, 'Water for Construction & Drinking'),
(95, 48, 'Structural Design (Bridge)', 1, 'Design', 60000, 'Structural Design (Bridge)'),
(96, 48, 'Estimate', 1, 'No.', 30000, 'Estimate'),
(97, 49, 'Estimate', 1, 'No', 30000, 'Estimate'),
(98, 50, 'Total Soluble Solids', 5, 'Kg', 500, 'Total Soluble Solids'),
(99, 50, 'Total Soluble Sulphates', 10, 'Kg', 500, 'Total Soluble Sulphates'),
(100, 45, 'Six Week Training (Electronic Circuit Design using VHDL)', 1, 's', 4450, 'Six Week Training (Electronic Circuit Design using VHDL)'),
(101, 51, 'BOD at 5 days mg/l', 15, 'l', 800, 'BOD at 5 days mg/l'),
(102, 51, 'COD', 15, 'l', 800, 'COD'),
(103, 51, 'TSS', 15, 'l', 550, 'TSS'),
(104, 51, 'PH', 15, 'l', 300, 'PH'),
(105, 51, 'Faecal Coliform MPN/100 ml', 15, 'l', 1000, 'Fecal Colliprns MPN/100 ml'),
(106, 51, 'Ammoricla Nitrager mg/l', 15, 'l', 500, 'Ammoricla Nitrager mg/l'),
(107, 51, 'Total phosphory', 15, 'l', 500, 'Total phosphory'),
(108, 51, 'TKN mg/l', 15, 'l', 700, 'TKN mg/l'),
(109, 52, 'Preparation of status report of Batteries', 15, 'l', 178000, 'Preparation of status report of Batteries'),
(110, 53, 'MDD & OMC', 15, 'Kg', 1800, 'MDD & OMC'),
(111, 53, 'Liquid Limit, Plastic Limit, Plasticity Index', 15, 'kg', 1600, 'Plastic Limit, Plasticity Index'),
(112, 53, 'CBR', 15, 'Kg', 3000, 'Lab CBR'),
(113, 37, 'MDD & OMC', 15, 'Kg', 1800, 'MDD & OMC'),
(114, 37, 'Liquid Limit, Plastic Limit, Plasticity Index', 15, 'Kg', 1600, 'Plastic Limit, Plasticity Index'),
(115, 37, 'CBR', 15, 'Kg', 3000, 'CBR'),
(116, 53, 'Sand Content', 15, 'Kg', 800, 'Sand Content'),
(117, 54, 'Mock Test', 1, 'No.', 445, ''),
(118, 55, 'Water sample/s for Drinking  Purpose', 1, 'Bottle', 1500, 'Water sample/s for Drinking  Purpose'),
(119, 56, 'Water sample/s for Drinking  Purpose', 1, 'Bottle', 4500, 'Water sample/s for Drinking  Purpose'),
(120, 37, 'Atterberg Limits', 10, 'Kg', 800, 'Atterberg Limits'),
(121, 37, 'Sieve analysis/Grading', 15, 'kg', 800, 'Sieve analysis/Grading'),
(122, 57, 'Complete Drinking Water Analysis', 15, 'L', 6000, 'Complete Drinking Water Analysis'),
(123, 9, 'Chemical test', 1, 'm', 2000, 'Chemical test'),
(124, 58, 'Kerb Stone', 1, 'Pc', 600, 'Kerb Stone'),
(125, 59, 'Angle', 2, 'Feet', 2500, 'Angle'),
(126, 53, 'Bulk Density', 15, 'gm', 1800, 'Bulk Density'),
(127, 53, 'C', 15, 'gm', 1500, 'C'),
(128, 53, 'Phay', 15, 'gm', 1500, 'Phay'),
(129, 61, 'Gradation/Sieve Analysis', 3, 'Kg.', 800, ''),
(130, 61, 'Fineness Modules', 3, 'Kg.', 800, ''),
(131, 61, 'Silt Content', 3, 'Kg.', 800, ''),
(132, 61, 'Moisture Content', 3, 'Kg.', 800, ''),
(133, 61, 'Liquid Limit & Plastic Limit', 3, 'Kg.', 800, ''),
(134, 61, 'Specific Gravity', 3, 'Kg.', 800, ''),
(135, 61, 'Bulk Density', 3, 'Kg.', 800, ''),
(136, 61, 'Silt and Clay Content', 3, 'Kg.', 800, ''),
(137, 61, 'Delterious Material', 3, 'Kg.', 1500, ''),
(138, 61, 'CBR Test (Socked)', 3, 'Kg.', 1800, ''),
(139, 61, 'CBR Test (Unsocked)', 3, 'Kg.', 1800, ''),
(140, 22, 'Gradation', 3, 'Kg.', 800, ''),
(141, 22, 'Bitumen (Ductility Value, Softening Point & Total Soluable Solid )', 3, 'Kg.', 5000, ''),
(142, 7, 'Gradation/Sieve Analysis', 3, 'Kg.', 800, ''),
(143, 7, 'Water Absorption', 3, 'Kg.', 800, ''),
(144, 7, 'AIV', 3, 'Kg.', 800, ''),
(145, 7, 'Bulk Density', 3, 'Kg.', 800, ''),
(146, 7, 'Elongation', 3, 'Kg.', 800, ''),
(147, 7, 'Delterious Material', 3, 'Kg.', 1500, ''),
(148, 63, 'Carbon, Sulphur Phospohorus', 2, '"', 2000, ''),
(149, 64, 'Carbon, Sulphur, Phospohorus, Silicon, Manganese, Nickel, Chromium', 2, '"', 3000, ''),
(150, 1, 'a) Comp. Srength, b) Water absorption, c) Effloroscence', 10, 'Bricks', 1200, ''),
(151, 10, 'M-7.5', 1, 'Bag', 8000, ''),
(152, 10, 'M-10', 1, 'Bag', 8000, ''),
(153, 10, 'M-15', 1, 'Bag', 8000, ''),
(154, 10, 'M-20', 1, 'Bag', 8000, ''),
(155, 10, 'M-25', 1, 'Bag', 8000, ''),
(156, 10, 'M-30', 1, 'Bag', 8000, ''),
(157, 10, 'M-35', 2, 'Bags Sand', 10000, ''),
(158, 10, 'M-40', 2, 'Bag Agg.', 10000, ''),
(159, 11, 'Moisture Content, Class Test, Grade and Density', 1, ' ', 1500, ''),
(160, 69, 'Grade of Bitumen, Flash Point, Softing Point, Ductility Test', 15, 'Kg', 5000, 'Grade of Bitumen, Flash Point, Softing Point, Ductility Test'),
(161, 70, 'Benkelman Beam Deflection Test', 1, 'No', 6000, 'Benkelman Beam Deflection Test'),
(162, 10, 'M-7.5 With Fly Ash', 2, 'Bags', 15000, ''),
(163, 10, 'M-10 With Fly Ash', 2, 'Bags', 15000, ''),
(164, 10, 'M-15 With Fly Ash', 2, 'Bags', 15000, ''),
(165, 10, 'M-20 With Fly Ash', 2, 'Bags', 15000, ''),
(166, 10, 'M-25 With Fly Ash', 2, 'Bags', 15000, ''),
(167, 10, 'M-30 With Fly Ash', 2, 'Bags', 15000, ''),
(168, 10, 'M-35 With Fly Ash', 2, 'Bags', 15000, ''),
(169, 10, 'M-40 With Fly Ash', 2, 'Bags', 15000, ''),
(170, 65, 'Comp. Strength', 1, 'C.Paver', 300, ''),
(171, 65, 'Flexural Strength', 1, 'C.Paver', 300, ''),
(172, 65, 'Water Absorption', 1, 'C.Paver', 300, ''),
(173, 65, 'Curve', 1, 'Curve', 500, ''),
(174, 66, 'Testing-Rebound Hammer', 1, ' ', 15000, ''),
(175, 67, 'Concrete Core Cutting / Testing', 1, 'Local', 10000, ''),
(176, 67, 'Concrete Core Cutting / Testing', 1, 'Outside', 15000, ''),
(177, 68, 'Physical State, Specific Gravity, PH Value, Dry Material, Content %, Ash Content, Chloride Content,1.0 %Admixture, Control Mix', 1, ' ', 10000, ''),
(178, 13, 'pH', 10, 'Litres', 300, ''),
(179, 13, 'Color', 10, 'Litres', 300, ''),
(180, 13, 'COD (Total)', 10, 'Litres', 800, ''),
(181, 13, 'COD (Filtered)', 10, 'Litres', 700, ''),
(182, 13, 'BOD5 (Total)', 10, 'Litres', 800, ''),
(183, 13, 'BOD5 (Filtered)', 10, 'Litres', 800, ''),
(184, 13, 'Sulphide ( as S^2-)', 10, 'Litres', 500, ''),
(185, 13, 'Suphate (as SO4^2-)', 10, 'Litres', 500, ''),
(186, 13, 'Alkalinity (as mg Ca CO3/l)', 10, 'Litres', 300, ''),
(187, 13, 'Total Suspended solids (mg/l)', 10, 'Litres', 550, ''),
(188, 13, 'Volatile Suspended Solids (mg/l)', 10, 'Litres', 700, ''),
(189, 13, 'Chlorides (as Cl-)', 10, 'Litres', 350, ''),
(190, 13, 'Nickel', 10, 'Litres', 600, ''),
(191, 13, 'Iron', 10, 'Litres', 700, ''),
(192, 13, 'Magnesium', 10, 'Litres', 500, ''),
(193, 13, 'Copper', 10, 'Litres', 600, ''),
(194, 13, 'Hardness', 10, 'Litres', 500, ''),
(195, 13, 'Nitrates ', 10, 'Litres', 700, ''),
(196, 13, 'Nitrites', 10, 'Litres', 700, ''),
(197, 13, 'Turbity', 10, 'Litres', 300, ''),
(198, 13, 'Faecal coliform ( E.Coli/MPN)', 10, 'Litres', 1000, ''),
(199, 13, 'TDS', 10, 'Litres', 500, ''),
(200, 13, 'Taste & Odour', 10, 'Litres', 100, ''),
(201, 13, 'Calcium, Ca (Mg/l)', 10, 'Litres', 500, ''),
(202, 13, 'Residual Free Chloride (Mg/l)', 10, 'Litres', 500, ''),
(203, 13, 'Flourides', 10, 'Litres', 400, ''),
(204, 13, 'Ammonia Nitrogen in mg/l', 10, 'Litres', 500, ''),
(205, 13, 'Total Phosphorus in mg/l', 10, 'Litres', 500, ''),
(206, 13, 'TKN', 10, 'Litres', 600, ''),
(207, 56, 'Comprehensive Physico-chemical analysis', 1, ' ', 3500, ''),
(208, 56, 'Preliminary physico-chemical analysis', 1, ' ', 1000, ''),
(209, 37, 'Gradation/Sieve Analysis', 10, 'Kg.', 800, 'Gradation/Sieve Analysis'),
(210, 9, 'Diameter-8mm', 1, 'feet', 1500, 'Diameter-8mm'),
(211, 72, 'MS Rod', 40, 'mm', 2500, '40 mm MS Rod'),
(212, 31, 'Bitumen Contents', 15, 'kg', 1500, 'Bitumen Contents'),
(213, 31, 'Gradation', 15, 'kg', 800, 'Gradation'),
(214, 73, 'BC', 1, 'kg', 1500, 'BC'),
(215, 73, 'Gradation of Aggregates', 1, 'kg', 800, 'Gradation of Aggregates'),
(216, 35, 'Bitumen content, Gradation of Aggregates', 1, 'kg', 2300, 'Bitumen content, Gradation of Aggregates'),
(217, 74, 'Evauation of Rough Cost Estimate prepare by B & R', 1, 'No', 10000, 'Evauation of Rough Cost Estimate prepare by B & R'),
(218, 10, 'Mix Conversion Volume to Weight', 1, 'kg', 3000, 'Mix Conversion Volume to Weight'),
(219, 33, 'Hammer 15', 0, 'O', 15000, 'Hammer'),
(220, 75, 'Project & Guidance', 1, 'p', 38715, 'Project & Guidance'),
(221, 76, 'Strutural Design (Shed)', 1, 'Work/s', 20000, 'Strutural Design (Shed)'),
(222, 53, 'Gradation', 15, 'kg', 800, 'Gradation'),
(223, 53, 'Deleterious Content', 15, 'kg', 1500, 'Deleterious Content'),
(224, 77, 'Hollow Block', 1, 'Block', 500, 'Hollow Block'),
(225, 78, 'Field Visit', 1, 'no', 9000, 'Field Visit'),
(226, 19, 'Structural Design Revised', 1, 'no', 2000, 'Structural Design Revised'),
(227, 81, 'Structural Design', 1, 'no', NULL, 'Structural Design'),
(228, 9, 'MS Flat 50 mm wide & MS Square pipe', 1, 'm', 5000, 'MS Flat 50 mm wide & MS Square pipe'),
(229, 82, 'Sieve Analysis, Bulking of Sand, Silt Content', 10, 'kg', 2400, 'Sieve Analysis, Bulking of Sand, Silt Content'),
(230, 11, 'Basic Test', 1, 'Pc', 2400, 'Basic Test'),
(231, 83, 'Moistrue Absorption, Specific gravity, Handness & d.thickness', 1, 'Pc', 3200, 'Moistrue Absorption, Specific gravity, Handness & d.thickness'),
(232, 84, 'Moistrue Absorption, Specific gravity, Handness & d.thickness', 1, 'Pc', 2400, 'Moistrue Absorption, Specific gravity, Handness & d.thickness'),
(233, 85, 'STAD PRO Software', 1, 'No', 3560, 'STAD PRO Software'),
(234, 86, 'Planning of Structural Design of New Shed, Roads, Dock Lever, Time offfice Building, Bottle Storage with Interlock tiles ', 1, 'No.', 0, 'Planning of Structural Design of New Shed, Roads, Dock Lever, Time offfice Building, Bottle Storage with Interlock tile'),
(235, 87, 'Core Cutting', 1, 'No.', 15000, 'Core Cutting'),
(236, 21, 'Tiles', 1, 'No', 300, 'Tiles'),
(237, 88, 'Six Week Training (TCC)', 1, 'No', 2670, 'Six Week Training (TCC)'),
(238, 89, 'Plate Load Test', 1, 'No', 6000, 'Plate Load Test'),
(239, 90, 'Bentonite', 10, 'Kg.', 5000, 'Bentonite'),
(240, 53, 'Soil Classification', 10, 'Kg', 800, 'Soil Classification'),
(241, 91, 'Water Absorption', 1, '1', 1000, 'Ceramic Glazed Tiles'),
(242, 91, 'Impact Test', 1, '1', 1000, ''),
(243, 91, 'Impact Test', 1, '1', 1000, 'Ceramic Glazed Tiles'),
(244, 91, 'Chemical Resistance', 1, '1', 1000, 'Ceramic Glazed Tiles'),
(245, 61, 'Graph', 1, 'samples', 800, 'Graph'),
(246, 92, 'Rebound Hammer 12', 1, 'No.', 12000, 'Rebound Hammer');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_testtotal`
--

CREATE TABLE IF NOT EXISTS `tcc_testtotal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `unit_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_testtotal_751f44ae` (`job_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_testtotal`
--

INSERT INTO `tcc_testtotal` (`id`, `job_id`, `unit_price`) VALUES
(1, 1, 2050),
(2, 2, 600);

-- --------------------------------------------------------

--
-- Table structure for table `tcc_testtotalperf`
--

CREATE TABLE IF NOT EXISTS `tcc_testtotalperf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tcc_transport`
--

INSERT INTO `tcc_transport` (`vehicle_id`, `id`, `job_no`, `bill_no`, `kilometer`, `amounts`, `total`, `date`, `test_date`) VALUES
(1, 1, 12, 1, '52', '(520L, 0L, 0L, 0L, 0L, 0L)', 520, '2013-07-11', '2013-04-03');

-- --------------------------------------------------------

--
-- Table structure for table `tcc_transportation`
--

CREATE TABLE IF NOT EXISTS `tcc_transportation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleno` varchar(150) NOT NULL,
  `rate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tcc_transportation`
--

INSERT INTO `tcc_transportation` (`id`, `vehicleno`, `rate`) VALUES
(1, 'PB-10-DA 4574', 10);

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
  `address` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `state` varchar(30) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `email_address` varchar(70) DEFAULT NULL,
  `contact_no` varchar(500) NOT NULL,
  `type_of_organisation` varchar(20) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_userprofile_fbfc09f1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tcc_userprofile`
--

INSERT INTO `tcc_userprofile` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `address`, `company`, `city`, `pin_code`, `state`, `website`, `email_address`, `contact_no`, `type_of_organisation`, `date`) VALUES
(1, 1, 'Jasvir ', 'Singh', 'Grewal', '#308,st.no 5A, near water', 'grewal', 'ldh', 141007, 'Punjab', 'http://dfs.cdc.com/', NULL, '9815424023', 'SEMI-GOVERNMENT', '2013-08-12'),
(2, 1, 'Jasvir ', 'Singh', 'Grewal', '#308,st.no 5A, near water', 'grewal', 'ldh', 141007, 'Punjab', 'http://dfs.cdc.com/', NULL, '9815424023', 'PRIVATE', '2013-08-14');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `registration_registrationprofile`
--
ALTER TABLE `registration_registrationprofile`
  ADD CONSTRAINT `user_id_refs_id_cecd7f3c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `report_admixture`
--
ALTER TABLE `report_admixture`
  ADD CONSTRAINT `Report_id_id_refs_id_178d7e6d` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_brick`
--
ALTER TABLE `report_brick`
  ADD CONSTRAINT `Report_id_id_refs_id_81070aeb` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_cement_opc_33`
--
ALTER TABLE `report_cement_opc_33`
  ADD CONSTRAINT `Report_id_id_refs_id_6e703514` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_cement_opc_43`
--
ALTER TABLE `report_cement_opc_43`
  ADD CONSTRAINT `Report_id_id_refs_id_3bb63219` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_cement_opc_53`
--
ALTER TABLE `report_cement_opc_53`
  ADD CONSTRAINT `Report_id_id_refs_id_f58fbfe2` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_cement_ppc`
--
ALTER TABLE `report_cement_ppc`
  ADD CONSTRAINT `Report_id_id_refs_id_991514a5` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_chem_analysis`
--
ALTER TABLE `report_chem_analysis`
  ADD CONSTRAINT `Report_id_id_refs_id_e61a4e92` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_concrete_paver`
--
ALTER TABLE `report_concrete_paver`
  ADD CONSTRAINT `Report_id_id_refs_id_7f8b59f7` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_cube`
--
ALTER TABLE `report_cube`
  ADD CONSTRAINT `Report_id_id_refs_id_484f3450` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_drinking_water`
--
ALTER TABLE `report_drinking_water`
  ADD CONSTRAINT `Report_id_id_refs_id_b4bc957` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_ground_water`
--
ALTER TABLE `report_ground_water`
  ADD CONSTRAINT `Report_id_id_refs_id_9e97ac72` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_interlock_tiles`
--
ALTER TABLE `report_interlock_tiles`
  ADD CONSTRAINT `Report_id_id_refs_id_50c3ff35` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_is_432_ms_grade_1_a_20mm_dia`
--
ALTER TABLE `report_is_432_ms_grade_1_a_20mm_dia`
  ADD CONSTRAINT `Report_id_id_refs_id_7f0ea38` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_is_2062_2006`
--
ALTER TABLE `report_is_2062_2006`
  ADD CONSTRAINT `Report_id_id_refs_id_c2d48c49` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_ms_1786_fe_415`
--
ALTER TABLE `report_ms_1786_fe_415`
  ADD CONSTRAINT `Report_id_id_refs_id_129c2d8d` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_ms_1786_fe_500`
--
ALTER TABLE `report_ms_1786_fe_500`
  ADD CONSTRAINT `Report_id_id_refs_id_55eca296` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_ms_steel_plate`
--
ALTER TABLE `report_ms_steel_plate`
  ADD CONSTRAINT `Report_id_id_refs_id_14e2fc64` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_pc`
--
ALTER TABLE `report_pc`
  ADD CONSTRAINT `Report_id_id_refs_id_9e201356` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_rebound_hammer_testing`
--
ALTER TABLE `report_rebound_hammer_testing`
  ADD CONSTRAINT `Report_id_id_refs_id_4b8f0d56` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_report`
--
ALTER TABLE `report_report`
  ADD CONSTRAINT `job_id_refs_id_68468e2e` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`);

--
-- Constraints for table `report_soil_building`
--
ALTER TABLE `report_soil_building`
  ADD CONSTRAINT `Report_id_id_refs_id_667e7c72` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_soil_ohsr`
--
ALTER TABLE `report_soil_ohsr`
  ADD CONSTRAINT `Report_id_id_refs_id_5e62fe18` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_soil_sample`
--
ALTER TABLE `report_soil_sample`
  ADD CONSTRAINT `Report_id_id_refs_id_b5d0c46a` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_steel`
--
ALTER TABLE `report_steel`
  ADD CONSTRAINT `Report_id_id_refs_id_7963eccf` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `report_water`
--
ALTER TABLE `report_water`
  ADD CONSTRAINT `Report_id_id_refs_id_36b26aa9` FOREIGN KEY (`Report_id_id`) REFERENCES `report_report` (`id`);

--
-- Constraints for table `tagging_taggeditem`
--
ALTER TABLE `tagging_taggeditem`
  ADD CONSTRAINT `tag_id_refs_id_9f51000d` FOREIGN KEY (`tag_id`) REFERENCES `tagging_tag` (`id`),
  ADD CONSTRAINT `content_type_id_refs_id_f1f84eed` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

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
  ADD CONSTRAINT `material_id_refs_id_cac842a5` FOREIGN KEY (`material_id`) REFERENCES `tcc_material` (`id`),
  ADD CONSTRAINT `job_id_refs_id_eea896a0` FOREIGN KEY (`job_id`) REFERENCES `tcc_editjob` (`id`);

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
  ADD CONSTRAINT `report_type_id_refs_id_715128a7` FOREIGN KEY (`report_type_id`) REFERENCES `tcc_report` (`id`),
  ADD CONSTRAINT `client_id_refs_id_475d7782` FOREIGN KEY (`client_id`) REFERENCES `tcc_editclientadd` (`id`),
  ADD CONSTRAINT `type_of_work_id_refs_id_3ff866ab` FOREIGN KEY (`type_of_work_id`) REFERENCES `tcc_govt` (`id`);

--
-- Constraints for table `tcc_job`
--
ALTER TABLE `tcc_job`
  ADD CONSTRAINT `report_type_id_refs_id_bd662a09` FOREIGN KEY (`report_type_id`) REFERENCES `tcc_report` (`id`),
  ADD CONSTRAINT `client_id_refs_id_fd23af76` FOREIGN KEY (`client_id`) REFERENCES `tcc_clientadd` (`id`),
  ADD CONSTRAINT `type_of_work_id_refs_id_4da5e95b` FOREIGN KEY (`type_of_work_id`) REFERENCES `tcc_govt` (`id`);

--
-- Constraints for table `tcc_lab`
--
ALTER TABLE `tcc_lab`
  ADD CONSTRAINT `department_id_refs_id_e7636d4d` FOREIGN KEY (`department_id`) REFERENCES `tcc_department` (`id`);

--
-- Constraints for table `tcc_nonpaymentjob`
--
ALTER TABLE `tcc_nonpaymentjob`
  ADD CONSTRAINT `client_id_refs_id_c048bcad` FOREIGN KEY (`client_id`) REFERENCES `tcc_userprofile` (`id`);

--
-- Constraints for table `tcc_selstaff_staff`
--
ALTER TABLE `tcc_selstaff_staff`
  ADD CONSTRAINT `selstaff_id_refs_id_7bce5bc0` FOREIGN KEY (`selstaff_id`) REFERENCES `tcc_selstaff` (`id`),
  ADD CONSTRAINT `staff_id_refs_id_4155ed89` FOREIGN KEY (`staff_id`) REFERENCES `tcc_staff` (`id`);

--
-- Constraints for table `tcc_soundexsearch`
--
ALTER TABLE `tcc_soundexsearch`
  ADD CONSTRAINT `id_id_refs_id_a29eb3e9` FOREIGN KEY (`id_id`) REFERENCES `tcc_userprofile` (`id`);

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
  ADD CONSTRAINT `field_id_refs_id_8efd9e88` FOREIGN KEY (`field_id`) REFERENCES `tcc_material` (`id`),
  ADD CONSTRAINT `job_id_refs_id_7e90c6bd` FOREIGN KEY (`job_id`) REFERENCES `tcc_editjob` (`id`),
  ADD CONSTRAINT `test_id_refs_id_84316b4f` FOREIGN KEY (`test_id`) REFERENCES `tcc_test` (`id`);

--
-- Constraints for table `tcc_suspencejob`
--
ALTER TABLE `tcc_suspencejob`
  ADD CONSTRAINT `field_id_refs_id_f9dd1268` FOREIGN KEY (`field_id`) REFERENCES `tcc_material` (`id`),
  ADD CONSTRAINT `job_id_refs_id_cafb41b3` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`),
  ADD CONSTRAINT `test_id_refs_id_faa2f6f` FOREIGN KEY (`test_id`) REFERENCES `tcc_test` (`id`);

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
