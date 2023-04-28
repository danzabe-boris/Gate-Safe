-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 07 nov. 2022 à 08:32
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `webgate`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `id_activity` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(10) NOT NULL,
  `type` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_log` datetime NOT NULL,
  `concern` varchar(20) NOT NULL,
  PRIMARY KEY (`id_activity`),
  KEY `fk_author` (`author`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `activity`
--

INSERT INTO `activity` (`id_activity`, `author`, `type`, `description`, `date_log`, `concern`) VALUES
(1, 'ADM1', 'Create', 'Rapport activity of 2022-11-03 02:53:53.212 : User ADM1 have realize action to Create REC2', '2022-11-03 02:53:53', 'REC2'),
(2, 'ADM1', 'Create', 'Rapport activity of 2022-11-03 06:34:19.46 : User ADM1 have realize action to Create PD2', '2022-11-03 06:34:19', 'PD2'),
(3, 'ADM1', 'Create', 'Rapport activity of 2022-11-05 21:08:00.607 : User ADM1 have realize action to Create PD2', '2022-11-05 21:08:01', 'PD2'),
(4, 'ADM1', 'Delete User', 'Rapport activity of 2022-11-06 17:32:39.524 : User ADM1 have realize action to Delete User PTN2', '2022-11-06 17:32:40', 'PTN2'),
(5, 'ADM1', 'Create User', 'Rapport activity of 2022-11-06 17:47:41.745 : User ADM1 have realize action to Create User REC2', '2022-11-06 17:47:42', 'REC2'),
(6, 'ADM1', 'Delete User', 'Rapport activity of 2022-11-06 17:48:12.295 : User ADM1 have realize action to Delete User REC2', '2022-11-06 17:48:12', 'REC2'),
(7, 'ADM1', 'Delete User', 'Rapport activity of 2022-11-06 17:56:58.954 : User ADM1 have realize action to Delete User REC1', '2022-11-06 17:56:59', 'REC1'),
(8, 'ADM1', 'Delete User', 'Rapport activity of 2022-11-06 18:17:15.661 : User ADM1 have realize action to Delete User PTN1', '2022-11-06 18:17:16', 'PTN1'),
(9, 'ADM1', 'Create User', 'Rapport activity of 2022-11-06 18:22:39.928 : User ADM1 have realize action to Create User REC1', '2022-11-06 18:22:40', 'REC1'),
(10, 'ADM1', 'Create User', 'Rapport activity of 2022-11-06 20:35:26.488 : User ADM1 have realize action to Create User ADM2', '2022-11-06 20:35:26', 'ADM2'),
(11, 'ADM1', 'Create User', 'Rapport activity of 2022-11-06 20:43:27.375 : User ADM1 have realize action to Create User REC1', '2022-11-06 20:43:27', 'REC1'),
(12, 'ADM2', 'Create User', 'Rapport activity of 2022-11-07 00:14:17.323 : User ADM2 have realize action to Create User PTN1', '2022-11-07 00:14:17', 'PTN1'),
(13, 'ADM2', 'Create Product', 'Rapport activity of 2022-11-07 00:38:38.192 : User ADM2 have realize action to Create Product PD1', '2022-11-07 00:38:38', 'PD1'),
(14, 'ADM2', 'Create Product', 'Rapport activity of 2022-11-07 00:43:05.092 : User ADM2 have realize action to Create Product PD2', '2022-11-07 00:43:05', 'PD2'),
(15, 'ADM1', 'Delete Product', 'Rapport activity of 2022-11-07 02:33:49.131 : User ADM1 have realize action to Delete Product PD2', '2022-11-07 02:33:49', 'PD2'),
(16, 'ADM1', 'Create Product', 'Rapport activity of 2022-11-07 04:59:01.138 : User ADM1 have realize action to Create Product PD1', '2022-11-07 04:59:01', 'PD1'),
(17, 'ADM1', 'Delete User', 'Rapport activity of 2022-11-07 08:56:34.898 : User ADM1 have realize action to Delete User REC1', '2022-11-07 08:56:35', 'REC1'),
(18, 'ADM1', 'Create User', 'Rapport activity of 2022-11-07 09:00:41.439 : User ADM1 have realize action to Create User REC1', '2022-11-07 09:00:41', 'REC1'),
(19, 'ADM1', 'Create User', 'Rapport activity of 2022-11-07 09:01:01.282 : User ADM1 have realize action to Create User REC2', '2022-11-07 09:01:01', 'REC2');

-- --------------------------------------------------------

--
-- Structure de la table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `id_catalog` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(40) NOT NULL,
  `sub_category` varchar(40) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_catalog`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `catalog`
