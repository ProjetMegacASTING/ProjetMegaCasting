-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 23 Novembre 2014 à 16:01
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `megacasting`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonceur`
--

CREATE TABLE IF NOT EXISTS `annonceur` (
  `id_annonceur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_annonceur` varchar(100) NOT NULL,
  `id_information` int(11) NOT NULL,
  PRIMARY KEY (`id_annonceur`),
  KEY `id_information` (`id_information`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `annonceur`
--


-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE IF NOT EXISTS `contrat` (
  `id_contrat` int(11) NOT NULL AUTO_INCREMENT,
  `lib_contrat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_contrat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `contrat`
--


-- --------------------------------------------------------

--
-- Structure de la table `diffuseur`
--

CREATE TABLE IF NOT EXISTS `diffuseur` (
  `id_diffuseur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_diffuseur` varchar(100) NOT NULL,
  `id_information` int(11) NOT NULL,
  PRIMARY KEY (`id_diffuseur`),
  KEY `id_information` (`id_information`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `diffuseur`
--


-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE IF NOT EXISTS `domaine` (
  `id_domaine` int(11) NOT NULL AUTO_INCREMENT,
  `lib_domaine` varchar(50) NOT NULL,
  PRIMARY KEY (`id_domaine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `domaine`
--


-- --------------------------------------------------------

--
-- Structure de la table `domaine_annonceur`
--

CREATE TABLE IF NOT EXISTS `domaine_annonceur` (
  `id_domaine` int(11) NOT NULL,
  `id_annonceur` int(11) NOT NULL,
  PRIMARY KEY (`id_domaine`,`id_annonceur`),
  KEY `id_annonceur` (`id_annonceur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `domaine_annonceur`
--


-- --------------------------------------------------------

--
-- Structure de la table `domaine_metier`
--

CREATE TABLE IF NOT EXISTS `domaine_metier` (
  `id_domaine` int(11) NOT NULL,
  `id_metier` int(11) NOT NULL,
  PRIMARY KEY (`id_domaine`,`id_metier`),
  KEY `id_metier` (`id_metier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `domaine_metier`
--


-- --------------------------------------------------------

--
-- Structure de la table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `id_information` int(11) NOT NULL AUTO_INCREMENT,
  `mail_information` varchar(100) NOT NULL,
  `tel_fixe_information` int(10) NOT NULL,
  `tel_port_information` int(10) NOT NULL,
  `rue_information` varchar(50) NOT NULL,
  `ville_information` varchar(50) NOT NULL,
  `cp_information` int(5) NOT NULL,
  `pays_information` varchar(35) NOT NULL,
  PRIMARY KEY (`id_information`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `information`
--


-- --------------------------------------------------------

--
-- Structure de la table `metier`
--

CREATE TABLE IF NOT EXISTS `metier` (
  `id_metier` int(11) NOT NULL AUTO_INCREMENT,
  `lib_metier` int(11) NOT NULL,
  PRIMARY KEY (`id_metier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `metier`
--


-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

CREATE TABLE IF NOT EXISTS `offre` (
  `id_offre` int(11) NOT NULL AUTO_INCREMENT,
  `int_offre` varchar(50) NOT NULL,
  `ref_offre` varchar(100) NOT NULL,
  `date_offre` date NOT NULL,
  `duree_offre` int(5) NOT NULL,
  `date_deb_offre` date NOT NULL,
  `loc_offre` varchar(150) NOT NULL,
  `desc_poste_offre` varchar(3000) NOT NULL,
  `desc_profil_offre` varchar(3000) NOT NULL,
  `id_annonceur` int(11) NOT NULL,
  `id_contrat` int(11) NOT NULL,
  `id_metier` int(11) NOT NULL,
  `id_domaine` int(11) NOT NULL,
  PRIMARY KEY (`id_offre`),
  KEY `id_annonceur` (`id_annonceur`),
  KEY `id_contrat` (`id_contrat`),
  KEY `id_metier` (`id_metier`),
  KEY `id_domaine` (`id_domaine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `offre`
--


-- --------------------------------------------------------

--
-- Structure de la table `offre_diffuseur`
--

CREATE TABLE IF NOT EXISTS `offre_diffuseur` (
  `id_offre` int(11) NOT NULL,
  `id_diffuseur` int(11) NOT NULL,
  PRIMARY KEY (`id_offre`,`id_diffuseur`),
  KEY `id_diffuseur` (`id_diffuseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `offre_diffuseur`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `annonceur`
--
ALTER TABLE `annonceur`
  ADD CONSTRAINT `annonceur_ibfk_1` FOREIGN KEY (`id_information`) REFERENCES `information` (`id_information`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `diffuseur`
--
ALTER TABLE `diffuseur`
  ADD CONSTRAINT `diffuseur_ibfk_1` FOREIGN KEY (`id_information`) REFERENCES `information` (`id_information`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `domaine_annonceur`
--
ALTER TABLE `domaine_annonceur`
  ADD CONSTRAINT `domaine_annonceur_ibfk_2` FOREIGN KEY (`id_annonceur`) REFERENCES `annonceur` (`id_annonceur`),
  ADD CONSTRAINT `domaine_annonceur_ibfk_1` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`);

--
-- Contraintes pour la table `domaine_metier`
--
ALTER TABLE `domaine_metier`
  ADD CONSTRAINT `domaine_metier_ibfk_2` FOREIGN KEY (`id_metier`) REFERENCES `metier` (`id_metier`),
  ADD CONSTRAINT `domaine_metier_ibfk_1` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`);

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `offre_ibfk_1` FOREIGN KEY (`id_annonceur`) REFERENCES `annonceur` (`id_annonceur`),
  ADD CONSTRAINT `offre_ibfk_2` FOREIGN KEY (`id_contrat`) REFERENCES `contrat` (`id_contrat`),
  ADD CONSTRAINT `offre_ibfk_3` FOREIGN KEY (`id_metier`) REFERENCES `metier` (`id_metier`),
  ADD CONSTRAINT `offre_ibfk_4` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`);

--
-- Contraintes pour la table `offre_diffuseur`
--
ALTER TABLE `offre_diffuseur`
  ADD CONSTRAINT `offre_diffuseur_ibfk_2` FOREIGN KEY (`id_diffuseur`) REFERENCES `diffuseur` (`id_diffuseur`),
  ADD CONSTRAINT `offre_diffuseur_ibfk_1` FOREIGN KEY (`id_offre`) REFERENCES `offre` (`id_offre`);
