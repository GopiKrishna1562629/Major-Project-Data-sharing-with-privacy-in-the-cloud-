-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 15, 2022 at 02:02 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloudhost`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities_table`
--

DROP TABLE IF EXISTS `activities_table`;
CREATE TABLE IF NOT EXISTS `activities_table` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `action` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `upload_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activities_table`
--

INSERT INTO `activities_table` (`activity_id`, `file_name`, `date`, `time`, `action`, `user_id`, `upload_id`, `owner_id`, `key`) VALUES
(90, 'sms-API.txt', '2022-05-15', '19:24:38.110928', 'download', 1, 10, 2, 'gr&ywC+yR!'),
(89, 'sms-API.txt', '2022-05-15', '18:48:23.746904', 'download', 1, 18, 2, NULL),
(74, 'resume-D.pdf', '2022-05-15', '17:17:11.956143', 'download', 2, 12, NULL, '@C_zX5gPFj'),
(75, 'sms-API.txt', '2022-05-15', '17:18:35.403543', 'download', 2, 10, 2, '2T5LVLm&2K'),
(76, 'resume-D.pdf', '2022-05-15', '17:19:12.600542', 'download', 2, 12, 1, 'cDJIieuLK6'),
(77, 'resume-D.pdf', '2022-05-15', '17:19:36.994448', 'download', 2, 12, 1, '%zGaU!k)*C'),
(78, 'newfile.txt', '2022-05-15', '17:21:07.450477', 'download', 2, 16, 1, 'D^cmc#%UNZ'),
(79, 'sms-API.txt', '2022-05-15', '17:38:49.311427', 'download', 2, 10, 2, 'xN9FDRv$GV'),
(80, 'sms-API.txt', '2022-05-15', '18:19:15.469644', 'download', 2, 10, 2, NULL),
(81, 'sms-API.txt', '2022-05-15', '18:30:27.594020', 'download', 2, NULL, NULL, NULL),
(82, 'sms-API.txt', '2022-05-15', '18:30:37.729244', 'download', 2, 18, 2, NULL),
(83, 'sms-API.txt', '2022-05-15', '18:33:18.431491', 'download', 2, 18, 2, NULL),
(84, 'sms-API.txt', '2022-05-15', '18:33:22.785631', 'download', 2, 18, 2, NULL),
(85, 'sms-API.txt', '2022-05-15', '18:33:43.956069', 'download', 2, 10, 2, 'SE4QnFFNK+'),
(86, 'sms-API.txt', '2022-05-15', '18:34:53.628841', 'edited', 2, 10, NULL, NULL),
(87, 'sms-API.txt', '2022-05-15', '18:35:14.189970', 'delete', 2, 18, 2, NULL),
(88, 'sms-API.txt', '2022-05-15', '18:36:15.922910', 'delete', 2, 10, 2, NULL),
(73, 'sms-API.txt', '2022-05-15', '17:16:08.906339', 'download', 2, 10, NULL, 's8ENdtC0#)');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user model', 7, 'add_usermodel'),
(26, 'Can change user model', 7, 'change_usermodel'),
(27, 'Can delete user model', 7, 'delete_usermodel'),
(28, 'Can view user model', 7, 'view_usermodel'),
(29, 'Can add user upload', 8, 'add_userupload'),
(30, 'Can change user upload', 8, 'change_userupload'),
(31, 'Can delete user upload', 8, 'delete_userupload'),
(32, 'Can view user upload', 8, 'view_userupload'),
(33, 'Can add activities model', 9, 'add_activitiesmodel'),
(34, 'Can change activities model', 9, 'change_activitiesmodel'),
(35, 'Can delete activities model', 9, 'delete_activitiesmodel'),
(36, 'Can view activities model', 9, 'view_activitiesmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'userapp', 'usermodel'),
(8, 'userapp', 'userupload'),
(9, 'userapp', 'activitiesmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-11 07:42:28.763054'),
(2, 'auth', '0001_initial', '2022-05-11 07:42:30.361074'),
(3, 'admin', '0001_initial', '2022-05-11 07:42:30.816562'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-11 07:42:30.872503'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-11 07:42:30.892522'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-11 07:42:31.079741'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-11 07:42:31.184006'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-11 07:42:31.261906'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-11 07:42:31.274918'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-11 07:42:31.382374'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-11 07:42:31.397687'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-11 07:42:31.431655'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-11 07:42:31.528804'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-11 07:42:31.616855'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-11 07:42:31.717973'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-11 07:42:31.738934'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-11 07:42:31.811936'),
(18, 'sessions', '0001_initial', '2022-05-11 07:42:31.948730'),
(19, 'userapp', '0001_initial', '2022-05-11 07:42:40.456997'),
(20, 'userapp', '0002_rename_upload_userupload_uploaded_file', '2022-05-11 07:43:51.924774'),
(21, 'userapp', '0003_userupload_uploaded_image_and_more', '2022-05-11 08:44:18.215006'),
(22, 'userapp', '0004_remove_userupload_uploaded_image', '2022-05-11 08:46:08.337809'),
(23, 'userapp', '0005_userupload_date_of_upload_userupload_name_and_more', '2022-05-11 08:54:54.281909'),
(24, 'userapp', '0006_userupload_content_type', '2022-05-11 09:12:20.019458'),
(25, 'userapp', '0007_activitiesmodel', '2022-05-12 05:31:43.642167'),
(26, 'userapp', '0008_activitiesmodel_user_id', '2022-05-12 05:35:06.366659'),
(27, 'userapp', '0009_alter_activitiesmodel_action', '2022-05-12 05:36:10.404657'),
(28, 'userapp', '0010_userupload_category', '2022-05-12 06:35:31.803530'),
(29, 'userapp', '0011_rename_name_activitiesmodel_file_name', '2022-05-13 09:23:23.705022'),
(30, 'userapp', '0012_alter_activitiesmodel_action_and_more', '2022-05-13 10:50:05.572816'),
(31, 'userapp', '0013_activitiesmodel_upload_id', '2022-05-13 13:05:00.980392'),
(32, 'userapp', '0014_activitiesmodel_owner_id', '2022-05-14 07:13:10.804732'),
(33, 'userapp', '0015_activitiesmodel_otp', '2022-05-15 11:34:37.382630'),
(34, 'userapp', '0016_rename_otp_activitiesmodel_key', '2022-05-15 11:35:48.747387');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('96bdsgye9av5553p7hv3fxzuftjb62q1', 'eyJ1c2VyX2lkIjoxfQ:1nqEiB:SCgZqfwlhssBmDTP7enLnn7xg1FTpvfZh107JlJzepI', '2022-05-29 13:55:07.884046');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `category` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `cpwd` varchar(100) NOT NULL,
  `otp` int(11) DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `name`, `email`, `mobile`, `category`, `pwd`, `cpwd`, `otp`, `status`) VALUES
