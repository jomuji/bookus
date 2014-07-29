-- phpMyAdmin SQL Dump
-- version 3.4.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 28, 2014 at 09:01 PM
-- Server version: 5.6.11
-- PHP Version: 5.4.24

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bookus`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_config` int(11) NOT NULL DEFAULT '0',
  `num_client` varchar(255) NOT NULL DEFAULT '',
  `prenom` varchar(255) NOT NULL DEFAULT '',
  `nom` varchar(255) NOT NULL DEFAULT '',
  `adresse` varchar(255) NOT NULL DEFAULT '',
  `ville` varchar(255) NOT NULL DEFAULT '',
  `province` varchar(255) NOT NULL DEFAULT '',
  `pays` varchar(255) NOT NULL DEFAULT '',
  `code_postal` varchar(255) NOT NULL DEFAULT '',
  `tel1` varchar(255) NOT NULL DEFAULT '',
  `tel2` varchar(255) NOT NULL DEFAULT '',
  `cell` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `courriel` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `id_config`, `num_client`, `prenom`, `nom`, `adresse`, `ville`, `province`, `pays`, `code_postal`, `tel1`, `tel2`, `cell`, `fax`, `courriel`) VALUES
(1, 1, '', 'fgh', 'ggg', 'hhh', 'hhj', '', '', '', 'jjj', '', 'hhh', 'fax', 'hhh'),
(2, 1, '', 'jjhkh', 'jkhjkhjkh', 'jkhjkhjkh', 'jkhjkhjh', '', '', '', 'jkhkjhjkh', '', 'kjhjkhkjh', 'fax', 'jkhkjhjkhk'),
(3, 1, '', 'pepe', 'muji', '29292', 'st-hubert', '', '', '', '555-4444', '', '555-5656', 'fax', 'pepe@mob.com'),
(4, 1, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 1, '', 'sjsdfhjfsd', 'jdjdjd', 'fg', 'f', '', '', '', 'f', '', 'ffff', '', 'fffff@nvnv.com'),
(6, 1, '', 'jhk', 'kjhkhkjh', 'kjhkjhkj', 'hjkhkh', '', '', '', 'jkhkhjkh', '', 'khkjh', 'fax', 'hfd@.'),
(7, 1, '', 'jhghg', 'hghjghj', 'ghjghjg', 'jhghjgjhg', '', '', '', 'hjghjgjh', '', 'ghjgjh', 'fax', 'jhgjgj@blabla.com'),
(8, 1, '', 'gjhgh', 'gjhgjhg', 'hjghjgjhg', 'jgjhghjg', '', '', '', 'hjgjhgjg', '', 'hjgjj', 'fax', 'meunier@hks.com'),
(9, 1, '', 'fhfh', 'fghfghf', 'ghfghf', 'ghfh', '', '', '', 'gfghfhgf', '', 'hgffh', 'fax', 'fhgfhg@jhdhd.com'),
(10, 1, '', 'hgjhgjhg', 'jhgjhgjh', 'hjgjhg', 'hjgjh', '', '', '', 'ghjgjhg', '', 'jhgjhg', 'fax', 'jgjhg@sss.com'),
(11, 1, '', 'jhgjkgh', 'gghjghjghjghjghghjg', 'jghghjg', 'hjgjhg', '', '', '', 'hjgjhgjh', '', 'ghjghjgghjgj', 'fax', 'jhjh@dhd.com'),
(12, 1, '', 'hjkhjkhjk', 'hjkhh', 'hkhjhk', 'hkjhjkhjk', '', '', '', 'hjkhh', '', 'kjhjkhk', 'fax', 'mdd@jdd.com'),
(13, 1, '', 'ghg', 'hjghjghj', 'ghjghjg', 'hjghgjh', '', '', '', 'ghjghjg', '', 'jhghgjg', 'fax', 'gjhghjg@ddd.com'),
(14, 1, '', 'hjhjkh', 'hjkhjkh', 'jkhjkhjkh', 'khkjhhjk', '', '', '', 'hkjhjkhjk', '', 'hkjhjhkjhk', 'fax', 'hjk@idd.com'),
(15, 1, '', 'hjhj', 'hkjhjkhjk', 'hkjhjkh', 'jkhkjhjk', '', '', '', 'hjkhjkh', '', 'jkhjhjk', 'fax', 'hkj@sss.com'),
(16, 1, '', 'kjfhj', 'jkhjk', 'hjkhk', 'jhjkh', '', '', '', 'jkhjkh', '', 'jkhjkh', 'fax', 'jkhk@dshd.com');

-- --------------------------------------------------------

--
-- Table structure for table `closedday`
--

CREATE TABLE IF NOT EXISTS `closedday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_config` int(11) NOT NULL DEFAULT '0',
  `jour` varchar(255) NOT NULL DEFAULT '',
  `mois` varchar(255) NOT NULL DEFAULT '',
  `annee` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) NOT NULL DEFAULT '',
  `ville` varchar(255) NOT NULL DEFAULT '',
  `province` varchar(255) NOT NULL DEFAULT '',
  `pays` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `courriel` varchar(255) NOT NULL DEFAULT '',
  `lundi` varchar(255) NOT NULL DEFAULT '',
  `mardi` varchar(255) NOT NULL DEFAULT '',
  `mercredi` varchar(255) NOT NULL DEFAULT '',
  `jeudi` varchar(255) NOT NULL DEFAULT '',
  `vendredi` varchar(255) NOT NULL DEFAULT '',
  `samedi` varchar(255) NOT NULL DEFAULT '',
  `dimanche` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `adresse`, `ville`, `province`, `pays`, `tel`, `fax`, `courriel`, `lundi`, `mardi`, `mercredi`, `jeudi`, `vendredi`, `samedi`, `dimanche`) VALUES
