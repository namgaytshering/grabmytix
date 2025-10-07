-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 31, 2025 at 10:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grabticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add country', 7, 'add_country'),
(26, 'Can change country', 7, 'change_country'),
(27, 'Can delete country', 7, 'delete_country'),
(28, 'Can view country', 7, 'view_country'),
(29, 'Can add currency', 8, 'add_currency'),
(30, 'Can change currency', 8, 'change_currency'),
(31, 'Can delete currency', 8, 'delete_currency'),
(32, 'Can view currency', 8, 'view_currency'),
(33, 'Can add state', 9, 'add_state'),
(34, 'Can change state', 9, 'change_state'),
(35, 'Can delete state', 9, 'delete_state'),
(36, 'Can view state', 9, 'view_state'),
(37, 'Can add suburb', 10, 'add_suburb'),
(38, 'Can change suburb', 10, 'change_suburb'),
(39, 'Can delete suburb', 10, 'delete_suburb'),
(40, 'Can view suburb', 10, 'view_suburb'),
(41, 'Can add user', 11, 'add_user'),
(42, 'Can change user', 11, 'change_user'),
(43, 'Can delete user', 11, 'delete_user'),
(44, 'Can view user', 11, 'view_user'),
(45, 'Can add film show', 12, 'add_filmshow'),
(46, 'Can change film show', 12, 'change_filmshow'),
(47, 'Can delete film show', 12, 'delete_filmshow'),
(48, 'Can view film show', 12, 'view_filmshow'),
(49, 'Can add booking', 13, 'add_booking'),
(50, 'Can change booking', 13, 'change_booking'),
(51, 'Can delete booking', 13, 'delete_booking'),
(52, 'Can view booking', 13, 'view_booking');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_booking`
--

CREATE TABLE `db_booking` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `filmshow_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `poster_image` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
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
  `attended` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_booking`
--

INSERT INTO `db_booking` (`id`, `full_name`, `email`, `phone`, `film_id`, `filmshow_id`, `event_id`, `title`, `poster_image`, `user_id`, `theater_name`, `country_id`, `state_id`, `street`, `no_adult`, `no_child`, `price_adult`, `price_child`, `type`, `currency`, `show_date`, `show_time`, `total_payment`, `payment_status`, `attended`, `created_at`, `updated_at`) VALUES
(154, 'dechen wangmo', 'dechen@gmail.com', 23453534, 2, 23, NULL, 'With Love From Bhutan', 'posters/withlo.jpg', 8, 'Perth College New', 1, 3, '5 ARGYLE PL', 1, 0, 34.00, 34.00, 'Movie', '', '2025-03-27', '12:00:00', 34.0, 0, 0, '2025-03-28 10:44:35', '2025-03-28 10:44:35'),
(155, 'dechen wangmo', 'dechen@gmail.com', 23453534, NULL, NULL, 4, 'Kuma Sagar & The Khwopaa - Live in Canberra', 'events/TH_450__n872jKlE8gJhelBGa8N4ZtGDjfWcITGATqB00cdg.jpg', 8, 'Belcone', 1, 1, '5 ARGYLE PL', 1, 0, 29.00, 0.00, 'event', '', '2025-02-28', '20:42:39', 29.0, 0, 0, '2025-03-28 10:44:40', '2025-03-28 10:44:40'),
(156, 'dechen wangmo', 'dechen@gmail.com', 23453534, NULL, NULL, 2, 'H.E. Drubwang Sangay Dorji Rinpoche', 'events/sdfsfs.jpg', 8, 'perth', 1, 1, 'ererew', 1, 0, 0.00, 0.00, 'event', '', '2025-02-28', '07:34:22', 0.0, 1, 0, '2025-03-28 10:50:11', '2025-03-28 10:50:11'),
(157, 'Namgay Tshering', 'namgay2340@gmail.com', 451081907, 27, 29, NULL, 'Lunana: A Yak in the Classroom', 'posters/maxresdefault_cyF4ir6.jpg', 7, 'Australian National University', 1, 1, 'Australian National University Canberra ACT 2600 Australia', 2, 1, 30.00, 15.00, 'Movie', '', '2025-03-31', '18:30:00', 75.0, 0, 0, '2025-03-28 19:08:14', '2025-03-28 19:08:14'),
(158, 'dechen wangmo', 'dechen@gmail.com', 23453534, 2, 26, NULL, 'With Love From Bhutan', 'posters/withlo.jpg', 8, 'Canberra college', 1, 3, '5 ARGYLE PL', 1, 0, 34.00, 34.00, 'Movie', '', '2025-03-25', '12:00:00', 34.0, 0, 0, '2025-03-28 19:14:09', '2025-03-28 19:14:09'),
(159, 'Namgay Tshering', 'namgay2340@gmail.com', 451081907, 3, 22, NULL, 'Yuel na Relpa', 'posters/300515483_111888848309684_7634611802554225840_n.jpg', 7, 'Canberra college', 1, 1, '5 ARGYLE PL', 1, 0, 34.00, 34.00, 'Movie', '', '2025-03-26', '15:00:00', 34.0, 0, 0, '2025-03-29 09:48:34', '2025-03-29 09:48:34'),
(160, 'Namgay Tshering', 'namgay2340@gmail.com', 451081907, 28, 30, NULL, 'The Monk and the Gun', 'posters/0804_01_0-H-2023.webp', 7, 'Melrose High School Theater', 1, 1, 'Marr St, Pearce ACT 2607', 2, 1, 30.00, 15.00, 'Movie', '', '2025-03-31', '18:00:00', 75.0, 0, 0, '2025-03-29 10:47:27', '2025-03-29 10:47:27'),
(161, 'dechen wangmo', 'dechen@gmail.com', 23453534, 28, 30, NULL, 'The Monk and the Gun', 'posters/0804_01_0-H-2023.webp', 8, 'Melrose High School Theater', 1, 1, 'Marr St, Pearce ACT 2607', 2, 1, 30.00, 15.00, 'Movie', '', '2025-03-31', '18:00:00', 75.0, 0, 0, '2025-03-29 10:47:49', '2025-03-29 10:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `db_country`
--

CREATE TABLE `db_country` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_country`
--

