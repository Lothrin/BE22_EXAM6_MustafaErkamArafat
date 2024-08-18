-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2024 at 05:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be22_exam6_bigeventsmustafaerkamarafat`
--
CREATE DATABASE IF NOT EXISTS `be22_exam6_bigeventsmustafaerkamarafat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be22_exam6_bigeventsmustafaerkamarafat`;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `date`, `description`, `image`, `capacity`, `email`, `phone_number`, `address`, `url`, `type`) VALUES
(7, 'Football Match', '2024-10-12 19:30:00', '11 vs 11 Football Match', 'https://cdn.pixabay.com/photo/2018/06/12/19/59/football-3471371_1280.jpg', 22, 'soccer@mail.com', 1234234323, 'Hütteldorfer Straße 68, 1140, Vienna', NULL, 'sports'),
(8, 'Fiddler on the Roof', '2025-03-12 20:00:00', 'The unforgettable Fiddler on the Roof play comes to life.', 'https://cdn.pixabay.com/photo/2013/02/26/01/10/auditorium-86197_1280.jpg', 250, 'theater@mail.com', 1923943, 'Langegasse 25, 1090, Vienna', NULL, 'theater'),
(9, 'Taylor Swift Concert', '2025-12-22 21:00:00', 'Taylor Swift Concert with the new album on Tour', 'https://cdn.pixabay.com/photo/2018/05/10/11/34/concert-3387324_640.jpg', 120000, 'concert@mail.com', 123412323, 'Währingerstraße 255, 1090 Vienna', NULL, 'music'),
(10, 'Spray Painting', '2025-10-22 09:00:00', 'Spray painting the old abandoned house', 'https://cdn.pixabay.com/photo/2023/03/29/16/53/street-art-7885965_640.jpg', 25, 'paint@mail.com', 123232323, 'Obere-augarten-Straße 155, 1150, Vienna', NULL, 'arts'),
(11, 'Shrek 6', '2025-02-20 21:00:00', 'Shrek and all the fairy tale creatures are on their adventures again!', 'https://cdn.pixabay.com/photo/2015/04/14/17/08/alien-722415_1280.jpg', 120, 'cinema@mail.com', 1231231232, 'burggasse stadthalle, LUGNER CITY, 1160, Vienna', NULL, 'cinema');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
