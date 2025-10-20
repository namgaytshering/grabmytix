/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: grabmytix_db
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add country',7,'add_country'),
(26,'Can change country',7,'change_country'),
(27,'Can delete country',7,'delete_country'),
(28,'Can view country',7,'view_country'),
(29,'Can add currency',8,'add_currency'),
(30,'Can change currency',8,'change_currency'),
(31,'Can delete currency',8,'delete_currency'),
(32,'Can view currency',8,'view_currency'),
(33,'Can add state',9,'add_state'),
(34,'Can change state',9,'change_state'),
(35,'Can delete state',9,'delete_state'),
(36,'Can view state',9,'view_state'),
(37,'Can add suburb',10,'add_suburb'),
(38,'Can change suburb',10,'change_suburb'),
(39,'Can delete suburb',10,'delete_suburb'),
(40,'Can view suburb',10,'view_suburb'),
(41,'Can add user',11,'add_user'),
(42,'Can change user',11,'change_user'),
(43,'Can delete user',11,'delete_user'),
(44,'Can view user',11,'view_user'),
(45,'Can add film show',12,'add_filmshow'),
(46,'Can change film show',12,'change_filmshow'),
(47,'Can delete film show',12,'delete_filmshow'),
(48,'Can view film show',12,'view_filmshow'),
(49,'Can add booking',13,'add_booking'),
(50,'Can change booking',13,'change_booking'),
(51,'Can delete booking',13,'delete_booking'),
(52,'Can view booking',13,'view_booking'),
(53,'Can add event type',15,'add_eventtype'),
(54,'Can change event type',15,'change_eventtype'),
(55,'Can delete event type',15,'delete_eventtype'),
(56,'Can view event type',15,'view_eventtype'),
(57,'Can add film',14,'add_film'),
(58,'Can change film',14,'change_film'),
(59,'Can delete film',14,'delete_film'),
(60,'Can view film',14,'view_film'),
(61,'Can add event',16,'add_event'),
(62,'Can change event',16,'change_event'),
(63,'Can delete event',16,'delete_event'),
(64,'Can view event',16,'view_event'),
(65,'Can add Scheduled task',17,'add_schedule'),
(66,'Can change Scheduled task',17,'change_schedule'),
(67,'Can delete Scheduled task',17,'delete_schedule'),
(68,'Can view Scheduled task',17,'view_schedule'),
(69,'Can add task',18,'add_task'),
(70,'Can change task',18,'change_task'),
(71,'Can delete task',18,'delete_task'),
(72,'Can view task',18,'view_task'),
(73,'Can add Failed task',19,'add_failure'),
(74,'Can change Failed task',19,'change_failure'),
(75,'Can delete Failed task',19,'delete_failure'),
(76,'Can view Failed task',19,'view_failure'),
(77,'Can add Successful task',20,'add_success'),
(78,'Can change Successful task',20,'change_success'),
(79,'Can delete Successful task',20,'delete_success'),
(80,'Can view Successful task',20,'view_success'),
(81,'Can add Queued task',21,'add_ormq'),
(82,'Can change Queued task',21,'change_ormq'),
(83,'Can delete Queued task',21,'delete_ormq'),
(84,'Can view Queued task',21,'view_ormq'),
(85,'Can add event access',22,'add_eventaccess'),
(86,'Can change event access',22,'change_eventaccess'),
(87,'Can delete event access',22,'delete_eventaccess'),
(88,'Can view event access',22,'view_eventaccess'),
(89,'Can add film show access',23,'add_filmshowaccess'),
(90,'Can change film show access',23,'change_filmshowaccess'),
(91,'Can delete film show access',23,'delete_filmshowaccess'),
(92,'Can view film show access',23,'view_filmshowaccess');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_booking`
--

DROP TABLE IF EXISTS `db_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `filmshow_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `poster_image` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `theater_name` varchar(200) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `street` varchar(400) NOT NULL,
  `no_adult` decimal(6,0) NOT NULL,
  `no_child` decimal(6,0) NOT NULL DEFAULT 0,
  `price_adult` decimal(6,2) NOT NULL,
  `price_child` decimal(6,2) NOT NULL,
  `type` varchar(200) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `total_payment` decimal(10,1) NOT NULL DEFAULT 0.0,
  `payment_status` int(11) NOT NULL DEFAULT 0 CHECK (`payment_status` in (0,1)),
  `payment_date` datetime DEFAULT NULL,
  `attended` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `economy_label` varchar(50) DEFAULT NULL,
  `economy_price` decimal(8,1) NOT NULL DEFAULT 0.0,
  `economy_quantity` int(11) NOT NULL DEFAULT 0,
  `general_label` varchar(50) DEFAULT NULL,
  `general_price` decimal(8,1) NOT NULL DEFAULT 0.0,
  `general_quantity` int(11) NOT NULL DEFAULT 0,
  `vip_label` varchar(50) DEFAULT NULL,
  `vip_price` decimal(8,1) NOT NULL DEFAULT 0.0,
  `vip_quantity` int(11) NOT NULL DEFAULT 0,
  `attend_remarks` longtext DEFAULT NULL,
  `attended_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_booking`
--

LOCK TABLES `db_booking` WRITE;
/*!40000 ALTER TABLE `db_booking` DISABLE KEYS */;
INSERT INTO `db_booking` VALUES
(282,'Trst','bhs@gmail.com',1234748497,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','','2025-09-06','19:30:00',30.0,0,NULL,0,'2025-08-29 13:21:55','2025-08-29 13:21:55',NULL,0.0,0,NULL,0.0,0,NULL,0.0,0,NULL,NULL),
(283,'Trst','bhs@gmail.com',1234748497,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','','2025-09-06','19:30:00',30.0,0,NULL,0,'2025-08-29 13:21:58','2025-08-29 13:21:58',NULL,0.0,0,NULL,0.0,0,NULL,0.0,0,NULL,NULL),
(331,'Minjur','minjurdorji363@gmail.com',433814363,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',9,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,5.00,0.00,'Event','AUD','2025-09-06','19:30:00',5.0,0,NULL,0,'2025-08-30 08:40:05','2025-08-30 08:40:05',NULL,0.0,0,NULL,0.0,0,NULL,0.0,0,NULL,NULL),
(332,'Minjur','minjurdorji363@gmail.com',433814363,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',9,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,5.00,0.00,'Event','AUD','2025-09-06','19:30:00',5.0,0,'2025-08-30 08:41:00',0,'2025-08-30 08:40:09','2025-09-01 10:54:42',NULL,0.0,0,NULL,0.0,0,NULL,0.0,0,NULL,NULL),
(334,'Dawa Norbu','norbgyel4590@gmail.com',490881961,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,'2025-08-30 09:06:38',0,'2025-08-30 09:04:56','2025-09-08 10:46:18',NULL,0.0,0,NULL,30.0,1,NULL,0.0,0,'Checked in','2025-09-08 10:13:25.000000'),
(335,'Kunzang Dorji','kindor2409@gmail.com',432245090,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',16,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,NULL,0,'2025-08-30 09:10:53','2025-08-30 09:10:53',NULL,0.0,0,NULL,0.0,0,NULL,0.0,0,NULL,NULL),
(337,'Th','thinleyrabgay92@gmail.com',5,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,NULL,0,'2025-08-31 03:08:36','2025-08-31 03:08:36',NULL,0.0,0,NULL,0.0,0,NULL,0.0,0,NULL,NULL),
(338,'Thinley Rabgay','thinleyrabgay92@gmail.com',466301917,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',28,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,'2025-08-31 04:04:37',0,'2025-08-31 04:04:13','2025-09-08 10:45:55',NULL,0.0,0,NULL,30.0,1,NULL,0.0,0,'Checked in','2025-09-08 10:42:34.000000'),
(339,'Choki','Chogyel509@gmail.com',434130466,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,'2025-09-03 10:32:11',0,'2025-08-31 04:09:27','2025-09-03 10:37:26',NULL,0.0,0,NULL,30.0,1,NULL,0.0,0,NULL,NULL),
(340,'Sherab Tenzin','sherab.tenzin360@gmail.com',431803145,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,NULL,0,'2025-09-01 05:41:22','2025-09-01 05:41:22',NULL,0.0,0,NULL,0.0,0,NULL,0.0,0,NULL,NULL),
(343,'Ugen Tshering','ugentsaering@gmail.com',420705718,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,1,'2025-09-01 14:13:00',1,'2025-09-01 14:11:36','2025-09-08 13:13:54',NULL,0.0,0,NULL,30.0,1,NULL,0.0,0,'Checked in','2025-09-08 13:13:54.515546'),
(345,'Sangay Choden','choden447@gmail.com',449742275,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,1,'2025-09-02 11:09:49',1,'2025-09-02 11:09:05','2025-09-08 12:06:43',NULL,0.0,0,NULL,30.0,1,NULL,0.0,0,'Checked in','2025-09-08 12:06:43.409008'),
(371,'Kinley Wangchuk','kinleywangchuk777@gmail.com',449762855,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,1,'2025-09-04 11:03:26',1,'2025-09-04 11:02:45','2025-09-06 11:47:08',NULL,0.0,0,'General Admission',30.0,1,NULL,0.0,0,'Thanks','2025-09-06 11:47:08.661039'),
(372,'Yeshi Lobesa','yeshilobesa@gmail.com',468809007,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',30,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',2,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',60.0,1,'2025-09-04 11:32:04',1,'2025-09-04 11:28:38','2025-09-06 10:13:46',NULL,0.0,0,'General Admission',30.0,2,NULL,0.0,0,'both check in','2025-09-06 10:13:46.229862'),
(373,'Ddr','sdrup_t@yahoo.com',17124912,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,NULL,0,'2025-09-04 15:01:59','2025-09-04 15:01:59',NULL,0.0,0,'General Admission',30.0,1,NULL,0.0,0,NULL,NULL),
(374,'Ugyen Dorji','ugyen.yoko2018@gmail.com',451633177,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',2,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',60.0,1,'2025-09-05 16:37:01',0,'2025-09-05 16:35:38','2025-09-05 16:37:01',NULL,0.0,0,'General Admission',30.0,2,NULL,0.0,0,NULL,NULL),
(375,'Tshewang Rigzin','trigzin87@gmail.com',421668267,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,NULL,0,'2025-09-06 06:23:26','2025-09-06 06:23:26',NULL,0.0,0,'General Admission',30.0,1,NULL,0.0,0,NULL,NULL),
(376,'Tshering','sheringongmo136@gmail.com',433417705,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',2,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',60.0,1,'2025-09-06 09:16:42',1,'2025-09-06 09:13:01','2025-09-08 22:25:59',NULL,0.0,0,'General Admission',30.0,2,NULL,0.0,0,'Checked in','2025-09-08 22:25:59.095352'),
(377,'Shota Kikugawa','tasyo.syota@gmail.com',422248027,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,NULL,0,'2025-09-06 09:36:08','2025-09-06 09:36:08',NULL,0.0,0,'General Admission',30.0,1,NULL,0.0,0,NULL,NULL),
(378,'Shota','tasyo.syota@docomo.ne.jp',422248027,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,1,'2025-09-06 10:07:34',1,'2025-09-06 10:06:28','2025-09-06 11:44:10',NULL,0.0,0,'General Admission',30.0,1,NULL,0.0,0,'thanks','2025-09-06 11:44:10.727794'),
(379,'Sherab gyeltshen','sherabg90@gmail.com',435105084,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,1,'2025-09-06 11:09:55',1,'2025-09-06 11:08:17','2025-09-06 11:18:42',NULL,0.0,0,'General Admission',30.0,1,NULL,0.0,0,'Checked in','2025-09-06 11:18:42.794779'),
(380,'Dorji Dema','dorjid02@gmail.com',449683636,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',3,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',90.0,1,'2025-09-06 11:15:25',1,'2025-09-06 11:13:32','2025-09-06 11:17:18',NULL,0.0,0,'General Admission',30.0,3,NULL,0.0,0,'All 3 join','2025-09-06 11:17:18.530639'),
(381,'Dorji','ddema6604@gmail.com',420628633,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',1,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',30.0,0,NULL,0,'2025-09-06 11:27:48','2025-09-06 11:27:48',NULL,0.0,0,'General Admission',30.0,1,NULL,0.0,0,NULL,NULL),
(382,'Som Lhamo','eveagren@gmail.com',452649147,NULL,NULL,8,'Musical Concert – Namgay Jigs Live','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',NULL,'Leederville Town Hall',1,3,'84 Cambridge St, West Leederville WA 6007',2,0,30.00,0.00,'Event','AUD','2025-09-06','19:30:00',60.0,0,NULL,0,'2025-09-06 13:08:41','2025-09-06 13:08:41',NULL,0.0,0,'General Admission',30.0,2,NULL,0.0,0,NULL,NULL),
(391,'Minjur','minjurdorji363@gmail.com',433814363,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',9,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-07 09:05:10','2025-10-07 09:05:10',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(392,'Tenzin Dolma','dtenzin20@gmail.com',420544447,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-07 12:07:46','2025-10-07 12:07:46',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(401,'Jigthril yoesel','jigthrilkinley614@gmail.com',430030154,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-08 17:31:34','2025-10-08 17:31:34',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(402,'Jigthril yoesel','jigthrilkinley614@gmail.com',430030154,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-08 17:31:37','2025-10-08 17:31:37',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(403,'Kinley Dema','delmakuenley12@gmail.com',424201726,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-09 04:19:51','2025-10-09 04:19:51',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(404,'Deo Kr Thingh','deokrthingh@gmail.com',423571780,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-09 06:41:27','2025-10-09 06:41:27',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(405,'Tashi Tenzin','ttenzin913@gmail.com',14648867,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-09 09:02:12','2025-10-09 09:02:12',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(406,'Tashi Tenzin','ttenzin913@gmail.com',14648867,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-09 09:02:16','2025-10-09 09:02:16',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(407,'Dawa tshering','dawatshering115@gmail.com',452641364,NULL,NULL,11,'Doteng Gewog 2nd dinner gathering','events/205867-paro-dzong-paro-bhutan.webp',NULL,'To be confirm',1,3,'Perth',0,0,50.00,0.00,'Event','AUD','2025-10-25','18:00:00',0.0,0,NULL,0,'2025-10-09 09:08:34','2025-10-09 09:08:34',NULL,0.0,2,'General Admission',50.0,0,NULL,0.0,0,NULL,NULL),
(408,'Minjur Dorji','minjurdorji363@gmail.com',433814363,NULL,NULL,11,'Doteng Gewog 2nd dinner gathering','events/205867-paro-dzong-paro-bhutan.webp',NULL,'To be confirm',1,3,'Perth',0,0,50.00,0.00,'Event','AUD','2025-10-25','18:00:00',0.0,0,NULL,0,'2025-10-09 14:01:30','2025-10-09 14:01:30',NULL,0.0,1,'General Admission',50.0,0,NULL,0.0,0,NULL,NULL),
(409,'Norbu Zangmo','nobzang25@gmail.com',17959043,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-09 14:40:29','2025-10-09 14:40:29',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(410,'Norbu Zangmo','nobzang25@gmail.com',17959043,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-09 14:40:30','2025-10-09 14:40:30',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(411,'Norbu Zangmo','nobzang25@gmail.com',17959043,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-09 14:40:33','2025-10-09 14:40:33',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(424,'Namgay Tshering','namgay2340@gmail.com',451081907,NULL,NULL,11,'Doteng Gewog 2nd dinner gathering','events/205867-paro-dzong-paro-bhutan.webp',7,'To be confirm',1,3,'Perth',2,0,50.00,0.00,'Event','AUD','2025-10-25','18:00:00',100.0,0,NULL,0,'2025-10-09 15:56:02','2025-10-09 15:56:02',NULL,0.0,0,'General Admission',50.0,2,NULL,0.0,0,NULL,NULL),
(425,'Nima Dema','dnimad2018@gmail.com',430001981,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-09 22:15:56','2025-10-09 22:15:56',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(426,'Singye Wangchuk','singye25wangchuk@gmail.com',413381225,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 01:53:42','2025-10-10 01:53:42',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(427,'Choki Wangmo','wangmochoki0911@gmail.com',430027190,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 03:38:24','2025-10-10 03:38:24',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(428,'Rinchen','wrinky92@gmail.com',426283766,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 04:18:00','2025-10-10 04:18:00',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(429,'Thinley Choden','chodenthinley1018@gmail.com',42648361,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 04:35:42','2025-10-10 04:35:42',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(430,'Namgay Lhendup','namgay.lhendup100@gmail.com',452565460,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 14:00:05','2025-10-10 14:00:05',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(431,'Namgay Lhendup','namgay.lhendup100@gmail.com',452565460,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 14:00:07','2025-10-10 14:00:07',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(432,'Sonam Norbu','snorbu.95@gmail.com',421804019,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 14:25:50','2025-10-10 14:25:50',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(433,'Sangay Thinley','bhapsangay@gmail.com',431460013,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 14:57:55','2025-10-10 14:57:55',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(434,'Sangay Thinley','bhapsangay@gmail.com',431460013,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 14:57:57','2025-10-10 14:57:57',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(435,'Duptho wangchuk','sharchopchochow@gmail.com',422349181,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 15:52:07','2025-10-10 15:52:07',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(436,'Duptho wangchuk','sharchopchochow@gmail.com',422349181,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 15:52:09','2025-10-10 15:52:09',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(437,'Duptho wangchuk','sharchopchochow@gmail.com',422349181,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 15:52:09','2025-10-10 15:52:09',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(438,'Duptho wangchuk','sharchopchochow@gmail.com',422349181,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 15:52:13','2025-10-10 15:52:13',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(439,'Duptho wangchuk','sharchopchochow@gmail.com',422349181,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',3,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 15:52:15','2025-10-10 15:52:15',NULL,0.0,0,NULL,0.0,3,NULL,0.0,0,NULL,NULL),
(440,'Duptho wangchuk','sharchopchochow@gmail.com',422349181,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',3,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 15:52:16','2025-10-10 15:52:16',NULL,0.0,0,NULL,0.0,3,NULL,0.0,0,NULL,NULL),
(441,'Sonam drimed','namgay2340@gmail.com',451081907,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-10 21:55:40','2025-10-10 21:55:40',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(442,'Yeahey Palden','yeshey.palden85@gmail.com',452584339,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-11 15:17:44','2025-10-11 15:17:44',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(443,'Yeahey Palden','yeshey.palden85@gmail.com',452584339,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-11 15:17:46','2025-10-11 15:17:46',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(444,'Tshoki Dorji','dorjit247@gmail.com',424702570,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-13 04:42:15','2025-10-13 04:42:15',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(445,'Brian Kipruto','borbrian339@gmail.com',404816435,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-13 04:56:59','2025-10-13 04:56:59',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(446,'Tshewang Rinzin','tshewangrinzin35@gmail.com',406586664,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-13 07:40:57','2025-10-13 07:40:57',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(447,'Dawa Tshering','dawatshering115@gmail.com',452641364,NULL,NULL,11,'Doteng Gewog 2nd dinner gathering','events/205867-paro-dzong-paro-bhutan.webp',NULL,'To be confirm',1,3,'Perth',2,0,50.00,0.00,'Event','AUD','2025-10-25','18:00:00',100.0,1,'2025-10-14 06:26:13',0,'2025-10-14 06:25:32','2025-10-14 06:26:13',NULL,0.0,0,'General Admission',50.0,2,NULL,0.0,0,NULL,NULL),
(448,'Dechen Tshomo','dtshomo29@gmail.com',432149821,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-14 07:16:32','2025-10-14 07:16:32',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(449,'Sangay Dema','sangaysjdema@gmail.com',452435021,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-14 07:23:30','2025-10-14 07:23:30',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(450,'Sonam Choden','schodensonamc7@gmail.co',422813087,NULL,NULL,11,'Doteng Gewog 2nd dinner gathering','events/205867-paro-dzong-paro-bhutan.webp',NULL,'To be confirm',1,3,'Perth',1,0,50.00,0.00,'Event','AUD','2025-10-25','18:00:00',50.0,0,NULL,0,'2025-10-14 09:30:57','2025-10-14 09:30:57',NULL,0.0,0,'General Admission',50.0,1,NULL,0.0,0,NULL,NULL),
(451,'Nachu','tsheringnachu123@gmail.com',452521997,NULL,NULL,11,'Doteng Gewog 2nd dinner gathering','events/205867-paro-dzong-paro-bhutan.webp',NULL,'To be confirm',1,3,'Perth',1,0,50.00,0.00,'Event','AUD','2025-10-25','18:00:00',50.0,1,'2025-10-14 12:32:27',0,'2025-10-14 12:30:44','2025-10-14 12:32:27',NULL,0.0,0,'General Admission',50.0,1,NULL,0.0,0,NULL,NULL),
(452,'Lungten Jamtsho','lungten20017@gmail.com',415219927,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-15 06:17:33','2025-10-15 06:17:33',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(453,'Chencho bidha','tsenchocb11@gmail.com',468927371,NULL,NULL,11,'Doteng Gewog 2nd dinner gathering','events/205867-paro-dzong-paro-bhutan.webp',NULL,'To be confirm',1,3,'Perth',1,0,50.00,0.00,'Event','AUD','2025-10-25','18:00:00',50.0,0,NULL,0,'2025-10-16 11:20:52','2025-10-16 11:20:52',NULL,0.0,0,'General Admission',50.0,1,NULL,0.0,0,NULL,NULL),
(454,'Phaju Wangmo','phajuwang@gmail.com',426844972,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-17 04:43:24','2025-10-17 04:43:24',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(455,'Phaju Wangmo','phajuwang@gmail.com',426844972,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-17 04:43:26','2025-10-17 04:43:26',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(456,'Phaju Wangmo','phajuwang@gmail.com',426844972,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-17 04:43:27','2025-10-17 04:43:27',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(457,'Karma Jimba Tharchen','karmaovs21@gmail.com',449989515,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-17 13:48:30','2025-10-17 13:48:30',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(458,'Karma Jimba Tharchen','karmaovs21@gmail.com',449989515,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-17 13:48:32','2025-10-17 13:48:32',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(459,'Karma Jimba Tharchen','karmaovs21@gmail.com',449989515,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-17 13:48:33','2025-10-17 13:48:33',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(460,'Karma Jimba Tharchen','karmaovs21@gmail.com',449989515,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-17 13:48:34','2025-10-17 13:48:34',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(461,'Karma Jimba Tharchen','karmaovs21@gmail.com',449989515,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-17 13:48:35','2025-10-17 13:48:35',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(462,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:40','2025-10-18 08:57:40',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(463,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:44','2025-10-18 08:57:44',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(464,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:46','2025-10-18 08:57:46',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(465,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:47','2025-10-18 08:57:47',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(466,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:48','2025-10-18 08:57:48',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(467,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:49','2025-10-18 08:57:49',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(468,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:53','2025-10-18 08:57:53',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(469,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:57','2025-10-18 08:57:57',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(470,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:58','2025-10-18 08:57:58',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(471,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:57:58','2025-10-18 08:57:58',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(472,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:58:00','2025-10-18 08:58:00',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(473,'Pema','tukulupukulu@gmail.com',451956698,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',2,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-18 08:58:01','2025-10-18 08:58:01',NULL,0.0,0,NULL,0.0,2,NULL,0.0,0,NULL,NULL),
(474,'Thinley Wangdi','tleyongdue16@gmail.com',415644110,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-19 05:15:07','2025-10-19 05:15:07',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(475,'Thinley Wangdi','tleyongdue16@gmail.com',415644110,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-19 05:15:10','2025-10-19 05:15:10',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(476,'Karma Tenzin','ktenzinbpc@gmail.com',426588570,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-19 11:15:35','2025-10-19 11:15:35',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(477,'Karma Tenzin','ktenzinbpc@gmail.com',426588570,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-19 11:15:37','2025-10-19 11:15:37',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(478,'Kuenzang Tobgay','ktobgay91@gmail.com',406844367,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-20 04:24:13','2025-10-20 04:24:13',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL),
(479,'Tashi Dorji','teedee3992@gmail.com',422051355,NULL,NULL,12,'Education & Opportunity Fair','events/432778009_122094036764256333_4479665714915215486_n.jpeg',NULL,'Bhutan Event House',1,3,'200 Balcatta Road',1,0,0.00,0.00,'Event','AUD','2025-11-01','13:00:00',0.0,1,NULL,0,'2025-10-20 07:34:24','2025-10-20 07:34:24',NULL,0.0,0,NULL,0.0,1,NULL,0.0,0,NULL,NULL);
/*!40000 ALTER TABLE `db_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_country`
--

DROP TABLE IF EXISTS `db_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_country`
--

LOCK TABLES `db_country` WRITE;
/*!40000 ALTER TABLE `db_country` DISABLE KEYS */;
INSERT INTO `db_country` VALUES
(1,'Australia');
/*!40000 ALTER TABLE `db_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_currency`
--

DROP TABLE IF EXISTS `db_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_currency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_currency`
--

LOCK TABLES `db_currency` WRITE;
/*!40000 ALTER TABLE `db_currency` DISABLE KEYS */;
INSERT INTO `db_currency` VALUES
(1,'AUD');
/*!40000 ALTER TABLE `db_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_event`
--

DROP TABLE IF EXISTS `db_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `poster_image` varchar(200) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `place` varchar(255) NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `price` decimal(8,1) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `street` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `owner_id` bigint(20) DEFAULT NULL,
  `economy_label` varchar(50) DEFAULT NULL,
  `economy_price` decimal(8,1) NOT NULL,
  `economy_quantity` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `vip_label` varchar(50) DEFAULT NULL,
  `vip_price` decimal(8,1) NOT NULL,
  `vip_quantity` int(11) NOT NULL,
  `general_label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `db_event_owner_id_07a045b3_fk_db_user_id` (`owner_id`),
  CONSTRAINT `db_event_owner_id_07a045b3_fk_db_user_id` FOREIGN KEY (`owner_id`) REFERENCES `db_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_event`
--

LOCK TABLES `db_event` WRITE;
/*!40000 ALTER TABLE `db_event` DISABLE KEYS */;
INSERT INTO `db_event` VALUES
(7,'Eminence Gaytsho Lopen Tenzin Norbu Rinpoche','eminence-gaytsho-lopen-tenzin-norbu-rinpoche','Visit of His Eminence Gaytsho Lopen Tenzin Norbu Rinpoche to Canberra (28 August – 8 September 2025). \r\nWe are pleased to inform you that His Eminence Gaytsho Lopen Tenzin Norbu Rinpoche, who is currently in Perth, will be visiting Canberra from 28th August to 8th September 2025. \r\nAs most of you are aware that Lopen Rinpoche is especially known for his healing and treatment of those affected by Za-Nay (epilepsy), as well as other illnesses and negative influences. There are many wonderful stories of people who have benefited from his guidance and care. Lopen Rinpoche is also widely respected for his Zhe-nga, Ngamar, Nga Chu, Jabthrue, and Kago practices, which bring healing and well-being. \r\nTherefore, while the Rinpoche is in Canberra, we will be organising these important spiritual programs at the Bhutanese Centre. This will be a special opportunity for community members who wish to receive healing or blessings, including Jabthrue, Ngamar, Nga Chu, and Kago, directly from Lopen Rinpoche.\r\nMore importantly, we will also have an opportunity to view the sacred relics of the Buddha and his great disciples that were brought from Thailand by Lopen Rinpoche. These relics will be displayed for our community members at the Centre. \r\nPlease follow our Facebook page for updates on Rinpoche’s program in Canberra. For further information, or if you wish to invite Lopen Rinpoche to your place, please contact Dorji Wangdi at 0452 621 813','events/524303515_1132364418938802_5941665498825743194_n.jpg',4,'Melrose High School','2025-08-28','10:59:53',0.0,1,1,1,'Australian National University Canberra ACT 2600 Australia','2025-08-25 11:00:31','2025-10-03 08:39:16',NULL,NULL,0.0,0,1,NULL,0.0,0,NULL),
(8,'Musical Concert – Namgay Jigs Live','musical-concert-namgay-jigs-live','Join us for an unforgettable evening of music and soulful melodies at Leederville Town Hall on Saturday, 6th September 2025 at 7:30 PM. Experience the unmatched versatility and heartfelt performances of Namgay Jigs, along with an incredible lineup of talented artists including Nospan Khotsha, Ugyen Lhamo, Tashi Yaso, Pema Zangshe, Dechen Dorji, Pem Zam, Ugyen Seldon, and Samten Dorji.\r\n\r\nLet the rhythms move you and the music inspire your heart. Don’t miss this magical night filled with passion, harmony, and the power of live performance.','events/WhatsApp_Image_2025-08-28_at_12.23.23.jpeg',6,'Leederville Town Hall','2025-09-06','19:30:00',30.0,1,1,3,'84 Cambridge St, West Leederville WA 6007','2025-08-28 03:48:11','2025-09-09 10:06:51',7,NULL,0.0,1,100,NULL,0.0,1,'General Admission'),
(9,'Doenchoe- Community DRA-MAA wang','doenchoe-community-dra-maa-wang','Doenchoe On 31st with Perth Doenchoe group lead by Tenzin Lhaden and team.\r\n\r\nDRA MAA wang at Canberra on 13th September.','events/rinpochen.jpeg',4,'Bunbury','2025-08-31','06:00:00',0.0,1,1,1,'Bunbury 135L Parade Road,Winthera WA 6230','2025-08-28 14:13:44','2025-10-03 08:39:16',NULL,NULL,0.0,0,1,NULL,0.0,0,NULL),
(11,'Doteng Gewog 2nd dinner gathering','doteng-gewog-2nd-dinner-gathering','All our friends from Doteng Gewog warmly invite you to an evening of delicious food and friendship.','events/205867-paro-dzong-paro-bhutan.webp',9,'To be confirm','2025-10-25','18:00:00',50.0,1,1,3,'Perth','2025-09-11 10:56:21','2025-10-09 06:31:17',7,NULL,0.0,0,1000,NULL,0.0,0,'General Admission'),
(12,'Education & Opportunity Fair','education-opportunity-fair','Education & Opportunity Fair – Registration Form\r\nJoin us at the Education & Opportunity Fair, a dynamic platform designed to connect learners, educators, and professionals. This event is your gateway to discovering new academic pathways, skill-building opportunities, and career prospects. By registering with KW INTERNATIONAL, you gain access to inspiring sessions, expert guidance, and networking opportunities that can help shape your future. Don’t miss this chance to explore, learn, and grow.','events/432778009_122094036764256333_4479665714915215486_n.jpeg',10,'Bhutan Event House','2025-11-01','13:00:00',0.0,1,1,3,'200 Balcatta Road','2025-10-03 04:48:01','2025-10-03 08:39:51',7,NULL,0.0,0,100,NULL,0.0,0,NULL);
/*!40000 ALTER TABLE `db_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_eventaccess`
--

DROP TABLE IF EXISTS `db_eventaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_eventaccess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `can_view` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_eventaccess`
--

LOCK TABLES `db_eventaccess` WRITE;
/*!40000 ALTER TABLE `db_eventaccess` DISABLE KEYS */;
INSERT INTO `db_eventaccess` VALUES
(2,1,'2025-09-08 13:10:54.725851','2025-09-08 13:10:54.725877',8,9),
(3,1,'2025-10-07 11:39:26.485570','2025-10-07 11:39:26.485596',12,9);
/*!40000 ALTER TABLE `db_eventaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_eventtype`
--

DROP TABLE IF EXISTS `db_eventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_eventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_eventtype`
--

LOCK TABLES `db_eventtype` WRITE;
/*!40000 ALTER TABLE `db_eventtype` DISABLE KEYS */;
INSERT INTO `db_eventtype` VALUES
(1,'Movie'),
(3,'Party'),
(4,'Religious'),
(5,'Birthday'),
(6,'Live show'),
(7,'Sport'),
(8,'Donation'),
(9,'Gathering'),
(10,'Meeting');
/*!40000 ALTER TABLE `db_eventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_film`
--

DROP TABLE IF EXISTS `db_film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `trailer` varchar(200) NOT NULL,
  `slug` varchar(400) DEFAULT NULL,
  `description` text DEFAULT '',
  `release_date` date DEFAULT NULL,
  `duration` int(10) unsigned NOT NULL DEFAULT 0,
  `genre` varchar(100) NOT NULL,
  `director` varchar(200) NOT NULL,
  `cast` text DEFAULT '',
  `language` varchar(100) NOT NULL,
  `poster_image` varchar(255) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_film`
--

LOCK TABLES `db_film` WRITE;
/*!40000 ALTER TABLE `db_film` DISABLE KEYS */;
INSERT INTO `db_film` VALUES
(2,'With Love From Bhutan','https://www.youtube.com/embed/eZHC0HkA4e8?si=rr6Te1WE55YyIcll','with-love-from-bhautan','Jimmy, an American Bhutanese food anthropology student, returns to Bhutan after twenty years. His mother, Jane, once ran the pioneering restaurant Pelbue before abruptly leaving Bhutan with Jimmy, but without her stepdaughter, Yangchen. Jane\'s sudden departure has left behind scars. Yangchen, his stepsister, feeling abandoned, grew up a loner, and found solace in Bhutan’s landscapes. Back in Bhutan, Jimmy stays with his friend Angay and attempts to reconnect with the now distant Yangchen','2025-02-25',2,'Romance','Charmi Chedda','Tashi Yoedsel Wangchuk, Tandin Bidha, Tshering Denkar, Kinga Dorji','Dzongkha','posters/withlo.jpg',7,'2025-02-24 20:39:08','2025-08-30 14:43:15'),
(35,'Drala','https://www.youtube.com/embed/3fnEM3l2toI?si=Cr2DTvODMc9Pteof','drala','We are thrilled to announce that Dorji Production House, renowned for its exceptional storytelling and high-quality productions, brings to Perth audiences the highly anticipated film, DRALA!\r\n\r\nThis cinematic gem, originating from the Kingdom of Bhutan, is a testament to the production house\'s commitment to excellence and cultural preservation. With its stunning visuals, captivating narrative, and rich cultural heritage, DRALA! promises to transport Perth\'s Bhutanese community and film enthusiasts alike to the breathtaking landscapes and spiritual heart of Bhutan. \r\n\r\nDon\'t miss this opportunity to experience the best of Bhutanese cinema, brought to you by Dorji Production House\'s dedication to quality storytelling. Get your tickets now and be a part of this unforgettable cinematic journey!',NULL,2,'Romance','Pema Dhendup','phuntsok dhonden, deki lhamo, jamyang tempa, pem tazee, lhamo dukpa, lhapsum t dorji, gem dorji, mum','Dzongkha','posters/drala_movie.jpeg',7,'2025-09-18 09:20:36','2025-09-18 09:30:08');
/*!40000 ALTER TABLE `db_film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_filmshow`
--

DROP TABLE IF EXISTS `db_filmshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_filmshow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slug` varchar(500) NOT NULL,
  `film_id` int(11) NOT NULL,
  `theater_name` varchar(255) NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time(6) NOT NULL,
  `adult` decimal(6,2) NOT NULL,
  `child` int(11) NOT NULL,
  `street` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `currency_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_filmshow_country_id_ea89cd6d_fk_db_country_id` (`country_id`),
  KEY `db_filmshow_currency_id_d5f59615_fk_db_currency_id` (`currency_id`),
  KEY `db_filmshow_state_id_97266eba_fk_db_state_id` (`state_id`),
  CONSTRAINT `db_filmshow_country_id_ea89cd6d_fk_db_country_id` FOREIGN KEY (`country_id`) REFERENCES `db_country` (`id`),
  CONSTRAINT `db_filmshow_currency_id_d5f59615_fk_db_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `db_currency` (`id`),
  CONSTRAINT `db_filmshow_state_id_97266eba_fk_db_state_id` FOREIGN KEY (`state_id`) REFERENCES `db_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_filmshow`
