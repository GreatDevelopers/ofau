-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 31, 2013 at 11:56 AM
-- Server version: 5.5.29
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tcc_automation`
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

--
-- Dumping data for table `auth_group`
--


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

--
-- Dumping data for table `auth_group_permissions`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=127 ;

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
(31, 'Can add organisation', 11, 'add_organisation'),
(32, 'Can change organisation', 11, 'change_organisation'),
(33, 'Can delete organisation', 11, 'delete_organisation'),
(34, 'Can add department', 12, 'add_department'),
(35, 'Can change department', 12, 'change_department'),
(36, 'Can delete department', 12, 'delete_department'),
(37, 'Can add distribution', 13, 'add_distribution'),
(38, 'Can change distribution', 13, 'change_distribution'),
(39, 'Can delete distribution', 13, 'delete_distribution'),
(40, 'Can add lab', 14, 'add_lab'),
(41, 'Can change lab', 14, 'change_lab'),
(42, 'Can delete lab', 14, 'delete_lab'),
(43, 'Can add material', 15, 'add_material'),
(44, 'Can change material', 15, 'change_material'),
(45, 'Can delete material', 15, 'delete_material'),
(46, 'Can add test', 16, 'add_test'),
(47, 'Can change test', 16, 'change_test'),
(48, 'Can delete test', 16, 'delete_test'),
(49, 'Can add clientadd', 17, 'add_clientadd'),
(50, 'Can change clientadd', 17, 'change_clientadd'),
(51, 'Can delete clientadd', 17, 'delete_clientadd'),
(52, 'Can add edit clientadd', 18, 'add_editclientadd'),
(53, 'Can change edit clientadd', 18, 'change_editclientadd'),
(54, 'Can delete edit clientadd', 18, 'delete_editclientadd'),
(55, 'Can add govt', 19, 'add_govt'),
(56, 'Can change govt', 19, 'change_govt'),
(57, 'Can delete govt', 19, 'delete_govt'),
(58, 'Can add payment', 20, 'add_payment'),
(59, 'Can change payment', 20, 'change_payment'),
(60, 'Can delete payment', 20, 'delete_payment'),
(61, 'Can add job', 21, 'add_job'),
(62, 'Can change job', 21, 'change_job'),
(63, 'Can delete job', 21, 'delete_job'),
(64, 'Can add edit job', 22, 'add_editjob'),
(65, 'Can change edit job', 22, 'change_editjob'),
(66, 'Can delete edit job', 22, 'delete_editjob'),
(67, 'Can add client job', 23, 'add_clientjob'),
(68, 'Can change client job', 23, 'change_clientjob'),
(69, 'Can delete client job', 23, 'delete_clientjob'),
(70, 'Can add client edit job', 24, 'add_clienteditjob'),
(71, 'Can change client edit job', 24, 'change_clienteditjob'),
(72, 'Can delete client edit job', 24, 'delete_clienteditjob'),
(73, 'Can add suspence job', 25, 'add_suspencejob'),
(74, 'Can change suspence job', 25, 'change_suspencejob'),
(75, 'Can delete suspence job', 25, 'delete_suspencejob'),
(76, 'Can add suspence edit job', 26, 'add_suspenceeditjob'),
(77, 'Can change suspence edit job', 26, 'change_suspenceeditjob'),
(78, 'Can delete suspence edit job', 26, 'delete_suspenceeditjob'),
(79, 'Can add test total', 27, 'add_testtotal'),
(80, 'Can change test total', 27, 'change_testtotal'),
(81, 'Can delete test total', 27, 'delete_testtotal'),
(82, 'Can add test total perf', 28, 'add_testtotalperf'),
(83, 'Can change test total perf', 28, 'change_testtotalperf'),
(84, 'Can delete test total perf', 28, 'delete_testtotalperf'),
(85, 'Can add bill', 29, 'add_bill'),
(86, 'Can change bill', 29, 'change_bill'),
(87, 'Can delete bill', 29, 'delete_bill'),
(88, 'Can add bill perf', 30, 'add_billperf'),
(89, 'Can change bill perf', 30, 'change_billperf'),
(90, 'Can delete bill perf', 30, 'delete_billperf'),
(91, 'Can add amount', 31, 'add_amount'),
(92, 'Can change amount', 31, 'change_amount'),
(93, 'Can delete amount', 31, 'delete_amount'),
(94, 'Can add cdf amount', 32, 'add_cdfamount'),
(95, 'Can change cdf amount', 32, 'change_cdfamount'),
(96, 'Can delete cdf amount', 32, 'delete_cdfamount'),
(97, 'Can add distance', 33, 'add_distance'),
(98, 'Can change distance', 33, 'change_distance'),
(99, 'Can delete distance', 33, 'delete_distance'),
(100, 'Can add suspence', 34, 'add_suspence'),
(101, 'Can change suspence', 34, 'change_suspence'),
(102, 'Can delete suspence', 34, 'delete_suspence'),
(103, 'Can add staff', 35, 'add_staff'),
(104, 'Can change staff', 35, 'change_staff'),
(105, 'Can delete staff', 35, 'delete_staff'),
(106, 'Can add profroma tax', 36, 'add_profromatax'),
(107, 'Can change profroma tax', 36, 'change_profromatax'),
(108, 'Can delete profroma tax', 36, 'delete_profromatax'),
(109, 'Can add ta da', 37, 'add_tada'),
(110, 'Can change ta da', 37, 'change_tada'),
(111, 'Can delete ta da', 37, 'delete_tada'),
(112, 'Can add transportation', 38, 'add_transportation'),
(113, 'Can change transportation', 38, 'change_transportation'),
(114, 'Can delete transportation', 38, 'delete_transportation'),
(115, 'Can add transport', 39, 'add_transport'),
(116, 'Can change transport', 39, 'change_transport'),
(117, 'Can delete transport', 39, 'delete_transport'),
(118, 'Can add bankdetails', 40, 'add_bankdetails'),
(119, 'Can change bankdetails', 40, 'change_bankdetails'),
(120, 'Can delete bankdetails', 40, 'delete_bankdetails'),
(121, 'Can add tag', 41, 'add_tag'),
(122, 'Can change tag', 41, 'change_tag'),
(123, 'Can delete tag', 41, 'delete_tag'),
(124, 'Can add tagged item', 42, 'add_taggeditem'),
(125, 'Can change tagged item', 42, 'change_taggeditem'),
(126, 'Can delete tagged item', 42, 'delete_taggeditem');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'sandy', '', '', 'mkaurkhalsa@gmail.com', 'pbkdf2_sha256$10000$ZkyWp2fWN5Db$GfV093GDNkpVpa6bqVcM0CsQaXe1Ka4qsszOqQ6veL8=', 1, 1, 1, '2013-03-30 23:32:23', '2013-03-30 17:27:38'),
(2, 'Bhagwant', '', '', 'mkaurkhalsa@gmail.com', 'pbkdf2_sha256$10000$YJZpkw8GYrgA$2kbyZGVSslrCZ3O+XV9JnZ1MEVinKrldlM4crjFgJGc=', 0, 1, 0, '2013-03-31 11:31:31', '2013-03-30 23:29:05'),
(3, 'dotorgdotcom', '', '', 'dotorgdotcom@gmail.com', 'pbkdf2_sha256$10000$CZvAG50idQ1I$4nMpUcxypToLqViLnU1wVK22lUx75VreHVye/vT4tvQ=', 0, 0, 0, '2013-03-31 11:26:05', '2013-03-31 11:26:05');

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

--
-- Dumping data for table `auth_user_groups`
--


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

--
-- Dumping data for table `auth_user_user_permissions`
--


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

--
-- Dumping data for table `django_admin_log`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

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
(11, 'organisation', 'tcc', 'organisation'),
(12, 'department', 'tcc', 'department'),
(13, 'distribution', 'tcc', 'distribution'),
(14, 'lab', 'tcc', 'lab'),
(15, 'material', 'tcc', 'material'),
(16, 'test', 'tcc', 'test'),
(17, 'clientadd', 'tcc', 'clientadd'),
(18, 'edit clientadd', 'tcc', 'editclientadd'),
(19, 'govt', 'tcc', 'govt'),
(20, 'payment', 'tcc', 'payment'),
(21, 'job', 'tcc', 'job'),
(22, 'edit job', 'tcc', 'editjob'),
(23, 'client job', 'tcc', 'clientjob'),
(24, 'client edit job', 'tcc', 'clienteditjob'),
(25, 'suspence job', 'tcc', 'suspencejob'),
(26, 'suspence edit job', 'tcc', 'suspenceeditjob'),
(27, 'test total', 'tcc', 'testtotal'),
(28, 'test total perf', 'tcc', 'testtotalperf'),
(29, 'bill', 'tcc', 'bill'),
(30, 'bill perf', 'tcc', 'billperf'),
(31, 'amount', 'tcc', 'amount'),
(32, 'cdf amount', 'tcc', 'cdfamount'),
(33, 'distance', 'tcc', 'distance'),
(34, 'suspence', 'tcc', 'suspence'),
(35, 'staff', 'tcc', 'staff'),
(36, 'profroma tax', 'tcc', 'profromatax'),
(37, 'ta da', 'tcc', 'tada'),
(38, 'transportation', 'tcc', 'transportation'),
(39, 'transport', 'tcc', 'transport'),
(40, 'bankdetails', 'tcc', 'bankdetails'),
(41, 'tag', 'tagging', 'tag'),
(42, 'tagged item', 'tagging', 'taggeditem');

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
('4872f25507e6876a4c0f54b5ccf0b783', 'ODY1ODAyYjFlZjc3YTdiZTIyZmJhZDFhZTE5YjIxMTNjNDQ2NmYyYjqAAn1xAS4=\n', '2013-04-13 17:28:01'),
('5ecb15108c3248e7c064a4f86a0c20dc', 'Yjg5ODQxMDRhOTlkNzFmY2E1M2NiNmM3OTk4ZWE3ODA5NjhjNzQ0OTqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n', '2013-04-14 11:38:30'),
('81c4077ef9984ac5b6a77d10a8d4b71e', 'YTA1ODZlMTE4NGMzZTVmYjAxNmNmY2M1ZWYzODI3ZWE3NzViZmM3MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n', '2013-04-14 11:31:31'),
('ab608e8f14acc7692064723d5343f52a', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-04-13 17:51:34'),
('ab99dfb98d0f6c947f4d74eb23685704', 'MjM5OTY0MDJiOTc2NjRhMjBlZDM0NzZlNmRkOTlhZWQyOGQ2YTA5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2013-04-13 23:32:23');

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
(1, '192.168.15.178', '192.168.15.178');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `registration_registrationprofile`
--

INSERT INTO `registration_registrationprofile` (`id`, `user_id`, `activation_key`) VALUES
(1, 2, 'ALREADY_ACTIVATED'),
(2, 3, 'e51d28e8bb4f22c44b9baca66fdf76c89e2846ae');

-- --------------------------------------------------------

--
-- Table structure for table `tagging_tag`
--

CREATE TABLE IF NOT EXISTS `tagging_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=111 ;