INSERT INTO `db_country` (`id`, `name`) VALUES
(1, 'Australia');

-- --------------------------------------------------------

--
-- Table structure for table `db_currency`
--

CREATE TABLE `db_currency` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_currency`
--

INSERT INTO `db_currency` (`id`, `name`) VALUES
(1, 'AUD');

-- --------------------------------------------------------

--
-- Table structure for table `db_event`
--

CREATE TABLE `db_event` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `poster_image` varchar(200) NOT NULL,
  `type_id` int(11) NOT NULL,
  `place` varchar(255) NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `street` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_event`
--

INSERT INTO `db_event` (`id`, `title`, `slug`, `description`, `poster_image`, `type_id`, `place`, `show_date`, `show_time`, `price`, `currency_id`, `country_id`, `state_id`, `street`, `created_at`, `updated_at`) VALUES
(1, 'Party the Event of the Year', 'party-the-event-of-the-year', 'Mixing creativity and innovation with boundless technical expertise, we work alongside many of the biggest agencies and event management companies in the business to make extraordinary moments happen. We deliver extraordinary technical solutions for those once-in-a-lifetime occasions where you can’t settle for less than stupendous!\r\n\r\nWhether it’s an awe-inspiring light show or powerful projection mapping, a luxury event in a unique location or a spectacular state celebration with extraordinary requirements, we’re there to support you every step of the way.', 'events/Screenshot_2025-02-28_at_6.31.12pm.png', 3, 'Canberra College', '2025-02-28', '07:31:27', 35.00, 1, 1, 1, '5 Argyle place curtin ACT 2605', '2025-02-28 07:31:35', '2025-03-29 06:39:29'),
(2, 'H.E. Drubwang Sangay Dorji Rinpoche', 'he-drubwang-sangay-dorji-rinpoche', 'Mixing creativity and innovation with boundless technical expertise, we work alongside many of the biggest agencies and event management companies in the business to make extraordinary moments happen. We deliver extraordinary technical solutions for those once-in-a-lifetime occasions where you can’t settle for less than stupendous!\r\n\r\nWhether it’s an awe-inspiring light show or powerful projection mapping, a luxury event in a unique location or a spectacular state celebration with extraordinary requirements, we’re there to support you every step of the way.', 'events/sdfsfs.jpg', 4, 'Melrose High School Theater', '2025-02-28', '07:34:22', 0.00, 1, 1, 1, 'Marr St Pearce ACT 2607', '2025-02-28 07:34:36', '2025-03-30 08:59:36'),
(3, 'Special Events', 'special-events', 'Mixing creativity and innovation with boundless technical expertise, we work alongside many of the biggest agencies and event management companies in the business to make extraordinary moments happen. We deliver extraordinary technical solutions for those once-in-a-lifetime occasions where you can’t settle for less than stupendous!\r\n\r\nWhether it’s an awe-inspiring light show or powerful projection mapping, a luxury event in a unique location or a spectacular state celebration with extraordinary requirements, we’re there to support you every step of the way.', 'events/party.jpg', 3, 'Belcone', '2025-02-28', '07:37:29', 55.00, 1, 1, 1, 'rtretre', '2025-02-28 07:37:41', '2025-03-27 19:04:46'),
(4, 'Kuma Sagar & The Khwopaa - Live in Canberra', 'kuma-sagar-the-khwopaa-live-in-canberra', 'Kuma Sagar & The Khwopa is currently the country\'s favorite, with the band\'s music liked by kids to seniors, and from east to the west of Nepal. The reason - the band meticulously weaves the traditional Nepali melodies with the modern vibes. Kuma Sagar, the lead vocalist has a unique vocal tone that captures the imagination of folk listeners as well as the modern youth simultaneously. From 7.5k monthly listeners on Spotify in December 2023 to 110K per month and counting in less than a year time with back-to-back hits such as Chameli Phoola, A Mai Re, Chhare Sari, Oh Champa, Furfuri, Rara Taalai ma, and Bajeko Bajang, the band has seen an exponential growth in a short time. The band has a Midas touch, and every new release is turning to an instant hit, with many songs having muti-million YouTube views already.', 'events/TH_450__n872jKlE8gJhelBGa8N4ZtGDjfWcITGATqB00cdg.jpg', 4, 'Belcone', '2025-02-28', '20:42:39', 29.00, 1, 1, 1, '5 ARGYLE PL', '2025-02-28 20:42:50', '2025-03-29 09:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `db_eventtype`
--

CREATE TABLE `db_eventtype` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_eventtype`
--

INSERT INTO `db_eventtype` (`id`, `name`) VALUES
(1, 'Movie'),
(3, 'Party'),
(4, 'Religious'),
(5, 'Birthday');

-- --------------------------------------------------------

--
-- Table structure for table `db_film`
--

CREATE TABLE `db_film` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `trailer` varchar(200) NOT NULL,
  `slug` varchar(400) DEFAULT NULL,
  `description` text DEFAULT '',
  `release_date` date DEFAULT NULL,
  `duration` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `genre` varchar(100) NOT NULL,
  `director` varchar(200) NOT NULL,
  `cast` text DEFAULT '',
  `language` varchar(100) NOT NULL,
  `poster_image` varchar(255) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_film`
--

INSERT INTO `db_film` (`id`, `title`, `trailer`, `slug`, `description`, `release_date`, `duration`, `genre`, `director`, `cast`, `language`, `poster_image`, `owner_id`, `created_at`, `updated_at`) VALUES
(2, 'With Love From Bhutan', 'https://www.youtube.com/embed/eZHC0HkA4e8?si=rr6Te1WE55YyIcll', 'with-love-from-bhaut', 'Jimmy, an American Bhutanese food anthropology student, returns to Bhutan after twenty years. His mother, Jane, once ran the pioneering restaurant Pelbue before abruptly leaving Bhutan with Jimmy, but without her stepdaughter, Yangchen. Jane\'s sudden departure has left behind scars. Yangchen, his stepsister, feeling abandoned, grew up a loner, and found solace in Bhutan’s landscapes. Back in Bhutan, Jimmy stays with his friend Angay and attempts to reconnect with the now distant Yangchen', '2025-02-25', 2, 'Drama, Romance', 'd', 'Tashi Yoedsel Wangchuk, Tandin Bidha, Tshering Denkar, Kinga Dorj', 'dfs', 'posters/withlo.jpg', 7, '2025-02-24 20:39:08', '2025-03-30 09:52:28'),
(3, 'Yuel na Relpa', 'https://www.youtube.com/embed/ueZXb_G0s40?si=blziGU6AoHeDt4bH', 'yuel-na-relpa', 'Stakeholder & Vendor Management – Negotiating and coordinating with contractors and service providers.\r\nProblem-Solving & Troubleshooting – Identifying and resolving technical and facilities-related issues.\r\nDocumentation & Policy Development – Creating and maintaining ICT and facilities policies/procedures.\r\nAutonomous Work & Initiative – Working independently to manage daily operations and implement improvements.\r\nCommunicati', '2025-02-25', 3, 'Drama, Romance', 'ewr', 'ewrwe', 'wer', 'posters/300515483_111888848309684_7634611802554225840_n.jpg', 7, '2025-02-24 21:24:47', '2025-03-29 06:31:23'),
(5, 'Zoelwa', 'https://www.youtube.com/embed/6ZwpjWX3isM?si=8az3ek6CZRNRtPxx', 'zoelwa', 'Zoelwa,\" the latest Bhutanese movie, is an emotional rollercoaster that delves deep into themes of love, deception, uncontrollable human desires, relationships, trust, and delivers unpredictable plot twists. The standout performance by my good friend charming Tshering Phuntsho as the protagonist showcases his versatility and commitment to his craft. He takes us on a journey, making us question just how far one can go for love and hatred? \r\nThe other cast\'s performances complement ea', '2025-02-28', 2, 'Drama, Romance', 'dsf', 'Dechen Wang. Namgay', 'Dzongkha', 'posters/maxresdefault.jpg', 7, '2025-02-27 20:05:38', '2025-03-29 06:31:21'),
(27, 'Lunana: A Yak in the Classroom', 'https://www.youtube.com/embed/m8YqhCwTf6o?si=acIBkLe1SrMG-Tiu', 'lunana-a-yak-in-the-classroom', 'Bhutanese film Lunana: A Yak in the Classroom has made history as the first Bhutanese film to be nominated for the Academy Awards popularly known as the Oscars. It is one of five films nominated under the Best International Feature Film Category for the Oscars regarded as the most prestigious awards in the entertainment industry. The film directed by Pawo Choyning Dorji is the second movie to be submitted from Bhutan.', NULL, 2, 'Drama, Romance', 'Pawo Choyning Dorji', 'Sherab Dorji, Ugyen Norbu, Lhendup ,Kelden ,Lhamo Gurung ,Sangay Lham ,Chimi Dem.', 'Dzongkha, English', 'posters/maxresdefault_cyF4ir6.jpg', 7, '2025-03-28 18:32:40', '2025-03-29 05:51:20'),
(28, 'The Monk and the Gun', 'https://www.youtube.com/embed/NF0JChMz8Uc?si=PUzdJs3TXG1bD8Jd', 'the-monk-and-the-gun', 'An American travels into Bhutan in search of a valuable antique rifle and crosses paths with a young monk who wanders through the serene mountains, instructed by his teacher to make things right again.', NULL, 2, 'Comedy, Drama', 'Pawo Choyning Dorji', 'Tandin Wangchuk,Tandin Phubz,Kelsang Choejay', 'Dzongkha, English', 'posters/0804_01_0-H-2023.webp', 7, '2025-03-29 10:31:23', '2025-03-29 10:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `db_filmshow`
--

CREATE TABLE `db_filmshow` (
  `id` bigint(20) NOT NULL,
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
  `state_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_filmshow`
--

INSERT INTO `db_filmshow` (`id`, `slug`, `film_id`, `theater_name`, `show_date`, `show_time`, `adult`, `child`, `street`, `created_at`, `updated_at`, `country_id`, `currency_id`, `state_id`) VALUES
(23, '3435trewdfv', 2, 'Perth College New', '2025-03-27', '12:00:00.000000', 34.00, 34, '5 ARGYLE PL', '2025-03-24 07:50:16.000000', '2025-03-24 07:50:16.000000', 1, 1, 3),
(27, 'zoelwa-canberra-college-2025-03-27-120000', 5, 'Canberra college', '2025-03-27', '12:00:00.000000', 35.00, 35, '5 ARGYLE PL', '2025-03-25 19:40:04.000000', '2025-03-25 19:40:04.000000', 1, 1, 1),
(29, 'lunana-a-yak-in-the-classroom-australian-national-university-2025-03-31-183000', 27, 'Australian National University', '2025-03-31', '18:30:00.000000', 30.00, 15, 'Australian National University Canberra ACT 2600 Australia', '2025-03-29 05:44:17.000000', '2025-03-29 05:44:17.000000', 1, 1, 1),
(30, 'the-monk-and-the-gun-melrose-high-school-theater-2025-03-31-180000', 28, 'Melrose High School Theater', '2025-03-31', '18:00:00.000000', 30.00, 15, 'Marr St, Pearce ACT 2607', '2025-03-29 21:34:34.000000', '2025-03-29 21:34:34.000000', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_state`
--

CREATE TABLE `db_state` (
  `id` bigint(20) NOT NULL,
  `name` varchar(500) NOT NULL,
  `country_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_state`
--

INSERT INTO `db_state` (`id`, `name`, `country_id`) VALUES
(1, 'Canberra', 1),
(3, 'Perth', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_suburb`
--

CREATE TABLE `db_suburb` (
  `id` bigint(20) NOT NULL,
  `name` varchar(500) NOT NULL,
  `state_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_user`
--

CREATE TABLE `db_user` (
  `id` bigint(20) NOT NULL,
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
  `is_owner` tinyint(1) NOT NULL,
  `password` varchar(500) NOT NULL,
  `is_user` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `db_user`
--

INSERT INTO `db_user` (`id`, `email`, `slug`, `name`, `username`, `phone`, `gender`, `profile`, `is_admin`, `is_active`, `is_staff`, `is_owner`, `password`, `is_user`, `is_superuser`, `date_joined`, `last_login`) VALUES
(7, 'namgay2340@gmail.com', 'namgay-tshering', 'Namgay Tshering', 'namgay-tshering', 451081907, 'Male', 'user/profile/user_default.jpg', 1, 1, 1, 1, 'pbkdf2_sha256$870000$feRfcOzfNGKnNwfwHGTFSp$VJxtEJJFZEHC6ITYaLCg6F+bLIB14oNve8ZFhphOc3U=', 1, 0, '2025-03-18 07:29:16.000000', '2025-03-28 20:21:53.000000'),
(8, 'dechen@gmail.com', 'dechen-wangmo', 'dechen wangmo', 'dechen-wangmo', 23453534, 'Female', 'user/profile/user_default.jpg', 0, 1, 0, 0, 'pbkdf2_sha256$870000$AxoK4fLWX2zNE1YcMDvDiY$tSynQOCeKtOHllw+FpL+NNJwonkH+HV24VcnoYcSoGY=', 1, 0, '2025-03-21 11:30:00.000000', '2025-03-28 20:20:55.000000');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-02-25 07:32:39.000000', '2', 'dechen', 1, '[{\"added\": {}}]', 4, 1),
(2, '2025-02-25 07:32:56.000000', '2', 'dechen', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\"]}}]', 4, 1),
(3, '2025-02-25 07:36:40.000000', '1', 'Dechen Wangmo', 1, '[{\"added\": {}}]', 11, 1),
(4, '2025-02-25 07:37:06.000000', '1', 'with love from bhutan', 1, '[{\"added\": {}}]', 14, 1),
(5, '2025-02-25 07:39:08.000000', '2', 'with love from bhaut', 1, '[{\"added\": {}}]', 14, 1),
(6, '2025-02-25 07:45:00.000000', '1', 'Australia', 1, '[{\"added\": {}}]', 7, 1),
(7, '2025-02-25 07:45:04.000000', '1', 'AUD', 1, '[{\"added\": {}}]', 8, 1),
(8, '2025-02-25 07:45:15.000000', '1', 'Canberra', 1, '[{\"added\": {}}]', 9, 1),
(9, '2025-02-25 07:45:38.000000', '1', 'with love from bhaut - Canberr', 1, '[{\"added\": {}}]', 12, 1),
(10, '2025-02-25 07:46:58.000000', '2', 'With Love From Bhutan', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Cast\"]}}]', 14, 1),
(11, '2025-02-25 07:55:41.000000', '2', 'With Love From Bhutan', 2, '[{\"changed\": {\"fields\": [\"Poster image\"]}}]', 14, 1),
(12, '2025-02-25 08:24:47.000000', '3', 'Yuel na Relpa', 1, '[{\"added\": {}}]', 14, 1),
(13, '2025-02-26 11:02:47.000000', '2', 'Yuel na Relpa - Canberra', 1, '[{\"added\": {}}]', 12, 1),
(14, '2025-02-28 06:51:52.000000', '3', 'With Love From Bhutan - Perth', 1, '[{\"added\": {}}]', 12, 1),
(15, '2025-02-28 06:55:55.000000', '1', 'Movie', 1, '[{\"added\": {}}]', 15, 1),
(16, '2025-02-28 06:55:59.000000', '2', 'Part', 1, '[{\"added\": {}}]', 15, 1),
(17, '2025-02-28 06:56:05.000000', '3', 'Party', 1, '[{\"added\": {}}]', 15, 1),
(18, '2025-02-28 06:56:14.000000', '4', 'Religious', 1, '[{\"added\": {}}]', 15, 1),
(19, '2025-02-28 06:56:17.000000', '5', 'Birthday', 1, '[{\"added\": {}}]', 15, 1),
(20, '2025-02-28 06:59:50.000000', '3', 'Yuel na Relpa', 2, '[{\"changed\": {\"fields\": [\"Type\"]}}]', 14, 1),
(21, '2025-02-28 06:59:54.000000', '2', 'With Love From Bhutan', 2, '[{\"changed\": {\"fields\": [\"Type\"]}}]', 14, 1),
(22, '2025-02-28 07:01:42.000000', '4', 'Party event', 1, '[{\"added\": {}}]', 14, 1),
(23, '2025-02-28 07:05:38.000000', '5', 'Zoelwa', 1, '[{\"added\": {}}]', 14, 1),
(24, '2025-02-28 07:06:19.000000', '5', 'Zoelwa', 2, '[{\"changed\": {\"fields\": [\"Poster image\"]}}]', 14, 1),
(25, '2025-02-28 07:06:44.000000', '5', 'Zoelwa', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 14, 1),
(26, '2025-02-28 07:31:35.000000', '1', 'Party the Event of the Year', 1, '[{\"added\": {}}]', 16, 1),
(27, '2025-02-28 07:34:36.000000', '2', 'H.E. Drubwang Sangay Dorji Rinpoche', 1, '[{\"added\": {}}]', 16, 1),
(28, '2025-02-28 07:37:41.000000', '3', 'Special Events', 1, '[{\"added\": {}}]', 16, 1),
(29, '2025-02-28 07:38:49.000000', '3', 'Special Events', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 16, 1),
(30, '2025-02-28 07:38:53.000000', '2', 'H.E. Drubwang Sangay Dorji Rinpoche', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 16, 1),
(31, '2025-02-28 07:38:57.000000', '1', 'Party the Event of the Year', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 16, 1),
(32, '2025-02-28 07:48:16.000000', '3', 'Special Events', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 16, 1),
(33, '2025-02-28 07:48:20.000000', '2', 'H.E. Drubwang Sangay Dorji Rinpoche', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 16, 1),
(34, '2025-02-28 07:48:23.000000', '1', 'Party the Event of the Year', 2, '[]', 16, 1),
(35, '2025-02-28 07:48:26.000000', '1', 'Party the Event of the Year', 2, '[]', 16, 1),
(36, '2025-02-28 07:48:30.000000', '2', 'H.E. Drubwang Sangay Dorji Rinpoche', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 16, 1),
(37, '2025-02-28 07:48:34.000000', '3', 'Special Events', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 16, 1),
(38, '2025-02-28 07:48:38.000000', '3', 'Special Events', 2, '[]', 16, 1),
(39, '2025-02-28 20:42:50.000000', '4', 'Kuma Sagar & The Khwopaa - Live in Canberra', 1, '[{\"added\": {}}]', 16, 1),
(40, '2025-03-02 03:17:39.000000', '2', 'With Love From Bhutan', 2, '[{\"changed\": {\"fields\": [\"Trailer\"]}}]', 14, 1),
(41, '2025-03-02 03:19:13.000000', '2', 'With Love From Bhutan', 2, '[{\"changed\": {\"fields\": [\"Trailer\"]}}]', 14, 1),
(42, '2025-03-02 03:19:58.000000', '2', 'With Love From Bhutan', 2, '[{\"changed\": {\"fields\": [\"Trailer\"]}}]', 14, 1),
(43, '2025-03-02 03:21:48.000000', '5', 'Zoelwa', 2, '[{\"changed\": {\"fields\": [\"Trailer\"]}}]', 14, 1),
(44, '2025-03-02 03:22:17.000000', '3', 'Yuel na Relpa', 2, '[{\"changed\": {\"fields\": [\"Trailer\"]}}]', 14, 1),
(45, '2025-03-02 10:59:36.000000', '2', 'With Love From Bhutan', 2, '[{\"changed\": {\"fields\": [\"Trailer\"]}}]', 14, 3),
(46, '2025-03-02 10:59:54.000000', '2', 'With Love From Bhutan', 2, '[{\"changed\": {\"fields\": [\"Trailer\"]}}]', 14, 3),
(47, '2025-03-02 11:00:11.000000', '2', 'With Love From Bhutan', 2, '[{\"changed\": {\"fields\": [\"Trailer\"]}}]', 14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(13, 'db', 'booking'),
(7, 'db', 'country'),
(8, 'db', 'currency'),
(16, 'db', 'event'),
(15, 'db', 'eventtype'),
(14, 'db', 'film'),
(12, 'db', 'filmshow'),
(9, 'db', 'state'),
(10, 'db', 'suburb'),
(11, 'db', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-02-24 11:03:40.000000'),
(2, 'auth', '0001_initial', '2025-02-24 11:03:40.000000'),
(3, 'admin', '0001_initial', '2025-02-24 11:03:40.000000'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-02-24 11:03:40.000000'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-24 11:03:40.000000'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-02-24 11:03:40.000000'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-02-24 11:03:40.000000'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-02-24 11:03:40.000000'),
(9, 'auth', '0004_alter_user_username_opts', '2025-02-24 11:03:40.000000'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-02-24 11:03:40.000000'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-02-24 11:03:40.000000'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-02-24 11:03:40.000000'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-02-24 11:03:40.000000'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-02-24 11:03:40.000000'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-02-24 11:03:40.000000'),
(16, 'auth', '0011_update_proxy_permissions', '2025-02-24 11:03:40.000000'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-02-24 11:03:40.000000'),
(18, 'db', '0001_initial', '2025-02-24 11:03:40.000000'),
(19, 'db', '0002_remove_film_owner_remove_filmshow_film_and_more', '2025-02-24 11:03:40.000000'),
(20, 'sessions', '0001_initial', '2025-02-24 11:03:40.000000'),
(21, 'db', '0003_film_filmshow_booking', '2025-02-24 11:04:53.000000'),
(22, 'db', '0004_alter_film_cast_alter_film_duration_alter_film_genre', '2025-02-24 11:04:53.000000'),
(23, 'db', '0005_remove_booking_film_remove_filmshow_film_delete_film', '2025-02-24 11:04:54.000000');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('b64x205t4lio5jsih87zwwihllyfg9ap', '.eJxVjEEOwiAQRe_C2pBSoMy4dO8ZyHQYpGpKUtqV8e7apAvd_vfef6lI21ri1mSJU1JnNajT7zYSP2TeQbrTfKua67wu06h3RR-06WtN8rwc7t9BoVa-NTBk7oG4H3w2PlDogjdkMYBIThlQvDUOGa04cETgAagTNIgQhNT7A-MVN60:1tu9uC:q0b8q0eY2UofiLTti-0D8AdvzaeBjjXvKd2yCEIuJw0', '2025-03-31 12:49:20.000000'),
('iish7jkne99a7wiizu2dor155wweybt3', '.eJxVjLEOwyAQQ_-FuUKBhDvo2D3fgA4OlbQVSCGZqv57iZShlRfLz_ZbeNq37PeWVr-wuAoUl98sUHymcgB-ULlXGWvZ1iXIoyJP2uRcOb1uZ_fvIFPLfQ1xQoU8MiQTlVHaKjCJCC2DwcF1JRsVIaAbB41aESNA6N6Ro0l8vrxQNo0:1tyGDB:XSHOi11C5bP4I-moovkOKxU1d_gDpftSvIjwQQ32pXs', '2025-04-11 20:21:53.000000'),
('xpi3twzp236zfti7ljorgyqnk6imhpua', '.eJxVjMsOwiAQRf-FtSFDeRRcuvcbCMNMpWogKe3K-O_apAvd3nPOfYmYtrXErfMSZxJn4cXpd8OUH1x3QPdUb03mVtdlRrkr8qBdXhvx83K4fwcl9fKt2Xqn0QyUICinRmsYfCbFg_MAIRPypMgFY7NmQKIRPRgIWk9MACDeH9clN5k:1tyGCF:hCdt2YvGswEyHtXGJ4RGT23H2fNWTBnUXES1DUaAiPg', '2025-04-11 20:20:55.000000'),
('y8322n1vm276eqbufrxlxvha1823hmwm', '.eJxVjEsOAiEQBe_C2hB6YPi4dD9nIDTdyqiBZD4r492VZBa6fVX1XiKmfStxX3mJM4mzGMXpd8OUH1w7oHuqtyZzq9syo-yKPOgqp0b8vBzu30FJa-n1wKA0qWT9FSEEMprRAbFHY7TyKoegcNAZRhfIAvPX1YOxGByAz-L9Ad50N2s:1tpJ7m:3mZqUMwEpLAg9y2gH5qyyD9iErXXUWhGqy_YtDXhPK4', '2025-03-18 03:39:18.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `db_booking`
--
ALTER TABLE `db_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_country`
--
ALTER TABLE `db_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_currency`
--
ALTER TABLE `db_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_event`
--
ALTER TABLE `db_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_eventtype`
--
ALTER TABLE `db_eventtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_film`
--
ALTER TABLE `db_film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_filmshow`
--
ALTER TABLE `db_filmshow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_filmshow_country_id_ea89cd6d_fk_db_country_id` (`country_id`),
  ADD KEY `db_filmshow_currency_id_d5f59615_fk_db_currency_id` (`currency_id`),
  ADD KEY `db_filmshow_state_id_97266eba_fk_db_state_id` (`state_id`);

--
-- Indexes for table `db_state`
--
ALTER TABLE `db_state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_state_country_id_29ec663f_fk_db_country_id` (`country_id`);

--
-- Indexes for table `db_suburb`
--
ALTER TABLE `db_suburb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_suburb_state_id_a58414c6_fk_db_state_id` (`state_id`);

--
-- Indexes for table `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_booking`
--
ALTER TABLE `db_booking`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `db_country`
--
ALTER TABLE `db_country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_currency`
--
ALTER TABLE `db_currency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_event`
--
ALTER TABLE `db_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_eventtype`
--
ALTER TABLE `db_eventtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_film`
--
ALTER TABLE `db_film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `db_filmshow`
--
ALTER TABLE `db_filmshow`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `db_state`
--
ALTER TABLE `db_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_suburb`
--
ALTER TABLE `db_suburb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_user`
--
ALTER TABLE `db_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `db_filmshow`
--
ALTER TABLE `db_filmshow`
  ADD CONSTRAINT `db_filmshow_country_id_ea89cd6d_fk_db_country_id` FOREIGN KEY (`country_id`) REFERENCES `db_country` (`id`),
  ADD CONSTRAINT `db_filmshow_currency_id_d5f59615_fk_db_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `db_currency` (`id`),
  ADD CONSTRAINT `db_filmshow_state_id_97266eba_fk_db_state_id` FOREIGN KEY (`state_id`) REFERENCES `db_state` (`id`);

--
-- Constraints for table `db_state`
--
ALTER TABLE `db_state`
  ADD CONSTRAINT `db_state_country_id_29ec663f_fk_db_country_id` FOREIGN KEY (`country_id`) REFERENCES `db_country` (`id`);

--
-- Constraints for table `db_suburb`
--
ALTER TABLE `db_suburb`
  ADD CONSTRAINT `db_suburb_state_id_a58414c6_fk_db_state_id` FOREIGN KEY (`state_id`) REFERENCES `db_state` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
