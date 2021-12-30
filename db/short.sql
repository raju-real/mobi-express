-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 30, 2021 at 04:55 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobi-xpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `ssl_commerz_transactions`
--

CREATE TABLE `ssl_commerz_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_invoice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_amount` double(8,2) NOT NULL,
  `vat` double(8,2) DEFAULT NULL,
  `store_amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_tran_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_issuer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_sub_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_issuer_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_issuer_country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_sign` text COLLATE utf8mb4_unicode_ci,
  `verify_key` text COLLATE utf8mb4_unicode_ci,
  `verify_sign_sha2` text COLLATE utf8mb4_unicode_ci,
  `base_fair` text COLLATE utf8mb4_unicode_ci,
  `risk_level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `risk_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ssl_commerz_transactions`
--

INSERT INTO `ssl_commerz_transactions` (`id`, `user_id`, `order_id`, `order_number`, `invoice`, `transaction_id`, `transaction_invoice`, `transaction_time`, `transaction_ip`, `transaction_amount`, `vat`, `store_amount`, `currency`, `currency_type`, `currency_amount`, `currency_rate`, `status`, `message`, `val_id`, `card_type`, `card_no`, `bank_tran_id`, `transaction_date`, `error`, `card_issuer`, `card_brand`, `card_sub_brand`, `card_issuer_country`, `card_issuer_country_code`, `store_id`, `verify_sign`, `verify_key`, `verify_sign_sha2`, `base_fair`, `risk_level`, `risk_title`, `name`, `mobile`, `city_town`, `post_code`, `address`, `created_at`, `updated_at`) VALUES
(2, 4, 1, '000001', 'MX-11070188', '61cde12ed5cb6', NULL, '2021-12-30 22:41:18', '125896', 100.00, NULL, NULL, 'BDT', NULL, NULL, NULL, 'Pending', 'Cancelled by User', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raju Real', '01889967514', 'Dhaka', '1207', 'Mohammadpur, Shamoly, Dhaka', NULL, '2021-12-30 16:36:54'),
(3, 4, 2, '000002', 'MX-28790292', '61cdcf14e9ab6', NULL, '2021-12-30 21:24:04', '125896', 41.00, NULL, NULL, 'BDT', NULL, NULL, NULL, 'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raju Real', '01889967514', 'Dhaka', '1207', 'Mohammadpur, Shamoly, Dhaka', NULL, NULL),
(4, 4, 3, '000003', 'MX-40388575', '61cde0559eaf2', NULL, '2021-12-30 22:37:41', '125896', 91.00, NULL, NULL, 'BDT', NULL, NULL, NULL, 'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raju Real', '01889967514', 'Dhaka', '1207', 'Mohammadpur, Shamoly, Dhaka', NULL, NULL),
(5, 4, 4, '000004', 'MX-41568668', '61cddbeb9b8bd', NULL, '2021-12-30 22:18:51', '125896', 135.00, NULL, NULL, 'BDT', NULL, NULL, NULL, 'CANCELLED', 'Cancelled by User', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raju Real', '01889967514', 'Dhaka', '1207', 'Mohammadpur, Shamoly, Dhaka', NULL, '2021-12-30 16:25:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ssl_commerz_transactions`
--
ALTER TABLE `ssl_commerz_transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ssl_commerz_transactions`
--
ALTER TABLE `ssl_commerz_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