--

LOCK TABLES `db_filmshow` WRITE;
/*!40000 ALTER TABLE `db_filmshow` DISABLE KEYS */;
INSERT INTO `db_filmshow` VALUES
(61,'drala-kim-beazley-lecture-theatre-wa-sep-20',35,'Kim Beazley Lecture Theatre','2025-09-21','18:30:00.000000',30.00,0,'Murdoch University, 350, Building 351/90 South St, Murdoch','2025-09-18 09:22:39.373922','2025-09-18 10:59:04.907008',1,1,3);
/*!40000 ALTER TABLE `db_filmshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_filmshowaccess`
--

DROP TABLE IF EXISTS `db_filmshowaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_filmshowaccess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `can_view` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `film_show_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_filmshowaccess`
--

LOCK TABLES `db_filmshowaccess` WRITE;
/*!40000 ALTER TABLE `db_filmshowaccess` DISABLE KEYS */;
INSERT INTO `db_filmshowaccess` VALUES
(3,1,'2025-09-18 10:54:27.144208','2025-09-18 10:54:27.144254',61,19),
(4,1,'2025-09-18 11:00:42.218749','2025-09-18 11:00:42.218793',61,9);
/*!40000 ALTER TABLE `db_filmshowaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_state`
--

DROP TABLE IF EXISTS `db_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `state_short` varchar(500) DEFAULT NULL,
  `country_id` bigint(20) NOT NULL,
  `time_zone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_state_country_id_29ec663f_fk_db_country_id` (`country_id`),
  CONSTRAINT `db_state_country_id_29ec663f_fk_db_country_id` FOREIGN KEY (`country_id`) REFERENCES `db_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_state`
--

LOCK TABLES `db_state` WRITE;
/*!40000 ALTER TABLE `db_state` DISABLE KEYS */;
INSERT INTO `db_state` VALUES
(1,'Australian Capital Territory','act',1,''),
(3,'Western Australia','wa',1,''),
(5,'New South Wales','nsw',1,''),
(6,'Victoria','vic',1,''),
(7,'Queensland','qld',1,''),
(8,'Tasmania','tas',1,''),
(10,'Northern Territory','nt',1,''),
(11,'South Australia','sa',1,'');
/*!40000 ALTER TABLE `db_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_suburb`
--

DROP TABLE IF EXISTS `db_suburb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_suburb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_suburb_state_id_a58414c6_fk_db_state_id` (`state_id`),
  CONSTRAINT `db_suburb_state_id_a58414c6_fk_db_state_id` FOREIGN KEY (`state_id`) REFERENCES `db_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_suburb`
--

LOCK TABLES `db_suburb` WRITE;
/*!40000 ALTER TABLE `db_suburb` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_suburb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_user`
--

DROP TABLE IF EXISTS `db_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `slug` varchar(450) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `gender` varchar(500) NOT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_partner` tinyint(1) NOT NULL,
  `password` varchar(500) NOT NULL,
  `is_user` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_user`
--

LOCK TABLES `db_user` WRITE;
/*!40000 ALTER TABLE `db_user` DISABLE KEYS */;
INSERT INTO `db_user` VALUES
(7,'namgay2340@gmail.com','namgay-tshering','Namgay Tshering','namgay-tshering',451081907,'Male','user/profile/user_default.jpg',1,1,1,1,'pbkdf2_sha256$1000000$tHuGiYtVNZkPPS1tJ25VBk$pB6Ie0BQwJn0FL3YVbPi2a4GKXzhWEN1GERiOZZUOqo=',1,0,'2025-03-18 07:29:16.000000','2025-10-09 05:17:02.937370'),
(9,'minjurdorji363@gmail.com','minjur','Minjur','minjur',433814363,'Male','user/profile/user_default.jpg',0,1,0,1,'pbkdf2_sha256$1000000$8vL7jVC0WFNwDvC8etcvCE$QX95eRRJpA27vmS8FtAT7pQkbZDk/q7IwlgkvorDDMA=',1,0,'2025-04-01 17:34:38.527376','2025-10-20 06:07:33.913145'),
(10,'prem12@gmail.com','prem','Prem','prem',422864910,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$870000$NvgQRe1SR0j4D3YCH7Eszh$ysLwKWx/VqcxdAlBuBFSb/aGNIbfEWyCwcJpgA+MO+I=',1,0,'2025-05-13 12:16:22.357177','2025-05-13 12:16:30.639024'),
(16,'kindor2409@gmail.com','kunzang-dorji','Kunzang Dorji','kunzang-dorji',432245090,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$ZSAH0VAuWWCPEnDwlwM5u0$KNYckR3KXg+CRf3QQ6PzM55kY08Yz87FOH8APbEYaxs=',1,0,'2025-08-28 11:36:10.742463','2025-08-28 11:36:30.713845'),
(19,'bhutaneventhouse@gmail.com','','Bhutan Event House','bhutaneventhouse',451070084,'Female','user/profile/user_default.jpg',0,1,0,1,'pbkdf2_sha256$1000000$UvqxzE2yJnO2VriZC8377O$gwqR+P0VHWyydVnuxlr6H2DibyTMA6stF0mnwAGijUY=',1,0,'2025-08-28 15:02:14.916307','2025-09-18 10:54:10.162300'),
(20,'tugyen085@gmail.com','ugyen-tshering','Ugyen tshering','ugyen-tshering',493690314,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$0P25q6hinVRjH4ZhzODf16$zS1YhU0eEWHG9KTMdGJ9msT0zkQ2cGP1ePzaBFXOalA=',1,0,'2025-08-28 22:35:39.724656','2025-08-28 22:36:08.343388'),
(21,'tshering802000@gmail.com','tshering-dukpa','Tshering Dukpa','tshering-dukpa',432456430,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$gs1FVIHG3e5Iw6Nuhpgpb3$jMnihfUUEcaGqU3ZaVN7mj8oTv/ezd6BjFkR4vng1G4=',1,0,'2025-08-28 22:58:16.569494','2025-08-29 02:49:12.336780'),
(22,'norbupema58@gmail.com','pema-norbu','Pema Norbu','pema-norbu',77215090,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$9A6iMWlRQDQUmizlXVspzP$zN2QqcrWO8SRasCYSRD44xaGSnLX5JPMl91kyIGWl2Y=',1,0,'2025-08-29 02:22:50.747949','2025-08-29 02:22:50.747989'),
(23,'pemanorbu54@gmail.com','pema-norbu-nqvr','Pema Norbu','pema-norbu-nqvr',77215090,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$qj5Nl5vzVGFg5ixsSAjsaR$q+ef3zU2UzFt0vs4wi1twFgUC8O0hysz896h8JkK/hI=',1,0,'2025-08-29 02:26:50.035037','2025-08-29 02:26:50.035084'),
(24,'tdendup987@gmail.com','tshering-dendup','Tshering Dendup','tshering-dendup',426604163,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$LIIURqI5hIu1QutdcOlGro$eCE1R/E6bgJx2QNnvZtBK6rAEH+I6HOUzNLL384u9hI=',1,0,'2025-08-29 10:30:50.437873','2025-08-29 10:32:36.177179'),
(25,'cnorbu11@gmail.com','chencho-norbu','Chencho Norbu','chencho-norbu',479006230,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$yxSXKF8RfQYVRaYXs7cw0s$Xy4YTWrfE7AWZxOVW2l4jm1sgz/dGR04kfTVnggKur4=',1,0,'2025-08-29 14:53:52.472987','2025-08-29 14:54:20.018399'),
(26,'tsheringjordan@gmail.com','tshering-dorji','Tshering Dorji','tshering-dorji',450039984,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$rEkKv3qV8FqEJlXJvs4Ses$IAezn0ZR0HL3QXoQh7fZkmvEgRr7lX/AkHKJerY8r2o=',1,0,'2025-08-30 09:56:01.391313','2025-08-30 09:56:17.250202'),
(27,'kinleyd860@gmail.com','kinley-dorji','KINLEY DORJI','kinley-dorji',415710131,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$hWAVDmfEuITN3ikrY9wsJR$yu1sElkHQ9oom+XT5Ro99VqAnbuIYHdYi22geGZMdZk=',1,0,'2025-08-31 02:37:30.574360','2025-08-31 02:38:03.605757'),
(28,'thinleyrabgay92@gmail.com','thinley-rabgay','Thinley Rabgay','thinley-rabgay',466301917,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$TLyQxHuFzFF9qffcfooqlX$tefnNJ62AHGLy19LN8clVxGxxGhGxSuJO6/Wpkihpxo=',1,0,'2025-08-31 04:03:37.608928','2025-08-31 04:03:52.747690'),
(29,'choden447@gmail.com','sangay-choden','Sangay Choden','sangay-choden',449742275,'Female','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$qbv50aD5211uLOLCqNmspv$4IBwWJKdbK148pjUrl1ke5QBpcx1He/XQaZv2xt8aOI=',1,0,'2025-09-02 11:11:06.929514','2025-09-02 11:11:06.929550'),
(30,'yeshilobesa@gmail.com','yeshi-lobesa','Yeshi Lobesa','yeshi-lobesa',468809007,'Female','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$x3cZKIdajD1fbyvZBNmUrD$vmjRBLmN9H2BQQnmxgPURQ/umehMYh08YhcGtAqXjN0=',1,0,'2025-09-04 11:17:35.308412','2025-09-04 11:18:01.767668'),
(31,'sonamchodup@gmail.com','sonam-chedup','Sonam Chedup','sonam-chedup',426010342,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$n6zN7ckHmbsQpgNbzEMA4Z$A06o5GUagBKtHhHZsSFLtMzBh7LoVxyLxE61x8j7fr8=',1,0,'2025-09-11 11:40:41.716620','2025-09-11 11:41:23.004012'),
(32,'phubdoz55@gmail.com','phub-dorji','Phub Dorji','phub-dorji',414289262,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$hk88vt0Ny3z0lL4MNWCPSM$TI9I5oU1iDKBmFpEm9QkQK4DIieInnr4f+x9CatPWQY=',1,0,'2025-09-11 13:53:33.446200','2025-09-11 13:54:26.567933'),
(153,'somschuu44@gmail.com','sonam-wangchuk','Sonam wangchuk','sonam-wangchuk',17819109,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$Lm4nvR7GQBHTapjimtynxK$bGR63e/KZ4GAT1vsQjCtDn3T8oPhpzAY2Dcwa/SBeg8=',1,0,'2025-09-22 06:43:58.606544','2025-09-22 06:43:58.606581'),
(154,'sonamwangchuk58@education.gov.bt','sonam-wangchuk-iib2','Sonam wangchuk','sonam-wangchuk-iib2',17819109,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$mP3jcGj8yjWo0PBJc6aY3M$MMFNstK85WvoLSnVVhM0GxPmPP/0ua8Sv4EYKyMsSyo=',1,0,'2025-09-22 06:45:23.962838','2025-09-24 14:57:25.050594'),
(155,'stobgay803@gmail.com','sonam-tobgay','Sonam Tobgay','sonam-tobgay',420752528,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$OHcUqyRYx1XDs5JTm58lPP$Co3SzjDuSgcMpFoQhBF4uCzj3iyuOD/cJXLRBIKDHq4=',1,0,'2025-09-22 09:43:24.355922','2025-09-22 09:43:54.580627'),
(525,'tphuntsho274@gmail.com','tenzin-phuntsho','Tenzin Phuntsho','tenzin-phuntsho',414824533,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$yT1NSB0f7HvaUmHnBLczZJ$7yJOXFU/CBxaxLR/YZBcMqhnMYqn7h+YXLNJwT4R7cQ=',1,0,'2025-10-03 02:46:12.567942','2025-10-03 02:46:32.054775'),
(720,'dechendorji3126@gmail.com','dechen-dorji','Dechen Dorji','dechen-dorji',452585932,'Male','user/profile/user_default.jpg',0,1,0,0,'pbkdf2_sha256$1000000$xGjmTP3okE6OqorMfwYnOU$4Wsfr7YgalEJlfPcf0nGneiuGXEJTnPGeQWOX6tEAFQ=',1,0,'2025-10-15 10:22:48.090985','2025-10-15 10:23:20.044813');
/*!40000 ALTER TABLE `db_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2025-02-25 07:32:39.000000','2','dechen',1,'[{\"added\": {}}]',4,1),
(2,'2025-02-25 07:32:56.000000','2','dechen',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\"]}}]',4,1),
(3,'2025-02-25 07:36:40.000000','1','Dechen Wangmo',1,'[{\"added\": {}}]',11,1),
(4,'2025-02-25 07:37:06.000000','1','with love from bhutan',1,'[{\"added\": {}}]',14,1),
(5,'2025-02-25 07:39:08.000000','2','with love from bhaut',1,'[{\"added\": {}}]',14,1),
(6,'2025-02-25 07:45:00.000000','1','Australia',1,'[{\"added\": {}}]',7,1),
(7,'2025-02-25 07:45:04.000000','1','AUD',1,'[{\"added\": {}}]',8,1),
(8,'2025-02-25 07:45:15.000000','1','Canberra',1,'[{\"added\": {}}]',9,1),
(9,'2025-02-25 07:45:38.000000','1','with love from bhaut - Canberr',1,'[{\"added\": {}}]',12,1),
(10,'2025-02-25 07:46:58.000000','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Cast\"]}}]',14,1),
(11,'2025-02-25 07:55:41.000000','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Poster image\"]}}]',14,1),
(12,'2025-02-25 08:24:47.000000','3','Yuel na Relpa',1,'[{\"added\": {}}]',14,1),
(13,'2025-02-26 11:02:47.000000','2','Yuel na Relpa - Canberra',1,'[{\"added\": {}}]',12,1),
(14,'2025-02-28 06:51:52.000000','3','With Love From Bhutan - Perth',1,'[{\"added\": {}}]',12,1),
(15,'2025-02-28 06:55:55.000000','1','Movie',1,'[{\"added\": {}}]',15,1),
(16,'2025-02-28 06:55:59.000000','2','Part',1,'[{\"added\": {}}]',15,1),
(17,'2025-02-28 06:56:05.000000','3','Party',1,'[{\"added\": {}}]',15,1),
(18,'2025-02-28 06:56:14.000000','4','Religious',1,'[{\"added\": {}}]',15,1),
(19,'2025-02-28 06:56:17.000000','5','Birthday',1,'[{\"added\": {}}]',15,1),
(20,'2025-02-28 06:59:50.000000','3','Yuel na Relpa',2,'[{\"changed\": {\"fields\": [\"Type\"]}}]',14,1),
(21,'2025-02-28 06:59:54.000000','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Type\"]}}]',14,1),
(22,'2025-02-28 07:01:42.000000','4','Party event',1,'[{\"added\": {}}]',14,1),
(23,'2025-02-28 07:05:38.000000','5','Zoelwa',1,'[{\"added\": {}}]',14,1),
(24,'2025-02-28 07:06:19.000000','5','Zoelwa',2,'[{\"changed\": {\"fields\": [\"Poster image\"]}}]',14,1),
(25,'2025-02-28 07:06:44.000000','5','Zoelwa',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',14,1),
(26,'2025-02-28 07:31:35.000000','1','Party the Event of the Year',1,'[{\"added\": {}}]',16,1),
(27,'2025-02-28 07:34:36.000000','2','H.E. Drubwang Sangay Dorji Rinpoche',1,'[{\"added\": {}}]',16,1),
(28,'2025-02-28 07:37:41.000000','3','Special Events',1,'[{\"added\": {}}]',16,1),
(29,'2025-02-28 07:38:49.000000','3','Special Events',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',16,1),
(30,'2025-02-28 07:38:53.000000','2','H.E. Drubwang Sangay Dorji Rinpoche',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',16,1),
(31,'2025-02-28 07:38:57.000000','1','Party the Event of the Year',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',16,1),
(32,'2025-02-28 07:48:16.000000','3','Special Events',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',16,1),
(33,'2025-02-28 07:48:20.000000','2','H.E. Drubwang Sangay Dorji Rinpoche',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',16,1),
(34,'2025-02-28 07:48:23.000000','1','Party the Event of the Year',2,'[]',16,1),
(35,'2025-02-28 07:48:26.000000','1','Party the Event of the Year',2,'[]',16,1),
(36,'2025-02-28 07:48:30.000000','2','H.E. Drubwang Sangay Dorji Rinpoche',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',16,1),
(37,'2025-02-28 07:48:34.000000','3','Special Events',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',16,1),
(38,'2025-02-28 07:48:38.000000','3','Special Events',2,'[]',16,1),
(39,'2025-02-28 20:42:50.000000','4','Kuma Sagar & The Khwopaa - Live in Canberra',1,'[{\"added\": {}}]',16,1),
(40,'2025-03-02 03:17:39.000000','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Trailer\"]}}]',14,1),
(41,'2025-03-02 03:19:13.000000','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Trailer\"]}}]',14,1),
(42,'2025-03-02 03:19:58.000000','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Trailer\"]}}]',14,1),
(43,'2025-03-02 03:21:48.000000','5','Zoelwa',2,'[{\"changed\": {\"fields\": [\"Trailer\"]}}]',14,1),
(44,'2025-03-02 03:22:17.000000','3','Yuel na Relpa',2,'[{\"changed\": {\"fields\": [\"Trailer\"]}}]',14,1),
(45,'2025-03-02 10:59:36.000000','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Trailer\"]}}]',14,3),
(46,'2025-03-02 10:59:54.000000','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Trailer\"]}}]',14,3),
(47,'2025-03-02 11:00:11.000000','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Trailer\"]}}]',14,3),
(61,'2025-05-16 09:18:27.891447','5','KRODHIKALI HUNDRED THOUSAND FEAST OFFERING SENGHE DZONG',1,'[{\"added\": {}}]',16,7),
(62,'2025-05-17 23:57:53.794602','36','Kim Beazley Lecture Theatre, Perth: May-18, 12:00 PM ',3,'',12,7),
(63,'2025-05-17 23:58:01.361314','29','Keza Chodey – The Unfinished Love',3,'',14,7),
(64,'2025-05-18 00:02:35.574043','30','Keza Chodey – The Unfinished Love',3,'',14,7),
(65,'2025-05-27 08:09:51.379447','6','Laytshog Lopen Rinpoche’s Visit to Canberra | 27 May – 2 June 2025',1,'[{\"added\": {}}]',16,7),
(66,'2025-06-08 13:20:06.881293','193','Booking by None',3,'',13,7),
(67,'2025-06-08 13:20:25.430997','181','Booking by None',3,'',13,7),
(68,'2025-06-08 13:20:25.431041','177','Booking by None',3,'',13,7),
(69,'2025-06-08 13:20:25.431065','166','Booking by None',3,'',13,7),
(70,'2025-06-08 13:20:25.431087','163','Booking by None',3,'',13,7),
(71,'2025-06-08 13:20:25.431108','156','Booking by None',3,'',13,7),
(72,'2025-06-08 13:20:25.431129','155','Booking by None',3,'',13,7),
(73,'2025-07-30 10:33:24.970022','4','Brisban',1,'[{\"added\": {}}]',9,7),
(74,'2025-07-30 10:34:00.566878','5','New South Wales',1,'[{\"added\": {}}]',9,7),
(75,'2025-07-30 10:34:08.326025','6','Victoria',1,'[{\"added\": {}}]',9,7),
(76,'2025-07-30 10:34:14.415013','7','Queensland',1,'[{\"added\": {}}]',9,7),
(77,'2025-07-30 10:34:30.030082','8','Tasmania',1,'[{\"added\": {}}]',9,7),
(78,'2025-07-30 10:34:42.233614','9','Australian Capital Territory',1,'[{\"added\": {}}]',9,7),
(79,'2025-07-30 10:34:49.106756','10','Northern Territory',1,'[{\"added\": {}}]',9,7),
(80,'2025-07-30 10:35:11.809186','11','South Australia',1,'[{\"added\": {}}]',9,7),
(81,'2025-07-30 10:35:24.658273','3','Western Australia',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,7),
(82,'2025-07-30 10:35:29.248727','4','Brisban',3,'',9,7),
(83,'2025-07-30 10:35:40.963640','9','Australian Capital Territory',3,'',9,7),
(84,'2025-07-30 10:35:47.539201','1','Australian Capital Territory',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,7),
(85,'2025-07-30 10:48:36.607243','38','Canberra college, Australian Capital Territory: Jun-28, 12:00 PM ',3,'',12,7),
(86,'2025-07-30 10:48:36.607310','35','Canberra college, Australian Capital Territory: Apr-30, 12:00 PM ',3,'',12,7),
(87,'2025-07-30 10:48:36.607348','34','Canberra college, Australian Capital Territory: May-02, 03:00 AM ',3,'',12,7),
(88,'2025-07-30 10:48:36.607382','27','Canberra college, Australian Capital Territory: Mar-27, 12:00 PM ',3,'',12,7),
(89,'2025-07-31 10:47:01.057013','32','Dasho Driver',2,'[{\"changed\": {\"fields\": [\"Title\", \"Duration\"]}}]',14,7),
(90,'2025-07-31 10:51:57.863485','32','Dasho Driver',2,'[{\"changed\": {\"fields\": [\"Trailer\", \"Duration\"]}}]',14,7),
(91,'2025-07-31 13:04:41.414884','33','Mawong Lyonchen',1,'[{\"added\": {}}]',14,7),
(92,'2025-08-01 02:24:39.085983','2','With Love From Bhutan',2,'[{\"changed\": {\"fields\": [\"Slug\", \"Duration\"]}}]',14,7),
(93,'2025-08-10 10:15:58.994753','5','The Krodhikali Hundred Thousand Feast Offering was held at Senghe Dzong',2,'[{\"changed\": {\"fields\": [\"Title\", \"Price\"]}}]',16,7),
(94,'2025-08-10 11:09:54.071344','6','Laytshog Lopen Rinpoche’s Visit to Canberra',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',16,7),
(95,'2025-08-10 13:26:21.784582','34','Echoes of the Dragon Kingdom',2,'[{\"changed\": {\"fields\": [\"Duration\", \"Poster image\"]}}]',14,7),
(96,'2025-08-10 13:35:24.024258','34','Echoes of the Dragon Kingdom',2,'[{\"changed\": {\"fields\": [\"Duration\", \"Poster image\"]}}]',14,7),
(97,'2025-08-10 13:35:57.671670','34','Echoes of the Dragon Kingdom',2,'[{\"changed\": {\"fields\": [\"Duration\", \"Poster image\"]}}]',14,7),
(98,'2025-08-13 09:26:24.487930','214','Booking by The Monk and the Gun',3,'',13,7),
(99,'2025-08-13 09:26:24.487986','213','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(100,'2025-08-13 09:26:24.488019','212','Booking by None',3,'',13,7),
(101,'2025-08-13 09:26:24.488048','211','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(102,'2025-08-13 09:26:24.488076','210','Booking by The Monk and the Gun',3,'',13,7),
(103,'2025-08-13 09:26:24.488102','209','Booking by Mawong Lyonchen',3,'',13,7),
(104,'2025-08-13 09:26:24.488126','208','Booking by None',3,'',13,7),
(105,'2025-08-13 09:26:24.488150','207','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(106,'2025-08-13 09:26:24.488175','206','Booking by Zoelwa',3,'',13,7),
(107,'2025-08-13 09:26:24.488199','205','Booking by Dasho Driver',3,'',13,7),
(108,'2025-08-13 09:26:24.488223','204','Booking by Dasho Driver',3,'',13,7),
(109,'2025-08-13 09:26:24.488247','203','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(110,'2025-08-13 09:26:24.488271','202','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(111,'2025-08-13 09:26:24.488295','201','Booking by The Monk and the Gun',3,'',13,7),
(112,'2025-08-13 09:26:24.488318','200','Booking by Dasho Driver',3,'',13,7),
(113,'2025-08-13 09:26:24.488342','199','Booking by The Monk and the Gun',3,'',13,7),
(114,'2025-08-13 09:26:24.488365','198','Booking by The Monk and the Gun',3,'',13,7),
(115,'2025-08-13 09:26:24.488389','197','Booking by The Monk and the Gun',3,'',13,7),
(116,'2025-08-13 09:26:24.488413','196','Booking by Mawong Lyonchen',3,'',13,7),
(117,'2025-08-13 09:26:24.488459','195','Booking by The Monk and the Gun',3,'',13,7),
(118,'2025-08-13 09:26:24.488483','194','Booking by With Love From Bhutan',3,'',13,7),
(119,'2025-08-13 09:26:24.488506','192','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(120,'2025-08-13 09:26:24.488529','191','Booking by With Love From Bhutan',3,'',13,7),
(121,'2025-08-13 09:26:24.488552','190','Booking by The Monk and the Gun',3,'',13,7),
(122,'2025-08-13 09:26:24.488575','189','Booking by The Monk and the Gun',3,'',13,7),
(123,'2025-08-13 09:26:24.488599','188','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(124,'2025-08-13 09:26:24.488623','187','Booking by With Love From Bhutan',3,'',13,7),
(125,'2025-08-13 09:26:24.488646','186','Booking by The Monk and the Gun',3,'',13,7),
(126,'2025-08-13 09:26:24.488670','185','Booking by The Monk and the Gun',3,'',13,7),
(127,'2025-08-13 09:26:24.488693','184','Booking by The Monk and the Gun',3,'',13,7),
(128,'2025-08-13 09:26:24.488715','183','Booking by With Love From Bhutan',3,'',13,7),
(129,'2025-08-13 09:26:24.488738','180','Booking by The Monk and the Gun',3,'',13,7),
(130,'2025-08-13 09:26:24.488761','179','Booking by The Monk and the Gun',3,'',13,7),
(131,'2025-08-13 09:26:24.488793','178','Booking by With Love From Bhutan',3,'',13,7),
(132,'2025-08-13 09:26:24.488817','176','Booking by The Monk and the Gun',3,'',13,7),
(133,'2025-08-13 09:26:24.488841','175','Booking by The Monk and the Gun',3,'',13,7),
(134,'2025-08-13 09:26:24.488864','174','Booking by The Monk and the Gun',3,'',13,7),
(135,'2025-08-13 09:26:24.488887','173','Booking by With Love From Bhutan',3,'',13,7),
(136,'2025-08-13 09:26:24.488910','171','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(137,'2025-08-13 09:26:24.488933','170','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(138,'2025-08-13 09:26:24.489797','168','Booking by With Love From Bhutan',3,'',13,7),
(139,'2025-08-13 09:26:24.489829','167','Booking by The Monk and the Gun',3,'',13,7),
(140,'2025-08-13 09:26:24.489854','165','Booking by The Monk and the Gun',3,'',13,7),
(141,'2025-08-13 09:26:24.489878','164','Booking by The Monk and the Gun',3,'',13,7),
(142,'2025-08-13 09:26:24.489901','162','Booking by The Monk and the Gun',3,'',13,7),
(143,'2025-08-13 09:26:24.489924','161','Booking by The Monk and the Gun',3,'',13,7),
(144,'2025-08-13 09:26:24.489947','160','Booking by The Monk and the Gun',3,'',13,7),
(145,'2025-08-13 09:26:24.489970','159','Booking by Yuel na Relpa',3,'',13,7),
(146,'2025-08-13 09:26:24.489992','158','Booking by With Love From Bhutan',3,'',13,7),
(147,'2025-08-13 09:26:24.490015','157','Booking by Lunana: A Yak in the Classroom',3,'',13,7),
(148,'2025-08-13 09:26:24.490037','154','Booking by With Love From Bhutan',3,'',13,7),
(149,'2025-08-18 09:46:51.477464','11','South Australia',2,'[{\"changed\": {\"fields\": [\"State short\"]}}]',9,7),
(150,'2025-08-18 09:46:57.528235','10','Northern Territory',2,'[{\"changed\": {\"fields\": [\"State short\"]}}]',9,7),
(151,'2025-08-18 09:47:10.246927','8','Tasmania',2,'[{\"changed\": {\"fields\": [\"State short\"]}}]',9,7),
(152,'2025-08-18 09:47:27.145871','7','Queensland',2,'[{\"changed\": {\"fields\": [\"State short\"]}}]',9,7),
(153,'2025-08-18 09:47:36.451963','7','Queensland',2,'[{\"changed\": {\"fields\": [\"State short\"]}}]',9,7),
(154,'2025-08-18 09:47:41.157696','6','Victoria',2,'[{\"changed\": {\"fields\": [\"State short\"]}}]',9,7),
(155,'2025-08-18 09:47:46.025453','5','New South Wales',2,'[{\"changed\": {\"fields\": [\"State short\"]}}]',9,7),
(156,'2025-08-18 09:47:49.805814','3','Western Australia',2,'[{\"changed\": {\"fields\": [\"State short\"]}}]',9,7),
(157,'2025-08-18 09:47:54.618738','1','Australian Capital Territory',2,'[{\"changed\": {\"fields\": [\"State short\"]}}]',9,7),
(158,'2025-08-19 10:55:17.882375','46','Canberra college, Australian Capital Territory: Aug-20, 02:00 PM ',2,'[]',12,7),
(159,'2025-08-20 08:51:42.468606','46','Canberra college, Australian Capital Territory: Aug-20, 02:00 PM ',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,7),
(160,'2025-08-20 08:52:45.569800','46','Canberra college, Australian Capital Territory: Aug-20, 02:00 PM ',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,7),
(161,'2025-08-20 13:43:05.755991','49','Gangaline college, Australian Capital Territory: Aug-20, 12:00 PM ',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,7),
(162,'2025-08-20 13:44:07.967524','41','canberra, Victoria: Aug-01, 04:00 PM ',3,'',12,7),
(163,'2025-08-20 13:44:07.967593','39','Canberra college, Northern Territory: Jul-31, 12:00 AM ',3,'',12,7),
(164,'2025-08-20 13:44:07.967637','37','Kim Beazley Lecture Theatre, Murdoch University, Western Australia: May-18, 12:00 PM ',3,'',12,7),
(165,'2025-08-20 13:44:07.967677','33','Griffin Center, Australian Capital Territory: Apr-18, 05:30 PM ',3,'',12,7),
(166,'2025-08-20 13:44:07.967714','32','Perth College, Western Australia: Apr-10, 06:00 PM ',3,'',12,7),
(167,'2025-08-20 13:44:07.967751','31','Canberra college, Australian Capital Territory: Apr-01, 06:00 PM ',3,'',12,7),
(168,'2025-08-20 13:44:07.967786','30','Melrose High School Theater, Australian Capital Territory: Mar-31, 06:00 PM ',3,'',12,7),
(169,'2025-08-20 13:44:07.967821','29','Australian National University, Australian Capital Territory: Mar-31, 06:30 PM ',3,'',12,7),
(170,'2025-08-20 13:44:07.967857','23','Perth College New, Western Australia: Mar-27, 12:00 PM ',3,'',12,7),
(171,'2025-08-20 13:44:40.861076','47','lasted, Australian Capital Territory: Aug-20, 12:00 PM ',3,'',12,7),
(172,'2025-08-20 13:44:40.861137','46','Canberra college, Australian Capital Territory: Aug-20, 02:00 PM ',3,'',12,7),
(173,'2025-08-20 13:44:40.861173','43','ANU lecture Theater, Australian Capital Territory: Aug-13, 02:00 PM ',3,'',12,7),
(174,'2025-08-21 09:46:04.183836','4','Kuma Sagar & The Khwopaa - Live in Canberra',2,'[]',16,7),
(175,'2025-08-21 09:46:35.805098','4','Kuma Sagar & The Khwopaa - Live in Canberra',2,'[{\"changed\": {\"fields\": [\"Poster image\"]}}]',16,7),
(176,'2025-08-24 10:11:37.131575','15','hsklveihkn',3,'',11,7),
(177,'2025-08-24 10:11:37.131632','14','uqudmltlyn',3,'',11,7),
(178,'2025-08-24 10:11:37.131664','13','ozddlowlpf',3,'',11,7),
(179,'2025-08-24 10:11:37.131691','12','dmqeylnyrh',3,'',11,7),
(180,'2025-08-24 10:11:37.131717','11','nxzuhtmnjf',3,'',11,7),
(181,'2025-08-25 11:00:31.821227','7','Eminence Gaytsho Lopen Tenzin Norbu Rinpoche',1,'[{\"added\": {}}]',16,7),
(182,'2025-08-26 10:06:55.038662','226','Booking by Echoes of the Dragon Kingdom',3,'',13,7),
(183,'2025-08-26 10:06:55.038721','224','Booking by Mawong Lyonchen',3,'',13,7),
(184,'2025-08-26 10:06:55.038755','220','Booking by Echoes of the Dragon Kingdom',3,'',13,7),
(185,'2025-08-26 10:07:01.846785','52','Canberra college, Victoria: Sep-06, 12:00 PM ',3,'',12,7),
(186,'2025-08-26 10:07:01.846847','51','Perth college, Western Australia: Aug-29, 12:00 PM ',3,'',12,7),
(187,'2025-08-26 10:07:01.846890','50','Gangaline college, Australian Capital Territory: Aug-29, 12:00 PM ',3,'',12,7),
(188,'2025-08-26 10:07:01.846930','49','Gangaline college, Australian Capital Territory: Aug-20, 12:00 PM ',3,'',12,7),
(189,'2025-08-26 10:07:01.846968','48','Melrose high school, Australian Capital Territory: Aug-21, 12:00 PM ',3,'',12,7),
(190,'2025-08-26 10:07:01.847005','45','Palace Cinemas Raine Square, Western Australia: Aug-21, 06:00 PM ',3,'',12,7),
(191,'2025-08-26 10:07:01.847039','44','Dendy Cinema, Australian Capital Territory: Aug-12, 06:00 PM ',3,'',12,7),
(192,'2025-08-26 10:07:01.847074','42','canberra, Tasmania: Aug-04, 12:00 PM ',3,'',12,7),
(193,'2025-08-26 10:07:01.847110','40','Canberra college, Australian Capital Territory: Aug-05, 07:00 PM ',3,'',12,7),
(194,'2025-08-26 10:23:56.273541','34','Echoes of the Dragon Kingdom',3,'',14,7),
(195,'2025-08-26 10:23:56.273590','33','Mawong Lyonchen',3,'',14,7),
(196,'2025-08-26 10:23:56.273619','31','Keza Chodey – The Unfinished Love d',3,'',14,7),
(197,'2025-08-26 10:23:56.273645','28','The Monk and the Gun',3,'',14,7),
(198,'2025-08-26 10:23:56.273670','5','Zoelwa',3,'',14,7),
(199,'2025-08-26 10:23:56.273693','3','Yuel na Relpa',3,'',14,7),
(200,'2025-08-28 03:45:09.446737','6','Laytshog Lopen Rinpoche’s Visit to Canberra',3,'',16,7),
(201,'2025-08-28 03:45:09.446796','5','The Krodhikali Hundred Thousand Feast Offering was held at Senghe Dzong',3,'',16,7),
(202,'2025-08-28 03:45:09.446825','4','Kuma Sagar & The Khwopaa - Live in Canberra',3,'',16,7),
(203,'2025-08-28 03:45:09.446850','3','Special Events',3,'',16,7),
(204,'2025-08-28 03:45:09.446874','2','H.E. Drubwang Sangay Dorji Rinpoche',3,'',16,7),
(205,'2025-08-28 03:45:09.446896','1','Party the Event of the Year',3,'',16,7),
(206,'2025-08-28 03:45:57.122166','6','Live show',1,'[{\"added\": {}}]',15,7),
(207,'2025-08-28 03:48:11.392542','8','Musical Concert – Namgay Jigs Live',1,'[{\"added\": {}}]',16,7),
(208,'2025-08-28 03:50:03.747590','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Show time\"]}}]',16,7),
(209,'2025-08-28 04:25:40.940374','233','Booking by None',3,'',13,7),
(210,'2025-08-28 04:25:40.940449','232','Booking by Dasho Driver',3,'',13,7),
(211,'2025-08-28 04:25:40.940483','231','Booking by None',3,'',13,7),
(212,'2025-08-28 04:25:40.940511','230','Booking by None',3,'',13,7),
(213,'2025-08-28 04:25:40.940538','229','Booking by Dasho Driver',3,'',13,7),
(214,'2025-08-28 04:25:40.940564','228','Booking by With Love From Bhutan',3,'',13,7),
(215,'2025-08-28 04:25:40.940590','227','Booking by Dasho Driver',3,'',13,7),
(216,'2025-08-28 04:29:47.651876','7','Eminence Gaytsho Lopen Tenzin Norbu Rinpoche',2,'[{\"changed\": {\"fields\": [\"Show date\"]}}]',16,7),
(217,'2025-08-28 06:19:38.308535','60','Canberra college, Australian Capital Territory: Aug-18, 12:00 PM ',2,'[{\"changed\": {\"fields\": [\"Adult\"]}}]',12,7),
(218,'2025-08-28 06:21:46.416948','58','Australian National University, Australian Capital Territory: Dec-27, 06:00 PM ',2,'[{\"changed\": {\"fields\": [\"Slug\", \"Adult\"]}}]',12,7),
(219,'2025-08-28 06:25:54.080142','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',16,7),
(220,'2025-08-28 06:27:11.296179','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',16,7),
(221,'2025-08-28 07:21:22.424574','32','Dasho Driver',3,'',14,7),
(222,'2025-08-28 07:21:22.424631','27','Lunana: A Yak in the Classroom',3,'',14,7),
(223,'2025-08-28 09:26:19.758239','57','Edith Cowan College, Western Australia: Dec-26, 06:00 PM ',2,'[{\"changed\": {\"fields\": [\"Slug\", \"Theater name\", \"State\", \"Street\"]}}]',12,7),
(224,'2025-08-28 12:58:30.166989','234','Booking by None',3,'',13,7),
(225,'2025-08-28 13:02:48.754944','7','Sport',1,'[{\"added\": {}}]',15,7),
(226,'2025-08-28 13:03:06.624975','8','Donation',1,'[{\"added\": {}}]',15,7),
(227,'2025-08-28 14:13:44.819095','9','Doenchoe- Community DRA-MAA wang',1,'[{\"added\": {}}]',16,7),
(228,'2025-08-28 14:15:15.722715','9','Doenchoe- Community DRA-MAA wang',2,'[{\"changed\": {\"fields\": [\"Poster image\"]}}]',16,7),
(229,'2025-08-28 14:47:44.323573','241','Booking by None',3,'',13,7),
(230,'2025-08-28 14:47:44.323620','240','Booking by None',3,'',13,7),
(231,'2025-08-28 14:47:44.323647','239','Booking by None',3,'',13,7),
(232,'2025-08-28 14:47:44.323672','238','Booking by None',3,'',13,7),
(233,'2025-08-28 14:47:44.323694','237','Booking by None',3,'',13,7),
(234,'2025-08-28 14:50:30.790504','17','sonam',3,'',11,7),
(235,'2025-08-28 15:01:21.174377','8','dechen wangmo',3,'',11,7),
(236,'2025-08-29 03:49:13.459334','267','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(237,'2025-08-29 03:49:13.459384','266','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(238,'2025-08-29 03:49:13.459411','265','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(239,'2025-08-29 03:49:13.459454','264','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(240,'2025-08-29 03:49:13.459477','263','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(241,'2025-08-29 03:49:13.459498','262','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(242,'2025-08-29 03:49:13.459518','261','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(243,'2025-08-29 03:49:13.459538','260','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(244,'2025-08-29 03:49:13.459557','259','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(245,'2025-08-29 03:49:13.459577','258','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(246,'2025-08-29 03:49:13.459596','253','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(247,'2025-08-29 06:05:06.513800','281','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(248,'2025-08-29 06:05:06.513850','280','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(249,'2025-08-29 06:05:06.513878','279','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(250,'2025-08-29 06:05:06.513904','278','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(251,'2025-08-29 06:05:06.513929','277','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(252,'2025-08-29 06:05:06.513952','276','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(253,'2025-08-29 06:05:06.513975','275','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(254,'2025-08-29 06:05:06.513997','274','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(255,'2025-08-29 06:05:06.514019','273','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(256,'2025-08-29 06:05:06.514041','272','Booking by Eminence Gaytsho Lopen Tenzin Norbu Rinpoche - Namgay Tshering',3,'',13,7),
(257,'2025-08-29 06:05:06.514062','271','Booking by Eminence Gaytsho Lopen Tenzin Norbu Rinpoche - Namgay Tshering',3,'',13,7),
(258,'2025-08-29 06:05:06.514085','270','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(259,'2025-08-29 06:05:06.514106','269','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(260,'2025-08-29 06:05:06.514126','268','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(261,'2025-08-29 06:05:06.514147','257','Booking by Musical Concert – Namgay Jigs Live - Jigme',3,'',13,7),
(262,'2025-08-29 06:05:06.514169','256','Booking by Musical Concert – Namgay Jigs Live - Namgyel',3,'',13,7),
(263,'2025-08-29 06:05:06.514190','255','Booking by Musical Concert – Namgay Jigs Live - Namgyel',3,'',13,7),
(264,'2025-08-29 06:05:06.514212','254','Booking by Musical Concert – Namgay Jigs Live - Namgyel',3,'',13,7),
(265,'2025-08-29 06:05:27.123504','246','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(266,'2025-08-29 06:05:27.123552','245','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(267,'2025-08-29 06:05:27.123577','244','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(268,'2025-08-29 06:05:27.123598','243','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(269,'2025-08-29 06:05:27.123628','242','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(270,'2025-08-29 06:05:27.123648','236','Booking by Musical Concert – Namgay Jigs Live - Dechen Wangmo',3,'',13,7),
(271,'2025-08-29 06:05:27.123667','235','Booking by With Love From Bhutan - Namgay Tshering',3,'',13,7),
(272,'2025-08-30 07:55:54.003001','323','Booking by Eminence Gaytsho Lopen Tenzin Norbu Rinpoche - Namgay Tshering',3,'',13,7),
(273,'2025-08-30 07:55:54.003056','321','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(274,'2025-08-30 07:55:54.003086','320','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(275,'2025-08-30 07:55:54.003112','319','Booking by With Love From Bhutan - Namgay Tshering',3,'',13,7),
(276,'2025-08-30 07:55:54.003137','318','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(277,'2025-08-30 07:55:54.003161','317','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(278,'2025-08-30 07:55:54.003183','316','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(279,'2025-08-30 07:55:54.003205','315','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(280,'2025-08-30 07:55:54.003227','314','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(281,'2025-08-30 07:55:54.003249','313','Booking by Musical Concert – Namgay Jigs Live - Dechen Wangmo',3,'',13,7),
(282,'2025-08-30 07:55:54.003271','312','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(283,'2025-08-30 07:55:54.003321','311','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(284,'2025-08-30 07:55:54.003343','310','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(285,'2025-08-30 07:55:54.003364','309','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(286,'2025-08-30 07:55:54.003385','308','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(287,'2025-08-30 07:55:54.003406','307','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(288,'2025-08-30 07:55:54.003444','306','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(289,'2025-08-30 07:55:54.003467','305','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(290,'2025-08-30 07:55:54.003488','304','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(291,'2025-08-30 07:55:54.003509','303','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(292,'2025-08-30 07:55:54.003529','302','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(293,'2025-08-30 07:55:54.003550','301','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(294,'2025-08-30 07:55:54.003572','300','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(295,'2025-08-30 07:55:54.003601','299','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(296,'2025-08-30 07:55:54.003623','298','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(297,'2025-08-30 07:55:54.003644','297','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(298,'2025-08-30 07:55:54.003666','296','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(299,'2025-08-30 07:55:54.003687','295','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(300,'2025-08-30 07:55:54.003708','294','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(301,'2025-08-30 07:55:54.003729','293','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(302,'2025-08-30 07:55:54.003750','292','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(303,'2025-08-30 07:55:54.003771','291','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(304,'2025-08-30 07:55:54.003793','290','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(305,'2025-08-30 07:55:54.003814','289','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(306,'2025-08-30 07:55:54.003836','288','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(307,'2025-08-30 07:55:54.003858','287','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(308,'2025-08-30 07:55:54.003879','286','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(309,'2025-08-30 07:55:54.003899','285','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(310,'2025-08-30 07:55:54.003920','284','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(311,'2025-08-30 08:33:33.441856','329','Booking by Musical Concert – Namgay Jigs Live - Dechen Wangmo',3,'',13,7),
(312,'2025-08-30 08:33:33.441916','328','Booking by Musical Concert – Namgay Jigs Live - Dechen Wangmo',3,'',13,7),
(313,'2025-08-30 08:33:33.441947','327','Booking by Musical Concert – Namgay Jigs Live - Dechen Wangmo',3,'',13,7),
(314,'2025-08-30 08:33:33.441974','326','Booking by Musical Concert – Namgay Jigs Live - Dechen Wangmo',3,'',13,7),
(315,'2025-08-30 08:33:33.442000','325','Booking by Musical Concert – Namgay Jigs Live - namgay dorji',3,'',13,7),
(316,'2025-08-30 08:33:33.442025','324','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(317,'2025-08-30 08:39:07.489277','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',16,7),
(318,'2025-08-30 08:39:58.506965','330','Booking by Musical Concert – Namgay Jigs Live - Dechen wangmo',3,'',13,7),
(319,'2025-08-30 08:44:19.880094','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',16,7),
(320,'2025-08-30 08:49:59.986729','333','Booking by Musical Concert – Namgay Jigs Live - Dechen wangmo',3,'',13,7),
(321,'2025-08-30 23:56:06.720179','336','Booking by Musical Concert – Namgay Jigs Live - Namgay Demo',3,'',13,7),
(322,'2025-09-01 10:05:24.174920','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Owner\"]}}]',16,7),
(323,'2025-09-01 10:51:29.646482','250','Booking by Musical Concert – Namgay Jigs Live - Kunzang Dorji',3,'',13,7),
(324,'2025-09-01 10:51:29.646547','248','Booking by Musical Concert – Namgay Jigs Live - Kunzang Dorji',3,'',13,7),
(325,'2025-09-01 10:51:29.646578','247','Booking by Musical Concert – Namgay Jigs Live - Kunzang Dorji',3,'',13,7),
(326,'2025-09-01 10:51:39.376757','249','Booking by Musical Concert – Namgay Jigs Live - Kunzang Dorji',3,'',13,7),
(327,'2025-09-01 10:51:47.289497','251','Booking by Musical Concert – Namgay Jigs Live - U',3,'',13,7),
(328,'2025-09-01 10:53:06.575387','322','Booking by Musical Concert – Namgay Jigs Live - Minjur Dorji',3,'',13,7),
(329,'2025-09-01 10:54:13.740446','252','Booking by Musical Concert – Namgay Jigs Live - Samuel Pradhan',3,'',13,7),
(330,'2025-09-01 10:54:42.476696','332','Booking by Musical Concert – Namgay Jigs Live - Minjur',2,'[{\"changed\": {\"fields\": [\"Payment status\"]}}]',13,7),
(331,'2025-09-01 12:05:24.100651','341','Booking by With Love From Bhutan - Namgay Tshering',2,'[{\"changed\": {\"fields\": [\"Payment status\", \"Payment date\"]}}]',13,7),
(332,'2025-09-01 12:58:49.792729','342','Booking by With Love From Bhutan - Namgay Tshering',2,'[{\"changed\": {\"fields\": [\"Payment status\", \"Payment date\"]}}]',13,7),
(333,'2025-09-01 13:03:04.812221','19','Dechen wangmo',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is partner\"]}}]',11,7),
(334,'2025-09-01 13:03:27.630994','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Owner\"]}}]',16,7),
(335,'2025-09-01 13:08:10.242786','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Owner\"]}}]',16,7),
(336,'2025-09-02 08:02:22.306074','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',16,7),
(337,'2025-09-02 08:18:25.680753','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Vip label\", \"Vip price\", \"Vip quantity\", \"Economy label\", \"Economy price\", \"Economy quantity\"]}}]',16,7),
(338,'2025-09-02 08:59:05.452765','10','Tour of soul - Canberra',2,'[{\"changed\": {\"fields\": [\"Owner\"]}}]',16,7),
(339,'2025-09-02 09:06:19.426356','10','Tour of soul - Canberra',2,'[{\"changed\": {\"fields\": [\"General label\", \"Price\", \"Vip label\", \"Vip price\"]}}]',16,7),
(340,'2025-09-02 09:27:46.635972','344','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(341,'2025-09-03 08:49:47.531891','347','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(342,'2025-09-03 08:49:47.531932','346','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(343,'2025-09-03 08:50:33.078343','348','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(344,'2025-09-03 09:05:29.828834','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Vip price\", \"Economy price\"]}}]',16,7),
(345,'2025-09-03 09:31:06.631391','10','Tour of soul - Canberra',2,'[{\"changed\": {\"fields\": [\"Vip price\"]}}]',16,7),
(346,'2025-09-03 09:32:29.535508','10','Tour of soul - Canberra',2,'[{\"changed\": {\"fields\": [\"Vip price\"]}}]',16,7),
(347,'2025-09-03 09:32:55.892605','10','Tour of soul - Canberra',2,'[{\"changed\": {\"fields\": [\"Economy price\"]}}]',16,7),
(348,'2025-09-03 09:42:04.700435','354','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(349,'2025-09-03 09:42:04.700499','353','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(350,'2025-09-03 09:42:04.700525','352','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(351,'2025-09-03 09:42:04.700547','351','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(352,'2025-09-03 09:42:04.700568','350','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(353,'2025-09-03 09:42:04.700589','349','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(354,'2025-09-03 10:11:34.221460','365','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(355,'2025-09-03 10:11:34.221517','364','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(356,'2025-09-03 10:11:34.221544','363','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(357,'2025-09-03 10:11:34.221575','362','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(358,'2025-09-03 10:11:34.221603','361','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(359,'2025-09-03 10:11:34.221626','360','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(360,'2025-09-03 10:11:34.221653','359','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(361,'2025-09-03 10:11:34.221679','358','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(362,'2025-09-03 10:11:34.221703','357','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(363,'2025-09-03 10:11:34.221725','356','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(364,'2025-09-03 10:11:34.221745','355','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(365,'2025-09-03 10:13:19.615886','366','Booking by With Love From Bhutan - Namgay Tshering',2,'[{\"changed\": {\"fields\": [\"Payment status\", \"Payment date\"]}}]',13,7),
(366,'2025-09-03 10:32:12.837373','339','Booking by Musical Concert – Namgay Jigs Live - Choki',2,'[{\"changed\": {\"fields\": [\"Economy quantity\", \"General price\", \"General quantity\", \"Payment date\"]}}]',13,7),
(367,'2025-09-03 10:35:40.575003','345','Booking by Musical Concert – Namgay Jigs Live - Sangay Choden',2,'[{\"changed\": {\"fields\": [\"General price\", \"General quantity\"]}}]',13,7),
(368,'2025-09-03 10:37:26.067128','339','Booking by Musical Concert – Namgay Jigs Live - Choki',2,'[{\"changed\": {\"fields\": [\"Economy quantity\"]}}]',13,7),
(369,'2025-09-03 10:38:40.565681','368','Booking by Tour of soul - Canberra - Namgay Tshering',3,'',13,7),
(370,'2025-09-03 10:38:40.565729','367','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering cjecl',3,'',13,7),
(371,'2025-09-03 10:38:40.565757','366','Booking by With Love From Bhutan - Namgay Tshering',3,'',13,7),
(372,'2025-09-03 10:39:09.752406','343','Booking by Musical Concert – Namgay Jigs Live - Ugen Tshering',2,'[{\"changed\": {\"fields\": [\"General price\", \"General quantity\"]}}]',13,7),
(373,'2025-09-03 10:40:10.377516','338','Booking by Musical Concert – Namgay Jigs Live - Thinley Rabgay',2,'[{\"changed\": {\"fields\": [\"General price\", \"General quantity\"]}}]',13,7),
(374,'2025-09-03 10:41:17.157260','334','Booking by Musical Concert – Namgay Jigs Live - Dawa Norbu',2,'[{\"changed\": {\"fields\": [\"General price\", \"General quantity\"]}}]',13,7),
(375,'2025-09-04 10:36:49.932875','10','Tour of soul - Canberra',3,'',16,7),
(376,'2025-09-05 08:59:57.770012','345','Booking by Musical Concert – Namgay Jigs Live - Sangay Choden',2,'[{\"changed\": {\"fields\": [\"Attended\", \"Attend remarks\"]}}]',13,7),
(377,'2025-09-05 09:01:23.250962','345','Booking by Musical Concert – Namgay Jigs Live - Sangay Choden',2,'[{\"changed\": {\"fields\": [\"Attended\"]}}]',13,7),
(378,'2025-09-05 09:03:55.556691','345','Booking by Musical Concert – Namgay Jigs Live - Sangay Choden',2,'[{\"changed\": {\"fields\": [\"Attended\", \"Attend remarks\"]}}]',13,7),
(379,'2025-09-05 09:06:44.300573','345','Booking by Musical Concert – Namgay Jigs Live - Sangay Choden',2,'[{\"changed\": {\"fields\": [\"Attended\"]}}]',13,7),
(380,'2025-09-05 09:07:11.748557','345','Booking by Musical Concert – Namgay Jigs Live - Sangay Choden',2,'[{\"changed\": {\"fields\": [\"Attended\", \"Attend remarks\"]}}]',13,7),
(381,'2025-09-06 05:49:19.140626','19','Dechen wangmo',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is admin\", \"Is staff\"]}}]',11,7),
(382,'2025-09-06 05:50:34.703184','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Owner\"]}}]',16,7),
(383,'2025-09-06 05:50:43.517028','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Owner\"]}}]',16,7),
(384,'2025-09-06 05:52:04.435602','345','Booking by Musical Concert – Namgay Jigs Live - Sangay Choden',2,'[{\"changed\": {\"fields\": [\"Attended\", \"Attend remarks\"]}}]',13,7),
(385,'2025-09-06 05:52:17.860552','9','Minjur',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is admin\", \"Is staff\"]}}]',11,7),
(386,'2025-09-06 05:52:29.764982','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Owner\"]}}]',16,7),
(387,'2025-09-06 09:14:24.013783','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',16,19),
(388,'2025-09-06 09:15:11.061269','9','Minjur',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is user\"]}}]',11,19),
(389,'2025-09-06 09:16:02.353306','9','Minjur',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is user\"]}}]',11,19),
(390,'2025-09-06 09:16:27.445567','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Owner\"]}}]',16,19),
(391,'2025-09-08 10:17:39.792334','338','Booking by Musical Concert – Namgay Jigs Live - Thinley Rabgay',2,'[{\"changed\": {\"fields\": [\"Attended\"]}}]',13,7),
(392,'2025-09-08 10:19:06.707375','338','Booking by Musical Concert – Namgay Jigs Live - Thinley Rabgay',2,'[{\"changed\": {\"fields\": [\"Attended\"]}}]',13,7),
(393,'2025-09-08 10:33:19.112619','338','Booking by Musical Concert – Namgay Jigs Live - Thinley Rabgay',2,'[{\"changed\": {\"fields\": [\"Attended\"]}}]',13,7),
(394,'2025-09-08 10:41:07.439111','338','Booking by Musical Concert – Namgay Jigs Live - Thinley Rabgay',2,'[{\"changed\": {\"fields\": [\"Attended\"]}}]',13,7),
(395,'2025-09-08 10:45:55.882509','338','Booking by Musical Concert – Namgay Jigs Live - Thinley Rabgay',2,'[{\"changed\": {\"fields\": [\"Payment status\", \"Attended\"]}}]',13,7),
(396,'2025-09-08 10:46:18.287254','334','Booking by Musical Concert – Namgay Jigs Live - Dawa Norbu',2,'[{\"changed\": {\"fields\": [\"Payment status\", \"Attended\"]}}]',13,7),
(397,'2025-09-08 10:47:59.960199','345','Booking by Musical Concert – Namgay Jigs Live - Sangay Choden',2,'[{\"changed\": {\"fields\": [\"Attended\"]}}]',13,7),
(398,'2025-09-08 10:48:30.009783','343','Booking by Musical Concert – Namgay Jigs Live - Ugen Tshering',2,'[{\"changed\": {\"fields\": [\"Attended\"]}}]',13,7),
(399,'2025-09-08 10:58:20.993949','342','Booking by With Love From Bhutan - Namgay Tshering',2,'[{\"changed\": {\"fields\": [\"Attended\"]}}]',13,7),
(400,'2025-09-08 12:08:10.392235','19','Dechen wangmo',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is admin\", \"Is staff\", \"Is partner\"]}}]',11,7),
(401,'2025-09-08 12:16:35.802614','19','Dechen wangmo',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is partner\"]}}]',11,7),
(402,'2025-09-08 13:09:15.528928','1','EventAccess object (1)',1,'[{\"added\": {}}]',22,7),
(403,'2025-09-08 13:10:54.726505','2','EventAccess object (2)',1,'[{\"added\": {}}]',22,7),
(404,'2025-09-08 13:16:14.295380','1','FilmShowAccess object (1)',1,'[{\"added\": {}}]',23,7),
(405,'2025-09-08 13:16:36.541025','2','FilmShowAccess object (2)',1,'[{\"added\": {}}]',23,7),
(406,'2025-09-08 13:22:02.948938','1','Dechen wangmo, With Love From Bhutan',3,'',23,7),
(407,'2025-09-08 13:22:41.362176','2','Dechen wangmo, With Love From Bhutan,Edith Cowan College',3,'',23,7),
(408,'2025-09-08 13:31:16.947417','1','Dechen wangmo, Musical Concert – Namgay Jigs Live',3,'',22,7),
(409,'2025-09-09 09:12:45.473204','11','South Australia',2,'[{\"changed\": {\"fields\": [\"Time zone\"]}}]',9,7),
(410,'2025-09-09 09:12:55.040847','10','Northern Territory',2,'[{\"changed\": {\"fields\": [\"Time zone\"]}}]',9,7),
(411,'2025-09-09 09:13:08.570202','8','Tasmania',2,'[{\"changed\": {\"fields\": [\"Time zone\"]}}]',9,7),
(412,'2025-09-09 09:13:19.372076','7','Queensland',2,'[{\"changed\": {\"fields\": [\"Time zone\"]}}]',9,7),
(413,'2025-09-09 09:13:27.442878','6','Victoria',2,'[{\"changed\": {\"fields\": [\"Time zone\"]}}]',9,7),
(414,'2025-09-09 09:13:39.797448','5','New South Wales',2,'[{\"changed\": {\"fields\": [\"Time zone\"]}}]',9,7),
(415,'2025-09-09 09:13:50.086873','1','Australian Capital Territory',2,'[{\"changed\": {\"fields\": [\"Time zone\"]}}]',9,7),
(416,'2025-09-09 09:14:03.607934','3','Western Australia',2,'[{\"changed\": {\"fields\": [\"Time zone\"]}}]',9,7),
(417,'2025-09-09 10:06:16.057883','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Show date\"]}}]',16,7),
(418,'2025-09-09 10:06:51.368073','8','Musical Concert – Namgay Jigs Live',2,'[{\"changed\": {\"fields\": [\"Show date\"]}}]',16,7),
(419,'2025-09-09 10:18:36.458280','58','With Love From Bhutan ,Australian National University, Australian Capital Territory: Sep-01, 06:00 PM ',2,'[{\"changed\": {\"fields\": [\"Show date\"]}}]',12,7),
(420,'2025-09-09 10:18:54.899881','57','With Love From Bhutan ,Edith Cowan College, Western Australia: Aug-05, 06:00 PM ',2,'[{\"changed\": {\"fields\": [\"Show date\"]}}]',12,7),
(421,'2025-09-11 09:58:17.275690','9','Minjur',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is partner\", \"Is user\"]}}]',11,7),
(422,'2025-09-11 10:00:20.119810','9','Minjur',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is user\"]}}]',11,7),
(423,'2025-09-11 10:01:28.491885','9','Minjur',2,'[{\"changed\": {\"fields\": [\"Phone\", \"Is admin\", \"Is staff\"]}}]',11,7),
(424,'2025-09-11 10:51:02.903695','9','Gathering',1,'[{\"added\": {}}]',15,7),
(425,'2025-09-12 13:20:25.491174','7','Namgay Tshering',2,'[{\"changed\": {\"fields\": [\"Email\", \"Phone\"]}}]',11,7),
(426,'2025-09-12 13:23:43.491771','33','Dechen Wangmo',3,'',11,7),
(427,'2025-09-12 13:25:15.562639','386','Booking by With Love From Bhutan - Namgay Tshering',3,'',13,7),
(428,'2025-09-12 13:25:15.562689','385','Booking by With Love From Bhutan - Namgay Tshering',3,'',13,7),
(429,'2025-09-12 13:25:15.562725','384','Booking by With Love From Bhutan - Namgay Tshering',3,'',13,7),
(430,'2025-09-12 13:25:15.562752','383','Booking by Musical Concert – Namgay Jigs Live - Namgay Tshering',3,'',13,7),
(431,'2025-09-12 13:25:22.688800','34','Dechen Wangmo',3,'',11,7),
(432,'2025-09-12 13:25:30.579518','7','Namgay Tshering',2,'[{\"changed\": {\"fields\": [\"Email\", \"Phone\"]}}]',11,7),
(433,'2025-09-12 13:26:02.943021','342','Booking by With Love From Bhutan - Namgay Tshering',3,'',13,7),
(434,'2025-09-12 13:26:02.943071','341','Booking by With Love From Bhutan - Namgay Tshering',3,'',13,7),
(435,'2025-09-12 13:40:13.638838','18','sonam',3,'',11,7),
(436,'2025-09-12 13:42:42.030378','35','Sonam Drimed',3,'',11,7),
(437,'2025-09-12 13:45:59.353793','36','Sonam Drimed',3,'',11,7),
(438,'2025-09-12 13:48:37.627856','37','Dechen Wangmo',3,'',11,7),
(439,'2025-09-12 13:54:52.116028','38','POeman',3,'',11,7),
(440,'2025-09-12 13:54:59.856234','7','Namgay Tshering',2,'[{\"changed\": {\"fields\": [\"Email\", \"Phone\"]}}]',11,7),
(441,'2025-09-12 13:55:55.780408','39','Dechen Wangmo',3,'',11,7),
(442,'2025-09-12 13:56:02.223866','7','Namgay Tshering',2,'[{\"changed\": {\"fields\": [\"Email\", \"Phone\"]}}]',11,7),
(443,'2025-09-18 09:38:22.021682','61','Drala ,Kim Beazley Lecture Theatre, Western Australia: Sep-21, 06:30 PM ',2,'[{\"changed\": {\"fields\": [\"Show date\"]}}]',12,7),
(444,'2025-09-18 09:38:27.934242','58','With Love From Bhutan ,Australian National University, Australian Capital Territory: Sep-01, 06:00 PM ',3,'',12,7),
(445,'2025-09-18 09:38:27.934305','57','With Love From Bhutan ,Edith Cowan College, Western Australia: Aug-05, 06:00 PM ',3,'',12,7),
(446,'2025-09-18 10:47:41.602845','41','Bhutan Event house',1,'[{\"added\": {}}]',11,7),
(447,'2025-09-18 10:47:54.660879','41','Bhutan Event house',2,'[{\"changed\": {\"fields\": [\"Email\", \"Phone\"]}}]',11,7),
(448,'2025-09-18 10:50:27.498160','41','Bhutan Event house',2,'[{\"changed\": {\"fields\": [\"Password\", \"Phone\"]}}]',11,7),
(449,'2025-09-18 10:52:58.220049','41','Bhutan Event house',2,'[{\"changed\": {\"fields\": [\"Password\", \"Phone\"]}}]',11,7),
(450,'2025-09-18 10:53:02.628270','41','Bhutan Event house',2,'[{\"changed\": {\"fields\": [\"Phone\"]}}]',11,7),
(451,'2025-09-18 10:53:12.735782','41','Bhutan Event house',3,'',11,7),
(452,'2025-09-18 10:53:56.779828','19','Bhutan Event House',2,'[{\"changed\": {\"fields\": [\"Email\", \"Slug\", \"Name\", \"Username\", \"Phone\"]}}]',11,7),
(453,'2025-09-18 10:54:27.147643','3','Bhutan Event House, Drala,Kim Beazley Lecture Theatre',1,'[{\"added\": {}}]',23,7),
(454,'2025-09-18 10:56:02.119199','61','Drala ,Kim Beazley Lecture Theatre, Western Australia: Sep-21, 06:30 PM ',2,'[{\"changed\": {\"fields\": [\"Adult\"]}}]',12,7),
(455,'2025-09-18 10:59:04.908611','61','Drala ,Kim Beazley Lecture Theatre, Western Australia: Sep-21, 06:30 PM ',2,'[{\"changed\": {\"fields\": [\"Adult\"]}}]',12,7),
(456,'2025-09-18 11:00:42.222748','4','Minjur, Drala,Kim Beazley Lecture Theatre',1,'[{\"added\": {}}]',23,7),
(457,'2025-10-03 04:46:56.850270','10','Meeting',1,'[{\"added\": {}}]',15,7),
(458,'2025-10-03 08:39:51.130364','12','Education & Opportunity Fair',2,'[]',16,7),
(459,'2025-10-03 08:53:19.836702','389','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(460,'2025-10-03 08:53:36.836906','388','Booking by Drala - Test',3,'',13,7),
(461,'2025-10-07 11:39:26.492293','3','Minjur, Education & Opportunity Fair',1,'[{\"added\": {}}]',22,7),
(462,'2025-10-07 20:18:52.451617','718','Dechen Wangmo',3,'',11,7),
(463,'2025-10-07 20:18:52.451668','717','Dechen Wangmo',3,'',11,7),
(464,'2025-10-07 20:18:52.451694','716','rysdtfmfpg',3,'',11,7),
(465,'2025-10-07 20:18:52.451717','715','tyzimdmnjo',3,'',11,7),
(466,'2025-10-07 20:18:52.451739','714','pilxsvnzhh',3,'',11,7),
(467,'2025-10-07 20:18:52.451760','713','qromqffhxh',3,'',11,7),
(468,'2025-10-07 20:18:52.451779','712','pmnpyvwsls',3,'',11,7),
(469,'2025-10-07 20:18:52.451799','711','edkvypgqes',3,'',11,7),
(470,'2025-10-07 20:18:52.451818','710','pjjjzziyrx',3,'',11,7),
(471,'2025-10-07 20:18:52.451837','709','mhiuyznmxh',3,'',11,7),
(472,'2025-10-07 20:18:52.451855','708','gmexhvlilv',3,'',11,7),
(473,'2025-10-07 20:18:52.451875','707','rssrgtzoem',3,'',11,7),
(474,'2025-10-07 20:18:52.451893','706','pitykqgivn',3,'',11,7),
(475,'2025-10-07 20:18:52.451911','705','lijkwogkfp',3,'',11,7),
(476,'2025-10-07 20:18:52.451929','704','krvjprtlsv',3,'',11,7),
(477,'2025-10-07 20:18:52.451948','703','edqeskqjvj',3,'',11,7),
(478,'2025-10-07 20:18:52.451966','702','vpxnwpkwvs',3,'',11,7),
(479,'2025-10-07 20:18:52.451984','701','wpzxsjevum',3,'',11,7),
(480,'2025-10-07 20:18:52.452001','700','vjfgzdwgdk',3,'',11,7),
(481,'2025-10-07 20:18:52.452019','699','tpurdmmnkl',3,'',11,7),
(482,'2025-10-07 20:18:52.452037','698','qpqkeuyyft',3,'',11,7),
(483,'2025-10-07 20:18:52.452055','697','ynhqpnruom',3,'',11,7),
(484,'2025-10-07 20:18:52.452073','696','lpmfytemzm',3,'',11,7),
(485,'2025-10-07 20:18:52.452091','695','jskykjfifm',3,'',11,7),
(486,'2025-10-07 20:18:52.452109','694','nqemjukxgv',3,'',11,7),
(487,'2025-10-07 20:18:52.452127','693','htsnrpjuqn',3,'',11,7),
(488,'2025-10-07 20:18:52.452145','692','ptwoepymwq',3,'',11,7),
(489,'2025-10-07 20:18:52.452163','691','kuwzwrwytp',3,'',11,7),
(490,'2025-10-07 20:18:52.452181','690','eepeonekfg',3,'',11,7),
(491,'2025-10-07 20:18:52.452206','689','qoidvspjun',3,'',11,7),
(492,'2025-10-07 20:18:52.452225','688','uoklyjxpsp',3,'',11,7),
(493,'2025-10-07 20:18:52.452243','687','nyzfodmnxr',3,'',11,7),
(494,'2025-10-07 20:18:52.452260','686','defzhtimko',3,'',11,7),
(495,'2025-10-07 20:18:52.452278','685','xsdvffhmgp',3,'',11,7),
(496,'2025-10-07 20:18:52.452296','684','sfnjghrlht',3,'',11,7),
(497,'2025-10-07 20:18:52.452313','683','yxduqvgqsf',3,'',11,7),
(498,'2025-10-07 20:18:52.452331','682','ywdtmrxyqh',3,'',11,7),
(499,'2025-10-07 20:18:52.452349','681','vmztmpouyj',3,'',11,7),
(500,'2025-10-07 20:18:52.452367','680','oksmouquyt',3,'',11,7),
(501,'2025-10-07 20:18:52.452386','679','sqdmxvtiwj',3,'',11,7),
(502,'2025-10-07 20:18:52.452404','678','kzsjqqvgij',3,'',11,7),
(503,'2025-10-07 20:18:52.452470','677','xxdhunxxyi',3,'',11,7),
(504,'2025-10-07 20:18:52.452499','676','ooqmufdnxg',3,'',11,7),
(505,'2025-10-07 20:18:52.452518','675','fskdlpgqxn',3,'',11,7),
(506,'2025-10-07 20:18:52.452536','674','fdhqzlvuzf',3,'',11,7),
(507,'2025-10-07 20:18:52.452553','673','rptgtyzxox',3,'',11,7),
(508,'2025-10-07 20:18:52.452571','672','dzohulypxi',3,'',11,7),
(509,'2025-10-07 20:18:52.452588','671','uwmwldlrkx',3,'',11,7),
(510,'2025-10-07 20:18:52.452606','670','wlefdkzxzk',3,'',11,7),
(511,'2025-10-07 20:18:52.452624','669','uhuvojrpdf',3,'',11,7),
(512,'2025-10-07 20:18:52.452641','668','xzpupmnrjv',3,'',11,7),
(513,'2025-10-07 20:18:52.452659','667','eqmimrjohq',3,'',11,7),
(514,'2025-10-07 20:18:52.452676','666','esgxgrswrn',3,'',11,7),
(515,'2025-10-07 20:18:52.452699','665','hedyprsuxk',3,'',11,7),
(516,'2025-10-07 20:18:52.452717','664','qjyuzmekfq',3,'',11,7),
(517,'2025-10-07 20:18:52.452734','663','jvfwjfdzdp',3,'',11,7),
(518,'2025-10-07 20:18:52.452750','662','sxzizfwvhl',3,'',11,7),
(519,'2025-10-07 20:18:52.452768','661','mfnrrpzxdz',3,'',11,7),
(520,'2025-10-07 20:18:52.452785','660','qdkrnxvghq',3,'',11,7),
(521,'2025-10-07 20:18:52.452801','659','rptxtetoju',3,'',11,7),
(522,'2025-10-07 20:18:52.452819','658','yknxeszyum',3,'',11,7),
(523,'2025-10-07 20:18:52.452836','657','tqqdyiryqk',3,'',11,7),
(524,'2025-10-07 20:18:52.452853','656','ohuvzjphul',3,'',11,7),
(525,'2025-10-07 20:18:52.452870','655','rxqpvzjrum',3,'',11,7),
(526,'2025-10-07 20:18:52.452887','654','xhlvhpdwri',3,'',11,7),
(527,'2025-10-07 20:18:52.452904','653','nwurrpjofo',3,'',11,7),
(528,'2025-10-07 20:18:52.452921','652','wxssxdiivl',3,'',11,7),
(529,'2025-10-07 20:18:52.452938','651','mrkntvlykm',3,'',11,7),
(530,'2025-10-07 20:18:52.452955','650','gkynhohrnj',3,'',11,7),
(531,'2025-10-07 20:18:52.452972','649','ziqzfuskhn',3,'',11,7),
(532,'2025-10-07 20:18:52.452989','648','wqyfuktktt',3,'',11,7),
(533,'2025-10-07 20:18:52.453010','647','sunhsfgnlx',3,'',11,7),
(534,'2025-10-07 20:18:52.453028','646','xuestrploe',3,'',11,7),
(535,'2025-10-07 20:18:52.453045','645','uqyljxuzlf',3,'',11,7),
(536,'2025-10-07 20:18:52.453066','644','omtxixveii',3,'',11,7),
(537,'2025-10-07 20:18:52.453083','643','sgvigkynhi',3,'',11,7),
(538,'2025-10-07 20:18:52.453100','642','gsxuosyxly',3,'',11,7),
(539,'2025-10-07 20:18:52.453119','641','oiqkwhoykf',3,'',11,7),
(540,'2025-10-07 20:18:52.453136','640','onsunpolzv',3,'',11,7),
(541,'2025-10-07 20:18:52.453152','639','sygvydrdvs',3,'',11,7),
(542,'2025-10-07 20:18:52.453169','638','elnuvgilvt',3,'',11,7),
(543,'2025-10-07 20:18:52.453186','637','olihfkmsod',3,'',11,7),
(544,'2025-10-07 20:18:52.453203','636','zyukwfsxoe',3,'',11,7),
(545,'2025-10-07 20:18:52.453220','635','qtypyjhkid',3,'',11,7),
(546,'2025-10-07 20:18:52.453242','634','ydvntlferx',3,'',11,7),
(547,'2025-10-07 20:18:52.453260','633','fztmnhstwn',3,'',11,7),
(548,'2025-10-07 20:18:52.453277','632','tmtzdxktfg',3,'',11,7),
(549,'2025-10-07 20:18:52.453294','631','qjmxqfjgse',3,'',11,7),
(550,'2025-10-07 20:18:52.453311','630','tzlgzyoivu',3,'',11,7),
(551,'2025-10-07 20:18:52.453328','629','fpvkskzqvm',3,'',11,7),
(552,'2025-10-07 20:18:52.453345','628','yjgoozkzxh',3,'',11,7),
(553,'2025-10-07 20:18:52.453362','627','ldqxtqfxeo',3,'',11,7),
(554,'2025-10-07 20:18:52.453379','626','hhrevupwry',3,'',11,7),
(555,'2025-10-07 20:18:52.453397','625','eosnmlvuuu',3,'',11,7),
(556,'2025-10-07 20:18:52.453414','624','izpgfeivqz',3,'',11,7),
(557,'2025-10-07 20:18:52.453515','623','xqetkfxyov',3,'',11,7),
(558,'2025-10-07 20:18:52.453536','622','jmmshrthdk',3,'',11,7),
(559,'2025-10-07 20:18:52.453554','621','jfkksfqetk',3,'',11,7),
(560,'2025-10-07 20:18:52.453571','620','ykdwoistex',3,'',11,7),
(561,'2025-10-07 20:18:52.453588','619','pomwnnwlur',3,'',11,7),
(562,'2025-10-07 20:19:48.144605','618','gddhuqiosg',3,'',11,7),
(563,'2025-10-07 20:19:48.144653','617','irwytwitoq',3,'',11,7),
(564,'2025-10-07 20:19:48.144679','616','eyrqdnmlje',3,'',11,7),
(565,'2025-10-07 20:19:48.144703','615','undlehritu',3,'',11,7),
(566,'2025-10-07 20:19:48.144724','614','qernqiwqlo',3,'',11,7),
(567,'2025-10-07 20:19:48.144744','613','ljwztfnsen',3,'',11,7),
(568,'2025-10-07 20:19:48.144764','612','vedlhkxflo',3,'',11,7),
(569,'2025-10-07 20:19:48.144783','611','tpglwuyetd',3,'',11,7),
(570,'2025-10-07 20:19:48.144803','610','fslhvrylfn',3,'',11,7),
(571,'2025-10-07 20:19:48.144823','609','pjtyimjfeo',3,'',11,7),
(572,'2025-10-07 20:19:48.144841','608','umldudhutg',3,'',11,7),
(573,'2025-10-07 20:19:48.144859','607','zmdwzqohqx',3,'',11,7),
(574,'2025-10-07 20:19:48.144877','606','tegvwggvyu',3,'',11,7),
(575,'2025-10-07 20:19:48.144895','605','zvnxmpivfj',3,'',11,7),
(576,'2025-10-07 20:19:48.144913','604','eqhzeeltxr',3,'',11,7),
(577,'2025-10-07 20:19:48.144931','603','knrnnjzrfh',3,'',11,7),
(578,'2025-10-07 20:19:48.144949','602','txfmqozhgv',3,'',11,7),
(579,'2025-10-07 20:19:48.144967','601','ejesrsljik',3,'',11,7),
(580,'2025-10-07 20:19:48.144985','600','nekqwfunpw',3,'',11,7),
(581,'2025-10-07 20:19:48.145002','599','lolnzdfydw',3,'',11,7),
(582,'2025-10-07 20:19:48.145020','598','xumfxgwkrx',3,'',11,7),
(583,'2025-10-07 20:19:48.145037','597','yplqdhgwyl',3,'',11,7),
(584,'2025-10-07 20:19:48.145054','596','jouypkyigg',3,'',11,7),
(585,'2025-10-07 20:19:48.145072','595','ntrvtoypsp',3,'',11,7),
(586,'2025-10-07 20:19:48.145090','594','jtxdskjqqm',3,'',11,7),
(587,'2025-10-07 20:19:48.145108','593','qzwfiugxko',3,'',11,7),
(588,'2025-10-07 20:19:48.145126','592','iefeorzwlg',3,'',11,7),
(589,'2025-10-07 20:19:48.145144','591','zvpdfkdovn',3,'',11,7),
(590,'2025-10-07 20:19:48.145161','590','wuvgvxjorh',3,'',11,7),
(591,'2025-10-07 20:19:48.145180','589','nrklehumlq',3,'',11,7),
(592,'2025-10-07 20:19:48.145198','588','gxiuvnqvyu',3,'',11,7),
(593,'2025-10-07 20:19:48.145215','587','yohldunuod',3,'',11,7),
(594,'2025-10-07 20:19:48.145233','586','yvoemvmokj',3,'',11,7),
(595,'2025-10-07 20:19:48.145250','585','kztmmrrish',3,'',11,7),
(596,'2025-10-07 20:19:48.145267','584','fpjxsusoos',3,'',11,7),
(597,'2025-10-07 20:19:48.145285','583','vkoqkugdmv',3,'',11,7),
(598,'2025-10-07 20:19:48.145303','582','hjmyhdrodj',3,'',11,7),
(599,'2025-10-07 20:19:48.145320','581','jyswurnqly',3,'',11,7),
(600,'2025-10-07 20:19:48.145339','580','epqwpmusov',3,'',11,7),
(601,'2025-10-07 20:19:48.145357','579','mqdifklpvm',3,'',11,7),
(602,'2025-10-07 20:19:48.145375','578','iswllstlrg',3,'',11,7),
(603,'2025-10-07 20:19:48.145393','577','pvlxozlxxt',3,'',11,7),
(604,'2025-10-07 20:19:48.145411','576','krxhjdetyl',3,'',11,7),
(605,'2025-10-07 20:19:48.145867','575','uufddeirqp',3,'',11,7),
(606,'2025-10-07 20:19:48.145890','574','vxohgjwryf',3,'',11,7),
(607,'2025-10-07 20:19:48.145909','573','nzflekejuh',3,'',11,7),
(608,'2025-10-07 20:19:48.145926','572','ffhzntlrgi',3,'',11,7),
(609,'2025-10-07 20:19:48.145944','571','jrneturrwi',3,'',11,7),
(610,'2025-10-07 20:19:48.145961','570','fnrpqnryzz',3,'',11,7),
(611,'2025-10-07 20:19:48.145978','569','kyrwgskxyz',3,'',11,7),
(612,'2025-10-07 20:19:48.145995','568','zozphgsvqu',3,'',11,7),
(613,'2025-10-07 20:19:48.146012','567','znsnvdtsdw',3,'',11,7),
(614,'2025-10-07 20:19:48.146029','566','fwkkgmwgwe',3,'',11,7),
(615,'2025-10-07 20:19:48.146046','565','kqlwnkugxe',3,'',11,7),
(616,'2025-10-07 20:19:48.146063','564','leteweejyp',3,'',11,7),
(617,'2025-10-07 20:19:48.146081','563','ikjywifoyh',3,'',11,7),
(618,'2025-10-07 20:19:48.146098','562','fnlxhfwrwn',3,'',11,7),
(619,'2025-10-07 20:19:48.146115','561','vskqtgzwty',3,'',11,7),
(620,'2025-10-07 20:19:48.146132','560','qptsdhdfko',3,'',11,7),
(621,'2025-10-07 20:19:48.146149','559','ppghlhiltr',3,'',11,7),
(622,'2025-10-07 20:19:48.146166','558','igqgxuluhf',3,'',11,7),
(623,'2025-10-07 20:19:48.146183','557','ummmjwruyh',3,'',11,7),
(624,'2025-10-07 20:19:48.146199','556','yjlohtfdss',3,'',11,7),
(625,'2025-10-07 20:19:48.146217','555','fysuhuzexe',3,'',11,7),
(626,'2025-10-07 20:19:48.146234','554','vmmgexvkkz',3,'',11,7),
(627,'2025-10-07 20:19:48.146251','553','qmnovhsqyo',3,'',11,7),
(628,'2025-10-07 20:19:48.146269','552','dnehxljviu',3,'',11,7),
(629,'2025-10-07 20:19:48.146286','551','lrnyznkthr',3,'',11,7),
(630,'2025-10-07 20:19:48.146303','550','uuttkgdrwn',3,'',11,7),
(631,'2025-10-07 20:19:48.146319','549','giimuflknf',3,'',11,7),
(632,'2025-10-07 20:19:48.146336','548','xqlumedgqw',3,'',11,7),
(633,'2025-10-07 20:19:48.146353','547','vzlxkrlmui',3,'',11,7),
(634,'2025-10-07 20:19:48.146370','546','xojlhxphgo',3,'',11,7),
(635,'2025-10-07 20:19:48.146388','545','qlsnpnlhzg',3,'',11,7),
(636,'2025-10-07 20:19:48.146405','544','ddrgzfgdsw',3,'',11,7),
(637,'2025-10-07 20:19:48.146450','543','mwrrkhzpgl',3,'',11,7),
(638,'2025-10-07 20:19:48.146477','542','ysghrqpvhg',3,'',11,7),
(639,'2025-10-07 20:19:48.146496','541','sllgprrwyq',3,'',11,7),
(640,'2025-10-07 20:19:48.146513','540','munnxgmqfk',3,'',11,7),
(641,'2025-10-07 20:19:48.146531','539','umlzsjvzhl',3,'',11,7),
(642,'2025-10-07 20:19:48.146548','538','xzdhwjrleg',3,'',11,7),
(643,'2025-10-07 20:19:48.146564','537','llwyoxhhso',3,'',11,7),
(644,'2025-10-07 20:19:48.146581','536','zirzfepuvh',3,'',11,7),
(645,'2025-10-07 20:19:48.146598','535','qpzudgptvx',3,'',11,7),
(646,'2025-10-07 20:19:48.146615','534','zwyptijnul',3,'',11,7),
(647,'2025-10-07 20:19:48.146632','533','rlfosffdpf',3,'',11,7),
(648,'2025-10-07 20:19:48.146649','532','hsfptntlsr',3,'',11,7),
(649,'2025-10-07 20:19:48.146666','531','tvvdmrddlf',3,'',11,7),
(650,'2025-10-07 20:19:48.146682','530','xnsfjgigtp',3,'',11,7),
(651,'2025-10-07 20:19:48.146699','529','hvlqfejurh',3,'',11,7),
(652,'2025-10-07 20:19:48.146716','528','gipfshsrns',3,'',11,7),
(653,'2025-10-07 20:19:48.146733','527','zpdoiljkyo',3,'',11,7),
(654,'2025-10-07 20:19:48.146750','526','ewrvdsfief',3,'',11,7),
(655,'2025-10-07 20:19:48.146768','524','smphxtzgxg',3,'',11,7),
(656,'2025-10-07 20:19:48.146785','523','xzpvggssvl',3,'',11,7),
(657,'2025-10-07 20:19:48.146802','522','ksvifkvjlr',3,'',11,7),
(658,'2025-10-07 20:19:48.146819','521','lzfjndoyyl',3,'',11,7),
(659,'2025-10-07 20:19:48.146835','520','rnekhiruqv',3,'',11,7),
(660,'2025-10-07 20:19:48.146852','519','dtltnsoudy',3,'',11,7),
(661,'2025-10-07 20:20:21.300866','518','hrozehmpty',3,'',11,7),
(662,'2025-10-07 20:20:21.300930','517','jwoqyswuue',3,'',11,7),
(663,'2025-10-07 20:20:21.300961','516','njpdnpfymr',3,'',11,7),
(664,'2025-10-07 20:20:21.300987','515','oemmexnluk',3,'',11,7),
(665,'2025-10-07 20:20:21.301013','514','temuyqzewu',3,'',11,7),
(666,'2025-10-07 20:20:21.301038','513','lrjehudzqj',3,'',11,7),
(667,'2025-10-07 20:20:21.301062','512','drdvumvgqp',3,'',11,7),
(668,'2025-10-07 20:20:21.301086','511','zohgiszkqn',3,'',11,7),
(669,'2025-10-07 20:20:21.301109','510','gmtksvfpxh',3,'',11,7),
(670,'2025-10-07 20:20:21.301133','509','fxfkdgnefj',3,'',11,7),
(671,'2025-10-07 20:20:21.301155','508','fxqjuurtxw',3,'',11,7),
(672,'2025-10-07 20:20:21.301177','507','dvmpetwpzr',3,'',11,7),
(673,'2025-10-07 20:20:21.301200','506','ikzxgotozl',3,'',11,7),
(674,'2025-10-07 20:20:21.301222','505','pslnryxzjy',3,'',11,7),
(675,'2025-10-07 20:20:21.301244','504','fkjpqyxkgp',3,'',11,7),
(676,'2025-10-07 20:20:21.301267','503','kyssgeomje',3,'',11,7),
(677,'2025-10-07 20:20:21.301289','502','dowfyruidv',3,'',11,7),
(678,'2025-10-07 20:20:21.301311','501','godlowpnwv',3,'',11,7),
(679,'2025-10-07 20:20:21.301333','500','ylsoxgzodh',3,'',11,7),
(680,'2025-10-07 20:20:21.301356','499','ptimyfvhti',3,'',11,7),
(681,'2025-10-07 20:20:21.301378','498','kftwlslwur',3,'',11,7),
(682,'2025-10-07 20:20:21.301401','497','lwhxwengii',3,'',11,7),
(683,'2025-10-07 20:20:21.301464','496','kshurwoxfu',3,'',11,7),
(684,'2025-10-07 20:20:21.301498','495','giilhnfkux',3,'',11,7),
(685,'2025-10-07 20:20:21.301521','494','xefihvqxdv',3,'',11,7),
(686,'2025-10-07 20:20:21.301544','493','vnydkqpnrg',3,'',11,7),
(687,'2025-10-07 20:20:21.301565','492','fhjnylwusk',3,'',11,7),
(688,'2025-10-07 20:20:21.301587','491','dsgzmikrev',3,'',11,7),
(689,'2025-10-07 20:20:21.301608','490','othxpmysgx',3,'',11,7),
(690,'2025-10-07 20:20:21.301630','489','tigdihxyll',3,'',11,7),
(691,'2025-10-07 20:20:21.301652','488','rinuwzxujh',3,'',11,7),
(692,'2025-10-07 20:20:21.301673','487','fykihuyzoz',3,'',11,7),
(693,'2025-10-07 20:20:21.301694','486','imihshkelw',3,'',11,7),
(694,'2025-10-07 20:20:21.301716','485','krnqnxipvj',3,'',11,7),
(695,'2025-10-07 20:20:21.301737','484','qgxdlwpgry',3,'',11,7),
(696,'2025-10-07 20:20:21.301759','483','meooqzgurn',3,'',11,7),
(697,'2025-10-07 20:20:21.301780','482','iqxuqfslvz',3,'',11,7),
(698,'2025-10-07 20:20:21.301801','481','qggwytxrhl',3,'',11,7),
(699,'2025-10-07 20:20:21.301823','480','teovwsqjes',3,'',11,7),
(700,'2025-10-07 20:20:21.301845','479','tjnvrfdhhz',3,'',11,7),
(701,'2025-10-07 20:20:21.301866','478','qlqrfepswi',3,'',11,7),
(702,'2025-10-07 20:20:21.301888','477','dhjsendzlo',3,'',11,7),
(703,'2025-10-07 20:20:21.301911','476','tpgprphxpl',3,'',11,7),
(704,'2025-10-07 20:20:21.301933','475','drqjsgpxjs',3,'',11,7),
(705,'2025-10-07 20:20:21.301955','474','zgpmswqtei',3,'',11,7),
(706,'2025-10-07 20:20:21.301976','473','nrdwzflsvg',3,'',11,7),
(707,'2025-10-07 20:20:21.301997','472','umkfqynlwq',3,'',11,7),
(708,'2025-10-07 20:20:21.302019','471','pghuiyluyf',3,'',11,7),
(709,'2025-10-07 20:20:21.302041','470','tltxlywdtp',3,'',11,7),
(710,'2025-10-07 20:20:21.302064','469','tfjjkdisip',3,'',11,7),
(711,'2025-10-07 20:20:21.302087','468','tpnipeneoq',3,'',11,7),
(712,'2025-10-07 20:20:21.302109','467','fgjoerypul',3,'',11,7),
(713,'2025-10-07 20:20:21.302132','466','jkyguwigjk',3,'',11,7),
(714,'2025-10-07 20:20:21.302154','465','nvxtelfyoi',3,'',11,7),
(715,'2025-10-07 20:20:21.302176','464','nxplsxvjsd',3,'',11,7),
(716,'2025-10-07 20:20:21.302197','463','nznkhuzrzo',3,'',11,7),
(717,'2025-10-07 20:20:21.302218','462','gzjnevrgrw',3,'',11,7),
(718,'2025-10-07 20:20:21.302239','461','uvqnlhqusq',3,'',11,7),
(719,'2025-10-07 20:20:21.302260','460','vrhmpehsfq',3,'',11,7),
(720,'2025-10-07 20:20:21.302282','459','wzlrmhyujv',3,'',11,7),
(721,'2025-10-07 20:20:21.302303','458','egpjqfuwgq',3,'',11,7),
(722,'2025-10-07 20:20:21.302324','457','zsymkydohj',3,'',11,7),
(723,'2025-10-07 20:20:21.302345','456','ozzmleprgf',3,'',11,7),
(724,'2025-10-07 20:20:21.302366','455','ykirvsletj',3,'',11,7),
(725,'2025-10-07 20:20:21.302387','454','eivydxfssj',3,'',11,7),
(726,'2025-10-07 20:20:21.302410','453','zlhysprqhk',3,'',11,7),
(727,'2025-10-07 20:20:21.302476','452','xjftnnkskg',3,'',11,7),
(728,'2025-10-07 20:20:21.302503','451','fluhdnwols',3,'',11,7),
(729,'2025-10-07 20:20:21.302524','450','gjpekhwjek',3,'',11,7),
(730,'2025-10-07 20:20:21.302545','449','zvknqrhmkm',3,'',11,7),
(731,'2025-10-07 20:20:21.302567','448','wkjkrxdxii',3,'',11,7),
(732,'2025-10-07 20:20:21.302588','447','gxlspurjrv',3,'',11,7),
(733,'2025-10-07 20:20:21.302609','446','zrozkhdyzj',3,'',11,7),
(734,'2025-10-07 20:20:21.302630','445','wfhwkfouyj',3,'',11,7),
(735,'2025-10-07 20:20:21.302651','444','fkspzevqtl',3,'',11,7),
(736,'2025-10-07 20:20:21.302672','443','jyspovngfl',3,'',11,7),
(737,'2025-10-07 20:20:21.302693','442','rftxvppgyo',3,'',11,7),
(738,'2025-10-07 20:20:21.302716','441','khwjfngszn',3,'',11,7),
(739,'2025-10-07 20:20:21.302738','440','dpwrqfyylo',3,'',11,7),
(740,'2025-10-07 20:20:21.302759','439','vpvyznomsq',3,'',11,7),
(741,'2025-10-07 20:20:21.302780','438','qznpmzytli',3,'',11,7),
(742,'2025-10-07 20:20:21.302801','437','rmgowlljgw',3,'',11,7),
(743,'2025-10-07 20:20:21.302822','436','lrvdnmeste',3,'',11,7),
(744,'2025-10-07 20:20:21.302843','435','rwsmltwvqt',3,'',11,7),
(745,'2025-10-07 20:20:21.302864','434','dxjovvhxvu',3,'',11,7),
(746,'2025-10-07 20:20:21.302885','433','nuqkfuvnvh',3,'',11,7),
(747,'2025-10-07 20:20:21.302906','432','dwtxgyqhjn',3,'',11,7),
(748,'2025-10-07 20:20:21.302927','431','jmosvhofgv',3,'',11,7),
(749,'2025-10-07 20:20:21.302948','430','hkqqunhpdx',3,'',11,7),
(750,'2025-10-07 20:20:21.302969','429','ntppuhdyon',3,'',11,7),
(751,'2025-10-07 20:20:21.302989','428','juewywetow',3,'',11,7),
(752,'2025-10-07 20:20:21.303010','427','pmumhehtnm',3,'',11,7),
(753,'2025-10-07 20:20:21.303031','426','gxyvglulzy',3,'',11,7),
(754,'2025-10-07 20:20:21.303055','425','xefhlxquhl',3,'',11,7),
(755,'2025-10-07 20:20:21.303075','424','vnemnoptkj',3,'',11,7),
(756,'2025-10-07 20:20:21.303096','423','pgieeexmfl',3,'',11,7),
(757,'2025-10-07 20:20:21.303117','422','ksfohuwwfs',3,'',11,7),
(758,'2025-10-07 20:20:21.303138','421','psgiwiuplh',3,'',11,7),
(759,'2025-10-07 20:20:21.303158','420','zvosehqnsg',3,'',11,7),
(760,'2025-10-07 20:20:45.345711','419','kmdjpplizh',3,'',11,7),
(761,'2025-10-07 20:20:45.345786','418','omyzodonww',3,'',11,7),
(762,'2025-10-07 20:20:45.345824','417','nhfqsgzqdf',3,'',11,7),
(763,'2025-10-07 20:20:45.345866','416','lpjtxqxrwr',3,'',11,7),
(764,'2025-10-07 20:20:45.345905','415','pnlkxumqsv',3,'',11,7),
(765,'2025-10-07 20:20:45.345938','414','gfhzfpengd',3,'',11,7),
(766,'2025-10-07 20:20:45.345971','413','pujhksotld',3,'',11,7),
(767,'2025-10-07 20:20:45.346005','412','npiytmiuro',3,'',11,7),
(768,'2025-10-07 20:20:45.346041','411','domdylooip',3,'',11,7),
(769,'2025-10-07 20:20:45.346146','410','oqfiexgggi',3,'',11,7),
(770,'2025-10-07 20:20:45.346194','409','fxfojswgqy',3,'',11,7),
(771,'2025-10-07 20:20:45.346228','408','jozwihxmqt',3,'',11,7),
(772,'2025-10-07 20:20:45.346266','407','trtfvgskxm',3,'',11,7),
(773,'2025-10-07 20:20:45.346300','406','wuitiryedj',3,'',11,7),
(774,'2025-10-07 20:20:45.346337','405','snnxzgdsuh',3,'',11,7),
(775,'2025-10-07 20:20:45.346375','404','ejlrkpjlmo',3,'',11,7),
(776,'2025-10-07 20:20:45.346416','403','rvtxhdqzey',3,'',11,7),
(777,'2025-10-07 20:20:45.346505','402','quqrqztinl',3,'',11,7),
(778,'2025-10-07 20:20:45.346541','401','istximzwho',3,'',11,7),
(779,'2025-10-07 20:20:45.346575','400','usunhxvkqx',3,'',11,7),
(780,'2025-10-07 20:20:45.346606','399','jgkvypmwnu',3,'',11,7),
(781,'2025-10-07 20:20:45.346637','398','dyurynsyfr',3,'',11,7),
(782,'2025-10-07 20:20:45.346669','397','kexkpzdftq',3,'',11,7),
(783,'2025-10-07 20:20:45.346754','396','nmsyokkqfp',3,'',11,7),
(784,'2025-10-07 20:20:45.346788','395','xfzxfiffsw',3,'',11,7),
(785,'2025-10-07 20:20:45.346817','394','whghegpqyv',3,'',11,7),
(786,'2025-10-07 20:20:45.346849','393','mqhnliirxu',3,'',11,7),
(787,'2025-10-07 20:20:45.346880','392','rjtjwrxryt',3,'',11,7),
(788,'2025-10-07 20:20:45.346904','391','enmpszmhjz',3,'',11,7),
(789,'2025-10-07 20:20:45.346928','390','wtfoqywqhk',3,'',11,7),
(790,'2025-10-07 20:20:45.346951','389','ziufkodikl',3,'',11,7),
(791,'2025-10-07 20:20:45.346974','388','ykodkzhnrv',3,'',11,7),
(792,'2025-10-07 20:20:45.346999','387','lnoxeyqjrw',3,'',11,7),
(793,'2025-10-07 20:20:45.347024','386','ngnlrkrsvd',3,'',11,7),
(794,'2025-10-07 20:20:45.347046','385','rfltdddygw',3,'',11,7),
(795,'2025-10-07 20:20:45.347069','384','myijrqdwhd',3,'',11,7),
(796,'2025-10-07 20:20:45.347093','383','xegtwnojph',3,'',11,7),
(797,'2025-10-07 20:20:45.347116','382','xeqidruzii',3,'',11,7),
(798,'2025-10-07 20:20:45.347140','381','rweprpvfkj',3,'',11,7),
(799,'2025-10-07 20:20:45.347180','380','ttiwkzqfzh',3,'',11,7),
(800,'2025-10-07 20:20:45.347205','379','wtnltypshn',3,'',11,7),
(801,'2025-10-07 20:20:45.347229','378','ddreevjttw',3,'',11,7),
(802,'2025-10-07 20:20:45.347252','377','gokmldzudk',3,'',11,7),
(803,'2025-10-07 20:20:45.347272','376','npwuxeiznl',3,'',11,7),
(804,'2025-10-07 20:20:45.347291','375','dlpnvvynhv',3,'',11,7),
(805,'2025-10-07 20:20:45.347311','374','enpyrkjkvz',3,'',11,7),
(806,'2025-10-07 20:20:45.347330','373','hhwvkttmxl',3,'',11,7),
(807,'2025-10-07 20:20:45.347350','372','rglnmdpdwk',3,'',11,7),
(808,'2025-10-07 20:20:45.347369','371','puqeoqlpro',3,'',11,7),
(809,'2025-10-07 20:20:45.347390','370','iirdkkdsre',3,'',11,7),
(810,'2025-10-07 20:20:45.347410','369','qfrvuvngdi',3,'',11,7),
(811,'2025-10-07 20:20:45.347479','368','fvjgxtesml',3,'',11,7),
(812,'2025-10-07 20:20:45.347505','367','wsrloequew',3,'',11,7),
(813,'2025-10-07 20:20:45.347526','366','mljtwfvfvw',3,'',11,7),
(814,'2025-10-07 20:20:45.347549','365','zopizlmfgz',3,'',11,7),
(815,'2025-10-07 20:20:45.347596','364','jqyyovjwvn',3,'',11,7),
(816,'2025-10-07 20:20:45.347621','363','xyysouxtjl',3,'',11,7),
(817,'2025-10-07 20:20:45.347640','362','swlrmjjpld',3,'',11,7),
(818,'2025-10-07 20:20:45.347659','361','vikwumkvln',3,'',11,7),
(819,'2025-10-07 20:20:45.347678','360','fiqplzrvpj',3,'',11,7),
(820,'2025-10-07 20:20:45.347697','359','fodfsmefxw',3,'',11,7),
(821,'2025-10-07 20:20:45.347716','358','iijjqmndvl',3,'',11,7),
(822,'2025-10-07 20:20:45.347736','357','rdhyhzpjjq',3,'',11,7),
(823,'2025-10-07 20:20:45.347756','356','kifvqtfuee',3,'',11,7),
(824,'2025-10-07 20:20:45.347775','355','xeheyiqrri',3,'',11,7),
(825,'2025-10-07 20:20:45.347794','354','vqddzyvsgu',3,'',11,7),
(826,'2025-10-07 20:20:45.347813','353','ipnglqptsh',3,'',11,7),
(827,'2025-10-07 20:20:45.347832','352','kiyythrqhk',3,'',11,7),
(828,'2025-10-07 20:20:45.347851','351','genkqizvqv',3,'',11,7),
(829,'2025-10-07 20:20:45.347870','350','mmwhqqzqto',3,'',11,7),
(830,'2025-10-07 20:20:45.347889','349','pgpgzsmypt',3,'',11,7),
(831,'2025-10-07 20:20:45.347908','348','ulgywwpnvz',3,'',11,7),
(832,'2025-10-07 20:20:45.347927','347','gwfxmyrtep',3,'',11,7),
(833,'2025-10-07 20:20:45.347946','346','tooittexvx',3,'',11,7),
(834,'2025-10-07 20:20:45.347964','345','yrqpxtswom',3,'',11,7),
(835,'2025-10-07 20:20:45.347983','344','spufztxltq',3,'',11,7),
(836,'2025-10-07 20:20:45.348002','343','vtqgdqfpki',3,'',11,7),
(837,'2025-10-07 20:20:45.348022','342','wprodjromt',3,'',11,7),
(838,'2025-10-07 20:20:45.348042','341','hhdemjneyg',3,'',11,7),
(839,'2025-10-07 20:20:45.348061','340','jqdxjgxgot',3,'',11,7),
(840,'2025-10-07 20:20:45.348081','339','rvydwlplru',3,'',11,7),
(841,'2025-10-07 20:20:45.348106','338','fvwquvftmg',3,'',11,7),
(842,'2025-10-07 20:20:45.348136','337','kqttzfgijw',3,'',11,7),
(843,'2025-10-07 20:20:45.348187','336','lrmldsivmt',3,'',11,7),
(844,'2025-10-07 20:20:45.348218','335','ymirsrnmzk',3,'',11,7),
(845,'2025-10-07 20:20:45.348239','334','ekjmpehxxr',3,'',11,7),
(846,'2025-10-07 20:20:45.348258','333','ekswfqjvqq',3,'',11,7),
(847,'2025-10-07 20:20:45.348277','332','fhrlfotyil',3,'',11,7),
(848,'2025-10-07 20:20:45.348296','331','izsilvxoyd',3,'',11,7),
(849,'2025-10-07 20:20:45.348316','330','tzkspzvwsw',3,'',11,7),
(850,'2025-10-07 20:20:45.348335','329','dshthgnqei',3,'',11,7),
(851,'2025-10-07 20:20:45.348354','328','qdofzdpqlu',3,'',11,7),
(852,'2025-10-07 20:20:45.348373','327','pgxfshwwzo',3,'',11,7),
(853,'2025-10-07 20:20:45.348394','326','ekeyyypqlm',3,'',11,7),
(854,'2025-10-07 20:20:45.348413','325','ifqtstzhln',3,'',11,7),
(855,'2025-10-07 20:20:45.348467','324','ghmsfmxoon',3,'',11,7),
(856,'2025-10-07 20:20:45.348490','323','zrhvrnwrpp',3,'',11,7),
(857,'2025-10-07 20:20:45.348510','322','sjrvfxjkey',3,'',11,7),
(858,'2025-10-07 20:20:45.348529','321','jdfspdgmvx',3,'',11,7),
(859,'2025-10-07 20:21:17.074587','320','thhysvdshy',3,'',11,7),
(860,'2025-10-07 20:21:17.074712','319','xwidlugvgg',3,'',11,7),
(861,'2025-10-07 20:21:17.074742','318','lgyfgpzugx',3,'',11,7),
(862,'2025-10-07 20:21:17.074768','317','qtllmvpwio',3,'',11,7),
(863,'2025-10-07 20:21:17.074791','316','zidenzuveh',3,'',11,7),
(864,'2025-10-07 20:21:17.074813','315','qhfdjjujhn',3,'',11,7),
(865,'2025-10-07 20:21:17.074834','314','zihtsngxiy',3,'',11,7),
(866,'2025-10-07 20:21:17.074855','313','ysgxgtddwi',3,'',11,7),
(867,'2025-10-07 20:21:17.074874','312','nqopsrwifz',3,'',11,7),
(868,'2025-10-07 20:21:17.074895','311','sodspwdoqg',3,'',11,7),
(869,'2025-10-07 20:21:17.074914','310','syvppzsdmx',3,'',11,7),
(870,'2025-10-07 20:21:17.074934','309','dfeiiymtsw',3,'',11,7),
(871,'2025-10-07 20:21:17.074954','308','tyzssfnhze',3,'',11,7),
(872,'2025-10-07 20:21:17.074974','307','dmfmowtgex',3,'',11,7),
(873,'2025-10-07 20:21:17.074993','306','xnddsuowhd',3,'',11,7),
(874,'2025-10-07 20:21:17.075012','305','zgoexiljol',3,'',11,7),
(875,'2025-10-07 20:21:17.075030','304','etxfnkevgd',3,'',11,7),
(876,'2025-10-07 20:21:17.075049','303','exvddmruyg',3,'',11,7),
(877,'2025-10-07 20:21:17.075068','302','seumqhpzug',3,'',11,7),
(878,'2025-10-07 20:21:17.075087','301','ldknsrrvpx',3,'',11,7),
(879,'2025-10-07 20:21:17.075107','300','qmriqfzyfx',3,'',11,7),
(880,'2025-10-07 20:21:17.075125','299','ihvdfriflg',3,'',11,7),
(881,'2025-10-07 20:21:17.075145','298','rzrlswmnpz',3,'',11,7),
(882,'2025-10-07 20:21:17.075164','297','fohgnqkpxm',3,'',11,7),
(883,'2025-10-07 20:21:17.075183','296','ipxggniqos',3,'',11,7),
(884,'2025-10-07 20:21:17.075203','295','lfviztwgpg',3,'',11,7),
(885,'2025-10-07 20:21:17.075221','294','fsvmjsznlx',3,'',11,7),
(886,'2025-10-07 20:21:17.075240','293','kqtgydnrwi',3,'',11,7),
(887,'2025-10-07 20:21:17.075260','292','vrivfpmdpd',3,'',11,7),
(888,'2025-10-07 20:21:17.075278','291','mzrzvhoihp',3,'',11,7),
(889,'2025-10-07 20:21:17.075297','290','kikninhoqo',3,'',11,7),
(890,'2025-10-07 20:21:17.075316','289','gjytdxrizf',3,'',11,7),
(891,'2025-10-07 20:21:17.075335','288','wgnufoqwdh',3,'',11,7),
(892,'2025-10-07 20:21:17.075355','287','hkndvyykru',3,'',11,7),
(893,'2025-10-07 20:21:17.075373','286','iqwzesvgvd',3,'',11,7),
(894,'2025-10-07 20:21:17.075393','285','pflkogpmie',3,'',11,7),
(895,'2025-10-07 20:21:17.075468','284','xgskhhhzqs',3,'',11,7),
(896,'2025-10-07 20:21:17.075497','283','yeyqtoothj',3,'',11,7),
(897,'2025-10-07 20:21:17.075522','282','mltjdgfqoo',3,'',11,7),
(898,'2025-10-07 20:21:17.075545','281','jeqlptgydy',3,'',11,7),
(899,'2025-10-07 20:21:17.075569','280','eowhkhoxio',3,'',11,7),
(900,'2025-10-07 20:21:17.075592','279','kxtmonvqsx',3,'',11,7),
(901,'2025-10-07 20:21:17.075615','278','hijokmdpkt',3,'',11,7),
(902,'2025-10-07 20:21:17.075637','277','xzlsqtqzvi',3,'',11,7),
(903,'2025-10-07 20:21:17.075658','276','ifghkoynth',3,'',11,7),
(904,'2025-10-07 20:21:17.075681','275','gzjmlmnpun',3,'',11,7),
(905,'2025-10-07 20:21:17.075703','274','ijvzhjehrv',3,'',11,7),
(906,'2025-10-07 20:21:17.075725','273','hxxhzwogxo',3,'',11,7),
(907,'2025-10-07 20:21:17.075747','272','ixwgrxwntr',3,'',11,7),
(908,'2025-10-07 20:21:17.075768','271','nunyolhhsg',3,'',11,7),
(909,'2025-10-07 20:21:17.075791','270','tpnooxkthf',3,'',11,7),
(910,'2025-10-07 20:21:17.075813','269','dqkukxvopi',3,'',11,7),
(911,'2025-10-07 20:21:17.075835','268','krurpyvrel',3,'',11,7),
(912,'2025-10-07 20:21:17.075857','267','onwoottlfj',3,'',11,7),
(913,'2025-10-07 20:21:17.075880','266','tghmwngeoo',3,'',11,7),
(914,'2025-10-07 20:21:17.075902','265','zqdlndunrx',3,'',11,7),
(915,'2025-10-07 20:21:17.075923','264','nfltjsgzgq',3,'',11,7),
(916,'2025-10-07 20:21:17.075946','263','lhiixjysgk',3,'',11,7),
(917,'2025-10-07 20:21:17.075967','262','pmefkslfxd',3,'',11,7),
(918,'2025-10-07 20:21:17.075989','261','tidxfgqrhe',3,'',11,7),
(919,'2025-10-07 20:21:17.076010','260','upfrljmquf',3,'',11,7),
(920,'2025-10-07 20:21:17.076032','259','stsuqeefuy',3,'',11,7),
(921,'2025-10-07 20:21:17.076054','258','fjemosvyke',3,'',11,7),
(922,'2025-10-07 20:21:17.076074','257','enqvspefxm',3,'',11,7),
(923,'2025-10-07 20:21:17.076096','256','qfhsjhlrdz',3,'',11,7),
(924,'2025-10-07 20:21:17.076119','255','wishiwnnew',3,'',11,7),
(925,'2025-10-07 20:21:17.076140','254','wxpzokzrnk',3,'',11,7),
(926,'2025-10-07 20:21:17.076162','253','ontpuyeqdt',3,'',11,7),
(927,'2025-10-07 20:21:17.076184','252','xlimrxehlf',3,'',11,7),
(928,'2025-10-07 20:21:17.076205','251','gxidjvqngq',3,'',11,7),
(929,'2025-10-07 20:21:17.076226','250','rnzxeygunm',3,'',11,7),
(930,'2025-10-07 20:21:17.076246','249','senesohyvx',3,'',11,7),
(931,'2025-10-07 20:21:17.076268','248','tzqnufqmin',3,'',11,7),
(932,'2025-10-07 20:21:17.076289','247','jghludnrwf',3,'',11,7),
(933,'2025-10-07 20:21:17.076309','246','ufyddnsvmv',3,'',11,7),
(934,'2025-10-07 20:21:17.076330','245','kvxqrxzxuh',3,'',11,7),
(935,'2025-10-07 20:21:17.076351','244','jkwgqodwxq',3,'',11,7),
(936,'2025-10-07 20:21:17.076375','243','qejtkfxeej',3,'',11,7),
(937,'2025-10-07 20:21:17.076396','242','xjnephytiq',3,'',11,7),
(938,'2025-10-07 20:21:17.076417','241','mlmfvelkzj',3,'',11,7),
(939,'2025-10-07 20:21:17.076483','240','jxtukhxvpt',3,'',11,7),
(940,'2025-10-07 20:21:17.076564','239','nykokiyulv',3,'',11,7),
(941,'2025-10-07 20:21:17.076591','238','mqezxwrhif',3,'',11,7),
(942,'2025-10-07 20:21:17.076612','237','dkrouieuxg',3,'',11,7),
(943,'2025-10-07 20:21:17.076632','236','lvdxvripoo',3,'',11,7),
(944,'2025-10-07 20:21:17.076653','235','lrizqurwdi',3,'',11,7),
(945,'2025-10-07 20:21:17.076674','234','urvkquuxzm',3,'',11,7),
(946,'2025-10-07 20:21:17.076694','233','dyisdunfii',3,'',11,7),
(947,'2025-10-07 20:21:17.076715','232','splmiukrlv',3,'',11,7),
(948,'2025-10-07 20:21:17.076736','231','yntxfdvwml',3,'',11,7),
(949,'2025-10-07 20:21:17.076757','230','gejnilnnxo',3,'',11,7),
(950,'2025-10-07 20:21:17.076778','229','qlmdfqjgus',3,'',11,7),
(951,'2025-10-07 20:21:17.076799','228','wrlyhgnvuw',3,'',11,7),
(952,'2025-10-07 20:21:17.076820','227','ukxfqqlqgw',3,'',11,7),
(953,'2025-10-07 20:21:17.076841','226','qhpilshiqw',3,'',11,7),
(954,'2025-10-07 20:21:17.076862','225','vjgqeojtyd',3,'',11,7),
(955,'2025-10-07 20:21:17.076882','224','vvlqdjiiii',3,'',11,7),
(956,'2025-10-07 20:21:17.076902','223','uurrzoflfm',3,'',11,7),
(957,'2025-10-07 20:21:17.076924','222','dnirtoeuzl',3,'',11,7),
(958,'2025-10-07 20:22:01.820833','221','fpjexvwfvu',3,'',11,7),
(959,'2025-10-07 20:22:01.820886','220','iszirvyhzt',3,'',11,7),
(960,'2025-10-07 20:22:01.820911','219','dsquumjllk',3,'',11,7),
(961,'2025-10-07 20:22:01.820933','218','ewmxitqufx',3,'',11,7),
(962,'2025-10-07 20:22:01.820954','217','ffuvuiflws',3,'',11,7),
(963,'2025-10-07 20:22:01.820975','216','mmtoqkunxd',3,'',11,7),
(964,'2025-10-07 20:22:01.820994','215','kpglwstpji',3,'',11,7),
(965,'2025-10-07 20:22:01.821012','214','nroknwlugg',3,'',11,7),
(966,'2025-10-07 20:22:01.821030','213','sgmfwikhup',3,'',11,7),
(967,'2025-10-07 20:22:01.821048','212','yteyqvxivy',3,'',11,7),
(968,'2025-10-07 20:22:01.821067','211','wltrpguxuj',3,'',11,7),
(969,'2025-10-07 20:22:01.821085','210','umedrnetkt',3,'',11,7),
(970,'2025-10-07 20:22:01.821102','209','mvhrhlyhmy',3,'',11,7),
(971,'2025-10-07 20:22:01.821120','208','nzvpemigtn',3,'',11,7),
(972,'2025-10-07 20:22:01.821138','207','ktdrkmqzlh',3,'',11,7),
(973,'2025-10-07 20:22:01.821155','206','kgnmhkxhnm',3,'',11,7),
(974,'2025-10-07 20:22:01.821172','205','pwdkumfgkk',3,'',11,7),
(975,'2025-10-07 20:22:01.821190','204','ygxwgwjwlj',3,'',11,7),
(976,'2025-10-07 20:22:01.821208','203','inrqktdquz',3,'',11,7),
(977,'2025-10-07 20:22:01.821225','202','ljegliqdsg',3,'',11,7),
(978,'2025-10-07 20:22:01.821243','201','uikiokdlwo',3,'',11,7),
(979,'2025-10-07 20:22:01.821262','200','mhxzwxnrnm',3,'',11,7),
(980,'2025-10-07 20:22:01.821279','199','ejuomvxfly',3,'',11,7),
(981,'2025-10-07 20:22:01.821297','198','ltumtunppk',3,'',11,7),
(982,'2025-10-07 20:22:01.821314','197','wvrfnoxdqn',3,'',11,7),
(983,'2025-10-07 20:22:01.821332','196','kylvngonew',3,'',11,7),
(984,'2025-10-07 20:22:01.821350','195','uufqjsmqid',3,'',11,7),
(985,'2025-10-07 20:22:01.821368','194','lwrxngjqhi',3,'',11,7),
(986,'2025-10-07 20:22:01.821385','193','sfinnpvxdn',3,'',11,7),
(987,'2025-10-07 20:22:01.821402','192','ynyqkixphz',3,'',11,7),
(988,'2025-10-07 20:22:01.821446','191','pholutrgsm',3,'',11,7),
(989,'2025-10-07 20:22:01.821474','190','shxptmhtzl',3,'',11,7),
(990,'2025-10-07 20:22:01.821492','189','ilfyoresrr',3,'',11,7),
(991,'2025-10-07 20:22:01.821511','188','ppwdtswems',3,'',11,7),
(992,'2025-10-07 20:22:01.821528','187','zrqovseovx',3,'',11,7),
(993,'2025-10-07 20:22:01.821545','186','pzosvgtnfn',3,'',11,7),
(994,'2025-10-07 20:22:01.821563','185','zyzdqjnqqf',3,'',11,7),
(995,'2025-10-07 20:22:01.821581','184','xdkpuhtpwz',3,'',11,7),
(996,'2025-10-07 20:22:01.821598','183','urvxuokrqp',3,'',11,7),
(997,'2025-10-07 20:22:01.821615','182','vwzdilfkyj',3,'',11,7),
(998,'2025-10-07 20:22:01.821633','181','lidgnjvmgl',3,'',11,7),
(999,'2025-10-07 20:22:01.821651','180','pweekmjxof',3,'',11,7),
(1000,'2025-10-07 20:22:01.821668','179','sgsgudltsq',3,'',11,7),
(1001,'2025-10-07 20:22:01.821685','178','gheysdtheg',3,'',11,7),
(1002,'2025-10-07 20:22:01.821703','177','dnnzsfwveh',3,'',11,7),
(1003,'2025-10-07 20:22:01.821720','176','srfhyjpfql',3,'',11,7),
(1004,'2025-10-07 20:22:01.821737','175','mmhvtulwlq',3,'',11,7),
(1005,'2025-10-07 20:22:01.821755','174','zqyvtvumww',3,'',11,7),
(1006,'2025-10-07 20:22:01.821773','173','xfeujwkxyy',3,'',11,7),
(1007,'2025-10-07 20:22:01.821792','172','mzkyvogtzv',3,'',11,7),
(1008,'2025-10-07 20:22:01.821809','171','khsefhffqe',3,'',11,7),
(1009,'2025-10-07 20:22:01.821827','170','neerhnvloo',3,'',11,7),
(1010,'2025-10-07 20:22:01.821845','169','sqtxhwnyof',3,'',11,7),
(1011,'2025-10-07 20:22:01.821862','168','vkqydjymzt',3,'',11,7),
(1012,'2025-10-07 20:22:01.821879','167','sfdwmwdvsm',3,'',11,7),
(1013,'2025-10-07 20:22:01.821896','166','tkeuonfgij',3,'',11,7),
(1014,'2025-10-07 20:22:01.821913','165','vflvhfdlhl',3,'',11,7),
(1015,'2025-10-07 20:22:01.821930','164','grvgyzmegr',3,'',11,7),
(1016,'2025-10-07 20:22:01.821947','163','evgjnxvdpm',3,'',11,7),
(1017,'2025-10-07 20:22:01.821964','162','insxxewtow',3,'',11,7),
(1018,'2025-10-07 20:22:01.821982','161','nflyrnhfnq',3,'',11,7),
(1019,'2025-10-07 20:22:01.821998','160','eotpxwsdvu',3,'',11,7),
(1020,'2025-10-07 20:22:01.822016','159','ystpqfohum',3,'',11,7),
(1021,'2025-10-07 20:22:01.822032','158','fzgtymjtmy',3,'',11,7),
(1022,'2025-10-07 20:22:01.822049','157','nxsxmetxjo',3,'',11,7),
(1023,'2025-10-07 20:22:01.822067','156','xtntgrexnm',3,'',11,7),
(1024,'2025-10-07 20:22:01.822084','152','fhslvipisf',3,'',11,7),
(1025,'2025-10-07 20:22:01.822101','151','yuomdkyjdh',3,'',11,7),
(1026,'2025-10-07 20:22:01.822118','150','tzfpomgrvi',3,'',11,7),
(1027,'2025-10-07 20:22:01.822135','149','onfjfpeehj',3,'',11,7),
(1028,'2025-10-07 20:22:01.822152','148','jfogpdovmn',3,'',11,7),
(1029,'2025-10-07 20:22:01.822169','147','qlyjepsidz',3,'',11,7),
(1030,'2025-10-07 20:22:01.822186','146','vqkwnxzwmg',3,'',11,7),
(1031,'2025-10-07 20:22:01.822203','145','qoqryidjpe',3,'',11,7),
(1032,'2025-10-07 20:22:01.822221','144','ugxwoittpy',3,'',11,7),
(1033,'2025-10-07 20:22:01.822238','143','oskqioxmij',3,'',11,7),
(1034,'2025-10-07 20:22:01.822255','142','owrjgkifnd',3,'',11,7),
(1035,'2025-10-07 20:22:01.822273','141','oyvulqvwfu',3,'',11,7),
(1036,'2025-10-07 20:22:01.822291','140','tltfrmxyrf',3,'',11,7),
(1037,'2025-10-07 20:22:01.822308','139','pdertzxfyz',3,'',11,7),
(1038,'2025-10-07 20:22:01.822324','138','epprohegom',3,'',11,7),
(1039,'2025-10-07 20:22:01.822341','137','omrygurqxi',3,'',11,7),
(1040,'2025-10-07 20:22:01.822358','136','zjdlfnzhgj',3,'',11,7),
(1041,'2025-10-07 20:22:01.822375','135','unlkxgyemx',3,'',11,7),
(1042,'2025-10-07 20:22:01.822392','134','lfihqqvlwh',3,'',11,7),
(1043,'2025-10-07 20:22:01.822409','133','nytuwxyvrv',3,'',11,7),
(1044,'2025-10-07 20:22:01.822458','132','xfgynixymo',3,'',11,7),
(1045,'2025-10-07 20:22:01.822480','131','jzkwmqekmn',3,'',11,7),
(1046,'2025-10-07 20:22:01.822497','130','prhvgtlqvx',3,'',11,7),
(1047,'2025-10-07 20:22:01.822514','129','smoxgiipqm',3,'',11,7),
(1048,'2025-10-07 20:22:01.822531','128','xpsfgtmnnx',3,'',11,7),
(1049,'2025-10-07 20:22:01.822548','127','tdftynddmv',3,'',11,7),
(1050,'2025-10-07 20:22:01.822565','126','mooweztigq',3,'',11,7),
(1051,'2025-10-07 20:22:01.822583','125','vdthftzhwo',3,'',11,7),
(1052,'2025-10-07 20:22:01.822599','124','nuotxhvqrx',3,'',11,7),
(1053,'2025-10-07 20:22:01.822616','123','wqhomhrygg',3,'',11,7),
(1054,'2025-10-07 20:22:57.510714','122','jmfimudwyt',3,'',11,7),
(1055,'2025-10-07 20:22:57.510762','121','mnusivjoju',3,'',11,7),
(1056,'2025-10-07 20:22:57.510788','120','lehgmjdvtp',3,'',11,7),
(1057,'2025-10-07 20:22:57.510811','119','tqvkrvkhmi',3,'',11,7),
(1058,'2025-10-07 20:22:57.510833','118','hxxuuersiv',3,'',11,7),
(1059,'2025-10-07 20:22:57.510856','117','ugdsledtei',3,'',11,7),
(1060,'2025-10-07 20:22:57.510876','116','hglfnhtljf',3,'',11,7),
(1061,'2025-10-07 20:22:57.510896','115','thnfxsggxq',3,'',11,7),
(1062,'2025-10-07 20:22:57.510916','114','jteovgjtqy',3,'',11,7),
(1063,'2025-10-07 20:22:57.510935','113','gfdfwhojrv',3,'',11,7),
(1064,'2025-10-07 20:22:57.510954','112','uldzwtnjvv',3,'',11,7),
(1065,'2025-10-07 20:22:57.510974','111','lknxulfmnf',3,'',11,7),
(1066,'2025-10-07 20:22:57.510994','110','tgdrlovxkl',3,'',11,7),
(1067,'2025-10-07 20:22:57.511014','109','fwqukmxpgf',3,'',11,7),
(1068,'2025-10-07 20:22:57.511033','108','xguozhpprv',3,'',11,7),
(1069,'2025-10-07 20:22:57.511053','107','fqkrxfuorl',3,'',11,7),
(1070,'2025-10-07 20:22:57.511072','106','erqmdnhpdj',3,'',11,7),
(1071,'2025-10-07 20:22:57.511091','105','kekofdzsxt',3,'',11,7),
(1072,'2025-10-07 20:22:57.511111','104','wwmdinhkow',3,'',11,7),
(1073,'2025-10-07 20:22:57.511130','103','xwgspfdlmm',3,'',11,7),
(1074,'2025-10-07 20:22:57.511150','102','oronifnyok',3,'',11,7),
(1075,'2025-10-07 20:22:57.511182','101','klhvjuwmgy',3,'',11,7),
(1076,'2025-10-07 20:22:57.511230','100','nmomxklifr',3,'',11,7),
(1077,'2025-10-07 20:22:57.511276','99','imxsqmiqgl',3,'',11,7),
(1078,'2025-10-07 20:22:57.511299','98','nqixlseqle',3,'',11,7),
(1079,'2025-10-07 20:22:57.511317','97','fwqsthpzxh',3,'',11,7),
(1080,'2025-10-07 20:22:57.511334','96','jxjtumepjt',3,'',11,7),
(1081,'2025-10-07 20:22:57.511352','95','olffqvighi',3,'',11,7),
(1082,'2025-10-07 20:22:57.511369','94','yqdlioewvd',3,'',11,7),
(1083,'2025-10-07 20:22:57.511386','93','ezutjliloq',3,'',11,7),
(1084,'2025-10-07 20:22:57.511403','92','yxmwngsywt',3,'',11,7),
(1085,'2025-10-07 20:22:57.511447','91','ogyzezegtn',3,'',11,7),
(1086,'2025-10-07 20:22:57.511475','90','skgvnoyfqn',3,'',11,7),
(1087,'2025-10-07 20:22:57.511494','89','nepofllyyq',3,'',11,7),
(1088,'2025-10-07 20:22:57.511511','88','rhzxnmysgr',3,'',11,7),
(1089,'2025-10-07 20:22:57.511530','87','vtyouyswdg',3,'',11,7),
(1090,'2025-10-07 20:22:57.511547','86','zgtwrdnkdq',3,'',11,7),
(1091,'2025-10-07 20:22:57.511564','85','ruytmnxjpr',3,'',11,7),
(1092,'2025-10-07 20:22:57.511582','84','vudvtinvnu',3,'',11,7),
(1093,'2025-10-07 20:22:57.511598','83','rwrxsdormk',3,'',11,7),
(1094,'2025-10-07 20:22:57.511616','82','zlnhlwheyf',3,'',11,7),
(1095,'2025-10-07 20:22:57.511633','81','xfifxfjuqs',3,'',11,7),
(1096,'2025-10-07 20:22:57.511650','80','nmphyziyff',3,'',11,7),
(1097,'2025-10-07 20:22:57.511668','79','glzsyhllmm',3,'',11,7),
(1098,'2025-10-07 20:22:57.511685','78','urhksqeldn',3,'',11,7),
(1099,'2025-10-07 20:22:57.511702','77','souutmdduk',3,'',11,7),
(1100,'2025-10-07 20:22:57.511719','76','mqikldsigd',3,'',11,7),
(1101,'2025-10-07 20:22:57.511736','75','denmwdkniw',3,'',11,7),
(1102,'2025-10-07 20:22:57.511753','74','gvpupndxef',3,'',11,7),
(1103,'2025-10-07 20:22:57.511771','73','ipzznonnut',3,'',11,7),
(1104,'2025-10-07 20:22:57.511788','72','dfxnrdtdfu',3,'',11,7),
(1105,'2025-10-07 20:22:57.511805','71','foyvvqrhqt',3,'',11,7),
(1106,'2025-10-07 20:22:57.511824','70','ofignevxmp',3,'',11,7),
(1107,'2025-10-07 20:22:57.511841','69','ugyphmfvfm',3,'',11,7),
(1108,'2025-10-07 20:22:57.511858','68','fukguigyvf',3,'',11,7),
(1109,'2025-10-07 20:22:57.511875','67','jqkjsoerhy',3,'',11,7),
(1110,'2025-10-07 20:22:57.511892','66','pzxwynmteh',3,'',11,7),
(1111,'2025-10-07 20:22:57.511909','65','gikgrfrfno',3,'',11,7),
(1112,'2025-10-07 20:22:57.511926','64','dpzwtmnryk',3,'',11,7),
(1113,'2025-10-07 20:22:57.511944','63','gzrfdjjszr',3,'',11,7),
(1114,'2025-10-07 20:22:57.511962','62','hunddiuxlr',3,'',11,7),
(1115,'2025-10-07 20:22:57.511979','61','gxzsrwjmgi',3,'',11,7),
(1116,'2025-10-07 20:22:57.511995','60','zdvojdqtgr',3,'',11,7),
(1117,'2025-10-07 20:22:57.512012','59','rryyrlleoj',3,'',11,7),
(1118,'2025-10-07 20:22:57.512029','58','qxfvvgopit',3,'',11,7),
(1119,'2025-10-07 20:22:57.512047','57','rtitzmurps',3,'',11,7),
(1120,'2025-10-07 20:22:57.512063','56','hdlmxwwvvw',3,'',11,7),
(1121,'2025-10-07 20:22:57.512080','55','joiosgnpks',3,'',11,7),
(1122,'2025-10-07 20:22:57.512097','54','isthdmksit',3,'',11,7),
(1123,'2025-10-07 20:22:57.512114','53','hnesvxvvho',3,'',11,7),
(1124,'2025-10-07 20:22:57.512131','52','rsditurujx',3,'',11,7),
(1125,'2025-10-07 20:22:57.512147','51','pnpwemiohe',3,'',11,7),
(1126,'2025-10-07 20:22:57.512164','50','ljkmzmtltp',3,'',11,7),
(1127,'2025-10-07 20:22:57.512181','49','qevwkpvdvx',3,'',11,7),
(1128,'2025-10-07 20:22:57.512198','48','txsfwokdyt',3,'',11,7),
(1129,'2025-10-07 20:22:57.512215','47','gwysxqlhsl',3,'',11,7),
(1130,'2025-10-07 20:22:57.512232','46','hnputrlmgx',3,'',11,7),
(1131,'2025-10-07 20:22:57.512249','45','drtmrdehfl',3,'',11,7),
(1132,'2025-10-07 20:22:57.512266','44','pqfjjdofjy',3,'',11,7),
(1133,'2025-10-07 20:22:57.512283','43','diedvuspmf',3,'',11,7),
(1134,'2025-10-07 20:22:57.512299','42','hnduddyoum',3,'',11,7),
(1135,'2025-10-07 20:22:57.512317','40','sphfsmuzie',3,'',11,7),
(1136,'2025-10-07 20:23:37.790805','398','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1137,'2025-10-07 20:23:37.790849','397','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1138,'2025-10-07 20:23:37.790872','396','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1139,'2025-10-07 20:23:37.790893','395','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1140,'2025-10-07 20:23:37.790913','394','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1141,'2025-10-07 20:23:37.790933','393','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1142,'2025-10-08 11:28:41.865802','400','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1143,'2025-10-08 11:28:41.865853','399','Booking by Education & Opportunity Fair - Dechen Wangmo',3,'',13,7),
(1144,'2025-10-08 11:32:56.463835','719','Dechen Wangmo',3,'',11,7),
(1145,'2025-10-09 15:21:24.248268','412','Booking by Doteng Gewog 2nd dinner gathering - Namgay Tshering',2,'[{\"changed\": {\"fields\": [\"Economy quantity\", \"General quantity\", \"Payment date\"]}}]',13,7),
(1146,'2025-10-09 15:24:03.483951','412','Booking by Doteng Gewog 2nd dinner gathering - Namgay Tshering',3,'',13,7),
(1147,'2025-10-09 15:41:45.435986','418','Booking by Drala - Namgay Tshering',3,'',13,7),
(1148,'2025-10-09 15:41:45.436034','417','Booking by Drala - Namgay Tshering',3,'',13,7),
(1149,'2025-10-09 15:41:45.436058','387','Booking by Drala - Namgay Tshering',3,'',13,7),
(1150,'2025-10-09 15:42:07.176725','416','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1151,'2025-10-09 15:42:07.176781','415','Booking by Doteng Gewog 2nd dinner gathering - Namgay Tshering',3,'',13,7),
(1152,'2025-10-09 15:42:07.176812','414','Booking by Doteng Gewog 2nd dinner gathering - Namgay Tshering',3,'',13,7),
(1153,'2025-10-09 15:42:13.896921','413','Booking by Doteng Gewog 2nd dinner gathering - Namgay Tshering',3,'',13,7),
(1154,'2025-10-09 15:45:47.945620','421','Booking by Drala - Namgay Tshering',3,'',13,7),
(1155,'2025-10-09 15:45:47.945663','420','Booking by Doteng Gewog 2nd dinner gathering - Namgay Tshering',3,'',13,7),
(1156,'2025-10-09 15:45:47.945687','419','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1157,'2025-10-09 15:45:47.945709','390','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1158,'2025-10-09 15:51:35.504746','423','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7),
(1159,'2025-10-09 15:51:35.504801','422','Booking by Education & Opportunity Fair - Namgay Tshering',3,'',13,7);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(13,'db','booking'),
(7,'db','country'),
(8,'db','currency'),
(16,'db','event'),
(22,'db','eventaccess'),
(15,'db','eventtype'),
(14,'db','film'),
(12,'db','filmshow'),
(23,'db','filmshowaccess'),
(9,'db','state'),
(10,'db','suburb'),
(11,'db','user'),
(19,'django_q','failure'),
(21,'django_q','ormq'),
(17,'django_q','schedule'),
(20,'django_q','success'),
(18,'django_q','task'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-02-24 11:03:40.000000'),
(2,'auth','0001_initial','2025-02-24 11:03:40.000000'),
(3,'admin','0001_initial','2025-02-24 11:03:40.000000'),
(4,'admin','0002_logentry_remove_auto_add','2025-02-24 11:03:40.000000'),
(5,'admin','0003_logentry_add_action_flag_choices','2025-02-24 11:03:40.000000'),
(6,'contenttypes','0002_remove_content_type_name','2025-02-24 11:03:40.000000'),
(7,'auth','0002_alter_permission_name_max_length','2025-02-24 11:03:40.000000'),
(8,'auth','0003_alter_user_email_max_length','2025-02-24 11:03:40.000000'),
(9,'auth','0004_alter_user_username_opts','2025-02-24 11:03:40.000000'),
(10,'auth','0005_alter_user_last_login_null','2025-02-24 11:03:40.000000'),
(11,'auth','0006_require_contenttypes_0002','2025-02-24 11:03:40.000000'),
(12,'auth','0007_alter_validators_add_error_messages','2025-02-24 11:03:40.000000'),
(13,'auth','0008_alter_user_username_max_length','2025-02-24 11:03:40.000000'),
(14,'auth','0009_alter_user_last_name_max_length','2025-02-24 11:03:40.000000'),
(15,'auth','0010_alter_group_name_max_length','2025-02-24 11:03:40.000000'),
(16,'auth','0011_update_proxy_permissions','2025-02-24 11:03:40.000000'),
(17,'auth','0012_alter_user_first_name_max_length','2025-02-24 11:03:40.000000'),
(18,'db','0001_initial','2025-02-24 11:03:40.000000'),
(19,'db','0002_remove_film_owner_remove_filmshow_film_and_more','2025-02-24 11:03:40.000000'),
(20,'sessions','0001_initial','2025-02-24 11:03:40.000000'),
(21,'db','0003_film_filmshow_booking','2025-02-24 11:04:53.000000'),
(22,'db','0004_alter_film_cast_alter_film_duration_alter_film_genre','2025-02-24 11:04:53.000000'),
(23,'db','0005_remove_booking_film_remove_filmshow_film_delete_film','2025-02-24 11:04:54.000000'),
(24,'db','0002_auto_20250818_0915','2025-08-18 09:15:16.051078'),
(25,'django_q','0001_initial','2025-08-29 04:30:15.534975'),
(26,'django_q','0002_auto_20150630_1624','2025-08-29 04:30:15.562983'),
(27,'django_q','0003_auto_20150708_1326','2025-08-29 04:30:15.586524'),
(28,'django_q','0004_auto_20150710_1043','2025-08-29 04:30:15.592878'),
(29,'django_q','0005_auto_20150718_1506','2025-08-29 04:30:15.608527'),
(30,'django_q','0006_auto_20150805_1817','2025-08-29 04:30:15.618615'),
(31,'django_q','0007_ormq','2025-08-29 04:30:15.625262'),
(32,'django_q','0008_auto_20160224_1026','2025-08-29 04:30:15.628242'),
(33,'django_q','0009_auto_20171009_0915','2025-08-29 04:30:15.637703'),
(34,'django_q','0010_auto_20200610_0856','2025-08-29 04:30:15.645571'),
(35,'django_q','0011_auto_20200628_1055','2025-08-29 04:30:15.654371'),
(36,'django_q','0012_auto_20200702_1608','2025-08-29 04:30:15.657306'),
(37,'django_q','0013_task_attempt_count','2025-08-29 04:30:15.667926'),
(38,'django_q','0014_schedule_cluster','2025-08-29 04:30:15.673932'),
(39,'django_q','0015_alter_schedule_schedule_type','2025-08-29 04:30:15.681265'),
(40,'django_q','0016_schedule_intended_date_kwarg','2025-08-29 04:30:15.687508'),
(41,'django_q','0017_task_cluster_alter','2025-08-29 04:30:15.699686'),
(42,'django_q','0018_task_success_index','2025-08-29 04:30:15.709405'),
(43,'db','0002_filmshow_owner','2025-09-01 09:55:02.104107'),
(44,'db','0003_remove_filmshow_owner_event_owner','2025-09-01 09:55:59.717819'),
(45,'db','0004_remove_event_owner_event_event_owner','2025-09-01 09:57:25.236694'),
(46,'db','0005_rename_event_owner_event_owner','2025-09-01 10:00:54.801646'),
(47,'db','0006_rename_type_event_event_type','2025-09-01 10:02:26.911101'),
(48,'db','0007_event_economy_label_event_economy_price_and_more','2025-09-02 08:01:25.376089'),
(49,'db','0008_event_general_label','2025-09-02 08:48:57.070133'),
(50,'db','0009_booking_economy_label_booking_economy_price_and_more','2025-09-03 08:42:33.369777'),
(51,'db','0010_remove_booking_economy_quantity','2025-09-03 08:44:16.821790'),
(52,'db','0011_remove_booking_economy_label_and_more','2025-09-03 08:44:37.949232'),
(53,'db','0012_booking_economy_label_booking_economy_price_and_more','2025-09-03 08:46:44.336738'),
(54,'db','0013_booking_attend_remarks_booking_attended_at','2025-09-04 08:41:12.390511'),
(55,'db','0002_rename_time_zone_state_state_time_zone','2025-10-03 08:39:16.374937'),
(56,'db','0003_remove_state_state_time_zone_state_time_zone_and_more','2025-10-03 08:39:16.494560');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_q_ormq`
--

DROP TABLE IF EXISTS `django_q_ormq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_q_ormq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `payload` longtext NOT NULL,
  `lock` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_q_ormq`
--

LOCK TABLES `django_q_ormq` WRITE;
/*!40000 ALTER TABLE `django_q_ormq` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_q_ormq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_q_schedule`
--

DROP TABLE IF EXISTS `django_q_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_q_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `func` varchar(256) NOT NULL,
  `hook` varchar(256) DEFAULT NULL,
  `args` longtext DEFAULT NULL,
  `kwargs` longtext DEFAULT NULL,
  `schedule_type` varchar(2) NOT NULL,
  `repeats` int(11) NOT NULL,
  `next_run` datetime(6) DEFAULT NULL,
  `task` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `minutes` smallint(5) unsigned DEFAULT NULL CHECK (`minutes` >= 0),
  `cron` varchar(100) DEFAULT NULL,
  `cluster` varchar(100) DEFAULT NULL,
  `intended_date_kwarg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_q_schedule`
--

LOCK TABLES `django_q_schedule` WRITE;
/*!40000 ALTER TABLE `django_q_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_q_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_q_task`
--

DROP TABLE IF EXISTS `django_q_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_q_task` (
  `name` varchar(100) NOT NULL,
  `func` varchar(256) NOT NULL,
  `hook` varchar(256) DEFAULT NULL,
  `args` longtext DEFAULT NULL,
  `kwargs` longtext DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `started` datetime(6) NOT NULL,
  `stopped` datetime(6) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `id` varchar(32) NOT NULL,
  `group` varchar(100) DEFAULT NULL,
  `attempt_count` int(11) NOT NULL,
  `cluster` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `success_index` (`group`,`name`,`func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_q_task`
--

LOCK TABLES `django_q_task` WRITE;
/*!40000 ALTER TABLE `django_q_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_q_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('05gk2b677n5xc4zbwjd6c4187z301w7o','.eJxVjDsOwjAQBe_iGllRdu21Kek5g7XrDw4gR4qTCnF3iJQC2jcz76UCb2sNW89LmJI6K1Kn3004PnLbQbpzu806zm1dJtG7og_a9XVO-Xk53L-Dyr1-a7QMVoDQWc4yZHFoDSefPEZgKiNldAxAoykQB6DkyZuIUlCQvaj3B-FpN-o:1uz7Id:6UMotrbSRNXp1ZHFf3CvU8YxNAIPe3CNxOLTsAzS1VA','2025-10-02 05:35:19.111611'),
('09qmzwp04oiuxswc5wl14ta9h1slt7fz','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1uwe9I:msm8Abln7MohaLab6WNyhJCA64myHgddLlzTVE8ebfU','2025-09-25 10:03:28.791806'),
('0byvl7cwu6jo4rpbirzetkpulgn9p08v','.eJxVjEEOwiAQRe_C2hCKMBSX7nsGAjODVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERozj9binig-sO6B7rrUlsdV3mJHdFHrTLqRE_r4f7d1BiL98arbIAHomcN4m8gYyDMpA4J63cGaNmpw04lyEPjAzEBOzymNkmUuL9AfUDOOI:1u2d0L:hUadicv03V7_9QRunsGyTx0ifn0IhFR0VG7Ksg7ghvA','2025-04-23 21:30:41.672388'),
('0egrex3dx0iqtx6eiypg6rle1z993m7n','.eJxVjDsOwjAQBe_iGllRdu21Kek5g7XrDw4gR4qTCnF3iJQC2jcz76UCb2sNW89LmJI6K1Kn3004PnLbQbpzu806zm1dJtG7og_a9XVO-Xk53L-Dyr1-a7QMVoDQWc4yZHFoDSefPEZgKiNldAxAoykQB6DkyZuIUlCQvaj3B-FpN-o:1v6djX:5yu4pbWQQGlp3Z4uG0oPYmQAsUfA8-A-E-KOKaZaLzw','2025-10-22 23:38:11.848176'),
('0rizlwxn5o3in2y1n6ph2cs9zdl6v6dx','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1u5Kwh:GiFy9du2u4gcvAq_92Z0O2QZIx933yBNn-h-XeZeL6w','2025-05-01 08:50:07.441654'),
('156xveihxulosgukn6rcmlhjcs164zj2','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1urSwk:8sStQKBKQRT2x_XoeEViOFxlBwrg5LmuurLh_fgLyLQ','2025-09-11 03:05:06.330140'),
('15j0yawitbs6hxjb2g230lwa9lhvfilx','.eJxVjDsOwjAQBe_iGln-xbumpM8ZrPXa4ABypDipEHeHSCmgfTPzXiLStta49bLEKYuzCOL0uyXiR2k7yHdqt1ny3NZlSnJX5EG7HOdcnpfD_Tuo1Ou3JktegdXJgnJ4HYI24DMNDoPi7C1zYMTgyRnQoKyBhE47JAWpeJvE-wO15jaO:1tzfW3:O3LpO2fLKzNY27OEGvOVLKwr8d8OKxQbPlJngbvIEJ8','2025-04-15 17:35:11.286659'),
('18uk56prfbsgr0g8t6civsgmgm3e17m5','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1uzmza:Qbt_rxnRYsD4vNIJHFhz3JcTIJkR2XnE3Wsz-07jQ1k','2025-10-04 02:06:26.692747'),
('1jbmvlqtapcg1rnt2d3egloacy39h0ib','.eJxVjDsOwjAQBe_iGlm7-dheSvqcIXqO1ySAEimfCnF3EikFtDPz3tu02Na-3Rad2yGZq2Eyl18Y0T11PEx6YLxPtpvGdR6iPRJ72sU2U9LX7Wz_Dnos_b72rhBhkToqa8eSESGFKClK4lBmhEzE5JDdDpIHELiquUrOZ5D5fAH6mzfC:1uEoYg:oAlFw_i3XACrBz8WluLibdkv-lpMUQrsnTBWGj8ZBOE','2025-05-27 12:16:30.640724'),
('1x46byl261ssz6f52affz5i1ke60kpjk','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v6Gqq:-6EU6sIuNQNdx93WkHCtpffCMVRLE0-G90UNjm5hBGU','2025-10-21 23:12:12.542107'),
('2k4502vsz73wncwg8pgaijds5e6q0e3u','.eJxVjMsOwiAQAP-FsyFseUg9evcbyLIsUjWQlPZk_HdD0oNeZybzFgH3rYS98xqWJC5iMuL0CyPSk-sw6YH13iS1uq1LlCORh-3y1hK_rkf7NyjYy_iC9qQ0AeaJ0WWyxliOs_HIAA5BI7NjhTMn7UDxOUOM1gOBy1YZ8fkCE4w4Sg:1urwPM:qkgMGESwx7Mfu_zrv2RyLHmcvCIhd9wGR89uHkP520Y','2025-09-12 10:32:36.179926'),
('2t4zw0kem9xq55nm9s2l5ia25dcyvw6e','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1uhfRZ:_D39VOnD6q-NotyaDZxwFGbjIeuiTGMYQbP160tCzsc','2025-08-15 02:24:25.910637'),
('2w2ti1s7sqjcqbh1t4p584w4yrzbp24n','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1u2d05:xe17XVjkYzT7j605M1BSau8kUKjyYHZzw0f08HYn774','2025-04-23 21:30:25.620664'),
('3djlr7lhl4crfr2k8n15t5fyac0aoaw3','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1vAj3N:VpzdC4xkhyAQaoC4C-GMlmKaFi5febAkrf_d2g6UkTM','2025-11-03 06:07:33.917832'),
('47f60t86wvjk3r9lgvw7drfpoo2y5m50','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v6U9f:dsYAPrCdvPwxfWiNk5sVcdr_45zxYxfYjFmoJ9ll-DY','2025-10-22 13:24:31.217717'),
('53wud0jm23xojrl8zec9fxhuarncc7ae','.eJxVjDsOwjAQBe_iGllRdu21Kek5g7XrDw4gR4qTCnF3iJQC2jcz76UCb2sNW89LmJI6K1Kn3004PnLbQbpzu806zm1dJtG7og_a9XVO-Xk53L-Dyr1-a7QMVoDQWc4yZHFoDSefPEZgKiNldAxAoykQB6DkyZuIUlCQvaj3B-FpN-o:1uupsi:KXI5L_gQypyA9Z8HVRU61QbXxkjrLtVk597trFWVA80','2025-09-20 10:10:52.741099'),
('5wlenhaod8z3l4wctpyehvptwl0qwf9l','.eJxVjEEOwiAQRe_C2hCgAxSX7j0DYZhBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEW2onT74gpP7jthO6p3WaZ57YuE8pdkQft8joTPy-H-3dQU6_fGgA9eMykHdJgAvCoyDuLVmMhZB4KOpNHaw0oAiAVtMklmKTJJs_i_QESljhg:1urave:lFzvqUG8Xsef9yhzhPSrJkV7AFK2KDykJlL7i4SkRoo','2025-09-11 11:36:30.728578'),
('6k0jnkg10thypx1hj3o9qrrgbyz17d58','.eJxVjMsOwiAURP-FtSHI8-LSvd9ALlyQqoGktCvjv9smXehqkjln5s0CrksN68hzmIhdmJGGnX7biOmZ247oge3eeeptmafId4UfdPBbp_y6Hu7fQcVRt7VSaK0UXhh0zhtBMilIkSBbcHILkoI0kIim6FjSGRJoUbx0BbXVwD5fGDQ37Q:1v4VoV:EjCqYxGf0SRaxofQWemue5hRT7z3L9a5nSdSmXcl5Pw','2025-10-17 02:46:31.618375'),
('6zbhceytfegadb84vr68e96c1nwuz0my','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v9tzy:WQ7oy9_dZ4Ns3S2_30FNwXVu5B7ylXl2bb63ZgS62QM','2025-10-31 23:36:38.244774'),
('7orm5q1x2j8lsfpoc3izsdqt5g3qzce2','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1uMfm9:cSSwp5a514gWolHpBwDrVvtfgZTWu-8_vZs0J7h0Xm0','2025-06-18 04:30:53.525292'),
('8inoa5db1ngaqp21zh3iwg8r2asjgde5','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1u1XEv:n11XlyGpvXFazNUDhc84CrBECI6Ussrkw6idw_RdLiM','2025-04-20 21:09:13.463946'),
('91fc71e37lqaz69xyic1w4quw9at2yfa','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1uwBeZ:VofpXzIJa95pONyjpwRE5vPEYgMaRYJCe_XYRXs2fPY','2025-09-24 03:37:51.328177'),
('9ksfobira4lf8ey3qa1c0g7762qfimg6','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1uGRGA:Xi8XKdEG99qevQQezGIZXSajGcqzDa9Tol7YN6wPH7w','2025-05-31 23:48:06.067376'),
('avirm0hvwdmyy7gc6xkp6sdx9si6ivh4','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1uzBZi:RJgOPHCVFoeaK80bI1sz4foSCdsUGvG34L9RKTZzZuI','2025-10-02 10:09:14.438325'),
('b2r27rb3tona7deti5szkkihyl7q0ky4','.eJxVjEEOwiAQRe_C2pAZYLC4dO8ZmhlAqRpISrsy3l2bdKHb_977LzXyupRx7Xkep6ROyhp1-B2F4yPXjaQ711vTsdVlnkRvit5p15eW8vO8u38HhXv51hwkIjGAgSwEyRmLECkRSg7Ze_KIwMkNwQNbRDHgrg4GFwyhO1r1_gDr3jaG:1uwhko:6g1H71w9H3VqF-e60LUyA7GPyZsvqFza-DV30EQR8GI','2025-09-25 13:54:26.588991'),
('b64x205t4lio5jsih87zwwihllyfg9ap','.eJxVjEEOwiAQRe_C2pBSoMy4dO8ZyHQYpGpKUtqV8e7apAvd_vfef6lI21ri1mSJU1JnNajT7zYSP2TeQbrTfKua67wu06h3RR-06WtN8rwc7t9BoVa-NTBk7oG4H3w2PlDogjdkMYBIThlQvDUOGa04cETgAagTNIgQhNT7A-MVN60:1tu9uC:q0b8q0eY2UofiLTti-0D8AdvzaeBjjXvKd2yCEIuJw0','2025-03-31 12:49:20.000000'),
('c005a0damqkf0xjw449m7p82vmi9yvhz','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v4m2W:4N-iEOZiGAXAp4cWbyuUzuh7gFXZB9zczhvuLYe73BQ','2025-10-17 20:06:04.002857'),
('cl9nlympohope5kpeyw0shkz5jdi4ggt','.eJxVjDsOwjAQBe_iGln-xbumpM8ZrPXa4ABypDipEHeHSCmgfTPzXiLStta49bLEKYuzCOL0uyXiR2k7yHdqt1ny3NZlSnJX5EG7HOdcnpfD_Tuo1Ou3JktegdXJgnJ4HYI24DMNDoPi7C1zYMTgyRnQoKyBhE47JAWpeJvE-wO15jaO:1tzsNe:E56t_owDzzUo-WzaT68nzHeCUm5Cf2WoNYPQ_3WTI_o','2025-04-16 07:19:22.186385'),
('crs1zju8v98x1voh53gdvky7jfxetzd2','.eJxVjEEOwiAQRe_C2hCQGagu3XsGwsyAVA1NSrsy3l2bdKHb_977LxXTutS49jzHUdRZWUR1-F0p8SO3Dck9tdukeWrLPJLeFL3Trq-T5Odld_8Oaur1W58kIYqDkiQUCsRSGAYjRNaRAHlwHJAFj2gcgzcSPFPJQ7EGjAf1_gBmOzke:1v0d5O:fRJhTT0Rv0A-hgnnSEcPPmnE7MIpomykGJOGrXpVkQs','2025-10-06 09:43:54.581891'),
('cull62uuva8i2oh878o7x067zn1zbqn0','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v9ylB:gUywIpEOSW_aGw-ukZKI0qp-IgT-RFWqVUtkdthVLoo','2025-11-01 04:41:41.714758'),
('d3e8q4u3mq1rul7946x6bbgi3v01wd2s','.eJxVjDsOwjAQBe_iGln-rR1T0nMGa9cfHEC2FCcV4u4QKQW0b2beiwXc1hq2kZcwJ3Zm0rPT70gYH7ntJN2x3TqPva3LTHxX-EEHv_aUn5fD_TuoOOq3NkKAcgoFTOCsBqcJFZBIUXuRUKLViGSKccWAxolAxWizilIVR8az9wffljeN:1uzCHC:R7UHl8moldMw2inqOqwgqrASooImNwQPFufiIs6Vkgg','2025-10-02 10:54:10.163740'),
('d6417hl2i7jj1gb1ic4wjdjvc07ekshk','.eJxVjEEOwiAQRe_C2pChQAGX7j0DYWZAqoYmpV0Z765NutDtf-_9l4hpW2vcel7ixOIsNIjT74iJHrnthO-p3WZJc1uXCeWuyIN2eZ05Py-H-3dQU6_fGqCAs9YrtGAGLHogVOxd1hjYApIaFWEo2SiVmQuBgUDae3JA4Efx_gD60Dfu:1uu7yb:GejVQxgNa97fOmzrkClnArwguxzckWPn8Laat-UAFZU','2025-09-18 11:18:01.769459'),
('ddonqkn5uyre1y5pndkd2iyiahf45w2b','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v7nj7:4GldqQEQid1JOTwBrAcPDA7-G58Z2yZ7_CQ43BApd7M','2025-10-26 04:30:33.465149'),
('dhfam0rj4c7gogvzojzd4dc1cz6rxcyh','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v6U9d:I5BSFj5C5cYy8mtVJ2RtxLL6HbpyUBaGL8rkRDBcM1k','2025-10-22 13:24:29.775336'),
('f4jd59siqe2yhh5jh8t1t9omi2ukxbhe','.eJxVjMsOwiAURP-FtSHI8-LSvd9ALlyQqoGktCvjv9smXehqkjln5s0CrksN68hzmIhdmJGGnX7biOmZ247oge3eeeptmafId4UfdPBbp_y6Hu7fQcVRt7VSaK0UXhh0zhtBMilIkSBbcHILkoI0kIim6FjSGRJoUbx0BbXVwD5fGDQ37Q:1v4VoW:KW8DBZ4xCpIea-tM_tDcrEL0IL_VlOZARNmNmtj9mFw','2025-10-17 02:46:32.056180'),
('f60swiex5pb7tpvvr1ml5eojuvj62kxb','.eJxVjMsOwiAQRf-FtSEwlIG6dO83kBkGpGrapI-V8d-1SRe6veec-1KJtrWlbSlzGkSdFRh1-h2Z8qOMO5E7jbdJ52lc54H1ruiDLvo6SXleDvfvoNHSvnXnM1gLTMEZj9JVH6uw7QUIeonk0ZXQoVhmjsZxREFkBkYTnAtVvT_5pTfK:1urlE0:oE5Rq8bEmlroXYJpIuCPiMfWd3RGiKdC4r-Sbqe7-nE','2025-09-11 22:36:08.345086'),
('h41rcyonsse10eb1woplusitb4cam0wb','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1uoJ5t:GxSgrVBo7XPW6NzWvPaecFYFP3Sqr04yNg3VVvFq34M','2025-09-02 09:57:29.231628'),
('h99bulqdgk8ewq75cg7md8j16wttudio','.eJxVjDsOwjAQBe_iGllRdu21Kek5g7XrDw4gR4qTCnF3iJQC2jcz76UCb2sNW89LmJI6K1Kn3004PnLbQbpzu806zm1dJtG7og_a9XVO-Xk53L-Dyr1-a7QMVoDQWc4yZHFoDSefPEZgKiNldAxAoykQB6DkyZuIUlCQvaj3B-FpN-o:1v6j1S:tf5GIh0gtLDqlo0VHzJIrDCCPsrEKuhxUFZyScVb5xU','2025-10-23 05:17:02.938992'),
('iish7jkne99a7wiizu2dor155wweybt3','.eJxVjLEOwyAQQ_-FuUKBhDvo2D3fgA4OlbQVSCGZqv57iZShlRfLz_ZbeNq37PeWVr-wuAoUl98sUHymcgB-ULlXGWvZ1iXIoyJP2uRcOb1uZ_fvIFPLfQ1xQoU8MiQTlVHaKjCJCC2DwcF1JRsVIaAbB41aESNA6N6Ro0l8vrxQNo0:1tyGDB:XSHOi11C5bP4I-moovkOKxU1d_gDpftSvIjwQQ32pXs','2025-04-11 20:21:53.000000'),
('isw9hk5uq9f1z4j5ermr9h4fnlzs6lrb','.eJxVjDsOwjAQBe_iGllRdu21Kek5g7XrDw4gR4qTCnF3iJQC2jcz76UCb2sNW89LmJI6K1Kn3004PnLbQbpzu806zm1dJtG7og_a9XVO-Xk53L-Dyr1-a7QMVoDQWc4yZHFoDSefPEZgKiNldAxAoykQB6DkyZuIUlCQvaj3B-FpN-o:1uwe7M:yWtGz5QJBYqP9OXy0q97MaovcMRCXJvmhKkq0VDafEw','2025-09-25 10:01:28.092869'),
('ix5qyy95tdhd3ol0f4a1895zmhw528q4','.eJxVjDsOwjAQBe_iGln-xbumpM8ZrPXa4ABypDipEHeHSCmgfTPzXiLStta49bLEKYuzCOL0uyXiR2k7yHdqt1ny3NZlSnJX5EG7HOdcnpfD_Tuo1Ou3JktegdXJgnJ4HYI24DMNDoPi7C1zYMTgyRnQoKyBhE47JAWpeJvE-wO15jaO:1uJhRc:oqTCAuA4f_6C7szTcKzpI2VceXejmZDeDDZryqzHaRI','2025-06-09 23:41:24.012091'),
('j2k5lz6uhre0y5byu51vk0a956sy98ce','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1ue8Vo:exNX_gMazGW7EjpHnXI7EGJSzfaI2DWNlXufYk3B7Bk','2025-08-05 08:38:12.531918'),
('keitj4l6aq10mj5g8s7lb7zruhafa7df','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v6PeF:xH3999fjuchdmJQY7No8JRtF0YN1LlMa-s58zyr-Zos','2025-10-22 08:35:47.821952'),
('l80os6smw7qjru1gzzur43oq894j9fso','.eJxVjEEOwiAQRe_C2hAKDIhL9z0DGZgZWzVtUtqV8e7apAvd_vfef6mM2zrkrfGSR1IXZaM6_Y4F64OnndAdp9us6zyty1j0ruiDNt3PxM_r4f4dDNiGb-3F4bmgcKziTOegBAjWJABrQTqTkvGOpGIVT8CFLATDzBIjkq9JvT8PMTia:1usXxD:EHALk-eoDsrLbrRG8h2f4LIihX_3Vf8nNPbZ-4Jn8NQ','2025-09-14 02:38:03.607194'),
('lfxek5xckw3knohzp3pzo14ehkzmac6y','.eJxVjEEOgjAQRe_StWkKbWHq0r1nIDOdGUFNSSisjHdXEha6_e-9_zIDbus4bFWWYWJzNk0M5vS7EuaHlB3xHctttnku6zKR3RV70GqvM8vzcrh_ByPW8VurUGTtM3oR7SS0STumzgGpD9ggNJCTEniHEXvw3CZR74gpOceA5v0BbsQ5kA:1v0aJ9:5TRm0WEIIdTKF-3JUQNHNU_0RvccCUH1PkSg2cDrGS8','2025-10-06 06:45:55.889652'),
('lz5hb243utf1xw3zyt6cu47gg4tj32ak','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v7xCH:nv0KmDbbtTNE4NBomvqkwOMmfP2hNWeH1vFLyKAnxZ8','2025-10-26 14:37:17.797780'),
('mxkiu00kq4ygrdeahb2tyjz9dzwtp6aq','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1uAmbH:ZU_9NXz-fe7m0gcemB_1A1wiRtOoJhvU1YH8WrPXbn8','2025-05-16 09:22:31.934371'),
('nempu0cck6sg9kw0xnonwo70jck7ehwy','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v72nI:GmRjIlrDuEeiA_Wy1VzpAG4aVVQQKDEKcSWh53SLVTs','2025-10-24 02:23:44.138450'),
('pbmm9fn9vkn2prwjyqh8xqqm873c98nr','.eJxVjDsOwjAQBe_iGllRdu21Kek5g7XrDw4gR4qTCnF3iJQC2jcz76UCb2sNW89LmJI6K1Kn3004PnLbQbpzu806zm1dJtG7og_a9XVO-Xk53L-Dyr1-a7QMVoDQWc4yZHFoDSefPEZgKiNldAxAoykQB6DkyZuIUlCQvaj3B-FpN-o:1utPuJ:OpiUFfaP_Czu9aFJYmpQqZQePaKvgt20s0Cd36ioHng','2025-09-16 12:14:39.191389'),
('pckimgdz3093fx57s1rlem95f52wbw9r','.eJxVjDsOwjAQBe_iGllRdu21Kek5g7XrDw4gR4qTCnF3iJQC2jcz76UCb2sNW89LmJI6K1Kn3004PnLbQbpzu806zm1dJtG7og_a9XVO-Xk53L-Dyr1-a7QMVoDQWc4yZHFoDSefPEZgKiNldAxAoykQB6DkyZuIUlCQvaj3B-FpN-o:1uurtX:C7hh0jF_KO9d5Manz-0qa9sWn9nMGxQ5QkEYP2a7s-Y','2025-09-20 12:19:51.044293'),
('pxti2urft17zdj7k04ewc5nt38lz44pw','.eJxVjDsOwjAQRO_iGlnrxJ-Ykp4zWJvdBQeQLcVJhbg7iZQCimnmvZm3SrguOa1N5jSxOqvOq9NvOSI9peyEH1juVVMtyzyNelf0QZu-VpbX5XD_DjK2vK37LpL0sCX0DAz2xtEiofMRHAkEh5aNIe8AXRyCFR4MBfDRWwFg9fkCBM43oA:1usIJl:viFLVDWaRslRV1s4co-l2ymbmyqcz72b6qMqZpegg8I','2025-09-13 09:56:17.251999'),
('qrlnlxh8hwex3qt2t568o9hgvdvebtw5','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1u0BCw:Jjunu3qrOu1A82YPpGKQfD7R1-s4tFX3iTp9nhsTKV8','2025-04-17 03:25:34.966076'),
('ry4lpixx48h2qwrg9sng6hjp6l4to831','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1tzh9Y:oKaJOstD4vyFjNi9hz36d5tAfLOLdLBwhex_APIlkl8','2025-04-15 19:20:04.891394'),
('s2njo48vw4pfffnh7nfszwq059kmwcg3','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1u0WZA:_aqkTYUpkDWJ83rDfgJUhx7mjC8xhnXKZfEDih8qCuo','2025-04-18 02:13:56.236662'),
('s56dxas4jefwlqsv2y8k7o6mqu9jgsqn','.eJxVjEEOgjAQRe_StWkKbWHq0r1nIDOdGUFNSSisjHdXEha6_e-9_zIDbus4bFWWYWJzNk0M5vS7EuaHlB3xHctttnku6zKR3RV70GqvM8vzcrh_ByPW8VurUGTtM3oR7SS0STumzgGpD9ggNJCTEniHEXvw3CZR74gpOceA5v0BbsQ5kA:1v1Qvt:aDsONv5tmb_-Kf1MAGGqxSbuofunfPAZcpvmEvaMxXM','2025-10-08 14:57:25.056067'),
('uodum5zp8duxcp8pudxtbwfbmmwf9ya4','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1uannj:do7N-qk8Fs2n6vGeBlKBgLeB-yL3Mge4-XZIL-0iePY','2025-07-27 03:54:55.312925'),
('utk0gxatyi53h3iug3pwz7u426j78dwy','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1uV66V:TOgCjzp9MKWAWrPX95aMFwuZWPbGUhHhh3mxkry872c','2025-07-11 10:14:43.551187'),
('vtnqp7zpsnahoq39iwjurj01tq76zeg3','.eJxVjDsOwjAQBe_iGllRdu21Kek5g7XrDw4gR4qTCnF3iJQC2jcz76UCb2sNW89LmJI6K1Kn3004PnLbQbpzu806zm1dJtG7og_a9XVO-Xk53L-Dyr1-a7QMVoDQWc4yZHFoDSefPEZgKiNldAxAoykQB6DkyZuIUlCQvaj3B-FpN-o:1v6SQZ:62XjyXJ6XKk-wKsdUQYsvlL_9kzvQDLc-y2LrqfUWSk','2025-10-22 11:33:51.027125'),
('wndxac731j7hiu9klhabva4dsvrqljdv','.eJxVjEEOwiAUBe_C2hAKQotL9z0DecD_UjU0Ke3KeHdt0oVu38y8lwjY1hK2RkuYsrgIbcXpd4xID6o7yXfU2yzTXNdlinJX5EGbHOdMz-vh_h0UtPKteTBDdJQ0ZZA2gEvKA9kbw9YywTtonElp7pk9rPF91Ky6LirjrRLvDztmOL8:1us0Ue:518TNHoYcEWUHkwD5C8uFBfAyyKzt_rb34sRMU2eYDQ','2025-09-12 14:54:20.019963'),
('xpi3twzp236zfti7ljorgyqnk6imhpua','.eJxVjMsOwiAQRf-FtSFDeRRcuvcbCMNMpWogKe3K-O_apAvd3nPOfYmYtrXErfMSZxJn4cXpd8OUH1x3QPdUb03mVtdlRrkr8qBdXhvx83K4fwcl9fKt2Xqn0QyUICinRmsYfCbFg_MAIRPypMgFY7NmQKIRPRgIWk9MACDeH9clN5k:1tyGCF:hCdt2YvGswEyHtXGJ4RGT23H2fNWTBnUXES1DUaAiPg','2025-04-11 20:20:55.000000'),
('y8322n1vm276eqbufrxlxvha1823hmwm','.eJxVjEsOAiEQBe_C2hB6YPi4dD9nIDTdyqiBZD4r492VZBa6fVX1XiKmfStxX3mJM4mzGMXpd8OUH1w7oHuqtyZzq9syo-yKPOgqp0b8vBzu30FJa-n1wKA0qWT9FSEEMprRAbFHY7TyKoegcNAZRhfIAvPX1YOxGByAz-L9Ad50N2s:1tpJ7m:3mZqUMwEpLAg9y2gH5qyyD9iErXXUWhGqy_YtDXhPK4','2025-03-18 03:39:18.000000'),
('yn6zy62d30ht3tqinpl8japngko4x0nb','.eJxVjEEOwiAQRe_C2hCYEmBcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLB0qcftdI6ZHbjvhO7dZl6m1d5ih3RR50yGvn_Lwc7t9BpVG_NWpbLBfFTICGMiJQSQDWZaMNeNQFuERQLiu27KcJELRF5-MUCZ14fwAxjjfs:1v8yfA:337GxGuNnVh-XP9VYd1bfZMjHNHsSvzvP0q7WqNi9zs','2025-10-29 10:23:20.046665'),
('yu0awohuskgpzlw94x797k0bcqoa0py0','.eJxVjDsOwjAQBe_iGlnyrn-hpOcM1q7XxgGUSHFSIe4OkVJA-2bmvVSibW1p62VJo6izGtTpd2PKjzLtQO403Wad52ldRta7og_a9XWW8rwc7t9Bo96-NbKlQEIEHLBWiA44O7TiOUTDFk2hEDlWBEbLNnsB8NFEdFCKDOr9AflBOAE:1v6SCQ:eGcO7s6_F6e0EA-TnhhiGmEK11ntywpxFTDFmb8NaiY','2025-10-22 11:19:14.407273'),
('z5nbvabtkshabur3vs3018pjo5jooqi5','.eJxVjDsOwjAQBe_iGln2-htKes5grdcbHECxFCcV4u4QKQW0b2beSyTc1pq2zkuaijgLo8Xpd8xID553Uu4435qkNq_LlOWuyIN2eW2Fn5fD_Tuo2Ou3jmRJBWCOZGIYh6B0Dg6pWDLGalAZvIGBrYeogV2x7JVChzCiiUMQ7w_yMjc_:1uwfg3:Sy53F0pMk9M7d7w2DZlh5A9SOQHmnKSq4U5Yoo10dYk','2025-09-25 11:41:23.005141'),
('zhpvxt6gribyjfa8fqmt52spen7hloxg','.eJxVjDsOwjAQBe_iGllrb-K1Kek5g7X-4QBypDipEHeHSCmgfTPzXsLztla_9bz4KYmz0EqcfsfA8ZHbTtKd222WcW7rMgW5K_KgXV7nlJ-Xw_07qNzrt8ZsUZuIiqwxloEKs0MOGMkADA6tKQoSoCMHyhAlbYdUaATIxGMW7w_V-za_:1urpAu:Uyo1BKXWxBtJqgOcPzbVHsNUinZWp6tU469SKaFSquk','2025-09-12 02:49:12.349631'),
('zq24kqrovrhanj18t89febc4sdbcqk7p','.eJxVjMsOwiAQRf-FtSEEhpdL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWXpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31rCNY7YwxYJtQIGtGpwtYba0GFUjGEmpWLoURHgAgVY_U-AnDNmsT7A9AiN-w:1uOFvo:OOd06ABbgCDGcTlA4QY2LMVKUh7-U_KrHgkQs5GFmwI','2025-06-22 13:19:24.044654');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-20  8:57:27
