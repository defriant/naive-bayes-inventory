-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jan 2022 pada 01.33
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_cupang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `created_at`, `updated_at`) VALUES
('CPGA-018', 'Avatar', '2022-01-22 06:36:48', '2022-01-22 06:36:48'),
('CPGBE-015', 'Big Ear', '2022-01-22 06:36:31', '2022-01-22 06:36:31'),
('CPGBR-001', 'Blue Rim', '2022-01-22 06:31:04', '2022-01-22 06:31:04'),
('CPGBS-005', 'Black Series', '2022-01-22 06:35:29', '2022-01-22 06:35:29'),
('CPGBS-006', 'Black Samurai', '2022-01-22 06:35:36', '2022-01-22 06:35:36'),
('CPGC-007', 'Cooper', '2022-01-22 06:35:42', '2022-01-22 06:35:42'),
('CPGC-014', 'Candy', '2022-01-22 06:36:24', '2022-01-22 06:36:24'),
('CPGDE-003', 'Dumbo Ear', '2022-01-22 06:34:53', '2022-01-22 06:34:53'),
('CPGF-017', 'Fancy', '2022-01-22 06:36:43', '2022-01-22 06:36:43'),
('CPGH-019', 'Hellboy', '2022-01-22 06:36:53', '2022-01-22 06:36:53'),
('CPGHM-002', 'Halfmoon', '2022-01-22 06:32:03', '2022-01-22 06:32:03'),
('CPGMC-004', 'Multi Color', '2022-01-22 06:35:21', '2022-01-22 06:35:21'),
('CPGNC-008', 'Nemo Classic', '2022-01-22 06:35:48', '2022-01-22 06:35:48'),
('CPGNC-011', 'Nemo Cooper', '2022-01-22 06:36:07', '2022-01-22 06:36:07'),
('CPGNG-013', 'Nemo Galaxy', '2022-01-22 06:36:19', '2022-01-22 06:36:19'),
('CPGNK-009', 'Nemo Koi', '2022-01-22 06:35:54', '2022-01-22 06:35:54'),
('CPGNM-012', 'Nemo Multi', '2022-01-22 06:36:13', '2022-01-22 06:36:13'),
('CPGP-016', 'Plakat', '2022-01-22 06:36:37', '2022-01-22 06:36:37'),
('CPGRD-020', 'Red Dragon', '2022-01-22 06:36:59', '2022-01-22 06:36:59'),
('CPGRK-010', 'Red Koi', '2022-01-22 06:36:01', '2022-01-22 06:36:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok`
--

CREATE TABLE `stok` (
  `id` bigint(20) NOT NULL,
  `periode` date NOT NULL,
  `id_produk` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `terjual` int(11) NOT NULL,
  `restock` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stok`
--

INSERT INTO `stok` (`id`, `periode`, `id_produk`, `nama`, `stok`, `terjual`, `restock`, `created_at`, `updated_at`) VALUES
(1, '2020-01-01', 'CPGBR-001', 'Blue Rim', 30, 15, 'no', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(2, '2020-01-01', 'CPGHM-002', 'Halfmoon', 50, 30, 'no', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(3, '2020-01-01', 'CPGDE-003', 'Dumbo Ear', 45, 40, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(4, '2020-01-01', 'CPGMC-004', 'Multi Color', 60, 60, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(5, '2020-01-01', 'CPGBS-005', 'Black Series', 55, 50, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(6, '2020-01-01', 'CPGBS-006', 'Black Samurai', 20, 15, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(7, '2020-01-01', 'CPGC-007', 'Cooper', 25, 10, 'no', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(8, '2020-01-01', 'CPGNC-008', 'Nemo Classic', 30, 25, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(9, '2020-01-01', 'CPGNK-009', 'Nemo Koi', 70, 50, 'no', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(10, '2020-01-01', 'CPGRK-010', 'Red Koi', 50, 40, 'no', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(11, '2020-01-01', 'CPGNC-011', 'Nemo Cooper', 40, 30, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(12, '2020-01-01', 'CPGNM-012', 'Nemo Multi', 85, 55, 'no', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(13, '2020-01-01', 'CPGNG-013', 'Nemo Galaxy', 15, 15, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(14, '2020-01-01', 'CPGC-014', 'Candy', 45, 30, 'no', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(15, '2020-01-01', 'CPGBE-015', 'Big Ear', 20, 20, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(16, '2020-01-01', 'CPGP-016', 'Plakat', 75, 70, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(17, '2020-01-01', 'CPGF-017', 'Fancy', 30, 20, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(18, '2020-01-01', 'CPGA-018', 'Avatar', 25, 15, 'no', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(19, '2020-01-01', 'CPGH-019', 'Hellboy', 65, 55, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(20, '2020-01-01', 'CPGRD-020', 'Red Dragon', 30, 20, 'no', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(21, '2020-02-01', 'CPGBR-001', 'Blue Rim', 20, 20, 'yes', '2022-01-22 08:08:41', '2022-01-22 17:56:18'),
(22, '2020-02-01', 'CPGHM-002', 'Halfmoon', 20, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(23, '2020-02-01', 'CPGDE-003', 'Dumbo Ear', 50, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(24, '2020-02-01', 'CPGMC-004', 'Multi Color', 40, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(25, '2020-02-01', 'CPGBS-005', 'Black Series', 45, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(26, '2020-02-01', 'CPGBS-006', 'Black Samurai', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(27, '2020-02-01', 'CPGC-007', 'Cooper', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(28, '2020-02-01', 'CPGNC-008', 'Nemo Classic', 55, 45, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(29, '2020-02-01', 'CPGNK-009', 'Nemo Koi', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(30, '2020-02-01', 'CPGRK-010', 'Red Koi', 20, 15, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(31, '2020-02-01', 'CPGNC-011', 'Nemo Cooper', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(32, '2020-02-01', 'CPGNM-012', 'Nemo Multi', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(33, '2020-02-01', 'CPGNG-013', 'Nemo Galaxy', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(34, '2020-02-01', 'CPGC-014', 'Candy', 40, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(35, '2020-02-01', 'CPGBE-015', 'Big Ear', 30, 25, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(36, '2020-02-01', 'CPGP-016', 'Plakat', 25, 15, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(37, '2020-02-01', 'CPGF-017', 'Fancy', 20, 15, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(38, '2020-02-01', 'CPGA-018', 'Avatar', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(39, '2020-02-01', 'CPGH-019', 'Hellboy', 30, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(40, '2020-02-01', 'CPGRD-020', 'Red Dragon', 40, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(41, '2020-03-01', 'CPGBR-001', 'Blue Rim', 50, 35, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(42, '2020-03-01', 'CPGHM-002', 'Halfmoon', 40, 40, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(43, '2020-03-01', 'CPGDE-003', 'Dumbo Ear', 30, 25, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(44, '2020-03-01', 'CPGMC-004', 'Multi Color', 70, 65, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(45, '2020-03-01', 'CPGBS-005', 'Black Series', 50, 40, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(46, '2020-03-01', 'CPGBS-006', 'Black Samurai', 30, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(47, '2020-03-01', 'CPGC-007', 'Cooper', 40, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(48, '2020-03-01', 'CPGNC-008', 'Nemo Classic', 30, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(49, '2020-03-01', 'CPGNK-009', 'Nemo Koi', 60, 60, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(50, '2020-03-01', 'CPGRK-010', 'Red Koi', 35, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(51, '2020-03-01', 'CPGNC-011', 'Nemo Cooper', 40, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(52, '2020-03-01', 'CPGNM-012', 'Nemo Multi', 75, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(53, '2020-03-01', 'CPGNG-013', 'Nemo Galaxy', 55, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(54, '2020-03-01', 'CPGC-014', 'Candy', 65, 55, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(55, '2020-03-01', 'CPGBE-015', 'Big Ear', 50, 40, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(56, '2020-03-01', 'CPGP-016', 'Plakat', 40, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(57, '2020-03-01', 'CPGF-017', 'Fancy', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(58, '2020-03-01', 'CPGA-018', 'Avatar', 50, 45, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(59, '2020-03-01', 'CPGH-019', 'Hellboy', 40, 35, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(60, '2020-03-01', 'CPGRD-020', 'Red Dragon', 80, 70, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(61, '2020-04-01', 'CPGBR-001', 'Blue Rim', 45, 40, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(62, '2020-04-01', 'CPGHM-002', 'Halfmoon', 80, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(63, '2020-04-01', 'CPGDE-003', 'Dumbo Ear', 45, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(64, '2020-04-01', 'CPGMC-004', 'Multi Color', 55, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(65, '2020-04-01', 'CPGBS-005', 'Black Series', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(66, '2020-04-01', 'CPGBS-006', 'Black Samurai', 45, 40, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(67, '2020-04-01', 'CPGC-007', 'Cooper', 90, 75, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(68, '2020-04-01', 'CPGNC-008', 'Nemo Classic', 45, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(69, '2020-04-01', 'CPGNK-009', 'Nemo Koi', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(70, '2020-04-01', 'CPGRK-010', 'Red Koi', 65, 55, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(71, '2020-04-01', 'CPGNC-011', 'Nemo Cooper', 60, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(72, '2020-04-01', 'CPGNM-012', 'Nemo Multi', 35, 35, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(73, '2020-04-01', 'CPGNG-013', 'Nemo Galaxy', 70, 60, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(74, '2020-04-01', 'CPGC-014', 'Candy', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(75, '2020-04-01', 'CPGBE-015', 'Big Ear', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(76, '2020-04-01', 'CPGP-016', 'Plakat', 85, 45, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(77, '2020-04-01', 'CPGF-017', 'Fancy', 55, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(78, '2020-04-01', 'CPGA-018', 'Avatar', 40, 35, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(79, '2020-04-01', 'CPGH-019', 'Hellboy', 70, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(80, '2020-04-01', 'CPGRD-020', 'Red Dragon', 50, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(81, '2020-05-01', 'CPGBR-001', 'Blue Rim', 80, 80, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(82, '2020-05-01', 'CPGHM-002', 'Halfmoon', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(83, '2020-05-01', 'CPGDE-003', 'Dumbo Ear', 30, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(84, '2020-05-01', 'CPGMC-004', 'Multi Color', 45, 45, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(85, '2020-05-01', 'CPGBS-005', 'Black Series', 50, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(86, '2020-05-01', 'CPGBS-006', 'Black Samurai', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(87, '2020-05-01', 'CPGC-007', 'Cooper', 30, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(88, '2020-05-01', 'CPGNC-008', 'Nemo Classic', 55, 25, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(89, '2020-05-01', 'CPGNK-009', 'Nemo Koi', 70, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(90, '2020-05-01', 'CPGRK-010', 'Red Koi', 55, 45, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(91, '2020-05-01', 'CPGNC-011', 'Nemo Cooper', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(92, '2020-05-01', 'CPGNM-012', 'Nemo Multi', 35, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(93, '2020-05-01', 'CPGNG-013', 'Nemo Galaxy', 50, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(94, '2020-05-01', 'CPGC-014', 'Candy', 70, 40, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(95, '2020-05-01', 'CPGBE-015', 'Big Ear', 75, 25, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(96, '2020-05-01', 'CPGP-016', 'Plakat', 55, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(97, '2020-05-01', 'CPGF-017', 'Fancy', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(98, '2020-05-01', 'CPGA-018', 'Avatar', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(99, '2020-05-01', 'CPGH-019', 'Hellboy', 30, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(100, '2020-05-01', 'CPGRD-020', 'Red Dragon', 60, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(101, '2020-06-01', 'CPGBR-001', 'Blue Rim', 50, 40, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(102, '2020-06-01', 'CPGHM-002', 'Halfmoon', 40, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(103, '2020-06-01', 'CPGDE-003', 'Dumbo Ear', 90, 60, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(104, '2020-06-01', 'CPGMC-004', 'Multi Color', 80, 70, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(105, '2020-06-01', 'CPGBS-005', 'Black Series', 45, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(106, '2020-06-01', 'CPGBS-006', 'Black Samurai', 55, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(107, '2020-06-01', 'CPGC-007', 'Cooper', 20, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(108, '2020-06-01', 'CPGNC-008', 'Nemo Classic', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(109, '2020-06-01', 'CPGNK-009', 'Nemo Koi', 50, 15, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(110, '2020-06-01', 'CPGRK-010', 'Red Koi', 70, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(111, '2020-06-01', 'CPGNC-011', 'Nemo Cooper', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(112, '2020-06-01', 'CPGNM-012', 'Nemo Multi', 65, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(113, '2020-06-01', 'CPGNG-013', 'Nemo Galaxy', 40, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(114, '2020-06-01', 'CPGC-014', 'Candy', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(115, '2020-06-01', 'CPGBE-015', 'Big Ear', 50, 40, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(116, '2020-06-01', 'CPGP-016', 'Plakat', 25, 25, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(117, '2020-06-01', 'CPGF-017', 'Fancy', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(118, '2020-06-01', 'CPGA-018', 'Avatar', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(119, '2020-06-01', 'CPGH-019', 'Hellboy', 50, 40, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(120, '2020-06-01', 'CPGRD-020', 'Red Dragon', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(121, '2020-07-01', 'CPGBR-001', 'Blue Rim', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(122, '2020-07-01', 'CPGHM-002', 'Halfmoon', 20, 15, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(123, '2020-07-01', 'CPGDE-003', 'Dumbo Ear', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(124, '2020-07-01', 'CPGMC-004', 'Multi Color', 50, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(125, '2020-07-01', 'CPGBS-005', 'Black Series', 25, 25, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(126, '2020-07-01', 'CPGBS-006', 'Black Samurai', 35, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(127, '2020-07-01', 'CPGC-007', 'Cooper', 50, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(128, '2020-07-01', 'CPGNC-008', 'Nemo Classic', 40, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(129, '2020-07-01', 'CPGNK-009', 'Nemo Koi', 65, 25, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(130, '2020-07-01', 'CPGRK-010', 'Red Koi', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(131, '2020-07-01', 'CPGNC-011', 'Nemo Cooper', 70, 60, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(132, '2020-07-01', 'CPGNM-012', 'Nemo Multi', 55, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(133, '2020-07-01', 'CPGNG-013', 'Nemo Galaxy', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(134, '2020-07-01', 'CPGC-014', 'Candy', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(135, '2020-07-01', 'CPGBE-015', 'Big Ear', 30, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(136, '2020-07-01', 'CPGP-016', 'Plakat', 50, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(137, '2020-07-01', 'CPGF-017', 'Fancy', 40, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(138, '2020-07-01', 'CPGA-018', 'Avatar', 60, 60, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(139, '2020-07-01', 'CPGH-019', 'Hellboy', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(140, '2020-07-01', 'CPGRD-020', 'Red Dragon', 80, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(141, '2020-08-01', 'CPGBR-001', 'Blue Rim', 70, 65, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(142, '2020-08-01', 'CPGHM-002', 'Halfmoon', 65, 55, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(143, '2020-08-01', 'CPGDE-003', 'Dumbo Ear', 20, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(144, '2020-08-01', 'CPGMC-004', 'Multi Color', 90, 70, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(145, '2020-08-01', 'CPGBS-005', 'Black Series', 50, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(146, '2020-08-01', 'CPGBS-006', 'Black Samurai', 45, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(147, '2020-08-01', 'CPGC-007', 'Cooper', 30, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(148, '2020-08-01', 'CPGNC-008', 'Nemo Classic', 20, 15, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(149, '2020-08-01', 'CPGNK-009', 'Nemo Koi', 40, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(150, '2020-08-01', 'CPGRK-010', 'Red Koi', 30, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(151, '2020-08-01', 'CPGNC-011', 'Nemo Cooper', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(152, '2020-08-01', 'CPGNM-012', 'Nemo Multi', 35, 35, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(153, '2020-08-01', 'CPGNG-013', 'Nemo Galaxy', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(154, '2020-08-01', 'CPGC-014', 'Candy', 80, 40, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(155, '2020-08-01', 'CPGBE-015', 'Big Ear', 20, 15, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(156, '2020-08-01', 'CPGP-016', 'Plakat', 40, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(157, '2020-08-01', 'CPGF-017', 'Fancy', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(158, '2020-08-01', 'CPGA-018', 'Avatar', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(159, '2020-08-01', 'CPGH-019', 'Hellboy', 50, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(160, '2020-08-01', 'CPGRD-020', 'Red Dragon', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(161, '2020-09-01', 'CPGBR-001', 'Blue Rim', 25, 25, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(162, '2020-09-01', 'CPGHM-002', 'Halfmoon', 70, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(163, '2020-09-01', 'CPGDE-003', 'Dumbo Ear', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(164, '2020-09-01', 'CPGMC-004', 'Multi Color', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(165, '2020-09-01', 'CPGBS-005', 'Black Series', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(166, '2020-09-01', 'CPGBS-006', 'Black Samurai', 15, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(167, '2020-09-01', 'CPGC-007', 'Cooper', 20, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(168, '2020-09-01', 'CPGNC-008', 'Nemo Classic', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(169, '2020-09-01', 'CPGNK-009', 'Nemo Koi', 30, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(170, '2020-09-01', 'CPGRK-010', 'Red Koi', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(171, '2020-09-01', 'CPGNC-011', 'Nemo Cooper', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(172, '2020-09-01', 'CPGNM-012', 'Nemo Multi', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(173, '2020-09-01', 'CPGNG-013', 'Nemo Galaxy', 30, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(174, '2020-09-01', 'CPGC-014', 'Candy', 40, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(175, '2020-09-01', 'CPGBE-015', 'Big Ear', 55, 45, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(176, '2020-09-01', 'CPGP-016', 'Plakat', 20, 15, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(177, '2020-09-01', 'CPGF-017', 'Fancy', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(178, '2020-09-01', 'CPGA-018', 'Avatar', 60, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(179, '2020-09-01', 'CPGH-019', 'Hellboy', 20, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(180, '2020-09-01', 'CPGRD-020', 'Red Dragon', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(181, '2020-10-01', 'CPGBR-001', 'Blue Rim', 80, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(182, '2020-10-01', 'CPGHM-002', 'Halfmoon', 50, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(183, '2020-10-01', 'CPGDE-003', 'Dumbo Ear', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(184, '2020-10-01', 'CPGMC-004', 'Multi Color', 50, 40, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(185, '2020-10-01', 'CPGBS-005', 'Black Series', 40, 25, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(186, '2020-10-01', 'CPGBS-006', 'Black Samurai', 40, 40, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(187, '2020-10-01', 'CPGC-007', 'Cooper', 50, 25, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(188, '2020-10-01', 'CPGNC-008', 'Nemo Classic', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(189, '2020-10-01', 'CPGNK-009', 'Nemo Koi', 90, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(190, '2020-10-01', 'CPGRK-010', 'Red Koi', 40, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(191, '2020-10-01', 'CPGNC-011', 'Nemo Cooper', 50, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(192, '2020-10-01', 'CPGNM-012', 'Nemo Multi', 60, 35, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(193, '2020-10-01', 'CPGNG-013', 'Nemo Galaxy', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(194, '2020-10-01', 'CPGC-014', 'Candy', 70, 40, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(195, '2020-10-01', 'CPGBE-015', 'Big Ear', 45, 25, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(196, '2020-10-01', 'CPGP-016', 'Plakat', 50, 35, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(197, '2020-10-01', 'CPGF-017', 'Fancy', 55, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(198, '2020-10-01', 'CPGA-018', 'Avatar', 75, 45, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(199, '2020-10-01', 'CPGH-019', 'Hellboy', 50, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(200, '2020-10-01', 'CPGRD-020', 'Red Dragon', 60, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(201, '2020-11-01', 'CPGBR-001', 'Blue Rim', 50, 40, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(202, '2020-11-01', 'CPGHM-002', 'Halfmoon', 40, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(203, '2020-11-01', 'CPGDE-003', 'Dumbo Ear', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(204, '2020-11-01', 'CPGMC-004', 'Multi Color', 20, 20, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(205, '2020-11-01', 'CPGBS-005', 'Black Series', 35, 35, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(206, '2020-11-01', 'CPGBS-006', 'Black Samurai', 20, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(207, '2020-11-01', 'CPGC-007', 'Cooper', 25, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(208, '2020-11-01', 'CPGNC-008', 'Nemo Classic', 50, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(209, '2020-11-01', 'CPGNK-009', 'Nemo Koi', 40, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(210, '2020-11-01', 'CPGRK-010', 'Red Koi', 20, 15, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(211, '2020-11-01', 'CPGNC-011', 'Nemo Cooper', 40, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(212, '2020-11-01', 'CPGNM-012', 'Nemo Multi', 25, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(213, '2020-11-01', 'CPGNG-013', 'Nemo Galaxy', 45, 45, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(214, '2020-11-01', 'CPGC-014', 'Candy', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(215, '2020-11-01', 'CPGBE-015', 'Big Ear', 20, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(216, '2020-11-01', 'CPGP-016', 'Plakat', 35, 15, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(217, '2020-11-01', 'CPGF-017', 'Fancy', 35, 15, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(218, '2020-11-01', 'CPGA-018', 'Avatar', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(219, '2020-11-01', 'CPGH-019', 'Hellboy', 10, 10, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(220, '2020-11-01', 'CPGRD-020', 'Red Dragon', 40, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(221, '2020-12-01', 'CPGBR-001', 'Blue Rim', 60, 60, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(222, '2020-12-01', 'CPGHM-002', 'Halfmoon', 70, 50, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(223, '2020-12-01', 'CPGDE-003', 'Dumbo Ear', 20, 15, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(224, '2020-12-01', 'CPGMC-004', 'Multi Color', 80, 60, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(225, '2020-12-01', 'CPGBS-005', 'Black Series', 50, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(226, '2020-12-01', 'CPGBS-006', 'Black Samurai', 35, 15, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(227, '2020-12-01', 'CPGC-007', 'Cooper', 65, 55, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(228, '2020-12-01', 'CPGNC-008', 'Nemo Classic', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(229, '2020-12-01', 'CPGNK-009', 'Nemo Koi', 95, 75, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(230, '2020-12-01', 'CPGRK-010', 'Red Koi', 45, 45, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(231, '2020-12-01', 'CPGNC-011', 'Nemo Cooper', 20, 10, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(232, '2020-12-01', 'CPGNM-012', 'Nemo Multi', 55, 40, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(233, '2020-12-01', 'CPGNG-013', 'Nemo Galaxy', 30, 25, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(234, '2020-12-01', 'CPGC-014', 'Candy', 60, 60, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(235, '2020-12-01', 'CPGBE-015', 'Big Ear', 50, 50, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(236, '2020-12-01', 'CPGP-016', 'Plakat', 80, 40, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(237, '2020-12-01', 'CPGF-017', 'Fancy', 40, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(238, '2020-12-01', 'CPGA-018', 'Avatar', 50, 30, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(239, '2020-12-01', 'CPGH-019', 'Hellboy', 30, 20, 'no', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(240, '2020-12-01', 'CPGRD-020', 'Red Dragon', 30, 30, 'yes', '2022-01-22 08:08:42', '2022-01-22 17:56:18'),
(241, '2022-01-01', 'CPGA-018', 'Avatar', 50, 30, 'no', '2022-01-23 02:29:16', '2022-01-23 02:29:16'),
(242, '2022-01-01', 'CPGBE-015', 'Big Ear', 60, 40, 'no', '2022-01-23 02:30:01', '2022-01-23 02:30:01'),
(243, '2022-01-01', 'CPGBR-001', 'Blue Rim', 60, 55, 'yes', '2022-01-23 02:30:13', '2022-01-23 02:30:13'),
(244, '2022-01-01', 'CPGBS-005', 'Black Series', 60, 40, 'yes', '2022-01-23 23:40:38', '2022-01-23 23:40:38'),
(245, '2022-01-01', 'CPGBS-006', 'Black Samurai', 60, 55, 'yes', '2022-01-24 04:47:11', '2022-01-24 04:47:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, '$2y$10$rmFKOkZroLioJ8jiU2UzO.7mNqCCHaC0kSbEugu/j51cMpxn933R2', NULL, '2022-01-22 06:01:47', '2022-01-22 06:01:47');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `stok`
--
ALTER TABLE `stok`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
