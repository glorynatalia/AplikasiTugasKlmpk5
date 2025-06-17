-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2025 at 04:57 AM
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
-- Database: `aplikasitugas`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idKategori` int(10) NOT NULL,
  `NamaKategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`) VALUES
(1, 'admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `idTugas` int(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `deadline` date NOT NULL,
  `status` enum('Selesai','Belum Selesai','Terlambat','') NOT NULL DEFAULT 'Belum Selesai',
  `prioritas` enum('Tinggi','Sedang','Rendah','') NOT NULL,
  `id_kategori` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`idTugas`, `judul`, `deadline`, `status`, `prioritas`, `id_kategori`) VALUES
(0, 'Projek', '2025-06-11', 'Belum Selesai', 'Tinggi', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tugas_belum_selesai`
-- (See below for the actual view)
--
CREATE TABLE `view_tugas_belum_selesai` (
`idTugas` int(10)
,`judul` varchar(100)
,`deadline` date
,`status` enum('Selesai','Belum Selesai','Terlambat','')
,`prioritas` enum('Tinggi','Sedang','Rendah','')
,`id_kategori` int(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tugas_diproses`
-- (See below for the actual view)
--
CREATE TABLE `view_tugas_diproses` (
`idTugas` int(10)
,`judul` varchar(100)
,`deadline` date
,`status` enum('Selesai','Belum Selesai','Terlambat','')
,`prioritas` enum('Tinggi','Sedang','Rendah','')
,`id_kategori` int(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tugas_selesai`
-- (See below for the actual view)
--
CREATE TABLE `view_tugas_selesai` (
`idTugas` int(10)
,`judul` varchar(100)
,`deadline` date
,`status` enum('Selesai','Belum Selesai','Terlambat','')
,`prioritas` enum('Tinggi','Sedang','Rendah','')
,`id_kategori` int(10)
);

-- --------------------------------------------------------

--
-- Structure for view `view_tugas_belum_selesai`
--
DROP TABLE IF EXISTS `view_tugas_belum_selesai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_tugas_belum_selesai`  AS SELECT `tugas`.`idTugas` AS `idTugas`, `tugas`.`judul` AS `judul`, `tugas`.`deadline` AS `deadline`, `tugas`.`status` AS `status`, `tugas`.`prioritas` AS `prioritas`, `tugas`.`id_kategori` AS `id_kategori` FROM `tugas` WHERE `tugas`.`status` = 'Belum Selesai' ;

-- --------------------------------------------------------

--
-- Structure for view `view_tugas_diproses`
--
DROP TABLE IF EXISTS `view_tugas_diproses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_tugas_diproses`  AS SELECT `tugas`.`idTugas` AS `idTugas`, `tugas`.`judul` AS `judul`, `tugas`.`deadline` AS `deadline`, `tugas`.`status` AS `status`, `tugas`.`prioritas` AS `prioritas`, `tugas`.`id_kategori` AS `id_kategori` FROM `tugas` WHERE `tugas`.`status` = 'Diproses' ;

-- --------------------------------------------------------

--
-- Structure for view `view_tugas_selesai`
--
DROP TABLE IF EXISTS `view_tugas_selesai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_tugas_selesai`  AS SELECT `tugas`.`idTugas` AS `idTugas`, `tugas`.`judul` AS `judul`, `tugas`.`deadline` AS `deadline`, `tugas`.`status` AS `status`, `tugas`.`prioritas` AS `prioritas`, `tugas`.`id_kategori` AS `id_kategori` FROM `tugas` WHERE `tugas`.`status` = 'Selesai' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idKategori`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`idTugas`),
  ADD KEY `id_kategori_FK` (`id_kategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `id_kategori_FK` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`idKategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
