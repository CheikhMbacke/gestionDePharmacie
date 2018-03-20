-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 20 Mars 2018 à 13:16
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `pharmacie`
--

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE IF NOT EXISTS `medicament` (
  `identifiant` varchar(50) NOT NULL DEFAULT '',
  `nom_medoc` varchar(100) DEFAULT NULL,
  `quantite_stock` int(11) DEFAULT NULL,
  `date_expiration` date DEFAULT NULL,
  `prix_medoc` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifiant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pharmacien`
--

CREATE TABLE IF NOT EXISTS `pharmacien` (
  `code_pharmacien` varchar(50) NOT NULL DEFAULT '',
  `nom_pharmacien` varchar(100) DEFAULT NULL,
  `email_pharmacien` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_pharmacien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE IF NOT EXISTS `vente` (
  `numero_vente` int(11) NOT NULL DEFAULT '0',
  `code_pharmacien` varchar(50) DEFAULT NULL,
  `medicament` varchar(100) DEFAULT NULL,
  `identifiant` varchar(50) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `quantite_achete` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `date_vente` date DEFAULT NULL,
  `heure_vente` time DEFAULT NULL,
  PRIMARY KEY (`numero_vente`),
  KEY `fk_medoc_detail` (`identifiant`),
  KEY `fk_pharmacien_vente` (`code_pharmacien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `fk_medoc_detail` FOREIGN KEY (`identifiant`) REFERENCES `medicament` (`identifiant`),
  ADD CONSTRAINT `fk_pharmacien_vente` FOREIGN KEY (`code_pharmacien`) REFERENCES `pharmacien` (`code_pharmacien`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
