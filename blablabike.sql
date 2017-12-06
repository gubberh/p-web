-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2017 at 03:20 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blablabike`
--

-- --------------------------------------------------------

--
-- Table structure for table `annuncio`
--

CREATE TABLE `annuncio` (
  `Id_ann` int(20) NOT NULL,
  `Venditore` varchar(20) NOT NULL,
  `Bici` int(20) NOT NULL,
  `Titolo` varchar(40) NOT NULL,
  `Descriz_ann` text NOT NULL,
  `Prezzo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bicicletta`
--

CREATE TABLE `bicicletta` (
  `Cod_Bici` int(20) NOT NULL,
  `Proprietario` varchar(20) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Tipo` enum('MTB','Corsa') NOT NULL,
  `Colore` varchar(20) NOT NULL,
  `Peso` decimal(10,0) DEFAULT NULL,
  `Dim_Ruote` enum('26"','27,5"','29"') DEFAULT NULL,
  `Anno_prod` year(4) NOT NULL,
  `Anno_acq` year(4) NOT NULL,
  `Descrizione` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commento`
--

CREATE TABLE `commento` (
  `Utente_com` varchar(20) NOT NULL,
  `Annuncio_com` int(20) NOT NULL,
  `Data_ora_com` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Testo_com` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `partecipa`
--

CREATE TABLE `partecipa` (
  `Bici_utente` int(20) NOT NULL,
  `Nome_utente` varchar(20) NOT NULL,
  `Cod_uscita` int(20) NOT NULL,
  `Valutazione` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `segue`
--

CREATE TABLE `segue` (
  `Follower` varchar(20) NOT NULL,
  `Following` varchar(20) NOT NULL,
  `Data_follow` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tappa`
--

CREATE TABLE `tappa` (
  `Cod_uscita` int(20) NOT NULL,
  `n_tappa` int(15) NOT NULL,
  `tipo_tappa` set('Salita','Discesa','Pianeggiante') NOT NULL,
  `Lunghezza` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uscite`
--

CREATE TABLE `uscite` (
  `id_uscita` int(11) NOT NULL,
  `Titolo` varchar(40) NOT NULL,
  `Organizzatore` varchar(20) NOT NULL,
  `Tipologia` set('Corsa','MTB') NOT NULL,
  `Difficolta` enum('Principiante','Intermedio','Esperto') NOT NULL,
  `Distanza` float NOT NULL,
  `Dislivello` float DEFAULT NULL,
  `Luogo_rit` varchar(30) NOT NULL,
  `Data_ora_rit` datetime NOT NULL,
  `n_tappe` int(15) NOT NULL,
  `Note` text,
  `Visibilita` set('Pubblica','Privata') NOT NULL,
  `Valutazione` set('0','1','2','3','4','5') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utente`
--

CREATE TABLE `utente` (
  `Nickname` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `Sesso` enum('M','F') NOT NULL,
  `Data_nascita` date NOT NULL,
  `Luogo_nascita` varchar(20) NOT NULL,
  `Residenza` int(50) NOT NULL,
  `Livello` enum('Principiante','Intermedio','Esperto') NOT NULL DEFAULT 'Principiante'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annuncio`
--
ALTER TABLE `annuncio`
  ADD PRIMARY KEY (`Id_ann`),
  ADD KEY `Venditore` (`Venditore`),
  ADD KEY `Bici` (`Bici`);

--
-- Indexes for table `bicicletta`
--
ALTER TABLE `bicicletta`
  ADD PRIMARY KEY (`Cod_Bici`),
  ADD KEY `Proprietario` (`Proprietario`);

--
-- Indexes for table `commento`
--
ALTER TABLE `commento`
  ADD PRIMARY KEY (`Utente_com`,`Annuncio_com`,`Data_ora_com`),
  ADD KEY `Annuncio_com` (`Annuncio_com`);

--
-- Indexes for table `partecipa`
--
ALTER TABLE `partecipa`
  ADD PRIMARY KEY (`Bici_utente`,`Nome_utente`,`Cod_uscita`),
  ADD KEY `Cod_uscita` (`Cod_uscita`),
  ADD KEY `partecipa_ibfk_2` (`Nome_utente`);

--
-- Indexes for table `segue`
--
ALTER TABLE `segue`
  ADD PRIMARY KEY (`Follower`,`Following`),
  ADD KEY `Following` (`Following`);

--
-- Indexes for table `tappa`
--
ALTER TABLE `tappa`
  ADD PRIMARY KEY (`Cod_uscita`,`n_tappa`);

--
-- Indexes for table `uscite`
--
ALTER TABLE `uscite`
  ADD PRIMARY KEY (`id_uscita`),
  ADD KEY `Organizzatore` (`Organizzatore`);

--
-- Indexes for table `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`Nickname`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annuncio`
--
ALTER TABLE `annuncio`
  MODIFY `Id_ann` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bicicletta`
--
ALTER TABLE `bicicletta`
  MODIFY `Cod_Bici` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uscite`
--
ALTER TABLE `uscite`
  MODIFY `id_uscita` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `annuncio`
--
ALTER TABLE `annuncio`
  ADD CONSTRAINT `annuncio_ibfk_1` FOREIGN KEY (`Venditore`) REFERENCES `utente` (`Nickname`),
  ADD CONSTRAINT `annuncio_ibfk_2` FOREIGN KEY (`Bici`) REFERENCES `bicicletta` (`Cod_Bici`);

--
-- Constraints for table `bicicletta`
--
ALTER TABLE `bicicletta`
  ADD CONSTRAINT `bicicletta_ibfk_1` FOREIGN KEY (`Proprietario`) REFERENCES `utente` (`Nickname`);

--
-- Constraints for table `commento`
--
ALTER TABLE `commento`
  ADD CONSTRAINT `commento_ibfk_1` FOREIGN KEY (`Utente_com`) REFERENCES `utente` (`Nickname`),
  ADD CONSTRAINT `commento_ibfk_2` FOREIGN KEY (`Annuncio_com`) REFERENCES `annuncio` (`Id_ann`);

--
-- Constraints for table `partecipa`
--
ALTER TABLE `partecipa`
  ADD CONSTRAINT `partecipa_ibfk_1` FOREIGN KEY (`Bici_utente`) REFERENCES `bicicletta` (`Cod_Bici`),
  ADD CONSTRAINT `partecipa_ibfk_2` FOREIGN KEY (`Nome_utente`) REFERENCES `utente` (`Nickname`),
  ADD CONSTRAINT `partecipa_ibfk_3` FOREIGN KEY (`Cod_uscita`) REFERENCES `uscite` (`id_uscita`);

--
-- Constraints for table `segue`
--
ALTER TABLE `segue`
  ADD CONSTRAINT `segue_ibfk_1` FOREIGN KEY (`Follower`) REFERENCES `utente` (`Nickname`),
  ADD CONSTRAINT `segue_ibfk_2` FOREIGN KEY (`Following`) REFERENCES `utente` (`Nickname`);

--
-- Constraints for table `tappa`
--
ALTER TABLE `tappa`
  ADD CONSTRAINT `tappa_ibfk_1` FOREIGN KEY (`Cod_uscita`) REFERENCES `uscite` (`id_uscita`);

--
-- Constraints for table `uscite`
--
ALTER TABLE `uscite`
  ADD CONSTRAINT `uscite_ibfk_1` FOREIGN KEY (`Organizzatore`) REFERENCES `utente` (`Nickname`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