(1, '2222 Chemin Chambly', 'Saint-Hubert', 'Qu?bec', 'Canada', '444-5555', '555-4444', '', '7:00;17:00', '7:00;17:00', '7:00;17:00', '7:00;17:00', '7:00;17:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE IF NOT EXISTS `employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `id_config` int(11) NOT NULL DEFAULT '0',
  `lundi_debut` time DEFAULT NULL,
  `lundi_fin` time DEFAULT NULL,
  `mardi_debut` time DEFAULT NULL,
  `mardi_fin` time DEFAULT NULL,
  `mercredi_debut` time DEFAULT NULL,
  `mercredi_fin` time DEFAULT NULL,
  `jeudi_debut` time DEFAULT NULL,
  `jeudi_fin` time DEFAULT NULL,
  `vendredi_debut` time DEFAULT NULL,
  `vendredi_fin` time DEFAULT NULL,
  `samedi_debut` time DEFAULT NULL,
  `samedi_fin` time DEFAULT NULL,
  `dimanche_debut` time DEFAULT NULL,
  `dimanche_fin` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`id`, `nom`, `id_config`, `lundi_debut`, `lundi_fin`, `mardi_debut`, `mardi_fin`, `mercredi_debut`, `mercredi_fin`, `jeudi_debut`, `jeudi_fin`, `vendredi_debut`, `vendredi_fin`, `samedi_debut`, `samedi_fin`, `dimanche_debut`, `dimanche_fin`) VALUES
(5, 'Rita', 1, NULL, NULL, NULL, NULL, NULL, NULL, '07:00:00', '12:30:00', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `temps` int(11) NOT NULL DEFAULT '0',
  `id_config` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `nom`, `temps`, `id_config`) VALUES
(1, 'tune-up', 60, 1),
(2, 'TEST2', 15, 1),
(3, 'TEST3', 30, 1),
(4, 'TEST4', 60, 1),
(6, 'changement d''huile', 30, 1),
(7, 'TEST5', 120, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rendezvous`
--

CREATE TABLE IF NOT EXISTS `rendezvous` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_config` int(11) NOT NULL DEFAULT '0',
  `id_client` int(11) NOT NULL DEFAULT '0',
  `id_employe` int(11) NOT NULL DEFAULT '0',
  `id_job` int(11) NOT NULL DEFAULT '0',
  `debut` int(20) NOT NULL DEFAULT '0',
  `fin` int(20) NOT NULL DEFAULT '0',
  `code` varchar(255) NOT NULL DEFAULT '',
  `rappel` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `rendezvous`
--

INSERT INTO `rendezvous` (`id`, `id_config`, `id_client`, `id_employe`, `id_job`, `debut`, `fin`, `code`, `rappel`) VALUES
(1, 1, 13, 0, 1, 1026832500, 1026836100, '8f8c7cd5b94a63fce4322391d367b6c9', 0),
(2, 1, 13, 0, 1, 1026832500, 1026836100, '43e888b67a4fbbf2e7b4b71f40e83442', 0),
(3, 1, 13, 0, 1, 1026832500, 1026836100, 'bb51a832380f133775cb17252f62460e', 0),
(4, 1, 13, 0, 1, 1026832500, 1026836100, '46a1fd155dc7189e2dda4ef46be5accb', 0),
(5, 1, 13, 0, 1, 1026832500, 1026836100, '7a9da3e392f0024f280258ca5a663af8', 0),
(6, 1, 13, 0, 1, 1026832500, 1026836100, 'eae6b5fd6074fa6e4d38405c87a806f1', 0),
(7, 1, 14, 0, 1, 1026828900, 1026832500, 'd0d361ea1faa538884c98de10120509f', 0),
(8, 1, 14, 0, 1, 1026828900, 1026832500, '8f9a1f1a2e3e3908a4b532011d49bb56', 0),
(9, 1, 14, 0, 1, 1026828900, 1026832500, '73029ba632b408eba544d4514825b7c1', 0),
(10, 1, 15, 1, 1, 1026825300, 1026828900, '577d14b10f0f652f1c0870ae4640d702', 0),
(11, 1, 15, 1, 1, 1026825300, 1026828900, '05dd6d6cfb7c877cd1f07e3d667dcad1', 0),
(12, 1, 15, 2, 1, 1026825300, 1026828900, 'c09596da732910bdc793154cb8b991b9', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_config` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `droit` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_config`, `username`, `password`, `droit`) VALUES
(2, 2, 'jomuji', 'test', 2),
(3, 4, 'jose4', 'mp4', 2),
(4, 6, 'jose6', 'mp6', 3),
(5, 7, 'jose7', 'mp7', 2),
(6, 8, 'jose88', 'mp8', 1),
(7, 9, 'jose9', 'mp9', 9),
(8, 3, 'jose7', 'jose7', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
