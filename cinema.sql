-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: iul. 31, 2024 la 08:35 PM
-- Versiune server: 10.4.32-MariaDB
-- Versiune PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `cinema`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `bilete`
--

CREATE TABLE `bilete` (
  `idBilet` int(11) NOT NULL,
  `idScaun` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `idFilm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `bilete`
--

INSERT INTO `bilete` (`idBilet`, `idScaun`, `idClient`, `idFilm`) VALUES
(30, 38, 59, 27),
(31, 28, 60, 17);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `Nume` varchar(70) NOT NULL,
  `Prenume` varchar(100) NOT NULL,
  `CNP` int(11) NOT NULL,
  `NrTelefon` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `client`
--

INSERT INTO `client` (`idClient`, `Nume`, `Prenume`, `CNP`, `NrTelefon`, `Email`) VALUES
(59, 'Tabac', 'Eduard', 2147483647, 321321321, 'tabac@eduard.com'),
(60, 'Eduard', 'Ionut', 33, 7325211, 'eduard@tabac.com');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `filme`
--

CREATE TABLE `filme` (
  `idFilm` int(11) NOT NULL,
  `Titlu` varchar(200) NOT NULL,
  `Regizor` varchar(100) NOT NULL,
  `Gen` varchar(50) NOT NULL,
  `Descriere` varchar(200) NOT NULL,
  `AnLansare` int(11) NOT NULL,
  `Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `filme`
--

INSERT INTO `filme` (`idFilm`, `Titlu`, `Regizor`, `Gen`, `Descriere`, `AnLansare`, `Rating`) VALUES
(17, 'Rush', 'Tabac', 'Drama', 'Curse', 2013, 10),
(18, 'Ford V Ferrari', 'Eduard', 'Drama', 'Curse', 2019, 10),
(20, 'Batman', 'Chris', 'Actiune', 'Fight', 1990, 5),
(24, 'Heat', 'De Niro', 'Actiune', 'Actiune', 1995, 10),
(26, 'GoodFellas', 'De Niro', 'Actiune', 'Mafie', 1990, 10),
(27, 'Iron Man', 'Iron Man', 'Roboti', 'Bataie', 2008, 8);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `scaune`
--

CREATE TABLE `scaune` (
  `idScaun` int(11) NOT NULL,
  `Numar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `scaune`
--

INSERT INTO `scaune` (`idScaun`, `Numar`) VALUES
(1, 1),
(28, 2),
(29, 3),
(33, 4),
(37, 5),
(38, 6);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `bilete`
--
ALTER TABLE `bilete`
  ADD PRIMARY KEY (`idBilet`),
  ADD KEY `FK_bilete_scaune` (`idScaun`),
  ADD KEY `FK_bilete_client` (`idClient`),
  ADD KEY `FK_bilete_filme` (`idFilm`);

--
-- Indexuri pentru tabele `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `IDX_NrTelefon` (`NrTelefon`),
  ADD UNIQUE KEY `IDX_CNP` (`CNP`),
  ADD UNIQUE KEY `IDX_Email` (`Email`);

--
-- Indexuri pentru tabele `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`idFilm`);

--
-- Indexuri pentru tabele `scaune`
--
ALTER TABLE `scaune`
  ADD PRIMARY KEY (`idScaun`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `bilete`
--
ALTER TABLE `bilete`
  MODIFY `idBilet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pentru tabele `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pentru tabele `filme`
--
ALTER TABLE `filme`
  MODIFY `idFilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pentru tabele `scaune`
--
ALTER TABLE `scaune`
  MODIFY `idScaun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `bilete`
--
ALTER TABLE `bilete`
  ADD CONSTRAINT `FK_bilete_client` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_bilete_filme` FOREIGN KEY (`idFilm`) REFERENCES `filme` (`idFilm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_bilete_scaune` FOREIGN KEY (`idScaun`) REFERENCES `scaune` (`idScaun`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
