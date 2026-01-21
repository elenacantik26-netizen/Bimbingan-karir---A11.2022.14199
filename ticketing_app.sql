-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2026 at 02:33 PM
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
-- Database: `ticketing_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-login@gmail.com|127.0.0.1', 'i:1;', 1768997013),
('laravel-cache-login@gmail.com|127.0.0.1:timer', 'i:1768997013;', 1768997013);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_orders`
--

CREATE TABLE `detail_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tiket_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal_harga` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_orders`
--

INSERT INTO `detail_orders` (`id`, `order_id`, `tiket_id`, `jumlah`, `subtotal_harga`, `created_at`, `updated_at`) VALUES
(3, 3, 5, 1, 1500000.00, '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(4, 4, 7, 1, 200000.00, '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(5, 5, 7, 14, 2800000.00, '2026-01-21 04:49:21', '2026-01-21 04:49:21'),
(6, 6, 8, 3, 900000.00, '2026-01-21 04:51:33', '2026-01-21 04:51:33'),
(7, 7, 8, 5, 1500000.00, '2026-01-21 04:57:18', '2026-01-21 04:57:18'),
(8, 8, 8, 3, 900000.00, '2026-01-21 04:59:33', '2026-01-21 04:59:33'),
(9, 9, 8, 4, 1200000.00, '2026-01-21 05:02:59', '2026-01-21 05:02:59'),
(10, 10, 8, 185, 55500000.00, '2026-01-21 05:07:29', '2026-01-21 05:07:29'),
(11, 11, 7, 6, 1200000.00, '2026-01-21 05:14:10', '2026-01-21 05:14:10'),
(12, 12, 7, 6, 1200000.00, '2026-01-21 05:20:32', '2026-01-21 05:20:32'),
(13, 13, 5, 8, 12000000.00, '2026-01-21 05:54:00', '2026-01-21 05:54:00'),
(14, 14, 6, 4, 2000000.00, '2026-01-21 05:54:28', '2026-01-21 05:54:28'),
(15, 15, 7, 274, 54800000.00, '2026-01-21 05:55:42', '2026-01-21 05:55:42'),
(16, 16, 5, 7, 10500000.00, '2026-01-21 06:02:07', '2026-01-21 06:02:07'),
(17, 16, 6, 6, 3000000.00, '2026-01-21 06:02:07', '2026-01-21 06:02:07'),
(18, 17, 9, 1, 0.00, '2026-01-21 06:25:32', '2026-01-21 06:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `tanggal_waktu` datetime NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `kategori_id`, `judul`, `deskripsi`, `lokasi`, `tanggal_waktu`, `gambar`, `created_at`, `updated_at`) VALUES
(4, 7, 5, 'Konser Musik Rock', 'Nikmati malam penuh energi dengan band rock ternama.', 'Stadion Utama', '2024-08-15 19:00:00', 'events/konser_rock.jpg', '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(5, 7, 6, 'Pameran Seni Kontemporer', 'Jelajahi karya seni modern dari seniman lokal dan internasional.', 'Galeri Seni Kota', '2024-05-10 10:00:00', 'events/pameran_seni.jpg', '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(6, 7, 7, 'Festival Makanan Internasional', 'Cicipi berbagai hidangan lezat dari seluruh dunia.', 'Taman Kota', '2024-10-05 12:00:00', 'events/festival_makanan.jpg', '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(7, 7, 5, 'koser dangdut', 'josjis', 'lapangn', '2026-01-21 20:22:00', '1769001794.png', '2026-01-21 06:23:14', '2026-01-21 06:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

INSERT INTO `kategoris` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(5, 'Musik', '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(6, 'Seni', '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(7, 'Festival', '2026-01-21 04:47:03', '2026-01-21 04:47:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(31, '0001_01_01_000000_create_users_table', 1),
(32, '0001_01_01_000001_create_cache_table', 1),
(33, '0001_01_01_000002_create_jobs_table', 1),
(34, '0001_01_01_000003_create_kategoris_table', 1),
(35, '0001_01_01_000004_create_events_table', 1),
(36, '0001_01_01_000005_create_tikets_table', 1),
(37, '0001_01_01_000006_create_orders_table', 1),
(38, '0001_01_01_000007_create_detail_orders_table', 1),
(39, '2026_01_21_064735_create_payment_types_table', 1),
(40, '2026_01_21_072841_add_payment_type_id_to_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `order_date` datetime NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `payment_type_id`, `event_id`, `order_date`, `total_harga`, `created_at`, `updated_at`) VALUES
(3, 8, NULL, 4, '2024-07-01 14:30:00', 1500000.00, '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(4, 8, NULL, 5, '2024-07-02 10:15:00', 200000.00, '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(5, 8, NULL, 5, '2026-01-21 11:49:21', 2800000.00, '2026-01-21 04:49:21', '2026-01-21 04:49:21'),
(6, 8, 21, 6, '2026-01-21 11:51:33', 900000.00, '2026-01-21 04:51:33', '2026-01-21 04:51:33'),
(7, 8, 21, 6, '2026-01-21 11:57:18', 1500000.00, '2026-01-21 04:57:18', '2026-01-21 04:57:18'),
(8, 8, 22, 6, '2026-01-21 11:59:33', 900000.00, '2026-01-21 04:59:33', '2026-01-21 04:59:33'),
(9, 8, 22, 6, '2026-01-21 12:02:59', 1200000.00, '2026-01-21 05:02:59', '2026-01-21 05:02:59'),
(10, 8, 22, 6, '2026-01-21 12:07:29', 55500000.00, '2026-01-21 05:07:29', '2026-01-21 05:07:29'),
(11, 8, 21, 5, '2026-01-21 12:14:10', 1200000.00, '2026-01-21 05:14:10', '2026-01-21 05:14:10'),
(12, 8, 21, 5, '2026-01-21 12:20:32', 1200000.00, '2026-01-21 05:20:32', '2026-01-21 05:20:32'),
(13, 8, 21, 4, '2026-01-21 12:54:00', 12000000.00, '2026-01-21 05:54:00', '2026-01-21 05:54:00'),
(14, 8, 21, 4, '2026-01-21 12:54:28', 2000000.00, '2026-01-21 05:54:28', '2026-01-21 05:54:28'),
(15, 8, 21, 5, '2026-01-21 12:55:42', 54800000.00, '2026-01-21 05:55:42', '2026-01-21 05:55:42'),
(16, 8, 21, 4, '2026-01-21 13:02:07', 13500000.00, '2026-01-21 06:02:07', '2026-01-21 06:02:07'),
(17, 8, 22, 7, '2026-01-21 13:25:32', 0.00, '2026-01-21 06:25:32', '2026-01-21 06:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(21, 'Kartu Kredit', '2026-01-21 04:50:54', '2026-01-21 04:50:54'),
(22, 'Transfer Bank', '2026-01-21 04:50:54', '2026-01-21 04:50:54'),
(23, 'E-Wallet', '2026-01-21 04:50:54', '2026-01-21 04:50:54'),
(24, 'Cicilan', '2026-01-21 04:50:54', '2026-01-21 04:50:54'),
(25, 'hvghccbknikkj', '2026-01-21 06:01:10', '2026-01-21 06:01:23'),
(26, 'fjvdfvbkdfj', '2026-01-21 06:20:31', '2026-01-21 06:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fNWf8nrcM8h6F0gdfZuUhl0eHCOrMYgZAHeveGg5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHVZTzhWQjFTWFNxenBESUdJbUFNTUdhVElTV1RQU2RJZVdFNnd2cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAzOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZXZlbnRzLzE/aWQ9MDllNzI4ZTgtNGUyOC00MjM5LThkOTItODAyNDJmM2QzZjUyJnZzY29kZUJyb3dzZXJSZXFJZD0xNzY4OTk2NTk4NTM2IjtzOjU6InJvdXRlIjtzOjExOiJldmVudHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768996599),
('kcRRbRrRWoAmnYp6QfwoquMJiQ50dseUki8tLbxo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUoxa0RReHVOZW13UFNBWEZUVUlPYnp4T1hXaDg3aEc0YWFpMGdQRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768998072),
('kzcVqQ9XjqX3XBZoeXY5bTGhaRtGsgXzpi4G4Vte', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWVWdjFaQWFmREtLSExJSkhKZEJnSkRrQ0RiYUVUUlFwUmVKb1c2UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4/aWQ9MDllNzI4ZTgtNGUyOC00MjM5LThkOTItODAyNDJmM2QzZjUyJnZzY29kZUJyb3dzZXJSZXFJZD0xNzY4OTk3Mjg3NjgxIjtzOjU6InJvdXRlIjtzOjE1OiJhZG1pbi5kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768997288),
('NS537VzGRLb1bBdVe5tNFplETWLY0MTxTcwOIib2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3BLYktrV1VPMXU0eVNFNldzT1h6OFplWTU1bUN6S1YyRU5QemVzVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAzOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZXZlbnRzLzE/aWQ9MDllNzI4ZTgtNGUyOC00MjM5LThkOTItODAyNDJmM2QzZjUyJnZzY29kZUJyb3dzZXJSZXFJZD0xNzY4OTk2NzM1MjQ2IjtzOjU6InJvdXRlIjtzOjExOiJldmVudHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768996735),
('O9HcT3lB9k6HxWd7eerOrK0PXfPCpxYSWZ1IK6sr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1BIRzY0N21QR2FJalNwRE16MkJmbjRUN1dBUU5raUhYSG1CanVibCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8/aWQ9MDllNzI4ZTgtNGUyOC00MjM5LThkOTItODAyNDJmM2QzZjUyJnZzY29kZUJyb3dzZXJSZXFJZD0xNzY4OTk4MDY4ODg5IjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768998069),
('oc7uXGgf5m0VKsOfXGRkOpzcsmqCyfWvgEzjugez', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibFpKZ1I5UjBxSmc4UVBHVExDQkxqb3hxc1RrVFFCNHJmdjRKelFEWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768998086),
('PIRI0t3C9IYecEmCK6qWQgxNAxOKcZZdt3DkejLu', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS0dxRE9LY0p3bWRudnNKcEdIeUJhVHpYZ2p3Q1BDbGFpRXV3QkdIbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZXZlbnRzLzQvdGlja2V0cyI7czo1OiJyb3V0ZSI7Tjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6ODt9', 1769002035),
('PnfmAgEiZxgSp0wF80SgBxPJRmHxQlgx5vZZpwfb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMndCMVFhWjlRb1N5ZTZNZXhndExheUJTQmR2b1pDTjVIb2Uxb21hOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTA3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vZXZlbnRzP2lkPTA5ZTcyOGU4LTRlMjgtNDIzOS04ZDkyLTgwMjQyZjNkM2Y1MiZ2c2NvZGVCcm93c2VyUmVxSWQ9MTc2ODk5NzMyMDM1OSI7czo1OiJyb3V0ZSI7czoxODoiYWRtaW4uZXZlbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768997320),
('pXzpeKNQRCFnFt6YApGV1aE4SeCaUSDw5nkYY7Pn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ2ZubERvZWFEVTc3NmNGMEQ0c2kweDR5NzhZYmtpeUhxbllmZnk3SyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768997370),
('r93IP4thC3GPGmz2LpzzvVjFkd0kdz1qYRlTokpR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT3VVdktPS3o4VkhOWnl3MXBCMVRpQm9Rc2x5dzE3VzdKNklsRmhObiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768997314),
('ROyGc0WE4lAwgGeDR8teppxf0Qh6tgTGFAtLS5Xj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXp2MHpiUm5lN1B6aEcyNVJrVHlPSGppVlZwQU14dXRnb2o3Z1k1byI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZXZlbnRzLzUvdGlja2V0cyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769000377),
('V2COqpXykgKqoRyvteV8t8SbLcSOSPMJZoDLtcOV', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWklaekdGU2l6cVJnbmkxUGoyVzNKalVtVjlKWWJYVVI4N0pWY2FJNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ldmVudHMvZmVzdGl2YWxfbWFrYW5hbi5qcGciO3M6NToicm91dGUiO3M6MTE6ImV2ZW50cy5zaG93Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6ODt9', 1769001935),
('WD0CXWCASX7sHfNMZKHHRWO01kkKaFa5eCq20b3z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTd0UHBmN25wRzRqVllCdng5a0laS3liRDExR0VVNkVjSEY2YnpwQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768997288),
('z8tPJeIaKpv6cIrunVi8CRzpAOPbhL2Ojlupb8tw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDFlRzJFTWlNT3EzaXdhRWVOT045RVE2Y2Q2MndmUFhPVzVvRlUweCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768997321),
('zwHufmaUGtZIj142cVgjNYXG4zk7rS3GwlTvUT7g', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3NyRnlMbkN6ZUFFYjVuMmY0Y3dxejNXdE5zeUNlTWRGOFgzbFJQNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768997310);

-- --------------------------------------------------------

--
-- Table structure for table `tikets`
--

CREATE TABLE `tikets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `tipe` enum('reguler','premium') NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tikets`
--

INSERT INTO `tikets` (`id`, `event_id`, `tipe`, `harga`, `stok`, `created_at`, `updated_at`) VALUES
(5, 4, 'premium', 1500000.00, 99999984, '2026-01-21 04:47:03', '2026-01-21 06:02:07'),
(6, 4, 'reguler', 500000.00, 490, '2026-01-21 04:47:03', '2026-01-21 06:02:07'),
(7, 5, 'premium', 200000.00, 9999, '2026-01-21 04:47:03', '2026-01-21 06:21:58'),
(8, 6, 'premium', 300000.00, 0, '2026-01-21 04:47:03', '2026-01-21 05:07:29'),
(9, 7, 'premium', 0.00, 4, '2026-01-21 06:25:04', '2026-01-21 06:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `no_hp`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Admin', 'admin@gmail.com', '081234567890', 'admin', NULL, '$2y$12$U9UGppbZxzNeY.jQgcdoV.bW0spzIUT6KLH12ApoXC6BlFfcdX0/C', NULL, '2026-01-21 04:47:03', '2026-01-21 04:47:03'),
(8, 'User Customer', 'user@gmail.com', '089876543210', 'user', NULL, '$2y$12$HG9L.9ryZmhnz1bfLIoF3eY.ykHCp/pWsYSGRsxsLaNmrR8ock4ki', NULL, '2026-01-21 04:47:03', '2026-01-21 04:47:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `detail_orders`
--
ALTER TABLE `detail_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_orders_order_id_foreign` (`order_id`),
  ADD KEY `detail_orders_tiket_id_foreign` (`tiket_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_user_id_foreign` (`user_id`),
  ADD KEY `events_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kategoris_nama_unique` (`nama`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_event_id_foreign` (`event_id`),
  ADD KEY `orders_payment_type_id_foreign` (`payment_type_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tikets`
--
ALTER TABLE `tikets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tikets_event_id_foreign` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_orders`
--
ALTER TABLE `detail_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tikets`
--
ALTER TABLE `tikets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_orders`
--
ALTER TABLE `detail_orders`
  ADD CONSTRAINT `detail_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_orders_tiket_id_foreign` FOREIGN KEY (`tiket_id`) REFERENCES `tikets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_payment_type_id_foreign` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tikets`
--
ALTER TABLE `tikets`
  ADD CONSTRAINT `tikets_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
