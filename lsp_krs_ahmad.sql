-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2022 at 11:38 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lsp_krs_ahmad`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` int(11) UNSIGNED NOT NULL,
  `nama` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama`) VALUES
(1, 'Agus Mulyanto, S.Si., M.Kom.'),
(2, 'Ir. Sumarsono, S.T., M.Kom.');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(11) UNSIGNED NOT NULL,
  `nama` varchar(126) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`) VALUES
(1, 'Ahmad Dwi Yanuara Nugroho'),
(2, 'Syauqi Muhammad Abrar');

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(256) NOT NULL,
  `waktu` int(10) UNSIGNED NOT NULL,
  `dosen` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id`, `nama`, `waktu`, `dosen`) VALUES
(3, 'Pemrograman Web', 1, 2),
(4, 'Metode Penelitian', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mhs_mk`
--

CREATE TABLE `mhs_mk` (
  `mahasiswa` int(10) UNSIGNED NOT NULL,
  `matkul` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mhs_mk`
--

INSERT INTO `mhs_mk` (`mahasiswa`, `matkul`) VALUES
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `id` int(10) UNSIGNED NOT NULL,
  `ruang` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id`, `ruang`) VALUES
(1, 'FST-101'),
(2, 'FST-102');

-- --------------------------------------------------------

--
-- Table structure for table `waktu`
--

CREATE TABLE `waktu` (
  `id` int(10) UNSIGNED NOT NULL,
  `waktu` varchar(64) NOT NULL,
  `ruang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waktu`
--

INSERT INTO `waktu` (`id`, `waktu`, `ruang`) VALUES
(1, '08:00 - 08:40', 1),
(2, '09:00 - 11.30', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `waktu` (`waktu`),
  ADD KEY `dosen` (`dosen`);

--
-- Indexes for table `mhs_mk`
--
ALTER TABLE `mhs_mk`
  ADD KEY `mahasiswa` (`mahasiswa`),
  ADD KEY `matkul` (`matkul`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waktu`
--
ALTER TABLE `waktu`
  ADD PRIMARY KEY (`id`,`ruang`),
  ADD KEY `ruang` (`ruang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `nip` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `nim` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `waktu`
--
ALTER TABLE `waktu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `dosen` FOREIGN KEY (`dosen`) REFERENCES `dosen` (`nip`),
  ADD CONSTRAINT `waktu` FOREIGN KEY (`waktu`) REFERENCES `waktu` (`id`);

--
-- Constraints for table `mhs_mk`
--
ALTER TABLE `mhs_mk`
  ADD CONSTRAINT `mahasiswa` FOREIGN KEY (`mahasiswa`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `matkul` FOREIGN KEY (`matkul`) REFERENCES `matkul` (`id`);

--
-- Constraints for table `waktu`
--
ALTER TABLE `waktu`
  ADD CONSTRAINT `ruang` FOREIGN KEY (`ruang`) REFERENCES `ruang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
