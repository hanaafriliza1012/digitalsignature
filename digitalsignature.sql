-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2022 at 03:53 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digitalsignature`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

CREATE TABLE `dokumen` (
  `id_dokumen` int(11) UNSIGNED NOT NULL,
  `id_kegiatan` int(11) UNSIGNED NOT NULL,
  `signature_pad` varchar(255) NOT NULL,
  `qr_code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokumen`
--

INSERT INTO `dokumen` (`id_dokumen`, `id_kegiatan`, `signature_pad`, `qr_code`, `created_at`, `updated_at`) VALUES
(10, 3, 'pic_20220625171002.png', 'qr_20220625171002.png', '2022-06-25 17:10:02', '2022-06-25 17:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(11) UNSIGNED NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `tema_kegiatan` varchar(255) NOT NULL,
  `tanggal_kegiatan` date DEFAULT NULL,
  `pemateri` varchar(255) NOT NULL,
  `gambar_kegiatan` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id_kegiatan`, `nama_kegiatan`, `tema_kegiatan`, `tanggal_kegiatan`, `pemateri`, `gambar_kegiatan`, `status`) VALUES
(1, 'AI for Junior Developer', 'Tetap Navigation Bar. Membuat navigasi bar tinggal di bagian atas atau bawah halaman, bahkan ketika pengguna gulungan halaman.', '2022-06-15', 'Nicholas Saputra', 'background.jpg', '1'),
(2, 'React For Junior Developer', 'Tetap Navigation Bar. Membuat navigasi bar tinggal di bagian atas atau bawah halaman, bahkan ketika pengguna gulungan halaman', '2022-06-15', 'Nadim Makarim', 'background.jpg', '1'),
(3, 'JS for Junior Developer', 'navigasi bar tinggal di bagian atas atau bawah halaman, bahkan ketika pengguna gulungan halaman', '2022-06-16', 'Jonathan Christie', 'background.jpg', '2'),
(4, 'Flutter for Junior Developer', 'Applying DevOps in Flutter Mobile Development', '2022-06-18', 'Robert Budi', 'background.jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_peserta`
--

CREATE TABLE `kegiatan_peserta` (
  `id_kegiatan_peserta` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kegiatan_peserta`
--

INSERT INTO `kegiatan_peserta` (`id_kegiatan_peserta`, `id_peserta`, `id_kegiatan`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 3),
(8, 8, 3),
(9, 9, 3),
(10, 10, 4),
(11, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pernyataan_dokumen`
--

CREATE TABLE `pernyataan_dokumen` (
  `id_pernyataan_dokumen` int(11) UNSIGNED NOT NULL,
  `id_pernyataan_kegiatan` int(11) UNSIGNED NOT NULL,
  `signature_pad` varchar(255) NOT NULL,
  `qr_code` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pernyataan_dokumen`
--

INSERT INTO `pernyataan_dokumen` (`id_pernyataan_dokumen`, `id_pernyataan_kegiatan`, `signature_pad`, `qr_code`, `created_at`, `updated_at`) VALUES
(5, 2, 'pic_20220625113441.png', 'qr_20220625113441.png', '2022-06-25 11:34:41', '2022-06-25 11:34:41');

-- --------------------------------------------------------

--
-- Table structure for table `pernyataan_kegiatan`
--

CREATE TABLE `pernyataan_kegiatan` (
  `id_pernyataan_kegiatan` int(11) UNSIGNED NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nama_penandatangan` varchar(255) NOT NULL,
  `jabatan_penandatangan` varchar(255) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pernyataan_kegiatan`
--

INSERT INTO `pernyataan_kegiatan` (`id_pernyataan_kegiatan`, `keterangan`, `tanggal`, `nama_penandatangan`, `jabatan_penandatangan`, `status`) VALUES
(2, 'Surat Pernyataan Berkelakuan Baik', '2022-06-25', 'Jonathan Christie', 'Ketua Jurusan', 2),
(4, 'Surat Pernyataan Layak Beasiswa', '2022-06-25', 'Robert Agustin', 'Ketua Jurusan', 1),
(5, 'Surat Pernyataan Aktif Kuliah', '2022-06-25', 'Noval Bachdim', 'Ketua Jurusan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pernyataan_kegiatan_peserta`
--

CREATE TABLE `pernyataan_kegiatan_peserta` (
  `id_pernyataan_kegiatan_peserta` int(11) NOT NULL,
  `id_pernyataan_kegiatan` int(11) NOT NULL,
  `id_pernyataan_peserta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pernyataan_kegiatan_peserta`
--

INSERT INTO `pernyataan_kegiatan_peserta` (`id_pernyataan_kegiatan_peserta`, `id_pernyataan_kegiatan`, `id_pernyataan_peserta`) VALUES
(3, 2, 1),
(4, 2, 2),
(5, 4, 4),
(6, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pernyataan_peserta`
--

CREATE TABLE `pernyataan_peserta` (
  `id_pernyataan_peserta` int(11) UNSIGNED NOT NULL,
  `npm` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pernyataan_peserta`
--

INSERT INTO `pernyataan_peserta` (`id_pernyataan_peserta`, `npm`, `nama`, `jenis_kelamin`, `alamat`) VALUES
(1, '1817051012', 'Hana Afriliza', 'Perempuan', 'Ambarawa Barat, RT/RW 001/001, Pringsewu, Lampung'),
(2, '1817051001', 'Lita Amelia', 'Perempuan', 'Bumi Manti I, Kp. Baru, Kedaton, Bandar Lampung'),
(3, '1817051039', 'Windy Desty Ariany', 'Perempuan', 'Kemiling Jaya, Kota Bandar Lampung'),
(4, '1817051028', 'Muhamad Sepryan Astrayesa', 'Laki-laki', 'Jatimulyo, Kabupaten Lampung Selatan');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int(11) UNSIGNED NOT NULL,
  `nama_peserta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `nama_peserta`) VALUES
(1, 'Hana Afriliza'),
(2, 'Lita Amelia'),
(3, 'Windy Desty Ariany'),
(4, 'Jonathan Michael'),
(5, 'Suci Hasanah Bertha'),
(6, 'Sassya Salsabilla'),
(7, 'Rahmayanti Kurniasih'),
(8, 'Ahmad Julio Rizky'),
(9, 'Aulia Ahmad Nabil'),
(10, 'Melinda Saputri'),
(11, 'Yuni Isnaini Asifah');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id_dokumen`),
  ADD KEY `kegiatan_id_kegiatan_foreign` (`id_kegiatan`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

--
-- Indexes for table `kegiatan_peserta`
--
ALTER TABLE `kegiatan_peserta`
  ADD PRIMARY KEY (`id_kegiatan_peserta`);

--
-- Indexes for table `pernyataan_dokumen`
--
ALTER TABLE `pernyataan_dokumen`
  ADD PRIMARY KEY (`id_pernyataan_dokumen`);

--
-- Indexes for table `pernyataan_kegiatan`
--
ALTER TABLE `pernyataan_kegiatan`
  ADD PRIMARY KEY (`id_pernyataan_kegiatan`);

--
-- Indexes for table `pernyataan_kegiatan_peserta`
--
ALTER TABLE `pernyataan_kegiatan_peserta`
  ADD PRIMARY KEY (`id_pernyataan_kegiatan_peserta`);

--
-- Indexes for table `pernyataan_peserta`
--
ALTER TABLE `pernyataan_peserta`
  ADD PRIMARY KEY (`id_pernyataan_peserta`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id_dokumen` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kegiatan_peserta`
--
ALTER TABLE `kegiatan_peserta`
  MODIFY `id_kegiatan_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pernyataan_dokumen`
--
ALTER TABLE `pernyataan_dokumen`
  MODIFY `id_pernyataan_dokumen` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pernyataan_kegiatan`
--
ALTER TABLE `pernyataan_kegiatan`
  MODIFY `id_pernyataan_kegiatan` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pernyataan_kegiatan_peserta`
--
ALTER TABLE `pernyataan_kegiatan_peserta`
  MODIFY `id_pernyataan_kegiatan_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pernyataan_peserta`
--
ALTER TABLE `pernyataan_peserta`
  MODIFY `id_pernyataan_peserta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id_peserta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD CONSTRAINT `kegiatan_id_kegiatan_foreign` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
