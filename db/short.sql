-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 04, 2021 at 07:03 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile-accessories`
--

-- --------------------------------------------------------

--
-- Table structure for table `coupon_groups`
--

CREATE TABLE `coupon_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_groups`
--

INSERT INTO `coupon_groups` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Gold member', 'gold-member', '2021-11-03 09:58:46', '2021-11-03 10:07:19'),
(2, 'Silver Member', 'silver-member', '2021-11-03 10:05:17', '2021-11-03 10:05:17'),
(3, 'Platinum member', 'platinum-member', '2021-11-03 10:05:26', '2021-11-03 10:05:26'),
(4, 'Developer Group', 'developer-group', '2021-11-03 17:19:28', '2021-11-03 17:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_group_users`
--

CREATE TABLE `coupon_group_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_group_users`
--

INSERT INTO `coupon_group_users` (`id`, `coupon_group_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 4, NULL, NULL),
(2, 2, 4, NULL, NULL),
(3, 1, 4, NULL, NULL),
(4, 4, 4, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupon_groups`
--
ALTER TABLE `coupon_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_groups_slug_unique` (`slug`);

--
-- Indexes for table `coupon_group_users`
--
ALTER TABLE `coupon_group_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coupon_groups`
--
ALTER TABLE `coupon_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupon_group_users`
--
ALTER TABLE `coupon_group_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
