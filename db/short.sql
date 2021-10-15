-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2021 at 04:41 AM
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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double(8,2) NOT NULL,
  `vat` double(8,2) NOT NULL DEFAULT '0.00',
  `tax` double(8,2) NOT NULL DEFAULT '0.00',
  `total_price` double(8,2) NOT NULL,
  `product_discount_price` double(8,2) NOT NULL DEFAULT '0.00',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `payment_method` int(11) NOT NULL DEFAULT '1',
  `voucher_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `has_coupon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount_amount` double(8,2) DEFAULT NULL,
  `total_discount_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `order_price` double(8,2) NOT NULL,
  `partial_payment` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_status` int(11) NOT NULL DEFAULT '0',
  `payment_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `due_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_prices`
--

CREATE TABLE `order_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `product_discount_price` double(8,2) NOT NULL DEFAULT '0.00',
  `order_price` double(8,2) NOT NULL DEFAULT '0.00',
  `delivery_charge` double(8,2) NOT NULL DEFAULT '0.00',
  `vat` double(8,2) NOT NULL DEFAULT '0.00',
  `tax` double(8,2) NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD UNIQUE KEY `orders_invoice_unique` (`invoice`);

--
-- Indexes for table `order_prices`
--
ALTER TABLE `order_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ssl_commerz_transactions`
--
ALTER TABLE `ssl_commerz_transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_prices`
--
ALTER TABLE `order_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ssl_commerz_transactions`
--
ALTER TABLE `ssl_commerz_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
