-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 16, 2021 at 09:59 AM
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
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_management` int(11) DEFAULT '0',
  `report_management` int(11) DEFAULT '0',
  `product_management` int(11) NOT NULL DEFAULT '0',
  `product_attribute_management` int(11) NOT NULL DEFAULT '0',
  `product_binding_management` int(11) NOT NULL DEFAULT '0',
  `promotion_management` int(11) NOT NULL DEFAULT '0',
  `offer_management` int(11) NOT NULL DEFAULT '0',
  `voucher_management` int(11) NOT NULL DEFAULT '0',
  `coupon_management` int(11) NOT NULL DEFAULT '0',
  `web_basic_management` int(11) NOT NULL DEFAULT '0',
  `district_management` int(11) NOT NULL DEFAULT '0',
  `user_management` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `mobile`, `password`, `image`, `order_management`, `report_management`, `product_management`, `product_attribute_management`, `product_binding_management`, `promotion_management`, `offer_management`, `voucher_management`, `coupon_management`, `web_basic_management`, `district_management`, `user_management`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'Super Admin', 'admin@admin.com', '01889967514', '$2y$10$hZPVUcwm05IrpZrKS9kSFuJlxwD.fmRjA5nrQOWYOm8Bv.ZOfYqDK', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL),
(2, '2', 'Admin One', 'admin1@gmail.com', '01889967511', '$2y$10$/WzIosvU6xvdZX2rcZDBWOhslaEgJyV2Im91wlr9imWUj58I2VYsy', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2021-11-14 10:07:02', '2021-11-14 12:54:24'),
(3, '2', 'Admin Two', 'admin2@gmail.com', 'admin2@gmail.com', '$2y$10$FSO1.8MV8ybkG1p1zdWvV.46te5Jx9bSjB48eetFIRtNtv9OTLNuG', NULL, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, '2021-11-14 11:20:46', '2021-11-14 12:57:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