(1, 'karnika', 'karnikasrinath18@gmail.com', 7396690912, 'Astronomy', '123', '123', 2140, 'verified'),
(2, 'saddam', 'saddamoddin18@gmail.com', 9573970379, 'Astronomy', '123', '123', 2475, 'download'),
(3, 'tharun', 'saitharun581@gmail.com', 7396690912, 'Political Affairs', '123', '123', 9333, 'verified'),
(4, 'srinath', 'karnikasrinath@gmail.com', 7396690912, 'Mathematics', '123', '123', 7912, 'verified'),
(5, 'karthik', 'karthik.karthikredd04y@gmail.com', 7396690912, 'Entertainment', '123', '123', 2474, 'verified'),
(6, 'keerthi', 'keerthikarnika226@gmail.com', 7396690912, 'Civil', '123', '123', 1497, 'verified'),
(7, 'srikanth', 'srikanth@gmail.com', 7396690912, 'Mathematics', '123', '123', 5784, 'verified'),
(8, 'sravani', 'chanuchiramana1800@gmail.com', 7396690912, 'Food', '123', '123', 5920, 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `user_uploaded_files`
--

DROP TABLE IF EXISTS `user_uploaded_files`;
CREATE TABLE IF NOT EXISTS `user_uploaded_files` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `uploaded_file` varchar(100) DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_of_upload` date NOT NULL,
  `name` longtext DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `content_type` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`upload_id`),
  KEY `user_uploaded_files_user_id_c1a75988` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_uploaded_files`
--

INSERT INTO `user_uploaded_files` (`upload_id`, `uploaded_file`, `status`, `user_id`, `date_of_upload`, `name`, `size`, `content_type`, `category`) VALUES
(10, 'files/sms-API_V8rVQtz.txt', 'pending', 2, '2022-05-12', 'sms-API.txt', 141, 'text/plain', 'Astronomy'),
(5, 'files/darwin_c8EDd2Z.jpg', 'Download', 1, '2022-05-11', 'darwin.jpg', 4274, 'image/jpeg', 'Astronomy'),
(12, 'files/resume-D.pdf', 'pending', 1, '2022-05-13', 'resume-D.pdf', 89243, 'application/pdf', 'Astronomy'),
(11, 'files/Django_Forms_1.docx', 'pending', 2, '2022-05-12', 'Django Forms (1).docx', 99002, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Astronomy'),
(9, 'files/darwin_IFDeKCY.jpg', 'pending', 3, '2022-05-12', 'darwin.jpg', 4274, 'image/jpeg', 'Political Affairs'),
(13, 'files/newfile.txt', 'pending', 1, '2022-05-13', 'newfile.txt', 153, 'text/plain', 'Astronomy'),
(14, 'files/newfile_tUYHKU8.txt', 'pending', 1, '2022-05-13', 'newfile.txt', 153, 'text/plain', 'Astronomy'),
(15, 'files/sms-API_zEWTFiV.txt', 'pending', 1, '2022-05-13', 'sms-API.txt', 141, 'text/plain', 'Astronomy'),
(16, 'files/newfile_KtS9JlY.txt', 'pending', 1, '2022-05-13', 'newfile.txt', 153, 'text/plain', 'Astronomy'),
(17, 'files/newfile_NeyDLsm.txt', 'pending', 8, '2022-05-14', 'newfile.txt', 153, 'text/plain', 'Food'),
(18, 'files/sms-API_8KGZ3eL.txt', 'pending', 2, '2022-05-15', 'sms-API.txt', 141, 'text/plain', 'Astronomy');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
