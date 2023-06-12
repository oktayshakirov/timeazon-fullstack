-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 09:02 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizzalieferung`
--
CREATE DATABASE IF NOT EXISTS `pizzalieferung` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pizzalieferung`;

-- --------------------------------------------------------

--
-- Table structure for table `getranke`
--

CREATE TABLE `getranke` (
  `getraenk_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `preis` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `getrankepositionen`
--

CREATE TABLE `getrankepositionen` (
  `getraenkposition_id` int(11) NOT NULL,
  `lieferung_id` int(11) NOT NULL,
  `getraenk_id` int(11) NOT NULL,
  `anzahl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kunden`
--

CREATE TABLE `kunden` (
  `kunden_id` int(11) NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `nachname` varchar(255) NOT NULL,
  `plz` varchar(10) NOT NULL,
  `ort` varchar(255) NOT NULL,
  `strasse_nr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kunden`
--

INSERT INTO `kunden` (`kunden_id`, `vorname`, `nachname`, `plz`, `ort`, `strasse_nr`) VALUES
(1, 'Oktay', 'Shakirov', '13593', 'Berlin', 'Blasewitze Ring 16'),
(2, 'Anna', 'Schmidt', '67890', 'Frankfurt', 'Dresdener Strasse 25'),
(3, 'Maximilian', 'Meier', '23643', 'Munchen', 'Berliner Strasse 333');

-- --------------------------------------------------------

--
-- Table structure for table `lieferpositionen`
--

CREATE TABLE `lieferpositionen` (
  `lieferposition_id` int(11) NOT NULL,
  `lieferung_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `topping_id` int(11) NOT NULL,
  `anzahl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lieferungen`
--

CREATE TABLE `lieferungen` (
  `lieferung_id` int(11) NOT NULL,
  `kunden_id` int(11) NOT NULL,
  `lieferdatum` date NOT NULL,
  `lieferzeit` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lieferungen`
--

INSERT INTO `lieferungen` (`lieferung_id`, `kunden_id`, `lieferdatum`, `lieferzeit`) VALUES
(1, 1, '2023-05-17', '00:25:06'),
(2, 2, '2023-05-18', '01:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `pizzen`
--

CREATE TABLE `pizzen` (
  `pizza_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `basispreis` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pizzen`
--

INSERT INTO `pizzen` (`pizza_id`, `name`, `basispreis`) VALUES
(1, 'Margherita', '4.00'),
(2, 'Salami', '5.00'),
(3, 'Funghi', '3.00'),
(4, 'Quattro', '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `topping`
--

CREATE TABLE `topping` (
  `topping_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `preis` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topping`
--

INSERT INTO `topping` (`topping_id`, `name`, `preis`) VALUES
(1, 'Truffel', '3.00'),
(2, 'Champignon', '1.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `getranke`
--
ALTER TABLE `getranke`
  ADD PRIMARY KEY (`getraenk_id`);

--
-- Indexes for table `getrankepositionen`
--
ALTER TABLE `getrankepositionen`
  ADD PRIMARY KEY (`getraenkposition_id`),
  ADD KEY `lieferung_id` (`lieferung_id`),
  ADD KEY `getraenk_id` (`getraenk_id`);

--
-- Indexes for table `kunden`
--
ALTER TABLE `kunden`
  ADD PRIMARY KEY (`kunden_id`);

--
-- Indexes for table `lieferpositionen`
--
ALTER TABLE `lieferpositionen`
  ADD PRIMARY KEY (`lieferposition_id`);

--
-- Indexes for table `lieferungen`
--
ALTER TABLE `lieferungen`
  ADD PRIMARY KEY (`lieferung_id`),
  ADD KEY `kunden_id` (`kunden_id`);

--
-- Indexes for table `pizzen`
--
ALTER TABLE `pizzen`
  ADD PRIMARY KEY (`pizza_id`);

--
-- Indexes for table `topping`
--
ALTER TABLE `topping`
  ADD PRIMARY KEY (`topping_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `getranke`
--
ALTER TABLE `getranke`
  MODIFY `getraenk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `getrankepositionen`
--
ALTER TABLE `getrankepositionen`
  MODIFY `getraenkposition_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kunden`
--
ALTER TABLE `kunden`
  MODIFY `kunden_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lieferpositionen`
--
ALTER TABLE `lieferpositionen`
  MODIFY `lieferposition_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lieferungen`
--
ALTER TABLE `lieferungen`
  MODIFY `lieferung_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pizzen`
--
ALTER TABLE `pizzen`
  MODIFY `pizza_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `topping`
--
ALTER TABLE `topping`
  MODIFY `topping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `getrankepositionen`
--
ALTER TABLE `getrankepositionen`
  ADD CONSTRAINT `getrankepositionen_ibfk_1` FOREIGN KEY (`lieferung_id`) REFERENCES `lieferungen` (`lieferung_id`),
  ADD CONSTRAINT `getrankepositionen_ibfk_2` FOREIGN KEY (`getraenk_id`) REFERENCES `getranke` (`getraenk_id`);

--
-- Constraints for table `lieferungen`
--
ALTER TABLE `lieferungen`
  ADD CONSTRAINT `lieferungen_ibfk_1` FOREIGN KEY (`kunden_id`) REFERENCES `kunden` (`kunden_id`);
--
-- Database: `watch_store`
--
CREATE DATABASE IF NOT EXISTS `watch_store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `watch_store`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `action`, `subject`, `properties`, `conditions`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'plugin::upload.read', NULL, '{}', '[]', '2023-06-03 20:39:37.819000', '2023-06-03 20:39:37.819000', NULL, NULL),
(2, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-06-03 20:39:37.829000', '2023-06-03 20:39:37.829000', NULL, NULL),
(3, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-06-03 20:39:37.834000', '2023-06-03 20:39:37.834000', NULL, NULL),
(4, 'plugin::upload.assets.update', NULL, '{}', '[]', '2023-06-03 20:39:37.839000', '2023-06-03 20:39:37.839000', NULL, NULL),
(5, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-06-03 20:39:37.846000', '2023-06-03 20:39:37.846000', NULL, NULL),
(6, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-06-03 20:39:37.851000', '2023-06-03 20:39:37.851000', NULL, NULL),
(7, 'plugin::upload.read', NULL, '{}', '[\"admin::is-creator\"]', '2023-06-03 20:39:37.856000', '2023-06-03 20:39:37.856000', NULL, NULL),
(8, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-06-03 20:39:37.862000', '2023-06-03 20:39:37.862000', NULL, NULL),
(9, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-06-03 20:39:37.868000', '2023-06-03 20:39:37.868000', NULL, NULL),
(10, 'plugin::upload.assets.update', NULL, '{}', '[\"admin::is-creator\"]', '2023-06-03 20:39:37.878000', '2023-06-03 20:39:37.878000', NULL, NULL),
(11, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-06-03 20:39:37.882000', '2023-06-03 20:39:37.882000', NULL, NULL),
(12, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-06-03 20:39:37.886000', '2023-06-03 20:39:37.886000', NULL, NULL),
(13, 'plugin::content-manager.explorer.create', 'plugin::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}', '[]', '2023-06-03 20:39:37.922000', '2023-06-03 20:39:37.922000', NULL, NULL),
(14, 'plugin::content-manager.explorer.read', 'plugin::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}', '[]', '2023-06-03 20:39:37.930000', '2023-06-03 20:39:37.930000', NULL, NULL),
(15, 'plugin::content-manager.explorer.update', 'plugin::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}', '[]', '2023-06-03 20:39:37.934000', '2023-06-03 20:39:37.934000', NULL, NULL),
(16, 'plugin::content-manager.explorer.delete', 'plugin::users-permissions.user', '{}', '[]', '2023-06-03 20:39:37.939000', '2023-06-03 20:39:37.939000', NULL, NULL),
(17, 'plugin::content-manager.single-types.configure-view', NULL, '{}', '[]', '2023-06-03 20:39:37.946000', '2023-06-03 20:39:37.946000', NULL, NULL),
(18, 'plugin::content-manager.collection-types.configure-view', NULL, '{}', '[]', '2023-06-03 20:39:37.950000', '2023-06-03 20:39:37.950000', NULL, NULL),
(19, 'plugin::content-manager.components.configure-layout', NULL, '{}', '[]', '2023-06-03 20:39:37.954000', '2023-06-03 20:39:37.954000', NULL, NULL),
(20, 'plugin::content-type-builder.read', NULL, '{}', '[]', '2023-06-03 20:39:37.962000', '2023-06-03 20:39:37.962000', NULL, NULL),
(21, 'plugin::email.settings.read', NULL, '{}', '[]', '2023-06-03 20:39:37.967000', '2023-06-03 20:39:37.967000', NULL, NULL),
(22, 'plugin::upload.read', NULL, '{}', '[]', '2023-06-03 20:39:37.972000', '2023-06-03 20:39:37.972000', NULL, NULL),
(23, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-06-03 20:39:37.979000', '2023-06-03 20:39:37.979000', NULL, NULL),
(24, 'plugin::upload.assets.update', NULL, '{}', '[]', '2023-06-03 20:39:37.983000', '2023-06-03 20:39:37.983000', NULL, NULL),
(25, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-06-03 20:39:37.988000', '2023-06-03 20:39:37.988000', NULL, NULL),
(26, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-06-03 20:39:37.994000', '2023-06-03 20:39:37.994000', NULL, NULL),
(27, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-06-03 20:39:37.999000', '2023-06-03 20:39:37.999000', NULL, NULL),
(28, 'plugin::upload.settings.read', NULL, '{}', '[]', '2023-06-03 20:39:38.004000', '2023-06-03 20:39:38.004000', NULL, NULL),
(29, 'plugin::users-permissions.roles.create', NULL, '{}', '[]', '2023-06-03 20:39:38.010000', '2023-06-03 20:39:38.010000', NULL, NULL),
(30, 'plugin::users-permissions.roles.read', NULL, '{}', '[]', '2023-06-03 20:39:38.014000', '2023-06-03 20:39:38.014000', NULL, NULL),
(31, 'plugin::users-permissions.roles.update', NULL, '{}', '[]', '2023-06-03 20:39:38.018000', '2023-06-03 20:39:38.018000', NULL, NULL),
(32, 'plugin::users-permissions.roles.delete', NULL, '{}', '[]', '2023-06-03 20:39:38.022000', '2023-06-03 20:39:38.022000', NULL, NULL),
(33, 'plugin::users-permissions.providers.read', NULL, '{}', '[]', '2023-06-03 20:39:38.029000', '2023-06-03 20:39:38.029000', NULL, NULL),
(34, 'plugin::users-permissions.providers.update', NULL, '{}', '[]', '2023-06-03 20:39:38.033000', '2023-06-03 20:39:38.033000', NULL, NULL),
(35, 'plugin::users-permissions.email-templates.read', NULL, '{}', '[]', '2023-06-03 20:39:38.037000', '2023-06-03 20:39:38.037000', NULL, NULL),
(36, 'plugin::users-permissions.email-templates.update', NULL, '{}', '[]', '2023-06-03 20:39:38.043000', '2023-06-03 20:39:38.043000', NULL, NULL),
(37, 'plugin::users-permissions.advanced-settings.read', NULL, '{}', '[]', '2023-06-03 20:39:38.048000', '2023-06-03 20:39:38.048000', NULL, NULL),
(38, 'plugin::users-permissions.advanced-settings.update', NULL, '{}', '[]', '2023-06-03 20:39:38.052000', '2023-06-03 20:39:38.052000', NULL, NULL),
(39, 'plugin::i18n.locale.create', NULL, '{}', '[]', '2023-06-03 20:39:38.056000', '2023-06-03 20:39:38.056000', NULL, NULL),
(40, 'plugin::i18n.locale.read', NULL, '{}', '[]', '2023-06-03 20:39:38.063000', '2023-06-03 20:39:38.063000', NULL, NULL),
(41, 'plugin::i18n.locale.update', NULL, '{}', '[]', '2023-06-03 20:39:38.067000', '2023-06-03 20:39:38.067000', NULL, NULL),
(42, 'plugin::i18n.locale.delete', NULL, '{}', '[]', '2023-06-03 20:39:38.071000', '2023-06-03 20:39:38.071000', NULL, NULL),
(43, 'admin::marketplace.read', NULL, '{}', '[]', '2023-06-03 20:39:38.080000', '2023-06-03 20:39:38.080000', NULL, NULL),
(44, 'admin::webhooks.create', NULL, '{}', '[]', '2023-06-03 20:39:38.085000', '2023-06-03 20:39:38.085000', NULL, NULL),
(45, 'admin::webhooks.read', NULL, '{}', '[]', '2023-06-03 20:39:38.089000', '2023-06-03 20:39:38.089000', NULL, NULL),
(46, 'admin::webhooks.update', NULL, '{}', '[]', '2023-06-03 20:39:38.096000', '2023-06-03 20:39:38.096000', NULL, NULL),
(47, 'admin::webhooks.delete', NULL, '{}', '[]', '2023-06-03 20:39:38.099000', '2023-06-03 20:39:38.099000', NULL, NULL),
(48, 'admin::users.create', NULL, '{}', '[]', '2023-06-03 20:39:38.105000', '2023-06-03 20:39:38.105000', NULL, NULL),
(49, 'admin::users.read', NULL, '{}', '[]', '2023-06-03 20:39:38.111000', '2023-06-03 20:39:38.111000', NULL, NULL),
(50, 'admin::users.update', NULL, '{}', '[]', '2023-06-03 20:39:38.115000', '2023-06-03 20:39:38.115000', NULL, NULL),
(51, 'admin::users.delete', NULL, '{}', '[]', '2023-06-03 20:39:38.119000', '2023-06-03 20:39:38.119000', NULL, NULL),
(52, 'admin::roles.create', NULL, '{}', '[]', '2023-06-03 20:39:38.123000', '2023-06-03 20:39:38.123000', NULL, NULL),
(53, 'admin::roles.read', NULL, '{}', '[]', '2023-06-03 20:39:38.130000', '2023-06-03 20:39:38.130000', NULL, NULL),
(54, 'admin::roles.update', NULL, '{}', '[]', '2023-06-03 20:39:38.137000', '2023-06-03 20:39:38.137000', NULL, NULL),
(55, 'admin::roles.delete', NULL, '{}', '[]', '2023-06-03 20:39:38.150000', '2023-06-03 20:39:38.150000', NULL, NULL),
(56, 'admin::api-tokens.access', NULL, '{}', '[]', '2023-06-03 20:39:38.154000', '2023-06-03 20:39:38.154000', NULL, NULL),
(57, 'admin::api-tokens.create', NULL, '{}', '[]', '2023-06-03 20:39:38.160000', '2023-06-03 20:39:38.160000', NULL, NULL),
(58, 'admin::api-tokens.read', NULL, '{}', '[]', '2023-06-03 20:39:38.164000', '2023-06-03 20:39:38.164000', NULL, NULL),
(59, 'admin::api-tokens.update', NULL, '{}', '[]', '2023-06-03 20:39:38.170000', '2023-06-03 20:39:38.170000', NULL, NULL),
(60, 'admin::api-tokens.regenerate', NULL, '{}', '[]', '2023-06-03 20:39:38.176000', '2023-06-03 20:39:38.176000', NULL, NULL),
(61, 'admin::api-tokens.delete', NULL, '{}', '[]', '2023-06-03 20:39:38.180000', '2023-06-03 20:39:38.180000', NULL, NULL),
(62, 'admin::project-settings.update', NULL, '{}', '[]', '2023-06-03 20:39:38.184000', '2023-06-03 20:39:38.184000', NULL, NULL),
(63, 'admin::project-settings.read', NULL, '{}', '[]', '2023-06-03 20:39:38.188000', '2023-06-03 20:39:38.188000', NULL, NULL),
(64, 'admin::transfer.tokens.access', NULL, '{}', '[]', '2023-06-03 20:39:38.196000', '2023-06-03 20:39:38.196000', NULL, NULL),
(65, 'admin::transfer.tokens.create', NULL, '{}', '[]', '2023-06-03 20:39:38.200000', '2023-06-03 20:39:38.200000', NULL, NULL),
(66, 'admin::transfer.tokens.read', NULL, '{}', '[]', '2023-06-03 20:39:38.204000', '2023-06-03 20:39:38.204000', NULL, NULL),
(67, 'admin::transfer.tokens.update', NULL, '{}', '[]', '2023-06-03 20:39:38.210000', '2023-06-03 20:39:38.210000', NULL, NULL),
(68, 'admin::transfer.tokens.regenerate', NULL, '{}', '[]', '2023-06-03 20:39:38.214000', '2023-06-03 20:39:38.214000', NULL, NULL),
(69, 'admin::transfer.tokens.delete', NULL, '{}', '[]', '2023-06-03 20:39:38.219000', '2023-06-03 20:39:38.219000', NULL, NULL),
(73, 'plugin::content-manager.explorer.delete', 'api::product.product', '{}', '[]', '2023-06-03 20:42:54.797000', '2023-06-03 20:42:54.797000', NULL, NULL),
(74, 'plugin::content-manager.explorer.publish', 'api::product.product', '{}', '[]', '2023-06-03 20:42:54.802000', '2023-06-03 20:42:54.802000', NULL, NULL),
(78, 'plugin::content-manager.explorer.delete', 'api::category.category', '{}', '[]', '2023-06-03 20:43:36.138000', '2023-06-03 20:43:36.138000', NULL, NULL),
(79, 'plugin::content-manager.explorer.publish', 'api::category.category', '{}', '[]', '2023-06-03 20:43:36.142000', '2023-06-03 20:43:36.142000', NULL, NULL),
(83, 'plugin::content-manager.explorer.delete', 'api::sub-category.sub-category', '{}', '[]', '2023-06-03 20:43:57.059000', '2023-06-03 20:43:57.059000', NULL, NULL),
(84, 'plugin::content-manager.explorer.publish', 'api::sub-category.sub-category', '{}', '[]', '2023-06-03 20:43:57.064000', '2023-06-03 20:43:57.064000', NULL, NULL),
(94, 'plugin::content-manager.explorer.create', 'api::category.category', '{\"fields\":[\"title\",\"desc\",\"img\",\"products\",\"sub_categories\"]}', '[]', '2023-06-03 20:47:09.732000', '2023-06-03 20:47:09.732000', NULL, NULL),
(95, 'plugin::content-manager.explorer.create', 'api::sub-category.sub-category', '{\"fields\":[\"title\",\"products\",\"categories\"]}', '[]', '2023-06-03 20:47:09.739000', '2023-06-03 20:47:09.739000', NULL, NULL),
(96, 'plugin::content-manager.explorer.read', 'api::category.category', '{\"fields\":[\"title\",\"desc\",\"img\",\"products\",\"sub_categories\"]}', '[]', '2023-06-03 20:47:09.745000', '2023-06-03 20:47:09.745000', NULL, NULL),
(97, 'plugin::content-manager.explorer.read', 'api::sub-category.sub-category', '{\"fields\":[\"title\",\"products\",\"categories\"]}', '[]', '2023-06-03 20:47:09.749000', '2023-06-03 20:47:09.749000', NULL, NULL),
(98, 'plugin::content-manager.explorer.update', 'api::category.category', '{\"fields\":[\"title\",\"desc\",\"img\",\"products\",\"sub_categories\"]}', '[]', '2023-06-03 20:47:09.756000', '2023-06-03 20:47:09.756000', NULL, NULL),
(99, 'plugin::content-manager.explorer.update', 'api::sub-category.sub-category', '{\"fields\":[\"title\",\"products\",\"categories\"]}', '[]', '2023-06-03 20:47:09.761000', '2023-06-03 20:47:09.761000', NULL, NULL),
(100, 'plugin::content-manager.explorer.create', 'api::product.product', '{\"fields\":[\"title\",\"desc\",\"img\",\"img2\",\"price\",\"isNew\",\"categories\",\"sub_categories\",\"type\"]}', '[]', '2023-06-03 20:55:32.558000', '2023-06-03 20:55:32.558000', NULL, NULL),
(101, 'plugin::content-manager.explorer.read', 'api::product.product', '{\"fields\":[\"title\",\"desc\",\"img\",\"img2\",\"price\",\"isNew\",\"categories\",\"sub_categories\",\"type\"]}', '[]', '2023-06-03 20:55:32.565000', '2023-06-03 20:55:32.565000', NULL, NULL),
(102, 'plugin::content-manager.explorer.update', 'api::product.product', '{\"fields\":[\"title\",\"desc\",\"img\",\"img2\",\"price\",\"isNew\",\"categories\",\"sub_categories\",\"type\"]}', '[]', '2023-06-03 20:55:32.574000', '2023-06-03 20:55:32.574000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions_role_links`
--

CREATE TABLE `admin_permissions_role_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_permissions_role_links`
--

INSERT INTO `admin_permissions_role_links` (`id`, `permission_id`, `role_id`, `permission_order`) VALUES
(1, 1, 2, 1),
(2, 2, 2, 2),
(3, 3, 2, 3),
(4, 4, 2, 4),
(5, 5, 2, 5),
(6, 6, 2, 6),
(7, 7, 3, 1),
(8, 8, 3, 2),
(9, 9, 3, 3),
(10, 10, 3, 4),
(11, 11, 3, 5),
(12, 12, 3, 6),
(13, 13, 1, 1),
(14, 14, 1, 2),
(15, 15, 1, 3),
(16, 16, 1, 4),
(17, 17, 1, 5),
(18, 18, 1, 6),
(19, 19, 1, 7),
(20, 20, 1, 8),
(21, 21, 1, 9),
(22, 22, 1, 10),
(23, 23, 1, 11),
(24, 24, 1, 12),
(25, 25, 1, 13),
(26, 26, 1, 14),
(27, 27, 1, 15),
(28, 28, 1, 16),
(29, 29, 1, 17),
(30, 30, 1, 18),
(31, 31, 1, 19),
(32, 32, 1, 20),
(33, 33, 1, 21),
(34, 34, 1, 22),
(35, 35, 1, 23),
(36, 36, 1, 24),
(37, 37, 1, 25),
(38, 38, 1, 26),
(39, 39, 1, 27),
(40, 40, 1, 28),
(41, 41, 1, 29),
(42, 42, 1, 30),
(43, 43, 1, 31),
(44, 44, 1, 32),
(45, 45, 1, 33),
(46, 46, 1, 34),
(47, 47, 1, 35),
(48, 48, 1, 36),
(49, 49, 1, 37),
(50, 50, 1, 38),
(51, 51, 1, 39),
(52, 52, 1, 40),
(53, 53, 1, 41),
(54, 54, 1, 42),
(55, 55, 1, 43),
(56, 56, 1, 44),
(57, 57, 1, 45),
(58, 58, 1, 46),
(59, 59, 1, 47),
(60, 60, 1, 48),
(61, 61, 1, 49),
(62, 62, 1, 50),
(63, 63, 1, 51),
(64, 64, 1, 52),
(65, 65, 1, 53),
(66, 66, 1, 54),
(67, 67, 1, 55),
(68, 68, 1, 56),
(69, 69, 1, 57),
(73, 73, 1, 61),
(74, 74, 1, 62),
(78, 78, 1, 66),
(79, 79, 1, 67),
(83, 83, 1, 71),
(84, 84, 1, 72),
(94, 94, 1, 79),
(95, 95, 1, 80),
(96, 96, 1, 81),
(97, 97, 1, 82),
(98, 98, 1, 83),
(99, 99, 1, 84),
(100, 100, 1, 85),
(101, 101, 1, 86),
(102, 102, 1, 87);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2023-06-03 20:39:37.800000', '2023-06-03 20:39:37.800000', NULL, NULL),
(2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2023-06-03 20:39:37.810000', '2023-06-03 20:39:37.810000', NULL, NULL),
(3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2023-06-03 20:39:37.815000', '2023-06-03 20:39:37.815000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `reset_password_token`, `registration_token`, `is_active`, `blocked`, `prefered_language`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'Oktay', 'Shakirov', NULL, 'oktayshakirov@gmail.com', '$2a$10$updo6hko9Rns1fs6Soa44eM8Jf.L1OcNc9lG9tZK5App3Z6.HBmq2', NULL, NULL, 1, 0, NULL, '2023-06-03 20:39:54.407000', '2023-06-03 20:39:54.407000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users_roles_links`
--

CREATE TABLE `admin_users_roles_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `role_order` double UNSIGNED DEFAULT NULL,
  `user_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users_roles_links`
--

INSERT INTO `admin_users_roles_links` (`id`, `user_id`, `role_id`, `role_order`, `user_order`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `desc`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`) VALUES
(3, 'Men', 'Men\'s Watches', '2023-06-05 11:00:12.275000', '2023-06-07 16:39:15.584000', '2023-06-05 11:00:13.391000', 1, 1),
(4, 'Women', 'Women\'s Watches', '2023-06-05 11:02:23.962000', '2023-06-07 16:39:21.265000', '2023-06-05 11:02:24.833000', 1, 1),
(5, 'Kids', 'Kids Watches', '2023-06-07 16:40:05.911000', '2023-06-07 16:40:06.852000', '2023-06-07 16:40:06.848000', 1, 1),
(6, 'Smart', 'Smart Watches', '2023-06-07 16:40:19.681000', '2023-06-07 16:44:28.187000', '2023-06-07 16:40:52.008000', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formats`)),
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`provider_metadata`)),
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `alternative_text`, `caption`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `preview_url`, `provider`, `provider_metadata`, `folder_path`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(40, 'adidas_sport.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_adidas_sport.jpg\",\"hash\":\"thumbnail_adidas_sport_904b040fc3\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":3.19,\"url\":\"/uploads/thumbnail_adidas_sport_904b040fc3.jpg\"}}', 'adidas_sport_904b040fc3', '.jpg', 'image/jpeg', '31.31', '/uploads/adidas_sport_904b040fc3.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.078000', '2023-06-08 21:31:40.078000', 1, 1),
(41, 'adidas_sport2.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_adidas_sport2.jpg\",\"hash\":\"thumbnail_adidas_sport2_41ddf92038\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":2.38,\"url\":\"/uploads/thumbnail_adidas_sport2_41ddf92038.jpg\"}}', 'adidas_sport2_41ddf92038', '.jpg', 'image/jpeg', '21.74', '/uploads/adidas_sport2_41ddf92038.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.083000', '2023-06-08 21:31:40.083000', 1, 1),
(42, 'versace_versus_men.jpg', NULL, NULL, 562, 707, '{\"thumbnail\":{\"name\":\"thumbnail_versace_versus_men.jpg\",\"hash\":\"thumbnail_versace_versus_men_f57a0a4ed2\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":124,\"height\":156,\"size\":3.98,\"url\":\"/uploads/thumbnail_versace_versus_men_f57a0a4ed2.jpg\"}}', 'versace_versus_men_f57a0a4ed2', '.jpg', 'image/jpeg', '34.51', '/uploads/versace_versus_men_f57a0a4ed2.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.083000', '2023-06-09 14:39:26.558000', 1, 1),
(43, 'versace_versus_men2.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_versace_versus_men2.jpg\",\"hash\":\"thumbnail_versace_versus_men2_f8ec4f1e4f\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":2.78,\"url\":\"/uploads/thumbnail_versace_versus_men2_f8ec4f1e4f.jpg\"}}', 'versace_versus_men2_f8ec4f1e4f', '.jpg', 'image/jpeg', '27.59', '/uploads/versace_versus_men2_f8ec4f1e4f.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.116000', '2023-06-08 21:31:40.116000', 1, 1),
(44, 'adidas_women.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_adidas_women.png\",\"hash\":\"thumbnail_adidas_women_376fe264aa\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":2.51,\"url\":\"/uploads/thumbnail_adidas_women_376fe264aa.png\"}}', 'adidas_women_376fe264aa', '.png', 'image/png', '25.39', '/uploads/adidas_women_376fe264aa.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.307000', '2023-06-08 21:31:40.307000', 1, 1),
(45, 'adidas_women2.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_adidas_women2.png\",\"hash\":\"thumbnail_adidas_women2_5d17de74ce\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":2.35,\"url\":\"/uploads/thumbnail_adidas_women2_5d17de74ce.png\"}}', 'adidas_women2_5d17de74ce', '.png', 'image/png', '25.94', '/uploads/adidas_women2_5d17de74ce.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.412000', '2023-06-08 21:31:40.412000', 1, 1),
(47, 'armani_exchange_men.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_armani_exchange_men.jpg\",\"hash\":\"thumbnail_armani_exchange_men_43f1070fa0\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":3.24,\"url\":\"/uploads/thumbnail_armani_exchange_men_43f1070fa0.jpg\"}}', 'armani_exchange_men_43f1070fa0', '.jpg', 'image/jpeg', '128.89', '/uploads/armani_exchange_men_43f1070fa0.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.581000', '2023-06-08 21:31:40.581000', 1, 1),
(48, 'apple_watch_women_se.png', NULL, NULL, 677, 740, '{\"thumbnail\":{\"name\":\"thumbnail_apple_watch_women_se.png\",\"hash\":\"thumbnail_apple_watch_women_se_6b4d0ca743\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":143,\"height\":156,\"size\":21.99,\"url\":\"/uploads/thumbnail_apple_watch_women_se_6b4d0ca743.png\"}}', 'apple_watch_women_se_6b4d0ca743', '.png', 'image/png', '75.58', '/uploads/apple_watch_women_se_6b4d0ca743.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.575000', '2023-06-08 21:31:40.575000', 1, 1),
(49, 'armani_exchange_men2.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_armani_exchange_men2.jpg\",\"hash\":\"thumbnail_armani_exchange_men2_9d81606f36\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.65,\"url\":\"/uploads/thumbnail_armani_exchange_men2_9d81606f36.jpg\"}}', 'armani_exchange_men2_9d81606f36', '.jpg', 'image/jpeg', '101.55', '/uploads/armani_exchange_men2_9d81606f36.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.699000', '2023-06-08 21:31:40.699000', 1, 1),
(50, 'armani_women.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_armani_women.jpg\",\"hash\":\"thumbnail_armani_women_a8200279c7\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":3.82,\"url\":\"/uploads/thumbnail_armani_women_a8200279c7.jpg\"}}', 'armani_women_a8200279c7', '.jpg', 'image/jpeg', '49.85', '/uploads/armani_women_a8200279c7.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.711000', '2023-06-08 21:31:40.711000', 1, 1),
(51, 'armani_women2.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_armani_women2.jpg\",\"hash\":\"thumbnail_armani_women2_d1135f0917\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":4.19,\"url\":\"/uploads/thumbnail_armani_women2_d1135f0917.jpg\"}}', 'armani_women2_d1135f0917', '.jpg', 'image/jpeg', '57.73', '/uploads/armani_women2_d1135f0917.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.780000', '2023-06-08 21:31:40.780000', 1, 1),
(52, 'disney2.jpg', NULL, NULL, 333, 500, '{\"thumbnail\":{\"name\":\"thumbnail_disney2.jpg\",\"hash\":\"thumbnail_disney2_3034a003f9\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":104,\"height\":156,\"size\":4.41,\"url\":\"/uploads/thumbnail_disney2_3034a003f9.jpg\"}}', 'disney2_3034a003f9', '.jpg', 'image/jpeg', '29.50', '/uploads/disney2_3034a003f9.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.849000', '2023-06-08 21:31:40.849000', 1, 1),
(53, 'disney.jpg', NULL, NULL, 333, 500, '{\"thumbnail\":{\"name\":\"thumbnail_disney.jpg\",\"hash\":\"thumbnail_disney_5043cc4870\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":104,\"height\":156,\"size\":3.59,\"url\":\"/uploads/thumbnail_disney_5043cc4870.jpg\"}}', 'disney_5043cc4870', '.jpg', 'image/jpeg', '23.20', '/uploads/disney_5043cc4870.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:40.868000', '2023-06-08 21:31:40.868000', 1, 1),
(54, 'fossil_bannon_men.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_fossil_bannon_men.jpg\",\"hash\":\"thumbnail_fossil_bannon_men_6510686d0c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":3.32,\"url\":\"/uploads/thumbnail_fossil_bannon_men_6510686d0c.jpg\"}}', 'fossil_bannon_men_6510686d0c', '.jpg', 'image/jpeg', '98.69', '/uploads/fossil_bannon_men_6510686d0c.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.086000', '2023-06-08 21:31:41.086000', 1, 1),
(55, 'fossil_bannon_men2.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_fossil_bannon_men2.jpg\",\"hash\":\"thumbnail_fossil_bannon_men2_c0cda9a497\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.46,\"url\":\"/uploads/thumbnail_fossil_bannon_men2_c0cda9a497.jpg\"}}', 'fossil_bannon_men2_c0cda9a497', '.jpg', 'image/jpeg', '57.69', '/uploads/fossil_bannon_men2_c0cda9a497.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.088000', '2023-06-08 21:31:41.088000', 1, 1),
(56, 'fossil_gen_6_smart_men.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_fossil_gen_6_smart_men.jpg\",\"hash\":\"thumbnail_fossil_gen_6_smart_men_581f6fed40\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.96,\"url\":\"/uploads/thumbnail_fossil_gen_6_smart_men_581f6fed40.jpg\"}}', 'fossil_gen_6_smart_men_581f6fed40', '.jpg', 'image/jpeg', '69.86', '/uploads/fossil_gen_6_smart_men_581f6fed40.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.174000', '2023-06-08 21:31:41.174000', 1, 1),
(57, 'fossil_gen_6_smart_men2.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_fossil_gen_6_smart_men2.jpg\",\"hash\":\"thumbnail_fossil_gen_6_smart_men2_583a623280\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.85,\"url\":\"/uploads/thumbnail_fossil_gen_6_smart_men2_583a623280.jpg\"}}', 'fossil_gen_6_smart_men2_583a623280', '.jpg', 'image/jpeg', '62.79', '/uploads/fossil_gen_6_smart_men2_583a623280.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.215000', '2023-06-08 21:31:41.215000', 1, 1),
(58, 'fossil_gen_6_smart_women.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_fossil_gen_6_smart_women.jpg\",\"hash\":\"thumbnail_fossil_gen_6_smart_women_2ed73ae277\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.95,\"url\":\"/uploads/thumbnail_fossil_gen_6_smart_women_2ed73ae277.jpg\"}}', 'fossil_gen_6_smart_women_2ed73ae277', '.jpg', 'image/jpeg', '70.69', '/uploads/fossil_gen_6_smart_women_2ed73ae277.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.275000', '2023-06-08 21:31:41.275000', 1, 1),
(59, 'fossil_gen_6_smart_women2.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_fossil_gen_6_smart_women2.jpg\",\"hash\":\"thumbnail_fossil_gen_6_smart_women2_8fe34f4879\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.9,\"url\":\"/uploads/thumbnail_fossil_gen_6_smart_women2_8fe34f4879.jpg\"}}', 'fossil_gen_6_smart_women2_8fe34f4879', '.jpg', 'image/jpeg', '67.14', '/uploads/fossil_gen_6_smart_women2_8fe34f4879.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.305000', '2023-06-08 21:31:41.305000', 1, 1),
(60, 'apple_watch7.png', NULL, NULL, 1800, 1800, '{\"thumbnail\":{\"name\":\"thumbnail_apple_watch7.png\",\"hash\":\"thumbnail_apple_watch7_11aca1ff25\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":1.73,\"url\":\"/uploads/thumbnail_apple_watch7_11aca1ff25.png\"}}', 'apple_watch7_11aca1ff25', '.png', 'image/png', '38.96', '/uploads/apple_watch7_11aca1ff25.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.415000', '2023-06-08 21:31:41.415000', 1, 1),
(61, 'apple_watch7_2.png', NULL, NULL, 1800, 1800, '{\"thumbnail\":{\"name\":\"thumbnail_apple_watch7_2.png\",\"hash\":\"thumbnail_apple_watch7_2_1f901bc9f5\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":2.42,\"url\":\"/uploads/thumbnail_apple_watch7_2_1f901bc9f5.png\"}}', 'apple_watch7_2_1f901bc9f5', '.png', 'image/png', '52.81', '/uploads/apple_watch7_2_1f901bc9f5.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.501000', '2023-06-08 21:31:41.501000', 1, 1),
(62, 'head2.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_head2.png\",\"hash\":\"thumbnail_head2_c3ae5c0933\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":1.47,\"url\":\"/uploads/thumbnail_head2_c3ae5c0933.png\"}}', 'head2_c3ae5c0933', '.png', 'image/png', '11.72', '/uploads/head2_c3ae5c0933.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.625000', '2023-06-08 21:31:41.625000', 1, 1),
(63, 'head.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_head.png\",\"hash\":\"thumbnail_head_2911c8bf56\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":2.73,\"url\":\"/uploads/thumbnail_head_2911c8bf56.png\"}}', 'head_2911c8bf56', '.png', 'image/png', '27.21', '/uploads/head_2911c8bf56.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.626000', '2023-06-08 21:31:41.626000', 1, 1),
(64, 'lacoste_kids.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_lacoste_kids.png\",\"hash\":\"thumbnail_lacoste_kids_1137b83ff7\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":2.14,\"url\":\"/uploads/thumbnail_lacoste_kids_1137b83ff7.png\"}}', 'lacoste_kids_1137b83ff7', '.png', 'image/png', '20.28', '/uploads/lacoste_kids_1137b83ff7.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.646000', '2023-06-08 21:31:41.646000', 1, 1),
(65, 'michael_kors_lexington_men.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_michael_kors_lexington_men.jpg\",\"hash\":\"thumbnail_michael_kors_lexington_men_0197ea8b23\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.82,\"url\":\"/uploads/thumbnail_michael_kors_lexington_men_0197ea8b23.jpg\"}}', 'michael_kors_lexington_men_0197ea8b23', '.jpg', 'image/jpeg', '76.74', '/uploads/michael_kors_lexington_men_0197ea8b23.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.648000', '2023-06-08 21:31:41.648000', 1, 1),
(66, 'lacoste_kids2.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_lacoste_kids2.png\",\"hash\":\"thumbnail_lacoste_kids2_501c4a1feb\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":1.11,\"url\":\"/uploads/thumbnail_lacoste_kids2_501c4a1feb.png\"}}', 'lacoste_kids2_501c4a1feb', '.png', 'image/png', '9.75', '/uploads/lacoste_kids2_501c4a1feb.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.733000', '2023-06-08 21:31:41.733000', 1, 1),
(67, 'michael_kors_lexington_men2.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_michael_kors_lexington_men2.jpg\",\"hash\":\"thumbnail_michael_kors_lexington_men2_863eb3c6ca\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.07,\"url\":\"/uploads/thumbnail_michael_kors_lexington_men2_863eb3c6ca.jpg\"}}', 'michael_kors_lexington_men2_863eb3c6ca', '.jpg', 'image/jpeg', '47.53', '/uploads/michael_kors_lexington_men2_863eb3c6ca.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.910000', '2023-06-08 21:31:41.910000', 1, 1),
(68, 'MK_liliane_women2.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_MK_liliane_women2.jpg\",\"hash\":\"thumbnail_MK_liliane_women2_702f969b03\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.31,\"url\":\"/uploads/thumbnail_MK_liliane_women2_702f969b03.jpg\"}}', 'MK_liliane_women2_702f969b03', '.jpg', 'image/jpeg', '44.94', '/uploads/MK_liliane_women2_702f969b03.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.990000', '2023-06-08 21:31:41.990000', 1, 1),
(69, 'MK_slim_runway_men.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_MK_slim_runway_men.jpg\",\"hash\":\"thumbnail_MK_slim_runway_men_928e00362b\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.62,\"url\":\"/uploads/thumbnail_MK_slim_runway_men_928e00362b.jpg\"}}', 'MK_slim_runway_men_928e00362b', '.jpg', 'image/jpeg', '89.91', '/uploads/MK_slim_runway_men_928e00362b.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.020000', '2023-06-08 21:31:42.020000', 1, 1),
(70, 'MK_liliane_women.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_MK_liliane_women.jpg\",\"hash\":\"thumbnail_MK_liliane_women_b5ad7ac948\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.85,\"url\":\"/uploads/thumbnail_MK_liliane_women_b5ad7ac948.jpg\"}}', 'MK_liliane_women_b5ad7ac948', '.jpg', 'image/jpeg', '88.46', '/uploads/MK_liliane_women_b5ad7ac948.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:41.992000', '2023-06-08 21:31:41.992000', 1, 1),
(71, 'mickey_mouse2.png', NULL, NULL, 705, 822, '{\"thumbnail\":{\"name\":\"thumbnail_mickey_mouse2.png\",\"hash\":\"thumbnail_mickey_mouse2_abfb839bed\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":134,\"height\":156,\"size\":12.93,\"url\":\"/uploads/thumbnail_mickey_mouse2_abfb839bed.png\"}}', 'mickey_mouse2_abfb839bed', '.png', 'image/png', '47.54', '/uploads/mickey_mouse2_abfb839bed.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.042000', '2023-06-08 21:31:42.042000', 1, 1),
(72, 'polo_men2.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_polo_men2.png\",\"hash\":\"thumbnail_polo_men2_634f503ce5\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":3.95,\"url\":\"/uploads/thumbnail_polo_men2_634f503ce5.png\"}}', 'polo_men2_634f503ce5', '.png', 'image/png', '35.10', '/uploads/polo_men2_634f503ce5.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.186000', '2023-06-08 21:31:42.186000', 1, 1),
(73, 'MK_slim_runway_men2.jpg', NULL, NULL, 1000, 1160, '{\"thumbnail\":{\"name\":\"thumbnail_MK_slim_runway_men2.jpg\",\"hash\":\"thumbnail_MK_slim_runway_men2_27ea205f69\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":134,\"height\":156,\"size\":2.65,\"url\":\"/uploads/thumbnail_MK_slim_runway_men2_27ea205f69.jpg\"}}', 'MK_slim_runway_men2_27ea205f69', '.jpg', 'image/jpeg', '100.67', '/uploads/MK_slim_runway_men2_27ea205f69.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.189000', '2023-06-08 21:31:42.189000', 1, 1),
(74, 'mickey_mouse.png', NULL, NULL, 666, 773, '{\"thumbnail\":{\"name\":\"thumbnail_mickey_mouse.png\",\"hash\":\"thumbnail_mickey_mouse_1504cfa36d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":134,\"height\":156,\"size\":24.17,\"url\":\"/uploads/thumbnail_mickey_mouse_1504cfa36d.png\"}}', 'mickey_mouse_1504cfa36d', '.png', 'image/png', '100.26', '/uploads/mickey_mouse_1504cfa36d.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.189000', '2023-06-08 21:31:42.189000', 1, 1),
(75, 'Polo_men.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_Polo_men.png\",\"hash\":\"thumbnail_Polo_men_b88ee3a0bf\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":2.29,\"url\":\"/uploads/thumbnail_Polo_men_b88ee3a0bf.png\"}}', 'Polo_men_b88ee3a0bf', '.png', 'image/png', '20.59', '/uploads/Polo_men_b88ee3a0bf.png', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.412000', '2023-06-08 21:31:42.412000', 1, 1),
(76, 'swis_male.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_swis_male.jpg\",\"hash\":\"thumbnail_swis_male_00a341718c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":3.7,\"url\":\"/uploads/thumbnail_swis_male_00a341718c.jpg\"}}', 'swis_male_00a341718c', '.jpg', 'image/jpeg', '43.18', '/uploads/swis_male_00a341718c.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.424000', '2023-06-08 21:31:42.424000', 1, 1),
(77, 'swis_male2.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_swis_male2.jpg\",\"hash\":\"thumbnail_swis_male2_8a52a8838c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":4.05,\"url\":\"/uploads/thumbnail_swis_male2_8a52a8838c.jpg\"}}', 'swis_male2_8a52a8838c', '.jpg', 'image/jpeg', '43.85', '/uploads/swis_male2_8a52a8838c.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.459000', '2023-06-08 21:31:42.459000', 1, 1),
(78, 'tommy_hilfiger_women.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_tommy_hilfiger_women.jpg\",\"hash\":\"thumbnail_tommy_hilfiger_women_784bd59a22\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":3.43,\"url\":\"/uploads/thumbnail_tommy_hilfiger_women_784bd59a22.jpg\"}}', 'tommy_hilfiger_women_784bd59a22', '.jpg', 'image/jpeg', '43.97', '/uploads/tommy_hilfiger_women_784bd59a22.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.533000', '2023-06-08 21:31:42.533000', 1, 1),
(79, 'tommy_hilfiger_women2.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_tommy_hilfiger_women2.jpg\",\"hash\":\"thumbnail_tommy_hilfiger_women2_9438939a7d\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":4.83,\"url\":\"/uploads/thumbnail_tommy_hilfiger_women2_9438939a7d.jpg\"}}', 'tommy_hilfiger_women2_9438939a7d', '.jpg', 'image/jpeg', '67.64', '/uploads/tommy_hilfiger_women2_9438939a7d.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:31:42.600000', '2023-06-08 21:31:42.600000', 1, 1),
(80, 'mkuu3_vw_pf_watch-44-alum-gold-nc-se_vw_pf_wf_co_geo_ae.jpg', NULL, NULL, 700, 700, '{\"thumbnail\":{\"name\":\"thumbnail_mkuu3_vw_pf_watch-44-alum-gold-nc-se_vw_pf_wf_co_geo_ae.jpg\",\"hash\":\"thumbnail_mkuu3_vw_pf_watch_44_alum_gold_nc_se_vw_pf_wf_co_geo_ae_9192e60e78\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":4.19,\"url\":\"/uploads/thumbnail_mkuu3_vw_pf_watch_44_alum_gold_nc_se_vw_pf_wf_co_geo_ae_9192e60e78.jpg\"}}', 'mkuu3_vw_pf_watch_44_alum_gold_nc_se_vw_pf_wf_co_geo_ae_9192e60e78', '.jpg', 'image/jpeg', '37.85', '/uploads/mkuu3_vw_pf_watch_44_alum_gold_nc_se_vw_pf_wf_co_geo_ae_9192e60e78.jpg', NULL, 'local', NULL, '/', '2023-06-08 21:34:49.147000', '2023-06-08 21:34:49.147000', 1, 1),
(82, 'gshock_gold2.png', NULL, NULL, 730, 811, '{\"thumbnail\":{\"name\":\"thumbnail_gshock_gold2.png\",\"hash\":\"thumbnail_gshock_gold2_0c2c0d7a6e\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":140,\"height\":156,\"size\":31.46,\"url\":\"/uploads/thumbnail_gshock_gold2_0c2c0d7a6e.png\"}}', 'gshock_gold2_0c2c0d7a6e', '.png', 'image/png', '172.34', '/uploads/gshock_gold2_0c2c0d7a6e.png', NULL, 'local', NULL, '/', '2023-06-12 19:51:23.785000', '2023-06-12 20:55:53.259000', 1, 1),
(83, 'gshock_gold.png', NULL, NULL, 1457, 1457, '{\"thumbnail\":{\"name\":\"thumbnail_gshock_gold.png\",\"hash\":\"thumbnail_gshock_gold_331d165b63\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.11,\"url\":\"/uploads/thumbnail_gshock_gold_331d165b63.png\"}}', 'gshock_gold_331d165b63', '.png', 'image/png', '247.23', '/uploads/gshock_gold_331d165b63.png', NULL, 'local', NULL, '/', '2023-06-12 19:52:34.384000', '2023-06-12 19:52:34.384000', 1, 1),
(84, 'kiddus2.png', NULL, NULL, 427, 694, '{\"thumbnail\":{\"name\":\"thumbnail_kiddus2.png\",\"hash\":\"thumbnail_kiddus2_d728cacef1\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":96,\"height\":156,\"size\":5.46,\"url\":\"/uploads/thumbnail_kiddus2_d728cacef1.png\"}}', 'kiddus2_d728cacef1', '.png', 'image/png', '18.97', '/uploads/kiddus2_d728cacef1.png', NULL, 'local', NULL, '/', '2023-06-12 19:59:09.331000', '2023-06-12 19:59:09.331000', 1, 1),
(85, 'kiddus.png', NULL, NULL, 486, 664, '{\"thumbnail\":{\"name\":\"thumbnail_kiddus.png\",\"hash\":\"thumbnail_kiddus_143cacff4b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":114,\"height\":156,\"size\":19.11,\"url\":\"/uploads/thumbnail_kiddus_143cacff4b.png\"}}', 'kiddus_143cacff4b', '.png', 'image/png', '65.80', '/uploads/kiddus_143cacff4b.png', NULL, 'local', NULL, '/', '2023-06-12 19:59:09.661000', '2023-06-12 19:59:09.661000', 1, 1),
(86, 'MarcLauder.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_MarcLauder.jpg\",\"hash\":\"thumbnail_Marc_Lauder_f2aeaa5196\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":3.45,\"url\":\"/uploads/thumbnail_Marc_Lauder_f2aeaa5196.jpg\"}}', 'Marc_Lauder_f2aeaa5196', '.jpg', 'image/jpeg', '55.67', '/uploads/Marc_Lauder_f2aeaa5196.jpg', NULL, 'local', NULL, '/', '2023-06-12 20:06:38.777000', '2023-06-12 20:06:38.777000', 1, 1),
(87, 'MarcLauder2.jpg', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_MarcLauder2.jpg\",\"hash\":\"thumbnail_Marc_Lauder2_7ec0242f4e\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":128,\"height\":156,\"size\":3.72,\"url\":\"/uploads/thumbnail_Marc_Lauder2_7ec0242f4e.jpg\"}}', 'Marc_Lauder2_7ec0242f4e', '.jpg', 'image/jpeg', '38.59', '/uploads/Marc_Lauder2_7ec0242f4e.jpg', NULL, 'local', NULL, '/', '2023-06-12 20:06:38.948000', '2023-06-12 20:06:38.948000', 1, 1),
(88, 'boss_orange2.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_boss_orange2.png\",\"hash\":\"thumbnail_boss_orange2_0d96b832f3\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":3.89,\"url\":\"/uploads/thumbnail_boss_orange2_0d96b832f3.png\"}}', 'boss_orange2_0d96b832f3', '.png', 'image/png', '42.90', '/uploads/boss_orange2_0d96b832f3.png', NULL, 'local', NULL, '/', '2023-06-12 20:13:50.405000', '2023-06-12 20:13:50.405000', 1, 1),
(89, 'boss_orange.png', NULL, NULL, 620, 757, '{\"thumbnail\":{\"name\":\"thumbnail_boss_orange.png\",\"hash\":\"thumbnail_boss_orange_278d2db8ae\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":128,\"height\":156,\"size\":3.27,\"url\":\"/uploads/thumbnail_boss_orange_278d2db8ae.png\"}}', 'boss_orange_278d2db8ae', '.png', 'image/png', '35.72', '/uploads/boss_orange_278d2db8ae.png', NULL, 'local', NULL, '/', '2023-06-12 20:13:50.689000', '2023-06-12 20:13:50.689000', 1, 1),
(98, 'samsung.jpg', NULL, NULL, 1212, 1489, '{\"thumbnail\":{\"name\":\"thumbnail_samsung.jpg\",\"hash\":\"thumbnail_samsung_349571c6fb\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":127,\"height\":156,\"size\":4.38,\"url\":\"/uploads/thumbnail_samsung_349571c6fb.jpg\"}}', 'samsung_349571c6fb', '.jpg', 'image/jpeg', '81.24', '/uploads/samsung_349571c6fb.jpg', NULL, 'local', NULL, '/', '2023-06-12 20:28:58.387000', '2023-06-12 20:28:58.387000', 1, 1),
(99, 'samsung3.jpg', NULL, NULL, 1212, 1489, '{\"thumbnail\":{\"name\":\"thumbnail_samsung3.jpg\",\"hash\":\"thumbnail_samsung3_770792e163\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":127,\"height\":156,\"size\":3.96,\"url\":\"/uploads/thumbnail_samsung3_770792e163.jpg\"}}', 'samsung3_770792e163', '.jpg', 'image/jpeg', '89.55', '/uploads/samsung3_770792e163.jpg', NULL, 'local', NULL, '/', '2023-06-12 20:30:39.601000', '2023-06-12 20:30:39.601000', 1, 1),
(100, 'tsar_bomb2.jpg', NULL, NULL, 679, 716, '{\"thumbnail\":{\"name\":\"thumbnail_tsar_bomb2.jpg\",\"hash\":\"thumbnail_tsar_bomb2_05f016bbeb\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":148,\"height\":156,\"size\":3.79,\"url\":\"/uploads/thumbnail_tsar_bomb2_05f016bbeb.jpg\"}}', 'tsar_bomb2_05f016bbeb', '.jpg', 'image/jpeg', '40.33', '/uploads/tsar_bomb2_05f016bbeb.jpg', NULL, 'local', NULL, '/', '2023-06-12 20:34:15.311000', '2023-06-12 20:34:15.311000', 1, 1),
(102, 'tsar_bomb.jpg', NULL, NULL, 679, 716, '{\"thumbnail\":{\"name\":\"thumbnail_tsar_bomb.jpg\",\"hash\":\"thumbnail_tsar_bomb_7588e4887d\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":148,\"height\":156,\"size\":5.01,\"url\":\"/uploads/thumbnail_tsar_bomb_7588e4887d.jpg\"}}', 'tsar_bomb_7588e4887d', '.jpg', 'image/jpeg', '72.93', '/uploads/tsar_bomb_7588e4887d.jpg', NULL, 'local', NULL, '/', '2023-06-12 20:35:48.270000', '2023-06-12 20:35:48.270000', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `files_folder_links`
--

CREATE TABLE `files_folder_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `folder_id` int(10) UNSIGNED DEFAULT NULL,
  `file_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files_related_morphs`
--

CREATE TABLE `files_related_morphs` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `related_id` int(10) UNSIGNED DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files_related_morphs`
--

INSERT INTO `files_related_morphs` (`id`, `file_id`, `related_id`, `related_type`, `field`, `order`) VALUES
(63, 80, 20, 'api::product.product', 'img', 1),
(64, 48, 20, 'api::product.product', 'img2', 1),
(65, 42, 21, 'api::product.product', 'img', 1),
(66, 43, 21, 'api::product.product', 'img2', 1),
(69, 78, 23, 'api::product.product', 'img', 1),
(70, 79, 23, 'api::product.product', 'img2', 1),
(73, 74, 24, 'api::product.product', 'img', 1),
(74, 71, 24, 'api::product.product', 'img2', 1),
(75, 40, 22, 'api::product.product', 'img', 1),
(76, 41, 22, 'api::product.product', 'img2', 1),
(83, 64, 27, 'api::product.product', 'img', 1),
(84, 66, 27, 'api::product.product', 'img2', 1),
(101, 58, 31, 'api::product.product', 'img', 1),
(102, 59, 31, 'api::product.product', 'img2', 1),
(103, 75, 32, 'api::product.product', 'img', 1),
(104, 72, 32, 'api::product.product', 'img2', 1),
(105, 53, 33, 'api::product.product', 'img', 1),
(106, 52, 33, 'api::product.product', 'img2', 1),
(111, 65, 35, 'api::product.product', 'img', 1),
(112, 67, 35, 'api::product.product', 'img2', 1),
(115, 45, 36, 'api::product.product', 'img', 1),
(116, 44, 36, 'api::product.product', 'img2', 1),
(117, 54, 37, 'api::product.product', 'img', 1),
(118, 55, 37, 'api::product.product', 'img2', 1),
(119, 63, 38, 'api::product.product', 'img', 1),
(120, 62, 38, 'api::product.product', 'img2', 1),
(133, 69, 29, 'api::product.product', 'img', 1),
(134, 73, 29, 'api::product.product', 'img2', 1),
(141, 47, 34, 'api::product.product', 'img', 1),
(142, 49, 34, 'api::product.product', 'img2', 1),
(143, 76, 28, 'api::product.product', 'img', 1),
(144, 77, 28, 'api::product.product', 'img2', 1),
(145, 70, 25, 'api::product.product', 'img', 1),
(146, 68, 25, 'api::product.product', 'img2', 1),
(147, 85, 41, 'api::product.product', 'img', 1),
(148, 84, 41, 'api::product.product', 'img2', 1),
(149, 86, 42, 'api::product.product', 'img', 1),
(150, 87, 42, 'api::product.product', 'img2', 1),
(153, 56, 30, 'api::product.product', 'img', 1),
(154, 57, 30, 'api::product.product', 'img2', 1),
(155, 89, 43, 'api::product.product', 'img', 1),
(156, 88, 43, 'api::product.product', 'img2', 1),
(157, 60, 26, 'api::product.product', 'img', 1),
(158, 61, 26, 'api::product.product', 'img2', 1),
(175, 50, 39, 'api::product.product', 'img', 1),
(176, 51, 39, 'api::product.product', 'img2', 1),
(179, 99, 44, 'api::product.product', 'img', 1),
(180, 98, 44, 'api::product.product', 'img2', 1),
(183, 102, 45, 'api::product.product', 'img', 1),
(184, 100, 45, 'api::product.product', 'img2', 1),
(185, 83, 40, 'api::product.product', 'img', 1),
(186, 82, 40, 'api::product.product', 'img2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `i18n_locale`
--

CREATE TABLE `i18n_locale` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `i18n_locale`
--

INSERT INTO `i18n_locale` (`id`, `name`, `code`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'English (en)', 'en', '2023-06-03 20:39:37.754000', '2023-06-03 20:39:37.754000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` longtext DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `desc`, `price`, `is_new`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `type`) VALUES
(20, 'Apple Watch SE Gold', 'The Apple Watch SE Gold is a versatile smartwatch that combines style and functionality. It features a gold aluminum finish that adds a touch of elegance to your wrist. The watch is equipped with a Retina LTPO OLED display, offering a bright and clear view of your data and apps.\n\nThe Apple Watch SE Gold is powered by the S5 SiP with a 64-bit dual-core processor, ensuring smooth performance and quick response times. It comes with a capacity of 32GB, providing ample space for your apps and data.\n\nThe watch includes a range of health and fitness features, such as a second-generation optical heart sensor, an always-on altimeter, and emergency SOS. It\'s also water-resistant up to 50 meters, making it suitable for shallow-water activities like swimming in a pool or ocean.\n\nThe Apple Watch SE Gold supports both GPS and cellular connectivity, allowing you to stay connected even without your iPhone nearby. It also supports Apple Pay and GymKit, offering convenience for your workouts and payments.\n\nThe watch comes with a built-in rechargeable lithium-ion battery that offers up to 18 hours of use, ensuring it can keep up with your busy lifestyle. It charges via a USB-C magnetic charging cable.', '299.99', 0, '2023-06-08 21:37:42.688000', '2023-06-08 21:41:35.859000', '2023-06-08 21:37:43.703000', 1, 1, 'trending'),
(21, 'Versace Versus', 'The Versace Versus Black watch from the Domus Collection is a stylish and bold timepiece that embodies the spirit of Versace\'s Versus line. This watch features a large 44mm case diameter with an artistic watch face and prominent Versus Versace logo representation, making it a standout piece in any watch collection.\n\nThe watch comes with an adjustable black silicone strap, offering comfort and durability. The black dial and gunmetal details add to the sleek and modern aesthetic of the watch, making it a perfect accessory for both casual and formal occasions.\n\nThe Versace Versus Black watch is water-resistant up to 50 meters, making it capable of withstanding light splashes and brief immersion in water, though it is not suitable for swimming, diving, or prolonged water exposure.\n\nThe Domus Collection was created to match your watches with your everyday fashion, and the Versus Versace Black watch is no exception. It\'s packed in a solid branded giftable box, making it an ideal gift for watch enthusiasts.', '214.00', 0, '2023-06-08 21:44:58.872000', '2023-06-08 21:44:59.749000', '2023-06-08 21:44:59.745000', 1, 1, 'featured'),
(22, 'Adidas Digital Two ', 'The Adidas Digital Two watch is a modern and stylish timepiece that combines functionality with the iconic Adidas aesthetic. This watch features a digital dial with a light-up feature, ensuring visibility even in low-light conditions.\n\nThe watch is housed in a 36mm brushed gold-tone stainless steel case, adding a touch of elegance to the sporty design. The bracelet is also made of brushed gold-tone stainless steel, providing durability and a cohesive look. The Adidas logo is prominently displayed on the back case and buckle, showcasing the brand\'s identity.\n\nThe Digital Two watch comes with a range of functions, including hours, minutes, seconds, date, alarm, stopwatch, and countdown timer, making it a versatile accessory for everyday wear.\n\nThe watch is water-resistant up to 50 meters, making it suitable for light water activities but not for diving or snorkeling.', '77.89', 0, '2023-06-08 21:48:04.434000', '2023-06-08 21:56:48.024000', '2023-06-08 21:48:05.389000', 1, 1, 'normal'),
(23, 'Tommy Hilfiger', 'The Tommy Hilfiger Analog Gray Dial Women\'s Watch-TH1782263W is an elegant and timeless piece that embodies the brand\'s classic American cool style. This watch features a sophisticated gray dial housed in a durable stainless steel case. The silver stainless steel band adds a touch of class and ensures a comfortable fit. Powered by quartz movement, this watch offers precise timekeeping. With a water resistance depth of 30 meters, it can withstand splashes or brief immersion in water. This watch is a perfect blend of style and functionality, making it a great accessory for any occasion.', '107.89', 1, '2023-06-08 21:52:24.217000', '2023-06-08 21:52:25.184000', '2023-06-08 21:52:25.179000', 1, 1, 'trending'),
(24, 'Disney Mickey Mouse', 'The Disney Mickey Mouse Watch for Kids is a fun and educational accessory that your child will love. This watch features a vibrant design with Mickey Mouse characters that will delight any Disney fan.\n\nThe watch comes with a variety of kid-friendly features. It includes a selfie camera for taking pictures, a photo album viewer, a video player, a voice recorder, a calculator, an alarm clock, a pedometer step counter, various playable games, and changeable watch faces.\n\nDesigned with a red and black color scheme, this watch has a 40mm screen size and a square shape that\'s easy for kids to read. It\'s also compatible with smartphones, making it a versatile accessory for your child.\n\nThe watch is powered by a long-lasting rechargeable battery, eliminating the need for frequent battery replacements. It comes with a USB charging cable for your convenience.', '14.99', 0, '2023-06-08 21:55:49.279000', '2023-06-08 21:56:13.766000', '2023-06-08 21:55:50.980000', 1, 1, 'normal'),
(25, 'Michael Kors Liliane', 'The Michael Kors LILIANE SET is a luxurious and elegant accessory set that includes a watch and a bracelet. The watch features a three-hand movement housed in a 36mm rose gold-tone stainless steel case. The dial is a beautiful shade of pink, adding a touch of femininity to the piece.\n\nThe watch strap, made of stainless steel, is also in a rose gold tone, matching the case and creating a cohesive and stylish look. The strap is 16mm wide and closes with a bracelet deployant closure, ensuring a secure fit.\n\nThe set also includes a matching rose gold-tone stainless steel bracelet with a slider closure. This bracelet adds an extra touch of sophistication to the set, making it a perfect gift for someone special or a treat for yourself.\n\nThe watch is water-resistant up to 5 ATM, making it suitable for short periods of recreational swimming, but not diving or snorkeling.', '174.95', 0, '2023-06-08 21:59:15.064000', '2023-06-12 19:55:56.269000', '2023-06-08 21:59:16.345000', 1, 1, 'trending'),
(26, 'Apple Watch Series 7', 'The Apple Watch Series 7 is a cutting-edge smartwatch that combines style, functionality, and health-focused features. This watch features a larger Always-On Retina LTPO OLED display, offering a clear and bright view even under sunlight. It is powered by the S7 with a 64-bit dual-core processor, ensuring smooth performance and quick app launches.\n\nThe watch supports LTE and UMTS, Wi-Fi, and Bluetooth connectivity, allowing you to stay connected even without your iPhone nearby. It includes a range of health features such as a blood oxygen sensor, an electrical heart sensor (ECG app), and a third-generation optical heart sensor.\n\nWith a storage capacity of 32GB, you can store your favorite apps, music, podcasts, and more. The watch offers up to 18 hours of battery life and comes with a USB-C magnetic fast charging cable. It is water-resistant up to 50 meters, making it suitable for shallow-water activities like swimming.\n\nDesigned with environmental considerations, the watch is made with 100% recycled aluminum in the case and 100% recycled tungsten in the Taptic Engine. The Apple Watch Series 7 is a perfect blend of style, functionality, and health-focused features, making it a great accessory for any lifestyle.', '425.79', 0, '2023-06-08 22:01:16.690000', '2023-06-12 20:14:55.227000', '2023-06-08 22:01:54.661000', 1, 1, 'normal'),
(27, 'Lacoste', 'The Lacoste Kids Watch is a vibrant and playful timepiece designed for children. This watch features a blue dial and a blue silicone strap, making it a fun and colorful accessory for your child.\n\nThe watch has a plastic case with a diameter of 32mm, making it a suitable size for children\'s wrists. The dial includes Arabic numerals, making it easy for kids to read the time.\n\nThe Lacoste Kids Watch is water-resistant up to 5 ATM, meaning it can withstand splashes or brief immersion in water, but it is not suitable for swimming or bathing.\n\nThe watch is powered by a quartz movement, ensuring accurate timekeeping. The silicone strap is durable and comfortable for everyday wear, and it comes with a buckle clasp for secure fastening.', '69.95', 1, '2023-06-08 22:04:01.015000', '2023-06-08 22:04:01.876000', '2023-06-08 22:04:01.873000', 1, 1, 'normal'),
(28, 'Swiss Alpine Military', 'The Swiss Alpine Military Watch is a robust and stylish timepiece designed for men who appreciate precision and durability. This watch features a 43mm stainless steel case with a matted, polished surface, giving it a striking appearance. The dial is black, with illuminated indexes and hands for easy readability even in low light conditions.\n\nThe watch is powered by a quartz movement, ensuring accurate timekeeping. It comes with a chronograph function, adding to its utility. The watch is water-resistant up to 10 ATM, making it suitable for recreational swimming and snorkeling.\n\nThe Swiss Alpine Military Watch is fitted with a real leather strap, providing comfort and durability. Its design is a perfect blend of elegance and functionality, making it an ideal accessory for both casual and formal occasions.', '645.89', 0, '2023-06-08 22:07:12.708000', '2023-06-12 19:55:02.676000', '2023-06-08 22:07:13.693000', 1, 1, 'featured'),
(29, 'Michael Kors Runway', 'The Michael Kors Slim Runway Watch is a sleek and sophisticated timepiece that embodies the brand\'s signature style. This watch features a minimalist design with a 44mm case size, making it a standout piece in any watch collection.\n\nThe watch comes with a stainless steel bracelet with a brushed and polished finish, offering both comfort and durability. The round sunray dial adds to the sleek aesthetic of the watch, making it a perfect accessory for both casual and formal occasions.\n\nThe Slim Runway Watch is water-resistant up to 50m (165ft), making it suitable for short periods of recreational swimming, but not diving or snorkeling. It\'s powered by a quartz movement, ensuring accurate timekeeping.\n\nMichael Kors is a world-renowned, award-winning designer of luxury accessories and ready-to-wear with an innate sense of glamour and an unfailing eye for timeless chic. The Slim Runway Watch is a testament to this, offering luxurious style with a modern splash of trend-right touches.', '249.00', 1, '2023-06-08 22:09:59.188000', '2023-06-12 14:25:49.373000', '2023-06-08 22:10:00.171000', 1, 1, 'trending'),
(30, 'Fossil Gen 6', 'The Fossil Gen 6 is a sophisticated smartwatch that combines style, functionality, and advanced health tracking features. This watch features a 1.28-inch AMOLED touchscreen display housed in a 44mm stainless steel casing, offering a clear and bright view for easy navigation.\n\nThe watch is powered by the Qualcomm Snapdragon Wear 4100+ chipset, ensuring smooth performance and quick app launches. It comes with 1GB of RAM and 8GB of storage, allowing you to store your favorite apps and music.\n\nThe Gen 6 includes a range of health features such as continuous heart rate monitoring, blood oxygen level measurement, automatic workout detection, and cardio fitness estimations using VO2 Max. It also supports offline Spotify playback for Spotify Premium subscribers.\n\nThe watch offers Bluetooth 5.0 LE, WiFi, GPS, and NFC connectivity, allowing you to stay connected and make contactless payments with Google Pay. It is swim-proof up to 3ATM, making it suitable for shallow-water activities.\n\nThe Fossil Gen 6 runs on Wear OS 2 and is upgradable to Wear OS 3, offering improved third-party app support and enhanced health tracking features. It charges up to 80% in just 30 minutes, ensuring you\'re always ready to go.', '239.79', 0, '2023-06-08 22:13:11.115000', '2023-06-12 20:08:07.114000', '2023-06-08 22:13:12.075000', 1, 1, 'featured'),
(31, 'Fossil Gen 6', 'The Fossil Gen 6 is a sophisticated smartwatch that combines style, functionality, and advanced health tracking features. This watch features a 1.28-inch AMOLED touchscreen display housed in a 44mm stainless steel casing, offering a clear and bright view for easy navigation.\n\nThe watch is powered by the Qualcomm Snapdragon Wear 4100+ chipset, ensuring smooth performance and quick app launches. It comes with 1GB of RAM and 8GB of storage, allowing you to store your favorite apps and music.\n\nThe Gen 6 includes a range of health features such as continuous heart rate monitoring, blood oxygen level measurement, automatic workout detection, and cardio fitness estimations using VO2 Max. It also supports offline Spotify playback for Spotify Premium subscribers.\n\nThe watch offers Bluetooth 5.0 LE, WiFi, GPS, and NFC connectivity, allowing you to stay connected and make contactless payments with Google Pay. It is swim-proof up to 3ATM, making it suitable for shallow-water activities.\n\nThe Fossil Gen 6 runs on Wear OS 2 and is upgradable to Wear OS 3, offering improved third-party app support and enhanced health tracking features. It charges up to 80% in just 30 minutes, ensuring you\'re always ready to go.', '240.89', 0, '2023-06-08 22:15:18.676000', '2023-06-08 22:15:33.092000', '2023-06-08 22:15:19.522000', 1, 1, 'trending'),
(32, 'U.S. Polo Assn.', 'The U.S. Polo Assn. Watch is a stylish and versatile timepiece that embodies the brand\'s classic American style. This watch features a sleek design that is suitable for both casual and formal occasions.\n\nThe watch comes with a durable strap and a round dial, offering a comfortable fit and easy readability. The dial includes hour markers and hands that add to the aesthetic appeal of the watch.\n\nThe U.S. Polo Assn. Watch is water-resistant, making it suitable for everyday use. It\'s powered by a quartz movement, ensuring accurate timekeeping.\n\nU.S. Polo Assn. is the official brand of the United States Polo Association (USPA), the governing body for the sport of polo in the U.S. since 1890. The U.S. Polo Assn. brand captures the authenticity of the sport while reflecting its rich history and staying true to its roots in classic American style.', '54.99', 1, '2023-06-08 22:19:41.830000', '2023-06-08 22:19:43.064000', '2023-06-08 22:19:43.061000', 1, 1, 'trending'),
(33, 'Disney Frozen', 'The Disney Frozen Child\'s Watch is a delightful timepiece that brings the magic of Disney\'s Frozen to your child\'s wrist. This watch features beloved characters Elsa and Anna on the dial, surrounded by a pink notched bezel. It\'s designed with an easy-to-read dial that has labeled \"HOUR\" and \"MINUTE\" hands and a minute track to help children learn to tell time.\n\nThe watch is made with high-quality materials, including a durable plastic case and a comfortable nylon strap. It\'s also water-resistant up to 30 meters, making it safe to wear in the rain or when splashed.\n\nThe Disney Frozen Child\'s Watch comes in a gift-ready box featuring the official Disney Frozen logo, making it a perfect gift for birthdays, holidays, or any special occasion. Please note that the watch is not recommended for bathing, swimming, or diving.', '18.89', 0, '2023-06-08 22:21:25.058000', '2023-06-08 22:21:26.068000', '2023-06-08 22:21:26.062000', 1, 1, 'normal'),
(34, 'Armani Exchange', 'The Armani Exchange Watch is a sophisticated and stylish timepiece that reflects the brand\'s commitment to quality and design. This watch features a 44mm case diameter, making it a standout piece in any watch collection.\n\nThe watch comes with a silicone strap, offering both comfort and durability. The dial is brown, adding to the sleek aesthetic of the watch. It includes a three-hand date feature, ensuring you always stay on top of your schedule.\n\nThe Armani Exchange Watch is water-resistant up to 5 ATM, making it suitable for short periods of recreational swimming, but not diving or snorkeling. It\'s powered by a quartz movement, ensuring accurate timekeeping.\n\nArmani Exchange is a brand known for its provocative ads and street-chic lifestyle, inspired by contemporary dance music. This watch embodies the brand\'s attitude, style, performance, and quality, making it a perfect accessory for any occasion.', '167.00', 0, '2023-06-08 22:23:19.968000', '2023-06-12 19:53:50.757000', '2023-06-08 22:23:20.991000', 1, 1, 'featured'),
(35, 'Michael Kors Lexington', 'The Michael Kors Lexington Watch is a luxurious and stylish timepiece that reflects the brand\'s commitment to quality and design. This watch features a 44mm case diameter, making it a standout piece in any watch collection.\n\nThe watch comes with a two-tone stainless steel strap, offering both comfort and durability. The dial is silver, adding to the sleek aesthetic of the watch. It includes a three-hand date feature and a chronograph, ensuring you always stay on top of your schedule.\n\nThe Lexington Watch is water-resistant up to 100m, making it suitable for bathing, swimming, or snorkeling, but not diving. It\'s powered by a Miyota JS25 Chronograph quartz movement, ensuring accurate timekeeping.\n\nMichael Kors is a world-renowned, award-winning designer of luxury accessories and ready-to-wear with an innate sense of glamour and an unfailing eye for timeless chic. The Lexington Watch embodies the brand\'s attitude, style, performance, and quality, making it a perfect accessory for any occasion.', '169.89', 0, '2023-06-08 22:26:09.289000', '2023-06-08 22:26:10.176000', '2023-06-08 22:26:10.172000', 1, 1, 'featured'),
(36, 'Adidas Originals', 'The Adidas Originals EDITION THREE UNISEX Watch is a trendy and versatile timepiece that reflects the brand\'s commitment to quality and design. This watch features a 42mm case diameter, making it a standout piece in any watch collection.\n\nThe watch comes with a stainless steel strap, offering both comfort and durability. The dial is green, adding to the sleek aesthetic of the watch. It includes luminescent hands, ensuring you always stay on top of your schedule even in low light conditions.\n\nThe EDITION THREE UNISEX Watch is water-resistant up to 5 ATM, making it suitable for short periods of recreational swimming, but not diving or snorkeling. It\'s powered by a quartz movement, ensuring accurate timekeeping.\n\nAdidas Originals is a brand known for its sports-inspired lifestyle, celebrating originality in a globally trendsetting way. This watch embodies the brand\'s attitude, style, performance, and quality, making it a perfect accessory for any occasion.', '112.95', 0, '2023-06-08 22:30:06.485000', '2023-06-08 22:30:10.840000', '2023-06-08 22:30:10.835000', 1, 1, 'trending'),
(37, 'Fossil Bannon', 'The Fossil Bannon Watch is a versatile and stylish timepiece that reflects the brand\'s commitment to quality and design. This watch features a 45mm case diameter, making it a standout piece in any watch collection.\n\nThe watch comes with a stainless steel strap, offering both comfort and durability. The dial is green, adding to the sleek aesthetic of the watch. It includes a multifunction movement, ensuring you always stay on top of your schedule.\n\nThe Bannon Watch is water-resistant up to 5 ATM, making it suitable for short periods of recreational swimming, but not diving or snorkeling. It\'s powered by a SR927SW battery, ensuring accurate timekeeping.\n\nFossil is a brand known for its vintage-inspired designs and high-quality materials. This watch embodies the brand\'s attitude, style, performance, and quality, making it a perfect accessory for any occasion.', '189.00', 0, '2023-06-08 22:32:11.780000', '2023-06-08 22:32:12.593000', '2023-06-08 22:32:12.590000', 1, 1, 'featured'),
(38, 'Head Paris', 'The HEAD Paris/Moscow Watch is a versatile and high-tech smartwatch that offers a wide range of features to support your active lifestyle. This unisex watch features a 47mm metal case with a mineral lens, making it a standout piece in any watch collection.\n\nThe watch comes with a yellow silicon strap, offering both comfort and durability. The dial is digital, adding to the modern aesthetic of the watch. It includes a multi-sport mode, music and camera remote control, notifications, body temperature measurement, sleep tracker, movement and drink water reminder, alarm clock, step tracker, and heart rate, ECG, blood oxygen, and pressure monitoring.\n\nThe Paris/Moscow Watch is waterproof up to IP67, making it suitable for short periods of immersion in water, but not diving or snorkeling. It\'s compatible with Android 4.4 and higher, iOS 8 or later, ensuring you can connect it to your smartphone for enhanced features.\n\nThe watch has a battery duration of 5 days in normal use and 14 days in standby mode. It comes with the HEAD WATCHES APP, providing a comprehensive overview of your fitness level.', '119.90', 0, '2023-06-08 22:33:50.090000', '2023-06-08 22:33:52.181000', '2023-06-08 22:33:52.176000', 1, 1, 'trending'),
(39, 'Emporio Armani ', 'The Emporio Armani Ladies AR80023 Watch is an elegant and stylish timepiece that reflects the brand\'s commitment to quality and design. This watch features a 32mm case diameter, making it a perfect fit for a woman\'s wrist.\n\nThe watch comes with a silver stainless steel strap, offering both comfort and durability. The dial is white, adding to the sleek aesthetic of the watch. It includes a two-hand movement, ensuring you always stay on top of your schedule.\n\nThe AR80023 Watch is water-resistant up to 3 ATM, making it suitable for short periods of recreational swimming, but not diving or snorkeling. It\'s powered by a SR616SW battery, ensuring accurate timekeeping.\n\nEmporio Armani is a brand known for its modern and sleek designs. This watch embodies the brand\'s attitude, style, performance, and quality, making it a perfect accessory for any occasion.', '207.00', 0, '2023-06-08 22:36:54.398000', '2023-06-12 20:31:32.521000', '2023-06-08 22:36:55.258000', 1, 1, 'trending'),
(40, 'G-Shock Digital Rose', 'The G-Shock GMDB800-4 G-Squad Digital Rose is a compact, shock-resistant sports watch designed for women. It features a 200-meter water resistance, an electro-luminescent backlight, and a 1/100-second stopwatch. The watch can link with the G-SHOCK Connected phone app via Bluetooth, providing access to functions like step count tracking, custom timer combinations, and lap record memory. With a stylish pink and rose resin design, it\'s a fashionable and functional accessory for workouts and everyday wear.', '99.89', 1, '2023-06-12 19:51:43.015000', '2023-06-12 20:55:54.152000', '2023-06-12 19:51:43.913000', 1, 1, 'trending'),
(41, 'KIDDUS', 'Kiddus watches are designed with children in mind, offering a range of vibrant and fun designs that are both educational and stylish. These watches are designed to help children learn how to tell the time, with various models including the Time Teacher, Glitter Fantasy, Sporty, and Glow in the Dark ranges. Kiddus watches are not only functional but also fashionable, making them a popular choice for children. The company is known for its high-quality products, ensuring that the watches are durable and can withstand the active lifestyle of children. Whether it\'s for everyday wear or a special occasion, Kiddus watches make a great gift for children, combining education and style in one package.', '28.55', 1, '2023-06-12 19:59:39.108000', '2023-06-12 19:59:40.191000', '2023-06-12 19:59:40.186000', 1, 1, 'normal'),
(42, 'Marc Lauder', 'Marc Lauder is the founder of the watch company, Lauder Timepieces. The company is known for its luxury watches that are meticulously crafted with a focus on quality and design. The watches are often praised for their unique designs, precision, and durability. They are made using high-quality materials and are designed to last a lifetime. The company has a reputation for its exceptional customer service and commitment to customer satisfaction.\n\nThe Lauder Timepieces are often associated with luxury, style, and sophistication. They are considered a status symbol and are often worn by individuals who appreciate fine craftsmanship and timeless design. The watches are available in a variety of styles and designs to cater to different tastes and preferences.\n\nPlease note that this information is based on the most recent data available and may have changed. For the most accurate and up-to-date information, please visit the official website of Lauder Timepieces or contact them directly.', '79.89', 0, '2023-06-12 20:07:00.556000', '2023-06-12 20:07:01.681000', '2023-06-12 20:07:01.677000', 1, 1, 'featured'),
(43, 'Boss', 'The Boss 1513970, also known as the Boss Energy, is a contemporary chronograph watch designed for men. It features a striking geometric and textured bezel that gives it a sporty aesthetic. The watch comes with pushers, crown protection, and a tachymeter. The sunray dial of the watch is detailed with super-luminescent indexes and includes three sub-eyes, adding dimension to the design. The Boss 1513970 is completed with a stitched silicon strap, making it comfortable for everyday wear. With a 44mm stainless steel case and water resistance up to 5ATM, this watch is both durable and practical. The Boss Energy is a perfect blend of style and functionality, making it an excellent choice for those seeking a timepiece that can keep up with an active lifestyle.', '211.00', 0, '2023-06-12 20:14:24.806000', '2023-06-12 20:14:25.620000', '2023-06-12 20:14:25.614000', 1, 1, 'featured'),
(44, 'Samsung Watch 5', 'The Samsung Galaxy Watch5 is a sophisticated and feature-rich smartwatch that offers a comprehensive suite of health and fitness tracking capabilities. It comes with an Exynos W920 processor, 1.5GB of RAM, and 16GB of internal storage, ensuring smooth performance and ample space for apps and data. The watch also includes a 3-in-1 BioActive sensor for heart rate tracking, ECGs, and body composition analysis.\n\nOne of the new additions to the Galaxy Watch5 is an infrared temperature sensor, which is expected to improve sleep tracking accuracy and pave the way for future health features. The watch runs on Wear OS Powered by Samsung, providing a seamless and intuitive user experience.\n\nThe Galaxy Watch5 has a slim, lightweight design, and it uses sapphire crystal glass for enhanced durability. It\'s available in both 40mm and 44mm sizes, catering to a variety of wrist sizes and personal preferences. The watch also offers better accessibility features, including visibility enhancements like high-contrast fonts and color filters.', '279.99', 0, '2023-06-12 20:19:04.445000', '2023-06-12 20:32:06.830000', '2023-06-12 20:19:05.422000', 1, 1, 'featured'),
(45, 'TSAR BOMBA', 'TSAR BOMBA is a luxury watch brand that offers a range of high-quality men\'s watches. The watches are known for their automatic mechanical movement, providing precise timekeeping and a classic appeal. The brand offers various models, including those made with carbon fiber and diamond zirconia, showcasing their commitment to using innovative materials and designs.\n\nOne of the standout models is the Carbon Fiber Kinetic Energy Display Automatic TB8212CF, which retails for $999.99 USD. This watch features a kinetic energy display, adding a unique and modern touch to the timepiece. Another popular model is the Carbon Fiber Automatic Watch TB8208CF, available in different versions including Cool Black, Elite White, and Passion Red, each retailing for $399.99 USD.\n\nTSAR BOMBA watches are not only functional but also fashionable, making them a popular choice for individuals who appreciate fine craftsmanship and timeless design. The watches are available for purchase online and come with worldwide shipping, making them accessible to customers around the globe.', '229.80', 0, '2023-06-12 20:34:27.180000', '2023-06-12 20:35:50.184000', '2023-06-12 20:34:28.066000', 1, 1, 'featured');

-- --------------------------------------------------------

--
-- Table structure for table `products_categories_links`
--

CREATE TABLE `products_categories_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `category_order` double UNSIGNED DEFAULT NULL,
  `product_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_categories_links`
--

INSERT INTO `products_categories_links` (`id`, `product_id`, `category_id`, `category_order`, `product_order`) VALUES
(23, 20, 6, 1, 1),
(24, 20, 4, 0, 1),
(25, 21, 3, 0, 1),
(26, 22, 4, 1, 2),
(27, 22, 3, 0, 2),
(28, 23, 4, 0, 3),
(29, 24, 5, 0, 1),
(30, 25, 4, 0, 4),
(31, 26, 4, 2, 5),
(32, 26, 3, 1, 3),
(33, 27, 5, 0, 2),
(34, 28, 3, 0, 4),
(35, 29, 3, 0, 5),
(36, 30, 3, 1, 6),
(37, 26, 6, 3, 2),
(38, 30, 6, 2, 3),
(39, 31, 4, 1, 6),
(40, 31, 6, 2, 4),
(41, 32, 3, 0, 7),
(42, 33, 5, 0, 3),
(43, 34, 3, 0, 8),
(44, 35, 3, 0, 9),
(45, 36, 4, 1, 7),
(46, 36, 3, 0, 10),
(47, 37, 3, 0, 11),
(48, 38, 4, 1, 8),
(49, 38, 3, 0, 12),
(50, 39, 4, 0, 9),
(51, 40, 4, 0, 10),
(52, 41, 5, 0, 4),
(53, 42, 4, 0, 11),
(54, 43, 3, 0, 13),
(55, 44, 4, 1, 12),
(56, 44, 3, 0, 14),
(57, 45, 3, 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `products_sub_categories_links`
--

CREATE TABLE `products_sub_categories_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_order` double UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_sub_categories_links`
--

INSERT INTO `products_sub_categories_links` (`id`, `product_id`, `product_order`, `sub_category_id`, `sub_category_order`) VALUES
(23, 20, 1, 8, 1),
(24, 20, 1, 10, 0),
(25, 21, 1, 3, 0),
(26, 22, 1, 7, 0),
(27, 23, 1, 4, 0),
(28, 24, 1, 11, 0),
(29, 25, 1, 6, 0),
(30, 26, 2, 8, 1),
(31, 26, 2, 10, 0),
(32, 27, 2, 6, 0),
(33, 28, 2, 3, 1),
(34, 28, 2, 4, 0),
(35, 29, 3, 4, 1),
(36, 29, 3, 6, 0),
(37, 30, 1, 9, 1),
(38, 30, 3, 8, 0),
(39, 31, 2, 9, 1),
(40, 31, 4, 8, 0),
(41, 32, 4, 6, 0),
(42, 33, 2, 11, 0),
(43, 34, 5, 6, 1),
(44, 34, 4, 4, 0),
(45, 35, 6, 6, 1),
(46, 35, 3, 3, 0),
(47, 36, 2, 7, 1),
(48, 36, 5, 4, 0),
(49, 37, 6, 4, 0),
(50, 38, 3, 7, 0),
(51, 39, 7, 6, 0),
(52, 40, 4, 7, 0),
(53, 41, 3, 11, 0),
(54, 42, 7, 4, 1),
(55, 42, 8, 6, 0),
(56, 43, 8, 4, 1),
(57, 43, 9, 6, 0),
(58, 44, 5, 8, 0),
(59, 45, 4, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_api_tokens`
--

CREATE TABLE `strapi_api_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_api_tokens`
--

INSERT INTO `strapi_api_tokens` (`id`, `name`, `description`, `type`, `access_key`, `last_used_at`, `expires_at`, `lifespan`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'myApi', '', 'custom', '36ef19e03c2d6f360e7b5a7be68c8553f2aaa32564797bc7b7a480e99e65ed16eba1d44ccf65f544f43056647010ea6d71017a101b8e15053324ad8782c387a7', '2023-06-12 21:00:41.304000', NULL, NULL, '2023-06-03 20:50:49.451000', '2023-06-12 21:00:41.304000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_api_token_permissions`
--

CREATE TABLE `strapi_api_token_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_api_token_permissions`
--

INSERT INTO `strapi_api_token_permissions` (`id`, `action`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'api::category.category.find', '2023-06-03 22:26:38.355000', '2023-06-03 22:26:38.355000', NULL, NULL),
(2, 'api::category.category.findOne', '2023-06-03 22:26:38.355000', '2023-06-03 22:26:38.355000', NULL, NULL),
(6, 'api::product.product.find', '2023-06-03 22:26:38.355000', '2023-06-03 22:26:38.355000', NULL, NULL),
(7, 'api::product.product.findOne', '2023-06-03 22:26:38.355000', '2023-06-03 22:26:38.355000', NULL, NULL),
(11, 'api::sub-category.sub-category.find', '2023-06-03 22:26:38.355000', '2023-06-03 22:26:38.355000', NULL, NULL),
(12, 'api::sub-category.sub-category.findOne', '2023-06-03 22:26:38.355000', '2023-06-03 22:26:38.355000', NULL, NULL),
(16, 'api::category.category.create', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(17, 'api::category.category.update', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(18, 'api::category.category.delete', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(19, 'api::product.product.create', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(20, 'api::product.product.update', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(21, 'api::product.product.delete', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(22, 'api::sub-category.sub-category.create', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(23, 'api::sub-category.sub-category.update', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(24, 'api::sub-category.sub-category.delete', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(25, 'plugin::content-type-builder.components.getComponents', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(26, 'plugin::content-type-builder.components.getComponent', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(27, 'plugin::content-type-builder.content-types.getContentTypes', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(28, 'plugin::content-type-builder.content-types.getContentType', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(29, 'plugin::email.email.send', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(30, 'plugin::upload.content-api.find', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(31, 'plugin::upload.content-api.findOne', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(32, 'plugin::upload.content-api.destroy', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(33, 'plugin::upload.content-api.upload', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(34, 'plugin::users-permissions.auth.callback', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(35, 'plugin::users-permissions.auth.changePassword', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(36, 'plugin::users-permissions.auth.resetPassword', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(37, 'plugin::users-permissions.auth.connect', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(38, 'plugin::users-permissions.auth.forgotPassword', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(39, 'plugin::users-permissions.auth.register', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(40, 'plugin::users-permissions.auth.emailConfirmation', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(41, 'plugin::users-permissions.auth.sendEmailConfirmation', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL),
(42, 'plugin::i18n.locales.listLocales', '2023-06-04 00:05:12.065000', '2023-06-04 00:05:12.065000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_api_token_permissions_token_links`
--

CREATE TABLE `strapi_api_token_permissions_token_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_token_permission_id` int(10) UNSIGNED DEFAULT NULL,
  `api_token_id` int(10) UNSIGNED DEFAULT NULL,
  `api_token_permission_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_api_token_permissions_token_links`
--

INSERT INTO `strapi_api_token_permissions_token_links` (`id`, `api_token_permission_id`, `api_token_id`, `api_token_permission_order`) VALUES
(2, 1, 1, 1),
(3, 2, 1, 1),
(6, 6, 1, 1),
(7, 7, 1, 1),
(12, 12, 1, 2),
(13, 11, 1, 2),
(16, 16, 1, 3),
(17, 17, 1, 3),
(18, 18, 1, 3),
(19, 19, 1, 3),
(20, 20, 1, 3),
(21, 21, 1, 3),
(22, 22, 1, 3),
(23, 23, 1, 3),
(24, 24, 1, 3),
(25, 25, 1, 3),
(26, 26, 1, 4),
(27, 29, 1, 4),
(28, 30, 1, 4),
(29, 27, 1, 4),
(30, 28, 1, 4),
(31, 31, 1, 4),
(32, 33, 1, 4),
(33, 34, 1, 4),
(34, 35, 1, 4),
(35, 32, 1, 4),
(36, 36, 1, 5),
(37, 37, 1, 5),
(38, 38, 1, 5),
(39, 39, 1, 5),
(40, 40, 1, 5),
(41, 41, 1, 5),
(42, 42, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_core_store_settings`
--

CREATE TABLE `strapi_core_store_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_core_store_settings`
--

INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(1, 'strapi_content_types_schema', '{\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"admin::permission\",\"plugin\":\"admin\",\"globalId\":\"AdminPermission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"admin::user\",\"plugin\":\"admin\",\"globalId\":\"AdminUser\"},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"admin::role\",\"plugin\":\"admin\",\"globalId\":\"AdminRole\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token\",\"connection\":\"default\",\"uid\":\"admin::api-token\",\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token-permission\",\"connection\":\"default\",\"uid\":\"admin::api-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\"},\"admin::transfer-token\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token\",\"connection\":\"default\",\"uid\":\"admin::transfer-token\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferToken\"},\"admin::transfer-token-permission\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token-permission\",\"connection\":\"default\",\"uid\":\"admin::transfer-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferTokenPermission\"},\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"file\",\"connection\":\"default\",\"uid\":\"plugin::upload.file\",\"plugin\":\"upload\",\"globalId\":\"UploadFile\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"folder\",\"connection\":\"default\",\"uid\":\"plugin::upload.folder\",\"plugin\":\"upload\",\"globalId\":\"UploadFolder\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.permission\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\"},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.role\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\"},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.user\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"locale\",\"connection\":\"default\",\"uid\":\"plugin::i18n.locale\",\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\"},\"api::category.category\":{\"kind\":\"collectionType\",\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"category\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"desc\":{\"type\":\"text\"},\"img\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"products\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"categories\"},\"sub_categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::sub-category.sub-category\",\"mappedBy\":\"categories\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"category\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"desc\":{\"type\":\"text\"},\"img\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"products\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"categories\"},\"sub_categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::sub-category.sub-category\",\"mappedBy\":\"categories\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"category\",\"connection\":\"default\",\"uid\":\"api::category.category\",\"apiName\":\"category\",\"globalId\":\"Category\",\"actions\":{},\"lifecycles\":{}},\"api::product.product\":{\"kind\":\"collectionType\",\"collectionName\":\"products\",\"info\":{\"singularName\":\"product\",\"pluralName\":\"products\",\"displayName\":\"product\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"desc\":{\"type\":\"text\"},\"img\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"img2\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"price\":{\"type\":\"decimal\"},\"isNew\":{\"type\":\"boolean\",\"default\":false},\"categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::category.category\",\"inversedBy\":\"products\"},\"sub_categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::sub-category.sub-category\",\"inversedBy\":\"products\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"normal\",\"featured\",\"trending\"]},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"products\",\"info\":{\"singularName\":\"product\",\"pluralName\":\"products\",\"displayName\":\"product\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"desc\":{\"type\":\"text\"},\"img\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"img2\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"price\":{\"type\":\"decimal\"},\"isNew\":{\"type\":\"boolean\",\"default\":false},\"categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::category.category\",\"inversedBy\":\"products\"},\"sub_categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::sub-category.sub-category\",\"inversedBy\":\"products\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"normal\",\"featured\",\"trending\"]}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"product\",\"connection\":\"default\",\"uid\":\"api::product.product\",\"apiName\":\"product\",\"globalId\":\"Product\",\"actions\":{},\"lifecycles\":{}},\"api::sub-category.sub-category\":{\"kind\":\"collectionType\",\"collectionName\":\"sub_categories\",\"info\":{\"singularName\":\"sub-category\",\"pluralName\":\"sub-categories\",\"displayName\":\"subCategory\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"products\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"sub_categories\"},\"categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::category.category\",\"inversedBy\":\"sub_categories\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"sub_categories\",\"info\":{\"singularName\":\"sub-category\",\"pluralName\":\"sub-categories\",\"displayName\":\"subCategory\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"products\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"sub_categories\"},\"categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::category.category\",\"inversedBy\":\"sub_categories\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"sub-category\",\"connection\":\"default\",\"uid\":\"api::sub-category.sub-category\",\"apiName\":\"sub-category\",\"globalId\":\"SubCategory\",\"actions\":{},\"lifecycles\":{}}}', 'object', NULL, NULL),
(2, 'plugin_content_manager_configuration_content_types::admin::permission', '{\"uid\":\"admin::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]}}', 'object', NULL, NULL),
(3, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{\"uid\":\"plugin::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]}}', 'object', NULL, NULL),
(4, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.user', '{\"uid\":\"plugin::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}]]}}', 'object', NULL, NULL);
INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(5, 'plugin_content_manager_configuration_content_types::admin::role', '{\"uid\":\"admin::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]}}', 'object', NULL, NULL),
(6, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{\"uid\":\"plugin::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}', 'object', NULL, NULL),
(7, 'plugin_content_manager_configuration_content_types::admin::user', '{\"uid\":\"admin::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]}}', 'object', NULL, NULL),
(8, 'plugin_content_manager_configuration_content_types::admin::api-token', '{\"uid\":\"admin::api-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"lastUsedAt\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"expiresAt\",\"size\":6},{\"name\":\"lifespan\",\"size\":4}]]}}', 'object', NULL, NULL),
(9, 'plugin_content_manager_configuration_content_types::admin::api-token-permission', '{\"uid\":\"admin::api-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}', 'object', NULL, NULL),
(10, 'plugin_content_manager_configuration_content_types::admin::transfer-token', '{\"uid\":\"admin::transfer-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"accessKey\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"accessKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]}}', 'object', NULL, NULL),
(11, 'plugin_content_manager_configuration_content_types::admin::transfer-token-permission', '{\"uid\":\"admin::transfer-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}', 'object', NULL, NULL),
(12, 'plugin_content_manager_configuration_content_types::plugin::upload.file', '{\"uid\":\"plugin::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]}}', 'object', NULL, NULL),
(13, 'plugin_content_manager_configuration_content_types::plugin::upload.folder', '{\"uid\":\"plugin::upload.folder\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]}}', 'object', NULL, NULL),
(14, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission', '{\"uid\":\"plugin::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]}}', 'object', NULL, NULL),
(15, 'plugin_upload_settings', '{\"sizeOptimization\":true,\"responsiveDimensions\":false,\"autoOrientation\":false}', 'object', NULL, NULL),
(16, 'plugin_upload_view_configuration', '{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}', 'object', NULL, NULL),
(17, 'plugin_upload_metrics', '{\"weeklySchedule\":\"29 52 16 * * 0\",\"lastWeeklyUpdate\":1686495149070}', 'object', NULL, NULL),
(18, 'plugin_users-permissions_grant', '{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]}}', 'object', NULL, NULL),
(19, 'plugin_users-permissions_email', '{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}', 'object', NULL, NULL),
(20, 'plugin_users-permissions_advanced', '{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":\"\",\"default_role\":\"authenticated\"}', 'object', NULL, NULL),
(21, 'plugin_i18n_default_locale', '\"en\"', 'string', NULL, NULL),
(22, 'core_admin_auth', '{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}', 'object', NULL, NULL),
(23, 'plugin_content_manager_configuration_content_types::api::product.product', '{\"uid\":\"api::product.product\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"desc\":{\"edit\":{\"label\":\"desc\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"desc\",\"searchable\":true,\"sortable\":true}},\"img\":{\"edit\":{\"label\":\"img\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"img\",\"searchable\":false,\"sortable\":false}},\"img2\":{\"edit\":{\"label\":\"img2\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"img2\",\"searchable\":false,\"sortable\":false}},\"price\":{\"edit\":{\"label\":\"price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"price\",\"searchable\":true,\"sortable\":true}},\"isNew\":{\"edit\":{\"label\":\"isNew\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isNew\",\"searchable\":true,\"sortable\":true}},\"categories\":{\"edit\":{\"label\":\"categories\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"categories\",\"searchable\":false,\"sortable\":false}},\"sub_categories\":{\"edit\":{\"label\":\"sub_categories\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"sub_categories\",\"searchable\":false,\"sortable\":false}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"desc\",\"img\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"desc\",\"size\":6}],[{\"name\":\"img\",\"size\":6},{\"name\":\"img2\",\"size\":6}],[{\"name\":\"price\",\"size\":4},{\"name\":\"isNew\",\"size\":4}],[{\"name\":\"categories\",\"size\":6},{\"name\":\"sub_categories\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}', 'object', NULL, NULL),
(24, 'plugin_content_manager_configuration_content_types::api::category.category', '{\"uid\":\"api::category.category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"desc\":{\"edit\":{\"label\":\"desc\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"desc\",\"searchable\":true,\"sortable\":true}},\"img\":{\"edit\":{\"label\":\"img\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"img\",\"searchable\":false,\"sortable\":false}},\"products\":{\"edit\":{\"label\":\"products\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"products\",\"searchable\":false,\"sortable\":false}},\"sub_categories\":{\"edit\":{\"label\":\"sub_categories\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"sub_categories\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"desc\",\"size\":6}],[{\"name\":\"products\",\"size\":6}],[{\"name\":\"sub_categories\",\"size\":6}]],\"list\":[\"id\",\"title\",\"desc\",\"img\"]}}', 'object', NULL, NULL),
(25, 'plugin_content_manager_configuration_content_types::api::sub-category.sub-category', '{\"uid\":\"api::sub-category.sub-category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"products\":{\"edit\":{\"label\":\"products\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"products\",\"searchable\":false,\"sortable\":false}},\"categories\":{\"edit\":{\"label\":\"categories\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"categories\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"products\",\"size\":6}],[{\"name\":\"categories\",\"size\":6}]]}}', 'object', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_database_schema`
--

CREATE TABLE `strapi_database_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schema`)),
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_database_schema`
--

INSERT INTO `strapi_database_schema` (`id`, `schema`, `time`, `hash`) VALUES
(8, '{\"tables\":[{\"name\":\"strapi_core_store_settings\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"value\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"environment\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"tag\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_webhooks\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"headers\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"events\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"enabled\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"admin_permissions\",\"indexes\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"subject\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"properties\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"conditions\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users\",\"indexes\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"firstname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lastname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"registration_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_active\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"prefered_language\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_roles\",\"indexes\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_tokens\",\"indexes\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"last_used_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lifespan\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_token_permissions\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_tokens\",\"indexes\":[{\"name\":\"strapi_transfer_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_transfer_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_transfer_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"last_used_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lifespan\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_token_permissions\",\"indexes\":[{\"name\":\"strapi_transfer_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_transfer_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_transfer_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files\",\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null},{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"alternative_text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"caption\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"width\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"height\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"formats\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"hash\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ext\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"mime\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"size\",\"type\":\"decimal\",\"args\":[10,2],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"preview_url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider_metadata\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"folder_path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"upload_folders\",\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"},{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions\",\"indexes\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_roles\",\"indexes\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users\",\"indexes\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmation_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmed\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"i18n_locale\",\"indexes\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"categories\",\"indexes\":[{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"desc\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"products\",\"indexes\":[{\"name\":\"products_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"products_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"products_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"products_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"desc\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"price\",\"type\":\"decimal\",\"args\":[10,2],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_new\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"sub_categories\",\"indexes\":[{\"name\":\"sub_categories_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"sub_categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"sub_categories_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"sub_categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_permissions_role_links\",\"indexes\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_permissions_role_links_unique\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_permissions_role_links_order_inv_fk\",\"columns\":[\"permission_order\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users_roles_links\",\"indexes\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_users_roles_links_unique\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_users_roles_links_order_fk\",\"columns\":[\"role_order\"]},{\"name\":\"admin_users_roles_links_order_inv_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_token_permissions_token_links\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_token_links_fk\",\"columns\":[\"api_token_permission_id\"]},{\"name\":\"strapi_api_token_permissions_token_links_inv_fk\",\"columns\":[\"api_token_id\"]},{\"name\":\"strapi_api_token_permissions_token_links_unique\",\"columns\":[\"api_token_permission_id\",\"api_token_id\"],\"type\":\"unique\"},{\"name\":\"strapi_api_token_permissions_token_links_order_inv_fk\",\"columns\":[\"api_token_permission_order\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_token_links_fk\",\"columns\":[\"api_token_permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_token_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_api_token_permissions_token_links_inv_fk\",\"columns\":[\"api_token_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_tokens\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"api_token_permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_token_permissions_token_links\",\"indexes\":[{\"name\":\"strapi_transfer_token_permissions_token_links_fk\",\"columns\":[\"transfer_token_permission_id\"]},{\"name\":\"strapi_transfer_token_permissions_token_links_inv_fk\",\"columns\":[\"transfer_token_id\"]},{\"name\":\"strapi_transfer_token_permissions_token_links_unique\",\"columns\":[\"transfer_token_permission_id\",\"transfer_token_id\"],\"type\":\"unique\"},{\"name\":\"strapi_transfer_token_permissions_token_links_order_inv_fk\",\"columns\":[\"transfer_token_permission_order\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_token_permissions_token_links_fk\",\"columns\":[\"transfer_token_permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_transfer_token_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_transfer_token_permissions_token_links_inv_fk\",\"columns\":[\"transfer_token_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_transfer_tokens\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"transfer_token_permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"transfer_token_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"transfer_token_permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_related_morphs\",\"indexes\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"]},{\"name\":\"files_related_morphs_order_index\",\"columns\":[\"order\"],\"type\":null},{\"name\":\"files_related_morphs_id_column_index\",\"columns\":[\"related_id\"],\"type\":null}],\"foreignKeys\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_folder_links\",\"indexes\":[{\"name\":\"files_folder_links_fk\",\"columns\":[\"file_id\"]},{\"name\":\"files_folder_links_inv_fk\",\"columns\":[\"folder_id\"]},{\"name\":\"files_folder_links_unique\",\"columns\":[\"file_id\",\"folder_id\"],\"type\":\"unique\"},{\"name\":\"files_folder_links_order_inv_fk\",\"columns\":[\"file_order\"]}],\"foreignKeys\":[{\"name\":\"files_folder_links_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"},{\"name\":\"files_folder_links_inv_fk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"file_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"upload_folders_parent_links\",\"indexes\":[{\"name\":\"upload_folders_parent_links_fk\",\"columns\":[\"folder_id\"]},{\"name\":\"upload_folders_parent_links_inv_fk\",\"columns\":[\"inv_folder_id\"]},{\"name\":\"upload_folders_parent_links_unique\",\"columns\":[\"folder_id\",\"inv_folder_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_parent_links_order_inv_fk\",\"columns\":[\"folder_order\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_parent_links_fk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"},{\"name\":\"upload_folders_parent_links_inv_fk\",\"columns\":[\"inv_folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions_role_links\",\"indexes\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"up_permissions_role_links_unique\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_permissions_role_links_order_inv_fk\",\"columns\":[\"permission_order\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users_role_links\",\"indexes\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"up_users_role_links_unique\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_users_role_links_order_inv_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"products_categories_links\",\"indexes\":[{\"name\":\"products_categories_links_fk\",\"columns\":[\"product_id\"]},{\"name\":\"products_categories_links_inv_fk\",\"columns\":[\"category_id\"]},{\"name\":\"products_categories_links_unique\",\"columns\":[\"product_id\",\"category_id\"],\"type\":\"unique\"},{\"name\":\"products_categories_links_order_fk\",\"columns\":[\"category_order\"]},{\"name\":\"products_categories_links_order_inv_fk\",\"columns\":[\"product_order\"]}],\"foreignKeys\":[{\"name\":\"products_categories_links_fk\",\"columns\":[\"product_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"products\",\"onDelete\":\"CASCADE\"},{\"name\":\"products_categories_links_inv_fk\",\"columns\":[\"category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"product_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"product_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"products_sub_categories_links\",\"indexes\":[{\"name\":\"products_sub_categories_links_fk\",\"columns\":[\"product_id\"]},{\"name\":\"products_sub_categories_links_inv_fk\",\"columns\":[\"sub_category_id\"]},{\"name\":\"products_sub_categories_links_unique\",\"columns\":[\"product_id\",\"sub_category_id\"],\"type\":\"unique\"},{\"name\":\"products_sub_categories_links_order_fk\",\"columns\":[\"sub_category_order\"]},{\"name\":\"products_sub_categories_links_order_inv_fk\",\"columns\":[\"product_order\"]}],\"foreignKeys\":[{\"name\":\"products_sub_categories_links_fk\",\"columns\":[\"product_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"products\",\"onDelete\":\"CASCADE\"},{\"name\":\"products_sub_categories_links_inv_fk\",\"columns\":[\"sub_category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"sub_categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"product_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sub_category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sub_category_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"product_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"sub_categories_categories_links\",\"indexes\":[{\"name\":\"sub_categories_categories_links_fk\",\"columns\":[\"sub_category_id\"]},{\"name\":\"sub_categories_categories_links_inv_fk\",\"columns\":[\"category_id\"]},{\"name\":\"sub_categories_categories_links_unique\",\"columns\":[\"sub_category_id\",\"category_id\"],\"type\":\"unique\"},{\"name\":\"sub_categories_categories_links_order_fk\",\"columns\":[\"category_order\"]},{\"name\":\"sub_categories_categories_links_order_inv_fk\",\"columns\":[\"sub_category_order\"]}],\"foreignKeys\":[{\"name\":\"sub_categories_categories_links_fk\",\"columns\":[\"sub_category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"sub_categories\",\"onDelete\":\"CASCADE\"},{\"name\":\"sub_categories_categories_links_inv_fk\",\"columns\":[\"category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"sub_category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sub_category_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]}]}', '2023-06-03 20:55:32', '5636cd460eb4c44fb8045edaa69cbbf6');

-- --------------------------------------------------------

--
-- Table structure for table `strapi_migrations`
--

CREATE TABLE `strapi_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_transfer_tokens`
--

CREATE TABLE `strapi_transfer_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_transfer_token_permissions`
--

CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_transfer_token_permissions_token_links`
--

CREATE TABLE `strapi_transfer_token_permissions_token_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_token_permission_id` int(10) UNSIGNED DEFAULT NULL,
  `transfer_token_id` int(10) UNSIGNED DEFAULT NULL,
  `transfer_token_permission_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_webhooks`
--

CREATE TABLE `strapi_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`events`)),
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `title`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`) VALUES
(3, 'Luxury', '2023-06-05 11:04:25.365000', '2023-06-05 11:04:28.432000', '2023-06-05 11:04:28.427000', 1, 1),
(4, 'Casual', '2023-06-05 11:04:53.778000', '2023-06-05 11:04:54.748000', '2023-06-05 11:04:54.744000', 1, 1),
(6, 'Fashion', '2023-06-05 11:06:39.220000', '2023-06-07 21:55:03.625000', '2023-06-05 11:06:39.973000', 1, 1),
(7, 'Sport', '2023-06-05 11:07:21.511000', '2023-06-12 19:58:04.515000', '2023-06-05 11:07:22.316000', 1, 1),
(8, 'Smartwatches', '2023-06-07 16:42:14.344000', '2023-06-12 20:10:11.325000', '2023-06-07 16:42:15.838000', 1, 1),
(9, 'Wear OS by Google', '2023-06-07 16:45:42.121000', '2023-06-07 16:46:24.831000', '2023-06-07 16:45:43.262000', 1, 1),
(10, 'Apple Watch', '2023-06-07 16:46:46.971000', '2023-06-07 16:46:48.727000', '2023-06-07 16:46:48.722000', 1, 1),
(11, 'Popular Characters', '2023-06-07 21:56:02.997000', '2023-06-07 21:57:17.369000', '2023-06-07 21:56:04.060000', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories_categories_links`
--

CREATE TABLE `sub_categories_categories_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `category_order` double UNSIGNED DEFAULT NULL,
  `sub_category_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories_categories_links`
--

INSERT INTO `sub_categories_categories_links` (`id`, `sub_category_id`, `category_id`, `category_order`, `sub_category_order`) VALUES
(3, 3, 4, 1, 1),
(4, 3, 3, 0, 1),
(5, 4, 4, 1, 2),
(6, 4, 3, 0, 2),
(9, 6, 4, 1, 4),
(10, 7, 4, 2, 1),
(11, 7, 3, 1, 1),
(12, 6, 3, 2, 5),
(13, 8, 4, 2, 1),
(14, 8, 3, 1, 1),
(16, 9, 6, 0, 1),
(17, 10, 6, 0, 2),
(18, 6, 5, 1, 1),
(19, 11, 5, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `upload_folders`
--

CREATE TABLE `upload_folders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upload_folders_parent_links`
--

CREATE TABLE `upload_folders_parent_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `folder_id` int(10) UNSIGNED DEFAULT NULL,
  `inv_folder_id` int(10) UNSIGNED DEFAULT NULL,
  `folder_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `up_permissions`
--

CREATE TABLE `up_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_permissions`
--

INSERT INTO `up_permissions` (`id`, `action`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'plugin::users-permissions.user.me', '2023-06-03 20:39:37.713000', '2023-06-03 20:39:37.713000', NULL, NULL),
(2, 'plugin::users-permissions.auth.changePassword', '2023-06-03 20:39:37.713000', '2023-06-03 20:39:37.713000', NULL, NULL),
(3, 'plugin::users-permissions.auth.callback', '2023-06-03 20:39:37.722000', '2023-06-03 20:39:37.722000', NULL, NULL),
(4, 'plugin::users-permissions.auth.connect', '2023-06-03 20:39:37.722000', '2023-06-03 20:39:37.722000', NULL, NULL),
(5, 'plugin::users-permissions.auth.forgotPassword', '2023-06-03 20:39:37.722000', '2023-06-03 20:39:37.722000', NULL, NULL),
(6, 'plugin::users-permissions.auth.register', '2023-06-03 20:39:37.722000', '2023-06-03 20:39:37.722000', NULL, NULL),
(7, 'plugin::users-permissions.auth.emailConfirmation', '2023-06-03 20:39:37.722000', '2023-06-03 20:39:37.722000', NULL, NULL),
(8, 'plugin::users-permissions.auth.resetPassword', '2023-06-03 20:39:37.722000', '2023-06-03 20:39:37.722000', NULL, NULL),
(9, 'plugin::users-permissions.auth.sendEmailConfirmation', '2023-06-03 20:39:37.722000', '2023-06-03 20:39:37.722000', NULL, NULL),
(10, 'api::category.category.find', '2023-06-03 22:31:22.291000', '2023-06-03 22:31:22.291000', NULL, NULL),
(11, 'api::category.category.findOne', '2023-06-03 22:31:22.291000', '2023-06-03 22:31:22.291000', NULL, NULL),
(12, 'api::product.product.find', '2023-06-03 22:31:22.291000', '2023-06-03 22:31:22.291000', NULL, NULL),
(13, 'api::product.product.findOne', '2023-06-03 22:31:22.291000', '2023-06-03 22:31:22.291000', NULL, NULL),
(14, 'api::sub-category.sub-category.find', '2023-06-03 22:31:22.291000', '2023-06-03 22:31:22.291000', NULL, NULL),
(15, 'api::sub-category.sub-category.findOne', '2023-06-03 22:31:22.291000', '2023-06-03 22:31:22.291000', NULL, NULL),
(16, 'api::category.category.find', '2023-06-03 23:53:22.038000', '2023-06-03 23:53:22.038000', NULL, NULL),
(17, 'api::category.category.findOne', '2023-06-03 23:53:22.038000', '2023-06-03 23:53:22.038000', NULL, NULL),
(18, 'api::product.product.find', '2023-06-03 23:53:22.038000', '2023-06-03 23:53:22.038000', NULL, NULL),
(19, 'api::sub-category.sub-category.find', '2023-06-03 23:53:22.038000', '2023-06-03 23:53:22.038000', NULL, NULL),
(20, 'api::product.product.findOne', '2023-06-03 23:53:22.038000', '2023-06-03 23:53:22.038000', NULL, NULL),
(21, 'api::sub-category.sub-category.findOne', '2023-06-03 23:53:22.038000', '2023-06-03 23:53:22.038000', NULL, NULL),
(22, 'plugin::upload.content-api.find', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(23, 'plugin::upload.content-api.findOne', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(24, 'plugin::users-permissions.auth.callback', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(25, 'plugin::users-permissions.auth.resetPassword', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(26, 'plugin::users-permissions.auth.connect', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(27, 'plugin::users-permissions.auth.forgotPassword', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(28, 'plugin::users-permissions.auth.register', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(29, 'plugin::users-permissions.auth.emailConfirmation', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(30, 'plugin::users-permissions.auth.sendEmailConfirmation', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(31, 'plugin::users-permissions.user.find', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(32, 'plugin::users-permissions.user.findOne', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(33, 'plugin::users-permissions.role.findOne', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(34, 'plugin::users-permissions.role.find', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(35, 'plugin::users-permissions.permissions.getPermissions', '2023-06-04 00:00:26.675000', '2023-06-04 00:00:26.675000', NULL, NULL),
(36, 'api::category.category.create', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(37, 'api::category.category.update', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(38, 'api::category.category.delete', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(39, 'api::product.product.create', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(40, 'api::product.product.update', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(41, 'api::product.product.delete', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(42, 'api::sub-category.sub-category.update', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(43, 'api::sub-category.sub-category.create', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(44, 'api::sub-category.sub-category.delete', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(45, 'plugin::content-type-builder.components.getComponents', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(46, 'plugin::content-type-builder.components.getComponent', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(47, 'plugin::content-type-builder.content-types.getContentTypes', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(48, 'plugin::content-type-builder.content-types.getContentType', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(49, 'plugin::email.email.send', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(50, 'plugin::upload.content-api.destroy', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(51, 'plugin::upload.content-api.upload', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(52, 'plugin::users-permissions.user.create', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(53, 'plugin::users-permissions.user.count', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(54, 'plugin::users-permissions.user.update', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(55, 'plugin::users-permissions.user.destroy', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(56, 'plugin::users-permissions.role.createRole', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(57, 'plugin::users-permissions.role.updateRole', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(58, 'plugin::users-permissions.role.deleteRole', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL),
(59, 'plugin::i18n.locales.listLocales', '2023-06-04 00:04:15.307000', '2023-06-04 00:04:15.307000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `up_permissions_role_links`
--

CREATE TABLE `up_permissions_role_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_permissions_role_links`
--

INSERT INTO `up_permissions_role_links` (`id`, `permission_id`, `role_id`, `permission_order`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 2, 1),
(4, 4, 2, 1),
(5, 5, 2, 1),
(6, 9, 2, 1),
(7, 6, 2, 1),
(8, 8, 2, 2),
(9, 7, 2, 2),
(10, 10, 2, 3),
(11, 11, 2, 3),
(12, 12, 2, 3),
(13, 13, 2, 3),
(14, 14, 2, 3),
(15, 15, 2, 3),
(16, 16, 1, 2),
(17, 17, 1, 2),
(18, 18, 1, 2),
(19, 20, 1, 2),
(20, 21, 1, 3),
(21, 19, 1, 3),
(22, 23, 1, 4),
(23, 22, 1, 4),
(24, 24, 1, 4),
(25, 25, 1, 4),
(26, 26, 1, 4),
(27, 27, 1, 4),
(28, 28, 1, 4),
(29, 29, 1, 4),
(30, 30, 1, 4),
(31, 31, 1, 4),
(32, 32, 1, 5),
(33, 33, 1, 5),
(34, 34, 1, 5),
(35, 35, 1, 5),
(36, 36, 1, 6),
(37, 37, 1, 6),
(38, 38, 1, 6),
(39, 39, 1, 6),
(40, 40, 1, 6),
(41, 41, 1, 6),
(42, 42, 1, 6),
(43, 43, 1, 6),
(44, 44, 1, 6),
(45, 45, 1, 6),
(46, 46, 1, 7),
(47, 47, 1, 7),
(48, 48, 1, 7),
(49, 50, 1, 7),
(50, 52, 1, 7),
(51, 49, 1, 7),
(52, 54, 1, 7),
(53, 56, 1, 7),
(54, 51, 1, 7),
(55, 53, 1, 7),
(56, 58, 1, 8),
(57, 55, 1, 8),
(58, 57, 1, 8),
(59, 59, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `up_roles`
--

CREATE TABLE `up_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_roles`
--

INSERT INTO `up_roles` (`id`, `name`, `description`, `type`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
(1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2023-06-03 20:39:37.700000', '2023-06-04 00:04:15.301000', NULL, NULL),
(2, 'Public', 'Default role given to unauthenticated user.', 'public', '2023-06-03 20:39:37.704000', '2023-06-03 22:31:22.285000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `up_users`
--

CREATE TABLE `up_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `up_users_role_links`
--

CREATE TABLE `up_users_role_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `user_order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `admin_permissions_role_links`
--
ALTER TABLE `admin_permissions_role_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_role_links_unique` (`permission_id`,`role_id`),
  ADD KEY `admin_permissions_role_links_fk` (`permission_id`),
  ADD KEY `admin_permissions_role_links_inv_fk` (`role_id`),
  ADD KEY `admin_permissions_role_links_order_inv_fk` (`permission_order`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  ADD KEY `admin_roles_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_users_created_by_id_fk` (`created_by_id`),
  ADD KEY `admin_users_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `admin_users_roles_links`
--
ALTER TABLE `admin_users_roles_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_roles_links_unique` (`user_id`,`role_id`),
  ADD KEY `admin_users_roles_links_fk` (`user_id`),
  ADD KEY `admin_users_roles_links_inv_fk` (`role_id`),
  ADD KEY `admin_users_roles_links_order_fk` (`role_order`),
  ADD KEY `admin_users_roles_links_order_inv_fk` (`user_order`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_created_by_id_fk` (`created_by_id`),
  ADD KEY `categories_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_files_folder_path_index` (`folder_path`),
  ADD KEY `upload_files_created_at_index` (`created_at`),
  ADD KEY `upload_files_updated_at_index` (`updated_at`),
  ADD KEY `upload_files_name_index` (`name`),
  ADD KEY `upload_files_size_index` (`size`),
  ADD KEY `upload_files_ext_index` (`ext`),
  ADD KEY `files_created_by_id_fk` (`created_by_id`),
  ADD KEY `files_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `files_folder_links`
--
ALTER TABLE `files_folder_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `files_folder_links_unique` (`file_id`,`folder_id`),
  ADD KEY `files_folder_links_fk` (`file_id`),
  ADD KEY `files_folder_links_inv_fk` (`folder_id`),
  ADD KEY `files_folder_links_order_inv_fk` (`file_order`);

--
-- Indexes for table `files_related_morphs`
--
ALTER TABLE `files_related_morphs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_related_morphs_fk` (`file_id`),
  ADD KEY `files_related_morphs_order_index` (`order`),
  ADD KEY `files_related_morphs_id_column_index` (`related_id`);

--
-- Indexes for table `i18n_locale`
--
ALTER TABLE `i18n_locale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  ADD KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_created_by_id_fk` (`created_by_id`),
  ADD KEY `products_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `products_categories_links`
--
ALTER TABLE `products_categories_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_categories_links_unique` (`product_id`,`category_id`),
  ADD KEY `products_categories_links_fk` (`product_id`),
  ADD KEY `products_categories_links_inv_fk` (`category_id`),
  ADD KEY `products_categories_links_order_fk` (`category_order`),
  ADD KEY `products_categories_links_order_inv_fk` (`product_order`);

--
-- Indexes for table `products_sub_categories_links`
--
ALTER TABLE `products_sub_categories_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sub_categories_links_unique` (`product_id`,`sub_category_id`),
  ADD KEY `products_sub_categories_links_fk` (`product_id`),
  ADD KEY `products_sub_categories_links_order_inv_fk` (`product_order`),
  ADD KEY `products_sub_categories_links_inv_fk` (`sub_category_id`),
  ADD KEY `products_sub_categories_links_order_fk` (`sub_category_order`);

--
-- Indexes for table `strapi_api_tokens`
--
ALTER TABLE `strapi_api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_api_token_permissions`
--
ALTER TABLE `strapi_api_token_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_api_token_permissions_token_links`
--
ALTER TABLE `strapi_api_token_permissions_token_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_api_token_permissions_token_links_unique` (`api_token_permission_id`,`api_token_id`),
  ADD KEY `strapi_api_token_permissions_token_links_fk` (`api_token_permission_id`),
  ADD KEY `strapi_api_token_permissions_token_links_inv_fk` (`api_token_id`),
  ADD KEY `strapi_api_token_permissions_token_links_order_inv_fk` (`api_token_permission_order`);

--
-- Indexes for table `strapi_core_store_settings`
--
ALTER TABLE `strapi_core_store_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_database_schema`
--
ALTER TABLE `strapi_database_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_migrations`
--
ALTER TABLE `strapi_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_transfer_tokens`
--
ALTER TABLE `strapi_transfer_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_transfer_token_permissions`
--
ALTER TABLE `strapi_transfer_token_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_transfer_token_permissions_token_links`
--
ALTER TABLE `strapi_transfer_token_permissions_token_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_transfer_token_permissions_token_links_unique` (`transfer_token_permission_id`,`transfer_token_id`),
  ADD KEY `strapi_transfer_token_permissions_token_links_fk` (`transfer_token_permission_id`),
  ADD KEY `strapi_transfer_token_permissions_token_links_inv_fk` (`transfer_token_id`),
  ADD KEY `strapi_transfer_token_permissions_token_links_order_inv_fk` (`transfer_token_permission_order`);

--
-- Indexes for table `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_created_by_id_fk` (`created_by_id`),
  ADD KEY `sub_categories_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `sub_categories_categories_links`
--
ALTER TABLE `sub_categories_categories_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_categories_categories_links_unique` (`sub_category_id`,`category_id`),
  ADD KEY `sub_categories_categories_links_fk` (`sub_category_id`),
  ADD KEY `sub_categories_categories_links_inv_fk` (`category_id`),
  ADD KEY `sub_categories_categories_links_order_fk` (`category_order`),
  ADD KEY `sub_categories_categories_links_order_inv_fk` (`sub_category_order`);

--
-- Indexes for table `upload_folders`
--
ALTER TABLE `upload_folders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  ADD UNIQUE KEY `upload_folders_path_index` (`path`),
  ADD KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  ADD KEY `upload_folders_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `upload_folders_parent_links`
--
ALTER TABLE `upload_folders_parent_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upload_folders_parent_links_unique` (`folder_id`,`inv_folder_id`),
  ADD KEY `upload_folders_parent_links_fk` (`folder_id`),
  ADD KEY `upload_folders_parent_links_inv_fk` (`inv_folder_id`),
  ADD KEY `upload_folders_parent_links_order_inv_fk` (`folder_order`);

--
-- Indexes for table `up_permissions`
--
ALTER TABLE `up_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `up_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `up_permissions_role_links`
--
ALTER TABLE `up_permissions_role_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `up_permissions_role_links_unique` (`permission_id`,`role_id`),
  ADD KEY `up_permissions_role_links_fk` (`permission_id`),
  ADD KEY `up_permissions_role_links_inv_fk` (`role_id`),
  ADD KEY `up_permissions_role_links_order_inv_fk` (`permission_order`);

--
-- Indexes for table `up_roles`
--
ALTER TABLE `up_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `up_roles_created_by_id_fk` (`created_by_id`),
  ADD KEY `up_roles_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `up_users`
--
ALTER TABLE `up_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `up_users_created_by_id_fk` (`created_by_id`),
  ADD KEY `up_users_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `up_users_role_links`
--
ALTER TABLE `up_users_role_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `up_users_role_links_unique` (`user_id`,`role_id`),
  ADD KEY `up_users_role_links_fk` (`user_id`),
  ADD KEY `up_users_role_links_inv_fk` (`role_id`),
  ADD KEY `up_users_role_links_order_inv_fk` (`user_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `admin_permissions_role_links`
--
ALTER TABLE `admin_permissions_role_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users_roles_links`
--
ALTER TABLE `admin_users_roles_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `files_folder_links`
--
ALTER TABLE `files_folder_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files_related_morphs`
--
ALTER TABLE `files_related_morphs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `i18n_locale`
--
ALTER TABLE `i18n_locale`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `products_categories_links`
--
ALTER TABLE `products_categories_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `products_sub_categories_links`
--
ALTER TABLE `products_sub_categories_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `strapi_api_tokens`
--
ALTER TABLE `strapi_api_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `strapi_api_token_permissions`
--
ALTER TABLE `strapi_api_token_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `strapi_api_token_permissions_token_links`
--
ALTER TABLE `strapi_api_token_permissions_token_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `strapi_core_store_settings`
--
ALTER TABLE `strapi_core_store_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `strapi_database_schema`
--
ALTER TABLE `strapi_database_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `strapi_migrations`
--
ALTER TABLE `strapi_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_transfer_tokens`
--
ALTER TABLE `strapi_transfer_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_transfer_token_permissions`
--
ALTER TABLE `strapi_transfer_token_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_transfer_token_permissions_token_links`
--
ALTER TABLE `strapi_transfer_token_permissions_token_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_categories_categories_links`
--
ALTER TABLE `sub_categories_categories_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `upload_folders`
--
ALTER TABLE `upload_folders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upload_folders_parent_links`
--
ALTER TABLE `upload_folders_parent_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `up_permissions`
--
ALTER TABLE `up_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `up_permissions_role_links`
--
ALTER TABLE `up_permissions_role_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `up_roles`
--
ALTER TABLE `up_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `up_users`
--
ALTER TABLE `up_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `up_users_role_links`
--
ALTER TABLE `up_users_role_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_permissions_role_links`
--
ALTER TABLE `admin_permissions_role_links`
  ADD CONSTRAINT `admin_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_users_roles_links`
--
ALTER TABLE `admin_users_roles_links`
  ADD CONSTRAINT `admin_users_roles_links_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_users_roles_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `files_folder_links`
--
ALTER TABLE `files_folder_links`
  ADD CONSTRAINT `files_folder_links_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `files_folder_links_inv_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `files_related_morphs`
--
ALTER TABLE `files_related_morphs`
  ADD CONSTRAINT `files_related_morphs_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `i18n_locale`
--
ALTER TABLE `i18n_locale`
  ADD CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products_categories_links`
--
ALTER TABLE `products_categories_links`
  ADD CONSTRAINT `products_categories_links_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_categories_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products_sub_categories_links`
--
ALTER TABLE `products_sub_categories_links`
  ADD CONSTRAINT `products_sub_categories_links_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_categories_links_inv_fk` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `strapi_api_tokens`
--
ALTER TABLE `strapi_api_tokens`
  ADD CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_api_token_permissions`
--
ALTER TABLE `strapi_api_token_permissions`
  ADD CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_api_token_permissions_token_links`
--
ALTER TABLE `strapi_api_token_permissions_token_links`
  ADD CONSTRAINT `strapi_api_token_permissions_token_links_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_api_token_permissions_token_links_inv_fk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `strapi_transfer_tokens`
--
ALTER TABLE `strapi_transfer_tokens`
  ADD CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_transfer_token_permissions`
--
ALTER TABLE `strapi_transfer_token_permissions`
  ADD CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_transfer_token_permissions_token_links`
--
ALTER TABLE `strapi_transfer_token_permissions_token_links`
  ADD CONSTRAINT `strapi_transfer_token_permissions_token_links_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_transfer_token_permissions_token_links_inv_fk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sub_categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sub_categories_categories_links`
--
ALTER TABLE `sub_categories_categories_links`
  ADD CONSTRAINT `sub_categories_categories_links_fk` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_categories_categories_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `upload_folders`
--
ALTER TABLE `upload_folders`
  ADD CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `upload_folders_parent_links`
--
ALTER TABLE `upload_folders_parent_links`
  ADD CONSTRAINT `upload_folders_parent_links_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `upload_folders_parent_links_inv_fk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `up_permissions`
--
ALTER TABLE `up_permissions`
  ADD CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `up_permissions_role_links`
--
ALTER TABLE `up_permissions_role_links`
  ADD CONSTRAINT `up_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `up_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `up_roles`
--
ALTER TABLE `up_roles`
  ADD CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `up_users`
--
ALTER TABLE `up_users`
  ADD CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `up_users_role_links`
--
ALTER TABLE `up_users_role_links`
  ADD CONSTRAINT `up_users_role_links_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `up_users_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