--
-- Dumping data for table `tagging_tag`
--

INSERT INTO `tagging_tag` (`id`, `name`) VALUES
(88, '&'),
(107, '(OHSR)'),
(109, '(Treatment'),
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
(108, 'Design(Building)'),
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
(110, 'Plant)'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=209 ;

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
(199, 76, 12, 9),
(202, 76, 13, 18),
(204, 76, 13, 19),
(208, 76, 13, 20),
(144, 76, 14, 41),
(145, 77, 14, 42),
(147, 78, 14, 43),
(149, 79, 14, 44),
(151, 80, 14, 44),
(152, 81, 14, 45),
(198, 82, 12, 9),
(201, 82, 13, 18),
(206, 82, 13, 20),
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
(192, 106, 13, 14),
(200, 107, 13, 18),
(203, 108, 13, 19),
(205, 109, 13, 20),
(207, 110, 13, 20);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tcc_amount`
--

INSERT INTO `tcc_amount` (`id`, `job_id`, `college_income`, `admin_charge`, `consultancy_asst`, `development_fund`, `unit_price`, `report_type`) VALUES
(1, 2, NULL, NULL, NULL, NULL, 8000, 'Suspence');

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

--
-- Dumping data for table `tcc_bankdetails`
--


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
  `trans_total` int(11) DEFAULT NULL,
  `trans_net_total` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcc_bill`
--

INSERT INTO `tcc_bill` (`job_no`, `education_tax`, `higher_education_tax`, `service_tax`, `net_total`, `price`, `trans_total`, `trans_net_total`, `balance`) VALUES
(1, 19, 10, 960, 8989, 8000, 0, 8000, 8989);

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

--
-- Dumping data for table `tcc_billperf`
--


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

--
-- Dumping data for table `tcc_cdfamount`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tcc_clientadd`
--

INSERT INTO `tcc_clientadd` (`id`, `user_id`, `client_id`) VALUES
(3, 2, 3),
(4, 2, 3);

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

--
-- Dumping data for table `tcc_clienteditjob`
--


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

--
-- Dumping data for table `tcc_clienteditjob_test`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tcc_clientjob`
--

INSERT INTO `tcc_clientjob` (`id`, `job_id`, `material_id`, `other_test`) VALUES
(2, 2, 10, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tcc_clientjob_test`
--

INSERT INTO `tcc_clientjob_test` (`id`, `clientjob_id`, `test_id`) VALUES
(2, 2, 45);

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
  `faxno` varchar(100) DEFAULT NULL,
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
(1, 1, 'Testing & Consultancy Cell', 'Gill Road, Gill Park, Ludhiana - 141006', '0161-2491193,5064509', 'Dr. Hardeep Singh Rai', '0161-5064742', 'tcc@gndec.ac.in', '', 'http//tcc.gndec.ac.in', 'Consultancy Services are being rendered by various Departments of the College to the industry, Sate Government Departments and Entrepreneurs and are extended in the form of expert advice in design, testing of materials & equipment, technical surveys, technical audit, caliberation of instruments, prepartion of technical feasibility reports etc.\\<br /\\>\\<br\\>\r\n\r\nThis consultancy cell of the college has given a new dimension to the development programmes of the College. Consultancy projects of over Rs. one crore are completed by the Consultancy cell during financial year 2009-10.<br><br>\r\n<a href="http://gndec.ac.in/~tcc/files/brochure.pdf">Brochure of TCC</a><br><br>\r\n<b>Courses</b><br><br>\r\nCurrent Session\r\n<ul>\r\n    \r\n</hr>\r\n    <li>AIEEE Crash Course View brochure March 26, 2012\r\n    <li>CAD course by Mechanical and Prod. Engineering Department April 30 - June 08, 2012\r\n    <li>Course on VHDL by Electronics and Comm. Engineering Department April 26 - June 06, 2012\r\n    <li>OOPs using C++ View brochure Register online Sept 12 - Nov 11, 2011\r\n</ul>\r\n\r\n   Previous Session<br>\r\n<ul>\r\n\r\n    <li>CAD course by Mechanical and Prod. Engineering Department June 13 - July 22, 2011\r\n    <li>Course on VHDL by Electronics and Comm. Engineering Department May 23 - July 01, 2011\r\n    <li>AIEEE Crash Course April 2011\r\n\r\n    <li>Course on Computer Aided Analysis and Design by Civil Engineering Department June 07 - June 18, 2010\r\n    <li>CAD course by Mechanical and Prod. Engineering Department June 07 - July 16, 2010\r\n    <li>Course by Electrical Engineering Department June 15 - July 25, 2010\r\n    <li>Course on Matlab by Electronics and Comm. Engineering Department June 07 - July 19, 2010\r\n    <li>Course on VHDL by Electronics and Comm. Engineering Department June 07 - July 19, 2010\r\n    <li>Course on PHP and MySQL by CSE and IT Department June 07 - July 19, 2010\r\n    <li>CET Crash Course April 2010\r\n</ul>'),
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

--
-- Dumping data for table `tcc_distance`
--


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
(1, 'ROUTINE'),
(2, 'INSTITUTIONAL'),
(3, 'INDIVIDUAL');

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

--
-- Dumping data for table `tcc_editclientadd`
--


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

--
-- Dumping data for table `tcc_editjob`
--


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
  `site` varchar(50) NOT NULL,
  `type_of_work_id` int(11) NOT NULL,
  `report_type_id` int(11) NOT NULL,
  `pay` varchar(600) NOT NULL,
  `check_number` varchar(15) NOT NULL,
  `check_dd_date` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `letter_no` varchar(15) NOT NULL,
  `letter_date` date DEFAULT NULL,
  `tds` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_job_4a4e8ffb` (`client_id`),
  KEY `tcc_job_ca5d2cd8` (`type_of_work_id`),
  KEY `tcc_job_3d4f9c7e` (`report_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tcc_job`
--

INSERT INTO `tcc_job` (`id`, `client_id`, `job_no`, `sample`, `ip`, `site`, `type_of_work_id`, `report_type_id`, `pay`, `check_number`, `check_dd_date`, `date`, `letter_no`, `letter_date`, `tds`) VALUES
(2, 3, 1, 1, '192.168.15.1', 'Jalandhar', 1, 1, 'cash', '', '', '2013-03-31', '', '2013-03-05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcc_lab`
--

CREATE TABLE IF NOT EXISTS `tcc_lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tcc_lab`
--

INSERT INTO `tcc_lab` (`id`, `name`, `tags`, `department_id`) VALUES
(1, 'ENVIRONMENT', 'environment', 2),
(2, 'SOM', 'som', 2),
(3, 'SOIL', 'soil', 2),
(4, 'WATER/WASTE WATER', 'water, waste water', 0),
(5, 'CHEMICAL', 'chemical', 0),
(6, 'IT & Computer', 'IT & Computer', 6),
(7, 'MBA ', 'mba', 9),
(8, 'Survey', 'survey', 2),
(9, 'Structural Design', 'Structural Design', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tcc_material`
--

CREATE TABLE IF NOT EXISTS `tcc_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NOT NULL,
  `distribution_id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `report_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_material_4a1410c6` (`lab_id`),
  KEY `tcc_material_29fa1030` (`report_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tcc_material`
--

INSERT INTO `tcc_material` (`id`, `lab_id`, `distribution_id`, `name`, `tags`, `report_id`, `image`) VALUES
(1, 2, 1, 'Bricks', 'bricks', 1, ''),
(2, 3, 1, 'Fine Aggregate', 'fine aggregates', 1, 'logo/fine.jpeg'),
(3, 2, 1, 'Pavers/Beams', 'pavers, beams', 1, ''),
(4, 2, 1, 'Cement', 'cement', 1, ''),
(5, 3, 2, 'Soil for BC', 'soil for bc', 2, ''),
(6, 3, 2, 'OHSR', 'ohsr', 2, ''),
(7, 3, 1, 'Coarse Aggregate', 'course aggregate', 1, 'logo/CAggregate.JPG'),
(8, 2, 1, 'Cubes', 'cube', 1, ''),
(9, 2, 1, 'Steel', 'steel', 1, ''),
(10, 2, 1, 'Mix Design', 'mix deign', 1, ''),
(11, 2, 2, 'Wood', 'wood', 1, ''),
(12, 5, 2, 'Chemical testing', 'chemical test', 1, ''),
(13, 1, 2, 'Water/Waster Water', 'water', 1, ''),
(14, 6, 2, '2 week training (IT, CSE)', '2 week training (IT, CSE)', 1, ''),
(15, 6, 2, '6 week training (IT, CSE)', '6 week training (IT, CSE)', 1, ''),
(16, 6, 2, '6 months training (IT, CSE)', '6 months training (IT, CSE)', 1, ''),
(17, 8, 2, 'Survey', 'survey material', 2, ''),
(18, 9, 3, 'Structural Design (OHSR)', 'Structural Design (OHSR)', 1, 'logo/Sunset-Ship1.jpg'),
(19, 9, 3, 'Structural Design(Building)', 'Structural Design(Building)', 1, 'logo/ATT33506.jpg'),
(20, 9, 3, 'Structural Design (Treatment Plant)', 'Structural Design (Treatment Plant)', 1, 'logo/failure.jpg');

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
(1, 'Guru Nanak Dev Engineering College', 'Gill Park, Gill Road, Ludhiana - 141006 ', '0161-2491193, 506450', 'Dr. M.S. Saini', 'Punjab Govt Aided Status, NBA Accredited ISO-9001-2008 Certified', 'logo/gndeclogo.jpg');

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

--
-- Dumping data for table `tcc_profromatax`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

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
(7, 2, 'G', 'Dr. Hardeep Singh Rai', 180, 'Prof.', 9, 'hsrai@gmail.com'),
(8, 2, '1', 'Sh. Amarjit Singh', 100, 'Mech.', 2, ''),
(9, 2, '2', 'Sh. Avtar Singh', 60, 'L.A', 2, ''),
(10, 2, '3', 'Nandan Singh', 60, 'L.A', 3, ''),
(11, 2, 'E', 'Dr. Harpal Singh', 120, 'Prof.', 9, ''),
(12, 2, 'G', 'Dr. HarvinderSingh', 120, 'Ass. Prof.', 9, ''),
(13, 2, 'H', 'Prof Prashant Garg', 120, 'Ass. Prof.', 9, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tcc_suspence`
--

INSERT INTO `tcc_suspence` (`id`, `job_id`, `rate`, `sus_id`, `work_charge`, `labour_charge`, `boring_charge_external`, `boring_charge_internal`, `car_taxi_charge`, `lab_testing_staff`, `field_testing_staff`, `test_date`, `suspence_bill_no`) VALUES
(1, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL);

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

--
-- Dumping data for table `tcc_suspenceeditjob`
--


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

--
-- Dumping data for table `tcc_suspencejob`
--


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

--
-- Dumping data for table `tcc_tada`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

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
(16, 1, 'Comp. Strength  ', 10, 'Bricks', 1200, 'comp. strength'),
(17, 1, 'Water Absorption  ', 10, 'Bricks', 1200, 'water absorption'),
(18, 1, 'Effloroscence  ', 10, 'Bricks', 1200, 'effloroscence'),
(19, 3, 'Comp. Strength  ', 1, 'C.paver', 300, 'comp. strength for pavers'),
(20, 3, 'Flexural Strength  ', 1, 'C.paver', 300, 'flexural strength for pavers'),
(21, 3, 'Water Absorption  ', 1, 'C.paver', 300, 'water absorption for pavers'),
(22, 4, 'Initial & Final Setting time Comp. Strength (at 7 day’s  curing) , at 28 day’s curing, Soundness, Fineness, Consistency  ', 15, 'kg', 2500, 'cement tests'),
(23, 7, 'Sieve Analysis  ', 10, 'kg', 800, 'course sieve analysis'),
(24, 7, 'Abrasion Value  ', 10, 'kg', 800, 'course aggregate abrasion'),
(25, 7, 'Crushing Value/Strength', 10, 'kg', 800, 'course aggregate crushing'),
(26, 7, 'Flakiness Index  ', 10, 'kg', 800, 'course aggregate flakiness'),
(27, 7, 'Impact Value  ', 5, 'kg', 800, 'course aggregate impact'),
(28, 7, 'Specific Gravity  ', 5, 'kg', 800, 'course aggregate specific gravity'),
(29, 7, 'Soundness Tests  ', 5, 'kg', 800, 'coarse aggregate soundness test'),
(30, 7, 'C.B.R. Test  (Soaked)  ', 10, 'kg', 1800, 'coarse aggregate CBR '),
(31, 7, 'C.B.R. Test  (Unsoaked)  ', 10, 'kg', 1800, 'coarse aggregate unsoaked'),
(32, 2, 'Moisture  Content  ', 3, 'kg', 800, 'fines aggregate moisture content'),
(33, 2, 'Liquid Limit &  Plastic Limit  ', 3, 'kg', 800, 'fine aggregate liquid limit'),
(34, 2, 'Compaction Test  (Dry Bulk Density)  ', 5, 'kg', 1500, 'fine aggregate compaction'),
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
(52, 15, '6 week training ', 6, 'week', 2000, '6 week training (IT, CSE)');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tcc_testtotal`
--

INSERT INTO `tcc_testtotal` (`id`, `job_id`, `unit_price`) VALUES
(1, 2, 8000);

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

--
-- Dumping data for table `tcc_testtotalperf`
--


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

--
-- Dumping data for table `tcc_transport`
--


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

--
-- Dumping data for table `tcc_transportation`
--


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
  `address` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `state` varchar(30) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `email_address` varchar(75) DEFAULT NULL,
  `contact_no` varchar(25) NOT NULL,
  `type_of_organisation` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tcc_userprofile_fbfc09f1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tcc_userprofile`
--

INSERT INTO `tcc_userprofile` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `address`, `company`, `city`, `pin_code`, `state`, `website`, `email_address`, `contact_no`, `type_of_organisation`) VALUES
(3, 2, 'Bhagwant', 'Singh', '', 'Gndec', 'TCC.Gndec', 'Ludhiana', 161007, 'Punjab', '', '', '90837249287', 'GOVERNMENT');

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
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `registration_registrationprofile`
--
ALTER TABLE `registration_registrationprofile`
  ADD CONSTRAINT `user_id_refs_id_cecd7f3c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tcc_amount`
--
ALTER TABLE `tcc_amount`
  ADD CONSTRAINT `job_id_refs_id_6018e7df` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`);

--
-- Constraints for table `tcc_clientadd`
--
ALTER TABLE `tcc_clientadd`
  ADD CONSTRAINT `client_id_refs_id_7f3a75eb` FOREIGN KEY (`client_id`) REFERENCES `tcc_userprofile` (`id`),
  ADD CONSTRAINT `user_id_refs_id_8335da6c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
-- Constraints for table `tcc_editclientadd`
--
ALTER TABLE `tcc_editclientadd`
  ADD CONSTRAINT `client_id_refs_id_fd489edd` FOREIGN KEY (`client_id`) REFERENCES `tcc_userprofile` (`id`),
  ADD CONSTRAINT `user_id_refs_id_277f0ac4` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tcc_editjob`
--
ALTER TABLE `tcc_editjob`
  ADD CONSTRAINT `type_of_work_id_refs_id_3ff866ab` FOREIGN KEY (`type_of_work_id`) REFERENCES `tcc_govt` (`id`),
  ADD CONSTRAINT `client_id_refs_id_475d7782` FOREIGN KEY (`client_id`) REFERENCES `tcc_editclientadd` (`id`),
  ADD CONSTRAINT `report_type_id_refs_id_715128a7` FOREIGN KEY (`report_type_id`) REFERENCES `tcc_report` (`id`);

--
-- Constraints for table `tcc_job`
--
ALTER TABLE `tcc_job`
  ADD CONSTRAINT `client_id_refs_id_fd23af76` FOREIGN KEY (`client_id`) REFERENCES `tcc_clientadd` (`id`),
  ADD CONSTRAINT `report_type_id_refs_id_bd662a09` FOREIGN KEY (`report_type_id`) REFERENCES `tcc_report` (`id`),
  ADD CONSTRAINT `type_of_work_id_refs_id_4da5e95b` FOREIGN KEY (`type_of_work_id`) REFERENCES `tcc_govt` (`id`);

--
-- Constraints for table `tcc_suspence`
--
ALTER TABLE `tcc_suspence`
  ADD CONSTRAINT `job_id_refs_id_25fd0307` FOREIGN KEY (`job_id`) REFERENCES `tcc_job` (`id`),
  ADD CONSTRAINT `sus_id_refs_id_4acb203f` FOREIGN KEY (`sus_id`) REFERENCES `tcc_suspencejob` (`id`);

--
-- Constraints for table `tcc_suspenceeditjob`
--
ALTER TABLE `tcc_suspenceeditjob`
  ADD CONSTRAINT `job_id_refs_id_7e90c6bd` FOREIGN KEY (`job_id`) REFERENCES `tcc_editjob` (`id`),
  ADD CONSTRAINT `field_id_refs_id_8efd9e88` FOREIGN KEY (`field_id`) REFERENCES `tcc_material` (`id`),
  ADD CONSTRAINT `test_id_refs_id_84316b4f` FOREIGN KEY (`test_id`) REFERENCES `tcc_test` (`id`);

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