--

INSERT INTO `catalog` (`id_catalog`, `category`, `sub_category`, `description`) VALUES
(4, 'Forfait', 'Forfait Blue Data', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commands`
--

DROP TABLE IF EXISTS `commands`;
CREATE TABLE IF NOT EXISTS `commands` (
  `id_command` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `date_command` datetime NOT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `id_product` varchar(10) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_partner` varchar(10) NOT NULL,
  PRIMARY KEY (`id_command`),
  KEY `fk_product` (`id_product`) USING BTREE,
  KEY `fk_customer` (`id_customer`),
  KEY `fk_partner` (`id_partner`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `adress` varchar(30) NOT NULL,
  `id_partner` varchar(10) NOT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(10) NOT NULL,
  `date_login` datetime NOT NULL,
  `date_logout` datetime DEFAULT NULL,
  PRIMARY KEY (`id_login`),
  KEY `fk_log` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id_login`, `id_user`, `date_login`, `date_logout`) VALUES
(61, 'ADM1', '2022-11-07 08:56:27', '2022-11-07 08:56:27'),
(60, 'ADM1', '2022-11-07 07:24:16', '2022-11-07 08:56:21'),
(59, 'ADM1', '2022-11-07 04:57:53', '2022-11-07 07:24:16'),
(58, 'ADM1', '2022-11-07 03:28:55', '2022-11-07 04:57:53'),
(57, 'ADM1', '2022-11-07 02:33:37', '2022-11-07 03:28:55'),
(56, 'ADM2', '2022-11-07 02:32:06', '2022-11-07 02:32:06'),
(55, 'ADM1', '2022-11-07 02:24:30', '2022-11-07 02:33:37'),
(54, 'ADM2', '2022-11-07 01:58:29', '2022-11-07 02:32:06'),
(53, 'ADM1', '2022-11-07 01:00:45', '2022-11-07 02:24:30'),
(52, 'ADM2', '2022-11-07 00:36:08', '2022-11-07 01:00:35'),
(51, 'ADM1', '2022-11-07 00:20:24', '2022-11-07 01:00:45'),
(50, 'ADM2', '2022-11-07 00:12:04', '2022-11-07 00:36:08'),
(49, 'ADM2', '2022-11-06 20:36:41', '2022-11-07 00:12:04'),
(48, 'ADM1', '2022-11-06 20:34:40', '2022-11-07 00:20:24'),
(47, 'ADM1', '2022-11-06 20:15:23', '2022-11-06 20:34:40'),
(46, 'ADM1', '2022-11-06 20:15:03', '2022-11-06 20:15:23'),
(45, 'ADM1', '2022-11-06 20:15:03', '2022-11-06 20:15:23'),
(44, 'ADM1', '2022-11-06 20:15:03', '2022-11-06 20:15:23'),
(43, 'ADM1', '2022-11-06 20:15:03', '2022-11-06 20:15:23'),
(42, 'ADM1', '2022-11-06 20:15:03', '2022-11-06 20:15:23'),
(41, 'ADM1', '2022-11-06 20:15:03', '2022-11-06 20:15:23'),
(39, 'ADM1', '2022-11-06 19:08:46', '2022-11-06 19:21:00'),
(40, 'ADM1', '2022-11-06 19:21:14', '2022-11-06 20:15:03');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id_product` varchar(10) NOT NULL,
  `id_catalog` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `fk_catalog` (`id_catalog`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id_product`, `id_catalog`, `name`, `price`, `quantity`, `description`, `image`) VALUES
('PD1', 4, 'Blue Night', 250, 0, '250U = 05 Go 24 Hrs, 22H - 06H', 'default.gif');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `name`, `password`, `role`, `email`) VALUES
('ADM1', 'nash', 'a29d8998d29ff842a4c5a0be85349ec8bd63e457bfd6f258af70847f28f65fa4', 'admin', 'nash@gate.cm'),
('ADM2', 'Alto', 'f1a7a961702429162c5326acc1e1a6b635286bf08aa9d1e23f3c7609e8100f52', 'admin', 'alto@gate.cm'),
('REC1', 'Yann', 'c34d89c5858e15be69a8e01d6a11fe1ff9946110dc33faffbb899220347b3fa5', 'customManager', 'yann@gate.cm'),
('PTN1', 'Patrick', 'b9d9080e7dd936ddec004a96594cf7f830cc087a49e757e7f50dc2748ae0677c', 'partners', 'patrick@gate.cm'),
('REC2', 'Test', 'b0d4329cbbb26f48157008a102bef347a5c4fc2eea21fc7c4166d01f5adae2bf', 'customManager', 'test@gate.cm');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
