-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 12, 2022 at 11:58 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `formation_symfony`
--
CREATE DATABASE IF NOT EXISTS `formation_symfony` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `formation_symfony`;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220802075937', '2022-08-02 07:59:47', 164),
('DoctrineMigrations\\Version20220802080415', '2022-08-02 08:04:25', 154),
('DoctrineMigrations\\Version20220806230049', '2022-08-06 23:01:03', 104),
('DoctrineMigrations\\Version20220807013854', '2022-08-07 01:39:07', 86);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `possessions`
--

CREATE TABLE `possessions` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valeur` double NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `possessions`
--

INSERT INTO `possessions` (`id`, `nom`, `valeur`, `type`) VALUES
(151, 'KYD', 374453.00846206, 'Hernandez Petitjean S.A.R.L.'),
(152, 'SGD', 757.1521648756, 'Antoine'),
(153, 'AOA', 42976.697803122, 'Menard'),
(154, 'KRW', 59.933676433253, 'Texier'),
(155, 'CZK', 13773.81665397, 'Schmitt'),
(156, 'PEN', 42356.268425081, 'Simon Meunier SA'),
(157, 'AWG', 11085.682733422, 'Gonzalez S.A.'),
(158, 'BND', 0.3332398423614, 'Renard et Fils'),
(159, 'RON', 61688.798096594, 'Couturier S.A.S.'),
(160, 'MAD', 157014248.03115, 'Leconte'),
(161, 'LKR', 4203975.9180776, 'Martineau et Fils'),
(162, 'PGK', 5596.4464999928, 'Barbe'),
(163, 'TRY', 10.527864855494, 'Marchal Dupuis SA'),
(164, 'GMD', 27456.430375283, 'Gaudin'),
(165, 'VND', 843.77769100469, 'Meunier'),
(166, 'LSL', 55.283391005492, 'Legendre SA'),
(167, 'TRY', 132821.82576946, 'Klein S.A.'),
(168, 'BZD', 5963.1697456227, 'Meyer SARL'),
(169, 'MUR', 555.0677274261, 'Coste'),
(170, 'TJS', 8125448.8964308, 'Grondin'),
(171, 'GBP', 2849535.9282816, 'Gosselin Fabre S.A.'),
(172, 'NAD', 1174.9902164177, 'Martin S.A.S.'),
(173, 'GNF', 11540980.857805, 'Albert et Fils'),
(174, 'NAD', 29.071246066164, 'Bourdon Barbier SA'),
(175, 'MDL', 5.503233070254, 'Gallet'),
(176, 'PKR', 653214043.29305, 'Pottier'),
(177, 'KZT', 168624.26877895, 'Gallet'),
(178, 'VND', 658292.35774626, 'Begue'),
(179, 'PAB', 5864.9940388571, 'Gillet'),
(180, 'XPF', 2.0037286621536, 'Barbier Robin SARL');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `possessions_id` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `adresse`, `tel`, `possessions_id`, `birthday`) VALUES
(191, 'Vallet', 'Édouard', 'michel.arnaud@yahoo.fr', '38, chemin Guillon\n65 741 Renaud-sur-Mer', '+33 (0)1 50 45 64 15', 151, '2018-07-13'),
(192, 'Pineau', 'Marianne', 'zrey@joubert.fr', '217, impasse de Allard\n18283 Auger', '07 90 33 13 49', 152, '1985-09-17'),
(194, 'Lebreton', 'Océane', 'jolivier@humbert.org', '14, rue Poirier\n14 068 Coste-sur-Mer', '06 41 07 12 83', 154, '1985-09-28'),
(199, 'Lelievre', 'Zoé', 'bonneau.noel@orange.fr', '699, place Berthelot\n10 172 Henry-la-Forêt', '+33 3 72 24 53 51', 159, '1996-08-19'),
(200, 'Gautier', 'Bertrand', 'julien.renaud@guerin.com', '86, avenue de Godard\n02364 Munoz-les-Bains', '0298595997', 160, '1972-09-01'),
(201, 'Reynaud', 'Renée', 'vidal.helene@hoareau.com', '66, place de Morin\n78848 Valette-sur-Rousseau', '+33 (0)1 42 85 54 35', 161, '2018-05-21'),
(202, 'De Sousa', 'Benoît', 'xprevost@hotmail.fr', '70, boulevard Simone Marion\n19 935 Valentin', '+33 (0)2 50 17 11 89', 162, '2005-11-21'),
(203, 'Rousseau', 'Lucy', 'fmercier@foucher.fr', '4, rue Couturier\n95 723 Marchand-sur-Mer', '+33 9 45 46 86 28', 163, '2015-01-19'),
(204, 'Rocher', 'Alexandria', 'hmathieu@jacques.fr', '9, chemin Marques\n87 879 Martineau-sur-Becker', '+33 4 73 31 98 12', 164, '2005-07-29'),
(205, 'Merle', 'Marcel', 'denis66@raymond.org', '35, impasse Julien Seguin\n88941 Perrier', '0748124325', 165, '1970-07-05'),
(206, 'Vidal', 'Pierre', 'zmoreau@hotmail.fr', '34, place Isaac Le Goff\n07948 BoulangerBourg', '+33 4 85 64 05 62', 166, '2019-04-16'),
(207, 'Gilles', 'Michelle', 'theophile.noel@laporte.fr', '1, avenue de Noel\n01 502 Alexandre-sur-Wagner', '0759334965', 167, '2002-02-12'),
(208, 'Mallet', 'Laetitia', 'tlegall@lefebvre.fr', 'rue Gabrielle Lamy\n86411 Ramos', '0160694335', 168, '2010-11-30'),
(209, 'Joly', 'Édouard', 'dremy@orange.fr', '917, place Pierre Guilbert\n55 475 Barre', '0219812345', 169, '1989-08-11'),
(210, 'Bertrand', 'Olivie', 'kgodard@aubert.com', '3, impasse Aimé Clerc\n41 790 Legros', '+33 1 60 92 91 24', 170, '1993-09-29'),
(211, 'Alves', 'Nathalie', 'irobert@club-internet.fr', '39, rue Lopes\n70392 Launay', '+33 9 43 14 75 50', 171, '1977-04-12'),
(212, 'Marie', 'Emmanuel', 'barre.henri@renard.fr', '9, boulevard Daniel\n15737 Imbert-sur-Brunet', '0150760702', 172, '1974-07-02'),
(213, 'Maillot', 'Claude', 'thibault21@club-internet.fr', '13, chemin Célina Costa\n90152 Charpentierboeuf', '0752355528', 173, '2011-06-17'),
(215, 'Becker', 'Véronique', 'michelle.perret@laposte.net', '9, avenue Célina Gregoire\n59575 Georges-sur-Charles', '06 99 74 73 93', 175, '1992-03-20'),
(216, 'Mendes', 'Maggie', 'humbert.julien@robin.com', '4, boulevard de Lacroix\n03675 Giraud-les-Bains', '+33 (0)4 48 05 39 15', 176, '1979-06-22'),
(217, 'Thomas', 'Pénélope', 'michelle.etienne@dbmail.com', '5, avenue Germain\n69294 Fernandes', '+33 (0)9 53 01 44 73', 177, '2021-09-15'),
(218, 'Monnier', 'Martine', 'david02@lecomte.net', '26, avenue Marion\n99607 Faure-les-Bains', '+33 8 93 92 33 40', 178, '2009-11-23'),
(219, 'Pinto', 'Luce', 'eric78@etienne.com', '56, place Bourdon\n08717 Roussetnec', '0963235951', 179, '2002-05-02'),
(220, 'Leclerc', 'Stéphanie', 'anouk27@allard.org', '87, rue Meyer\n74667 Dupre', '0148578398', 180, '1988-05-16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `possessions`
--
ALTER TABLE `possessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8D93D649DB786A8D` (`possessions_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `possessions`
--
ALTER TABLE `possessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649DB786A8D` FOREIGN KEY (`possessions_id`) REFERENCES `possessions` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
