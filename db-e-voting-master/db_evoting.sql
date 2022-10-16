-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2022 at 07:27 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_evoting`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `level` enum('administrator','operator') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`, `id_fakultas`, `level`) VALUES
(1, 'admin', '$2y$10$vXweJwTP9X6BrdQ/QHSiTOKLdrkzvNq09qJhxOOKNnbIXOE5XP6zq', 0, 'administrator'),
(33, 'mesin', '$2y$10$f3IYVEgVUFc.NxKmmYxdl.oOLYG4i1umkMIOWDWKK4Gpy8h3vGV7S', 21, 'operator');

-- --------------------------------------------------------

--
-- Table structure for table `tb_calon`
--

CREATE TABLE `tb_calon` (
  `id_calon` int(11) NOT NULL,
  `fakultas_calon_presma` varchar(128) NOT NULL,
  `fakultas_calon_wapresma` varchar(128) NOT NULL,
  `nim_calon_presma` varchar(10) NOT NULL,
  `nim_calon_wapresma` varchar(10) NOT NULL,
  `calon_presma` varchar(20) NOT NULL,
  `calon_wakil_presma` varchar(20) NOT NULL,
  `visi_misi` text NOT NULL,
  `gambar` varchar(128) NOT NULL,
  `video` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_calon`
--

INSERT INTO `tb_calon` (`id_calon`, `fakultas_calon_presma`, `fakultas_calon_wapresma`, `nim_calon_presma`, `nim_calon_wapresma`, `calon_presma`, `calon_wakil_presma`, `visi_misi`, `gambar`, `video`) VALUES
(7, 'TEKNIK MESIN', 'TEKNIK KOMPUTER', '0620802469', '0653697849', 'ABDURRAHMAN FAQIH', 'M. BAKHARA ALIEF RAC', 'Menjadikan BEM FEB UGM sebagai lembaga yang interaktif  kepada mahasiswa dan masyarakat untuk bersinergi dalam menciptakan inovasi.\r\n', 'c64523b448a595bedae2e3a95c7c2c7e.png', '34c5961ebaaf38aecfea3f71fd1a9fa1.mp4'),
(8, 'TEKNIK KIMIA', 'TEKNIK KOMPUTER', '0620405986', '0620547185', 'RIDHO MAHENDRA', 'RIZKI PRASETYO', 'Mewujudkan BEM FEB UM yang independen menjalankan fungsi eksekutif,memberikan atensi dan menjadi lembaga yang konstruktif terhadap pengembangan bakat dan minat mahasiswa serta solutif dan kritis terhadap problematika yang terjadi di lingkungan FEB.', '68ceab9f7d54f37aa287e8cb4c921f55.jpg', 'a1fefcede88c1b9d8561ac81bc295cae.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fakultas`
--

CREATE TABLE `tb_fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `nama_fakultas` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_fakultas`
--

INSERT INTO `tb_fakultas` (`id_fakultas`, `nama_fakultas`) VALUES
(21, 'TEKNIK MESIN'),
(22, 'TEKNIK ELEKTRO'),
(23, 'TEKNIK KIMIA'),
(24, 'TEKNIK SIPIL'),
(25, 'TEKNIK KOMPUTER'),
(26, 'MANAJAMEN INFORMATIKA');

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil_suara`
--

CREATE TABLE `tb_hasil_suara` (
  `id_hasil` int(11) NOT NULL,
  `id_pemilih` int(11) NOT NULL,
  `id_calon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_hasil_suara`
--

INSERT INTO `tb_hasil_suara` (`id_hasil`, `id_pemilih`, `id_calon`) VALUES
(18, 177, 7),
(19, 178, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemilih`
--

CREATE TABLE `tb_pemilih` (
  `id_pemilih` int(11) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pemilih`
--

INSERT INTO `tb_pemilih` (`id_pemilih`, `id_fakultas`, `nim`, `nama`, `email`, `password`) VALUES
(177, 21, '062030701734', 'Muhamamd Agus Setiawan', 'agus@gmail.com', '$2y$10$hKzsqS4xj7F6XkMSR/0pQuBzyzx3qZ6.ebwdxGi8QtmSoSFPlKJYS'),
(178, 21, '062030701735', 'Dimas', 'contoh@gmail.com', '$2y$10$AB0Iqu1m7qbhmKS0GAs/qOaGQnbdVFTdaiVpL6OKDL8TUaXRst60e');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemilihan`
--

CREATE TABLE `tb_pemilihan` (
  `id_pemilihan` int(11) NOT NULL,
  `mulai_pemilihan` int(11) NOT NULL,
  `akhir_pemilihan` int(11) NOT NULL,
  `status` enum('aktif','nonaktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pemilihan`
--

INSERT INTO `tb_pemilihan` (`id_pemilihan`, `mulai_pemilihan`, `akhir_pemilihan`, `status`) VALUES
(1, 1665891435, 1665977835, 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_calon`
--
ALTER TABLE `tb_calon`
  ADD PRIMARY KEY (`id_calon`);

--
-- Indexes for table `tb_fakultas`
--
ALTER TABLE `tb_fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indexes for table `tb_hasil_suara`
--
ALTER TABLE `tb_hasil_suara`
  ADD PRIMARY KEY (`id_hasil`),
  ADD UNIQUE KEY `ID_pemilih_2` (`id_pemilih`),
  ADD KEY `ID_pemilih` (`id_pemilih`),
  ADD KEY `ID_calon` (`id_calon`);

--
-- Indexes for table `tb_pemilih`
--
ALTER TABLE `tb_pemilih`
  ADD PRIMARY KEY (`id_pemilih`),
  ADD UNIQUE KEY `NIM` (`nim`);

--
-- Indexes for table `tb_pemilihan`
--
ALTER TABLE `tb_pemilihan`
  ADD PRIMARY KEY (`id_pemilihan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tb_calon`
--
ALTER TABLE `tb_calon`
  MODIFY `id_calon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_fakultas`
--
ALTER TABLE `tb_fakultas`
  MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_hasil_suara`
--
ALTER TABLE `tb_hasil_suara`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_pemilih`
--
ALTER TABLE `tb_pemilih`
  MODIFY `id_pemilih` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `tb_pemilihan`
--
ALTER TABLE `tb_pemilihan`
  MODIFY `id_pemilihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
