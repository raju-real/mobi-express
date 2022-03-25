-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 19, 2022 at 08:09 AM
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
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_us` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `image`, `about_us`, `created_at`, `updated_at`) VALUES
(1, 'images/basic/1629473518eCommerce-Website-Components-image-1024x660-min-704x454.jpg', '<h2>What Is Electronic Commerce (e-commerce)?</h2>\r\n\r\n<p>Electronic commerce or e-commerce&nbsp;(sometimes written as eCommerce<em>)</em>&nbsp;is a&nbsp;<a href=\"https://www.investopedia.com/terms/b/businessmodel.asp\">business model</a>&nbsp;that lets firms and individuals buy and sell things over the internet. E-commerce operates in all four of the following major market segments:</p>\r\n\r\n<ul>\r\n	<li>Business to business</li>\r\n	<li>Business to consumer</li>\r\n	<li>Consumer to consumer</li>\r\n	<li>Consumer to business</li>\r\n	<li>\r\n	<p>E-commerce, which can be conducted over computers, tablets, or smartphones may be thought of like a digital version of mail-order catalog shopping. Nearly every imaginable product and service is available through e-commerce transactions, including books, music, plane tickets, and financial services such as&nbsp;<a href=\"https://www.investopedia.com/articles/etfs-mutual-funds/080516/4-etfs-fang-stocks-fdnpnqiqqqskyy.asp\">stock investing</a>&nbsp;and online banking. As such, it is considered a very&nbsp;<a href=\"https://www.investopedia.com/terms/d/disruptive-technology.asp\">disruptive technology</a>.</p>\r\n\r\n	<h3>KEY TAKEAWAYS</h3>\r\n	</li>\r\n	<li>E-commerce is the buying and selling of goods and services over the internet.</li>\r\n	<li>E-commerce can be a substitute for brick-and-mortar stores, though some businesses choose to maintain both.</li>\r\n	<li>Almost anything can be purchased through e-commerce today.</li>\r\n	<li>\r\n	<p>&nbsp;</p>\r\n\r\n	<p>E-commerce lets firms and individuals conduct business over the Internet.</p>\r\n	</li>\r\n</ul>', NULL, '2021-08-20 09:31:58');

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
  `admin_management` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `mobile`, `password`, `image`, `order_management`, `report_management`, `product_management`, `product_attribute_management`, `product_binding_management`, `promotion_management`, `offer_management`, `voucher_management`, `coupon_management`, `web_basic_management`, `district_management`, `user_management`, `admin_management`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'Super Admin', 'admin@admin.com', '01889967514', '$2y$10$hZPVUcwm05IrpZrKS9kSFuJlxwD.fmRjA5nrQOWYOm8Bv.ZOfYqDK', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL),
(2, '2', 'Admin One', 'admin1@gmail.com', '01889967511', '$2y$10$/WzIosvU6xvdZX2rcZDBWOhslaEgJyV2Im91wlr9imWUj58I2VYsy', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, '2021-11-14 10:07:02', '2021-11-16 10:10:33'),
(3, '2', 'Admin Two', 'admin2@gmail.com', '01889967512', '$2y$10$FSO1.8MV8ybkG1p1zdWvV.46te5Jx9bSjB48eetFIRtNtv9OTLNuG', NULL, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, '2021-11-14 11:20:46', '2021-11-20 06:34:25'),
(4, '2', 'Admin 3', 'admin3@gmail.com', '01889967515', '$2y$10$Uy81/7CKwT1YJN.YgJssHefpmFgi0wSf0iRbt2n6iA9WkEJv5UiH6', NULL, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, '2021-11-24 05:28:01', '2021-11-24 05:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `post_code` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_addresses`
--

INSERT INTO `billing_addresses` (`id`, `user_id`, `full_name`, `mobile`, `email`, `district`, `city_town`, `address`, `post_code`, `created_at`, `updated_at`) VALUES
(1, 4, 'Raju Real', '01889967514', 'raju@mail.com', NULL, 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2021-10-15 17:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(6, 'Samsung', 'samsung', '2021-06-11 07:53:18', '2021-06-11 07:53:18'),
(7, 'Brand 1', 'brand-1', '2021-11-24 05:19:29', '2021-11-24 05:19:29'),
(8, 'Brand 2', 'brand-2', '2021-11-24 05:19:40', '2021-11-24 05:19:40'),
(9, 'Brand 3', 'brand-3', '2021-11-24 05:19:47', '2021-11-24 05:19:47'),
(10, 'Brand 4', 'brand-4', '2021-11-24 05:19:54', '2021-11-24 05:19:54'),
(11, 'Brand 5', 'brand-5', '2021-11-24 05:20:00', '2021-11-24 05:20:00'),
(12, 'Brand 6', 'brand-6', '2021-11-24 05:20:08', '2021-11-24 05:20:08'),
(13, 'Brand 7', 'brand-7', '2021-11-24 05:20:14', '2021-11-24 05:20:14'),
(14, 'Brand 8', 'brand-8', '2021-11-24 05:20:55', '2021-11-24 05:20:55'),
(15, 'Brand 9', 'brand-9', '2021-11-24 05:21:03', '2021-11-24 05:21:03'),
(16, 'Brand 10', 'brand-10', '2021-11-24 05:21:12', '2021-11-24 05:21:12'),
(17, 'Brand 11', 'brand-11', '2021-11-24 05:21:18', '2021-11-24 05:21:18'),
(18, 'Brand 12', 'brand-12', '2021-11-24 05:21:32', '2021-11-24 05:21:32'),
(19, 'Brand 13', 'brand-13', '2021-11-24 05:21:38', '2021-11-24 05:21:38'),
(20, 'Brand 14', 'brand-14', '2021-11-24 05:21:47', '2021-11-24 05:21:47'),
(21, 'Brand 15', 'brand-15', '2021-11-24 05:21:53', '2021-11-24 05:21:53'),
(22, 'Brand 16', 'brand-16', '2021-11-24 05:22:00', '2021-11-24 05:22:00'),
(23, 'Brand 17', 'brand-17', '2021-11-24 05:22:07', '2021-11-24 05:22:07'),
(24, 'Brand 18', 'brand-18', '2021-11-24 05:22:18', '2021-11-24 05:22:18'),
(25, 'Brand 19', 'brand-19', '2021-11-24 05:22:33', '2021-11-24 05:22:33'),
(26, 'Brand 20', 'brand-20', '2021-11-24 05:22:41', '2021-11-24 05:22:41');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `order_price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `total_discount_price` double(8,2) NOT NULL DEFAULT '0.00',
  `color_id` int(10) DEFAULT NULL,
  `size_id` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `session_id`, `user_id`, `product_id`, `unit_price`, `order_price`, `quantity`, `total_price`, `total_discount_price`, `color_id`, `size_id`, `created_at`, `updated_at`) VALUES
(6, 'tm8FVgiN4V8Rw304RzBOQxcD8Z6G5bfjN3dSu3Pz', 4, 405, 380.00, 380.00, 1, 380.00, 0.00, NULL, NULL, '2021-12-16 17:51:59', '2021-12-16 17:53:44'),
(8, 'tm8FVgiN4V8Rw304RzBOQxcD8Z6G5bfjN3dSu3Pz', 4, 71, 45.00, 45.00, 1, 45.00, 0.00, NULL, NULL, '2021-12-16 17:53:23', '2021-12-16 17:53:44'),
(9, 'Ka2HMCkoLvLLtaSOeWUYk21fTqmSTwhxHjCo1vyh', 4, 71, 45.00, 45.00, 1, 45.00, 0.00, NULL, NULL, '2022-02-10 17:42:23', '2022-02-10 17:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `serial`, `created_at`, `updated_at`) VALUES
(1, 'Head Phone', 'head-phone', 'images/category/1625851535giant_127653.jpeg', 3, '2021-06-11 05:55:29', '2021-10-31 08:25:29'),
(2, 'Charger', 'charger', 'images/category/1625851526two-pin-3509490_960_720.jpg', 2, '2021-06-11 07:28:01', '2021-10-15 17:52:36'),
(3, 'Backpad', 'backpad', 'images/category/1625851513maxresdefault.jpg', 1, '2021-06-21 07:54:54', '2021-10-31 08:25:13'),
(4, 'Mobile', 'mobile', 'images/category/1642519380Top-10-Mobile-Brands-in-World-1-1.jpg', 1, '2022-01-18 15:23:00', '2022-01-18 15:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Red', 'red', '2021-11-08 15:51:25', '2021-11-08 15:51:25'),
(2, 'Navy Blue', 'navy-blue', '2021-11-08 15:51:38', '2021-11-08 15:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_link` text COLLATE utf8mb4_unicode_ci,
  `office_info` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `company_name`, `map_link`, `office_info`, `address`, `email`, `mobile`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Mobi Express', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3652.2350055083375!2d90.38097161447428!3d23.73899769512986!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8b7e01f1413%3A0x2543f04f47276dd4!2sAarong%2C%20Dhanmondi%20Branch!5e0!3m2!1sen!2sbd!4v1629475518003!5m2!1sen!2sbd', 'Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum formas human. qui sequitur mutationem consuetudium lectorum. Mirum est notare quam', 'mohammadpur, dhaka', 'raju@mail.com', '01889967514', '6549465416454', NULL, '2021-08-24 04:44:56');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `valid_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_group` int(11) DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `used_limit` int(11) NOT NULL DEFAULT '1',
  `minimum_cost` int(11) NOT NULL DEFAULT '0',
  `up_to` int(11) NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `valid_for`, `user_group`, `coupon_code`, `discount_type`, `discount`, `used_limit`, `minimum_cost`, `up_to`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(6, '1', NULL, 'ME-1235', '1', 50, 2, 200, 200, '2021-10-28 00:00:00', '2021-12-17 23:59:59', 1, '2021-10-28 15:00:51', '2021-12-16 17:32:01'),
(7, '3', 2, 'PE-H2010', '1', 100, 2, 200, 0, '2021-11-03 00:00:00', '2021-11-26 23:59:59', 1, '2021-11-03 16:01:48', '2021-11-16 17:29:32');

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
(3, 'Platinum member', 'platinum-member', '2021-11-03 10:05:26', '2021-11-03 10:05:26');

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
(9, 3, 5, NULL, NULL),
(10, 3, 4, NULL, NULL),
(11, 2, 4, NULL, NULL),
(12, 2, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_user_useds`
--

CREATE TABLE `coupon_user_useds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_used` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_user_useds`
--

INSERT INTO `coupon_user_useds` (`id`, `order_id`, `user_id`, `coupon_code`, `user_used`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ME-1234', 1, '2021-09-19 12:45:21', '2021-09-19 12:46:11'),
(2, 5, 6, 'PE-H2010', 2, '2021-11-16 17:22:40', '2021-11-16 17:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_valid_users`
--

CREATE TABLE `coupon_valid_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_valid_users`
--

INSERT INTO `coupon_valid_users` (`id`, `user_id`, `coupon_code`, `created_at`, `updated_at`) VALUES
(9, 5, 'PE-H2010', NULL, NULL),
(10, 4, 'PE-H2010', NULL, NULL),
(11, 6, 'PE-H2010', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', '2021-09-20 10:59:49', '2021-09-20 10:59:49'),
(2, 'Sirajgonj', '2021-09-20 11:00:05', '2021-09-20 11:00:05'),
(3, 'Feni', '2021-09-20 11:00:23', '2021-09-20 11:00:23'),
(4, 'Rajshahi', '2021-09-20 11:00:35', '2021-09-20 11:00:35'),
(5, 'Sylhet', '2021-09-20 11:01:50', '2021-09-20 11:01:50'),
(6, 'Chottagram', '2021-09-25 07:34:59', '2021-09-25 07:34:59'),
(7, 'Cumilla', '2021-09-25 07:35:18', '2021-09-25 07:35:18'),
(8, 'Rajshahi', '2021-09-25 07:35:30', '2021-09-25 07:35:30'),
(9, 'Barguna', '2021-09-25 07:41:13', '2021-09-25 07:41:13'),
(10, 'Barisal', '2021-09-25 07:41:23', '2021-09-25 07:41:23'),
(11, 'Bhola', '2021-09-25 07:41:31', '2021-09-25 07:41:31'),
(12, 'Jhalokati', '2021-09-25 07:41:40', '2021-09-25 07:41:40'),
(13, 'Patuakhali', '2021-09-25 07:41:47', '2021-09-25 07:41:47'),
(14, 'Pirojpur', '2021-09-25 07:41:54', '2021-09-25 07:41:54'),
(15, 'Bandarban', '2021-09-25 07:42:00', '2021-09-25 07:42:00'),
(16, 'Brahmanbaria', '2021-09-25 07:42:06', '2021-09-25 07:42:06'),
(17, 'Chandpur', '2021-09-25 07:42:14', '2021-09-25 07:42:14'),
(18, 'chattogram', '2021-09-25 07:42:42', '2021-09-25 07:42:42'),
(19, 'Cox\'s Bazar', '2021-09-25 07:42:53', '2021-09-25 07:42:53'),
(20, 'Khagrachhari', '2021-09-25 07:43:07', '2021-09-25 07:43:07'),
(21, 'Lakshmipur', '2021-09-25 07:43:13', '2021-09-25 07:43:13'),
(22, 'Noakhali', '2021-09-25 07:43:19', '2021-09-25 07:43:19'),
(23, 'Rangamati', '2021-09-25 07:43:26', '2021-09-25 07:43:26'),
(25, 'Faridpur', '2021-09-25 07:43:37', '2021-09-25 07:43:37'),
(26, 'Gazipur', '2021-09-25 07:43:43', '2021-09-25 07:43:43'),
(27, 'Kishoreganj', '2021-09-25 07:45:59', '2021-09-25 07:45:59'),
(28, 'Madaripur', '2021-09-25 07:46:05', '2021-09-25 07:46:05'),
(29, 'Manikganj', '2021-09-25 07:46:33', '2021-09-25 07:46:33'),
(30, 'Munshiganj', '2021-09-25 07:46:40', '2021-09-25 07:46:40'),
(31, 'Narayanganj', '2021-09-25 07:46:46', '2021-09-25 07:46:46'),
(32, 'Narsingdi', '2021-09-25 07:46:52', '2021-09-25 07:46:52'),
(33, 'Rajbari', '2021-09-25 07:46:58', '2021-09-25 07:46:58'),
(34, 'Shariatpur', '2021-09-25 07:47:04', '2021-09-25 07:47:04'),
(35, 'Tangail', '2021-09-25 07:47:14', '2021-09-25 07:47:14'),
(36, 'Bagerhat', '2021-09-25 07:47:22', '2021-09-25 07:47:22'),
(37, 'Chuadanga', '2021-09-25 07:47:30', '2021-09-25 07:47:30'),
(38, 'Jessore', '2021-09-25 07:47:38', '2021-09-25 07:47:38'),
(39, 'Jhenaidah', '2021-09-25 07:50:06', '2021-09-25 07:50:06'),
(40, 'Khulna', '2021-09-25 07:50:11', '2021-09-25 07:50:11'),
(41, 'Kushtia', '2021-09-25 07:50:18', '2021-09-25 07:50:18'),
(42, 'Magura', '2021-09-25 07:50:25', '2021-09-25 07:50:25'),
(43, 'Meherpur', '2021-09-25 07:50:31', '2021-09-25 07:50:31'),
(44, 'Narail', '2021-09-25 07:50:39', '2021-09-25 07:50:39'),
(45, 'Satkhira', '2021-09-25 07:50:50', '2021-09-25 07:50:50'),
(46, 'Jamalpur', '2021-09-25 07:50:56', '2021-09-25 07:50:56'),
(47, 'Mymensingh', '2021-09-25 07:51:03', '2021-09-25 07:51:03'),
(48, 'Netrokona', '2021-09-25 07:51:09', '2021-09-25 07:51:09'),
(49, 'Sherpur', '2021-09-25 07:51:15', '2021-09-25 07:51:15'),
(50, 'Bogra', '2021-09-25 07:51:22', '2021-09-25 07:51:22'),
(51, 'Joypurhat', '2021-09-25 07:51:28', '2021-09-25 07:51:28'),
(52, 'Naogaon', '2021-09-25 07:51:34', '2021-09-25 07:51:34'),
(53, 'Natore', '2021-09-25 07:51:41', '2021-09-25 07:51:41'),
(54, 'Chapainawabganj', '2021-09-25 07:51:46', '2021-09-25 07:51:46'),
(55, 'Pabna', '2021-09-25 07:51:54', '2021-09-25 07:51:54'),
(56, 'Dinajpur', '2021-09-25 07:56:19', '2021-09-25 07:56:19'),
(57, 'Rajshahi', '2021-09-25 07:56:36', '2021-09-25 07:56:36'),
(58, 'Gaibandha', '2021-09-25 07:56:47', '2021-09-25 07:56:47'),
(59, 'Kurigram', '2021-09-25 07:56:54', '2021-09-25 07:56:54'),
(60, 'Lalmonirhat', '2021-09-25 07:57:01', '2021-09-25 07:57:01'),
(61, 'Nilphamari', '2021-09-25 07:57:08', '2021-09-25 07:57:08'),
(62, 'Panchagarh', '2021-09-25 07:57:14', '2021-09-25 07:57:14'),
(63, 'Rangpur', '2021-09-25 07:57:20', '2021-09-25 07:57:20'),
(64, 'Thakurgaon', '2021-09-25 07:57:27', '2021-09-25 07:57:27'),
(65, 'Habiganj', '2021-09-25 07:57:34', '2021-09-25 07:57:34'),
(66, 'Moulvibazar', '2021-09-25 07:57:42', '2021-09-25 07:57:42'),
(67, 'Sunamganj', '2021-09-25 07:57:51', '2021-09-25 07:57:51'),
(68, 'Sylhet', '2021-09-25 07:57:57', '2021-09-25 07:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `featured_products`
--

CREATE TABLE `featured_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `serial` int(11) NOT NULL,
  `status` int(191) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `featured_products`
--

INSERT INTO `featured_products` (`id`, `product_id`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 0, '2021-07-10 04:55:45', '2021-07-10 09:46:58'),
(3, 3, 3, 1, '2021-07-10 05:04:29', '2021-07-10 09:56:29'),
(4, 4, 2, 1, '2021-07-10 05:06:52', '2021-07-10 09:52:43'),
(5, 5, 2, 1, '2021-07-10 05:08:01', '2021-07-10 09:53:07'),
(6, 6, 2, 1, '2021-07-10 05:44:36', '2021-07-10 09:54:09'),
(7, 7, 8, 1, '2021-07-10 06:53:42', '2021-07-10 09:48:59'),
(8, 8, 10, 1, '2021-07-10 06:53:52', '2021-07-10 09:49:28'),
(9, 9, 20, 1, '2021-07-10 06:54:31', '2021-07-26 04:50:14'),
(12, 12, 1, 1, '2021-07-10 06:55:01', '2021-07-10 09:48:46'),
(13, 437, 10, 0, '2021-07-10 06:55:11', '2021-08-20 03:24:30'),
(14, 71, 1, 1, '2021-07-10 06:55:19', '2021-07-10 06:55:19'),
(15, 92, 1, 1, '2021-07-10 06:55:28', '2021-07-10 06:55:28'),
(16, 73, 1, 1, '2021-07-10 06:55:36', '2021-07-10 06:55:36'),
(17, 25, 15, 1, '2021-07-10 09:16:04', '2021-07-10 09:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `front_categories`
--

CREATE TABLE `front_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_categories`
--

INSERT INTO `front_categories` (`id`, `category_id`, `category_slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'charger', 1, '2021-08-19 23:43:23', '2021-08-20 00:06:19'),
(2, 3, 'backpad', 1, '2021-08-20 00:06:30', '2021-08-20 00:06:30'),
(5, 1, 'head-phone', 1, '2021-08-20 03:43:52', '2021-08-20 03:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `front_category_products`
--

CREATE TABLE `front_category_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `front_category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `serial` int(191) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_category_products`
--

INSERT INTO `front_category_products` (`id`, `front_category_id`, `product_id`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 200, 1, 1, '2021-08-20 02:14:54', '2021-08-20 02:14:54'),
(2, 1, 201, 2, 1, '2021-08-20 02:16:23', '2021-08-20 02:16:23'),
(3, 1, 205, 3, 1, '2021-08-20 02:16:34', '2021-08-20 02:16:34'),
(5, 2, 401, 2, 1, '2021-08-20 02:20:28', '2021-08-20 02:20:28'),
(6, 2, 402, 3, 1, '2021-08-20 02:20:38', '2021-08-20 02:20:38'),
(7, 2, 404, 4, 1, '2021-08-20 02:20:47', '2021-08-20 02:20:47'),
(8, 2, 405, 5, 1, '2021-08-20 02:20:57', '2021-08-20 02:20:57'),
(9, 2, 408, 6, 1, '2021-08-20 02:21:08', '2021-08-20 02:21:08'),
(10, 2, 410, 7, 1, '2021-08-20 02:21:19', '2021-08-20 02:21:19'),
(14, 1, 202, 4, 1, '2021-08-20 02:22:12', '2021-08-20 02:22:12'),
(15, 1, 203, 5, 1, '2021-08-20 03:42:23', '2021-08-20 03:42:23'),
(16, 1, 207, 6, 1, '2021-08-20 03:42:30', '2021-08-20 03:42:30'),
(17, 1, 204, 7, 1, '2021-08-20 03:42:38', '2021-08-20 03:42:38'),
(18, 1, 210, 8, 1, '2021-08-20 03:42:45', '2021-08-20 03:42:45'),
(19, 1, 211, 9, 1, '2021-08-20 03:42:51', '2021-08-20 03:42:51'),
(20, 1, 212, 10, 1, '2021-08-20 03:42:58', '2021-08-20 03:42:58'),
(21, 2, 409, 8, 1, '2021-08-20 03:43:14', '2021-08-20 03:43:14'),
(22, 2, 407, 9, 1, '2021-08-20 03:43:21', '2021-08-20 03:43:21'),
(23, 2, 411, 10, 1, '2021-08-20 03:43:27', '2021-08-20 03:43:27'),
(24, 5, 1, 1, 1, '2021-08-20 03:44:02', '2021-08-20 03:44:02'),
(25, 5, 2, 2, 1, '2021-08-20 03:44:08', '2021-08-20 03:44:08'),
(26, 5, 4, 3, 1, '2021-08-20 03:44:14', '2021-08-20 03:44:14'),
(27, 5, 3, 4, 1, '2021-08-20 03:44:20', '2021-08-20 03:44:20'),
(28, 5, 7, 5, 1, '2021-08-20 03:44:26', '2021-08-20 03:44:26'),
(29, 5, 8, 6, 1, '2021-08-20 03:44:32', '2021-08-20 03:44:32'),
(30, 5, 10, 7, 1, '2021-08-20 03:44:39', '2021-08-20 03:44:39'),
(31, 5, 9, 8, 1, '2021-08-20 03:44:45', '2021-08-20 03:44:45'),
(32, 5, 12, 9, 1, '2021-08-20 03:44:54', '2021-08-20 03:44:54'),
(33, 5, 11, 10, 1, '2021-08-20 03:45:01', '2021-08-20 03:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '2021_07_04_181957_create_sliders_table', 1),
(26, '2021_07_10_101315_create_featured_products_table', 2),
(28, '2021_07_13_124549_create_special_offers_table', 3),
(29, '2021_07_30_143759_create_districts_table', 4),
(30, '2021_07_31_155131_create_new_arrivals_table', 5),
(31, '2021_08_19_045807_create_user_messages_table', 6),
(32, '2021_08_19_060338_create_subscribers_table', 7),
(33, '2021_08_19_100437_create_reviews_table', 8),
(34, '2021_08_20_052657_create_front_categories_table', 9),
(35, '2021_08_20_052709_create_front_category_products_table', 9),
(36, '2021_08_20_103057_create_voucher_products_table', 10),
(37, '2021_08_20_124432_create_policies_table', 11),
(38, '2021_08_20_143405_create_contact_us_table', 12),
(39, '2021_08_20_143420_create_about_us_table', 12),
(40, '2021_08_23_095751_create_coupons_table', 13),
(41, '2021_08_23_121253_create_coupon_user_useds_table', 14),
(42, '2021_09_01_080637_create_review_images_table', 15),
(43, '2021_09_26_154632_create_mobile_otps_table', 16),
(44, '2021_09_30_232052_create_ssl_commerz_transactions_table', 17),
(45, '2021_10_02_233910_create_shipping_addresses_table', 18),
(46, '2021_10_02_233927_create_billing_addresses_table', 18),
(47, '2021_10_28_164917_create_coupon_valid_users_table', 19),
(48, '2021_11_03_154909_create_coupon_groups_table', 20),
(49, '2021_11_03_160020_create_coupon_group_users_table', 21);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_otps`
--

CREATE TABLE `mobile_otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp_code` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_otps`
--

INSERT INTO `mobile_otps` (`id`, `mobile`, `otp_code`, `created_at`, `updated_at`) VALUES
(1, '01889967518', 898065, NULL, NULL),
(2, '01306658278', 913227, NULL, NULL),
(3, '01737773393', 507894, NULL, NULL),
(4, '01773351552', 342078, NULL, NULL),
(5, '01889967514', 484459, NULL, NULL),
(6, '01889967515', 368702, NULL, NULL),
(7, '01717772609', 753254, NULL, NULL),
(8, '3', 447731, NULL, NULL),
(9, '8801737773393', 284201, NULL, NULL),
(10, '01889967516', 589396, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `new_arrivals_products`
--

CREATE TABLE `new_arrivals_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `serial` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `new_arrivals_products`
--

INSERT INTO `new_arrivals_products` (`id`, `product_id`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(4, 55, 1, 1, '2021-08-21 06:17:03', '2021-08-21 06:17:03'),
(5, 3, 2, 1, '2021-08-21 06:20:25', '2021-08-21 06:20:25'),
(6, 5, 3, 1, '2021-08-21 06:20:33', '2021-08-21 06:20:33'),
(7, 7, 4, 1, '2021-08-21 06:20:42', '2021-08-21 06:21:05'),
(8, 8, 5, 1, '2021-08-21 06:21:15', '2021-08-21 06:21:15'),
(9, 38, 6, 1, '2021-08-21 06:21:24', '2021-08-21 06:21:24'),
(10, 61, 7, 1, '2021-08-21 06:21:33', '2021-08-21 06:21:33'),
(11, 72, 8, 1, '2021-08-21 06:21:44', '2021-08-21 06:21:44'),
(12, 94, 9, 1, '2021-08-21 06:21:55', '2021-08-21 06:21:55'),
(13, 95, 10, 1, '2021-08-21 06:22:04', '2021-08-21 06:22:04');

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
  `post_code` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `invoice`, `delivery_charge`, `vat`, `tax`, `total_price`, `product_discount_price`, `order_status`, `payment_method`, `voucher_code`, `voucher_mobile`, `voucher_amount`, `has_coupon`, `coupon_code`, `coupon_discount_amount`, `total_discount_amount`, `order_price`, `partial_payment`, `payment_status`, `payment_time`, `paid_amount`, `due_amount`, `name`, `mobile`, `email`, `district_id`, `city_town`, `address`, `post_code`, `note`, `created_at`, `updated_at`) VALUES
(1, 4, '000001', 'MX-11070188', 90.00, 0.00, 0.00, 45.00, 0.00, '3', 3, NULL, NULL, 0.00, 'no', NULL, 0.00, 0.00, 100.00, 10.00, 1, '2021-12-31 00:13:34', 100.00, 0.00, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2021-12-29 17:27:16', '2022-01-18 16:40:33'),
(2, 4, '000002', 'MX-28790292', 90.00, 0.00, 0.00, 45.00, 0.00, '3', 3, NULL, NULL, 0.00, 'no', NULL, 0.00, 0.00, 21.00, 41.00, 1, '2021-12-31 00:04:53', 21.00, 0.00, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2021-12-29 17:57:12', '2022-01-25 14:15:27'),
(3, 4, '000003', 'MX-40388575', 90.00, 0.00, 0.00, 1.00, 0.00, '3', 3, NULL, NULL, 0.00, 'no', NULL, 0.00, 0.00, 91.00, 27.00, 1, '2021-12-31 01:14:28', 91.00, 0.00, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2021-12-29 18:01:52', '2022-01-25 14:17:53'),
(4, 4, '000004', 'MX-41568668', 90.00, 0.00, 0.00, 45.00, 0.00, '3', 3, NULL, NULL, 0.00, 'no', NULL, 0.00, 0.00, 135.00, 41.00, 1, '2021-12-31 00:09:21', 135.00, 0.00, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2021-12-29 18:04:15', '2022-01-25 14:18:37'),
(5, 4, '000005', 'MX-56205055', 90.00, 0.00, 0.00, 1.00, 0.00, '4', 1, NULL, NULL, 0.00, 'no', NULL, 0.00, 0.00, 91.00, 27.00, 2, NULL, 0.00, 91.00, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2021-12-30 19:17:20', '2022-01-06 14:09:13'),
(6, 4, '000006', 'MX-28968537', 90.00, 0.00, 0.00, 1.00, 0.00, '4', 1, NULL, NULL, 0.00, 'no', NULL, 0.00, 0.00, 20.00, 10.00, 0, NULL, 0.00, 91.00, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2021-12-30 19:19:21', '2022-01-18 16:07:32'),
(7, 4, '000007', 'MX-21696319', 90.00, 0.00, 0.00, 10.00, 0.00, '3', 3, NULL, NULL, 0.00, 'no', NULL, 0.00, 0.00, 10.00, 5.00, 1, '2022-01-01 20:39:45', 10.00, 0.00, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2022-01-01 14:37:43', '2022-01-25 14:31:31'),
(8, 4, '000008', 'MX-44166545', 90.00, 0.00, 0.00, 140.00, 0.00, '4', 1, NULL, NULL, 0.00, 'no', NULL, 0.00, 0.00, 230.00, 115.00, 0, NULL, 0.00, 230.00, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2022-01-01 16:18:56', '2022-01-18 16:06:05'),
(9, 4, '000009', 'MX-94194801', 90.00, 0.00, 0.00, 400.00, 0.00, '0', 1, NULL, NULL, 0.00, 'no', NULL, 0.00, 0.00, 490.00, 245.00, 0, NULL, 0.00, 490.00, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, NULL, '2022-01-29 15:52:15', '2022-01-29 15:52:15');

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

--
-- Dumping data for table `order_prices`
--

INSERT INTO `order_prices` (`id`, `session_id`, `user_id`, `total_price`, `product_discount_price`, `order_price`, `delivery_charge`, `vat`, `tax`, `coupon_code`, `coupon_discount`, `created_at`, `updated_at`) VALUES
(1, 'Ka2HMCkoLvLLtaSOeWUYk21fTqmSTwhxHjCo1vyh', 4, 45.00, 0.00, 135.00, 90.00, 0.00, 0.00, NULL, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `order_price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `user_id`, `order_id`, `product_id`, `size_id`, `color_id`, `order_price`, `quantity`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 71, NULL, NULL, 45.00, 1, 45.00, '2021-12-29 17:27:16', '2021-12-29 17:27:16'),
(2, 4, 2, 71, NULL, NULL, 45.00, 1, 45.00, '2021-12-29 17:57:12', '2021-12-29 17:57:12'),
(3, 4, 3, 12, NULL, NULL, 1.00, 1, 1.00, '2021-12-29 18:01:52', '2021-12-29 18:01:52'),
(4, 4, 4, 71, NULL, NULL, 45.00, 1, 45.00, '2021-12-29 18:04:15', '2021-12-29 18:04:15'),
(5, 4, 5, 12, NULL, NULL, 1.00, 1, 1.00, '2021-12-30 19:17:20', '2021-12-30 19:17:20'),
(6, 4, 6, 12, NULL, NULL, 1.00, 1, 1.00, '2021-12-30 19:19:21', '2021-12-30 19:19:21'),
(7, 4, 7, 12, NULL, NULL, 10.00, 1, 10.00, '2022-01-01 14:37:43', '2022-01-01 14:37:43'),
(8, 4, 8, 92, NULL, NULL, 140.00, 1, 140.00, '2022-01-01 16:18:56', '2022-01-01 16:18:56'),
(9, 4, 9, 401, NULL, NULL, 400.00, 1, 400.00, '2022-01-29 15:52:15', '2022-01-29 15:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `privacy_policy` text COLLATE utf8mb4_unicode_ci,
  `terms_condition` text COLLATE utf8mb4_unicode_ci,
  `return_policy` text COLLATE utf8mb4_unicode_ci,
  `refund_policy` text COLLATE utf8mb4_unicode_ci,
  `delivery_information` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `privacy_policy`, `terms_condition`, `return_policy`, `refund_policy`, `delivery_information`, `created_at`, `updated_at`) VALUES
(1, '<p><strong>Privacy and Confidentiality</strong></p>\r\n\r\n<p>Welcome to the Mobixpress.com.bd website (the &quot;Site&quot;) operated by Mobi Xpress Bangladesh Ltd. We respect your privacy and want to protect your personal information. To learn more, please read this Privacy Policy.<br />\r\n<br />\r\nThis Privacy Policy explains how we collect, use and (under certain conditions) disclose your personal information. This Privacy Policy also explains the steps we have taken to secure your personal information. Finally, this Privacy Policy explains your options regarding the collection, use and disclosure of your personal information. By visiting the Site directly or through another site, you accept the practices described in this Policy.<br />\r\n<br />\r\nData protection is a matter of trust and your privacy is important to us. We shall therefore only use your name and other information which relates to you in the manner set out in this Privacy Policy. We will only collect information where it is necessary for us to do so and we will only collect information if it is relevant to our dealings with you.<br />\r\n<br />\r\nWe will only keep your information for as long as we are either required to by law or as is relevant for the purposes for which it was collected.<br />\r\n<br />\r\nYou can visit the Site and browse without having to provide personal details. During your visit to the Site you remain anonymous and at no time can we identify you unless you have an account on the Site and log on with your user name and password.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p><strong>1. Data that we collect</strong></p>\r\n\r\n<p>We may collect various pieces of information if you seek to place an order for a product with us on the Site.<br />\r\n<br />\r\nWe collect, store and process your data for processing your purchase on the Site and any possible later claims, and to provide you with our services. We may collect personal information including, but not limited to, your title, name, gender, date of birth, email address, postal address, delivery address (if different), telephone number, mobile number, fax number, payment details, payment card details or bank account details.<br />\r\n<br />\r\nWe will use the information you provide to enable us to process your orders and to provide you with the services and information offered through our website and which you request. Further, we will use the information you provide to administer your account with us; verify and carry out financial transactions in relation to payments you make; audit the downloading of data from our website; improve the layout and/or content of the pages of our website and customize them for users; identify visitors on our website; carry out research on our users&#39; demographics; send you information we think you may find useful or which you have requested from us, including information about our products and services, provided you have indicated that you have not objected to being contacted for these purposes. Subject to obtaining your consent we may contact you by email with details of other products and services. If you prefer not to receive any marketing communications from us, you can opt out at any time.<br />\r\n<br />\r\nWe may pass your name and address on to a third party in order to make delivery of the product to you (for example to our courier or supplier). You must only submit to us the Site information which is accurate and not misleading and you must keep it up to date and inform us of changes.<br />\r\n<br />\r\nYour actual order details may be stored with us but for security reasons cannot be retrieved directly by us. However, you may access this information by logging into your account on the Site. Here you can view the details of your orders that have been completed, those which are open and those which are shortly to be dispatched and administer your address details, bank details ( for refund purposes) and any newsletter to which you may have subscribed. You undertake to treat the personal access data confidentially and not make it available to unauthorized third parties. We cannot assume any liability for misuse of passwords unless this misuse is our fault.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Other uses of your Personal Information</strong></p>\r\n\r\n<p>We may use your personal information for opinion and market research. Your details are anonymous and will only be used for statistical purposes. You can choose to opt out of this at any time. Any answers to surveys or opinion polls we may ask you to complete will not be forwarded on to third parties. Disclosing your email address is only necessary if you would like to take part in competitions. We save the answers to our surveys separately from your email address.<br />\r\n<br />\r\nWe may also send you other information about us, the Site, our other websites, our products, sales promotions, our newsletters, anything relating to other companies in our group or our business partners. If you would prefer not to receive any of this additional information as detailed in this paragraph (or any part of it) please click the &#39;unsubscribe&#39; link in any email that we send to you. Within 7 working days (days which are neither (i) a Sunday, nor (ii) a public holiday anywhere in Bangladesh) of receipt of your instruction we will cease to send you information as requested. If your instruction is unclear we will contact you for clarification.<br />\r\n<br />\r\nWe may further anonymize data about users of the Site generally and use it for various purposes, including ascertaining the general location of the users and usage of certain aspects of the Site or a link contained in an email to those registered to receive them, and supplying that anonymized data to third parties such as publishers. However, that anonymized data will not be capable of identifying you personally.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Competitions</strong></p>\r\n\r\n<p>For any competition we use the data to notify winners and advertise our offers. You can find more details where applicable in our participation terms for the respective competition.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Third Parties and Links</strong></p>\r\n\r\n<p>We may pass your details to other companies in our group. We may also pass your details to our agents and subcontractors to help us with any of our uses of your data set out in our Privacy Policy. For example, we may use third parties to assist us with delivering products to you, to help us to collect payments from you, to analyze data and to provide us with marketing or customer service assistance.<br />\r\n<br />\r\nWe may exchange information with third parties for the purposes of fraud protection and credit risk reduction. We may transfer our databases containing your personal information if we sell our business or part of it. Other than as set out in this Privacy Policy, we shall NOT sell or disclose your personal data to third parties without obtaining your prior consent unless this is necessary for the purposes set out in this Privacy Policy or unless we are required to do so by law. The Site may contain advertising of third parties and links to other sites or frames of other sites. Please be aware that we are not responsible for the privacy practices or content of those third parties or other sites, nor for any third party to whom we transfer your data in accordance with our Privacy Policy.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p><strong>2. Cookies</strong></p>\r\n\r\n<p>The acceptance of cookies is not a requirement for visiting the Site. However we would like to point out that the use of the &#39;basket&#39; functionality on the Site and ordering is only possible with the activation of cookies. Cookies are tiny text files which identify your computer to our server as a unique user when you visit certain pages on the Site and they are stored by your Internet browser on your computer&#39;s hard drive. Cookies can be used to recognize your Internet Protocol address, saving you time while you are on, or want to enter, the Site. We only use cookies for your convenience in using the Site (for example to remember who you are when you want to amend your shopping cart without having to re-enter your email address) and not for obtaining or using any other information about you (for example targeted advertising). Your browser can be set to not accept cookies, but this would restrict your use of the Site. Please accept our assurance that our use of cookies does not contain any personal or private details and are free from viruses. If you want to find out more information about cookies, go to http://www.allaboutcookies.org or to find out about removing them from your browser, go to http://www.allaboutcookies.org/manage-cookies/index.html.<br />\r\n<br />\r\nThis website uses Google Analytics, a web analytics service provided by Google, Inc. (&quot;Google&quot;). Google Analytics uses cookies, which are text files placed on your computer, to help the website analyze how users use the site. The information generated by the cookie about your use of the website (including your IP address) will be transmitted to and stored by Google on servers in the United States. Google will use this information for the purpose of evaluating your use of the website, compiling reports on website activity for website operators and providing other services relating to website activity and internet usage. Google may also transfer this information to third parties where required to do so by law, or where such third parties process the information on Google&#39;s behalf. Google will not associate your IP address with any other data held by Google. You may refuse the use of cookies by selecting the appropriate settings on your browser, however please note that if you do this you may not be able to use the full functionality of this website. By using this website, you consent to the processing of data about you by Google in the manner and for the purposes set out above.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3. Security</strong></p>\r\n\r\n<p>We have in place appropriate technical and security measures to prevent unauthorized or unlawful access to or accidental loss of or destruction or damage to your information. When we collect data through the Site, we collect your personal details on a secure server. We use firewalls on our servers. Our security procedures mean that we may occasionally request proof of identity before we disclose personal information to you. You are responsible for protecting against unauthorized access to your password and to your computer.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p><strong>4. Your rights</strong></p>\r\n\r\n<p>If you are concerned about your data you have the right to request access to the personal data which we may hold or process about you. You have the right to require us to correct any inaccuracies in your data free of charge. At any stage you also have the right to ask us to stop using your personal data for direct marketing purposes</p>', '<p><strong>TERMS AND CONDITIONS</strong></p>\r\n\r\n<p><strong>1. INTRODUCTION</strong></p>\r\n\r\n<p>Welcome to Mobixpress.com.bd also hereby known as &ldquo;we&quot;, &quot;us&quot; or &quot;MobiXpress&quot;. We are an online marketplace and these are the terms and conditions governing your access and use of MobiXpress along with its related sub-domains, sites, mobile app, services and tools (the &quot;Site&quot;). By using the Site, you hereby accept these terms and conditions (including the linked information herein) and represent that you agree to comply with these terms and conditions (the &quot;User Agreement&quot;). This User Agreement is deemed effective upon your use of the Site which signifies your acceptance of these terms. If you do not agree to be bound by this User Agreement please do not access, register with or use this Site.<br />\r\n<br />\r\nThe Site reserves the right to change, modify, add, or remove portions of these Terms and Conditions at any time without any prior notification. Changes will be effective when posted on the Site with no other notice provided. Please check these Terms and Conditions regularly for updates. Your continued use of the Site following the posting of changes to Terms and Conditions of use constitutes your acceptance of those changes.</p>\r\n\r\n<p><strong>2. CONDITIONS OF USE</strong></p>\r\n\r\n<p><strong>2.1 YOUR ACCOUNT</strong></p>\r\n\r\n<p>To access certain services offered by the platform, we may require that you create an account with us or provide personal information to complete the creation of an account. We may at any time in our sole and absolute discretion, invalidate the username and/or password without giving any reason or prior notice and shall not be liable or responsible for any losses suffered by, caused by, arising out of, in connection with or by reason of such request or invalidation.<br />\r\n<br />\r\nYou are responsible for maintaining the confidentiality of your user identification, password, account details and related private information. You agree to accept this responsibility and ensure your account and its related details are maintained securely at all times and all necessary steps are taken to prevent misuse of your account. You should inform us immediately if you have any reason to believe that your password has become known to anyone else, or if the password is being, or is likely to be, used in an unauthorized manner. You agree and acknowledge that any use of the Site and related services offered and/or any access to private information, data or communications using your account and password shall be deemed to be either performed by you or authorized by you as the case may be. You agree to be bound by any access of the Site and/or use of any services offered by the Site (whether such access or use are authorized by you or not). You agree that we shall be entitled (but not obliged) to act upon, rely on or hold you solely responsible and liable in respect thereof as if the same were carried out or transmitted by you. You further agree and acknowledge that you shall be bound by and agree to fully indemnify us against any and all losses arising from the use of or access to the Site through your account.<br />\r\n<br />\r\nPlease ensure that the details you provide us with are correct and complete at all times. You are obligated to update details about your account in real time by accessing your account online. For pieces of information, you are not able to update by accessing Your Account on the Site, you must inform us via our customer service communication channels to assist you with these changes. We reserve the right to refuse access to the Site, terminate accounts, remove or edit content at any time without prior notice to you. We may at any time in our sole and absolute discretion, request that you update your Personal Data or forthwith invalidate the account or related details without giving any reason or prior notice and shall not be liable or responsible for any losses suffered by or caused by you or arising out of or in connection with or by reason of such request or invalidation. You hereby agree to change your password from time to time and to keep your account secure and also shall be responsible for the confidentiality of your account and liable for any disclosure or use (whether such use is authorized or not) of the username and/or password.</p>\r\n\r\n<p><strong>2.2 PRIVACY</strong></p>\r\n\r\n<p>Please review our Privacy Agreement, which also governs your visit to the Site. The personal information / data provided to us by you or your use of the Site will be treated as strictly confidential, in accordance with the Privacy Agreement and applicable laws and regulations. If you object to your information being transferred or used in the manner specified in the Privacy Agreement, please do not use the Site.</p>\r\n\r\n<p><strong>2.3 PLATFORM FOR COMMUNICATION</strong></p>\r\n\r\n<p>You agree, understand and acknowledge that the Site is an online platform that enables you to purchase products listed at the price indicated therein at any time from any location using a payment method of your choice. You further agree and acknowledge that we are only a facilitator and cannot be a party to or control in any manner any transactions on the Site or on a payment gateway as made available to you by an independent service provider. Accordingly, the contract of sale of products on the Site shall be a strictly bipartite contract between you and the sellers on our Site while the payment processing occurs between you, the service provider and in case of prepayments with electronic cards your issuer bank. Accordingly, the contract of payment on the Site shall be strictly a bipartite contract between you and the service provider as listed on our Site.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.4 CONTINUED AVAILABILITY OF THE SITE</strong></p>\r\n\r\n<p>We will do our utmost to ensure that access to the Site is consistently available and is uninterrupted and error-free. However, due to the nature of the Internet and the nature of the Site, this cannot be guaranteed. Additionally, your access to the Site may also be occasionally suspended or restricted to allow for repairs, maintenance, or the introduction of new facilities or services at any time without prior notice. We will attempt to limit the frequency and duration of any such suspension or restriction.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.5 LICENSE TO ACCESS THE SITE</strong></p>\r\n\r\n<p>We require that by accessing the Site, you confirm that you can form legally binding contracts and therefore you confirm that you are at least 18 years of age or are accessing the Site under the supervision of a parent or legal guardian. We grant you a non-transferable, revocable and non-exclusive license to use the Site, in accordance with the Terms and Conditions described herein, for the purposes of shopping for personal items and services as listed to be sold on the Site. Commercial use or use on behalf of any third party is prohibited, except as explicitly permitted by us in advance. If you are registering as a business entity, you represent that you have the authority to bind that entity to this User Agreement and that you and the business entity will comply with all applicable laws relating to online trading. No person or business entity may register as a member of the Site more than once. Any breach of these Terms and Conditions shall result in the immediate revocation of the license granted in this paragraph without notice to you.<br />\r\n<br />\r\nContent provided on this Site is solely for informational purposes. Product representations including price, available stock, features, add-ons and any other details as expressed on this Site are the responsibility of the vendors displaying them and is not guaranteed as completely accurate by us. Submissions or opinions expressed on this Site are those of the individual(s) posting such content and may not reflect our opinions.<br />\r\n<br />\r\nWe grant you a limited license to access and make personal use of this Site, but not to download (excluding page caches) or modify the Site or any portion of it in any manner. This license does not include any resale or commercial use of this Site or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this Site or its contents; any downloading or copying of account information for the benefit of another seller; or any use of data mining, robots, or similar data gathering and extraction tools.<br />\r\n<br />\r\nThis Site or any portion of it (including but not limited to any copyrighted material, trademarks, or other proprietary information) may not be reproduced, duplicated, copied, sold, resold, visited, distributed or otherwise exploited for any commercial purpose without express written consent by us as may be applicable.<br />\r\n<br />\r\nYou may not frame or use framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) without our express written consent. You may not use any meta tags or any other text utilizing our name or trademark without our express written consent, as applicable. Any unauthorized use terminates the permission or license granted by us to you for access to the Site with no prior notice. You may not use our logo or other proprietary graphic or trademark as part of an external link for commercial or other purposes without our express written consent, as may be applicable.<br />\r\n<br />\r\nYou agree and undertake not to perform restricted activities listed within this section; undertaking these activities will result in an immediate cancellation of your account, services, reviews, orders or any existing incomplete transaction with us and in severe cases may also result in legal action:</p>\r\n\r\n<p>&middot;&nbsp; Refusal to comply with the Terms and Conditions described herein or any other guidelines and policies related to the use of the Site as available on the Site at all times.</p>\r\n\r\n<p>&middot;&nbsp; Impersonate any person or entity or to falsely state or otherwise misrepresent your affiliation with any person or entity.</p>\r\n\r\n<p>&middot;&nbsp; Use the Site for illegal purposes.</p>\r\n\r\n<p>&middot;&nbsp; Attempt to gain unauthorized access to or otherwise interfere or disrupt other computer systems or networks connected to the Platform or Services.</p>\r\n\r\n<p>&middot;&nbsp; Interfere with another&rsquo;s utilization and enjoyment of the Site.</p>\r\n\r\n<p>&middot;&nbsp; Post, promote or transmit through the Site any prohibited materials as deemed illegal by The People&#39;s Republic of Bangladesh.</p>\r\n\r\n<p>&middot;&nbsp; Use or upload, in any way, any software or material that contains, or which you have reason to suspect that contains, viruses, damaging components, malicious code or harmful components which may impair or corrupt the Site&rsquo;s data or damage or interfere with the operation of another Customer&rsquo;s computer or mobile device or the Site and use the Site other than in conformance with the acceptable use policies of any connected computer networks, any applicable Internet standards and any other applicable laws.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.6 YOUR CONDUCT</strong></p>\r\n\r\n<p>You must not use the website in any way that causes, or is likely to cause, the Site or access to it to be interrupted, damaged or impaired in any way. You must not engage in activities that could harm or potentially harm the Site, its employees, officers, representatives, stakeholders or any other party directly or indirectly associated with the Site or access to it to be interrupted, damaged or impaired in any way. You understand that you, and not us, are responsible for all electronic communications and content sent from your computer to us and you must use the Site for lawful purposes only. You are strictly prohibited from using the Site<br />\r\n<br />\r\nfor fraudulent purposes, or in connection with a criminal offense or other unlawful activity to send, use or reuse any material that does not belong to you; or is illegal, offensive (including but not limited to material that is sexually explicit content or which promotes racism, bigotry, hatred or physical harm), deceptive, misleading, abusive, indecent, harassing, blasphemous, defamatory, libelous, obscene, pornographic, pedophilic or menacing; ethnically objectionable, disparaging or in breach of copyright, trademark, confidentiality, privacy or any other proprietary information or right; or is otherwise injurious to third parties; or relates to or promotes money laundering or gambling; or is harmful to minors in any way; or impersonates another person; or threatens the unity, integrity, security or sovereignty of Bangladesh or friendly relations with foreign States; or objectionable or otherwise unlawful in any manner whatsoever; or which consists of or contains software viruses, political campaigning, commercial solicitation, chain letters, mass mailings or any &quot;spam&rdquo; Use the Site for illegal purposes. to cause annoyance, inconvenience or needless anxiety for any other purposes that is other than what is intended by us</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.7 YOUR SUBMISSION</strong></p>\r\n\r\n<p>Anything that you submit to the Site and/or provide to us, including but not limited to, questions, reviews, comments, and suggestions (collectively, &quot;Submissions&quot;) will become our sole and exclusive property and shall not be returned to you. In addition to the rights applicable to any Submission, when you post comments or reviews to the Site, you also grant us the right to use the name that you submit, in connection with such review, comment, or other content. You shall not use a false e-mail address, pretend to be someone other than yourself or otherwise mislead us or third parties as to the origin of any Submissions. We may, but shall not be obligated to, remove or edit any Submissions without any notice or legal course applicable to us in this regard.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.8 CLAIMS AGAINST OBJECTIONABLE CONTENT</strong></p>\r\n\r\n<p>We list thousands of products for sale offered by numerous brands on the Site and host multiple comments on listings, it is not possible for us to be aware of the contents of each product listed for sale, or each comment or review that is displayed. Accordingly, we operate on a &quot;claim, review and takedown&quot; basis. If you believe that any content on the Site is illegal, offensive (including but not limited to material that is sexually explicit content or which promotes racism, bigotry, hatred or physical harm), deceptive, misleading, abusive, indecent, harassing, blasphemous, defamatory, libelous, obscene, pornographic, pedophilic or menacing; ethnically objectionable, disparaging; or is otherwise injurious to third parties; or relates to or promotes money laundering or gambling; or is harmful to minors in any way; or impersonates another person; or threatens the unity, integrity, security or sovereignty of Bangladesh or friendly relations with foreign States; or objectionable or otherwise unlawful in any manner whatsoever; or which consists of or contains software viruses, (&quot; objectionable content &quot;), please notify us immediately by following by writing to us on legal@Mobixpress.com.bd. We will make all practical endeavors to investigate and remove valid objectionable content complained about within a reasonable amount of time.<br />\r\n<br />\r\nPlease ensure to provide your name, address, contact information and as many relevant details of the claim including name of objectionable content party, instances of objection, proof of objection amongst other. Please note that providing incomplete details will render your claim invalid and unusable for legal purposes.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2.9 CLAIMS AGAINST INFRINGING CONTENT</strong></p>\r\n\r\n<p>We respect the intellectual property of others. If you believe that your intellectual property rights have been used in a way that gives rise to concerns of infringement, please write to us at legal@Mobixpress.com.bd and we will make all reasonable efforts to address your concern within a reasonable amount of time. Please ensure to provide your name, address, contact information and as many relevant details of the claim including name of infringing party, instances of infringement, proof of infringement amongst other. Please note that providing incomplete details will render your claim invalid and unusable for legal purposes. In addition, providing false or misleading information may be considered a legal offense and may be followed by legal proceedings.<br />\r\n<br />\r\nWe also respect a manufacturer&#39;s right to enter into exclusive distribution or resale agreements for its products. However, violations of such agreements do not constitute intellectual property rights infringement. As the enforcement of these agreements is a matter between the manufacturer, distributor and/or respective reseller, it would not be appropriate for us to assist in the enforcement of such activities. While we cannot provide legal advice, nor share private information as protected by the law, we recommend that any questions or concerns regarding your rights may be routed to a legal specialist.</p>\r\n\r\n<p><strong>2.10 TRADEMARKS AND COPYRIGHTS</strong></p>\r\n\r\n<p>Mobixpress.com.bd, MobiXpress logo and other marks indicated on our Site are trademarks or registered trademarks in the relevant jurisdiction(s). Our graphics, logos, page headers, button icons, scripts and service names are the trademarks or trade dress and may not be used in connection with any product or service that does not belong to us or in any manner that is likely to cause confusion among customers, or in any manner that disparages or discredits us. All other trademarks that appear on this Site are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by us.<br />\r\n<br />\r\nAll intellectual property rights, whether registered or unregistered, in the Site, information content on the Site and all the website design, including, but not limited to text, graphics, software, photos, video, music, sound, and their selection and arrangement, and all software compilations, underlying source code and software shall remain our property. The entire contents of the Site also are protected by copyright as a collective work under Bangladeshi copyright laws and international conventions. All rights are reserved.</p>\r\n\r\n<p><strong>2.11 DISCLAIMER</strong></p>\r\n\r\n<p>You acknowledge and undertake that you are accessing the services on the Site and transacting at your own risk and are using your best and prudent judgment before entering into any transactions through the Site. We shall neither be liable nor responsible for any actions or inactions of sellers nor any breach of conditions, representations or warranties by the sellers or manufacturers of the products and hereby expressly disclaim and any all responsibility and liability in that regard. We shall not mediate or resolve any dispute or disagreement between you and the sellers or manufacturers of the products.<br />\r\n<br />\r\nWe further expressly disclaim any warranties or representations (express or implied) in respect of quality, suitability, accuracy, reliability, completeness, timeliness, performance, safety, merchantability, fitness for a particular purpose, or legality of the products listed or displayed or transacted or the content (including product or pricing information and/or specifications) on the Site. While we have taken precautions to avoid inaccuracies in content, this Site, all content, information (including the price of products), software, products, services and related graphics are provided as is basis, without warranty of any kind. We do not implicitly or explicitly support or endorse the sale or purchase of any products on the Site. At no time shall any right, title or interest in the products sold through or displayed on the Site vest with us nor shall MobiXpress have any obligations or liabilities in respect of any transactions on the Site.<br />\r\n<br />\r\nWe shall neither be liable or responsible for any actions or inactions of any other service provider as listed on our Site which includes but is not limited to payment providers, instalment offerings, warranty services amongst others.</p>\r\n\r\n<p><strong>2.12 THIRD PARTY BUSINESSES</strong></p>\r\n\r\n<p>Parties other than MobiXpress and its affiliates may operate stores, provide services, or sell product lines on the Site. For example, businesses and individuals offer products via Marketplace. In addition, we provide links to the websites of affiliated companies and certain other businesses. We are not responsible for examining or evaluating, and we do not warrant or endorse the offerings of any of these businesses or individuals, or the content of their websites. We do not assume any responsibility or liability for the actions, products, and content of any of these and any other third-parties. You can tell when a third-party is involved in your transactions by reviewing your transaction carefully, and we may share customer information related to those transactions with that third-party. You should carefully review their privacy statements and related terms and conditions.</p>\r\n\r\n<p><strong>2.14 COMMUNICATING WITH US</strong></p>\r\n\r\n<p>When you visit the Site, or send e-mails to us, you are communicating with us electronically. You will be required to provide a valid phone number while placing an order with us. We may communicate with you by e-mail, SMS, phone call or by posting notices on the Site or by any other mode of communication we choose to employ. For contractual purposes, you consent to receive communications (including transactional, promotional and/or commercial messages), from us with respect to your use of the website (and/or placement of your order) and agree to treat all modes of communication with the same importance.</p>\r\n\r\n<p><strong>2.15 LOSSES</strong></p>\r\n\r\n<p>We will not be responsible for any business or personal losses (including but not limited to loss of profits, revenue, contracts, anticipated savings, data, goodwill, or wasted expenditure) or any other indirect or consequential loss that is not reasonably foreseeable to both you and us when you commenced using the Site.</p>\r\n\r\n<p><strong>2.16 AMENDMENTS TO CONDITIONS OR ALTERATIONS OF SERVICE AND RELATED PROMISE</strong></p>\r\n\r\n<p>We reserve the right to make changes to the Site, its policies, these terms and conditions and any other publicly displayed condition or service promise at any time. You will be subject to the policies and terms and conditions in force at the time you used the Site unless any change to those policies or these conditions is required to be made by law or government authority (in which case it will apply to orders previously placed by you). If any of these conditions is deemed invalid, void, or for any reason unenforceable, that condition will be deemed severable and will not affect the validity and enforceability of any remaining condition.</p>\r\n\r\n<p><strong>2.17 EVENTS BEYOND OUR CONTROL</strong></p>\r\n\r\n<p>We will not be held responsible for any delay or failure to comply with our obligations under these conditions if the delay or failure arises from any cause which is beyond our reasonable control. This condition does not affect your statutory rights.</p>\r\n\r\n<p><strong>2.18 WAIVER</strong></p>\r\n\r\n<p>You acknowledge and recognize that we are a private commercial enterprise and reserve the right to conduct business to achieve our objectives in a manner we deem fit. You also acknowledge that if you breach the conditions stated on our Site and we take no action, we are still entitled to use our rights and remedies in any other situation where you breach these conditions.</p>\r\n\r\n<p><strong>2.19 TERMINATION</strong></p>\r\n\r\n<p>In addition to any other legal or equitable remedies, we may, without prior notice to you, immediately terminate the Terms and Conditions or revoke any or all of your rights granted under the Terms and Conditions. Upon any termination of this Agreement, you shall immediately cease all access to and use of the Site and we shall, in addition to any other legal or equitable remedies, immediately revoke all password(s) and account identification issued to you and deny your access to and use of this Site in whole or in part. Any termination of this agreement shall not affect the respective rights and obligations (including without limitation, payment obligations) of the parties arising before the date of termination. You furthermore agree that the Site shall not be liable to you or to any other person as a result of any such suspension or termination. If you are dissatisfied with the Site or with any terms, conditions, rules, policies, guidelines, or practices in operating the Site, your sole and exclusive remedy is to discontinue using the Site.</p>\r\n\r\n<p><strong>2.20 GOVERNING LAW AND JURISDICTION</strong></p>\r\n\r\n<p>These terms and conditions are governed by and construed in accordance with the laws of The People&#39;s Republic of Bangladesh. You agree that the courts, tribunals and/or quasi-judicial bodies located in Dhaka, Bangladesh shall have the exclusive jurisdiction on any dispute arising inside Bangladesh under this Agreement.</p>\r\n\r\n<p><strong>2.21 CONTACT US</strong></p>\r\n\r\n<p>You may reach us (Mobile - +8801765776600) , (Email &ndash; support@mobixpress.com)</p>\r\n\r\n<p><strong>2.22 OUR SOFTWARE</strong></p>\r\n\r\n<p>Our software includes any software (including any updates or upgrades to the software and any related documentation) that we make available to you from time to time for your use in connection with the Site (the &quot;Software&quot;).<br />\r\n<br />\r\nYou may use the software solely for purposes of enabling you to use and enjoy our services as permitted by the Terms and Conditions and any related applicable terms as available on the Site. You may not incorporate any portion of the Software into your own programs or compile any portion of it in combination with your own programs, transfer it for use with another service, or sell, rent, lease, lend, loan, distribute or sub-license the Software or otherwise assign any rights to the Software in whole or in part. You may not use the Software for any illegal purpose. We may cease providing you service and we may terminate your right to use the Software at any time. Your rights to use the Software will automatically terminate without notice from us if you fail to comply with any of the Terms and Conditions listed here or across the Site. Additional third-party terms contained within the Site or distributed as such that are specifically identified in related documentation may apply and will govern the use of such software in the event of a conflict with these Terms and Conditions. All software used in any of our services is our property and/or our affiliates or its software suppliers and protected by the laws of Bangladesh including but not limited to any other applicable copyright laws.<br />\r\n<br />\r\nWhen you use the Site, you may also be using the services of one or more third parties, such as a wireless carrier or a mobile platform provider. Your use of these third party services may be subject to separate policies, terms of use, and fees of these third parties. You may not, and you will not encourage, assist or authorize any other person to copy, modify, reverse engineer, decompile or disassemble, or otherwise tamper with our software whether in whole or in part, or create any derivative works from or of the Software. In order to keep the Software up-to-date, we may offer automatic or manual updates at any time and without notice to you.</p>\r\n\r\n<p><strong>2.23 CONDITIONS OF SALE (BETWEEN SELLERS AND CUSTOMERS)</strong></p>\r\n\r\n<p>Please read these conditions carefully before placing an order for any products with the Sellers (&ldquo;We&rdquo; or &ldquo;Our&rdquo; or &ldquo;Us&rdquo;, wherever applicable) on the Site. These conditions signify your agreement to be bound by these conditions.</p>\r\n\r\n<p><strong>A. CONDITIONS RELATED TO SALE OF THE PRODUCT OR SERVICE</strong></p>\r\n\r\n<p>This section deals with conditions relating to the sale of products or services on the Site.</p>\r\n\r\n<p><strong>B. THE CONTRACT</strong></p>\r\n\r\n<p>Your order is a legal offer to the seller to buy the product or service displayed on our Site. When you place an order to purchase a product, any confirmations or status updates received prior to the dispatch of your order serves purely to validate the order details provided and in no way implies the confirmation of the order itself. The acceptance of your order is considered confirmed when the product is dispatched to you. If your order is dispatched in more than one package, you may receive separate dispatch confirmations. Upon time of placing the order, we indicate an approximate timeline that the processing of your order will take however we cannot guarantee this timeline to be rigorously precise in every instance as we are dependent on third party service providers to preserve this commitment. We commit to you to make every reasonable effort to ensure that the indicative timeline is met. All commercial/contractual terms are offered by and agreed to between you and the sellers alone. The commercial/contractual terms include without limitation price, shipping costs, payment methods, payment terms, date, period and mode of delivery, warranties related to products and services and after sales services related to products and services. MobiXpress does not have any control or does not determine or advise or in any way involve itself in the offering or acceptance of such commercial/contractual terms between the you and the Sellers. The seller retains the right to cancel any order at its sole discretion prior to dispatch. We will ensure that there is timely intimation to you of such cancellation via an email or SMS. Any prepayments made in case of such cancellation(s), shall be refunded to you within the time frames stipulated.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>E. PRICING, AVAILABILITY AND ORDER PROCESSING</strong></p>\r\n\r\n<p>All prices are listed in Bangladeshi Taka (BDT) and are inclusive of VAT and are listed on the Site by the seller that is selling the product or service. Items in your Shopping Cart will always reflect the most recent price displayed on the item&#39;s product detail page. Please note that this price may differ from the price shown for the item when you first placed it in your cart. Placing an item in your cart does not reserve the price shown at that time. It is also possible that an item&#39;s price may decrease between the time you place it in your basket and the time you purchase it.<br />\r\n<br />\r\nWe do not offer price matching for any items sold by any seller on our Site or other websites.<br />\r\n<br />\r\nWe are determined to provide the most accurate pricing information on the Site to our users; however, errors may still occur, such as cases when the price of an item is not displayed correctly on the Site. As such, we reserve the right to refuse or cancel any order. In the event that an item is mispriced, we may, at our own discretion, either contact you for instructions or cancel your order and notify you of such cancellation. We shall have the right to refuse or cancel any such orders whether or not the order has been confirmed and your prepayment processed. If such a cancellation occurs on your prepaid order, our policies for refund will apply. Please note that MobiXpress possess 100% right on the refund amount. Usually refund amount is calculated based on the customer paid price after deducting any sort of discount and shipping fee.<br />\r\n<br />\r\nWe list availability information for products listed on the Site, including on each product information page. Beyond what we say on that page or otherwise on the Site, we cannot be more specific about availability. Please note that dispatch estimates are just that. They are not guaranteed dispatch times and should not be relied upon as such. As we process your order, you will be informed by e-mail or SMS if any products you order turn out to be unavailable.<br />\r\n<br />\r\nPlease note that there are cases when an order cannot be processed for various reasons. The Site reserves the right to refuse or cancel any order for any reason at any given time. You may be asked to provide additional verifications or information, including but not limited to phone number and address, before we accept the order.<br />\r\n<br />\r\nIn order to avoid any fraud with credit or debit cards, we reserve the right to obtain validation of your payment details before providing you with the product and to verify the personal information you shared with us. This verification can take the shape of an identity, place of residence, or banking information check. The absence of an answer following such an inquiry will automatically cause the cancellation of the order within a reasonable timeline. We reserve the right to proceed to direct cancellation of an order for which we suspect a risk of fraudulent use of banking instruments or other reasons without prior notice or any subsequent legal liability.<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Refund Voucher</strong></p>\r\n\r\n<p>&middot;&nbsp; Refund voucher can be redeemed on our Website, as full or part payment of products from our Website within the given timeline.</p>\r\n\r\n<p>&middot;&nbsp; Refund voucher cannot be used from different account.</p>\r\n\r\n<p>&middot;&nbsp; Vouchers are not replaceable if expired.</p>\r\n\r\n<p>&middot;&nbsp; Refund Voucher code can be applied only once. The residual amount of the Refund Voucher after applying it once, if any, will not be refunded and cannot be used for next purchases even if the value of order is smaller than remaining voucher value.<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Promotional Vouchers</strong></p>\r\n\r\n<p>&middot;&nbsp; Each issued promotional voucher (App voucher and New customer voucher) will be valid for use by a customer only once. Multiple usages changing the identity is illegal.</p>\r\n\r\n<p>&middot;&nbsp; Both promotional voucher and cart rule discount may not be added at the same time.</p>\r\n\r\n<p>&middot;&nbsp; Promotional voucher is non-refundable and cannot be exchanged for cash in part or full and is valid for a single transaction only.</p>\r\n\r\n<p>&middot;&nbsp; Promotional voucher may not be valid during sale or in conjunction with any special promotion.</p>\r\n\r\n<p>&middot;&nbsp; Voucher will work only if minimum purchase amount and other conditions are met.</p>\r\n\r\n<p>&middot;&nbsp; MobiXpress reserves the right to vary or terminate the operation of any voucher at any time without notice.</p>\r\n\r\n<p>&middot;&nbsp; MobiXpress shall not be liable to any customer or household for any financial loss arising out of the refusal, cancellation or withdrawal of any voucher or any failure or inability of a customer to use a voucher for any reason.</p>\r\n\r\n<p>&middot;&nbsp; Vouchers are not replaceable if expired.</p>\r\n\r\n<p>&middot;&nbsp; No promotional offer can be made for baby nutrition products.<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Reward Vouchers</strong></p>\r\n\r\n<p>&middot;&nbsp; Customers who have already been listed in MobiXpress for fraudulent activities will not be eligible to avail any voucher and will not be eligible to participate in any campaign.</p>\r\n\r\n<p>&middot;&nbsp; A customer shall not operate more than one account in a single device.<br />\r\n<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Security and Fraud</strong></p>\r\n\r\n<p>&middot;&nbsp; When you use a voucher, you warrant to MobiXpress that you are the duly authorized recipient of the voucher and that you are using it in good faith.</p>\r\n\r\n<p>&middot;&nbsp; If you redeem, attempt to redeem or encourage the redemption of voucher to obtain discounts to which you are not entitled you may be committing a civil or criminal offence</p>\r\n\r\n<p>&middot;&nbsp; If we reasonably believe that any voucher is being used unlawfully or illegally, we may reject or cancel any voucher/order and you agree that you will have no claim against us in respect of any rejection or cancellation. MobiXpress reserves the right to take any further action it deems appropriate in such instances<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>F. RESELLING MOBIXPRESS PRODUCTS</strong></p>\r\n\r\n<p>Reselling MobiXpress products for business purpose is strictly prohibited. If any unauthorized personnel is found committing the above act, legal action may be taken against him/her.</p>\r\n\r\n<p><strong>G. TAXES</strong></p>\r\n\r\n<p>You shall be responsible for payment of all fees/costs/charges associated with the purchase of products from the Site and you agree to bear any and all applicable taxes as per prevailing law.</p>\r\n\r\n<p><strong>H. REPRESENTATIONS AND WARRANTIES</strong></p>\r\n\r\n<p>We do not make any representation or warranty as to specifics (such as quality, value, saleability, etc) of the products or services listed to be sold on the Site when products or services are sold by third parties. We do not implicitly or explicitly support or endorse the sale or purchase of any products or services on the Site. We accept no liability for any errors or omissions, whether on behalf of itself or third parties.<br />\r\n<br />\r\nWe are not responsible for any non-performance or breach of any contract entered into between you and the sellers. We cannot and do not guarantee your actions or those of the sellers as they conclude transactions on the Site. We are not required to mediate or resolve any dispute or disagreement arising from transactions occurring on our Site.<br />\r\n<br />\r\nWe do not at any point of time during any transaction as entered into by you with a third party on our Site, gain title to or have any rights or claims over the products or services offered by a seller. Therefore, we do not have any obligations or liabilities in respect of such contract(s) entered into between you and the seller(s). We are not responsible for unsatisfactory or delayed performance of services or damages or delays as a result of products which are out of stock, unavailable or back ordered.<br />\r\n<br />\r\nPricing on any product(s) or related information as reflected on the Site may due to some technical issue, typographical error or other reason by incorrect as published and as a result you accept that in such conditions the seller or the Site may cancel your order without prior notice or any liability arising as a result. Any prepayments made for such orders will be refunded to you per our refund policy as stipulated</p>\r\n\r\n<p><strong>I. OTHERS</strong></p>\r\n\r\n<p>&middot;&nbsp; <strong>Stock availability:&nbsp;</strong>The orders are subject to availability of stock.</p>\r\n\r\n<p>&middot;&nbsp; <strong>Delivery Timeline:&nbsp;</strong>The delivery might take longer than usual timeframe/line to be followed by MobiXpress. Delivery might be delayed due to force majeure event which includes, but not limited to, political unrest, political event, national/public holidays, etc</p>\r\n\r\n<p>&middot;&nbsp; <strong>Cancellation:&nbsp;</strong>MobiXpress retains unqualified right to cancel any order at its sole discretion prior to dispatch and for any reason which may include, but not limited to, the product being mispriced, out of stock, expired, defective, malfunctioned, and containing incorrect information or description arising out of technical or typographical error or for any other reason.</p>\r\n\r\n<p>&middot;&nbsp; <strong>Refund Timeline:&nbsp;</strong>If any order is canceled, the payment against such order shall be refunded within 10 to 15 working days, but it may take longer time in exceptional cases. Provided that received cash back amount, if any, will be adjusted with the refund amount.<br />\r\n<br />\r\nYou confirm that the product(s) or service(s) ordered by you are purchased for your internal / personal consumption and not for commercial re-sale. You authorize us to declare and provide declaration to any governmental authority on your behalf stating the aforesaid purpose for your orders on the Site. The Seller or the Site may cancel an order wherein the quantities exceed the typical individual consumption. This applies both to the number of products ordered within a single order and the placing of several orders for the same product where the individual orders comprise a quantity that exceeds the typical individual consumption. What comprises a typical individual&#39;s consumption quantity limit shall be based on various factors and at the sole discretion of the Seller or ours and may vary from individual to individual.<br />\r\n<br />\r\nYou may cancel your order at no cost any time before the item is dispatched to you.<br />\r\n<br />\r\nPlease note that we sell products only in quantities which correspond to the typical needs of an average household. This applies both to the number of products ordered within a single order and the placing of several orders for the same product where the individual orders comprise a quantity typical for a normal household. Please review our Refund Policy.</p>', '<p><strong>RETURN POLICY</strong></p>\r\n\r\n<p>Mobixpress.com.bd holds the return policy to high regards as we constantly think of the comfort of our customers. We have a return policy of 3 days for most of our products if the product meets certain criteria listed below-<br />\r\n<br />\r\nWe reserve the right to refuse an exchange or refund if goods are not returned in a saleable condition or are damaged. All returns are evaluated before being processed. Unless faulty, medicines, food, personalized gifts or cosmetics products which have been opened cannot be refunded or exchanged. This does not affect your statutory rights. Faulty items will be accepted up to the manufacturer&rsquo;s warranty terms. If you don&rsquo;t have the money receipt then MobiXpress.com.bd will refuse to accept the return of the product.<br />\r\n<br />\r\nMobiXpress may refund the customer to his/her payment channel by default or desired transactional medium but the process may take up to 3 months or more depending upon the circumstances.</p>\r\n\r\n<h3><strong>Conditions for Returns</strong></h3>\r\n\r\n<ol>\r\n	<li>The product must be unused, unworn, unwashed and without any flaws. Fashion products can be tried on to see if they fit and will still be considered unworn</li>\r\n	<li>The product must include the original tags, user manual, warranty cards, freebies and accessories</li>\r\n	<li>The product must be returned in the original and undamaged manufacturer packaging / box. If the product was delivered in a second layer of Mobi Xpress packaging, it must be returned in the same condition with return shipping label attached. Do not put tape or stickers on the manufacturers box.</li>\r\n</ol>', '<p>Issuance of Refunds</p>\r\n\r\n<p>If your product is eligible for a refund, you can choose your preferred refund method based on the table below. The shipping fee is refunded along with the amount paid for your returned product.</p>\r\n\r\n<p>The time required to complete a refund depends on the refund method you have selected. Once we have received your product (6 working days) and it has undergone a quality control (2 working days), the expected refund processing times are as follows:</p>\r\n\r\n<table class=\"table table-bordered table-striped\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Payment Method</th>\r\n			<th>Refund Option</th>\r\n			<th>Refund Time</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>All</p>\r\n			</td>\r\n			<td>\r\n			<p>Refund Voucher</p>\r\n			</td>\r\n			<td>\r\n			<p>1-2 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Debit or Credit Card</p>\r\n			</td>\r\n			<td>\r\n			<p>Debit or Credit Card Payment Reversal</p>\r\n			</td>\r\n			<td>\r\n			<p>9-10 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>bKash</p>\r\n			</td>\r\n			<td>\r\n			<p>Bank Deposit / Mobile Payment Reversal</p>\r\n			</td>\r\n			<td>\r\n			<p>5 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Cash on Delivery (COD)</p>\r\n			</td>\r\n			<td>\r\n			<p>Bank Deposit</p>\r\n			</td>\r\n			<td>\r\n			<p>4-5 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Daraz Voucher</p>\r\n			</td>\r\n			<td>\r\n			<p>Refund Voucher</p>\r\n			</td>\r\n			<td>\r\n			<p>1-2 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Rocket or DBBL(Nexus)</p>\r\n			</td>\r\n			<td>\r\n			<p>Bank Deposit / Mobile Payment Reversal</p>\r\n			</td>\r\n			<td>\r\n			<p>7 working days</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Important Note: The Voucher discount code can only be applied once. The leftover amount will not be refunded or used for the next purchase even if the value of the order is smaller than the voucher value.</p>', '<h1><strong>Inside Dhaka</strong></h1>\r\n\r\n<ul>\r\n	<li><strong>Policy One</strong></li>\r\n	<li><strong>Policy Two</strong></li>\r\n</ul>\r\n\r\n<h1><strong>Outside Dhaka</strong></h1>\r\n\r\n<ul>\r\n	<li><strong>Policy Three</strong></li>\r\n	<li><strong>Policy Four</strong></li>\r\n</ul>', NULL, '2021-10-16 08:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `specification` text COLLATE utf8mb4_unicode_ci,
  `unit_price` double(8,2) NOT NULL,
  `discount_price` double(8,2) DEFAULT '0.00',
  `stock_status` int(191) NOT NULL DEFAULT '1',
  `quantity` int(11) DEFAULT '0',
  `special_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `subcategory_id`, `product_code`, `name`, `slug`, `product_details`, `short_description`, `specification`, `unit_price`, `discount_price`, `stock_status`, `quantity`, `special_note`, `video_link`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 4, '0004', 'Vim Dishwashing Liquid (500ml)', 'vim-dishwashing-liquid-500ml', '<p>Vim Liquid is created with real lime juice and has superior degreasing abilities leaving dishes sparkling and shiny.</p>\r\n\r\n<p>Take a drop of Vim Liquid on a wet sponge. Squeeze the sponge to work up a rich lather. Apply to utensils. Rinse thoroughly for a sparkling, scratch free clean.</p>\r\n\r\n<p>OR</p>\r\n\r\n<p>Pour a tea spoonful of Vim liquid into a small bowl of water and stir to mix. Take a sponge/scrubber and soak it in that mix and rinse utensils thoroughly for sparkling and scratch free dishes.</p>\r\n\r\n<p>Turbo degreasing lime: Each drop of Vim Liquid contains enough cleaning power to remove tough stains and grease easily.</p>', '<p>Vim Liquid is created</p>\r\n\r\n<p>with real lime juice</p>', '<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Packet</td>\r\n			<td>Plastic</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Others</td>\r\n			<td>Nice</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Uniliver</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<ul>\r\n	<li>Nice Product</li>\r\n	<li>Hello product</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 100.00, 90.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-09-26 07:29:11'),
(2, 1, 6, NULL, '0005', 'Mr. cookie butter coconut biscuits', 'mr-cookie-butter-coconut-biscuits', '<p>#mr.cookie, #cookies #Haque</p>', NULL, NULL, 50.00, 35.00, 1, 50, NULL, 'https://www.youtube.com/watch?v=npgp7NWifQU', 2, 1, NULL, '2021-11-06 08:04:12'),
(3, 1, 6, NULL, '0006', 'Goldmark chocolate cookies', 'goldmark-chocolate-cookies', '<p>#goldmark #cookie #Biscuite</p>', 'cookie #Biscuite', NULL, 65.00, 36.00, 1, 100, NULL, NULL, 2, 1, NULL, '2021-10-31 09:34:42'),
(4, 1, 6, NULL, '0007', 'Goldmark chocolate chips cookies', 'goldmark-chocolate-chips-cookies-PUco7UO3yePxA6il8o9CixEd94irI4LrWbGTrFya', '<p>Cookies Enriched With Chocolate Chips</p>', NULL, NULL, 50.00, 45.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-12-15 06:33:43'),
(5, 3, 6, 6, '0008', 'Goldmark coconut cookies', 'goldmark-coconut-cookies', '<p>Flour, Sugar, Vegetable Fat, Butter, Salt, Baking Agent, Coconut Powder, Milk Powder, Coconut Flavor.</p>', NULL, NULL, 30.00, 10.00, 1, 50, NULL, NULL, 0, 1, NULL, '2021-07-26 04:11:43'),
(6, 1, 6, NULL, '0009', 'Goldmark butter cookies', 'goldmark-butter-cookies-jcdzVUiWgdLxj38YiccdLf5vbahMIdropyy0CpTU', '<p>Flour, Sugar, Vegetable Fat, Butter, Margarine, Edible Oil, Milk Powder, salt, Baking Agent, Permitted Flavor.</p>', NULL, NULL, 50.00, 45.00, 1, 50, NULL, NULL, 1, 1, NULL, '2021-12-26 17:26:25'),
(7, 1, 6, NULL, '0011', 'Goldmark milk cookies', 'goldmark-milk-cookies', '<p>ingredients: Flour, Sugar, Vegetable Fat, Salt, Baking Agent, Egg, Milk Powder and Permitted Flavor.</p>', NULL, NULL, 50.00, 32.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-09-26 09:35:55'),
(8, 1, 6, NULL, '0012', 'olympic salcoti cookies', 'olympic-salcoti-cookies', '<p>#salcoti #olympic #cookie</p>', NULL, NULL, 50.00, 45.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-09-26 09:26:32'),
(9, 1, 6, NULL, '0014', 'olympic hello cookies biscuits', 'olympic-hello-cookies-biscuits-Knt8oNwrfMmPTVRpCgqjKYPotzP4U9ha8TywAPCu', '<p>#hellocookie #olympic #biscuite #cookies</p>', NULL, NULL, 50.00, 20.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-10-17 16:58:26'),
(10, 1, 6, NULL, '0016', 'Teer Soyabean Oil', 'teer-soyabean-oil', '<p>*** Teer soyabean oil</p>\r\n\r\n<p>*** Teer</p>', NULL, NULL, 530.00, 500.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-06-29 08:25:05'),
(11, 1, 6, NULL, '0025', 'Ahmed mustard oil', 'ahmed-mustard-oil-MvSLmGFDBcWMVZmDODbMhydRte0UnmEvogdjXki1', '<p>#ahmed</p>\r\n\r\n<p>#mustardoil</p>', NULL, NULL, 120.00, 60.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-11-03 18:08:14'),
(12, 1, 6, NULL, '0028', 'Fresh moshur dal', 'fresh-moshur-dal', '<p>**Moshur dal</p>\r\n\r\n<p>**Deshi moshur dal</p>', NULL, NULL, 10.00, 0.00, 1, 100, NULL, NULL, 3, 1, NULL, '2022-01-01 14:33:31'),
(13, 1, 6, NULL, '0030', 'Boot dal (packed)', 'boot-dal-packed-zWlmGMOiLUxU4rYYi5xHwDHA4mC28usu84c7IZHC', '<p>***Boot er dal</p>', NULL, NULL, 90.00, 40.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-10-28 18:43:35'),
(14, 1, 6, NULL, '0031', 'Mug dal (packed)', 'mug-dal-packed', '<p>***Mug dal</p>\r\n\r\n<p>*** no. 1 Mug dal</p>', NULL, NULL, 140.00, 120.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-09-26 09:26:48'),
(15, 1, 6, NULL, '0032', 'Pran Chinigura Rice | 1 kg', 'pran-chinigura-rice-1-kg-q15a7y9un03xfayxKTsHIVJwAptIsdx0tRdGiIz8', '<p>**chinigura polaw rice</p>', NULL, NULL, 130.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-07 06:26:24'),
(16, 1, 6, NULL, '0033', 'fresh chinigura', 'fresh-chinigura-67nOY6RnNRXh3MOrJGMWiTYxae39ChmzQVVQZUR4', '<p>***Fresh chinigura polaw rice</p>', NULL, NULL, 125.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-10-17 17:35:23'),
(17, 1, 6, NULL, '0034', 'Aromatic Chinigura Rice - 2Kg', 'aromatic-chinigura-rice-2kg-7dIeNJTxnYhJB9ZhADABqs0qq0EEN9OM6EPNmAVq', '<ul>\r\n	<li>Aromatic&nbsp;Chinigura Polaw rice</li>\r\n	<li>Brand: Chashi</li>\r\n</ul>', NULL, NULL, 240.00, 235.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(18, 1, 6, NULL, '0035', 'Miniket rice standard | 5kg', 'miniket-rice-standard-5kg-gCbMJsVzn8MzykH0hXojgYGUvkjRgqUdSJVFJBBS', '<p>***Deshi Miniket Rice standard</p>', NULL, NULL, 260.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-10-17 17:07:02'),
(19, 1, 6, NULL, '38', 'Rashid Premium  Miniket Rice (Packed)', 'rashid-premium-miniket-rice-packed-jXa6yOtPlQkTSLRQBQo4gJcDWG9rCEbtUBy1iQ0D', '<p>***Rashid premium Miniket</p>', NULL, NULL, 1500.00, 1400.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(20, 1, 6, NULL, '0037', 'Mozammel Special Miniket Rice| 10kg', 'mozammel-special-miniket-rice-10kg-OnRP2QBbynXVPCDA2uM6tyG3ImU6UVrrf5QGtdUd', '<ul>\r\n	<li>Mozammel Special Miniket Rice</li>\r\n	<li>weight 10kg</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, 675.00, 650.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(21, 1, 6, NULL, '0038', 'Nazirshail Rice Standard | 5 kg', 'nazirshail-rice-standard-5-kg', '<p>***Nazirshail Rice Standard</p>', NULL, NULL, 270.00, 200.00, 0, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:56'),
(22, 1, 6, NULL, '0039', 'Nazirshail Rice Primium | 5 kg', 'nazirshail-rice-primium-5-kg-bDjBBb0yuVgltxIRTtdWgmfU7xwPNh5I76SO0dgD', '<p>*** Nazirshail Rice Premium</p>', NULL, NULL, 280.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(23, 1, 6, NULL, '0054', 'ACI Pure Atta - 2kg', 'aci-pure-atta-2kg-NYrRxF0ziSjkLco5PJNhLyFF5XGKw9NFevEgZhm5', '<p>*** Aci pure Atta</p>', NULL, NULL, 70.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-07 06:26:04'),
(24, 1, 6, NULL, '0057', 'SUPERMOM Baby Diaper | Belt Small | 0-8 kg | 28 PCs', 'supermom-baby-diaper-belt-small-0-8-kg-28-pcs-aYwlHQeLIXSsRreDJ1mO2Of7aX5JfCUlXRORJCE4', '<ul>\r\n	<li>Product Type: Diaper</li>\r\n	<li>Brand: Supermom</li>\r\n	<li>Capacity: 28pcs</li>\r\n	<li>For Baby</li>\r\n	<li>The best quality diaper in the market!</li>\r\n	<li>It has 80% more absorbent than other diapers.</li>\r\n	<li>Gives comfort to both babies and parents.</li>\r\n	<li>Ensures zero leakage as it has hydrophobic leg cuff.</li>\r\n	<li>Its cottony top sheet ensures that children can sleep comfortably the whole night.</li>\r\n	<li>It has &ldquo;PU Foam Waistband&rdquo; which fits the waist perfectly.</li>\r\n</ul>', NULL, NULL, 675.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(25, 1, 6, NULL, '0058', 'SUPERMOM Baby Diaper Belt XL | 12-17 kg | 20 PCs', 'supermom-baby-diaper-belt-xl-12-17-kg-20-pcs-MEFSaYgSYhKSuL6dtlcbIOulikdMHwr6gHNuwaMI', '<ul>\r\n	<li>Product Type: Diaper</li>\r\n	<li>Brand: Supermom</li>\r\n	<li>Capacity: 20pcs</li>\r\n	<li>For Baby</li>\r\n	<li>Size: 12 - 17 Kg | XL</li>\r\n	<li>Type: Belt</li>\r\n</ul>', NULL, NULL, 750.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(26, 1, 6, NULL, '0059', 'SUPERMOM Baby Diaper Belt L 9-14 kg | 22 PCs', 'supermom-baby-diaper-belt-l-9-14-kg-22-pcs-FA4pDRCogpT4HRdLmucxZfPVSPSCQVj0m4k1Y2Nt', '<ul>\r\n	<li>Product Type: Diaper<br />\r\n	Brand: Supermom<br />\r\n	Capacity: 22pcs<br />\r\n	For Baby<br />\r\n	Size: 09 - 14 Kg | L<br />\r\n	Type: Belt</li>\r\n</ul>', NULL, NULL, 750.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(27, 1, 6, NULL, '0065', 'ACI Aromatic chinigura rice | 5 kg', 'aci-aromatic-chinigura-rice-5-kg-g4piurvQqkUc0D2h33QSxMrIgLC31TNxGrSxgoiV', '<p>*** chinigura rice (polaw)</p>', NULL, NULL, 570.00, 100.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-11-30 12:32:56'),
(28, 1, 6, NULL, '0066', 'ACI Bashmati Rice | 1 kg', 'aci-bashmati-rice-1-kg-CIo5BMjc5kkWbOGp0Vf3irjSnulUK6Hei1IFOmyn', '<p>*** Banshmati rice</p>', NULL, NULL, 265.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(29, 1, 6, NULL, '0067', 'ACI Shugondhi Katarivog Rice - 5kg', 'aci-shugondhi-katarivog-rice-5kg-LZEcNUYc4ROJC1UYMaNueo2tr1pObRt6dYr9tt1u', '<p>*** Katarivog rice</p>', NULL, NULL, 525.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(30, 1, 6, NULL, '0068', 'ACI Pure Premium Nazirshail Rice | 5kg', 'aci-pure-premium-nazirshail-rice-5kg-gPuZHK6gy8pN4gwjgv2527tzHLZt9tnBJ3wJD8oR', '<p>*** premium nazirshail rice</p>', NULL, NULL, 420.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(31, 1, 6, NULL, '0069', 'ACI Pure Premium Nazirshail Rice | 10kg', 'aci-pure-premium-nazirshail-rice-10kg-nrkveA0odByPYOLu0SBvkfgUVXXuE3TV0qNM5kiA', '<p>***&nbsp;premium nazirshail rice</p>', NULL, NULL, 780.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(32, 1, 6, NULL, '0070', 'Aci Pure Premium Miniket - 10kg', 'aci-pure-premium-miniket-10kg-YccSQyGm4O2taWtPhxv91YWWrO8q8c3TYQpCfUBq', '<p>***&nbsp;&nbsp;premium miniket rice</p>', NULL, NULL, 700.00, 300.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:56'),
(33, 1, 6, NULL, '0081', 'Fresh Refined Sugar - 1kg', 'fresh-refined-sugar-1kg-sT3GafwfkP6ArRCgMrFnhJuXk6it5qjgX0PNcOxR', '<p>***&nbsp;Fresh refined sugar</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(34, 1, 6, NULL, '0089', 'Red cow butter oil', 'red-cow-butter-oil-JgBFayEVXVaccolkDdTLQef532gFzT0Kqmeq5FPK', '<p>Red cow butter oil</p>', NULL, NULL, 500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(35, 1, 6, NULL, '0092', 'Ruchi mango pickle', 'ruchi-mango-pickle-WpzG1KBjMxTGlD7xsXnzZ2QERrXmfpgIY8ReN8Om', '<p>****&nbsp;Ruchi mango pickle</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(36, 1, 6, NULL, '0127', 'Diploma full cream milk powder', 'diploma-full-cream-milk-powder-Cc0njYNqsOe6qOzrIR1RVJeT06oSdYjEYUbgnalu', '<p>Diploma full cream milk powder</p>', NULL, NULL, 320.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(37, 1, 6, NULL, '0140', 'Milk | 100% Pure Milk', 'milk-100-pure-milk-4r0PP4n4GMPWh8p9BSpRoIkb0riDZxUSS0OjRSb1', '<ul>\r\n	<li>\r\n	<p>100% pure and fresh</p>\r\n	</li>\r\n	<li>\r\n	<p>&nbsp;Adulteration Free.</p>\r\n	</li>\r\n	<li>\r\n	<p>&nbsp;Collected from farmers directly</p>\r\n	</li>\r\n	<li>\r\n	<p>Collected and stored with direct supervision.</p>\r\n	</li>\r\n	<li>\r\n	<p>No compromise with quality and service.</p>\r\n	</li>\r\n</ul>', NULL, NULL, 90.00, 80.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(38, 1, 6, NULL, '0141', 'পাটালি গুড় | Patali Gur', 'patali-gur-patali-gur-PlM2DHnDrlQRNZepQDbfdlq0tqREFegjdQGiQ5ca', '<ul>\r\n	<li>100% pure and Chemical free</li>\r\n	<li>Direct collected from &quot;Gachi&quot;</li>\r\n	<li>Process &quot;Ros&quot; with care and make Patali</li>\r\n	<li>100% Organic</li>\r\n	<li>Good for health&nbsp;</li>\r\n</ul>', NULL, NULL, 280.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(39, 1, 6, NULL, '0142', 'ঝোলা গুড় | Jhola Gur', 'jhola-gur-jhola-gur-w1fvxdQedBKL3UXhU2lO6OqyZj95dqeZa7IbnsS9', '<ul>\r\n	<li>100% pure and Chemical free</li>\r\n	<li>Direct collected from &quot;Gachi&quot;</li>\r\n	<li>Process &quot;Ros&quot; with care and make Patali</li>\r\n	<li>100% Organic</li>\r\n	<li>Good for health&nbsp;</li>\r\n</ul>', NULL, NULL, 280.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:57'),
(40, 1, 6, NULL, '0143', 'Pure Honey | Sundarban  1 kg', 'pure-honey-sundarban-1-kg-Fg0I5DAukNX6XegCWvj8uMxQ2sqiM5oz0hIe6mYy', '<ul>\r\n	<li>Sundarban Er Pure Honey</li>\r\n	<li>Kholisha Fuler Modhu</li>\r\n	<li>100% Pure and Natural</li>\r\n	<li>No Chamical No Sugar</li>\r\n	<li>100% Organic</li>\r\n</ul>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 12px; top: -8px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', NULL, NULL, 1050.00, 999.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(41, 1, 6, NULL, '0147', 'Supermom baby diaper Extra Large (12-17kg) 20pcs Small | 0-8 kg | 28 PCs', 'supermom-baby-diaper-extra-large-12-17kg-20pcs-small-0-8-kg-28-pcs-kCk9O8z0zlcYMAJ8k9PivVBwylagH7I0JmvE4u7v', '<ul>\r\n	<li>Product Type: Diaper</li>\r\n	<li>Brand: Supermom</li>\r\n	<li>Capacity: 26pcs</li>\r\n	<li>For Baby</li>\r\n</ul>', NULL, NULL, 750.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(42, 1, 6, NULL, '0149', 'Cocola Junipr Cup Noodles', 'cocola-junipr-cup-noodles-JRe6pOhmfZ1UmA9GomCbOIymai3cHL5hd0RdrUob', '<p>Cocola Junior Cup Noodles 40gm</p>', NULL, NULL, 25.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(43, 1, 6, NULL, '0150', 'Nestle Maggie 2 Minute', 'nestle-maggie-2-minute-Yi5WayPqrkRdXejQk17ytBNgbSQgMBAMAJiIIRH6', '<p>Nestle Maggie 2 Minute Noodles Masala 8 Pack</p>', NULL, NULL, 135.00, 0.00, 1, 8, NULL, NULL, 0, 1, NULL, NULL),
(44, 1, 6, NULL, '0151', 'Nestle Maggie 2 Minute', 'nestle-maggie-2-minute-5xdWoULEmGHwhBDfsKYxAUV7hTg3fVKa0uXA0k7G', '<p>Nestle Maggie 2 Minute Masala 4Pack</p>', NULL, NULL, 66.00, 0.00, 1, 4, NULL, NULL, 0, 1, NULL, NULL),
(45, 1, 6, NULL, '0152', 'Chopstick Deshi Masala Noodles', 'chopstick-deshi-masala-noodles-VtbvX937A7fL0R9ilBjgT0nqaAaJjzGbIaR1Youc', '<p>Chopstick Deshi Masala Noodles 8 Pack ( Free Suprise Gift)</p>', NULL, NULL, 130.00, 0.00, 1, 8, NULL, NULL, 0, 1, NULL, NULL),
(46, 1, 6, NULL, '0153', 'Nestle Maggie Healthy Thai Soup', 'nestle-maggie-healthy-thai-soup-XrE3BQpb2ImLmzNeMOQP8h4DFrZJzWA0gGgnzYO0', '<p>Nestle Maggie Healthy Thai Soup 4Pcs</p>', NULL, NULL, 140.00, 0.00, 1, 4, NULL, NULL, 0, 1, NULL, NULL),
(47, 1, 6, NULL, '0154', 'Bogurar Special Premium Doi | বগুড়ার স্পেশাল দই', 'bogurar-special-premium-doi-bgurar-spesal-di-k1lLrajI1GFBEXg49Pvc8Niu1TdnM99Q1WeD7hic', '<ul>\r\n	<li>Bagurar Special Traditional Doi</li>\r\n	<li>Premium Quality SWEETENED DOI&nbsp;</li>\r\n	<li>Size; Large</li>\r\n	<li>Weight: 700 gm +/-</li>\r\n	<li>Quantity: 1 Pcs ( ১ বাটি)&nbsp;</li>\r\n</ul>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 172px; top: 14px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', NULL, NULL, 320.00, 290.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(48, 1, 6, NULL, '0155', 'Wheel Washing Powder 2in1 Clean & Rose', 'wheel-washing-powder-2in1-clean-rose-VzjqqbBwHmH5X3p7jtRzhX9eLha2v4DY7uZ5lJfe', '<p>Wheel Washing Powder 2in1 Clean &amp; Rose</p>', NULL, NULL, 42.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(49, 1, 6, NULL, '0156', 'Wheel Washing Powder 2in1 Clean & Fresh', 'wheel-washing-powder-2in1-clean-fresh-V9zxbnXPHH6jSjML8Oo7FO3LYy4IWmkONjRBm9Qg', '<p>Wheel Washing Powder 2in1 Clean &amp; Fresh</p>', NULL, NULL, 45.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(50, 1, 6, NULL, '0157', 'Wheel Washing Powder Laundry Bar', 'wheel-washing-powder-laundry-bar-Uk21wdEwQxAYiGJNcOADjkeS5GvI449uqx4w0JrN', '<p>Wheel Washing Powder Laundry Bar</p>', NULL, NULL, 20.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(51, 1, 6, NULL, '0158', 'Rin Washing Powder Power Bright', 'rin-washing-powder-power-bright-LM6gaEnIOhYaTG0aMkYQYpz0iz2mSEjsadlWVshg', '<p>Rin Washing Powder Power Bright</p>', NULL, NULL, 60.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(52, 1, 6, NULL, '0159', 'Rin Washing Powder Bundle Pack', 'rin-washing-powder-bundle-pack-DZuUoxJD6CSeDmgzeiUjd1f231CwULZFGiJ98MMF', '<p>Rin Washing Powder Bundle Pack</p>', NULL, NULL, 240.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(53, 1, 6, NULL, '0160', 'Rin Washing Powder Antibac', 'rin-washing-powder-antibac-WYkYBGSODHPfelsWL5bkEOZr7aAaaqx43BfhsgNN', '<p>Rin Washing Powder Antibac</p>', NULL, NULL, 120.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(54, 1, 6, NULL, '0161', 'Rin Liquid Detergent', 'rin-liquid-detergent-D3dOLbj7YeTtknynDanWYbmdHQdrNtn20XVQXfqO', '<p>Rin Liquid Detergent</p>', NULL, NULL, 195.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(55, 1, 6, NULL, '0162', 'Surf Excel Washing Powder', 'surf-excel-washing-powder-y2y8eprxb02xKRI77YS5Fc2LPUwlVNzoFLWHG8yi', '<p>Surf Excel Washing Powder</p>', NULL, NULL, 99.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(56, 1, 6, NULL, '0163', 'Surf Excel Washing Powder (With Bucket)', 'surf-excel-washing-powder-with-bucket-wheUw70oEQK5V5iGWxkgqpy779XHtxtK5dZa4i57', '<p>Surf Excel Washing Powder (With Bucket)</p>', NULL, NULL, 240.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(57, 1, 6, NULL, '0164', 'Surf Excel Washing Powder Matic Top Load', 'surf-excel-washing-powder-matic-top-load-xVezqrsF3pjhnjS47zuiGlmTf5baZmXl23tKB1no', '<p>Surf Excel Washing Powder Matic Top Load</p>', NULL, NULL, 260.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(58, 1, 6, NULL, '0165', 'Surf Excel Matic Liquid Detergent Top Load', 'surf-excel-matic-liquid-detergent-top-load-YBpS9Ps9NChp9YrtbZVtOFoBPgUqoW3Erwkc3Rqi', '<p>Surf Excel Matic Liquid Detergent Top Load</p>', NULL, NULL, 210.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(59, 1, 6, NULL, '0166', 'Fay air freshener anti tobacco 3 in 1', 'fay-air-freshener-anti-tobacco-3-in-1-KrLyCJmxJama0zJE4lWxEqOip0WbTLTVEUoesKMU', '<p>Fay air freshener anti tobacco 3 in 1</p>', NULL, NULL, 220.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(60, 1, 6, NULL, '0167', 'Fay orchid air freshener 3 in 1', 'fay-orchid-air-freshener-3-in-1-PrITDTkHSOcsgAbDtW6WZ3aHd0zX6tXPWoILP5WP', '<p>Fay orchid air freshener 3 in 1</p>', NULL, NULL, 220.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(61, 1, 6, NULL, '0168', 'Fay air Freshener rose', 'fay-air-freshener-rose-nJ7jSZFZqqXdym25A4RF1nBojVXJQLBxpXnnQ8oy', '<p>Fay air Freshener rose</p>', NULL, NULL, 220.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:56'),
(62, 1, 6, NULL, '0169', 'Fay air Freshener Narcissus 3 in 1', 'fay-air-freshener-narcissus-3-in-1-HMkcto77gNcPgv8dIwUOmx8sSH5GyBvrw9nTrOKE', '<p>Fay air Freshener Narcissus 3 in 1</p>', NULL, NULL, 220.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(63, 1, 6, NULL, '0170', 'Fay lily air Freshener', 'fay-lily-air-freshener-pr5PXCZsgP1dvZcsliTXKEDcGJZRqX1vQQFuXYRo', '<p>Fay lily air Freshener</p>', NULL, NULL, 220.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(64, 1, 6, NULL, '0171', 'Godrej Aer pocket Bundle', 'godrej-aer-pocket-bundle-wX9TFEfTEFfGbDAO3Eg4JQzjnfJEmyXJhAR1W9AR', '<p>Godrej Aer pocket Bundle</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(65, 1, 6, NULL, '0172', 'Aer Room Freshener & 2 Aer Pocket Combo', 'aer-room-freshener-2-aer-pocket-combo-HqiuQypa5fhRR0DuvEsxPtXBACwiFPwjEJJ9M7PK', '<p>Aer Room Freshener &amp; 2 Aer Pocket Combo</p>', NULL, NULL, 318.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(66, 1, 6, NULL, '0173', 'Godrej aer cool room spray', 'godrej-aer-cool-room-spray-MZxy9liZ8OM0kSFJdXgPpNWUgsWYkiBvVQbKKiv3', '<p>Godrej aer cool room spray&nbsp;</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(67, 1, 6, NULL, '0174', 'Godrej Aer fresh green room spray', 'godrej-aer-fresh-green-room-spray-w6lvymkcomaw576m2rfW5bqlYfv8eofG7FPvcQUG', '<p>Godrej Aer fresh green room spray</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(68, 1, 6, NULL, '0175', 'Godrej aer Cool surf Blue click gel AC vent car freshener', 'godrej-aer-cool-surf-blue-click-gel-ac-vent-car-freshener-JVQRhj4hzt59jNzp4iisJ6NEzBYGT8bPtMhxmaqw', '<p>Godrej aer Cool surf Blue click gel AC vent car freshener</p>', NULL, NULL, 299.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-10-17 17:39:46'),
(69, 1, 6, NULL, '0176', 'Godrej aer Cool Twist  surf Blue 45gm  car dashboard freshener', 'godrej-aer-cool-twist-surf-blue-45gm-car-dashboard-freshener-gPNanCqjFF0f2Cuw3rSnJuAmtVS7wITQwfds8zRi', '<p>Godrej aer Cool Twist &nbsp;surf Blue 45gm &nbsp;car dashboard freshener</p>', NULL, NULL, 399.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(70, 1, 6, NULL, '0177', 'Odonil natural Air freshener Lavender Meadows', 'odonil-natural-air-freshener-lavender-meadows-LqfxsTorUkesAUiskaldZc4cPMASpdsetUZPP9QG', '<p>Odonil natural Air freshener Lavender Meadows</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(71, 1, 6, NULL, '0178', 'Odonil natural Air freshener jasmine mist', 'odonil-natural-air-freshener-jasmine-mist-R4ZTBb321S3P1TYkRSF27g06xASfLUsNjJSF1ov3', '<p>Odonil natural Air freshener jasmine mist</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 4, 1, NULL, '2021-10-31 09:34:02'),
(72, 1, 6, NULL, '0180', 'Odonil natural Air freshener Mystic Rose', 'odonil-natural-air-freshener-mystic-rose-DoJ25xEPcm2O7V9qwxcRHbMpa4wXGHNLzr3bohvE', '<p>Odonil natural Air freshener Mystic Rose</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(73, 1, 6, NULL, '0181', 'Odonil natural Air freshener Mystic Rose', 'odonil-natural-air-freshener-mystic-rose-qbtHSDCDsenA7ragbOMAhrn3M27u8oJFHImALatW', '<p>Odonil natural Air freshener Mystic Rose</p>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(74, 1, 6, NULL, '0182', 'Dettol All in one Air freshener jasmin', 'dettol-all-in-one-air-freshener-jasmin-duh1Ub6bNCburgSxIYBdeeojiNXwS2AuNFVqDGyv', '<p>Dettol All in one Air freshener jasmin</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(75, 1, 6, NULL, '0183', 'Dettol All in one Air freshener Spiring', 'dettol-all-in-one-air-freshener-spiring-LbpV7dTwGIbAN0MBbSbe9ybII2Qre2dVjQAb4pOD', '<p>Dettol All in one Air freshener Spiring</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(76, 1, 6, NULL, '0184', 'Vim dishwashing bar', 'vim-dishwashing-bar-8huvgASsHgB4V2ZuxIc3wxbtDl5DHlvWJvFBzSvf', '<p>Vim dishwashing bar</p>', NULL, NULL, 32.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(77, 1, 6, NULL, '0185', 'Vim dishwashing bar', 'vim-dishwashing-bar-wdchFkEXctFC2VjhQKkxZDkF7QusbPdtpqZ54jw3', '<p>Vim dishwashing bar</p>', NULL, NULL, 48.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(78, 1, 6, NULL, '0186', 'Vim Dishwashing Liquid', 'vim-dishwashing-liquid-fx8AETWvCz2KbmTTl6Docl6oA5YLs8rJI7BAMsTq', '<p>Vim Dishwashing Liquid</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(79, 1, 6, NULL, '0187', 'Vim Dishwashing Liquid', 'vim-dishwashing-liquid-NJk7njyIJ2RmIPF8qPiZooul9g0JFIUI9BoNUh5R', '<p>Vim Dishwashing Liquid</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(80, 1, 6, NULL, '0188', 'VIM Dishwashing Powder', 'vim-dishwashing-powder-fq9JPQBopE215MYtZ1qkXFj23FGHgWbam8nGFcas', '<p>VIM Dishwashing Powder</p>', NULL, NULL, 35.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(81, 1, 6, NULL, '0189', 'Trix Dishwashing Liquid Refill Sparkling Clean with Lemon Fragrance', 'trix-dishwashing-liquid-refill-sparkling-clean-with-lemon-fragrance-jUbRvyZnoqd3R3JptKzuiRxX5wggx7SUKUNPHlKU', '<p>Trix Dishwashing Liquid Refill Sparkling Clean with Lemon Fragrance</p>', NULL, NULL, 55.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(82, 1, 6, NULL, '0190', 'Trix Monthly Pack', 'trix-monthly-pack-npPCXaIE56XWDgTIi8kUl1yjUF0xtjHAvceys5TR', '<p>Trix Monthly Pack</p>', NULL, NULL, 179.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(83, 1, 6, NULL, '0191', 'Trix Lemon Dish Washing Liquid Lemon Refill Pack', 'trix-lemon-dish-washing-liquid-lemon-refill-pack-tzCkpTSVRHKvjgtBAM6bJsEbSUIyMpCa0sR06LWx', '<p>Trix Lemon Dish Washing Liquid Lemon Refill Pack</p>', NULL, NULL, 105.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(84, 1, 6, NULL, '0192', 'Rok Lemon Dish Washing Liquid', 'rok-lemon-dish-washing-liquid-WGNFnXiCwVdMa3wMzLjUWkDMIpECyWGKkVfVI6bM', '<p>Rok Lemon Dish Washing Liquid&nbsp;</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(85, 1, 6, NULL, '0193', 'Harpic Toilet Cleaning Liquid Original', 'harpic-toilet-cleaning-liquid-original-EBBbhf67GArst3Q0m4ByorDbetx8QJl4IdL29L8q', '<p>Harpic Toilet Cleaning Liquid Original</p>', NULL, NULL, 160.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:56'),
(86, 1, 6, NULL, '0194', 'Harpic Toilet Cleaning Liquid Original', 'harpic-toilet-cleaning-liquid-original-EWgM2EAClLfWMayB55PAgiyFaYYcYGAynLdBnzat', '<p>Harpic Toilet Cleaning Liquid Original</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(87, 1, 6, NULL, '0195', 'Harpic Bathroom Cleaning Powder Original', 'harpic-bathroom-cleaning-powder-original-TboQKGbUYsK8y57K5BXiZSDY77VxrZxyZLjdmC92', '<p>Harpic Bathroom Cleaning Powder Original</p>', NULL, NULL, 75.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(88, 1, 6, NULL, '0196', 'Harpic Toilet Cleaning Powder', 'harpic-toilet-cleaning-powder-9MfogRWqXdD2IiZlArEBIXceeSUlyd8P46p3wikk', '<p>Harpic Toilet Cleaning Powder</p>', NULL, NULL, 70.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(89, 1, 6, NULL, '0197', 'Harpic Toilet Cleaning Powder', 'harpic-toilet-cleaning-powder-pFrB2WFVtTfsdIF96xPzsROxHqfjrdViUGaN0Rkl', '<p>Harpic Toilet Cleaning Powder</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(90, 1, 6, NULL, '0198', 'Lizol Floor Cleaner Lavender Disinfectant Surface', 'lizol-floor-cleaner-lavender-disinfectant-surface-JEsS73ILe36JUPRU8ooVsWmMoGfOP1AZiCGG9CiX', '<p>Lizol Floor Cleaner Lavender Disinfectant Surface</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(91, 1, 6, NULL, '0199', 'Lizol Floor Cleaner Floral Disinfectant Surface', 'lizol-floor-cleaner-floral-disinfectant-surface-3mA2TndIEdqqPDrZOaqqYp4aUy93R1jJQ85YZ2Kp', '<p>Lizol Floor Cleaner Floral Disinfectant Surface</p>', NULL, NULL, 245.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(92, 1, 6, NULL, '0200', 'Lizol Floor Cleaner Floral Disinfectant Surface', 'lizol-floor-cleaner-floral-disinfectant-surface-A94d8sc8FpC5gw0vCrvTDwwoIIvmgy7poTm1doOx', '<p>Lizol Floor Cleaner Floral Disinfectant Surface</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-09-25 10:13:50'),
(93, 1, 6, NULL, '0201', 'Lizol Floor Cleaner Citrus Disinfectant Surface', 'lizol-floor-cleaner-citrus-disinfectant-surface-lgQ6kKuSeWwCM9RiEU9eh3gNuJ9p36Lm4d4noiXb', '<p>Lizol Floor Cleaner Citrus Disinfectant Surface</p>', NULL, NULL, 245.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(94, 1, 6, NULL, '0202', 'Lizol Floor Cleaner Citrus Disinfectant Surface', 'lizol-floor-cleaner-citrus-disinfectant-surface-L1ti8cEyRlUDaJ1VZfOTcZwQARRJUXvXXUtS7Gjx', '<p>Lizol Floor Cleaner Citrus Disinfectant Surface</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(95, 1, 6, NULL, '0203', 'Lizol Floor Cleaner Lavender Disinfectant Surface', 'lizol-floor-cleaner-lavender-disinfectant-surface-p4DGpCTLHytbhjOKycNU8RFFmgJIVsKXoOKUqRs4', '<p>Lizol Floor Cleaner Lavender Disinfectant Surface</p>', NULL, NULL, 245.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(96, 1, 6, NULL, '0204', 'RokSol Tiles & Bathroom Cleaner', 'roksol-tiles-bathroom-cleaner-hPp4mhyNcW0aUNXcAY6oChLN5vYKKZ4yaRxMASOE', '<p>Rok Sol Tiles &amp; Bathroom Cleaner</p>', NULL, NULL, 85.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(97, 1, 6, NULL, '0205', 'Rok Floor Cleaner (Lemon)', 'rok-floor-cleaner-lemon-NhvJXYDlv92MEqRTuhtXxxMHTTwWIInKgM293vdi', '<p>Rok Floor Cleaner (Lemon)</p>', NULL, NULL, 230.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(98, 1, 6, NULL, '0206', 'Rok Citrus Floor Cleaner', 'rok-citrus-floor-cleaner-PS4qvW3md8pC2hNkmbMFUPxU0FKT4bdIMPGDZ9UN', '<p>Rok Citrus Floor Cleaner</p>', NULL, NULL, 235.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(99, 1, 6, NULL, '0207', 'Rok Glass Cleaner Refill', 'rok-glass-cleaner-refill-5aplyFgOCZ6IzNzw0rETa7qLpugxLUOvHwtbbmYl', '<p>Rok Glass Cleaner Refill</p>', NULL, NULL, 95.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(100, 1, 6, NULL, '0208', 'Rok Glasso Glass Cleaner', 'rok-glasso-glass-cleaner-TEchiYKkGsyhKPZy7gi81YfKHLJ2YWX1lCCNbCyQ', '<p>Rok Glasso Glass Cleaner</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(101, 1, 6, NULL, '0209', 'Rok Glass Cleaner Spray', 'rok-glass-cleaner-spray-MaulMqFufAD1o8QltzgUHc6R5RWZsBgK4CzQowar', '<p>Rok Glass Cleaner Spray</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(102, 1, 6, NULL, '0210', 'Rok Bleaching Powder', 'rok-bleaching-powder-YRpdW80aJCu84rAymiv8l1fCnvze9VF9FnwHvetj', '<p>Rok Bleaching Powder</p>', NULL, NULL, 50.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(103, 1, 6, NULL, '0211', 'Rok Perfume Phenyle', 'rok-perfume-phenyle-bYz4FmuVcSb7wVBjTZzhRd8OjGO6qnrmDJNoTFpW', '<p>Rok Perfume Phenyl</p>', NULL, NULL, 165.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(104, 1, 6, NULL, '0212', 'Mr.Brasso Glass & Household Cleaner Refill', 'mrbrasso-glass-household-cleaner-refill-NAOI9UQJFGbQhC28TLqJ8jDynDxSI5GF6x6k8nYq', '<p>Mr.Brasso Glass &amp; Household Cleaner Refill</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(105, 1, 6, NULL, '0213', 'Mr.Brasso Glass & Household Cleaner Spray', 'mrbrasso-glass-household-cleaner-spray-NzUoA7B7awiec4b7pqby81h9hK0ENRf1Pu1b59kJ', '<p>Mr.Brasso Glass &amp; Household Cleaner Spray</p>', NULL, NULL, 135.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(106, 1, 6, NULL, '0214', 'Shakti Liquid Toilet Cleaner', 'shakti-liquid-toilet-cleaner-SaDEZg5lO5qDhH5YOFt64JXhXEp01mJAXPxKuaWS', '<p>Shakti Liquid Toilet Cleaner&nbsp;</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(107, 1, 6, NULL, '0215', 'Finis Fixol Toilet & Tiles Cleaner', 'finis-fixol-toilet-tiles-cleaner-98rwJQdeASoh6o5xKpRrtbTIizpvusMzFAMwmBZK', '<p>Finis Fixol Toilet &amp; Tiles Cleaner&nbsp;</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(108, 1, 6, NULL, '0216', 'Dettol Handwash Pump Re-energize', 'dettol-handwash-pump-re-energize-0NKlaePF8l8cY7Ati5THj0ONhGHcNRF5ad5e1Qpt', '<p>Dettol Handwash Pump Re-energize</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(109, 1, 6, NULL, '0217', 'Dettol Handwash Pump Skincare', 'dettol-handwash-pump-skincare-s3TLnRzgxlUWKZ38xzPumvPWmkpeHI4tOcx1bRCF', '<p>Dettol Handwash Pump Skincare&nbsp;</p>', NULL, NULL, 95.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(110, 1, 6, NULL, '0218', 'Dettol Handwash Pump Cool', 'dettol-handwash-pump-cool-7Cs58cIrA3VTQBlXsKUdAJ3E3vyy8rgx6Ii15rZ1', '<p>Dettol Handwash Pump Cool</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(111, 1, 6, NULL, '0219', 'Dettol Handwash Refill Poly Cool', 'dettol-handwash-refill-poly-cool-owWpnyvomMWzPXbMoREz0cdwW3IfATjacewoERxU', '<p>Dettol Handwash Refill Poly Cool</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(112, 1, 6, NULL, '0220', 'Dettol Handwash pump Gold', 'dettol-handwash-pump-gold-CV9hTCdfpz19zfILWvfJBkTByChrSk1NmeqX2bw3', '<p>Dettol Handwash pump Gold</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(113, 1, 6, NULL, '0221', 'Dettol Handwash pump gold Refill pack', 'dettol-handwash-pump-gold-refill-pack-0uTEaQcQ5EMf9EeWyKoKu8Fnqa9IRyV3gCldItei', '<p>Dettol Handwash pump gold Refill pack</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(114, 1, 6, NULL, '0222', 'Dettol Handwash  Refill Sensitive', 'dettol-handwash-refill-sensitive-oDxpkUikx4H29rPsIYAt6zNk8kivwnYJ8G0n1uq3', '<p>Dettol Handwash &nbsp;Refill Sensitive</p>', NULL, NULL, 220.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(115, 1, 6, NULL, '0223', 'Dettol Handwash Refill Poly Re-energize', 'dettol-handwash-refill-poly-re-energize-cn2TmEhiFD5xgIaCVMyWoUlatRm1YabY1u6XLaol', '<p>Dettol Handwash Refill Poly Re-energize</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(116, 1, 6, NULL, '0224', 'Dettol Anticeptic Liquid', 'dettol-anticeptic-liquid-AVqNRTlgKTea3kXB9a4OHKYj48akXzYVcEkfBQaE', '<p>Dettol Anticeptic Liquid</p>', NULL, NULL, 35.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(117, 1, 6, NULL, '0225', 'Dettol Anticeptic Liquid', 'dettol-anticeptic-liquid-E1V3QeyeDhG061F595ArS9cXxPV4yeV05m27xJPg', '<p>Dettol Anticeptic Liquid</p>', NULL, NULL, 155.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(118, 1, 6, NULL, '0226', 'Dettol Anticeptic Liquid', 'dettol-anticeptic-liquid-KInpaTQimMkvaa6cHXCfqFMtMhPuxWyShtJTq9xc', '<p>Dettol Anticeptic Liquid</p>', NULL, NULL, 48.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(119, 1, 6, NULL, '0227', 'Dettol Handwash Refill Poly Original', 'dettol-handwash-refill-poly-original-TbvTPoabgA56q2J7UAaw4PNpQ59aYSdTx2L4wWs5', '<p>Dettol Handwash Refill Poly Original</p>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(120, 1, 6, NULL, '0228', 'Dettol Handwash Pump Sensitive', 'dettol-handwash-pump-sensitive-NA5Xtj1CnTRrqguL9icKS8D1pQzShbUNMtnyZqlZ', '<p>Dettol Handwash Pump Sensitive</p>', NULL, NULL, 95.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(121, 1, 6, NULL, '0229', 'Savlon Liquid', 'savlon-liquid-ngWFe7G2yzOdaaLnUYLPLLhCUM595WFSoAYfGfHF', '<p>Savlon Liquid anti septic</p>', NULL, NULL, 44.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(122, 1, 6, NULL, '0230', 'Savlon Liquid antiseptic', 'savlon-liquid-antiseptic-QjWt0Bf7nU0KEmcu1jxd7MO9cF6hlIxcA84DfvDt', '<p>Savlon Liquid antiseptic</p>', NULL, NULL, 32.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(123, 1, 6, NULL, '0231', 'Savlon Liquid antiseptic', 'savlon-liquid-antiseptic-qCEFPNo0MpY48ACmDotW3ehOCF4vQl84j2nAa8do', '<p>Savlon Liquid antiseptic</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-10-31 09:24:33'),
(124, 1, 6, NULL, '0232', 'Savlon Antiseptic Cream', 'savlon-antiseptic-cream-MzCIy1C6TjCqsFOOxJyuViy8NTabCQnWhLiftX0j', '<p>Savlon Antiseptic Cream</p>', NULL, NULL, 25.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(125, 1, 6, NULL, '0233', 'Savlon Antiseptic Cream', 'savlon-antiseptic-cream-Ov9q4K5LNGTVZp7zis575DrXOxI95aTfjDyflJNF', '<p>Savlon Antiseptic Cream</p>', NULL, NULL, 34.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(126, 1, 6, NULL, '0234', 'Savlon Hand Wash Aloe Vera', 'savlon-hand-wash-aloe-vera-ANc5e8Jvv9jvBPa5gZajLEql6dPn7KEic07hFSLY', '<p>Savlon Hand Wash Aloe Vera&nbsp;</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(127, 1, 6, NULL, '0235', 'Savlon Hand Wash Aloe Vera', 'savlon-hand-wash-aloe-vera-RtTqkRpdd1LiJwCOgTrOakLkvzceAoFYANBnTgVc', '<p>Savlon Hand Wash Aloe Vera&nbsp;</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(128, 1, 6, NULL, '0236', 'Savlon Ocean Blue Antiseptic Handwash', 'savlon-ocean-blue-antiseptic-handwash-GR1FxWMN3pZDSCQ2UGaAmdzQS07LD7DuSuYhHxOr', '<p>Savlon Ocean Blue Antiseptic Handwash&nbsp;</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(129, 1, 6, NULL, '0237', 'Savlon Ocean Blue Antiseptic Hand Wash (Refill)', 'savlon-ocean-blue-antiseptic-hand-wash-refill-FVgl6nyOxcQwSH1DQVrdART3iHtt15wgUWWNeVmk', '<p>Savlon Ocean Blue Antiseptic Hand Wash (Refill)&nbsp;</p>', NULL, NULL, 55.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(130, 1, 6, NULL, '0238', 'Savlon Instant Hand Sanitizer', 'savlon-instant-hand-sanitizer-SssfWlKSSMLa1BQ42jWDQkZG3ImklxQ3nZk5gJAp', '<p>Savlon Instant Hand Sanitizer&nbsp;</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(131, 1, 6, NULL, '0239', 'Savlon Cool Antiseptic Soap', 'savlon-cool-antiseptic-soap-xUt6YqlqCOP5Wutf4pB0dQFRbj6qlHwURx9GZJNb', '<p>Savlon Cool Antiseptic Soap&nbsp;</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(132, 1, 6, NULL, '0240', 'Lifebuoy Handwash Total Refill', 'lifebuoy-handwash-total-refill-klhrncbXMXaAnK8B0Ndjb0Pw2wZPILjAFQ7RmpWS', '<p>Lifebuoy Handwash Total Refill&nbsp;</p>', NULL, NULL, 55.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(133, 1, 6, NULL, '0241', 'Lifebuoy Handwash Care Refill', 'lifebuoy-handwash-care-refill-zTlMEHpUlH1kDfDUiudsfIKAaJWW3MoNWITRWFu2', '<p>Lifebuoy Handwash Care Refill&nbsp;</p>', NULL, NULL, 55.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(134, 1, 6, NULL, '0242', 'Lifebuoy Handwash Total Pump', 'lifebuoy-handwash-total-pump-BdT0Kdp0Fua8460slmOfFA84YcwMB2RApZBwPutN', '<p>Lifebuoy Handwash Total Pump&nbsp;</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(135, 1, 6, NULL, '0243', 'Lifebuoy Handwash Lemon Fresh Pump', 'lifebuoy-handwash-lemon-fresh-pump-in3vpV6ItdmpByQ9qv69g8GDCT49UUOFrWqWsCOo', '<p>Lifebuoy Handwash Lemon Fresh Pump</p>', NULL, NULL, 95.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(136, 1, 6, NULL, '0244', 'Lifebuoy Handwash Lemon Fresh Refill', 'lifebuoy-handwash-lemon-fresh-refill-gtGsNEuFPZ3f1ek6OMqjkSrZKZlTtZLF3oLRrwDV', '<p>Lifebuoy Handwash Lemon Fresh Refill&nbsp;</p>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(137, 1, 6, NULL, '0245', 'Lifebuoy Handwash Care Pump', 'lifebuoy-handwash-care-pump-XtCdR0G48tjE00RH8z5E96n0k67iZwNHw1TfVhX8', '<p>Lifebuoy Handwash Care Pump&nbsp;</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(138, 1, 6, NULL, '0246', 'Bashundhara Toilet Tissue (17X 4pcs)', 'bashundhara-toilet-tissue-17x-4pcs-wQhHN5aB1rmfePtA0QVuCwtOIpK2UMGoDk7HRcsg', '<p>Bashundhara Toilet Tissue (17X 4pcs)</p>', NULL, NULL, 17.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(139, 1, 6, NULL, '0247', 'Bashundhara Gold Toilet Tissue', 'bashundhara-gold-toilet-tissue-lzewaOtRB6gh41qkmiiny6uKpG76fKcXrnACbVJY', '<p>Bashundhara Gold Toilet Tissue</p>', NULL, NULL, 50.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(140, 1, 6, NULL, '0248', 'Bashundhara Facial Tissue', 'bashundhara-facial-tissue-xWfWaXSnfcbyb4ftNcf8iEQ3mYktCjNfxp1UyT31', '<p>Bashundhara Facial Tissue&nbsp;150 X 2 ply</p>', NULL, NULL, 80.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(141, 1, 6, NULL, '0249', 'Bashundhara Facial Tissue', 'bashundhara-facial-tissue-6NZovKKmyljm3Rwj5M2XIcwx2qRNezHyb8VyVHKt', '<p>Bashundhara Facial Tissue&nbsp;120 x 2 ply</p>', NULL, NULL, 62.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(142, 1, 6, NULL, '0250', 'Bashundhara Paper Napkins 13\" Unscented (100 pcs)', 'bashundhara-paper-napkins-13-unscented-100-pcs-4C65vqHggrxgxHFfRjxnM2xm5wb4BYwUJ1zrK7uj', '<p>Bashundhara Paper Napkins 13&quot; Unscented (100 pcs)</p>', NULL, NULL, 55.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(143, 1, 6, NULL, '0251', 'Bashundhara Kitchen Towel 2 Rolls', 'bashundhara-kitchen-towel-2-rolls-KDW0lQW7qmNA8cinK8Ej5yz5ltuqTtFAgC1XTSyJ', '<p>Bashundhara Kitchen Towel 2 Rolls&nbsp;</p>', NULL, NULL, 114.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(144, 1, 6, NULL, '0252', 'Bashundhara Hand Towel 1 ply', 'bashundhara-hand-towel-1-ply-rvzZDnqIFNonZGgTmGoIRlDFW0DSw3dp4tCPgVuI', '<p>Bashundhara Hand Towel 1 ply</p>', NULL, NULL, 78.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(145, 1, 6, NULL, '0253', 'Fresh Perfumed Facial Tissue (150 X 2) ply Box', 'fresh-perfumed-facial-tissue-150-x-2-ply-box-ZwSp9kEnmQaurHy8FWdnK3gCwHcUaeW6KxtLJWkj', '<p>Fresh Perfumed Facial Tissue (150 X 2) ply Box</p>', NULL, NULL, 80.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(146, 1, 6, NULL, '0254', 'Fresh Perfumed Facial Tissue (120 X 2) ply Box', 'fresh-perfumed-facial-tissue-120-x-2-ply-box-qctY4RiT5p4VDH1GttFDkRPUd2Lj4NF6uIjvAj8V', '<p>Fresh Perfumed Facial Tissue (120 X 2) ply Box</p>', NULL, NULL, 62.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(147, 1, 6, NULL, '0255', 'Fresh Paper Napkins 13\" Perfumed (100X1 Ply)', 'fresh-paper-napkins-13-perfumed-100x1-ply-l3pAsJBDPfpqeOMKvLoV9bhkEJf650ZqMB9Gy0lN', '<p>Fresh Paper Napkins 13&quot; Perfumed (100X1 Ply)</p>', NULL, NULL, 55.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(148, 1, 6, NULL, '0256', 'Fresh Toilet Tissue (Family Value Pack)', 'fresh-toilet-tissue-family-value-pack-ddBlIA4uoGONAFwH5tgXIXC9K4aEaEGUq4fVgtZJ', '<p>Fresh Toilet Tissue (Family Value Pack)</p>', NULL, NULL, 65.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(149, 1, 6, NULL, '0257', 'Fresh Hand Towel (250X1 Ply)', 'fresh-hand-towel-250x1-ply-pH2507JfaogFzPvZLBBzvckftA0MurKjzPFevjpW', '<p>Fresh Hand Towel (250X1 Ply)</p>', NULL, NULL, 78.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(150, 1, 6, NULL, '0258', 'Fresh kitchen Towel Roll 2 roll', 'fresh-kitchen-towel-roll-2-roll-jdym5Nvzue5a4guDtofjBkuApfKPp9T2vjS5TvwD', '<p>Fresh kitchen Towel Roll</p>', NULL, NULL, 120.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(151, 1, 6, NULL, '0259', 'Fresh White Wallet Tissue (10X2 Ply)', 'fresh-white-wallet-tissue-10x2-ply-HAvTlv2rDaCddaYkq4TfXKHck5SPWwcxTVkYPhLG', '<p>Fresh White Wallet Tissue (10X2 Ply)</p>', NULL, NULL, 10.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(152, 1, 6, NULL, '0260', 'Sunsilk Shampoo Hijab Recharge', 'sunsilk-shampoo-hijab-recharge-97sqB9HaQZYNznoqqF0aSy2XmIPFGBPE3Z7LnUMU', '<p>Sunsilk Shampoo Hijab Recharge</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(153, 1, 6, NULL, '0261', 'Surf Excel Powder Matic Front', 'surf-excel-powder-matic-front-5Vki9kRdJ6XGZxpohbue6qtyNosf01YaxXKLx6vo', '<p>Surf Excel Powder Matic Front</p>', NULL, NULL, 275.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(154, 1, 6, NULL, '0262', 'Surf Excel Matic Liquid Detergent Front Load', 'surf-excel-matic-liquid-detergent-front-load-RO3aHQg1umoTLnz5lnTeQnpjZJF82AITHBhvnAWu', '<p>Surf Excel Matic Liquid Detergent Front Load</p>', NULL, NULL, 210.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(155, 1, 6, NULL, '0263', 'Chamak Fabric Brightner', 'chamak-fabric-brightner-APrXjNfq382oIpxbPiCjKf6hzMh6otgm9KigTyC0', '<p>Chamak Fabric Brightner</p>', NULL, NULL, 30.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(156, 1, 6, NULL, '0264', 'Chaka Advanced Ball soap', 'chaka-advanced-ball-soap-8rcZ0SSGYKzPqFtmK5nx1yYevSSdPGvWP8ncslEp', '<p>Chaka Advanced Ball soap</p>', NULL, NULL, 16.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(157, 1, 6, NULL, '0265', 'Chaka Advanced Lemon washing powder', 'chaka-advanced-lemon-washing-powder-8lp9ZI4HJmcpvzmwhclxqxsXNE8gfLVw0MRi6v1T', '<p>Chaka Advanced Lemon washing powder</p>', NULL, NULL, 42.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(158, 1, 6, NULL, '0266', 'Godrej Good Knight Power Activ + Cartridge', 'godrej-good-knight-power-activ-cartridge-U7SnIjJNoZDcGAkLCEfAk2sYz4DK6cqMuAjVpv8Y', '<p>Godrej Good Knight Power Activ + Cartridge</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(159, 1, 6, NULL, '0267', 'Chaka Super White Washing Powder', 'chaka-super-white-washing-powder-xAucUv0PZk3cNRw1EUdnL94Ys2KDtHyXTC5SV71i', '<p>Chaka Super White Washing Powder</p>', NULL, NULL, 60.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(160, 1, 6, NULL, '0268', 'Keya glycerine Laundry soap', 'keya-glycerine-laundry-soap-n8VlJSzWiHOWcV3qtAWTf72LA1T4kDp8fxB0Ettf', '<p>Keya glycerine Laundry soap</p>', NULL, NULL, 20.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(161, 1, 6, NULL, '0269', 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge', 'godrej-good-knight-xpress-system-liquid-vapouriser-cartridge-0lU9SyhMbvpnRbvSv9LPWdw7MHjttljx59K0cIr6', '<p>Godrej Good Knight Xpress System Liquid Vapouriser Cartridge</p>', NULL, NULL, 135.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(162, 1, 6, NULL, '0270', 'ACI Smart Laundry Soap', 'aci-smart-laundry-soap-cG9tumq7ZRLT0HZbFkjvGoqL9Aclc8rGXeFXaq5R', '<p>ACI Smart Laundry Soap</p>', NULL, NULL, 20.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(163, 1, 6, NULL, '0271', 'ACI Smart Washing Powder', 'aci-smart-washing-powder-QnZsKE3UREKEHl08vG7VtBkOyuQPBlDrXlIVMZX6', '<p>ACI Smart Washing Powder</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(164, 1, 6, NULL, '0272', 'Godrej Good Knight Power Active (Dual Power) Machine + Refill', 'godrej-good-knight-power-active-dual-power-machine-refill-2uIDKUVu5B92c5SKQ4SFzEL6QEnKe5GBCRYAu7iH', '<p>Godrej Good Knight Power Active (Dual Power) Machine + Refill</p>', NULL, NULL, 149.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(165, 1, 6, NULL, '0273', 'ACI Smart Supreme Washing Powder', 'aci-smart-supreme-washing-powder-oMLBvzoMUgXNBYJz53ZusFfv1jZdD4sPuWTTA4uw', '<p>ACI Smart Supreme Washing Powder</p>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(166, 1, 6, NULL, '0274', 'Godrej Good Knight Advanced Xpress Coil', 'godrej-good-knight-advanced-xpress-coil-dZqj8KB0w9TUnXuNvDwjClhtVLZ95z1tbzOBRmD6', '<p>Godrej Good Knight Advanced Xpress Coil</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(167, 1, 6, NULL, '0275', 'Godrej Hit Lime Mosquitoes & Flies Spray', 'godrej-hit-lime-mosquitoes-flies-spray-PnSfkxhnK0ZvchDWolkQZJS6ebzsYR7GB2YR4D04', '<p>Godrej Hit Lime Mosquitoes &amp; Flies Spray</p>', NULL, NULL, 301.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(168, 1, 6, NULL, '0276', 'Godrej New Hit Mosquitoes Spray', 'godrej-new-hit-mosquitoes-spray-HhD3muYf8a3ZISGlQbrvfhQq6N5J6SlnWBwrdnTs', '<p>Godrej New Hit Mosquitoes Spray</p>', NULL, NULL, 301.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(169, 1, 6, NULL, '0277', 'Tide Detergent Powder Jasmine&Rose', 'tide-detergent-powder-jasminerose-LmYXTG4fAGPtc7PXeP3UWTKhrR7Imtydq7DjbCtv', '<p>Tide Detergent Powder Jasmine&amp;Rose</p>', NULL, NULL, 140.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(170, 1, 6, NULL, '0278', 'Godrej New Hit Cockroaches Spray', 'godrej-new-hit-cockroaches-spray-8L15XCLUqODeSV7RVHLbYn12oAvDczVf6SwwBl78', '<p>Godrej New Hit Cockroaches Spray</p>', NULL, NULL, 301.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(171, 1, 6, NULL, '0279', 'Godrej Good Knight Xpress Liquid Vapouriser Machine & Refill', 'godrej-good-knight-xpress-liquid-vapouriser-machine-refill-2tfO8XZvMM1JFNTm0azp2ojy0eTV0YAp4CiRYF7i', '<p>Godrej Good Knight Xpress Liquid Vapouriser Machine &amp; Refill</p>', NULL, NULL, 225.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(172, 1, 6, NULL, '0280', 'Godrej New Hit Anti Roach Gel 45 Days', 'godrej-new-hit-anti-roach-gel-45-days-aOULLehgAcHTwbl0iWGWAHvNnYpyFdJupZiuj5Db', '<p>Godrej New Hit Anti Roach Gel 45 Days</p>', NULL, NULL, 199.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(173, 1, 6, NULL, '0281', 'Godrej Good Knight Mosquito Fabric Roll On', 'godrej-good-knight-mosquito-fabric-roll-on-KI8W7Lq7utQPpjCRaBmyLOUN6sZ9Cr8X8dPnafYk', '<p>Godrej Good Knight Mosquito Fabric Roll-On</p>', NULL, NULL, 93.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(174, 1, 6, NULL, '0282', 'ACI Aerosol Insect Spray Jumbo', 'aci-aerosol-insect-spray-jumbo-vDUeRc3Mt5hI73wOO63B85aH2wTaP7WFEeFQPA5A', '<p>ACI Aerosol Insect Spray Jumbo</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(175, 1, 6, NULL, '0283', 'ACI Aerosol Insect Spray', 'aci-aerosol-insect-spray-bwyoWWIjv8PIhVybucwPFwzmCRLrRyo2BTCwSP1x', '<p>ACI Aerosol Insect Spray</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(176, 1, 6, NULL, '0284', 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill', 'aci-all-out-ultra-mosquito-liquid-vaporizer-refill-0EJbAqzzV9LZgv02wffniZs5X4vggAnJKkHMsGY6', '<p>ACI All Out Ultra Mosquito Liquid Vaporizer Refill</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(177, 1, 6, NULL, '0285', 'Xpel Aerosol', 'xpel-aerosol-b6dUjCgBmUcwFYjredGeFTMT4o01cjz8PHXrOsnK', '<p>Xpel Aerosol</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(178, 1, 6, NULL, '0286', 'Sunsilk Shampoo Hijab Recharge', 'sunsilk-shampoo-hijab-recharge-wkULuMtrTFQPIzNSUCYLozFtuh3R0202qpWYT5pP', '<p>Sunsilk Shampoo Hijab Recharge</p>', NULL, NULL, 315.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(179, 1, 6, NULL, '0287', 'Sunsilk Shampoo Hijab Anti-Breakage', 'sunsilk-shampoo-hijab-anti-breakage-x1vEt2UH4Q3CF43fv7AQhyJ8W2O0caKivWsguq1C', '<p>Sunsilk Shampoo Hijab Anti-Breakage</p>', NULL, NULL, 315.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(180, 1, 6, NULL, '0288', 'Sunsilk Shampoo Hijab Anti-Breakage', 'sunsilk-shampoo-hijab-anti-breakage-uwbziivEIzIaGnR02vTkgGOGfm6HygItxk4EGS1J', '<p>Sunsilk Shampoo Hijab Anti-Breakage</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(181, 1, 6, NULL, '0289', 'Sunsilk Shampoo Hijab Anti Dandruff', 'sunsilk-shampoo-hijab-anti-dandruff-dvVv49lOeFunpMLhQ4xLq6YHavCMejpeGt5lgCMO', '<p>Sunsilk Shampoo Hijab Anti Dandruff&nbsp;</p>', NULL, NULL, 315.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(182, 1, 6, NULL, '0290', 'Sunsilk Shampoo Lusciously Thick & Long', 'sunsilk-shampoo-lusciously-thick-long-7NnJj1TxoqU7xWeJ4Ol9168lSGIwauk6L1tO4nUc', '<p>Sunsilk Shampoo Lusciously Thick &amp; Long</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(183, 1, 6, NULL, '0291', 'Sunsilk Shampoo Lusciously Thick & Long', 'sunsilk-shampoo-lusciously-thick-long-3uGRsBt9NwhTZ7Fn4fpkyFhQooAxqMl1GLnjhiiT', '<p>Sunsilk Shampoo Lusciously Thick &amp; Long</p>', NULL, NULL, 175.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(184, 1, 6, NULL, '0292', 'Sunsilk Shampoo Perfect Straight', 'sunsilk-shampoo-perfect-straight-eiXMXq23V5vbjBuvYhWKkmnjT9vALqIVoxXjtnwF', '<p>Sunsilk Shampoo Perfect Straight</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(185, 1, 6, NULL, '0293', 'Sunsilk Shampoo Perfect Straight', 'sunsilk-shampoo-perfect-straight-S00dL4fxpNBHEVifOLDAhKiC8E0qcFEqOKMIu7uS', '<p>Sunsilk Shampoo Perfect Straight</p>', NULL, NULL, 315.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(186, 1, 6, NULL, '0294', 'Sunsilk Conditioner Perfect Straight', 'sunsilk-conditioner-perfect-straight-J6TLBPVs8gQevoWd3auiiIgb9z1hzoKZiUQhw5rJ', '<p>Sunsilk Conditioner Perfect Straight</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL);
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `subcategory_id`, `product_code`, `name`, `slug`, `product_details`, `short_description`, `specification`, `unit_price`, `discount_price`, `stock_status`, `quantity`, `special_note`, `video_link`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(187, 1, 6, NULL, '0295', 'Sunsilk Shampoo Stunning Black Shine', 'sunsilk-shampoo-stunning-black-shine-c1Ich06QEqr4e7CjEnRwvFqWF4KLxxEEq0i0PQYp', '<p>Sunsilk Shampoo Stunning Black Shine</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(188, 1, 6, NULL, '0296', 'Sunsilk Shampoo Stunning Black Shine', 'sunsilk-shampoo-stunning-black-shine-gMAeSubRXgtbWEcXK17mu5cCR22Y0DnaDlcnnW54', '<p>Sunsilk Shampoo Stunning Black Shine</p>', NULL, NULL, 175.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(189, 1, 6, NULL, '0297', 'Finis Insect Powder', 'finis-insect-powder-KUNtGGYG7syLWEP6wizAdi1gh8nctPWV2TNz971J', '<p>Finis Insect Powder</p>', NULL, NULL, 30.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(190, 1, 6, NULL, '0298', 'Odomos Mosquito Repellent Cream', 'odomos-mosquito-repellent-cream-O9MNK56FqHzfJNDojRfKAptFgAgm8m1KIya3ZM7H', '<p>Odomos Mosquito Repellent Cream</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(191, 1, 6, NULL, '0299', 'Sunsilk Shampoo Hair Fall Solution', 'sunsilk-shampoo-hair-fall-solution-KlMY23hHwrn7Mj8FGxkAijx7GjlGNavho2oBFXzO', '<p>Sunsilk Shampoo Hair Fall Solution&nbsp;</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(192, 1, 6, NULL, '0300', 'Sunsilk Shampoo Hair Fall Solution', 'sunsilk-shampoo-hair-fall-solution-sAMTDgyVPkt2q84bPhiTvED8T4XIYdeY08bhbeLC', '<p>Sunsilk Shampoo Hair Fall Solution&nbsp;</p>', NULL, NULL, 165.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(193, 1, 6, NULL, '0301', 'Sunsilk Shampoo Healthy Growth', 'sunsilk-shampoo-healthy-growth-5q6o66ZUj2NwveEnbxfjI0ItMFnL3dMNI9ewRwaG', '<p>Sunsilk Shampoo Healthy Growth</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(194, 1, 6, NULL, '0302', 'Sunsilk Shampoo Healthy Growth', 'sunsilk-shampoo-healthy-growth-phdxIoFF3Fq6IKp3kSPvcTZFM0YBVwPHTPygra28', '<p>Sunsilk Shampoo Healthy Growth</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(195, 1, 6, NULL, '0303', 'Sunsilk Co Creations Soft & Smooth Shampoo', 'sunsilk-co-creations-soft-smooth-shampoo-0zh4CTU3c3WdlHlqFs8t8qzqgp3qLXON10KwEZML', '<p>Sunsilk Co-Creations Soft &amp; Smooth Shampoo</p>', NULL, NULL, 380.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(196, 1, 6, NULL, '0304', 'Finis Insect Powder', 'finis-insect-powder-1lMfDQ4EqEOE5HPtC4JJyX9W4cmqK5g2HiiG5ZXt', '<p>Finis Insect Powder</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(197, 1, 6, NULL, '0305', 'Sunsilk Co Creations Perfect Straight Shampoo', 'sunsilk-co-creations-perfect-straight-shampoo-a3n1Q22Mf2NKTizy5UcrTJEXfxNwEQL0xK6DOIrm', '<p>Sunsilk Co-Creations Perfect Straight Shampoo</p>', NULL, NULL, 380.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(198, 1, 6, NULL, '0306', 'Sunsilk Lively Clean & Fresh Shampoo', 'sunsilk-lively-clean-fresh-shampoo-6IjMsGQJne5RiPjyJTA1ikXS7ZW5ULHl2Iwx6YE8', '<p>Sunsilk Lively Clean &amp; Fresh Shampoo</p>', NULL, NULL, 430.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(199, 1, 6, NULL, '0307', 'Tresemme Conditioner Keratin Smooth', 'tresemme-conditioner-keratin-smooth-1dTM8wOBC03J83EGMbqgRRJ1PcKBhFkRIBzoPBHx', '<p>Tresemme Conditioner Keratin Smooth</p>', NULL, NULL, 280.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(200, 2, 6, NULL, '0310', 'Naphthalene Ball', 'naphthalene-ball-HQu5FLtjiDawefRT1zTyEqzYjW2EwqCDTbMXp5tj', '<p>Naphthalene Ball</p>', NULL, NULL, 70.00, 50.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:56'),
(201, 2, 6, NULL, '0311', 'Tresemme Hair Fall Defense Shampoo', 'tresemme-hair-fall-defense-shampoo-TxgHBHClUVmZOxYoQd2KhxWDIZ1XPCBUtgCbTnwx', '<p>Tresemme Hair Fall Defense Shampoo&nbsp;</p>', NULL, NULL, 240.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(202, 2, 6, NULL, '0312', 'Tresemme Hair Fall Defense Shampoo', 'tresemme-hair-fall-defense-shampoo-2stn0oAf2ttiJn0Ytw8GzPfHDqfs6hjxLzqyUcZ0', '<p>Tresemme Hair Fall Defense Shampoo&nbsp;</p>', NULL, NULL, 630.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(203, 2, 6, NULL, '0313', 'Tresemme Shampoo Keratin Smooth', 'tresemme-shampoo-keratin-smooth-yjRE49UCHiyeenxhc5A1irMu42kPpbZVt2cJmMKL', '<p>Tresemme Shampoo Keratin Smooth</p>', NULL, NULL, 630.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(204, 2, 6, NULL, '0314', 'Tresemme Shampoo Keratin Smooth', 'tresemme-shampoo-keratin-smooth-VrcqVhYDE5DATL57ulyyMdDTGOOzuVvVljI8FsJZ', '<p>Tresemme Shampoo Keratin Smooth</p>', NULL, NULL, 240.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(205, 2, 6, NULL, '0315', 'Clear Shampoo Anti Hairfall Anti Dandruff', 'clear-shampoo-anti-hairfall-anti-dandruff-e3qdE1KCwmruQcTqI5kNFWizXvqWvnS1LHTJ1J6G', '<p>Clear Shampoo Anti Hairfall Anti Dandruff</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(206, 2, 6, NULL, '0316', 'Clear Shampoo Anti Hairfall Anti Dandruff', 'clear-shampoo-anti-hairfall-anti-dandruff-EbKq9YKV9YGQ1zCvbTJWdTFWEzA9ozxagJrhiPtj', '<p>Clear Shampoo Anti Hairfall Anti Dandruff</p>', NULL, NULL, 340.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(207, 2, 6, NULL, '0317', 'Clear Men Anti Dandruff Shampoo', 'clear-men-anti-dandruff-shampoo-BUHQBA6xn8jJJECQOGyVkM8dyzrJU9OpnNWGxSCx', '<p>Clear Men Anti Dandruff Shampoo</p>', NULL, NULL, 215.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(208, 2, 6, NULL, '0318', 'Clear Men Anti Dandruff Shampoo', 'clear-men-anti-dandruff-shampoo-5jNLWIrJKjs70CZbYX4YdmO51Dvx7iZoivyrG0E6', '<p>Clear Men Anti Dandruff Shampoo</p>', NULL, NULL, 340.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(209, 2, 6, NULL, '0319', 'Clear Shampoo Men Cool Sport Menthol Anti  Dandruff', 'clear-shampoo-men-cool-sport-menthol-anti-dandruff-0tYyafD2GCkY9yb79LDjW2SNezrv2ZFT0eCljH50', '<p>Clear Shampoo Men Cool Sport Menthol Anti &nbsp;Dandruff</p>', NULL, NULL, 215.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(210, 2, 6, NULL, '0320', 'Clear Shampoo Men Cool Sport Menthol Anti  Dandruff', 'clear-shampoo-men-cool-sport-menthol-anti-dandruff-P9yk7vAgkfg9PXiBLp3oJ89bKWhjkvihne2v8LAi', '<p>Clear Shampoo Men Cool Sport Menthol Anti &nbsp;Dandruff</p>', NULL, NULL, 340.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(211, 2, 6, NULL, '0321', 'Clear Complete Active Care Shampoo', 'clear-complete-active-care-shampoo-HYxmC45ioARJi10uejxnQfaIuPS2GUL4DpvbcEZy', '<p>Clear Complete Active Care Shampoo</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(212, 2, 6, NULL, '0322', 'Clear Complete Active Care Shampoo', 'clear-complete-active-care-shampoo-juwaj5LE8FBNyiLWQJyxuooXvHzojzSgjjCMXRWc', '<p>Clear Complete Active Care Shampoo</p>', NULL, NULL, 330.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(213, 2, 6, NULL, '0323', 'Clear Anti Hairfall Shampoo', 'clear-anti-hairfall-shampoo-GkaGu5TYy7SngLGxUehXjyuLk6cMnZx4bcBjCIx9', '<p>Clear Anti Hairfall Shampoo</p>', NULL, NULL, 340.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(214, 2, 6, NULL, '0324', 'Head & Shoulders Anti-Hairfall Shampoo', 'head-shoulders-anti-hairfall-shampoo-AHhsWh9gICrh7QylOgElg0BVV7tAwMhuUtnTIFfk', '<p>Head &amp; Shoulders Anti-Hairfall Shampoo</p>', NULL, NULL, 360.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(215, 2, 6, NULL, '0325', 'Head & Shoulders Anti-Hairfall Shampoo', 'head-shoulders-anti-hairfall-shampoo-tYm0abwqS1oIG2tGpBIdQOGDQaVomCR79z11ZwPc', '<p>Head &amp; Shoulders Anti-Hairfall Shampoo</p>', NULL, NULL, 856.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(216, 2, 6, NULL, '0326', 'Head & Shoulders Smooth & Silky Shampoo', 'head-shoulders-smooth-silky-shampoo-4VPf9kqRLCnhEet1tXx1Dzx1OauNXcyt4wGm0KuI', '<p>Head &amp; Shoulders Smooth &amp; Silky Shampoo</p>', NULL, NULL, 360.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(217, 2, 6, NULL, '0327', 'Head & Shoulders Smooth & Silky Shampoo', 'head-shoulders-smooth-silky-shampoo-lyh3o9wHvAokNzrXJqrsvfvnSTvkKydZDbeYzHLU', '<p>Head &amp; Shoulders Smooth &amp; Silky Shampoo</p>', NULL, NULL, 215.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(218, 2, 6, NULL, '0328', 'Head & Shoulders Clean & Balanced Shampoo', 'head-shoulders-clean-balanced-shampoo-hqCSVfnVrnZvAgWQxNR5meYbFhYP7qPm1whNnXEF', '<p>Head &amp; Shoulders Clean &amp; Balanced Shampoo</p>', NULL, NULL, 360.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(219, 2, 6, NULL, '0329', 'Head & Shoulders Clean & Balanced Shampoo', 'head-shoulders-clean-balanced-shampoo-VDE7mu7Q0LAqgIB6OpnnJHxLVfnQUfxIliMAwWPX', '<p>Head &amp; Shoulders Clean &amp; Balanced Shampoo</p>', NULL, NULL, 215.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(220, 2, 6, NULL, '0330', 'Head & Shoulders Cool Menthol Shampoo', 'head-shoulders-cool-menthol-shampoo-D1ssLiCMfpecC4pLJv97iyMnSSJsOjf0SpdODA0w', '<p>Head &amp; Shoulders Cool Menthol Shampoo&nbsp;</p>', NULL, NULL, 215.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(221, 2, 6, NULL, '0331', 'Head & Shoulders Cool Menthol Shampoo', 'head-shoulders-cool-menthol-shampoo-BI8KnUWaPUACrURX9JCSShX8AOy1quNLW3t53wYr', '<p>Head &amp; Shoulders Cool Menthol Shampoo&nbsp;</p>', NULL, NULL, 399.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(222, 2, 6, NULL, '0332', 'Head & Shoulders Cool Menthol Shampoo', 'head-shoulders-cool-menthol-shampoo-z479WbI4lxBPcgjcQwM2tBRt4MtZE5KWRsmsUy9J', '<p>Head &amp; Shoulders Cool Menthol Shampoo&nbsp;</p>', NULL, NULL, 856.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(223, 2, 6, NULL, '0333', 'Head & Shoulders Lemon Fresh Shampoo', 'head-shoulders-lemon-fresh-shampoo-FZfg82SYcWCsxVcxAoS9PJqxriHeUGzbA6A1b2uX', '<p>Head &amp; Shoulders Lemon Fresh Shampoo</p>', NULL, NULL, 399.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(224, 2, 6, NULL, '0334', 'Head & Shoulders Anti Dandruff Shampoo Sliky Black', 'head-shoulders-anti-dandruff-shampoo-sliky-black-AMpoPlrNxmNF4w6BHHy2VX4ZnYW81cNjsgUJuAwh', '<p>Head &amp; Shoulders Anti Dandruff Shampoo Silky Black</p>', NULL, NULL, 399.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(225, 2, 6, NULL, '0335', 'Head & Shoulders Smooth & Silky Shampoo', 'head-shoulders-smooth-silky-shampoo-SMUpz3S5ZfI5dUuUem26e766jfKmhH4dkaFDlPsJ', '<p>Head &amp; Shoulders Smooth &amp; Silky Shampoo</p>', NULL, NULL, 856.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(226, 2, 6, NULL, '0336', 'head & Shoulders Smooth & Silky 2in1 Shampoo+Co', 'head-shoulders-smooth-silky-2in1-shampooco-brB8Bq0aA1fsblbgjkipOCRVu8jRvSiXYczeATB2', '<p>head &amp; Shoulders Smooth &amp; Silky 2in1 Shampoo+Co</p>', NULL, NULL, 1010.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(227, 2, 6, NULL, '0337', 'Head & Shoulder 2 In 1 Active Protect Shampoo', 'head-shoulder-2-in-1-active-protect-shampoo-Wr4SXgGthHMHPAAOIUEZyCemivT7jr0WrWPAA5py', '<p>Head &amp; Shoulder 2 In 1 Active Protect Shampoo</p>', NULL, NULL, 280.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(228, 2, 6, NULL, '0338', 'Head & Shoulder 2 In 1 Active Protect Shampoo', 'head-shoulder-2-in-1-active-protect-shampoo-svX6feIOtQz1XmAOw9vxgyUWn1mujv6VtqcghPmR', '<p>Head &amp; Shoulder 2 In 1 Active Protect Shampoo</p>', NULL, NULL, 480.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(229, 2, 6, NULL, '0339', 'Head & Shoulder Silky Black Shampoo', 'head-shoulder-silky-black-shampoo-y95QQm8PGod58aVvWav6sxerLgBF5E14z2PUa9j6', '<p>Head &amp; Shoulder Silky Black Shampoo</p>', NULL, NULL, 240.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(230, 2, 6, NULL, '0340', 'Dove Beauty Bar White', 'dove-beauty-bar-white-YlePH9MJfhxVzKy3s82szXHvIGl5PFQmzVRaoGUd', '<p>Dove Beauty Bar White</p>', NULL, NULL, 75.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(231, 2, 6, NULL, '0341', 'Dove Beauty Bar White', 'dove-beauty-bar-white-tvRbHnG3kBCODM3fD8MfqKdHsZx0asB8o681d2OD', '<p>Dove Beauty Bar White</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(232, 2, 6, NULL, '0342', 'Dove Beauty Bar Pink', 'dove-beauty-bar-pink-xw8c6wTBfaKpBKhJ2292DbFIHo2LlbXs9EA7UCUV', '<p>Dove Beauty Bar Pink</p>', NULL, NULL, 75.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(233, 2, 6, NULL, '0343', 'Dove Beauty Bar Pink', 'dove-beauty-bar-pink-GAuIYfPS69Cc3m3ZqXjZ58Pk3fJhZc0y9kkmGYDe', '<p>Dove Beauty Bar Pink</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(234, 2, 6, NULL, '0344', 'Dove Shampoo Hairfall Rescue', 'dove-shampoo-hairfall-rescue-04HRUGlcf2aaiHrGLRMoRj6RKkMqv27jtQ4UP2Gr', '<p>Dove Shampoo Hairfall Rescue</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(235, 2, 6, NULL, '0345', 'Dove Shampoo Hairfall Rescue', 'dove-shampoo-hairfall-rescue-DZZF3pbjjb5cQ8Cu9Repyiz7fnBlPY8SaD3lOz1x', '<p>Dove Shampoo Hairfall Rescue</p>', NULL, NULL, 600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(236, 2, 6, NULL, '0346', 'Dove Shampoo Hairfall Rescue', 'dove-shampoo-hairfall-rescue-HO3H8c5E9dIQDh2ascoBXc5bOnh4EaKR7a6Mz7CR', '<p>Dove Shampoo Hairfall Rescue</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(237, 2, 6, NULL, '0347', 'Dove Shampoo Oxygen Moisture', 'dove-shampoo-oxygen-moisture-qMRMZHS8xYMYTIibU2wCYk2xEYqjejHQ9e7NRNbk', '<p>Dove Shampoo Oxygen Moisture</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(238, 2, 6, NULL, '0348', 'Dove Shampoo Environmental Defense', 'dove-shampoo-environmental-defense-aI5sVQoLWQhkoyX4yQXLil1TRyNdmepmz1X3rMFO', '<p>Dove Shampoo Environmental Defense</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(239, 2, 6, NULL, '0349', 'Dove Micellar Water', 'dove-micellar-water-gC4H6aYhtM0e6oSPdYHu5y0oycIGgJjAVXGuSE6x', '<p>Dove Micellar Water&nbsp;</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(240, 2, 6, NULL, '0350', 'Dove Conditioner Hairfall Rescue', 'dove-conditioner-hairfall-rescue-44cIHHMT0v9d01OuOZ3LjBYbOZEfcc55s8BKOgvd', '<p>Dove Conditioner Hairfall Rescue&nbsp;</p>', NULL, NULL, 270.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(241, 2, 6, NULL, '0351', 'Dove Conditioner Intense Repair', 'dove-conditioner-intense-repair-1be1NovJkn5yObZgJcQUrQC9SmM5j2Bnbl04xr01', '<p>Dove Conditioner Intense Repair&nbsp;</p>', NULL, NULL, 270.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(242, 2, 6, NULL, '0352', 'Dove Shampoo Intense Repair', 'dove-shampoo-intense-repair-3AHB9LtxSHFA9aZFmqG0lNxBclIYKKp116rY3NQQ', '<p>Dove Shampoo Intense Repair&nbsp;</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(243, 2, 6, NULL, '0353', 'Dove Shampoo Intense Repair', 'dove-shampoo-intense-repair-Xj3QfP0kg141cv2UwDxPXY25LlsjcXi8uXb1CuBl', '<p>Dove Shampoo Intense Repair&nbsp;</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(244, 2, 6, NULL, '0354', 'Dove Shampoo Nourishing Oil Care', 'dove-shampoo-nourishing-oil-care-52EA7IXnTDbnJF14eRh6zrFjr7CfwHuhsDX5hCaR', '<p>Dove Shampoo Nourishing Oil Care</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(245, 2, 6, NULL, '0355', 'Dove Shampoo Nourishing Oil Care', 'dove-shampoo-nourishing-oil-care-ZgcvUZX1FSj2VTU4q1NpW8mfmUXmp9HxcwxPsGgF', '<p>Dove Shampoo Nourishing Oil Care</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(246, 2, 6, NULL, '0356', 'Dove Face Wash Beauty Moisture Facial Cleanser', 'dove-face-wash-beauty-moisture-facial-cleanser-xghgDi9YQrKdJpKCQgednJIyQ0Gee6x7SlEjDjyK', '<p>Dove Face Wash Beauty Moisture Facial Cleanser</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(247, 2, 6, NULL, '0357', 'Dove Face Wash Beauty Moisture', 'dove-face-wash-beauty-moisture-Ls18lWfedVBhI9FYt9UZuEhRwiu4muJzq3EnfOGl', '<p>Dove Face Wash Beauty Moisture</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(248, 2, 6, NULL, '0358', 'Dove Shampoo Healthy Growth', 'dove-shampoo-healthy-growth-etK4PcUtpTQUtDsAYv8iqujlKeJDo8Od6Vn2DaL7', '<p>Dove Shampoo Healthy Growth</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(249, 2, 6, NULL, '0359', 'Dove Shampoo Healthy Growth', 'dove-shampoo-healthy-growth-q9OIcLC8qsfakjmdsC2JLuQGipk86ML5J9C9UYjS', '<p>Dove Shampoo Healthy Growth</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(250, 2, 6, NULL, '0360', 'Dove Baby Rich Moisture Lotion', 'dove-baby-rich-moisture-lotion-1OkavzzTiMpBQFR9GSMpRlMykEdBbuN1i923EHEg', '<p>Dove Baby Rich Moisture Lotion</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(251, 2, 6, NULL, '0361', 'Dove Beauty Cream', 'dove-beauty-cream-jknnxmg43sWVfRYjFBap21rK7IF8HoQWIGUaW7Lw', '<p>Dove Beauty Cream</p>', NULL, NULL, 195.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(252, 2, 6, NULL, '0362', 'Dove Baby Sensitive Moisture Lotion', 'dove-baby-sensitive-moisture-lotion-Uu6g5fEbMF1o0M6LUj390iccrUV1WNsfrhhvuwy2', '<p>Dove Baby Sensitive Moisture Lotion</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(253, 2, 6, NULL, '0363', 'Dove Go Fresh Roll On', 'dove-go-fresh-roll-on-pZVHlyu7eXEqQ7nJzMjlJ6WrFME9EHPlg7fZcKpV', '<p>Dove Go Fresh Roll-On</p>', NULL, NULL, 220.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(254, 2, 6, NULL, '0364', 'Dove Men Shampoo Thick & Strong', 'dove-men-shampoo-thick-strong-O5jmr1s14z2hwhmFcjvWkQD5rwp7lwbVIGyRCsqe', '<p>Dove Men Shampoo Thick &amp; Strong</p>', NULL, NULL, 520.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(255, 2, 6, NULL, '0365', 'Dove Intensive Body Lotion', 'dove-intensive-body-lotion-tM6fsmPXCIf2OM05eeYSdJY86asj79pREJ7LgUbv', '<p>Dove Intensive Body Lotion</p>', NULL, NULL, 480.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(256, 2, 6, NULL, '0366', 'Dove Caring Cucumber & Green Tea Scent Hand wash', 'dove-caring-cucumber-green-tea-scent-hand-wash-Kl0Zgt2ZZDWzUSMyWWuDfCkMXkUsNTW3seav9Poy', '<p>Dove Caring Cucumber &amp; Green Tea Scent Handwash</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(257, 2, 6, NULL, '0367', 'Dove Caring Cucumber & Green Tea Scent Hand wash', 'dove-caring-cucumber-green-tea-scent-hand-wash-pUBq8Ov1jRlY1rhZpi8ICSWKQpSKt7LZQOPW0rfY', '<p>Dove Caring Cucumber &amp; Green Tea Scent Handwash</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(258, 2, 6, NULL, '0368', 'Dove Caring Fine Silk Hand wash', 'dove-caring-fine-silk-hand-wash-Z0qsXC8N4kjtxL5GHRGZfh9Im9VQLvTopcc8MemV', '<p>Dove Caring Fine Silk Hand wash</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(259, 2, 6, NULL, '0369', 'Dove Intensive Cream', 'dove-intensive-cream-V5NuvO1Uo3TBxqmK20BKOx92TFRhzX8w9MuTzwOA', '<p>Dove Intensive Cream</p>', NULL, NULL, 275.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(260, 2, 6, NULL, '0370', 'Kumarika Long & Black Shampoo', 'kumarika-long-black-shampoo-iMmVmKPpaDb2JwqySMZuM8RVLixrWtn9m87OLbMz', '<p>Kumarika Long &amp; Black Shampoo</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(261, 2, 6, NULL, '0371', 'Kumarika Soft & Shine Shampoo', 'kumarika-soft-shine-shampoo-r6jcPXCih3kxfAlFJijSdVxCEsAwAh7TlKz1t6ra', '<p>Kumarika Soft &amp; Shine Shampoo</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(262, 2, 6, NULL, '0372', 'Kumarika Thick & Strong Shampoo', 'kumarika-thick-strong-shampoo-Jc49cfyS3BmnDAtP93JgxWY3IXZgEReWyYM0dib3', '<p>Kumarika Thick &amp; Strong Shampoo</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(263, 2, 6, NULL, '0373', 'Pantene Lively Clean Shampoo', 'pantene-lively-clean-shampoo-m1zcwn7YBDY85Cx8SBg25uov675x1gEaaWJAGpea', '<p>Pantene Lively Clean Shampoo</p>', NULL, NULL, 370.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(264, 2, 6, NULL, '0374', 'Pantene Long Black Shampoo', 'pantene-long-black-shampoo-zhYMxqp5AHp99aUgWqV1bnPphGHHKpKzaRinxtvR', '<p>Pantene Long Black Shampoo</p>', NULL, NULL, 370.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(265, 2, 6, NULL, '0375', 'Pantene Silky Smooth Care Shampoo', 'pantene-silky-smooth-care-shampoo-mDCJz6qVAt9LccKK1w0na1IcKyxeG5n7XNRqPR08', '<p>Pantene Silky Smooth Care Shampoo</p>', NULL, NULL, 370.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(266, 2, 6, NULL, '0376', 'Clinic Plus Strong & Long Shampoo', 'clinic-plus-strong-long-shampoo-14qcaYxJG0e5EC8Sr2Gw93j2BwXI5UDSPQteegRA', '<p>Clinic Plus Strong &amp; Long Shampoo</p>', NULL, NULL, 260.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(267, 2, 6, NULL, '0377', 'Clinique Shampoo Strong and Long', 'clinique-shampoo-strong-and-long-uEI8Qp5bq8qKbnis3uKe63sq8cFuyQJC9RCM9C1j', '<p>Clinique Shampoo Strong and Long</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(268, 2, 6, NULL, '0378', 'Himalaya Anti Dandruff Shampoo', 'himalaya-anti-dandruff-shampoo-TGtCsx1D6uRl8UQclsMxexAYrBF24zPOOkRTuXEH', '<p>Himalaya Anti Dandruff Shampoo</p>', NULL, NULL, 500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(269, 2, 6, NULL, '0379', 'Xpel Hair Care Banana Conditioner', 'xpel-hair-care-banana-conditioner-9Rsa64oRQkOYqwHXvToneOsbAtdWKs1DuV66EfhG', '<p>Xpel Hair Care Banana Conditioner</p>', NULL, NULL, 500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(270, 2, 6, NULL, '0380', 'Lever Ayush Shampoo Thick & Long Growth Shikakai', 'lever-ayush-shampoo-thick-long-growth-shikakai-s4jGBu35kPdW4P8PPKPrloSgmd7uV8rRbxHFNW5D', '<p>Lever Ayush Shampoo Thick &amp; Long Growth Shikakai</p>', NULL, NULL, 195.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(271, 2, 6, NULL, '0381', 'L\'oreal Elvive Total Repair 5 Shampoo', 'loreal-elvive-total-repair-5-shampoo-4vropDqUdw8IsB8zUsnNO8D6MMFS8PgRU5UO1A6d', '<p>L&#39;oreal Elvive Total Repair 5 Shampoo&nbsp;</p>', NULL, NULL, 570.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(272, 2, 6, NULL, '0382', 'L\'oreal Men Anti Dandruff 2 in 1 (Shampoo + Conditioner)', 'loreal-men-anti-dandruff-2-in-1-shampoo-conditioner-hD4zkq4WHJs0f1MwSSdLORtS73UUCkxty63uMkqS', '<p>L&#39;oreal Men Anti Dandruff 2 in 1 (Shampoo + Conditioner)</p>', NULL, NULL, 640.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(273, 2, 6, NULL, '0383', 'Lux Soap Bar Soft Touch', 'lux-soap-bar-soft-touch-YylQEfIzWj9cSSocoN68xDNfbr2aWMrzSjTFquHZ', '<p>Lux Soap Bar Soft Touch</p>', NULL, NULL, 50.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(274, 2, 6, NULL, '0384', 'Lux Soap Bar Soft Touch', 'lux-soap-bar-soft-touch-OsRMDkDwbQm2dnYPkykGove7Ldmt9rj41M922Lmr', '<p>Lux Soap Bar Soft Touch</p>', NULL, NULL, 25.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(275, 2, 6, NULL, '0385', 'Lux Soap Bar Velvet Touch', 'lux-soap-bar-velvet-touch-vjM5lfYHXpd66x8m9xTa9JQuu2HoHTkcyJuOKRF6', '<p>Lux Soap Bar Velvet Touch</p>', NULL, NULL, 34.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(276, 2, 6, NULL, '0386', 'Lux Soap Bar Velvet Touch', 'lux-soap-bar-velvet-touch-xMgbJoUftczu9kOTsOR6tzprUqwHQurFRFvWNFaa', '<p>Lux Soap Bar Velvet Touch</p>', NULL, NULL, 25.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(277, 2, 6, NULL, '0387', 'Lux Soap Bar Velvet Touch', 'lux-soap-bar-velvet-touch-pYAPP1SnZ8cNAZ2quClTJTgtnIttETxM5Drtl5ks', '<p>Lux Soap Bar Velvet Touch</p>', NULL, NULL, 48.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(278, 2, 6, NULL, '0388', 'Lux Soap Bar Fresh Splash', 'lux-soap-bar-fresh-splash-XxgZHawN3uzK4v5pedKO4JqBAEOqNliiFY5uvEmL', '<p>Lux Soap Bar Fresh Splash</p>', NULL, NULL, 34.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(279, 2, 6, NULL, '0389', 'Lux Soap Bar Hypnotic Rose', 'lux-soap-bar-hypnotic-rose-fxiOrEppeN4Ra9vUBKaUK7n8wvuAqHQsCeneRu3U', '<p>Lux Soap Bar Hypnotic Rose</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(280, 2, 6, NULL, '0390', 'Lux Body Wash White Impress', 'lux-body-wash-white-impress-1Sl1eXfZXCczgn6vMLH2PpyOMPD4jT5jzsxSmlZX', '<p>Lux Body Wash White Impress</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(281, 2, 6, NULL, '0391', 'Lux Soap Bar Sensuous Sandal', 'lux-soap-bar-sensuous-sandal-gGhN2IqEtBQZVCtvYoNimZZXn8joNECt43c1R5m3', '<p>Lux Soap Bar Sensuous Sandal</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(282, 2, 6, NULL, '0392', 'Dove Micellar Water', 'dove-micellar-water-7iYXxOxOJHRZ9a7Q8zYN9Lrtmq1LY6UKwFOpGQxZ', '<p>Dove Micellar Water</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(283, 2, 6, NULL, '0393', 'Lifebuoy Soap Silver Shield Formula 100 gm', 'lifebuoy-soap-silver-shield-formula-100-gm-onYJ06mONJkN7tcyqqtTDOIYOCEcRZ7RcOgIxBWy', '<p>Lifebuoy Soap Silver Shield Formula 100 gm</p>', NULL, NULL, 85.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(284, 2, 6, NULL, '0394', 'Lifebuoy Soap Bar Total', 'lifebuoy-soap-bar-total-Sc0rEw0lQmlH5zpnJDNUJ0THJ3ILodm89qFkMJ2G', '<p>Lifebuoy Soap Bar Total</p>', NULL, NULL, 42.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(285, 2, 6, NULL, '0395', 'Lifebuoy Soap Bar Care', 'lifebuoy-soap-bar-care-1euyZVuwj2rFtdCXLOEqM9jv5d30fnhkWHhzbzzm', '<p>Lifebuoy Soap Bar Care</p>', NULL, NULL, 42.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(286, 2, 6, NULL, '0396', 'Lifebuoy Soap Bar Care', 'lifebuoy-soap-bar-care-2uGkdQCdMShgqXxzilp9ZWEEBf9dMzVbCFuZLPrL', '<p>Lifebuoy Soap Bar Care</p>', NULL, NULL, 30.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(287, 2, 6, NULL, '0397', 'Lifebuoy Soap Bar Neem', 'lifebuoy-soap-bar-neem-wk03ZlRK9Y4RjQ3slRmxl8269ozNfZhMiTbhCrI2', '<p>Lifebuoy Soap Bar Neem</p>', NULL, NULL, 35.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(288, 2, 6, NULL, '0398', 'Lifebuoy Bar Soap Attar Protect', 'lifebuoy-bar-soap-attar-protect-I08ubu14H3BkzFUNDWlJIIrCLEhwDQwB6HFMA2E0', '<p>Lifebuoy Bar Soap Attar Protect</p>', NULL, NULL, 34.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(289, 2, 6, NULL, '0399', 'Dettol Soap Cool Bathing Bar', 'dettol-soap-cool-bathing-bar-MKPsMEV6j8J3wzCIUzxBmw0AAFMR4NbSLPmqrQY0', '<p>Dettol Soap Cool Bathing Bar</p>', NULL, NULL, 38.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(290, 2, 6, NULL, '0400', 'Dettol Soap Original Bathing Bar Soap', 'dettol-soap-original-bathing-bar-soap-ouvaMcoXwpBJiuqSwowGl6ZZRv4hgmLkPqscTVnh', '<p>Dettol Soap Original Bathing Bar Soap</p>', NULL, NULL, 58.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(291, 2, 6, NULL, '0401', 'Dettol Soap Original Bathing Bar Soap', 'dettol-soap-original-bathing-bar-soap-ukjx4dPXhNFdvB1cjb9e3Bk7Q1hdhnNnDH77KCEP', '<p>Dettol Soap Original Bathing Bar Soap</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(292, 2, 6, NULL, '0402', 'Dettol Bathing Bar Soap Skincare', 'dettol-bathing-bar-soap-skincare-G55DIYllCQzGYzXVYSvtfhJ1bjLY6DdLIAEmjS7t', '<p>Dettol Bathing Bar Soap Skincare</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(293, 2, 6, NULL, '0403', 'Nivea Sea Minerals Fresh Shower Gel', 'nivea-sea-minerals-fresh-shower-gel-krs57H5TDG8MkPmzqwlE157PoM9aKCr6B1t2wzpn', '<p>Nivea Sea Minerals Fresh Shower Gel</p>', NULL, NULL, 700.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(294, 2, 6, NULL, '0404', 'Nivea Care & Roses Body Wash', 'nivea-care-roses-body-wash-eWcPc3X1O8lTYdAHlgmIwsDUaVJOKiSIliJBsWJC', '<p>Nivea Care &amp; Roses Body Wash</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(295, 2, 6, NULL, '0405', 'Nivea Care & Coconut Body Wash', 'nivea-care-coconut-body-wash-GPB7wVgHP2QL9xbNmHxgzHLZd8mvyvQ77hRNqz9l', '<p>Nivea Care &amp; Coconut Body Wash</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(296, 2, 6, NULL, '0406', 'Nivea Men Cool Kick Shower Gel', 'nivea-men-cool-kick-shower-gel-L8u9p13AByHGjpjbPrPfiPeHouhrUN2F3Q7v1rHH', '<p>Nivea Men Cool Kick Shower Gel</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(297, 2, 6, NULL, '0407', 'Fresh Start Shower Gel Mint & Cucumber', 'fresh-start-shower-gel-mint-cucumber-Wmg04UmMp5u9fdtSX2u4xyfvjEMN5gI0EOfFXwnN', '<p>Fresh Start Shower Gel Mint &amp; Cucumber</p>', NULL, NULL, 400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(298, 2, 6, NULL, '0408', 'Fresh Start Shower Gel Cococut & Lime', 'fresh-start-shower-gel-cococut-lime-YqxSwizH9R8CJh7vEhzTNvJwNPhcoc2YtPDKMS1Z', '<p>Fresh Start Shower Gel Coconut &amp; Lime</p>', NULL, NULL, 400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(299, 2, 6, NULL, '0409', 'Xpel Fresh Start Shower Gel Tea Tree & Lemon', 'xpel-fresh-start-shower-gel-tea-tree-lemon-2Wviq3JO4wmvglzfYqke5sYdghsrn74NRfQBgf79', '<p>Xpel Fresh Start Shower Gel Tea Tree &amp; Lemon</p>', NULL, NULL, 400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(300, 2, 6, NULL, '0410', 'Meril Milk & Bely Soap', 'meril-milk-bely-soap-d0KvykzAUoZZqdbrgqZ2n22gs0fJ0x5RH77KZJwU', '<p>Meril&nbsp;Milk &amp; Bely Soap</p>', NULL, NULL, 34.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(301, 2, 6, NULL, '0411', 'Meril Milk Soap Bar', 'meril-milk-soap-bar-GpuAb0uKwE0x7qyDEHDtegkp2mRbMXlko0jWOJWL', '<p>Meril Milk Soap Bar</p>', NULL, NULL, 34.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(302, 2, 6, NULL, '0412', 'Meril Milk & Pomegranate Soap', 'meril-milk-pomegranate-soap-WIh8bPTWvDzNbk1dr5igpKYCkiukOkraQUONs94K', '<p>Meril Milk &amp; Pomegranate Soap</p>', NULL, NULL, 34.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(303, 2, 6, NULL, '0413', 'Meril Baby Mild Honey Soap', 'meril-baby-mild-honey-soap-4cGc6YE1mIw144OAQKNeOOMhJ3YtyIeebqZ72vTv', '<p>Meril Baby Mild Honey Soap</p>', NULL, NULL, 45.00, 36.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-26 03:46:26'),
(304, 2, 6, NULL, '0414', 'ACI Savlon Fresh Soap', 'aci-savlon-fresh-soap-iUbRQghn0GRX4RZMTp4cdly5ZnFCnTB8M29WugMW', '<p>ACI Savlon Fresh Soap</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(305, 2, 6, NULL, '0415', 'ACI Savlon Active Antiseptic Soap', 'aci-savlon-active-antiseptic-soap-4guI76uLqIwweN14Kh0tFzUugWiIhl3hxeBonN7y', '<p>ACI Savlon Active Antiseptic Soap</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(306, 2, 6, NULL, '0416', 'ACI Savlon Mild Antiseptic Soap', 'aci-savlon-mild-antiseptic-soap-00ZqgTYTrAH7ESfKGbdh2lkXF5UIUyFnpzcAUuoZ', '<p>ACI Savlon Mild Antiseptic Soap</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(307, 2, 6, NULL, '0417', 'ACI Neem Original Honey & Turmeric Soap', 'aci-neem-original-honey-turmeric-soap-4qWD71hyKEBA897Tti4TyWqt77LdKbPF5M2EnZbx', '<p>ACI Neem Original Honey &amp; Turmeric Soap</p>', NULL, NULL, 42.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(308, 2, 6, NULL, '0418', 'Savlon Sensitive Soap', 'savlon-sensitive-soap-klqctg3Nxkxvdgi4Zrkfa0G0CLwToH8DjToEYhsc', '<p>Savlon Sensitive Soap</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(309, 2, 6, NULL, '0419', 'Savlon Cool Soap', 'savlon-cool-soap-GflKiMuDncwaGjz5DzJYrDUX52mT6WE5yxUswc7U', '<p>Savlon Cool Soap</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(310, 2, 6, NULL, '0420', 'Lever Ayush Soap Bar Natural Fair Saffron', 'lever-ayush-soap-bar-natural-fair-saffron-6aT41GKCx7QWPyVvoEq3fRynSgqybc8LdIA3s8z6', '<p>Lever Ayush Soap Bar Natural Fair Saffron</p>', NULL, NULL, 38.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(311, 2, 6, NULL, '0421', 'Lever Ayush Soap Bar Natural Purifying Turmeric', 'lever-ayush-soap-bar-natural-purifying-turmeric-qPpff2Me7X4DHwywF77P2magHzfazClDk4yA3SH7', '<p>Lever Ayush Soap Bar Natural Purifying Turmeric</p>', NULL, NULL, 38.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(312, 2, 6, NULL, '0422', 'Sandalina Sandal & Rose Soap', 'sandalina-sandal-rose-soap-UaeMsM3veRblA6BOHmldmLxPXGYwD7tZ6IOFIngX', '<p>Sandalina Sandal &amp; Rose Soap</p>', NULL, NULL, 36.00, 20.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:56'),
(313, 2, 6, NULL, '0423', 'Nivea Intensive Moisture Body Milk', 'nivea-intensive-moisture-body-milk-XAnVx3eJE3l6eMl53OmGKAcvaSqP5R74AqR7brZY', '<p>Nivea Intensive Moisture Body Milk</p>', NULL, NULL, 600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(314, 2, 6, NULL, '0424', 'Nivea Soft Crème', 'nivea-soft-creme-qMQPvXOX2BFu9DVXSRIe5usBcZ5wScO4fYpTiB8X', '<p>Nivea Soft Cr&egrave;me</p>', NULL, NULL, 175.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(315, 2, 6, NULL, '0425', 'Nivea Soft Crème', 'nivea-soft-creme-J4yxTqboSH97ogApsEweoWN1X7M0U2v4rmLHQVno', '<p>Nivea Soft Cr&egrave;me</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(316, 2, 6, NULL, '0426', 'Nivea Express Hydration Body Lotion', 'nivea-express-hydration-body-lotion-CS2NTW68zIp5VxS1HdY867hwiJXRFinvejYR0n0V', '<p>Nivea Express Hydration Body Lotion</p>', NULL, NULL, 950.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(317, 2, 6, NULL, '0427', 'Nivea Light Moisturising & Cleansing Lotion', 'nivea-light-moisturising-cleansing-lotion-qSt1QGlFSHv1OB1iIt5bjSiFxt02fUfuhWNQVJlE', '<p>Nivea Light Moisturising &amp; Cleansing Lotion</p>', NULL, NULL, 520.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(318, 2, 6, NULL, '0428', 'Nivea Extra Rich Moisturising Lotion', 'nivea-extra-rich-moisturising-lotion-41YgMM1Pt96s1dOgBuZ7WMnZVSvJhxcAtDms5MjK', '<p>Nivea Extra Rich Moisturising Lotion</p>', NULL, NULL, 520.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(319, 2, 6, NULL, '0429', 'Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf)', 'fair-and-lovely-fairness-cream-advanced-multivitamin-free-scarf-zvIYHsuOShnIMyUlcYzHukfsFrbV8wamajs05sWJ', '<p>Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf)</p>', NULL, NULL, 210.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(320, 2, 6, NULL, '0430', 'Fair And Lovely Fairness Cream Advanced Multivitamin', 'fair-and-lovely-fairness-cream-advanced-multivitamin-gphrFqV3G9iUp4P6f42AvRNhmL4JCZtdId90ftlc', '<p>Fair And Lovely Fairness Cream Advanced Multivitamin</p>', NULL, NULL, 115.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(321, 2, 6, NULL, '0431', 'Fair And Lovely Advanced Multivitamin Body Fairness Milk', 'fair-and-lovely-advanced-multivitamin-body-fairness-milk-D1PSxLxjbEwJooscw5i1WfZb9gIDQBBRAufub70H', '<p>Fair And Lovely Advanced Multivitamin Body Fairness Milk</p>', NULL, NULL, 155.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(322, 2, 6, NULL, '0432', 'Fair And Lovely Face Cream Blemish Balm', 'fair-and-lovely-face-cream-blemish-balm-2r8UXacZmDogqHJE1e4kFW8d7xQWkVWmBJYJ0JLH', '<p>Fair And Lovely Face Cream Blemish Balm</p>', NULL, NULL, 195.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(323, 2, 6, NULL, '0433', 'Fair And Lovely Face Cream Blemish Balm', 'fair-and-lovely-face-cream-blemish-balm-MzuELdz3h6Df2MbwezNUEFOZwoIK8cj8BhgnYixx', '<p>Fair And Lovely Face Cream Blemish Balm</p>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(324, 2, 6, NULL, '0434', 'Fair And Lovely Fairness Cream Ayurvedic Care', 'fair-and-lovely-fairness-cream-ayurvedic-care-OMIp4I2SMEH1VLf7MXf15CUPJdZ8skylQwVyeoyT', '<p>Fair And Lovely Fairness Cream Ayurvedic Care</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(325, 2, 6, NULL, '0435', 'Fair And Lovely Fairness Cream Winter', 'fair-and-lovely-fairness-cream-winter-GPtiRjP1y6sYweDmftODFM4W7tF4iMkn8EgBE1QD', '<p>Fair And Lovely Fairness Cream Winter</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(326, 2, 6, NULL, '0436', 'Fair & Lovely Multivitamin Cream', 'fair-lovely-multivitamin-cream-mzBhjeC0b440O6gxdvhCAuxD23ZfZYClxI2QGYLU', '<p>Fair &amp; Lovely Multivitamin Cream</p>', NULL, NULL, 115.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(327, 2, 6, NULL, '0437', 'Fair And Lovely Advanced Multivitamin Body Fairness Milk', 'fair-and-lovely-advanced-multivitamin-body-fairness-milk-RS6xkggwU0ahP2Kah38omS1vClHJOZjqDOekW1vS', '<p>Fair And Lovely Advanced Multivitamin Body Fairness Milk</p>', NULL, NULL, 210.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(328, 2, 6, NULL, '0438', 'Fair and Lovely Face Cream Blemish Balm', 'fair-and-lovely-face-cream-blemish-balm-NEqbfSKWpNHHy6wc3i1CxEgCI3O4cimD0HRU7vI2', '<p>Fair and Lovely Face Cream Blemish Balm</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(329, 2, 6, NULL, '0439', 'Fair And Lovely Fairness Cream Advanced Multivitamin', 'fair-and-lovely-fairness-cream-advanced-multivitamin-Z36H12obBJK4DL61FGUg8bl8fDtWhSJeG8TlU07E', '<p>Fair And Lovely Fairness Cream Advanced Multivitamin</p>', NULL, NULL, 210.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(330, 2, 6, NULL, '0440', 'Fair And Lovely Fairness Cream Winter', 'fair-and-lovely-fairness-cream-winter-AmEEsVTvfjskaKxeeL6sswGB1RCETeG6kcsdjzIo', '<p>Fair And Lovely Fairness Cream Winter</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(331, 2, 6, NULL, '0441', 'Mens Fair And Lovely Fairness Cream Rapid Action', 'mens-fair-and-lovely-fairness-cream-rapid-action-PlcRYnqUu8y9stf4ZcqVvUtDRUqyPIkt9MBXTNOI', '<p>Men&#39;s Fair And Lovely Fairness Cream Rapid Action</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(332, 2, 6, NULL, '0442', 'Mens Fair And Lovely Fairness Cream Rapid Action', 'mens-fair-and-lovely-fairness-cream-rapid-action-zW88uxX2N7caFYhvadAVETOdsSol4IapDb6qKKpE', '<p>Men&#39;s Fair And Lovely Fairness Cream Rapid Action</p>', NULL, NULL, 70.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(333, 2, 6, NULL, '0443', 'Vaseline Lotion Deep Restore', 'vaseline-lotion-deep-restore-RTnwtMUe5kuul7DQCXcmdOfgkFkXrcOXy3QuXeEi', '<p>Vaseline Lotion Deep Restore</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(334, 2, 6, NULL, '0444', 'Vaseline Lotion Deep Restore', 'vaseline-lotion-deep-restore-Ee5dkn6FHvdBOSoyizGGEG56DJ1alN2lO4xKg6vr', '<p>Vaseline Lotion Deep Restore</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(335, 2, 6, NULL, '0445', 'Vaseline Lotion Deep Restore', 'vaseline-lotion-deep-restore-voiBBt01kuBruNF1SgA2s7rXHQMqGpJPQxKIjbLs', '<p>Vaseline Lotion Deep Restore</p>', NULL, NULL, 260.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(336, 2, 6, NULL, '0446', 'Vaseline Lotion Healthy White', 'vaseline-lotion-healthy-white-RyRDacdIkfOv7hr76pJyxJE3vV00hDyL3MbqyurA', '<p>Vaseline Lotion Healthy White</p>', NULL, NULL, 115.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(337, 2, 6, NULL, '0447', 'Vaseline Lotion Healthy White', 'vaseline-lotion-healthy-white-WkYHOWth8L4CbUbffXNsycmbkXQkbgbedgMMM88D', '<p>Vaseline Lotion Healthy White</p>', NULL, NULL, 190.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(338, 2, 6, NULL, '0448', 'Vaseline Lotion Healthy White', 'vaseline-lotion-healthy-white-RDqdAokAfOgFrKeOdTmmnlvKxlaiaFPmSe5INBvH', '<p>Vaseline Lotion Healthy White</p>', NULL, NULL, 270.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(339, 2, 6, NULL, '0449', 'Vaseline Intensive Care Cocoa Glow Body Lotion', 'vaseline-intensive-care-cocoa-glow-body-lotion-R8dRifnnk3gUTEwnLc2c0NbtReJ6P4YKdKMBtwfb', '<p>Vaseline Intensive Care Cocoa Glow Body Lotion</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(340, 2, 6, NULL, '0450', 'Vaseline Intensive Care Cocoa Radiant Gel Oil', 'vaseline-intensive-care-cocoa-radiant-gel-oil-eRYi5lGMVgaIdriXo6c1XokEXcZHM8bxEyinORsB', '<p>Vaseline Intensive Care Cocoa Radiant Gel Oil</p>', NULL, NULL, 780.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(341, 2, 6, NULL, '0451', 'Woman\'s World Whitening Body Lotion', 'womans-world-whitening-body-lotion-hKFVCMsiyOqfuN74VXhk9BqEwdsv0jUDWJwz4gSX', '<p>Woman&#39;s World Whitening Body Lotion</p>', NULL, NULL, 660.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(342, 2, 6, NULL, '0452', 'Pond\'s Day Cream White Beauty', 'ponds-day-cream-white-beauty-365wwbGTwN2IVGNh3MYgLORQx9ik2iGnY6Oz9Xfr', '<p>Pond&#39;s Day Cream White Beauty</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(343, 2, 6, NULL, '0453', 'Pond\'s Day Cream White Beauty', 'ponds-day-cream-white-beauty-2uUji3HTgiQTzI7F89fyXDHJ3G3Bdo4f3qvRTVJF', '<p>Pond&#39;s Day Cream White Beauty</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(344, 2, 6, NULL, '0454', 'Pond\'s Day Cream White Beauty', 'ponds-day-cream-white-beauty-kaBewzb2q11mrYx71Hk9QJGl9HlZhwWmTVlC7Q2m', '<p>Pond&#39;s Day Cream White Beauty</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(345, 2, 6, NULL, '0455', 'Pond’s Oil Control Vanishing Cream', 'ponds-oil-control-vanishing-cream-f2GbN9Zwv2NnRi9b2jvzIjlIxtytBiSACIdauqTO', '<p>Pond&rsquo;s Oil Control Vanishing Cream</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(346, 2, 6, NULL, '0456', 'Ponds Day Cream Age Miracle', 'ponds-day-cream-age-miracle-84CZhczGT75smUiqrLvnzxV80mHIwE4StIhNiNbH', '<p>Ponds Day Cream Age Miracle</p>', NULL, NULL, 1150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(347, 2, 6, NULL, '0457', 'Cute Winter Moisturising Cream', 'cute-winter-moisturising-cream-tMYqJEMVHAi76p8PhOThRXztvI8sdFdf5OwNPrW6', '<p>Cute Winter Moisturising Cream</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(348, 2, 6, NULL, '0458', 'Cute Vanishing Cream', 'cute-vanishing-cream-ZoZclglkPpKoNlCNYxwd3RQibOfQ48kSs6CAWnIs', '<p>Cute Vanishing Cream</p>', NULL, NULL, 70.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(349, 2, 6, NULL, '0459', 'Cute Beauty Milk Body Lotion', 'cute-beauty-milk-body-lotion-GREjXWcQtG9NGizkYWCigGxb60vOvyxmNAx9QbrF', '<p>Cute Beauty Milk Body Lotion</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(350, 2, 6, NULL, '0460', 'Cute 27 Cold Cream', 'cute-27-cold-cream-yJZAgfqYELzDKhhELG4mlajqZkZ4kmfq22EWYgiM', '<p>Boro Plus Antiseptic Cream</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(351, 2, 6, NULL, '0461', 'Boro Plus Antiseptic Cream', 'boro-plus-antiseptic-cream-zKYWu88fBanYNn7m5h3pBYUGXAERdJsyTdymPNnI', '<p>Boro Plus Antiseptic Cream</p>', NULL, NULL, 75.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(352, 2, 6, NULL, '0462', 'Boro Plus Antiseptic Cream', 'boro-plus-antiseptic-cream-tc1UdVwTwQwayr3iiI15910o5TGoAvqhJfOzLMk3', '<p>Boro Plus Antiseptic Cream</p>', NULL, NULL, 260.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(353, 2, 6, NULL, '0463', 'Boroplus Moisturising Body Lotion Almond', 'boroplus-moisturising-body-lotion-almond-iX6wRCksReYYr3mUapeW3NHSyjPbj4nSeJXEOlGy', '<p>Boroplus Moisturising Body Lotion Almond</p>', NULL, NULL, 275.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(354, 2, 6, NULL, '0464', 'Boroplus Whitening Body Lotion', 'boroplus-whitening-body-lotion-c1Qonnt1zfuUA2a7E4UqyhQ6TPxEh1hhEs9UqkJk', '<p>Boroplus Whitening Body Lotion</p>', NULL, NULL, 330.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(355, 2, 6, NULL, '0465', 'Boro Plus Perfect Tauch Moisturising Cream', 'boro-plus-perfect-tauch-moisturising-cream-KDsnezRPM1h2MLW33rysyjAfGUHBKqR5D6mHdBPM', '<p>Boro Plus Perfect Tauch Moisturising Cream</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(356, 2, 6, NULL, '0466', 'Boroplus Moiturising Lotion Alovera & Millk', 'boroplus-moiturising-lotion-alovera-millk-akBkCsIvAe9yKoUVgdx0zQrf1sPgWr23I8akiPU7', '<p>Boroplus Moiturising Lotion Alovera &amp; Millk</p>', NULL, NULL, 275.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(357, 2, 6, NULL, '0467', 'Oxy Whitening Cream', 'oxy-whitening-cream-AZsVE2FXxvrbxYndgJuOowjWVqisHUtWnMSmftJr', '<p>Oxy Whitening Cream</p>', NULL, NULL, 295.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(358, 2, 6, NULL, '0468', 'Boroline Antiseptic Ayurvedic Cream', 'boroline-antiseptic-ayurvedic-cream-PzM9YbvhNsILtRbqQt00RSEJ47e7k66xx2yZK0x4', '<p>Boroline Antiseptic Ayurvedic Cream</p>', NULL, NULL, 85.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(359, 2, 6, NULL, '0469', 'Himalaya Clear Complex Whitening Day Cream', 'himalaya-clear-complex-whitening-day-cream-EAgzpHgVddHAPDgHeMnyyM1L1YDiIeMVYWv1sfj3', '<p>Himalaya Clear Complex Whitening Day Cream</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(360, 2, 6, NULL, '0470', 'Himalaya Revitalizing Night Cream', 'himalaya-revitalizing-night-cream-rxq0hsdG1aYmateR6KQskbEoUAGjawph3ZInefce', '<p>Himalaya Revitalizing Night Cream</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(361, 2, 6, NULL, '0471', 'Himalaya Anti Wrinkle Cream', 'himalaya-anti-wrinkle-cream-jlyRrtsKhrOqEG3IzF5OGuBSbOqMXUhjqgvfT4X8', '<p>Himalaya Anti Wrinkle Cream</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(362, 2, 6, NULL, '0472', 'Revive Moisturizing Lotion', 'revive-moisturizing-lotion-sR7SknGgARBaU6sZwFetWA9vLNT8kFkGgFOae6W2', '<p>Revive Moisturizing Lotion</p>', NULL, NULL, 170.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(363, 2, 6, NULL, '0473', 'Pond\'s Face Wash Pure White', 'ponds-face-wash-pure-white-5YIfIBzgyBO9E57yhb77tZdoEP6oPpzaoDaTozK9', '<p>Pond&#39;s Face Wash Pure White</p>', NULL, NULL, 220.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(364, 2, 6, NULL, '0474', 'Pond\'s Face Wash White Beauty', 'ponds-face-wash-white-beauty-2gxeP2gAE6sgZgsgTokjIw8mqjbJXs08ErzHCF8n', '<p>Pond&#39;s Face Wash White Beauty</p>', NULL, NULL, 99.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(365, 2, 6, NULL, '0475', 'Pond\'s Face Wash White Beauty', 'ponds-face-wash-white-beauty-OSQC5i0bFsOtTWmRJ7YReBLjvbxtb4QTNQW5vAaA', '<p>Pond&#39;s Face Wash White Beauty</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(366, 2, 6, NULL, '0476', 'Ponds Face Wash Pimple Clear', 'ponds-face-wash-pimple-clear-Sc0W0QIQBbx7tAVgrlsTi3IzqfZ9KdH8Frikd5kt', '<p>Ponds Face Wash Pimple Clear</p>', NULL, NULL, 99.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(367, 2, 6, NULL, '0477', 'Pond\'s Face Wash Daily', 'ponds-face-wash-daily-cxDIqOa9wjo0uyF0vD26wyIVSzqIy88wUPXyekOW', '<p>Pond&#39;s Face Wash Daily</p>', NULL, NULL, 85.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(368, 2, 6, NULL, '0478', 'Ponds Face Wash Scrub', 'ponds-face-wash-scrub-40tvAJKrcC5qAReRFCCHePYCrcptsVcceZCJJ0pZ', '<p>Ponds Face Wash Scrub</p>', NULL, NULL, 155.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(369, 2, 6, NULL, '0479', 'Ponds Men Facewash Lightning Oil Clear', 'ponds-men-facewash-lightning-oil-clear-SU5F19ACGaZeahLNrgp0oqBTz6T9xwUDEafz91d6', '<p>Ponds Men Facewash Lightning Oil Clear</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(370, 2, 6, NULL, '0480', 'Ponds Men Facewash Lightning Oil Clear', 'ponds-men-facewash-lightning-oil-clear-XjggNXclqu4y5Pva8XyPitdM1fKBTO7qywWaJlWy', '<p>Ponds Men Facewash Lightning Oil Clear</p>', NULL, NULL, 225.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(371, 2, 6, NULL, '0481', 'Ponds Face Wash Daily', 'ponds-face-wash-daily-vhbqyZze8IxXQVdZs4jJW6Y14Y78XRMlimxVIzje', '<p>Ponds Face Wash Daily</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(372, 2, 6, NULL, '0483', 'Ponds Men Facewash Energy Charge', 'ponds-men-facewash-energy-charge-pr39WlLvsCsBqeaKCM6hwBCF9Hyu6TlrhrnNG0G2', '<p>Ponds Men Facewash Energy Charge</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(373, 2, 6, NULL, '0484', 'Ponds Men Facewash Energy Charge', 'ponds-men-facewash-energy-charge-FFzgaEmByNf26yIJ5pzeBakl1pvDrRKkEXqvlwHY', '<p>Ponds Men Facewash Energy Charge</p>', NULL, NULL, 225.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(374, 2, 6, NULL, '0485', 'Ponds Men Facewash Acne Solution', 'ponds-men-facewash-acne-solution-nTD1fbKZIFYizrylf9jxnL8UELSQqBQGxLaisjhz', '<p>Ponds Men Facewash Acne Solution</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `subcategory_id`, `product_code`, `name`, `slug`, `product_details`, `short_description`, `specification`, `unit_price`, `discount_price`, `stock_status`, `quantity`, `special_note`, `video_link`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(375, 2, 6, NULL, '0486', 'Ponds Men Facewash Acne Solution', 'ponds-men-facewash-acne-solution-5Gqc0E1wu9VDjpbDA7qtrV3CUklvbF1pWstadwnF', '<p>Ponds Men Facewash Acne Solution</p>', NULL, NULL, 225.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(376, 2, 6, NULL, '0487', 'Ponds Men Facewash Power Clear', 'ponds-men-facewash-power-clear-OT2p2v712eIie4bhwboLt6W2hKb3ItNL35xT7kWi', '<p>Ponds Men Facewash Power Clear</p>', NULL, NULL, 225.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(377, 2, 6, NULL, '0488', 'Clean & Clear Morning Energy Brightening Berry Face Wash', 'clean-clear-morning-energy-brightening-berry-face-wash-RahHBLKgHYbNoN2d9bmEBMjtpKpbvN4UGKE7fx9n', '<p>Clean &amp; Clear Morning Energy Brightening Berry Face Wash</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(378, 2, 6, NULL, '0489', 'Clean & Clear Morning Energy Face Wash Lemon', 'clean-clear-morning-energy-face-wash-lemon-trPvKJRJuIzMpzHFokInMfUjTBwXMqObRDHYQGQG', '<p>Clean &amp; Clear Morning Energy Face Wash Lemon</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(379, 2, 6, NULL, '0490', 'Clean & Clear Morning Energy Face Wash', 'clean-clear-morning-energy-face-wash-F7ULCHjLAJrHE4Q8shnjM0qNL4heUIGbX24YKXEZ', '<p>Clean &amp; Clear Morning Energy Face Wash</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(380, 2, 6, NULL, '0491', 'Clean & Clear Blackhead Daily Scrub Oil Free', 'clean-clear-blackhead-daily-scrub-oil-free-UVcJYtMMQDD3qEddYwVtNleyXmQPB0yNCxborMZA', '<p>Clean &amp; Clear Blackhead Daily Scrub Oil-Free</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(381, 2, 6, NULL, '0492', 'Clean & Clear Blackhead Daily Scrub Oil Free', 'clean-clear-blackhead-daily-scrub-oil-free-HXDIgA9C5KtCT2EJYVGxwLoV05wGWzstlLmtDD34', '<p>Clean &amp; Clear Blackhead Daily Scrub Oil-Free</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(382, 2, 6, NULL, '0493', 'Himalaya Fresh Srart Oil Clear Face Wash Lemon', 'himalaya-fresh-srart-oil-clear-face-wash-lemon-OPlQOLn7oXPOXgNNpzHMtuLFCBR44PzeKLfLA80p', '<p>Himalaya Fresh Start Oil Clear Face Wash Lemon</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(383, 2, 6, NULL, '0494', 'Himalaya Fresh Srart Oil Clear Face Wash Strawberry', 'himalaya-fresh-srart-oil-clear-face-wash-strawberry-nEP8jyyKVzyx8ECXMDCweLEdMBXIaJSi1YXtdMty', '<p>Himalaya Fresh Start Oil Clear Face Wash Strawberry</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(384, 2, 6, NULL, '0495', 'Himalaya Fresh Start Oil Clear Face Wash Peach', 'himalaya-fresh-start-oil-clear-face-wash-peach-PrHTL0Lz1iwHvaxrINT64g3nvFwEFCLTKYKmTa28', '<p>Himalaya Fresh Start Oil Clear Face Wash Peach</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(385, 2, 6, NULL, '0496', 'Lever Ayush Face Wash Natural Fairness Saffron', 'lever-ayush-face-wash-natural-fairness-saffron-RSpE8wFJReTH3c1CgvA4Wp9e9pTINqUMGKMzR5pU', '<p>Lever Ayush Face Wash Natural Fairness Saffron</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(386, 2, 6, NULL, '0497', 'Lever Ayush Face wash Anti Pimple Turmeric', 'lever-ayush-face-wash-anti-pimple-turmeric-9ZTqX9okux9rwWNTPx2aZvmQ9Ifqjo7Sbu0KYXP1', '<p>Lever Ayush Face wash Anti Pimple Turmeric</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(387, 2, 6, NULL, '0498', 'Lever Ayush Face wash Anti Pimple Turmeric', 'lever-ayush-face-wash-anti-pimple-turmeric-KJkI2gSV6Rk5I3Ptpc7dS58Z5F9VOeP4C30Gwcs4', '<p>Lever Ayush Face wash Anti Pimple Turmeric</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(388, 2, 6, NULL, '0499', 'Lever Ayush Face Cream Anti Marks Turmeric', 'lever-ayush-face-cream-anti-marks-turmeric-U5nl6aaOBoCl7V60hIYHLve2Ow8bG2q6BunTi1yi', '<p>Lever Ayush Face Cream Anti Marks Turmeric</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(389, 2, 6, NULL, '0500', 'Lever Ayush Face Cream Anti Marks Turmeric', 'lever-ayush-face-cream-anti-marks-turmeric-lucspXgPJwxARw2WHzYf3CY1DqLvVgtjFcng8q9x', '<p>Lever Ayush Face Cream Anti Marks Turmeric</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(390, 2, 6, NULL, '0501', 'Fair And Lovely Face Wash InstaGlow', 'fair-and-lovely-face-wash-instaglow-WaTPqEhWfMxG0JDkskns5lIm0dvUMvV0mI2QTLl2', '<p>Fair And Lovely Face Wash InstaGlow</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(391, 2, 6, NULL, '0502', 'Fair And Lovely Face Wash InstaGlow', 'fair-and-lovely-face-wash-instaglow-tf0gJEcKFXvCDMhUmlgF1LhcQn4nCWZTjVOC9iBD', '<p>Fair And Lovely Face Wash InstaGlow</p>', NULL, NULL, 75.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(392, 2, 6, NULL, '0503', 'Mens Fair And Lovely Face Wash Rapid Action', 'mens-fair-and-lovely-face-wash-rapid-action-UqGXQBiajpqY3SDpxoWJd86u0f0LDtWzU7tOtta8', '<p>Men&#39;s Fair And Lovely Face Wash Rapid Action</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(393, 2, 6, NULL, '0504', 'Mens Fair And Lovely Face Wash Rapid Action', 'mens-fair-and-lovely-face-wash-rapid-action-xbVBqDR7VL958i1lHiYGsZoCnp2ajN4anB0dFuyq', '<p>Mens Fair And Lovely Face Wash Rapid Action</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(394, 2, 6, NULL, '0505', 'Fair And Lovely Face Wash Ayurvedic', 'fair-and-lovely-face-wash-ayurvedic-HngkUMJXveO2FXamyQ0T9XjNS0mg8olTnBQLqgcx', '<p>Fair And Lovely Face Wash Ayurvedic</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(395, 2, 6, NULL, '0506', 'Emami Fair And Handsome Fairness Cream', 'emami-fair-and-handsome-fairness-cream-Z4UWeqBeP8MTyjEkaM6Uqq61vg3tWH01wxGGhhkF', '<p>Emami Fair And Handsome Fairness Cream</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(396, 2, 6, NULL, '0507', 'Emami Naturally Fair Face Wash', 'emami-naturally-fair-face-wash-BgXWfTqyVPi5EqKjxUux5KpzNWOIN7USYC6YDfEv', '<p>Emami Naturally Fair Face Wash</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(397, 2, 6, NULL, '0508', 'Emami Naturally Fair Face cream', 'emami-naturally-fair-face-cream-wSr875OKKYCoQB1I139no9ASl6ajhRs6JZ2fqAS9', '<p>Emami Naturally Fair Face cream</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(398, 2, 6, NULL, '0509', 'Nivea Men 48h Cool Kick Deodorent', 'nivea-men-48h-cool-kick-deodorent-BztbZjGxfO2KZHK56BVXN1m8TfZRmhO73P29JGlt', '<p>Nivea Men 48h Cool Kick Deodorant</p>', NULL, NULL, 280.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(399, 2, 6, NULL, '0510', 'Nivea Men 48h Fresh Active Deodorent', 'nivea-men-48h-fresh-active-deodorent-Ax72ZDVF1NVXVrfOLAlkqrzmGXDLxMre6tTG0lLD', '<p>Nivea Men 48h Fresh Active Deodorant</p>', NULL, NULL, 280.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(400, 2, 6, NULL, '0511', 'Nivea Pearl & Beauty 48h Deodorent', 'nivea-pearl-beauty-48h-deodorent-LQzMo4uB3JTYidm8dMImJIOgzrTTNW9x9cAyhLm5', '<p>Nivea Pearl &amp; Beauty 48h Deodorant</p>', NULL, NULL, 280.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:25'),
(401, 3, 6, NULL, '0512', 'Nivea Men Ice Cool Body Deodorizer', 'nivea-men-ice-cool-body-deodorizer-IvDYObLfkJ4iD0YO3P0N2pRGc7zgcN6wx2drf51f', '<p>Nivea Men Ice Cool Body Deodorizer</p>', NULL, NULL, 400.00, 0.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-10-05 08:58:32'),
(402, 3, 6, NULL, '0513', 'Axe Body Perfume Signature Intense Body Perfume', 'axe-body-perfume-signature-intense-body-perfume-KSa6Vdkj9QowXbZpF4ciOGVqsMUlYusRAirgocTb', '<p>Axe Body Perfume Signature Intense Body Perfume</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 2, 1, NULL, '2021-10-31 09:48:02'),
(403, 3, 6, NULL, '0514', 'Axe Body Perfume Signature Suave Body Perfume', 'axe-body-perfume-signature-suave-body-perfume-PaxFQj4qUAv3Hpt98eYb9PQAAmsKYAjAM1rY2aRZ', '<p>Axe Body Perfume Signature Suave Body Perfume</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(404, 3, 6, NULL, '0515', 'Axe Deodorant Dark Temptation', 'axe-deodorant-dark-temptation-ceRk9CFoDPRXFYx8De7quQRmWcmTKizvvSZIheId', '<p>Axe Deodorant Dark Temptation</p>', NULL, NULL, 225.00, 0.00, 1, 100, NULL, NULL, 3, 1, NULL, '2021-11-07 04:25:00'),
(405, 3, 6, NULL, '0516', 'Axe Body Perfume Signature Mysterious Body Perfume', 'axe-body-perfume-signature-mysterious-body-perfume-0VqiV0nvuG6NqQem8i7NyjUu75R4LUlBh3wJfh08', '<p>Axe Body Perfume Signature Mysterious Body Perfume</p>', NULL, NULL, 380.00, 0.00, 1, 100, NULL, NULL, 2, 1, NULL, '2021-12-15 05:49:17'),
(406, 3, 6, NULL, '0517', 'Set Wet Go Man Pocket Perfume Rockstar', 'set-wet-go-man-pocket-perfume-rockstar-XycSVFh17xqh5M5LfMw6EkRdqf1COABhed9eg6qW', '<p>Set Wet Go Man Pocket Perfume Rockstar</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(407, 3, 6, NULL, '0518', 'Set Wet Go Man Pocket Perfume Aviator', 'set-wet-go-man-pocket-perfume-aviator-dK7BB3ocQt4YHcLQq9LNqLCbuyY5saUTYW8LjPyM', '<p>Set Wet Go Man Pocket Perfume Aviator</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-09-25 10:32:27'),
(408, 3, 6, NULL, '0519', 'Set Wet Body Spray Deodorant Perfume Cool Avatar', 'set-wet-body-spray-deodorant-perfume-cool-avatar-aTATbKYaN4dIlPEsDJGqNSXWUzd8jV7gpwedegl6', '<p>Set Wet Body Spray Deodorant Perfume Cool Avatar</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-10-31 09:44:31'),
(409, 3, 6, NULL, '0520', 'Set Wet Body Spray Deodorant Perfume Swag Avatar', 'set-wet-body-spray-deodorant-perfume-swag-avatar-CetsWs3MkluwHgGbIGFAEeUtieplqU3ohJYA3ufB', '<p>Set Wet Body Spray Deodorant Perfume Swag Avatar</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(410, 3, 6, NULL, '0521', 'Set Wet Hair Styling Gel for Men Value Pack (Wet Look)', 'set-wet-hair-styling-gel-for-men-value-pack-wet-look-CLD7PR42zxg6MKG4obeB9ToM3iZ4ykcng9B2kJ38', '<p>Set Wet Hair Styling Gel for Men Value Pack (Wet Look)</p>', NULL, NULL, 280.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(411, 3, 6, NULL, '0522', 'Set Wet Hair Styling Gel for Men Value Pack (Wet Look)', 'set-wet-hair-styling-gel-for-men-value-pack-wet-look-YGcZRoXI3EUUDTeYOhjakjlBZr9PZrTG5gAokflo', '<p>Set Wet Hair Styling Gel for Men Value Pack (Wet Look)</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-12-26 17:26:44'),
(412, 3, 6, NULL, '0523', 'X-Men Perfume Body Spray Gas Free Impact', 'x-men-perfume-body-spray-gas-free-impact-srq2lB33Y9ABooMmSkuGDdjQGnXcc4e9O4jRgunA', '<p>X-Men Perfumed Body Spray Gas Free Impact</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(413, 3, 6, NULL, '0524', 'X-Men Perfume Body Spray Gas Free Focus', 'x-men-perfume-body-spray-gas-free-focus-PSRBCOnkeTJtbqtepn9jX5t4rUreJop5yjgpvTIH', '<p>X-Men Perfumed Body Spray Gas Free Focus</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(414, 3, 6, NULL, '0525', 'X-Men For Boss Perfume Premium Deo Spray Motion', 'x-men-for-boss-perfume-premium-deo-spray-motion-XkBTkPFd975BnLQCpoayiZWg7HZQPp9SE1LZqYwK', '<p>X-Men For Boss Perfume Premium Deo Spray Motion</p>', NULL, NULL, 320.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(415, 3, 6, NULL, '0526', 'X-Men for Boss EDT Perfume Luxury', 'x-men-for-boss-edt-perfume-luxury-lHROLtF8mRFNtqkuT7jOOl2WR2jTRs5cNgdeIZw1', '<p>X-Men for Boss EDT Perfume Luxury</p>', NULL, NULL, 850.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(416, 3, 6, NULL, '0527', 'Fogg Body Spray Marco', 'fogg-body-spray-marco-ePtxO0P1exgDUbLMG5u7nh2VnLkHoGiHNXRj8HNf', '<p>Fogg Body Spray Marco</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(417, 3, 6, NULL, '0528', 'Fogg Body Spray Paradise', 'fogg-body-spray-paradise-xbob8qiEX9XMPStQIYTdWLNNdE1Dh2SngalQikgb', '<p>Fogg Body Spray Paradise</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(418, 3, 6, NULL, '0529', 'Fogg Body spray Victor', 'fogg-body-spray-victor-YtXwdZhsAlmBGiW0JAePzcAZwu2SqFUcLJecQkTI', '<p>Fogg Body spray Victor</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(419, 3, 6, NULL, '0530', 'Fogg Body Spray Napoleon', 'fogg-body-spray-napoleon-dDFLJcEgsecbU4uy32MyNnLAcEBv6EnaxnJvT51o', '<p>Fogg Body Spray Napoleon</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(420, 3, 6, NULL, '0531', 'Fogg Body spray Blue Ocean', 'fogg-body-spray-blue-ocean-cW4YrmLlCFWi8wXvu6aK08op7cC8HcjBIbQZhtuN', '<p>Fogg Body spray Blue Ocean</p>', NULL, NULL, 435.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(421, 3, 6, NULL, '0532', 'Fogg Fresh Spicy Body Spray', 'fogg-fresh-spicy-body-spray-sMEDi9pbdK2sL4LM4BN8vMiNzpRpt5BCGiDbQcEZ', '<p>Fogg Fresh Spicy Body Spray</p>', NULL, NULL, 385.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(422, 3, 6, NULL, '0533', 'Fogg Scent Men Impressio', 'fogg-scent-men-impressio-CnnW6gXbr1jp5v3jC1kx5EqqL9WfGmqJsMEe14Dv', '<p>Fogg Scent Men Impressio</p>', NULL, NULL, 815.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(423, 3, 6, NULL, '0534', 'Fogg Blue Forest Body Spray', 'fogg-blue-forest-body-spray-vdQI2ZcBOlvOhInQT5rAD5qunru9JdTHBfVNLVHO', '<p>Fogg Blue Forest Body Spray</p>', NULL, NULL, 435.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(424, 3, 6, NULL, '0535', 'Fogg Fresh Aqua Body Spray', 'fogg-fresh-aqua-body-spray-gg3uoxt7RLfE3sNkQGn2JK3b88ssmudM7h2cHIVR', '<p>Fogg Fresh Aqua Body Spray</p>', NULL, NULL, 385.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(425, 3, 6, NULL, '0536', 'Denim Aqua Body Spray', 'denim-aqua-body-spray-hSHW9aQjmBvXB4sVH2Ge3OXEOOWluEJhjrVzb3Wy', '<p>Denim Aqua Body Spray</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(426, 3, 6, NULL, '0537', 'Denim Musk Body Spray', 'denim-musk-body-spray-WJF2qPGrP0h01aWjUXikFMRr4MywJeg0qe3Gl3g4', '<p>Denim Musk Body Spray</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(427, 3, 6, NULL, '0538', 'Denim Black Body Spray', 'denim-black-body-spray-ngrl4P3dbltzH12k3sVabU7HxliAWHrjK6uIYapx', '<p>Denim Black Body Spray</p>', NULL, NULL, 260.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(428, 3, 6, NULL, '0539', 'Havoc Gold Deodorant Spray', 'havoc-gold-deodorant-spray-6IuDME4QXFKr5jBsCkzsrnLCT0Kus5SWbAZIs5kH', '<p>Havoc Gold Deodorant Spray</p>', NULL, NULL, 290.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(429, 3, 6, NULL, '0540', 'Havoc Deodorant Spray', 'havoc-deodorant-spray-uysRMhWqSly8lhmtAiM8kDhVMyqNzZEPpgV5N6sc', '<p>Havoc Deodorant Spray</p>', NULL, NULL, 290.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(430, 3, 6, NULL, '0541', 'Dove Go Fresh Roll On', 'dove-go-fresh-roll-on-0rrGuhZ7LlOvvYZ1avfL57Vvy7fFTiBgn5P6gy5x', '<p>Dove Go Fresh Roll-On</p>', NULL, NULL, 220.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(431, 3, 6, NULL, '0542', 'Yardley English Rose Deodorant Roll On', 'yardley-english-rose-deodorant-roll-on-0sfDXjQ4MmjEGOoEhk8vdyOZCUG0CjRZkGkkjNCc', '<p>Yardley English Rose Deodorant Roll On</p>', NULL, NULL, 195.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(432, 3, 6, NULL, '0543', 'Adidas Pure Game Body Spray', 'adidas-pure-game-body-spray-Ye87545Y3acxlsfBLKQgkPx2F6LAnc2qe0hVXucz', '<p>Adidas Pure Game Body Spray</p>', NULL, NULL, 270.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(433, 3, 6, NULL, '0544', 'Adidas Ice Dive Body Spray', 'adidas-ice-dive-body-spray-0EAePWCzthZP1zkcnBvaQ7oHX5IVdAySqmZmQAYK', '<p>Adidas Ice Dive Body Spray</p>', NULL, NULL, 270.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(434, 3, 6, NULL, '0545', 'Adidas Intense Touch Body Spray', 'adidas-intense-touch-body-spray-DIzdVTr6TvfJELu88jDwzVVLZfzBTb61YUss5qNR', '<p>Adidas Intense Touch Body Spray</p>', NULL, NULL, 270.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(435, 3, 6, NULL, '0546', 'Adidas Victory League', 'adidas-victory-league-WoVrOa3FG4mNGDYsVBpXiG62jUzbh0rHgBJ5zvcc', '<p>Adidas Victory League</p>', NULL, NULL, 260.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(436, 3, 6, NULL, '0547', 'Wild Stone Body Perfume Steel', 'wild-stone-body-perfume-steel-tdvm7wjWrKHf4MMHtsb6EGnJlSlUH4yuSdwaAeHm', '<p>Wild Stone Body Perfume Steel</p>', NULL, NULL, 395.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(437, 3, 6, NULL, '0548', 'Wild Stone Hydra Energy Body Spray', 'wild-stone-hydra-energy-body-spray-o5kUnSNRvM1NhXYBcJLlr8ezJNVlZTiftNfYTayZ', '<p>Wild Stone Hydra Energy Body Spray</p>', NULL, NULL, 290.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(438, 3, 6, NULL, '0549', 'Wild Stone Legend Body Deodorant', 'wild-stone-legend-body-deodorant-gURJOs1kz23q0w91Ky8EE2V8yPMA82KyrrJP2FW0', '<p>Wild Stone Legend Body Deodorant</p>', NULL, NULL, 290.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(439, 3, 6, NULL, '0550', 'Wild Stone Body Perfume Titanium', 'wild-stone-body-perfume-titanium-KspUP16OulvoRafuwpDdDdjye13fPK40z1NSaNr9', '<p>Wild Stone Body Perfume Titanium</p>', NULL, NULL, 395.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(440, 3, 6, NULL, '0551', 'Wild Stone Forest Spice Deodorant', 'wild-stone-forest-spice-deodorant-i5q5ZwMROyhNKofByiOlphWKDibsKX198VNHbH7B', '<p>Wild Stone Forest Spice Deodorant</p>', NULL, NULL, 290.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(441, 3, 6, NULL, '0552', 'Engage On Man Pocket Perfume (Classic Woody)', 'engage-on-man-pocket-perfume-classic-woody-xes4Y5LckXCAH0FHrO0Jz5Wmlkn3mvfnUAPi0PhG', '<p>Engage On Man Pocket Perfume (Classic Woody)</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(442, 3, 6, NULL, '0553', 'Engage On Man Pocket Perfume (Cool Marine)', 'engage-on-man-pocket-perfume-cool-marine-1UGzhOrRk94fjZfPGfwiS7t7ATeU0HLjvvyPjx5e', '<p>Engage On Man Pocket Perfume (Cool Marine)</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(443, 3, 6, NULL, '0554', 'Engage Woman Body Spray', 'engage-woman-body-spray-oKcY00f7u7PHofXZ7U7JetEQZi34y1PAkn3CvELl', '<p>Engage Woman Body Spray</p>', NULL, NULL, 260.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(444, 3, 6, NULL, '0555', 'Layer Shot Bullet Burst', 'layer-shot-bullet-burst-Zn3zJsnNX8ptdkZ4hUbRDoBuu2g2HgKZED4q90dh', '<p>Layer Shot Bullet Burst</p>', NULL, NULL, 320.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(445, 3, 6, NULL, '0556', 'Ossum Perfumed Body Mist Delight', 'ossum-perfumed-body-mist-delight-6kcKTARUh76BP4OivRauMTOwkvQMcT2lXq5MojE9', '<p>Ossum Perfumed Body Mist Delight</p>', NULL, NULL, 345.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(446, 3, 6, NULL, '0557', 'B8 Whisper Choice Ultra 6 pads', 'b8-whisper-choice-ultra-6-pads-cc6KZzeARqP1drPjtLrZpnUGgt390VXSQMnKsNUS', '<p>B8 Whisper Choice Ultra 6 pads</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(447, 3, 6, NULL, '0558', 'B3 Whisper Maxi Nights Xl Wings 15 Pads', 'b3-whisper-maxi-nights-xl-wings-15-pads-meFLAyYuRidpxJXXNXNWDfDN7h5jGnQUOzXJkstI', '<p>B3 Whisper Maxi Nights Xl Wings 15 Pads</p>', NULL, NULL, 253.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(448, 3, 6, NULL, '0559', 'B6 Whisper Ultra Clean XL Wings 15 Pads', 'b6-whisper-ultra-clean-xl-wings-15-pads-xnUBmIILC5n2NIo6ugk5e5XpWsynmKzWWP5Cv1yG', '<p>B6 Whisper Ultra Clean XL Wings 15 Pads</p>', NULL, NULL, 253.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(449, 3, 6, NULL, '0560', 'B7 Whisper Choice Wings 7 Pads', 'b7-whisper-choice-wings-7-pads-Jdj11E54jE7e38FtWbk96Ktt8nP3PHU6MnyQbRPV', '<p>B7 Whisper Choice Wings 7 Pads</p>', NULL, NULL, 75.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(450, 3, 6, NULL, '0561', 'B4 Whisper Maxi Nights XL Wings 7 Pads', 'b4-whisper-maxi-nights-xl-wings-7-pads-xv2nvZv262wTr55s7Zx21McEKuQh6ss3ktwByqF7', '<p>B4 Whisper Maxi Nights XL Wings 7 Pads</p>', NULL, NULL, 133.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(451, 3, 6, NULL, '0562', 'B5 Whisper Ultra 8 Pads', 'b5-whisper-ultra-8-pads-ow764upMFlODVukZiW9quhAtFCTBbRLcD3iaqZKo', '<p>B5 Whisper Ultra 8 Pads</p>', NULL, NULL, 141.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(452, 3, 6, NULL, '0563', 'B1 Whisper Maxi Fit 15 Pads', 'b1-whisper-maxi-fit-15-pads-z4GY823Cf7MIVzCTE0kv92C82H92qcbE9Pcum1pf', '<p>B1 Whisper Maxi Fit 15 Pads</p>', NULL, NULL, 253.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(453, 3, 6, NULL, '0564', 'B2 Whisper Maxi Fit 8 Pads', 'b2-whisper-maxi-fit-8-pads-bCiGvvYExn7rFsKwEdibqDI5MEg2cTD2fPGONXAi', '<p>B2 Whisper Maxi Fit 8 Pads</p>', NULL, NULL, 133.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(454, 3, 6, NULL, '0565', 'AF4 Whisper Ultra Clean XL Wings 8 Pads', 'af4-whisper-ultra-clean-xl-wings-8-pads-VoPesxuH1vdxfIXY8SN5DNKhjJPbXEDnz6heSJSZ', '<p>AF4 Whisper Ultra Clean XL Wings 8 Pads</p>', NULL, NULL, 141.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(455, 3, 6, NULL, '0566', 'C4 Senora Sanitary Napkin (Panty) 15 pcs', 'c4-senora-sanitary-napkin-panty-15-pcs-ZRma1LJrPkQK1FQzbceWxm0E6XSiXZd5PmtJkvRy', '<p>C4 Senora Sanitary Napkin (Panty) 15 pcs</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(456, 3, 6, NULL, '0567', 'C8 Senora Confidence Regular Flow (Panty System) 16 pcs', 'c8-senora-confidence-regular-flow-panty-system-16-pcs-HkECJHOLhJZacxTKfCVSMxDV9yztVOTbXuPmCz4n', '<p>C8 Senora Confidence Regular Flow (Panty System) 16 pcs</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(457, 3, 6, NULL, '0568', 'C5 Senora Sanitary Napkin (Belt 15 pcs', 'c5-senora-sanitary-napkin-belt-15-pcs-AQaIdnxmcKylqUZMAw7i1QgX7SrT8Bie5xzhOjok', '<p>C5 Senora Sanitary Napkin (Belt 15 pcs</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(458, 3, 6, NULL, '0569', 'C3 Senora Sanitary Napkin Regular Flow (Belt) 10 pcs', 'c3-senora-sanitary-napkin-regular-flow-belt-10-pcs-bx2oC5zkLCL5yaQl28fHMu3RGAKRuIlUYQLa6tUu', '<p>C3 Senora Sanitary Napkin Regular Flow (Belt) 10 pcs</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(459, 3, 6, NULL, '0570', 'C9 Senora Confidence Regular Flow (Panty System) 10 pcs', 'c9-senora-confidence-regular-flow-panty-system-10-pcs-Khwjhm4EdJxcwUKZBaSTQu9XlDYJlLKnWLIsKwz8', '<p>C9 Senora Confidence Regular Flow (Panty System) 10 pcs</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(460, 3, 6, NULL, '0571', 'C2 Senora Sanitary Napkin Regular Flow (Panty) 10 pcs', 'c2-senora-sanitary-napkin-regular-flow-panty-10-pcs-rDTEh8exsXNeWDpwPiicsJ5vJRkw9MflIPEyauCM', '<p>C2 Senora Sanitary Napkin Regular Flow (Panty) 10 pcs</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(461, 3, 6, NULL, '0572', 'C1 Senora Ultra-thin Heavy Flow 8 pcs', 'c1-senora-ultra-thin-heavy-flow-8-pcs-Z5oxUdCkTVCTHJwCuOiushQqGD64NtxPbs5ZRW7k', '<p>C1 Senora Ultra-thin Heavy Flow 8 pcs</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(462, 3, 6, NULL, '0573', 'A8 ACI Freedom Heavy Flow Wings 16 Pads', 'a8-aci-freedom-heavy-flow-wings-16-pads-BJVm8SliOJniuXsqokfkbXTswhEIZdqw3iKkA87r', '<p>A8 ACI Freedom Heavy Flow Wings 16 Pads</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(463, 3, 6, NULL, '0574', 'A10 ACI Freedom Heavy Flow Sanitary Napkin 8 Pads', 'a10-aci-freedom-heavy-flow-sanitary-napkin-8-pads-7MVEOWMhgS5pKJ597REDZWPD6NUJq7WeW1BObehP', '<p>A10 ACI Freedom Heavy Flow Sanitary Napkin 8 Pads</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(464, 3, 6, NULL, '0575', 'Freedom Pregnancy Test 1 Strip', 'freedom-pregnancy-test-1-strip-dylmdygfoK2FMekEFdubiFEni8SJViwePUZJQ3Xw', '<p>Freedom Pregnancy Test 1 Strip</p>', NULL, NULL, 18.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(465, 3, 6, NULL, '0576', 'A6 ACI Freedom Regular Flow Non-Wing Popular 8 pads', 'a6-aci-freedom-regular-flow-non-wing-popular-8-pads-j3dmLeEYc1yjyBdqmXmmxDGPoJzM1pD1QQZEFdTU', '<p>A6 ACI Freedom Regular Flow Non-Wing Popular 8 pads</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(466, 3, 6, NULL, '0577', 'Freedom Pregnancy Test Tool Set', 'freedom-pregnancy-test-tool-set-fhe3iR1KbpKz9vCexwCMouWEwXxlnB80QEKIaasC', '<p>Freedom Pregnancy Test Tool Set</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(467, 3, 6, NULL, '0578', 'Gillette Venus Woman Razor (Buy 1 Get 1 Offer)', 'gillette-venus-woman-razor-buy-1-get-1-offer-Fw9CnnNKDkLuBoUWxYjcTawTe5XyvAxd3cGpltjH', '<p>Gillette Venus Woman Razor (Buy 1 Get 1 Offer)</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(468, 3, 6, NULL, '0579', 'A3 ACI Freedom Regular Flow Wings 10 pads', 'a3-aci-freedom-regular-flow-wings-10-pads-LxRPnsMgo45SMcQT6XSw4q6MUHsPxIQPgRaMgquF', '<p>A3 ACI Freedom Regular Flow Wings 10 pads</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(469, 3, 6, NULL, '0580', 'A14 Freedom Teens Ultra Chic Soft Sanitary Napkin', 'a14-freedom-teens-ultra-chic-soft-sanitary-napkin-GX8s72pUE0ch9zf7Hp7eiEVmDRQkiPcHLCaAekJb', '<p>A14 Freedom Teens Ultra Chic Soft Sanitary Napkin</p>', NULL, NULL, 55.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(470, 3, 6, NULL, '0581', 'A4 ACI Freedom Regular Flow Panty 15 pads', 'a4-aci-freedom-regular-flow-panty-15-pads-qE9Ay8DiGP1n3qYG42Nat8GPXVsbDEXpcLC1CaWD', '<p>A4 ACI Freedom Regular Flow Panty 15 pads</p>', NULL, NULL, 115.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(471, 3, 6, NULL, '0582', 'A11 ACI Savlon Freedom Regular Flow Belt System 15 pads', 'a11-aci-savlon-freedom-regular-flow-belt-system-15-pads-sJbSrwTIrvdDvUCdzy9gvXKHQt478z4sspshnhZj', '<p>A11 ACI Savlon Freedom Regular Flow Belt System 15 pads</p>', NULL, NULL, 115.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(472, 3, 6, NULL, '0583', 'A7 ACI Freedom Regular Flow Belt 10 pads', 'a7-aci-freedom-regular-flow-belt-10-pads-g8AsocTDtqNO2iQ6qrRIr1BLOzHxkspRNWfSDTfD', '<p>A7 ACI Freedom Regular Flow Belt 10 pads</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(473, 3, 6, NULL, '0584', 'complan creamy classic plain Bib', 'complan-creamy-classic-plain-bib-68x3pWukZdTne9CVWUkDUOMQVtZ6DUo26NpxUqfB', '<p>complan creamy classic plain Bib</p>', NULL, NULL, 360.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(474, 3, 6, NULL, '0585', 'Complan Chocholate', 'complan-chocholate-UwIJoAIyyCXnNHDx8ayWc7jq6a66sbtRC36sLicH', '<p>Complan Chocholate</p>', NULL, NULL, 540.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(475, 3, 6, NULL, '0586', 'Complan Chocholate', 'complan-chocholate-f6mUgcDgx6tt1OE2v309iKKWhP7t7bDNMujbem28', '<p>Complan Chocholate</p>', NULL, NULL, 385.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(476, 3, 6, NULL, '0587', 'Complan Chocholate', 'complan-chocholate-wwxbiTr0HWDUUQr83ezG5oTmilpc4fLBulYwrKzi', '<p>Complan Chocholate</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(477, 3, 6, NULL, '0588', 'ovaltine malted chocolate drink jar', 'ovaltine-malted-chocolate-drink-jar-RQ20JXYpsbhG0bqKw7lCrZ8RHqTtebvYpEPN13t9', '<p>ovaltine malted chocolate drink jar</p>', NULL, NULL, 325.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(478, 3, 6, NULL, '0589', 'Horlicks jar', 'horlicks-jar-t6HE00hagUD6SQ4FebD8MwHre4K5VtB4g2vZtKdm', '<p>Horlicks jar</p>', NULL, NULL, 395.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(479, 3, 6, NULL, '0590', 'chokholate Horlicks jar', 'chokholate-horlicks-jar-f4KURtZQNaQExyZrlXpF0DCL4zAKjINzcPc0cvVl', '<p>chokholate Horlicks jar</p>', NULL, NULL, 395.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(480, 3, 6, NULL, '0591', 'womens Horlicks jar', 'womens-horlicks-jar-wck0tdLLxZnwmJVPspIDlXMxRZZm5KMc2H3hquzg', '<p>womens Horlicks jar</p>', NULL, NULL, 480.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(481, 3, 6, NULL, '0592', 'Mothers Horlicks Bib', 'mothers-horlicks-bib-FBcEO3qWzNQyKIoj6m664RtkUSalVZqXHyUhkj9x', '<p>Mothers Horlicks Bib</p>', NULL, NULL, 490.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(482, 3, 6, NULL, '0593', 'Horlicks refill', 'horlicks-refill-SB4mVMHxklXGIe3CeNuYlmiLlkjF331sVCunyeik', '<p>Horlicks refill</p>', NULL, NULL, 375.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(483, 3, 6, NULL, '0594', 'Horlicks Grouth plus', 'horlicks-grouth-plus-jtbTnX4SUnLmSGf8opwC5RqpZit95bk8PLaeYAWF', '<p>Horlicks Grouth plus</p>', NULL, NULL, 840.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(484, 3, 6, NULL, '0595', 'cadbury bourn vita', 'cadbury-bourn-vita-P5kemSLk5MiNt74po1Wh9WdL6MbvDhki1gixTciP', '<p>cadbury bourn vita</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(485, 3, 6, NULL, '0596', 'Nestle Nesquik Strawberry powder', 'nestle-nesquik-strawberry-powder-ku2kj78dr6pB0QKl52lcSvMNGV9dnFPq4XxB8ZWn', '<p>Nestle Nesquik Strawberry powder</p>', NULL, NULL, 305.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(486, 3, 6, NULL, '0597', 'Nestle nestum higher in whole grain ceral milk drink', 'nestle-nestum-higher-in-whole-grain-ceral-milk-drink-aXwlhOuda0KMKebCFPPkx7yFhQUGc1VHZJsvc0tF', '<p>Nestle nestum higher in whole grain ceral milk drink</p>', NULL, NULL, 850.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(487, 3, 6, NULL, '0598', 'Nestle nestum higher in whole grain ceral milk drink', 'nestle-nestum-higher-in-whole-grain-ceral-milk-drink-bN6N7KFIwu1FP3Ei00ONNLobqs7VaNuBkDm1qS4n', '<p>Nestle nestum higher in whole grain ceral milk drink</p>', NULL, NULL, 815.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(488, 3, 6, NULL, '0599', 'Quality brown premium egg', 'quality-brown-premium-egg-Epoa99Q6EJf81ZJzadRnttRTZsETaBjPQ4gPZK1W', '<p>Quality brown premium egg</p>', NULL, NULL, 145.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(489, 3, 6, NULL, '0600', 'Purnava vitamin egg', 'purnava-vitamin-egg-e8qFMPEXritznjcmWpLhFDvINAy9ipQw4sSBCBsG', '<p>Purnava vitamin egg</p>', NULL, NULL, 162.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(490, 3, 6, NULL, '0601', 'purnava omega 3 enriched egg', 'purnava-omega-3-enriched-egg-C6zW7Nzf51hdN1z7xmFvx43UFszzZiDLP3ynVVg0', '<p>purnava omega 3 enriched egg</p>', NULL, NULL, 221.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(491, 3, 6, NULL, '0602', 'Nestle koko krunch cereals box (FREE maggi 2 min thai soup)', 'nestle-koko-krunch-cereals-box-free-maggi-2-min-thai-soup-Q1ZPEyEL5rd3XlYPsrSw3X4fzIu3fDhbkRAaZNN6', '<p>Nestle koko krunch cereals box (FREE maggi 2 min thai soup)</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(492, 3, 6, NULL, '0603', 'nestle corn flakes breakfast cereal box', 'nestle-corn-flakes-breakfast-cereal-box-HyVxDPZkLHdidjyP2A8j25j0dDdUVjhGmqkQ0deR', '<p>nestle corn flakes breakfast cereal box</p>', NULL, NULL, 330.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(493, 3, 6, NULL, '0604', 'Nestle koko krunch Duo cereals box', 'nestle-koko-krunch-duo-cereals-box-TXJOHlLuVHuq0tYFVVvKlxGAeg15ytKutawpslvx', '<p>Nestle koko krunch Duo cereals box</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(494, 3, 6, NULL, '0605', 'nestle MILO breakfast chocolate cereal box', 'nestle-milo-breakfast-chocolate-cereal-box-i2OfUyCSqd7OBXQvhlpKCBWw97N0mXwdOPf9vu8y', '<p>nestle MILO breakfast chocolate cereal box</p>', NULL, NULL, 450.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(495, 3, 6, NULL, '0606', 'nestle corn flakes breakfast cereal box (FREE maggi masala noodles)', 'nestle-corn-flakes-breakfast-cereal-box-free-maggi-masala-noodles-TzxrieZi9prqtg7Oj7CGwo3liX0zOFNF07TIjqa8', '<p>nestle corn flakes breakfast cereal box (FREE maggi masala noodles)</p>', NULL, NULL, 330.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(496, 3, 6, NULL, '0607', 'quaker oats poly', 'quaker-oats-poly-ThQfVjBkPN37k3mEVbjlWa3fsFqewGXccTBlmdpl', '<p>quaker oats poly</p>', NULL, NULL, 265.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(497, 3, 6, NULL, '0608', 'quaker oats australia', 'quaker-oats-australia-a6XG7qeQ0q0OqVZerKATTOzC0re6ExHUYVs82DTb', '<p>quaker oats australia</p>', NULL, NULL, 575.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(498, 3, 6, NULL, '0609', 'quaker white oats', 'quaker-white-oats-MZ4ZWnmwLJA7VTGRa5fqWDHb0nK48KBUkvxXk4Ho', '<p>quaker white oats</p>', NULL, NULL, 320.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(499, 3, 6, NULL, '0610', 'quaker instant oatmeal jar', 'quaker-instant-oatmeal-jar-8obRE6M9VMnUnc273S3FmLyrkWb3PAA13ET9ZXwA', '<p>quaker instant oatmeal jar</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(500, 3, 6, NULL, '0611', 'quaker instant oatmeal jar', 'quaker-instant-oatmeal-jar-oqk7lX04bfMhII9wrxg3ac74sZML2gyMToqb8H8C', '<p>quaker instant oatmeal jar</p>', NULL, NULL, 199.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(501, 3, 6, NULL, '0612', 'Kelloggs chocos fills centre filled pillows', 'kelloggs-chocos-fills-centre-filled-pillows-feoXatdHM7bVWoaCxKV2mwCwW6MC19Yj3BIF7mgB', '<p>Kelloggs chocos fills centre filled pillows</p>', NULL, NULL, 199.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(502, 3, 6, NULL, '0613', 'sajeeb corn flakes', 'sajeeb-corn-flakes-y6p4fJvLqFwo22YdU2OyXLDlVMxXPd7NteDJKJPl', '<p>sajeeb corn flakes</p>', NULL, NULL, 155.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(503, 3, 6, NULL, '0614', 'shezan choko crunch', 'shezan-choko-crunch-hLh6zqBrkqyK6T0OPHN6Kj76zH2bHCMUSOWlG82h', '<p>shezan choko crunch</p>', NULL, NULL, 190.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(504, 3, 6, NULL, '0615', 'vitalia sugar free corn flakes', 'vitalia-sugar-free-corn-flakes-3LgleRVsQMNLOW1GBu0B1GVtfjeEoEGCNbm8aIE7', '<p>vitalia sugar free corn flakes</p>', NULL, NULL, 465.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(505, 3, 6, NULL, '0616', 'vitalia fit & active muesli', 'vitalia-fit-active-muesli-jUBkWyVNrGYqk03oBWKoIEaFSaSwLt7QSi4aph3u', '<p>vitalia fit &amp; active muesli</p>', NULL, NULL, 636.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(506, 3, 6, NULL, '0617', 'Premuim grade fruit & nut muesli', 'premuim-grade-fruit-nut-muesli-Wd0wIcMZdmZn6OteLboQ3zuEnnGKTemsGrGBDKyQ', '<p>Premuim grade fruit &amp; nut muesli</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(507, 3, 6, NULL, '0618', 'Premuim grade blueberry muesli', 'premuim-grade-blueberry-muesli-zCj2NwpXmuJBgEAzEPu5AcFGGjhIcsJwaCzTurFI', '<p>Premuim grade blueberry muesli</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(508, 3, 6, NULL, '0619', 'Premuim grade canberry muesli', 'premuim-grade-canberry-muesli-u8AAFP9d6UrQ1AHERPZOWEHm0ALcOsTwPzcoGwUu', '<p>Premuim grade canberry muesli</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(509, 3, 6, NULL, '0620', 'Premuim grade apricot muesli', 'premuim-grade-apricot-muesli-NfjInSG1mIvHluNSIbm0h3wi9wJBqn0RQCJlcPQ6', '<p>Premuim grade apricot muesli</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(510, 3, 6, NULL, '0621', 'Premuim grade fig muesli', 'premuim-grade-fig-muesli-56RQiX5XghpdXykdCrMAS3r6CjqOS331Dr5jTRgK', '<p>Premuim grade fig muesli</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(511, 3, 6, NULL, '0622', 'IKO premium sugar free oatmeal crackers original', 'iko-premium-sugar-free-oatmeal-crackers-original-F9UbxHhrI5Nj3nYVRhVnTQZ9LZjChlURLWNTMzGt', '<p>IKO premium sugar free oatmeal crackers original</p>', NULL, NULL, 345.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(512, 3, 6, NULL, '0623', 'Milk vita Butter', 'milk-vita-butter-mfmUHv2FlOwSECeiYGPzTJGZOGW0i1xJDk3eULaK', '<p>Milk vita Butter</p>', NULL, NULL, 176.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(513, 3, 6, NULL, '0624', 'Pran butter (fresco container)', 'pran-butter-fresco-container-DwTtySK06JZrwQIRNpLC5JqpaqZo1K184HkHkmMq', '<p>Pran butter (fresco container)</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(514, 3, 6, NULL, '0625', 'pran mango jam', 'pran-mango-jam-bDzip0RQU4LEalfAf2MkQ1lFt1JG08zBpH9iTkTT', '<p>pran mango jam</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(515, 3, 6, NULL, '0626', 'pran mango jam', 'pran-mango-jam-pd3PsJkJB1WL6zlcHgxH1abEHdwuLkfWjWvTPzSN', '<p>pran mango jam</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(516, 3, 6, NULL, '0627', 'alfa mayoannaise', 'alfa-mayoannaise-P1HvPrr3X2sbcblnUMQhyuSJpq0CZztEd54WRVUy', '<p>alfa mayoannaise</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(517, 3, 6, NULL, '0628', 'alfa mayoannaise', 'alfa-mayoannaise-wPpxJUz3QMZjtruKvIsCooUb9qeGIvg48YdIKHBr', '<p>alfa mayoannaise</p>', NULL, NULL, 215.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(518, 3, 6, NULL, '0629', 'Harman mayonnaise', 'harman-mayonnaise-MagXZrPyDAZ1FSS3QOSUJTdSsqGot6kSJ92yjKsV', '<p>Harman mayonnaise</p>', NULL, NULL, 135.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(519, 3, 6, NULL, '0630', 'Harman mayonnaise', 'harman-mayonnaise-3aaWQekzhLpuN1YMoFAcX2HMhTO5vddEpAf1yPUp', '<p>Harman mayonnaise</p>', NULL, NULL, 245.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(520, 3, 6, NULL, '0631', 'harman peanut butter creamy', 'harman-peanut-butter-creamy-AP1BnEksEHMwOhQj6t9sxOv5Q7wGZvar9UQXynFd', '<p>harman peanut butter creamy</p>', NULL, NULL, 325.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(521, 3, 6, NULL, '0632', 'calypso mayonnaise', 'calypso-mayonnaise-iTvLzobyJbPyerKOF63C3xS5wPz6beHZHQzFX2aG', '<p>calypso mayonnaise</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(522, 3, 6, NULL, '0633', 'calypso mayonnaise', 'calypso-mayonnaise-XdcAIl4H5aFeLLtv07L3GWPaDhBgA5UW1vEDsSsr', '<p>calypso mayonnaise</p>', NULL, NULL, 375.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(523, 3, 6, NULL, '0634', 'foster clarks orange jelly', 'foster-clarks-orange-jelly-GBGe4j6ELnao2roJ5qCiTNtdkWrUWqEhZ5dHbfuo', '<p>foster clarks orange jelly</p>', NULL, NULL, 75.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(524, 3, 6, NULL, '0635', 'foster clarks jam strawberry', 'foster-clarks-jam-strawberry-vfhgMuIbTbQcIDjajtqMDJqboPnVjjI6o9dIYHsZ', '<p>foster clarks jam strawberry</p>', NULL, NULL, 490.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(525, 3, 6, NULL, '0636', 'foster clarks cherry jelly', 'foster-clarks-cherry-jelly-QecJpqeTtyLFWA6cyx8rYNs5stXP3mhterOcORIE', '<p>foster clarks cherry jelly</p>', NULL, NULL, 75.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(526, 3, 6, NULL, '0637', 'foster clarks mango jelly', 'foster-clarks-mango-jelly-zThawK4VQd9EJ6Q6mBlvGeY0si8JX8K1BAhdqtIg', '<p>foster clarks mango jelly</p>', NULL, NULL, 75.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(527, 3, 6, NULL, '0638', 'foster clarks mixed fruit jam', 'foster-clarks-mixed-fruit-jam-OEfFNV5TNRyCLfRw9o3joGqCGZO1aQrgE3TnfTUw', '<p>foster clarks mixed fruit jam</p>', NULL, NULL, 490.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(528, 3, 6, NULL, '0639', 'crown peanut butter chunky', 'crown-peanut-butter-chunky-7AU2aXTwBmSGpRQFPyOKVXf89Zg50iQDwPL6GPmo', '<p>crown peanut butter chunky</p>', NULL, NULL, 480.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(529, 3, 6, NULL, '0640', 'crown peanut butter smoot & creamy', 'crown-peanut-butter-smoot-creamy-g75QhdKwgu7fnYfVvG8rllTNLx9TmpNZ3GP6egmp', '<p>crown peanut butter smoot &amp; creamy</p>', NULL, NULL, 480.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(530, 3, 6, NULL, '0641', 'nocilla two colour chocolate', 'nocilla-two-colour-chocolate-eusQulnBXBJWjitBPFHnJ5rmL6sQuGwkQ7gEF0aN', '<p>nocilla two colour chocolate</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(531, 3, 6, NULL, '0642', 'nutella hazelnut cocoa spread', 'nutella-hazelnut-cocoa-spread-sa2xeEG7AQKD003jsteijp9RHwDsRS578T0gJlor', '<p>nutella hazelnut cocoa spread</p>', NULL, NULL, 950.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(532, 3, 6, NULL, '0643', 'amul pasteurised butter', 'amul-pasteurised-butter-bpbRekRNEXSJrL2vgAHf0HGzf07EmQ7qYP7lKoE2', '<p>amul pasteurised butter</p>', NULL, NULL, 355.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(533, 3, 6, NULL, '0644', 'farm fresh Butter (50gm*4)', 'farm-fresh-butter-50gm4-gueRymYI4m2GMb1XuuJ6hTAXp6FIN645Dv9E5GNP', '<p>farm fresh Butter (50gm*4)</p>', NULL, NULL, 184.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(534, 3, 6, NULL, '0645', 'alamarai processed cream cheese', 'alamarai-processed-cream-cheese-MImQoE5jgvuNjwjIt2QPHisLoa2qeagKbeSBHMPs', '<p>alamarai processed cream cheese</p>', NULL, NULL, 700.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(535, 3, 6, NULL, '0646', 'Ruchi orange jam', 'ruchi-orange-jam-z7ihY91cEMvMAECwMbbGjkjhgWwmPkkAlrgFP5W4', '<p>Ruchi orange jam</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(536, 3, 6, NULL, '0647', 'Ahmed orange jelly', 'ahmed-orange-jelly-jOkM20CZHgymMIj41r0op8c4zkEIbwVb2BRbCYzK', '<p>Ahmed orange jelly</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(537, 3, 6, NULL, '0648', 'ahmed suger free apple jelly', 'ahmed-suger-free-apple-jelly-CsFGOrlPEjswUcP2BlkSqFE1ut6QNPyYumqVusKV', '<p>ahmed suger free apple jelly</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(538, 3, 6, NULL, '0649', 'Ahmed mixed fruit jam', 'ahmed-mixed-fruit-jam-vqCOnXzyNK0Z9SRDPfymx7qSeg861mKxAEACZvlV', '<p>Ahmed mixed fruit jam</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(539, 3, 6, NULL, '0650', 'ahmed suger free guava jelly', 'ahmed-suger-free-guava-jelly-tkMuTnAEuokszCHxNTkUcAyMUcKh1tvgdoSWmTZB', '<p>ahmed suger free guava jelly</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(540, 3, 6, NULL, '0651', 'ahmed mixed fruit jelly', 'ahmed-mixed-fruit-jelly-wEmyJJbloThs7jByRAGCxm2gI6xFequDfPKgWvMQ', '<p>ahmed mixed fruit jelly</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(541, 3, 6, NULL, '0652', 'ahmed pineapple jelly', 'ahmed-pineapple-jelly-OJd89Go2me1Id7M8tSnfo625LAtww4UwPJD0b9Ya', '<p>ahmed pineapple jelly</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(542, 3, 6, NULL, '0653', 'ahmed guava jelly', 'ahmed-guava-jelly-RpO50TCLWWcjnda4DPZooZNDeGQ0jbSvlZnBLGzP', '<p>ahmed guava jelly</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(543, 3, 6, NULL, '0654', 'ahmed apple jam', 'ahmed-apple-jam-l8s5uu66vCVRmz7Iwr4HikV439fndrSkbUpTNgpW', '<p>ahmed apple jam</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(544, 3, 6, NULL, '0655', 'ahmed mango jam', 'ahmed-mango-jam-khW3VsK49P65cvkJ6mCDBBpC4LGIYyYNNR0PVdAP', '<p>ahmed mango jam</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(545, 3, 6, NULL, '0656', 'ahmed pineapple jam', 'ahmed-pineapple-jam-GGEqSI1x7VMFBi89MXAF6Xaen1qaTqtgs7TAcQwu', '<p>ahmed pineapple jam</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(546, 3, 6, NULL, '0657', 'Khushboo premium orange jelly', 'khushboo-premium-orange-jelly-RqUbZ0oPuifmokicI9NhOU4ivpy9rk65WDNSwrXK', '<p>Khushboo premium orange jelly</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(547, 3, 6, NULL, '0658', 'sundrop peanut butter jelly (GRAPe)', 'sundrop-peanut-butter-jelly-grape-zsEZ48yNRwCKGY05at6Glr1LlQUVX9OYANU2xiO3', '<p>sundrop peanut butter jelly (GRAPe)</p>', NULL, NULL, 360.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(548, 3, 6, NULL, '0659', 'sundrop peanut butter crunchy', 'sundrop-peanut-butter-crunchy-PEdRgf1bM8OAkP3dIwXdvQEYNjdUEUSQufb2R37K', '<p>sundrop peanut butter crunchy</p>', NULL, NULL, 390.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(549, 3, 6, NULL, '0660', 'BD orange jelly', 'bd-orange-jelly-sW6INc6f4353iAFOQQM2Lo742agGeOTQQqjkmbIY', '<p>BD orange jelly</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(550, 3, 6, NULL, '0661', 'shezan orange jelly', 'shezan-orange-jelly-OexFv5GrCku9QgGPE3lo8PnC8qJXyU6WJw51km2e', '<p>shezan orange jelly</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(551, 3, 6, NULL, '0662', 'American Green chunky peanut butter', 'american-green-chunky-peanut-butter-me7I0J0UpEWrW5UuS87FFYpDU9AVZYXOoUNbvL5e', '<p>American Green chunky peanut butter</p>', NULL, NULL, 455.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(552, 3, 6, NULL, '0663', 'Pran puffed rice (MURI)', 'pran-puffed-rice-muri-ThuOP3fkSg5ATHPwc3ZbJlcgS8rkoupP9RdzBpmi', '<p>Pran puffed rice (MURI)</p>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(553, 3, 6, NULL, '0664', 'Pran puffed rice (MURI)', 'pran-puffed-rice-muri-vCnpelHKj64maCybdMI6pmQMAzKBBBKtgIhHpDQA', '<p>Pran puffed rice (MURI)</p>', NULL, NULL, 32.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(554, 3, 6, NULL, '0665', 'Pran All time cream roll', 'pran-all-time-cream-roll-c4BrE1oqE2HGxU3YMFrfsWQANeBhodwV5N8ERRzi', '<p>Pran All time cream roll</p>', NULL, NULL, 70.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(555, 3, 6, NULL, '0666', 'Pran fattened rice (chira)', 'pran-fattened-rice-chira-O51lcPwrMdlkQBZp05EzQOYQfhbOzQkxsUA29MoM', '<p>Pran fattened rice (chira)</p>', NULL, NULL, 50.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(556, 3, 6, NULL, '0667', 'Golden Harvest frozen paratha family pack', 'golden-harvest-frozen-paratha-family-pack-KSw29vHXZbsEm35WaFVHmVJeHl9ADRYjAxrLz6a9', '<p>Golden Harvest frozen paratha family pack</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(557, 3, 6, NULL, '0668', 'Golden Harvest aloo paratha', 'golden-harvest-aloo-paratha-tn9ev7Yhd1k9VNLuB9lhYJ0Rm2jZl9uphsyaEFhy', '<p>Golden Harvest aloo paratha</p>', NULL, NULL, 70.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(558, 3, 6, NULL, '0669', 'Golden harvest mega deshi paratha', 'golden-harvest-mega-deshi-paratha-WHTSK0iIkxcUYgk2AV9xEYDLrpJHhNPb3hr3ufGt', '<p>Golden harvest mega deshi paratha</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(559, 3, 6, NULL, '0670', 'cocola chocolate water roll jar', 'cocola-chocolate-water-roll-jar-h5mBhTH97XyGebGTLdVGAge42VR9DnoQF8swbklq', '<p>cocola chocolate water roll jar</p>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(560, 3, 6, NULL, '0671', 'Dan cake vanilla Muffin', 'dan-cake-vanilla-muffin-2lySpahWKTVJr5awVttO0t0ymRpu0Debw2iHliHX', '<p>Dan cake vanilla Muffin</p>', NULL, NULL, 15.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(561, 3, 6, NULL, '0672', 'dan cake chocolate muffin', 'dan-cake-chocolate-muffin-x6ZfM3GxKTYS1TRck3rBfI3kKuqbc2VHbVrZaWHm', '<p>dan cake chocolate muffin</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(562, 3, 6, NULL, '0673', 'dan cake vanilla muffine', 'dan-cake-vanilla-muffine-Nhep0ibMAfOik8DViId0Q1jEUTzMRvKEz2VS7Gwr', '<p>dan cake vanilla muffine</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(563, 3, 6, NULL, '0674', 'dan cake chocolate layer cake', 'dan-cake-chocolate-layer-cake-FbNVZGUX9jHWwX96heRyT22YRC1jp36DjWRLlq1X', '<p>dan cake chocolate layer cake</p>', NULL, NULL, 240.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(564, 3, 6, NULL, '0675', 'dan cake lemon pound cake', 'dan-cake-lemon-pound-cake-89WUFhzVejPBJKsOJX5q4xQ1DpQXUQcqeyD9LOvH', '<p>dan cake lemon pound cake</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `subcategory_id`, `product_code`, `name`, `slug`, `product_details`, `short_description`, `specification`, `unit_price`, `discount_price`, `stock_status`, `quantity`, `special_note`, `video_link`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(565, 3, 6, NULL, '0676', 'Tiffany crunch\'N\' cream hazelnut wafers', 'tiffany-crunchn-cream-hazelnut-wafers-JvqVuAOyKRKggYjl0e2RPndnRfuyp4NLbIol6fTe', '<p>Tiffany crunch&#39;N&#39; cream hazelnut wafers</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(566, 3, 6, NULL, '0677', 'Tiffany crunch\'N\' cream orange wafers', 'tiffany-crunchn-cream-orange-wafers-ueZCQHjbo6LXXu00BPVZIKhJEFeZbBLFcwrZkA88', '<p>Tiffany crunch&#39;N&#39; cream orange wafers</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(567, 3, 6, NULL, '0678', 'Ispahani Bakery Fresh dry cake', 'ispahani-bakery-fresh-dry-cake-iLd6BEEGXBgQm7PRUwPVUV1aQHBK2m3AktLgmD8u', '<p>Ispanahi Bakery Fresh dry cake</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(568, 3, 6, NULL, '0679', 'Lamisa Paratha family pack', 'lamisa-paratha-family-pack-uI0MWRmPMUlun03iNPQkPBk7UBmNe6JTDAWytYzw', '<p>Lamisa Paratha family pack</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(569, 3, 6, NULL, '0680', 'Lamisa premium paratha', 'lamisa-premium-paratha-u2wer0EhbGMZ9swffBoB3cP0fmYhuzLHM3GmJEl0', '<p>Lamisa premium paratha</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(570, 3, 6, NULL, '0681', 'Cocola Egg Noodles - 180 gm', 'cocola-egg-noodles-180-gm-BU6HoaNpE8ZfnN40lGPd4095x30DVIClBwb7A5mO', '<p>cocola Egg Noodles</p>', NULL, NULL, 18.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(571, 3, 6, NULL, '0682', 'cocola junior cup noodles', 'cocola-junior-cup-noodles-K1ZlxsL0cvVegUhHkmzbKGiV5cfD6Oc1jaFbxHBo', '<p>cocola junior cup noodles</p>', NULL, NULL, 25.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(572, 3, 6, NULL, '0683', 'nestle Maggi 2 minute noodles masala 8 pack', 'nestle-maggi-2-minute-noodles-masala-8-pack-CLU61pZ0VANjkMOhX9DesT7xCzvd0ONkueWzYhWM', '<p>nestle Maggi 2 minute noodles masala 8 pack</p>', NULL, NULL, 135.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(573, 3, 6, NULL, '0684', 'nestle Maggi 2 minute noodles masala 4 pack', 'nestle-maggi-2-minute-noodles-masala-4-pack-sACfCy2pLz1yyDldx1BWv4TL14qYp5CBo0nxRg9c', '<p>nestle Maggi 2 minute noodles masala 4 pack</p>', NULL, NULL, 66.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(574, 3, 6, NULL, '0685', 'Chopstick deshi masala instant noodles (Free surprise Gift) 8 pack', 'chopstick-deshi-masala-instant-noodles-free-surprise-gift-8-pack-KnTqDWScI3HG56tIDpdlB6ACu0z8B0TMOkBHDrwP', '<p>Chopstick deshi masala instant noodles (Free surprise Gift) 8 pack</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(575, 3, 6, NULL, '0686', 'Nestle Maggi Healty thai soup', 'nestle-maggi-healty-thai-soup-RF5FRIsis5t3Z1D37hZb3UTkaI3TxBEoY8UaYIEP', '<p>Nestle Maggi Healty thai soup</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(576, 3, 6, NULL, '0687', 'nestle maggi healty soup corn with chicken Flavour', 'nestle-maggi-healty-soup-corn-with-chicken-flavour-ygSVhHoUmAZpFWQzBAbjtkRYqtM2J4IXOxHQZPaj', '<p>nestle maggi healty soup corn with chicken Flavour</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(577, 3, 6, NULL, '0688', 'Nestle maggi shaad e magic seasoning', 'nestle-maggi-shaad-e-magic-seasoning-vbyUNsrjYwoUsSSYSfTIHV0n1Bv4ex2vPYrb4gqN', '<p>Nestle maggi shaad e magic seasoning</p>', NULL, NULL, 5.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(578, 3, 6, NULL, '0689', 'Nestle maggi healty soup vegetables', 'nestle-maggi-healty-soup-vegetables-Higzz0sdOp76DrSOhUyJbLD2a9ce5hWDEmorTr0D', '<p>Nestle maggi healty soup vegetables</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(579, 3, 6, NULL, '0690', 'kolson Macaroni shell', 'kolson-macaroni-shell-UL4D6tm25JBpchPDqKrO5581Vn5EEHDvGEkknHe6', '<p>kolson Macaroni shell</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(580, 3, 6, NULL, '0691', 'kolson Bamboo', 'kolson-bamboo-lPte1DWBPALzD6U0BUn8SqHEyUU8Eu8mXSUClaU7', '<p>kolson Bamboo</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(581, 3, 6, NULL, '0692', 'kolson macaroni screw', 'kolson-macaroni-screw-OAQGy7GFBLE9WRVojyl4JNL0FeUzgrs89TCZHtEb', '<p>kolson macaroni screw</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(582, 3, 6, NULL, '0693', 'kolson macaroni assorted pack', 'kolson-macaroni-assorted-pack-M3ImPDebTICLrE04vhsdX4h1jg7s33p1eXLJB9jZ', '<p>kolson macaroni assorted pack</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(583, 3, 6, NULL, '0694', 'Dekko pasta', 'dekko-pasta-BH39eqKu3ZLMhOC6L5nHihDylGxQpcN2LDqXhx8B', '<p>Dekko pasta</p>', NULL, NULL, 70.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(584, 3, 6, NULL, '0695', 'Bashundhara sea shell pasta', 'bashundhara-sea-shell-pasta-I5axp3ZzeejkvO3hQhtANFBcjbrRZtltqsXTTbZa', '<p>Bashundhara sea shell pasta</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(585, 3, 6, NULL, '0696', 'Pasta hat macaroni (Rigate)', 'pasta-hat-macaroni-rigate-ZFt6alSLHFnwbwyE4r1CbxikihEbWOJDwt2iJ52J', '<p>Pasta hat macaroni (Rigate)</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(586, 3, 6, NULL, '0697', 'Pasta hat macaroni (Medium shell)', 'pasta-hat-macaroni-medium-shell-hfofr4ROdbh9pNsC6NeJnWZBJiGKhzSHWshE2sFJ', '<p>Pasta hat macaroni (Medium shell)</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(587, 3, 6, NULL, '0698', 'pasta hat macaroni (screw)', 'pasta-hat-macaroni-screw-gEMtCqiaQSFFz7rbZzzCk4vZTAXjgKvutOxJEraD', '<p>pasta hat macaroni (screw)</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(588, 3, 6, NULL, '0699', 'pasta hat macaroni (Big Elbow)', 'pasta-hat-macaroni-big-elbow-Wx5M6Yehbuqc4s6GtyEAtSahksH9tHm50hnuZ4Y9', '<p>pasta hat macaroni (Big Elbow)</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(589, 3, 6, NULL, '0700', 'Nestle Kitkat 4 finger', 'nestle-kitkat-4-finger-wI8VGK23PMdmR21JItrO6pO6Snlizbf72c7QAc3Z', '<p>Nestle Kitkat 4 finger</p>', NULL, NULL, 50.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(590, 3, 6, NULL, '0701', 'kitkat 2 finger', 'kitkat-2-finger-upjGgebG0nMp6GJu5PYVKW6dra9C8ao7SU1QnbN2', '<p>kitkat 2 finger</p>', NULL, NULL, 30.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(591, 3, 6, NULL, '0702', 'Nestle Chocolate Assorted Chocolate', 'nestle-chocolate-assorted-chocolate-rjecdHkqkN5DJqaTN3P5RDrKbfVBnqHlDB4DBglk', '<p>Nestle Chocolate Assorted Chocolate</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(592, 3, 6, NULL, '0704', 'Nestle nesquik chocolate powder', 'nestle-nesquik-chocolate-powder-hPtotvHMK5vfXloykB7xWsPBgrxInmlLE4FLPJO6', '<p>Nestle nesquik chocolate powder</p>', NULL, NULL, 435.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(593, 3, 6, NULL, '0705', 'Snikers Chocolate', 'snikers-chocolate-8aIJMAEGeFx1e7cwwXgCrysHfyGC8WWL9Zsjdx9t', '<p>Snikers Chocolate</p>', NULL, NULL, 20.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(594, 3, 6, NULL, '0706', 'Snikers Chocolate', 'snikers-chocolate-4EIiq74jUdQ5ABm7Hn9mpkAWSNEYMYxwH2KJR2NR', '<p>Snikers Chocolate</p>', NULL, NULL, 55.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(595, 3, 6, NULL, '0707', 'snikers family pack chocolate', 'snikers-family-pack-chocolate-eip7u31t5GTGdYXrq6nVtCc0GwHijMJm4v7npG33', '<p>snikers family pack chocolate</p>', NULL, NULL, 225.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(596, 3, 6, NULL, '0708', 'snikers power pack', 'snikers-power-pack-atznRnX1M1EppEPuyBBbRV685jeMBD8YE9HXHc70', '<p>snikers power pack</p>', NULL, NULL, 285.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(597, 3, 6, NULL, '0709', 'Cadbury Dairy Milk silk chocolate', 'cadbury-dairy-milk-silk-chocolate-NuGMilTzdL8869hWti0MNzmJS4MoL0j1yxlrpVOR', '<p>Cadbury Dairy Milk silk chocolate</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(598, 3, 6, NULL, '0710', 'cadbury 5 star chocolate', 'cadbury-5-star-chocolate-DzsCnDy1FCpcejypx13N3lTuTl6x7yw9VmuheStU', '<p>cadbury 5 star chocolate</p>', NULL, NULL, 30.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(599, 3, 6, NULL, '0711', 'cadbury choclairs', 'cadbury-choclairs-jTOB35bpHskiIOmCjM2unsD7502vAPXSahN7xYua', '<p>cadbury choclairs</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(600, 3, 6, NULL, '0712', 'cadbury dairy millk silk fruit & nut', 'cadbury-dairy-millk-silk-fruit-nut-lDe4VWbUdVT8pAIJsaIeKgGQYhbVWJib7QA8KYY0', '<p>cadbury dairy millk silk fruit &amp; nut</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-07-08 06:24:48'),
(601, 1, 6, NULL, '0713', 'cadbury bournville rich cocoa dark chocolate', 'cadbury-bournville-rich-cocoa-dark-chocolate-Jdje581BCWvDxumwFige7hBzSuBWPSDhWliSVxiE', '<p>cadbury bournville rich cocoa dark chocolate</p>', NULL, NULL, 230.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(602, 1, 6, NULL, '0714', 'cadbury original drinking chocolate', 'cadbury-original-drinking-chocolate-4ED7CSqnSoq3SR8iLdW8izT0s2vKIhPn2DlGz6O2', '<p>cadbury original drinking chocolate</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(603, 1, 6, NULL, '0715', 'cadbury gems surprise chocolate ball', 'cadbury-gems-surprise-chocolate-ball-S7mDmQlZKwn2GuzL3YfLNy1tSFLNxmVPzs1ctX3f', '<p>cadbury gems surprise chocolate ball</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(604, 1, 6, NULL, '0716', 'cadbury gems surprise chocolate', 'cadbury-gems-surprise-chocolate-Lu9yVVgqBsQ2tqNSWSB4HHgvWxGSTJcoRHmKZRmo', '<p>cadbury gems surprise chocolate</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(605, 1, 6, NULL, '0717', 'cadbury dairy milk silk roast almond', 'cadbury-dairy-milk-silk-roast-almond-AfQm9dnQUOrlI4voRXT3T7htbhxOST2fi84X7NeP', '<p>cadbury dairy milk silk roast almond</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(606, 1, 6, NULL, '0718', 'cadbury fuse chocolate', 'cadbury-fuse-chocolate-vn7eWGhRWd08v7UfPs9PXqp8pAFw6aEM8b5etzjX', '<p>cadbury fuse chocolate</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(607, 1, 6, NULL, '0719', 'cadbury bournville raisin and nusts dark chocolate', 'cadbury-bournville-raisin-and-nusts-dark-chocolate-E7JYRsyLhqNucBTi8GcxMVPS00T8VF548QUd6GaA', '<p>cadbury bournville raisin and nusts dark chocolate</p>', NULL, NULL, 230.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(608, 1, 6, NULL, '0720', 'cadbury bournville cranberry dark chocolate', 'cadbury-bournville-cranberry-dark-chocolate-uEsavCDzXciYIVfLSWyNePJOvgVStfljIu7tfCib', '<p>cadbury bournville cranberry dark chocolate</p>', NULL, NULL, 230.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(609, 1, 6, NULL, '0721', 'cadbury bournville cranberry dark chocolate', 'cadbury-bournville-cranberry-dark-chocolate-q1hEzWbfSnB4YqcYpdh15FmuCuBj5nLM4UVhBVnN', '<p>cadbury bournville cranberry dark chocolate</p>', NULL, NULL, 230.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(610, 1, 6, NULL, '0722', 'cadbury dairy milk lickables', 'cadbury-dairy-milk-lickables-gq6idnV86nkeIwV7q5drbxSAIWyPptmN4lwCjlFk', '<p>cadbury dairy milk lickables</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(611, 1, 6, NULL, '0723', 'kopiko coffee candy', 'kopiko-coffee-candy-AuqaxCVJ3S3vBZM5OmuuMTCNkI9WJun0gMOBvzxn', '<p>kopiko coffee candy</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(612, 1, 6, NULL, '0724', 'kopiko coffee cappuccino', 'kopiko-coffee-cappuccino-ePigC6SPDCBuhAHd7jw2CevfsL0FMQFp0p6Xiyfp', '<p>kopiko coffee cappuccino</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(613, 1, 6, NULL, '0725', 'olympic tetul candy', 'olympic-tetul-candy-7s7pNhqfsT12SFFZaxLhDWGqUyE1TVvzV2QsPwBq', '<p>olympic tetul candy</p>', NULL, NULL, 50.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(614, 1, 6, NULL, '0726', 'olympic juicy litchi candy', 'olympic-juicy-litchi-candy-oApcG8gaaVK7rjIswk9bCatmHufAzGIUHdQRgVHF', '<p>olympic juicy litchi candy</p>', NULL, NULL, 50.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(615, 1, 6, NULL, '0727', 'olympic mango candy', 'olympic-mango-candy-GHAMx2NX7BTuYPpAumolfbfmy3KtnxtVIxTz1qEx', '<p>olympic mango candy</p>', NULL, NULL, 50.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(616, 1, 6, NULL, '0728', 'Alpenliebe original caramel candy pouch', 'alpenliebe-original-caramel-candy-pouch-e5CJd08q4R3g967NeFX82jJX4ZxTrDWoHgDQ2PST', '<p>Alpenliebe original caramel candy pouch</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(617, 1, 6, NULL, '0729', 'Alpenliebe Creamfills Box', 'alpenliebe-creamfills-box-Sp9CjZNe8CgRDPUqcwS9qhvWlC069Rl1DG1fXo0Z', '<p>Alpenliebe Creamfills Box</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(618, 1, 6, NULL, '0730', 'Alpenliebe pop Party Pack Lollipop surprise Gift', 'alpenliebe-pop-party-pack-lollipop-surprise-gift-T1RlnTWiHSv3x56DkRIGUQspNfMUVy1m25KwU4CQ', '<p>Alpenliebe pop Party Pack Lollipop surprise Gift</p>', NULL, NULL, 50.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(619, 1, 6, NULL, '0731', 'Ispahani Mirzapore Best leaf Tea', 'ispahani-mirzapore-best-leaf-tea-79to9xmM8pU5qzl6oYYkjozhX3W6u5EdU6Ys1WYM', '<p>Ispahani Mirzapore Best leaf Tea</p>', NULL, NULL, 210.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(620, 1, 6, NULL, '0732', 'Ispahani Mirzapore Best leaf Tea', 'ispahani-mirzapore-best-leaf-tea-caOjG31cfk2fjneFE0joydNaOkP0ZrfIFvwE54Py', '<p>Ispahani Mirzapore Best leaf Tea</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(621, 1, 6, NULL, '0733', 'Ispahani Mirzapur Red dust tea', 'ispahani-mirzapur-red-dust-tea-C6mAwIp0BnEq65g4aCjkTHMEG4ODi0UPYrENqTm9', '<p>Ispahani Mirzapur Red dust tea</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(622, 1, 6, NULL, '0734', 'ispahani mirzapore Tea bag', 'ispahani-mirzapore-tea-bag-4Gy1Nb6r2ASpewPkOeDLq55MnoFtMZcT6CbNaGfi', '<p>ispahani mirzapore Tea bag</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(623, 1, 6, NULL, '0735', 'Ispahani blender\'s choice green tea', 'ispahani-blenders-choice-green-tea-0TGahjA94Ihlg6xfPpNluQ24R6cqGAfWv8EYiUei', '<p>Ispahani blender&#39;s choice green tea</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(624, 1, 6, NULL, '0736', 'Ispahani blender\'s choice green tea', 'ispahani-blenders-choice-green-tea-hKIrgLiYjy4ohRXos6TkKxZsTz7TkjyfAhwBFyNv', '<p>Ispahani blender&#39;s choice green tea</p>', NULL, NULL, 145.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(625, 1, 6, NULL, '0737', 'Ispahani blender\'s choice green tea', 'ispahani-blenders-choice-green-tea-h1GlSKMe5HrizhpEKz8sC2J9QpKOxbRKgwKTYOBO', '<p>Ispahani blender&#39;s choice green tea</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(626, 1, 6, NULL, '0738', 'Ispahani blender\'s choice green tea', 'ispahani-blenders-choice-green-tea-Ix5bPgIdRMVS9K46U1w5fENvHBStXuRrBL2XOkAB', '<p>Ispahani blender&#39;s choice green tea</p>', NULL, NULL, 310.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(627, 1, 6, NULL, '0739', 'Ispahani mirzapore PD tea', 'ispahani-mirzapore-pd-tea-RPTEhSs04q0FW7BnWDMT5xAIIyxpv1TWiW048OFJ', '<p>Ispahani mirzapore PD tea</p>', NULL, NULL, 232.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(628, 1, 6, NULL, '0740', 'Ispahani zareen premium tea', 'ispahani-zareen-premium-tea-Px5Nz1rn6NTl0e0EsEmqQAXZHRUgHKKiLr5S7jJ7', '<p>Ispahani zareen premium tea</p>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(629, 1, 6, NULL, '0741', 'Brooke bond Taaza Tea black tea', 'brooke-bond-taaza-tea-black-tea-4U4YJa0Dh4E2He98L6gPy0L5rpCzkkEQHcgDgxJX', '<p>Brooke bond Taaza Tea black tea</p>', NULL, NULL, 199.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(630, 1, 6, NULL, '0742', 'Brooke bond Taaza Tea black tea', 'brooke-bond-taaza-tea-black-tea-gbf7kF9x24HGHCdvIoAea1rGWjN98pZzyz7qJUkE', '<p>Brooke bond Taaza Tea black tea</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(631, 1, 6, NULL, '0743', 'Brooke bond Taaza Tea bag', 'brooke-bond-taaza-tea-bag-rGgR0GpWNLywra6Lrb4k0KiiN7tL6J43H7baMHqr', '<p>Brooke bond Taaza Tea bag</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(632, 1, 6, NULL, '0744', 'Fresh Premium Tea (cup free)', 'fresh-premium-tea-cup-free-Scatdlil8MucSOyzbkHhJar2Z3r2IsV2Igv6fSDZ', '<p>Fresh Premium Tea (cup free)</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(633, 1, 6, NULL, '0745', 'Fresh Premium Tea (spoon free)', 'fresh-premium-tea-spoon-free-99bOSmDK6HdO0BDsBzOz6lHEn7gCeeAtRY2VKvQi', '<p>Fresh Premium Tea (spoon free)</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(634, 1, 6, NULL, '0746', 'kazi & kazi Green tea', 'kazi-kazi-green-tea-EWLQgEW0SkWMp0Z41V7VZCFDTLlGyQJ6O1Bh00Dl', '<p>kazi &amp; kazi Green tea</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(635, 1, 6, NULL, '0747', 'kazi & kazi Orthodox Green tea', 'kazi-kazi-orthodox-green-tea-6rw4mWWcwuQqzcuiWQZ4viOlyrTRfZH8udM0FGWv', '<p>kazi &amp; kazi Orthodox Green tea</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(636, 1, 6, NULL, '0748', 'kazi & kazi Ginger tea', 'kazi-kazi-ginger-tea-y0e4WAOxAU98WWDPVVwTPKH9F2qZcAoWySX0iFIw', '<p>kazi &amp; kazi Ginger tea</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(637, 1, 6, NULL, '0749', 'kazi & kazi Tulsi tea', 'kazi-kazi-tulsi-tea-6hCkzrNrTyCRkzLYEVUZhdtFntxpzZGsfGoXuYzq', '<p>kazi &amp; kazi Tulsi tea</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(638, 1, 6, NULL, '0750', 'kazi & kazi black tea', 'kazi-kazi-black-tea-cDe4YMFTUFNVPruXWuPMK8ieLNuKphvsI4TuAcDv', '<p>kazi &amp; kazi black tea</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(639, 1, 6, NULL, '0751', 'kazi & kazi Lemongrass tea', 'kazi-kazi-lemongrass-tea-QxbmOaBpPPijcHS01oMyUemUlDQ77SzAVY4H1UCe', '<p>kazi &amp; kazi Lemongrass tea</p>', NULL, NULL, 160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(640, 1, 6, NULL, '0752', 'kazi & kazi medley tea', 'kazi-kazi-medley-tea-vBpGlzqRUAaMwCkQbfgp9FscJ8n6ZIr5SJIhyWww', '<p>kazi &amp; kazi medley tea</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(641, 1, 6, NULL, '0753', 'kazi & kazi Lemongrass herbal infusion', 'kazi-kazi-lemongrass-herbal-infusion-8ZNgcecltGD4JfreK8TiTTeOYudNAKBxbK4NPWZ3', '<p>kazi &amp; kazi Lemongrass herbal infusion</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(642, 1, 6, NULL, '0754', 'Finlays pure Green tea bags', 'finlays-pure-green-tea-bags-JqBOdkgpP8gUon0iMz3Lh95OJKgE9fVTrJrxoOaq', '<p>Finlays pure Green tea bags</p>', NULL, NULL, 95.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(643, 1, 6, NULL, '0755', 'Finlays pure green tea box', 'finlays-pure-green-tea-box-Se45dfDXlmNK2NHi2cQAHMEJmWd1CThZy5IPxwrM', '<p>Finlays pure green tea box</p>', NULL, NULL, 85.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(644, 1, 6, NULL, '0756', 'finlays natural green tea bags', 'finlays-natural-green-tea-bags-YGGINaFQyHQK9REKhSYKHF1EIDiFVFGK9WjtVVcK', '<p>finlays natural green tea bags</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(645, 1, 6, NULL, '0757', 'finlays masala cha tea bags', 'finlays-masala-cha-tea-bags-OInQ4xACEuuXzTZ8Bna26r1VQUdSByS9iOwPTsTH', '<p>finlays masala cha tea bags</p>', NULL, NULL, 95.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(646, 1, 6, NULL, '0758', 'finlay premium tea', 'finlay-premium-tea-kZ0kupjH8LZfRXbFLUn0xF9CclZzfWcb11yPnDc4', '<p>finlay premium tea</p>', NULL, NULL, 115.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(647, 1, 6, NULL, '0759', 'finlay gold tea', 'finlay-gold-tea-cfhs46nme3wKg8VDkvKYKnpeg9B5N0iZJgxpAlRS', '<p>finlay gold tea</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(648, 1, 6, NULL, '0760', 'finlay gold tea', 'finlay-gold-tea-QkxpeJoX8lnu8yaRmHlcWGi7I5BHL2gO0LaHYgDD', '<p>finlay gold tea</p>', NULL, NULL, 210.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(649, 1, 6, NULL, '0761', 'Tetley premium tea bags', 'tetley-premium-tea-bags-Qk30V0Vv1pVjqj4ilEZjUFfIzuVOkGPVbZ8qHRsK', '<p>Tetley premium tea bags</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(650, 1, 6, NULL, '0762', 'tetly green tea (PURE original) tea bags', 'tetly-green-tea-pure-original-tea-bags-6vR0APGJGK2BYFl6M2KISqolXgAcZadiE0xz2kfB', '<p>tetly green tea (PURE original) tea bags</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(651, 1, 6, NULL, '0763', 'Nestle Nescafe classic instant coffee jar', 'nestle-nescafe-classic-instant-coffee-jar-A9uEPvMu86LbxxgbbEF4TinX4AzwiPbEOoCQxuMe', '<p>Nestle Nescafe classic instant coffee jar</p>', NULL, NULL, 495.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(652, 1, 6, NULL, '0764', 'Nestle Nescafe classic instant coffee jar', 'nestle-nescafe-classic-instant-coffee-jar-NKRvkKjJvepHrzKwSWItUYlOBeLYavpjWfibLhw2', '<p>Nestle Nescafe classic instant coffee jar</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(653, 1, 6, NULL, '0765', 'Nestle Nescafe classic instant coffee jar', 'nestle-nescafe-classic-instant-coffee-jar-GiLd36DpKA77YH1w4JjIN5Z1xZDpCaEZPpHirOdI', '<p>Nestle Nescafe classic instant coffee jar</p>', NULL, NULL, 165.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(654, 1, 6, NULL, '0766', 'Nescafe classice pouch pack (container free)', 'nescafe-classice-pouch-pack-container-free-l6V2bUMZ2stRpWgslv8P7tCm8sqz4izZ0q4CM1Ol', '<p>Nescafe classice pouch pack (container free)</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(655, 1, 6, NULL, '0767', 'nestle coffee mate richer & creamer BIB', 'nestle-coffee-mate-richer-creamer-bib-2qZ0qpvfbDhx8VD8iGm0ooCZY1StD2BjZPOFE66O', '<p>nestle coffee mate richer &amp; creamer BIB</p>', NULL, NULL, 270.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(656, 1, 6, NULL, '0768', 'nestle coffee mate creamer', 'nestle-coffee-mate-creamer-amQzzBtwLSH24IVGDhNY2sBTOQK5zE9IBR0gPxsV', '<p>nestle coffee mate creamer</p>', NULL, NULL, 535.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(657, 1, 6, NULL, '0769', 'nescafe gold jar', 'nescafe-gold-jar-DWgak7hoAXaU5Xy8S8PVjgAaPS5LgesPiF67269C', '<p>nescafe gold jar</p>', NULL, NULL, 845.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(658, 1, 6, NULL, '0770', 'nescafe matinal jar', 'nescafe-matinal-jar-HMcf1K0xagniPg3BoseDuRWBtzGQcp2TQy3SS6oc', '<p>nescafe matinal jar</p>', NULL, NULL, 455.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(659, 1, 6, NULL, '0771', 'nescafe ipoh original white coffee', 'nescafe-ipoh-original-white-coffee-v83ly7ynNQvoZVHtRpnIewTBOfFiQGiI8kBsAFa2', '<p>nescafe ipoh original white coffee</p>', NULL, NULL, 625.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(660, 1, 6, NULL, '0772', 'nescafe singapore kopi C', 'nescafe-singapore-kopi-c-FgEqAvxAgnqzO81v2X8Se6KJQ1SKnR0dST6AbKbv', '<p>nescafe singapore kopi C</p>', NULL, NULL, 560.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(661, 1, 6, NULL, '0773', 'nestle nescafe creamy latte', 'nestle-nescafe-creamy-latte-Pui35xEpB8RQv5bgAgp328Mws42TcIsguCmyYbR9', '<p>nestle nescafe creamy latte</p>', NULL, NULL, 12.00, 0.00, 1, 100, NULL, NULL, 1, 1, NULL, '2021-10-31 10:10:22'),
(662, 1, 6, NULL, '0774', 'Nestea iced tea lemon', 'nestea-iced-tea-lemon-t45P3jQOmmDv44efI3jDMiksXfErsAd6N25sJZmp', '<p>Nestea iced tea lemon</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(663, 1, 6, NULL, '0775', 'Tora bika cappuccino', 'tora-bika-cappuccino-PMUFDauQ4VSFMeIYQCKfRXrol8yFCSN0ueZv1dMc', '<p>Tora bika cappuccino</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(664, 1, 6, NULL, '0776', 'Tora bika creamy latte', 'tora-bika-creamy-latte-OcWdHI4n6rUx3CWDVbljJsI9BKOKQaSJqdAyJpKM', '<p>Tora bika creamy latte</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(665, 1, 6, NULL, '0777', 'Kopico white mocca mocha coffee', 'kopico-white-mocca-mocha-coffee-WFoq98xxq3BpHc3LdyS1UPdCEtoj629DPxQXdJWD', '<p>Kopico white mocca mocha coffee</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(666, 1, 6, NULL, '0778', 'Mac coffee gold jar', 'mac-coffee-gold-jar-Nz2ABNua0XM8MMgJdG5zS4W6MnvPNpt9xtjFsVK2', '<p>Mac coffee gold jar</p>', NULL, NULL, 295.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(667, 1, 6, NULL, '0779', 'Mac coffee gold jar', 'mac-coffee-gold-jar-6wrx2omPThb4apusKPEXVJdYAHljRPY2P6MdMDJ4', '<p>Mac coffee gold jar</p>', NULL, NULL, 490.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(668, 1, 6, NULL, '0780', 'Mac coffee original jar', 'mac-coffee-original-jar-j0x0lc3woBwoQbTV57itUn7NqRXyKXyYOOAhkGOT', '<p>Mac coffee original jar</p>', NULL, NULL, 230.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(669, 1, 6, NULL, '0781', 'mac coffee coffee & creamer 2 in 1', 'mac-coffee-coffee-creamer-2-in-1-lYPOavvE6gU0JNz59gyTCqsWB7SOMYAXa3RvWQjf', '<p>mac coffee coffee &amp; creamer 2 in 1</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(670, 1, 6, NULL, '0782', 'Bru pure instant coffee jar', 'bru-pure-instant-coffee-jar-76zl8T3hTHfAWm1taA7BlDm1UBif59jtvuT2ywEO', '<p>Bru pure instant coffee jar</p>', NULL, NULL, 440.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(671, 1, 6, NULL, '0783', 'Bru pure instant coffee jar', 'bru-pure-instant-coffee-jar-JusiegucosskiTJpJsdFSIm6Nw1O28K8CzwjXobj', '<p>Bru pure instant coffee jar</p>', NULL, NULL, 754.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(672, 1, 6, NULL, '0784', 'Bru original coffee jar', 'bru-original-coffee-jar-WJAmWgbiM4UG2ZKwxgNKSWGpCsPfDrjFpHmpJakG', '<p>Bru original coffee jar</p>', NULL, NULL, 754.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(673, 1, 6, NULL, '0785', 'Bru original rich aromatic coffee jar', 'bru-original-rich-aromatic-coffee-jar-UoSVlPJx1e6Xjj8j3tI5jW1cQiswzBR5Ymgz2M16', '<p>Bru original rich aromatic coffee jar</p>', NULL, NULL, 440.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(674, 1, 6, NULL, '0786', 'Latina 100% Juich (Apple)', 'latina-100-juich-apple-K8pBOI1W3geXJmBtDTroLWtM3yoAq0iqLhEMkQom', '<p>Latina 100% Juich (Apple)</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(675, 1, 6, NULL, '0787', 'Latina 100% Juich (Orange)', 'latina-100-juich-orange-caIeXGlBosk7PAyPVu5Bf8NWEsVwEAPFNOZxi43q', '<p>Latina 100% Juich (Orange)</p>', NULL, NULL, 200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(676, 1, 6, NULL, '0788', 'Pran Drinko Litchi Juice', 'pran-drinko-litchi-juice-vlLQkhnbUh7B9c9Sl4D9pIxL6rBMTQWHPv4K1tSw', '<p>Pran Drinko Litchi Juice</p>', NULL, NULL, 30.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(677, 1, 6, NULL, '0789', 'pran apple fruit drink', 'pran-apple-fruit-drink-U0xp7mkhZKXzR63MEcjPk0dWLp2InopRx6Xe1VJt', '<p>pran apple fruit drink</p>', NULL, NULL, 30.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(678, 1, 6, NULL, '0790', 'pran frooto mango fruit drink', 'pran-frooto-mango-fruit-drink-OkFropgYkxlGua596bhdaurMSrTADqyQZELHVXYj', '<p>pran frooto mango fruit drink</p>', NULL, NULL, 25.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(679, 1, 6, NULL, '0791', 'pran frooto mango fruit drink', 'pran-frooto-mango-fruit-drink-TdrFM479B9LrULFdk4pKNGIMUdb9SggwgWQIcTOR', '<p>pran frooto mango fruit drink</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(680, 1, 6, NULL, '0792', 'pran frooto mango fruit drink', 'pran-frooto-mango-fruit-drink-eVFAOQXEPVWHeIP5SfNnGgO0p4x6I99cH6Is3FtZ', '<p>pran frooto mango fruit drink</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(681, 1, 6, NULL, '0793', 'shezan mango fruit drinks', 'shezan-mango-fruit-drinks-Y0coJn8mJKKui5cehzgII9S7l5K3lR5leyGFznUR', '<p>shezan mango fruit drinks</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(682, 1, 6, NULL, '0794', 'shezan mango juice', 'shezan-mango-juice-MbvYyqDUh732nxsHq1UQROl61to20WgHKmEDIn8j', '<p>shezan mango juice</p>', NULL, NULL, 22.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(683, 1, 6, NULL, '0795', 'sajeeb lichi flavored drink', 'sajeeb-lichi-flavored-drink-iXc01unzCCYwzxcmo0rs8Zq7ptBJOeo39nL2Qz90', '<p>sajeeb lichi flavored drink</p>', NULL, NULL, 12.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(684, 1, 6, NULL, '0796', 'sajeeb orange flavored drink', 'sajeeb-orange-flavored-drink-RSYwjzoqh7hI9kDREXuORXzcdMshPjwwzcao2uWT', '<p>sajeeb orange flavored drink</p>', NULL, NULL, 12.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(685, 1, 6, NULL, '0797', 'Masafi mango nectar juice', 'masafi-mango-nectar-juice-QXtOe1bfKH1Ji2iOgXV2P8kFltAx7z4DjoCoOEqD', '<p>Masafi mango nectar juice</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(686, 1, 6, NULL, '0798', 'Masafi apple juice', 'masafi-apple-juice-kWhjKdeZ4g8bZjlvmJBvmiBz16h2qG9GAtubMjQD', '<p>Masafi apple juice</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(687, 1, 6, NULL, '0799', 'Masafi Tropical Fruits Necter', 'masafi-tropical-fruits-necter-FZ3nq2VozCPcnghBFT0vZyKPDRpEUvNqeqYKNGgI', '<p>Masafi Tropical Fruits Necter</p>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(688, 1, 6, NULL, '0800', 'Aloe vera mango drink', 'aloe-vera-mango-drink-ryYNK8xyy9VF6ikzsLJAHAddMXKkWQnaz9SpBvK5', '<p>Aloe vera mango drink</p>', NULL, NULL, 235.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(689, 1, 6, NULL, '0801', 'Aloe vera prome drink', 'aloe-vera-prome-drink-ErFh1IlbwibWKac8A6OWJxfB1nVF46oah2t6oSxq', '<p>Aloe vera prome drink</p>', NULL, NULL, 235.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(690, 1, 6, NULL, '0802', 'Ocean spray cranberry classic juice', 'ocean-spray-cranberry-classic-juice-TVXLz3lLPax5TDFF3tfD3SSLrDcCiQ9hgvK8bmC7', '<p>Ocean spray cranberry classic juice</p>', NULL, NULL, 810.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(691, 1, 6, NULL, '0803', 'cocacola', 'cocacola-5ESyicR91QFXpBzOOyQYHvCG5yianaNh1D9N431J', '<p>cocacola</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(692, 1, 6, NULL, '0804', 'cocacola', 'cocacola-onDLS8oEkdXOHMGqa5IKLzRhl86Ikup50LTniIZC', '<p>cocacola</p>', NULL, NULL, 70.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(693, 1, 6, NULL, '0805', 'cocacola', 'cocacola-TDCzGyVftbjs8f0KlJP3lAXWBPgQ3lY3KwDocofd', '<p>cocacola</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(694, 1, 6, NULL, '0806', 'cocacola can', 'cocacola-can-7mrgfeVqPm1Kf4shkJltF9ibf3t94nJFbwJXnERf', '<p>cocacola can</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(695, 1, 6, NULL, '0807', 'cocacola classic', 'cocacola-classic-6hpuFY4njrHsruytrRuUlt9N7li1UrLVHGUiZoJq', '<p>cocacola classic</p>', NULL, NULL, 140.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(696, 1, 6, NULL, '0808', 'Sprite', 'sprite-QNSba5UHWyLoEhaKTnaLwDTEQvQao9rxngV8T1FK', '<p>Sprite</p>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(697, 1, 6, NULL, '0809', 'Sprite', 'sprite-y6DJnyIi14Gko7rsPvS4qwTpFIPsSCILGbchJPmA', '<p>Sprite</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(698, 1, 6, NULL, '0810', 'Sprite', 'sprite-3x3wJ9yMARgMMaNIQrzWVa4t5WtsfYSTQT8TzjgG', '<p>Sprite</p>', NULL, NULL, 35.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(699, 1, 6, NULL, '0811', 'sprite can', 'sprite-can-qbpqYjSepLMzYH0dDm7z28e1WgldDQ42uVa4rhIf', '<p>sprite can</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(700, 1, 6, NULL, '0812', '7up pet', '7up-pet-6z5Rdpkf1HT6lADOe8yWJ6lZBwZmLOtBooIqA87Z', '<p>7up pet</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(701, 1, 6, NULL, '0813', '7up pet', '7up-pet-qBnTzWBrWLrbwYSbHQAVMV0jTFFhWhZklBiKfYRM', '<p>7up pet</p>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(702, 1, 6, NULL, '0814', '7up can', '7up-can-mk6VdHhSpoE5om2HzA7R06utP9wMwTKcOHKIPsxJ', '<p>7up can</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(703, 1, 6, NULL, '0815', 'pepsi can', 'pepsi-can-q5UeAOFvBDbheWkVseQUqxGpdAzncmqOUCzZbNNM', '<p>pepsi can</p>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(704, 1, 6, NULL, '0816', 'clemon pet', 'clemon-pet-2jyZPs0PGQf5Q3g0IdUyiSrJUbx9K6X7TLGZ3PPm', '<p>clemon pet</p>', NULL, NULL, 28.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(705, 1, 6, NULL, '0817', 'clemon pet', 'clemon-pet-92ocUW8SQ7WqxAnGsrvq3behVyAz02GAvpSGyjte', '<p>clemon pet</p>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(706, 1, 6, NULL, '0818', 'pran up', 'pran-up-BhD0IdyApjyW5tal0N2adzXlevMw5KxxCNgBgT0Z', '<p>pran up</p>', NULL, NULL, 30.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(707, 1, 6, NULL, '0819', 'pran up', 'pran-up-nIUVdWvcK5aMdq72tES36TOMYTlvmfdykYkQhwQD', '<p>pran up</p>', NULL, NULL, 50.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(708, 1, 6, NULL, '0820', 'Frutica mango juice', 'frutica-mango-juice-qH3DQh6dcacJ01e3W1lagzSdqheCGpNFyyqYwznj', '<p>Frutica mango juice</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(709, 1, 6, NULL, '0821', 'Rooh Afza', 'rooh-afza-Igof6dxeFdeKceU7UgXRpgFEQqB3Nwc3jeylF938', '<p>Rooh Afza</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(710, 1, 6, NULL, '0822', 'Rooh Afza', 'rooh-afza-yNS76c83Pbq6MZtdtEabDmzipdegy0chVIzchC1W', '<p>Rooh Afza</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(711, 1, 6, NULL, '0823', 'Glaxos D pack', 'glaxos-d-pack-gIdx6LI0Lb8uvymbc98JTNG5sTUmA0OorS0OPQAq', '<p>Glaxos D pack</p>', NULL, NULL, 145.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(712, 1, 6, NULL, '0824', 'Glaxos D orange', 'glaxos-d-orange-r4ZGY0pofaR0x70ZHGg7tQXj3GLPTRUG314H0CBo', '<p>Glaxos D orange</p>', NULL, NULL, 155.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(713, 1, 6, NULL, '0825', 'Tang Mango powder', 'tang-mango-powder-KJhEbCV5PDNgX1pkbwLB2cmye58P9eek8L3GGUMr', '<p>Tang Mango powder</p>', NULL, NULL, 400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(714, 1, 6, NULL, '0826', 'Tang Lemon Powder', 'tang-lemon-powder-ZYekYsvGcu5LSunYlDwpF6P30faYPHNnqKVgIJdu', '<p>Tang Lemon Powder</p>', NULL, NULL, 400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(715, 1, 6, NULL, '0827', 'Tang orange pack', 'tang-orange-pack-PfT4gyevo6FmMLlRAJ39cu3RGZhxYTm51ZZFcATX', '<p>Tang orange pack</p>', NULL, NULL, 470.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(716, 1, 6, NULL, '0828', 'Tang mango jar', 'tang-mango-jar-q8GFa8TEdhZiuuGVq3Z4qRR6lgsrYhW2eSuX4kOz', '<p>Tang mango jar</p>', NULL, NULL, 615.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(717, 1, 6, NULL, '0829', 'Tang pineapple powder', 'tang-pineapple-powder-qZPcUXb73IEsdGKHypplYD2Jp7eacHHlVsP97JlJ', '<p>Tang pineapple powder</p>', NULL, NULL, 400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(718, 1, 6, NULL, '0830', 'Tang Tropical Coctail Powder', 'tang-tropical-coctail-powder-oZXJmZ2CJCbN2bCeYsvFl10DDgA4ssOMTUIhD0wW', '<p>Tang Tropical Coctail Powder</p>', NULL, NULL, 400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(719, 1, 6, NULL, '0831', 'Foster clarks Drink orange', 'foster-clarks-drink-orange-lagasZt50apQq4GxO5qWaian5HkL9iOfLX7xEToW', '<p>Foster clarks Drink orange</p>', NULL, NULL, 530.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(720, 1, 6, NULL, '0832', 'Foster clarks mandarin jar', 'foster-clarks-mandarin-jar-RigMVQL7HqshlIB3bumJXK5k5Jq1dOy7p3B1pSUo', '<p>Foster clarks mandarin jar</p>', NULL, NULL, 617.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(721, 1, 6, NULL, '0833', 'Foster clarks pineapple jar', 'foster-clarks-pineapple-jar-JVYp8PIK4SaIvrbdXhUsakSd7zKNQwZvYzYgKp9y', '<p>Foster clarks pineapple jar</p>', NULL, NULL, 530.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(722, 1, 6, NULL, '0834', 'forter clarks lemon instant flavoured drink', 'forter-clarks-lemon-instant-flavoured-drink-dxhHzRdviUfL5Oe4VVQriDN0IQEgCu2J0VvYlJnG', '<p>forter clarks lemon instant flavoured drink</p>', NULL, NULL, 530.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(723, 1, 6, NULL, '0835', 'Ispi Instant Powder drink (orange)', 'ispi-instant-powder-drink-orange-MHx22kCgkNb2sdwBgwZclZoSeAeKhevX2pjdGBV5', '<p>Ispi Instant Powder drink (orange)</p>', NULL, NULL, 190.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(724, 1, 6, NULL, '0836', 'Ispi Instant Powder drink (orange)', 'ispi-instant-powder-drink-orange-UezvdQTFahVn3RuhbuDAG9SLDOvlXqVXnrlURWxH', '<p>Ispi Instant Powder drink (orange)</p>', NULL, NULL, 105.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(725, 1, 6, NULL, '0837', 'Ispi soft Powder drink (mango)', 'ispi-soft-powder-drink-mango-Q2HsZoYDODFDt45hiHTnnZ5J3BO8a4SRpdWWlesP', '<p>Ispi soft Powder drink (mango)</p>', NULL, NULL, 190.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(726, 1, 6, NULL, '0838', 'ispi instant powder drink jar (orange)', 'ispi-instant-powder-drink-jar-orange-Ric3mExcBNzy5R8NE8VUw68hZBYdSaiUK49U0dZW', '<p>ispi instant powder drink jar (orange)</p>', NULL, NULL, 380.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(727, 1, 6, NULL, '0839', 'Almer Hand Sanitizer | 50ml', 'almer-hand-sanitizer-50ml-vv2Y1JLSoYCxxaJjpsFKixmlXkPxM2nQts01yWeS', '<ul>\r\n	<li>Almer Hand Sanitizer</li>\r\n	<li>kill 99% germ</li>\r\n	<li>protect from illness</li>\r\n</ul>', NULL, NULL, 160.00, 0.00, 1, 10, NULL, NULL, 0, 1, NULL, NULL),
(728, 1, 6, NULL, '0840', 'Lifebuoy Handwash Total Pump | 200 ml', 'lifebuoy-handwash-total-pump-200-ml-9ihX1vf2EsCLk0PAVPqQaeJ1pg7GkRkTzc12tWyA', '<ul>\r\n	<li>Product Type: Handwash</li>\r\n	<li>Brand: Lifebuoy</li>\r\n	<li>Capacity: 200ml</li>\r\n	<li>kill 99% gerrm in just 10 seconds</li>\r\n</ul>', NULL, NULL, 90.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(729, 1, 6, NULL, '0841', 'Lifebuoy Handwash Lemon Fresh Refill | 170 ml', 'lifebuoy-handwash-lemon-fresh-refill-170-ml-ur1ssUrqBru3sgtumpc4tuvb7kwtRpSyNTUPJSTE', '<ul>\r\n	<li>Product Type: Handwash Refeil Pack</li>\r\n	<li>Brand: Lifebuoy</li>\r\n	<li>Capacity: 200ml</li>\r\n</ul>', NULL, NULL, 60.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(730, 1, 6, NULL, '0842', 'ACI Savlon Active Handwash | 250 ml', 'aci-savlon-active-handwash-250-ml-SxSMXtRBXNSonzS9E8FoEuxr8s6bMVTEKCnpomtg', '<ul>\r\n	<li>Product Type: Handwash</li>\r\n	<li>Brand: Savlon</li>\r\n	<li>Capacity: 250 ml</li>\r\n</ul>', NULL, NULL, 90.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(731, 1, 6, NULL, '0843', 'ACI Savlon Antiseptic Handwash Ocean Blue Pump', 'aci-savlon-antiseptic-handwash-ocean-blue-pump-TI26oAD3XH6NVaqH8UEn7msneqKjpVFcC1NxaHtk', '<ul>\r\n	<li>Product Type: Handwash</li>\r\n	<li>Brand: Savlon</li>\r\n	<li>Capacity: 200ml</li>\r\n</ul>', NULL, NULL, 100.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(732, 1, 6, NULL, '0844', 'Hand Sanitizing Wipes |', 'hand-sanitizing-wipes-O2NbatuH7LoowudbBOHbrPF5jT3gssRhCi6KlrBg', '<ul>\r\n	<li>Help your family and those you care for kill germs on their hands with HIYAHand Sanitizing Wipes Using HIYA wipes is a convenient and gentle way to kill germs</li>\r\n	<li>HIYA hand sanitizing wipes are proven to kill 99.99 percent of most common germs that may cause illness, without damaging skin</li>\r\n	<li>Perfect for frequent use. HIYA wipes are formulated to be gentle on skin containing no harsh chemicals. Free of harsh preservatives, and does not contain dye, triclosan, parabens or phthalates</li>\r\n	<li>The 80Count travel pack fits just about anywhere making it convenient to take with you throughout the day while you are on-the-go</li>\r\n	<li>Case includes: 6 - 20 count HIYA Hand Sanitizing Wipes</li>\r\n</ul>', NULL, NULL, 280.00, 265.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(733, 1, 6, NULL, '0845', 'Bondhon Baby Wet Wipes (60 Pcs)', 'bondhon-baby-wet-wipes-60-pcs-5lRnGkWbgAZqzr9lw3ybk7GsE5XaYdTdVEMMU62g', '<p>***&nbsp;Bondhon Baby Wet Wipes</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, 110.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(734, 1, 6, NULL, '0846', 'Bondhon Baby Wet Wipes (120 pcs)', 'bondhon-baby-wet-wipes-120-pcs-uHIeBbiKBW1cD1VuI6X73uhys23BW0NuvTuB4jsh', '<p>***&nbsp;Bondhon Baby Wet Wipes (120 pcs)</p>', NULL, NULL, 175.00, 160.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(735, 1, 6, NULL, '0847', 'Bondhon Baby Wet Wipes (160 pcs)', 'bondhon-baby-wet-wipes-160-pcs-XMjzFOYu0NNCbSxkUz6IKAR5T7VWsdddfQ5JDOMr', '<p>***&nbsp;Bondhon Baby Wet Wipes (160 pcs)</p>', NULL, NULL, 220.00, 199.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(736, 1, 6, NULL, '0848', 'Hiya cotton Buds (240 pcs)', 'hiya-cotton-buds-240-pcs-dxd2NpmdSjRK9wBp4VMklVzplWRxJHJv1woBGtjA', '<p>Hiya cotton Bud (240 pcs)</p>\r\n\r\n<p>Best Quality cotton</p>\r\n\r\n<p>100% Pure cotton</p>', NULL, NULL, 75.00, 70.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(737, 1, 6, NULL, '0849', 'Hiya Baby cotton Bud (100 pcs)', 'hiya-baby-cotton-bud-100-pcs-Wgcwt0AxB8NSNb24LHojBIExfR9CYn2Kfb6m7Fb1', '<p>soft &amp; secure cotton buds</p>\r\n\r\n<p>100% pure cotton</p>', NULL, NULL, 15.00, 13.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(738, 1, 6, NULL, '0850', 'Baby cotton buds | 100 Pcs', 'baby-cotton-buds-100-pcs-wsxiKHhvOAIKpXOiBmbiBYIUHgQWLg51X1XHY8kp', '<p>100 % pure cotton</p>\r\n\r\n<p>safe &amp; secure for baby</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, 35.00, 32.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(739, 1, 6, NULL, '0851', 'Bondhon Baby Nipple', 'bondhon-baby-nipple-4RpGGfMq1YkDuo8MXqm6Np6j5AhMtpgUVpFpsqor', '<p>Best quality Nipples</p>', NULL, NULL, 35.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(740, 1, 6, NULL, '0852', 'Arla Dano Daily Pusti Milk Powder | 1 Kg', 'arla-dano-daily-pusti-milk-powder-1-kg-tRlAtl9jQ9yWTCwTu5g5g4mBCjTNprZkUrbqHYIr', '<ul>\r\n	<li>Product Type: Full Cream Milk Powder</li>\r\n	<li>Capacity: 1 Kg</li>\r\n	<li>Instant Full Cream Milk Powder</li>\r\n	<li>Premium Quality</li>\r\n	<li>No need to refrigerate</li>\r\n	<li>Simple, easy to use</li>\r\n	<li>Add water for instant use</li>\r\n	<li>Provides all the benefits of fresh full cream milk in convenient powder form</li>\r\n	<li>Useful for baking, ice-cream, desserts, etc</li>\r\n	<li>Creamy flavor</li>\r\n	<li>Packed with essential vitamins, minerals</li>\r\n	<li>Calcium</li>\r\n	<li>Vitamin D</li>\r\n	<li>Phosphorous</li>\r\n	<li>Potassium</li>\r\n	<li>Vitamin A &amp; B</li>\r\n	<li>Iodine</li>\r\n</ul>', NULL, NULL, 450.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(741, 1, 6, NULL, '0853', 'Chicken Egg (Layer) | 12 Pcs', 'chicken-egg-layer-12-pcs-ykDosfjspx0UkoRuHK0pe7ntBSISjdqWwL4ynqUh', '<p>Chicken egg (Layer)</p>\r\n\r\n<p>*Big size egg</p>', NULL, NULL, 100.00, 90.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(742, 1, 6, NULL, '0854', 'Mustard oil | organic 1 Ltr', 'mustard-oil-organic-1-ltr-HBSTY6i0HGtbBk1OD7If1JTVHGnRqjO4B8hbMNDA', '<p>Mustard oil&nbsp;</p>\r\n\r\n<p>100% pure and organic</p>', NULL, NULL, 240.00, 210.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(743, 1, 6, NULL, '0855', 'Marks gold high calcium low fat milk powder for 40+ yrs', 'marks-gold-high-calcium-low-fat-milk-powder-for-40-yrs-qXKBczCwwsDYcAcDVhsZ5VVKTYP2NRw1pilSMpTT', '<p>Marks gold high calcium low fat milk powder for 40+ yrs</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(744, 1, 6, NULL, '0856', 'marks milk based diabetic diet', 'marks-milk-based-diabetic-diet-RTO6M2RQFgkiayB39lrt3h1Y1jAT3xuu2xqXHrBB', '<p>marks milk based diabetic diet</p>', NULL, NULL, 600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(745, 1, 6, NULL, '0857', 'marks active school milk powder', 'marks-active-school-milk-powder-YT2QtfR0c2uPcldvzGpqxbHvLDICpM8yaXO9qxzH', '<p>marks active school milk powder</p>', NULL, NULL, 330.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(746, 1, 6, NULL, '0858', 'Marks active school 2 in 1 chocolate milk powder', 'marks-active-school-2-in-1-chocolate-milk-powder-fXK21lhbfXWS2qovxFW4DADTm6zC3lxqttMX9Bgf', '<p>Marks active school 2 in 1 chocolate milk powder</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(747, 1, 6, NULL, '0859', 'Marks full cream milk powder', 'marks-full-cream-milk-powder-Tq5sJSVu1l9hGGArJhAVVR8VwMBEpJ5vv7xng0On', '<p>Marks full cream milk powder</p>', NULL, NULL, 580.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(748, 1, 6, NULL, '0860', 'Marks diet low fat milk powder', 'marks-diet-low-fat-milk-powder-KITccJZuSLiZ5GF5wVoTX3RCZByEYzMLZYEshp92', '<p>Marks diet low fat milk powder</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(749, 1, 6, NULL, '0861', 'Pran full cream milk powder', 'pran-full-cream-milk-powder-DbjunOR4uZGCWHfgvDiNmrfPi0JAlU76Au9McgtB', '<p>Pran full cream milk powder</p>', NULL, NULL, 520.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(750, 1, 6, NULL, '0862', 'Meril Baby Shampoo', 'meril-baby-shampoo-y3rbB4UYb5j7VeKeHVdbn1aIUi0G9LZD3B0fFUzA', '<p>Meril Baby Shampoo</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(751, 1, 6, NULL, '0863', 'Meril Baby Olive Oil', 'meril-baby-olive-oil-NywiLYN1ojAM1WKQX44KXfu5nKbsjzPNqjxEQbyn', '<p>Meril Baby Olive Oil</p>', NULL, NULL, 210.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(752, 1, 6, NULL, '0864', 'Meril Baby Lotion', 'meril-baby-lotion-obSMG477xHIBSQWo3W0cKuS9ddOvGa1iWoDtN92k', '<p>Meril Baby Lotion</p>', NULL, NULL, 230.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(753, 1, 6, NULL, '0865', 'Meril Baby Mild Honey Soap', 'meril-baby-mild-honey-soap-0zbJJlYOLonpE01rzerBldhdUgX3g9jhHOSa3Kp3', '<p>Meril Baby Mild Honey Soap</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(754, 1, 6, NULL, '0866', 'Johnson\'s Baby Original Baby Softness Lotion', 'johnsons-baby-original-baby-softness-lotion-1WEIH2mDvzKPqsrIDfdrhbBnuBJNAsRI8Bia91j7', '<p>Johnson&#39;s Baby Original Baby Softness Lotion</p>', NULL, NULL, 330.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(755, 1, 6, NULL, '0867', 'Johnson\'s Baby Shampoo', 'johnsons-baby-shampoo-IqvnNtYi9REaGdi7pddhorsGBKkAQMHJgG31EqfB', '<p>Johnson&#39;s Baby Shampoo</p>', NULL, NULL, 325.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(756, 1, 6, NULL, '0868', 'Johnson\'s Baby Blossoms Soap', 'johnsons-baby-blossoms-soap-tlx8nyu0fQmYd7eFrjxJhVw0bNrmWIB6RFueAL6K', '<p>Johnson&#39;s Baby Blossoms Soap</p>', NULL, NULL, 100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(757, 1, 6, NULL, '0869', 'Johnson\'s Baby Oil', 'johnsons-baby-oil-A304EwQ3THs2OLSybAGGnNrfS7flkDLUTXFJAYZU', '<p>Johnson&#39;s Baby Oil</p>', NULL, NULL, 325.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(758, 1, 6, NULL, '0870', 'Johnson\'s Baby Soap', 'johnsons-baby-soap-zy5JWz0gK8fWj8DhtnkJOxsalRt1Qlbj6UtkOJy6', '<p>Johnson&#39;s Baby Soap</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(759, 1, 6, NULL, '0871', 'Johnson\'s Baby 24 Hour Moisture Lotion', 'johnsons-baby-24-hour-moisture-lotion-hEz0h0eGuNe6tZZNMiFmZhAkkcK4YRf8zybZagmm', '<p>Johnson&#39;s Baby 24 Hour Moisture Lotion</p>', NULL, NULL, 300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(760, 1, 6, NULL, '0872', 'Johnson\'s Baby Milk + Rice Cream', 'johnsons-baby-milk-rice-cream-YCqGlQp2OGihtaIYPkFjgGrgYzO8ZV1KXKoliRxd', '<p>Johnson&#39;s Baby Milk + Rice Cream</p>', NULL, NULL, 320.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(761, 1, 6, NULL, '0873', 'Johnson\'s Baby Bath Milk + Rice', 'johnsons-baby-bath-milk-rice-pC0VheQnez0udwYTVyZ6Ko11rXEcmlE3soHdRlxR', '<p>Johnson&#39;s Baby Bath Milk + Rice</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(762, 1, 6, NULL, '0874', 'Johnson\'s Baby Powder', 'johnsons-baby-powder-Mv0vWO6azLUsqmuxEzu2A1yqSJZNOJnd0bnIaI1u', '<p>Johnson&#39;s Baby Powder</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(763, 1, 6, NULL, '0875', 'Johnson\'s Baby Hair Oil', 'johnsons-baby-hair-oil-Q2Ffd1IjI2HW8DnReo5O6JS7t4amKGCoh3oaZYjQ', '<p>Johnson&#39;s Baby Hair Oil</p>', NULL, NULL, 325.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(764, 1, 6, NULL, '0876', 'Johnson\'s Baby Jelly Lightly Fragranced', 'johnsons-baby-jelly-lightly-fragranced-fAYRjRXl1Rlinvaz3niJBE4VuCqO7llqDkyqwAsX', '<p>Johnson&#39;s Baby Jelly Lightly Fragranced</p>', NULL, NULL, 495.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(765, 1, 6, NULL, '0877', 'Johnson\'s Blossoms Baby Powder', 'johnsons-blossoms-baby-powder-Pm3an2dx39M5PaDLAUxk64FsOJPrYzYCEkVwnMeM', '<p>Johnson&#39;s Blossoms Baby Powder</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(766, 1, 6, NULL, '0878', 'Johnson\'s Baby Jelly Lightly Fragranced', 'johnsons-baby-jelly-lightly-fragranced-Ax0wkpcxiWGZCwLa56l0ocYpM1ohS5scebnSJGe6', '<p>Johnson&#39;s Baby Jelly Lightly Fragranced</p>', NULL, NULL, 335.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(767, 1, 6, NULL, '0879', 'Johnson\'s Top To Toe Baby Wash', 'johnsons-top-to-toe-baby-wash-hSYnfsEjiLz9FdMXtJGJ3XD9GBfdEpBE6BojHtFJ', '<p>Johnson&#39;s Top To Toe Baby Wash</p>', NULL, NULL, 240.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(768, 1, 6, NULL, '0880', 'Dove Baby Rich Moisture Lotion', 'dove-baby-rich-moisture-lotion-OXpR3qK72RkyOMdph0qNMuyBsL3pLYPJoV25daF6', '<p>Dove Baby Rich Moisture Lotion</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(769, 1, 6, NULL, '0881', 'Dove Baby Sensitive Moisture Lotion', 'dove-baby-sensitive-moisture-lotion-ezu1pKgOXyYj3wpAc4e1GmROsWIBk2f3xzIqZaDk', '<p>Dove Baby Sensitive Moisture Lotion</p>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL);
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `subcategory_id`, `product_code`, `name`, `slug`, `product_details`, `short_description`, `specification`, `unit_price`, `discount_price`, `stock_status`, `quantity`, `special_note`, `video_link`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(770, 1, 6, NULL, '0882', 'Parachute Just for Baby - Baby Lotion', 'parachute-just-for-baby-baby-lotion-nXvLZtL2Y7CkmTolwFe2uLk9UmhFN6otKLlD7juL', '<p>Parachute Just for Baby - Baby Lotion</p>', NULL, NULL, 250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(771, 1, 6, NULL, '0883', 'Parachute Just for Baby - Baby Oil', 'parachute-just-for-baby-baby-oil-esByFV3w1j4ZyufbaGAdun0wSQ2erD0gMmNLZmXj', '<p>Parachute Just for Baby - Baby Oil</p>', NULL, NULL, 320.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(772, 1, 6, NULL, '0884', 'Parachute Just for Baby - Baby Powder', 'parachute-just-for-baby-baby-powder-54t5O97SuECgRdFFCPmRxPgdV5RJP4YgmCzdO5h4', '<p>Parachute Just for Baby - Baby Powder</p>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(773, 1, 6, NULL, '0885', 'Parachute Just for Baby - Baby Soap', 'parachute-just-for-baby-baby-soap-Rj2H1uk1Q5w5OSrclsWWLjMloHJY62n8N4ra6I96', '<p>Parachute Just for Baby - Baby Soap</p>', NULL, NULL, 115.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(774, 1, 6, NULL, '0886', 'Parachute Just for Baby Baby Soap Combo', 'parachute-just-for-baby-baby-soap-combo-GVOqiJf12NEMRuRA6FqtPGxEfM381dexqiLFEyY6', '<p>Parachute Just for Baby Baby Soap Combo</p>', NULL, NULL, 225.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(775, 1, 6, NULL, '0887', 'Pampers Baby Dry Pants Diaper Pant - 36 pcs', 'pampers-baby-dry-pants-diaper-pant-36-pcs-8pCJDqP7ufxYnIWG22lw2s2MIHT6WWgE43B0gpvE', '<p>Pampers Baby Dry Pants Diaper Pant - 36 pcs</p>', NULL, NULL, 1499.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(776, 1, 6, NULL, '0888', 'Pampers Baby Dry Pants Diaper Pant  L 9-14 kg', 'pampers-baby-dry-pants-diaper-pant-l-9-14-kg-s9EbI0TCknnP0O0kzN0AwAv82D9TqitaHAGfm6j4', '<p>Pampers Baby Dry Pants Diaper Pant L 9-14 kg</p>', NULL, NULL, 1499.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(777, 1, 6, NULL, '0889', 'Pampers Baby Dry Pants Diaper Pant M 7-12 kg', 'pampers-baby-dry-pants-diaper-pant-m-7-12-kg-UysvbmjmM8i4SOkjMkbvjoICkGE8xNOUYCX7p4pP', '<p>Pampers Baby Dry Pants Diaper Pant M 7-12 kg</p>', NULL, NULL, 1499.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(778, 1, 6, NULL, '0890', 'Pampers Baby Dry Pants Diaper Pant XXL 15-25 kg', 'pampers-baby-dry-pants-diaper-pant-xxl-15-25-kg-NI3c6VdnFaxyHouVfIWE3J5tC3M2akSnPcnCwfhy', '<p>Pampers Baby Dry Pants Diaper Pant XXL 15-25 kg</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(779, 1, 6, NULL, '0891', 'Pampers Baby Dry Diaper Belt XL 11-16 kg', 'pampers-baby-dry-diaper-belt-xl-11-16-kg-309BWHO1hMITls9hEZBxjawRPrelEEKd7Rx0rzeu', '<p>Pampers Baby Dry Diaper Belt XL 11-16 kg</p>', NULL, NULL, 1500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(780, 1, 6, NULL, '0892', 'Pampers Baby Diaper Belt L 10-15 kg', 'pampers-baby-diaper-belt-l-10-15-kg-Hes2x5nGsJp2gBk3yAUVtnt3v4Pd9h5MlES5xjqM', '<p>Pampers Baby Diaper Belt L 10-15 kg</p>', NULL, NULL, 1600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(781, 1, 6, NULL, '0893', 'Pampers Baby Dry Size 4 Jumbo Plus Pack Pants 9-15 kg', 'pampers-baby-dry-size-4-jumbo-plus-pack-pants-9-15-kg-hoGhQABrNQbLpaIlIZ52F2dfyHBYDZj14JS05Ckr', '<p>Pampers Baby Dry Size 4 Jumbo Plus Pack Pants 9-15 kg</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(782, 1, 6, NULL, '0894', 'Pampers Baby Dry Pants Diaper Pant New born upto 5 kg', 'pampers-baby-dry-pants-diaper-pant-new-born-upto-5-kg-vNdIMB9zA9Vp3Xexi88mjw0cMV4os9KlLeh7S0Tx', '<p>Pampers Baby Dry Pants Diaper Pant New born upto 5 kg</p>', NULL, NULL, 1500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(783, 1, 6, NULL, '0895', 'ampers Baby Dry Size 6 Jumbo Plus Pack Pants 15+ kg', 'ampers-baby-dry-size-6-jumbo-plus-pack-pants-15-kg-7fhD1QAblNC6idhJyRFSz1CtyiOFDGPZmsu0CYcR', '<p>ampers Baby Dry Size 6 Jumbo Plus Pack Pants 15+ kg</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(784, 1, 6, NULL, '0896', 'Pampers Baby Dry Pants Diaper Pant 17+ kg', 'pampers-baby-dry-pants-diaper-pant-17-kg-GhgKgIyeJCShuTsCTRAWJN8VFVabZi4m4wcjrXiv', '<p>Pampers Baby Dry Pants Diaper Pant 17+ kg</p>', NULL, NULL, 2000.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(785, 1, 6, NULL, '0897', 'Pampers Baby Dry Size 5 Essential Pack Pants - 33 pcs', 'pampers-baby-dry-size-5-essential-pack-pants-33-pcs-0X8ddZTPcte9jn5kX3Ma1FSg5OcDuvV4hSQmqHmV', '<p>Pampers Baby Dry Size 5 Essential Pack Pants - 33 pcs</p>', NULL, NULL, 1600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(786, 1, 6, NULL, '0898', 'Pampers Baby Dry Size 2 Jumbo Plus Pack Belt 4-8 kg', 'pampers-baby-dry-size-2-jumbo-plus-pack-belt-4-8-kg-GPFohSBNrsxVLOyB4zoLrC3owbKuSqrmL4kuBIcm', '<p>Pampers Baby Dry Size 2 Jumbo Plus Pack Belt 4-8 kg</p>', NULL, NULL, 2100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(787, 1, 6, NULL, '0899', 'Pampers Baby Dry Size 5 Jumbo Plus Pack Belt - 72 pcs', 'pampers-baby-dry-size-5-jumbo-plus-pack-belt-72-pcs-PsJP1TTFvlezehjWwKsTsB5Fugss47z9EZ6xCam4', '<p>Pampers Baby Dry Size 5 Jumbo Plus Pack Belt - 72 pcs</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(788, 1, 6, NULL, '0900', 'Pampers Baby Dry Size 8 Jumbo Plus Pack Belt - 52pcs', 'pampers-baby-dry-size-8-jumbo-plus-pack-belt-52pcs-wLp6kFX5wq1xhwO3kAWfhtZzFvkDMYiyoxtGXzfA', '<p>Pampers Baby Dry Size 8 Jumbo Plus Pack Belt - 52pcs</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(789, 1, 6, NULL, '0901', 'Pampers Baby Dry Size 1 Jumbo Plus Pack Belt - 72 pcs', 'pampers-baby-dry-size-1-jumbo-plus-pack-belt-72-pcs-zIwRMSv5KdYXkLN1PCBWgGQ5DHMtZgBR2gtzwR4A', '<p>Pampers Baby Dry Size 1 Jumbo Plus Pack Belt - 72 pcs</p>', NULL, NULL, 2100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(790, 1, 6, NULL, '0902', 'Pampers Baby Dry Size 4 Essential Pack Pants - 38 pcs', 'pampers-baby-dry-size-4-essential-pack-pants-38-pcs-Eb4OGENITpmg6loHUnCT6yz150ysUlcaa1HZSAQA', '<p>Pampers Baby Dry Size 4 Essential Pack Pants - 38 pcs</p>', NULL, NULL, 1600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(791, 1, 6, NULL, '0903', 'Pampers Baby Dry Size 3 Essential Pack Pants - 44 pcs', 'pampers-baby-dry-size-3-essential-pack-pants-44-pcs-jPe0LoTr9DDyMoz37512BWjPqmXzFbd2FM7INSsl', '<p>Pampers Baby Dry Size 3 Essential Pack Pants - 44 pcs</p>', NULL, NULL, 1600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(792, 1, 6, NULL, '0904', 'Pampers Baby Dry Size 3 Jumbo Plus Pack Pants - 80 pcs', 'pampers-baby-dry-size-3-jumbo-plus-pack-pants-80-pcs-rNghtn30v6JBSRthxW2jewmWGiKHqBxexLu3p5ed', '<p>Pampers Baby Dry Size 3 Jumbo Plus Pack Pants - 80 pcs</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(793, 1, 6, NULL, '0905', 'Pampers Baby Dry Pants Diaper Pant - 76 pcs', 'pampers-baby-dry-pants-diaper-pant-76-pcs-YA6olMZXUeHCsnw4XaDbO6VGklDnEBAoPevaeeHV', '<p>Pampers Baby Dry Pants Diaper Pant - 76 pcs</p>', NULL, NULL, 2100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(794, 1, 6, NULL, '0906', 'Pampers Baby Dry Size 6 Jumbo Plus Pack Belt - 62 pcs', 'pampers-baby-dry-size-6-jumbo-plus-pack-belt-62-pcs-9Mm2x9FJoqkwbQaeyIsxCaCBh94MLTV5Br3h1Rkw', '<p>Pampers Baby Dry Size 6 Jumbo Plus Pack Belt - 62 pcs</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(795, 1, 6, NULL, '0907', 'Huggies Baby Diaper Ultra Belt - 40pcs', 'huggies-baby-diaper-ultra-belt-40pcs-Mcw7quw6dL1uBB648lXyh2qyqFAh5MusRT0AOFND', '<p>Huggies Baby Diaper Ultra Belt - 40pcs</p>', NULL, NULL, 1700.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(796, 1, 6, NULL, '0908', 'Huggies Baby Diaper Ultra Belt - 34 pcs', 'huggies-baby-diaper-ultra-belt-34-pcs-QyEOicDcXkimF9wv1jS8AWPaNdX5OHa2Hr1A2wI9', '<p>Huggies Baby Diaper Ultra Belt - 34 pcs</p>', NULL, NULL, 1660.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(797, 1, 6, NULL, '0909', 'Huggies Baby Diaper Ultra Belt - 44 pcs', 'huggies-baby-diaper-ultra-belt-44-pcs-CEab7rXMkfnR7XCrA9RHjUtNUDRMnXe4AQtdn4wm', '<p>Huggies Baby Diaper Ultra Belt - 44 pcs</p>', NULL, NULL, 1600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(798, 1, 6, NULL, '0910', 'Huggies Dry Baby Diaper Belt - 30 pcs', 'huggies-dry-baby-diaper-belt-30-pcs-CHWGETc8aNzvscbHP2Goq3iTIaKpSmTpfdMfCnur', '<p>Huggies Dry Baby Diaper Belt - 30 pcs</p>', NULL, NULL, 850.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(799, 1, 6, NULL, '0911', 'Huggies Dry Baby Diaper Belt  - 30 pcs', 'huggies-dry-baby-diaper-belt-30-pcs-IAS9NDV6rDMsyll8A08eWAJ1EWMWZBHKdqs9lTLv', '<p>Huggies Dry Baby Diaper Belt &nbsp;- 30 pcs</p>', NULL, NULL, 880.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(800, 1, 6, NULL, '0912', 'Huggies Baby Diaper Dry Belt - 36 pcs', 'huggies-baby-diaper-dry-belt-36-pcs-8sOgpSI0gxcHjDkTh4WpGiA8RymwwHoEVMSEBox4', '<p>Huggies Baby Diaper Dry Belt - 36 pcs&nbsp;</p>', NULL, NULL, 850.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(801, 1, 6, NULL, '0913', 'Huggies Baby Diaper WonderPants Pant - 42 pcs', 'huggies-baby-diaper-wonderpants-pant-42-pcs-KzVL0WvQHdzYrO2SENmtChWB7eeg84RyD0rIKn0O', '<p>Huggies Baby Diaper WonderPants Pant - 42 pcs</p>', NULL, NULL, 1120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(802, 1, 6, NULL, '0914', 'Huggies Baby Diaper WonderPants Pant - 24 pcs', 'huggies-baby-diaper-wonderpants-pant-24-pcs-X6bp8KOqfjw7E5juqYebaG3Q0Q6iCN86Rnvzeioi', '<p>Huggies Baby Diaper WonderPants Pant - 24 pcs</p>', NULL, NULL, 1160.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(803, 1, 6, NULL, '0915', 'Huggies Baby Diaper WonderPants Pant - 46 pcs', 'huggies-baby-diaper-wonderpants-pant-46-pcs-vPQbu4WaD8J0cNYF0xXwAC5qGDjxBmMTNC7BC0KE', '<p>Huggies Baby Diaper WonderPants Pant - 46 pcs</p>', NULL, NULL, 1520.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(804, 1, 6, NULL, '0916', 'Huggies Baby Diaper WonderPants Pant - 38 pcs', 'huggies-baby-diaper-wonderpants-pant-38-pcs-z0PjTw7KIRwipawestxopAM4rWCd6zxnpLOKJIYI', '<p>Huggies Baby Diaper WonderPants Pant - 38 pcs</p>', NULL, NULL, 1380.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(805, 1, 6, NULL, '0917', 'Huggies Baby Diaper WonderPants Pant - 54 pcs', 'huggies-baby-diaper-wonderpants-pant-54-pcs-cBGQUMDWUcPYRv6K1G9oFDvhtRysPECfRwrrc1nC', '<p>Huggies Baby Diaper WonderPants Pant - 54 pcs</p>', NULL, NULL, 1595.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(806, 1, 6, NULL, '0918', 'Huggies Baby Diaper WonderPants Pant - 38 pcs', 'huggies-baby-diaper-wonderpants-pant-38-pcs-cAVZau9lX5AaKvejiwX9lhZXhMIXodoc5FM4UjBl', '<p>Huggies Baby Diaper WonderPants Pant - 38 pcs</p>', NULL, NULL, 1120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(807, 1, 6, NULL, '0919', 'Huggies Baby Diaper WonderPants Pant  - 28 pcs', 'huggies-baby-diaper-wonderpants-pant-28-pcs-hOWNQLS150VtuipaHGevtnPHHHiHdjR1glJCHrVs', '<p>Huggies Baby Diaper WonderPants Pant &nbsp;- 28 pcs</p>', NULL, NULL, 1030.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(808, 1, 6, NULL, '0920', 'Huggies Dry Baby Belt Diaper - 60 pcs', 'huggies-dry-baby-belt-diaper-60-pcs-lo1LRIIA0h5cC9wPkw8yhAgKtXxj1xTviLkK5Y4b', '<p>Huggies Dry Baby Belt Diaper - 60 pcs</p>', NULL, NULL, 1500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(809, 1, 6, NULL, '0921', 'Huggies Dry Baby Diaper Belt - 60 pcs', 'huggies-dry-baby-diaper-belt-60-pcs-Bf1d61yCymgyeNNWaKYhAlhCImLQC1tGPPVdGzMI', '<p>Huggies Dry Baby Diaper Belt - 60 pcs</p>', NULL, NULL, 1570.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(810, 1, 6, NULL, '0922', 'Huggies Dry Baby Diaper Belt - 72 pcs', 'huggies-dry-baby-diaper-belt-72-pcs-5PaOzQwN8Vog7Evl2BYuHnlkzxLl2uXpYcKIEo0I', '<p>Huggies Dry Baby Diaper Belt - 72 pcs</p>', NULL, NULL, 1500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(811, 1, 6, NULL, '0923', 'Huggies Dry Pants Baby Diaper Pant - 50 pcs', 'huggies-dry-pants-baby-diaper-pant-50-pcs-Ehg2DYRjNYXLSwCl7EepZQRKsYQbAenD3KxJaLY8', '<p>Huggies Dry Pants Baby Diaper Pant - 50 pcs</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(812, 1, 6, NULL, '0924', 'Huggies Dry Pants Baby Diaper Pant - 42 pcs', 'huggies-dry-pants-baby-diaper-pant-42-pcs-rvGafdp9xG634KNswjWgnkfJA5yI5Y9lR1Jcsxgq', '<p>Huggies Dry Pants Baby Diaper Pant - 42 pcs</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(813, 1, 6, NULL, '0925', 'Huggies Dry Pants Baby Diaper Pant  - 60 pcs', 'huggies-dry-pants-baby-diaper-pant-60-pcs-pZ6u00UCta1z1IWCkU5GQ6k0yJofSBtEUyQdEkiv', '<p>Huggies Dry Pants Baby Diaper Pant &nbsp;- 60 pcs</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(814, 1, 6, NULL, '0926', 'Huggies Dry Baby Diaper Belt - 48 pcs', 'huggies-dry-baby-diaper-belt-48-pcs-8DImjfJAyaBIIBbDl7YIe9abH08s6DVWmEcr2mOf', '<p>Huggies Dry Baby Diaper Belt - 48 pcs</p>', NULL, NULL, 1500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(815, 1, 6, NULL, '0927', 'Huggies Dry Pants Baby Diaper Pant - 66 pcs', 'huggies-dry-pants-baby-diaper-pant-66-pcs-eICYeSvzme1y3M9ocTEbqiViQRTGrqo3omU5ayxx', '<p>Huggies Dry Pants Baby Diaper Pant - 66 pcs</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(816, 1, 6, NULL, '0928', 'Huggies Gold Diaper Ultra Pants Boys & Girls - 38 pcs', 'huggies-gold-diaper-ultra-pants-boys-girls-38-pcs-wRclusAhLGgsGA5jlBCLcX4iFz6cMMucjK03tNpF', '<p>Huggies Gold Diaper Ultra Pants Boys &amp; Girls - 38 pcs</p>', NULL, NULL, 1800.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(817, 1, 6, NULL, '0929', 'Huggies Dry Pants Baby Diaper (Pant ) - 32 pcs', 'huggies-dry-pants-baby-diaper-pant-32-pcs-TljPgfu1Xu1CFCKtVs4SUThN2MOL3t6NrKEJEMIX', '<p>Huggies Dry Pants Baby Diaper (Pant ) - 32 pcs</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(818, 1, 6, NULL, '0930', 'Huggies Dry Baby Diaper New Born Belt - 64 pcs', 'huggies-dry-baby-diaper-new-born-belt-64-pcs-4nSMZC6UtsE1X2zUMICQEU0Q9zG2F8TbLCIs0OCa', '<p>Huggies Dry Baby Diaper New Born Belt - 64 pcs</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(819, 1, 6, NULL, '0931', 'Huggies Baby Diaper Ultra New Born Belt - 48 pcs', 'huggies-baby-diaper-ultra-new-born-belt-48-pcs-SR5HEaifp9EUhCVNLtxZ76DJ3usqfPGM7iR6yKOL', '<p>Huggies Baby Diaper Ultra New Born Belt - 48 pcs</p>', NULL, NULL, 1600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(820, 1, 6, NULL, '0932', 'Huggies Dry Pants Baby Diaper Belt - 40 pcs', 'huggies-dry-pants-baby-diaper-belt-40-pcs-Ul0eCLAvgDgRNiR4eN4MsB4tVUMC2nuif4c0EYmU', '<p>Huggies Dry Pants Baby Diaper Belt - 40 pcs</p>', NULL, NULL, 1600.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(821, 1, 6, NULL, '0933', 'Huggies Baby Diaper Ultra Belt - 30 pcs', 'huggies-baby-diaper-ultra-belt-30-pcs-2aVnJLSWjXOndM7hgyE4hQFQkwfEPSWqIh8cc5lg', '<p>Huggies Baby Diaper Ultra Belt - 30 pcs</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(822, 1, 6, NULL, '0934', 'MamyPoko Pants Diaper Pant - 36 pcs', 'mamypoko-pants-diaper-pant-36-pcs-l1BJ7ovnV6BaZP2W77wknbfV0dbxTA6yl3QGMj8v', '<p>MamyPoko Pants Diaper Pant - 36 pcs</p>', NULL, NULL, 1200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(823, 1, 6, NULL, '0935', 'MamyPoko Pants Diaper Pant - 42 pcs', 'mamypoko-pants-diaper-pant-42-pcs-19qKs352Fn2IUBmdh1CTtNlcAv6RFJfigOyYYFb9', '<p>MamyPoko Pants Diaper Pant - 42 pcs</p>', NULL, NULL, 1200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(824, 1, 6, NULL, '0936', 'MamyPoko Pants Diaper Pant - 52 pcs', 'mamypoko-pants-diaper-pant-52-pcs-o61jceQ8cMMRTIxDdYZUDBc7pAr4j90Azrss61oD', '<p>MamyPoko Pants Diaper Pant - 52 pcs</p>', NULL, NULL, 1200.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(825, 1, 6, NULL, '0937', 'MamyPoko Pants Diaper Pant - 44 pcs', 'mamypoko-pants-diaper-pant-44-pcs-JUuv7uXF2No5dkzKJP1epYdGSRVADKPKiSDNrklB', '<p>MamyPoko Pants Diaper Pant - 44 pcs</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(826, 1, 6, NULL, '0938', 'MamyPoko Pants Diaper Pant - 32 pcs', 'mamypoko-pants-diaper-pant-32-pcs-2KnJvnvxMwkzNHQgI5Ap6vMSyKMbnMGhqE0hMJku', '<p>MamyPoko Pants Diaper Pant - 32 pcs</p>', NULL, NULL, 1100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(827, 1, 6, NULL, '0939', 'MamyPoko Pants Diaper (Pant) - 22 pcs', 'mamypoko-pants-diaper-pant-22-pcs-2RfrdGEEHUlXawItIdXUg7P3eTquQjyZWltsf7mC', '<p>MamyPoko Pants Diaper (Pant) - 22 pcs</p>', NULL, NULL, 1080.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(828, 1, 6, NULL, '0940', 'MamyPoko Pants Diaper Boys Pant - 64 pcs', 'mamypoko-pants-diaper-boys-pant-64-pcs-BUAjCPmMMejYEqmK6e6zC49UrVEvFgSjW0n7h01n', '<p>MamyPoko Pants Diaper Boys Pant - 64 pcs</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(829, 1, 6, NULL, '0941', 'MamyPoko Pants Diaper Pant Boys - 52 pcs', 'mamypoko-pants-diaper-pant-boys-52-pcs-GsOyhRdt95udnGZYvUK4U2fFMS8xcCu1z2RrxH8e', '<p>MamyPoko Pants Diaper Pant Boys - 52 pcs</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(830, 1, 6, NULL, '0942', 'MamyPoko Pants Diaper Pant - 58 pcs', 'mamypoko-pants-diaper-pant-58-pcs-kRAXaHGPUW2m1TEkfYCMwTMPkL5xvbOjC5DsvHtV', '<p>MamyPoko Pants Diaper Pant - 58 pcs</p>', NULL, NULL, 1400.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(831, 1, 6, NULL, '0943', 'MamyPoko Pants Boys Diaper Pant - 46 pcs', 'mamypoko-pants-boys-diaper-pant-46-pcs-66N1JF2Qe4BB2JPTULIoAz0tNqelnjwT9joYsqpm', '<p>MamyPoko Pants Boys Diaper Pant - 46 pcs</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(832, 1, 6, NULL, '0944', 'MamyPoko Pants Baby Diaper Pant Girls - 38 pcs', 'mamypoko-pants-baby-diaper-pant-girls-38-pcs-53mDPKADUvZQQteGNuEU09IHY1iq4mkuCmCT0cl6', '<p>MamyPoko Pants Baby Diaper Pant Girls - 38 pcs</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(833, 1, 6, NULL, '0945', 'MamyPoko Pants Baby Diaper Pant Girls - 52 pcs', 'mamypoko-pants-baby-diaper-pant-girls-52-pcs-sl8PcpeH5BP06G0NO8CDhORCFkDgbRvpcjAZPKiF', '<p>MamyPoko Pants Baby Diaper Pant Girls - 52 pcs</p>', NULL, NULL, 2500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(834, 1, 6, NULL, '0946', 'MamyPoko Pants Diaper Pant - 36 pcs', 'mamypoko-pants-diaper-pant-36-pcs-nvaydvGKf7ieyq0bcIeYZ4voLRbaCW6etoDB0y9G', '<p>MamyPoko Pants Diaper Pant - 36 pcs</p>', NULL, NULL, 1500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(835, 1, 6, NULL, '0947', 'Onion (Imported)', 'onion-imported-pgYcWMHp1umf2Vgk4BJ0tdBTL2FzmdzGqvlW3cfS', '<ul>\r\n	<li>Importted Onion&nbsp;</li>\r\n	<li>Orgin:&nbsp;Turkey</li>\r\n</ul>', NULL, NULL, 40.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(836, 1, 6, NULL, '0948', 'Onion | Deshi Piyaj Big Size', 'onion-deshi-piyaj-big-size-HNqWikqJ4TOy1K7YFEcwOZBSDmA9JIIVaBLl2fI8', '<ul>\r\n	<li>Desi Onion</li>\r\n	<li>Big size</li>\r\n</ul>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(837, 1, 6, NULL, '0949', 'Onion Red', 'onion-red-0SF9Ta76ighVqQ1fdmkL6frlhexS0l8TzUEkDWx9', '<p>Red onions have a slightly sweeter and milder flavor than brown onions. Also known as Spanish onions, they are used both raw and cooked. They&#39;re great in salsas, salads and dips, as well as in pasta sauces and cooked vegetable dishes. Red onions are available all year round.</p>', NULL, NULL, 85.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(838, 1, 6, NULL, '0950', 'হিমসাগর আম । রাজশাহী', 'himsagr-am-rajsahee-RFSGipxTN845OphN6yURZ12AW25HqbfGoi0kg2Ah', '<ul>\r\n	<li>ফ্রেশ | ১০০% ক্যামিকেল মুক্ত ।</li>\r\n	<li>ক্ষতিকারক ক্যমিক্যাল, ফরমালিন ও ভেজাল মুক্ত ফ্রেশ আম।&nbsp;</li>\r\n</ul>', NULL, NULL, 0.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(839, 1, 6, NULL, '0953', 'আম রুপালি । রাজশাহী', 'am-rupali-rajsahee-z0BrhYLOpTGeqOMrcX8l7aMxYJU8MbIvgOnpJOqu', '<ul>\r\n	<li>ফ্রেশ | ১০০% ক্যামিকেল মুক্ত&nbsp;</li>\r\n	<li>ক্ষতিকারক ক্যমিক্যাল, ফরমালিন ও ভেজাল মুক্ত ফ্রেশ আমের নিশ্চয়তা।</li>\r\n	<li>কোন প্রকার ভেজাল যেমন ক্ষতিকারক ক্যমিক্যাল বা ফরমালিন প্রমান করতে পারলেই নগদ টাকা পুরস্কার।</li>\r\n</ul>', NULL, NULL, 90.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(840, 1, 6, NULL, '0954', 'গোপালভোগ আম | রাজশাহী', 'gopalvog-am-rajsahee-ewpBuD8M2r5mpQ4KibQhACoB3rOIgfj9UsGWBgmA', '<ul>\r\n	<li>ফ্রেশ | ১০০% ক্যামিকেল মুক্ত&nbsp;</li>\r\n	<li>ক্ষতিকারক ক্যমিক্যাল, ফরমালিন ও ভেজাল মুক্ত ফ্রেশ আমের নিশ্চয়তা।</li>\r\n	<li>কোন প্রকার ভেজাল যেমন ক্ষতিকারক ক্যমিক্যাল বা ফরমালিন প্রমান করতে পারলেই নগদ টাকা পুরস্কার।</li>\r\n</ul>', NULL, NULL, 85.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(841, 1, 6, NULL, '0955', 'ল্যাংড়া আম | রাজশাহী', 'lzangra-am-rajsahee-mutE83rm9ghuHLdOqTAy4jZteLbC4POfgrhzSzqa', '<ul>\r\n	<li>ফ্রেশ | ১০০% ক্যামিকেল মুক্ত&nbsp;</li>\r\n	<li>ক্ষতিকারক ক্যমিক্যাল, ফরমালিন ও ভেজাল মুক্ত ফ্রেশ আমের নিশ্চয়তা।</li>\r\n	<li>কোন প্রকার ভেজাল যেমন ক্ষতিকারক ক্যমিক্যাল বা ফরমালিন প্রমান করতে পারলেই নগদ টাকা পুরস্কার।</li>\r\n</ul>', NULL, NULL, 0.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(842, 1, 6, NULL, '0956', 'রাজশাহী বোম্বে লিচু । ১০০ পিস', 'rajsahee-bombe-licu-100-pis-lSdYP5XGF3GlSfpQhs06L0ShTCJMLjFUu92MWWtU', '<ul>\r\n	<li>100% Chemical free Lychee</li>\r\n	<li>Rajshahi Bombe Lychee</li>\r\n</ul>', NULL, NULL, 450.00, 0.00, 1, 10000, NULL, NULL, 0, 1, NULL, NULL),
(843, 1, 6, NULL, '0960', 'Native Breed White and Gray Cow', 'native-breed-white-and-gray-cow-inutjmOpoRR6Opb9CUqLQ5SzUaae4R64s6LQVazH', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: White and Gray</li>\r\n	<li>Meat weight (Approx): 90-110 kg</li>\r\n	<li>Live weight (Approx): 190-210 kg</li>\r\n	<li>Teeth: 2</li>\r\n	<li>Age: 24 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 46 Inch</li>\r\n</ul>', NULL, NULL, 70500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(844, 1, 6, NULL, '0961', 'Native Breed Black and White Cow', 'native-breed-black-and-white-cow-qVhVxz9HNGRgkOhWk0Aodf8tlAz1pHk9YNKSu0EA', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: Black and White</li>\r\n	<li>Meat weight (Approx): 120-140 kg</li>\r\n	<li>Live weight (Approx): 180-220 kg</li>\r\n	<li>Teeth: 2</li>\r\n	<li>Age: 30 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 45 Inch</li>\r\n</ul>', NULL, NULL, 118200.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:56'),
(845, 1, 6, NULL, '0962', 'Native Breed Black Mete Cow', 'native-breed-black-mete-cow-O5orpcnDLZpgy4RY9K3wNgXFVgwgdsmCiDd8KreE', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: Black Mete</li>\r\n	<li>Meat weight (Approx): 240-260 kg</li>\r\n	<li>Live weight (Approx): 427&nbsp;kg</li>\r\n	<li>Teeth: 6</li>\r\n	<li>Age: 30 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 58 Inch</li>\r\n</ul>', NULL, NULL, 185300.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(846, 1, 6, NULL, '0963', 'Native Breed Red Cow', 'native-breed-red-cow-yBPCeMcDJF5g7wDpITot7bRhdKVVhwnYucaAcCQF', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: Red</li>\r\n	<li>Meat weight (Approx):210-240 kg</li>\r\n	<li>Live weight (Approx): 370-390</li>\r\n	<li>Teeth:2</li>\r\n	<li>Age:22 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 42 Inch</li>\r\n</ul>', NULL, NULL, 173100.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(847, 1, 6, NULL, '0964', 'Native Breed Red and Black Cow', 'native-breed-red-and-black-cow-os6xz6k4jZopNz2wnpkYS9zmqP7PTK455o0yiHh5', '<ul>\r\n	<li>Breed: Native</li>\r\n	<li>Color: Red and Black</li>\r\n	<li>Meat weight (Approx): 220-245&nbsp;kg</li>\r\n	<li>Live weight (Approx): 360-370 kg</li>\r\n	<li>Teeth: 4</li>\r\n	<li>Age: 38 Months</li>\r\n	<li>Feed: Green Grass, Straw, Bran, Cow Feed</li>\r\n	<li>Height: 55 Inch</li>\r\n</ul>', NULL, NULL, 159000.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(848, 1, 6, NULL, '0965', 'Pure Honey | Sundarban  500 gm', 'pure-honey-sundarban-500-gm-P4tu2evT5qNI37qGPky2WT8yHIdFn1l1cbRAVLqP', '<ul>\r\n	<li>Sundarban Er Pure Honey</li>\r\n	<li>Kholisha Fuler Modhu</li>\r\n	<li>100% Pure and Natural</li>\r\n	<li>No Chamical No Sugar</li>\r\n	<li>100% Organic</li>\r\n</ul>', NULL, NULL, 525.00, 499.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(849, 1, 6, NULL, '0966', 'Fozli Mango | 3kg', 'fozli-mango-3kg-B9BkZTL0SgNluMGvq8coosU1DVG5gPJuXIWJ7pCZ', '<ul>\r\n	<li>Rajshahi Pemium Fozli</li>\r\n	<li>Average weught 600-800gm per mango</li>\r\n</ul>', NULL, NULL, 85.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(850, 1, 6, NULL, '0967', 'Mozammel Special Miniket Rice| 20kg', 'mozammel-special-miniket-rice-20kg-q7lBuNiTw8yvdKfTkPqZhas3VYlnD1SgS0YCDTcA', '<ul>\r\n	<li>Mozammel Special Miniket Rice</li>\r\n	<li>Weight&nbsp;&nbsp;20kg</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, 1350.00, 1275.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(851, 1, 6, NULL, '0968', 'Mozammel Special Chinigura Rice – 1Kg', 'mozammel-special-chinigura-rice-1kg-MTgQuaGwtNs6dLxXlQy2GLZfNHDDFpYGHj2VouVG', '<ul>\r\n	<li>Mozammel Special Chinigura Rice &ndash; 1Kg</li>\r\n</ul>', NULL, NULL, 125.00, 115.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(852, 1, 6, NULL, '0969', 'Nazirshail Rice Premium | 5 kg', 'nazirshail-rice-premium-5-kg-24lEFv5RcRjiU8cu21yLv6Ps8LDsjAepYtcWySR9', '<ul>\r\n	<li>Nazirshail Rice Premium</li>\r\n	<li>Best Quality Rice</li>\r\n</ul>', NULL, NULL, 295.00, 285.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(853, 1, 6, NULL, '0970', 'Chinigura Rice | 1 kg', 'chinigura-rice-1-kg-z3U3ZoWU5gCpzASYKx1ofyqwWhQD6iljgksiNLeX', '<ul>\r\n	<li>Chinigura Rice | 1 kg</li>\r\n	<li>Loose chinigura</li>\r\n</ul>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(854, 1, 6, NULL, '0971', 'Pran Chinigura Rice | 2 kg', 'pran-chinigura-rice-2-kg-feWqtFz20NY8v9IbXCX0SqNCOJx1yTA5d12cvwaO', '<ul>\r\n	<li>Pran Chinigura Rice&nbsp; 2 kg</li>\r\n</ul>', NULL, NULL, 250.00, 235.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(855, 1, 6, NULL, '0972', 'Atop Rice | 1 kg', 'atop-rice-1-kg-CtOFfgUndyBIJKxijIkGgb00RaeUgfjLmq77PZnz', '<ul>\r\n	<li>Atop Rice | 1 kg</li>\r\n</ul>', NULL, NULL, 45.00, 40.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(856, 1, 6, NULL, '0973', 'Katarivog Rice | 1 kg', 'katarivog-rice-1-kg-53I9hCxY6IBFs8GvTImnzs3ur0DIguGKw4zFV9jk', '<ul>\r\n	<li>Katarivog Rice | 1 kg</li>\r\n</ul>', NULL, NULL, 90.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(857, 1, 6, NULL, '0974', 'Rupchanda Chinigura Premium Aromatic Rice | 1kg', 'rupchanda-chinigura-premium-aromatic-rice-1kg-RlGAv79FsJy2vTMuy9qhmxOiT96HfnEF3FoZ9ZX4', '<ul>\r\n	<li>Rupchanda Chinigura Premium Aromatic Rice</li>\r\n</ul>', NULL, NULL, 135.00, 125.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(858, 1, 6, NULL, '0975', 'Rashid Miniket - 10kg', 'rashid-miniket-10kg-JT3Ym6red8fOJjwl1Ec6KFKtsNS8uGXPDoONOXMK', '<ul>\r\n	<li>Rashid Miniket - 10kg</li>\r\n</ul>', NULL, NULL, 680.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(859, 1, 6, NULL, '0976', 'Rashid Miniket Rice - 25kg', 'rashid-miniket-rice-25kg-5YV4nhJ1tmX2BVaRn1V0YgTTnqxZCjEYUDGB7rwm', '<ul>\r\n	<li>Rashid Miniket Rice</li>\r\n</ul>', NULL, NULL, 1920.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(860, 1, 6, NULL, '0977', 'Ginger Local ( Deshi Ada ) 1kg', 'ginger-local-deshi-ada-1kg-yi40EXTkybplluCIjmWOGNOahrnf4ObhcXLWbNKk', '<ul>\r\n	<li>Ginger Local</li>\r\n	<li>Big SIze</li>\r\n	<li>Fresh&nbsp;</li>\r\n</ul>', NULL, NULL, 230.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(861, 1, 6, NULL, '0978', 'Garlic Premium (Big) - 1KG', 'garlic-premium-big-1kg-q4zfThqxTntmi8pvtWyMruIgtEDWAgnYy4zH39Gi', '<ul>\r\n	<li>Garlic Premium</li>\r\n	<li>Big Size&nbsp;</li>\r\n</ul>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(862, 1, 6, NULL, '0979', 'Garlic Deshi Roshun - 1kg', 'garlic-deshi-roshun-1kg-t0IydLegzz1NpycZcAiBQb9JbfNCXeLaxiwlkkYH', '<ul>\r\n	<li>Garlic Deshi Roshun</li>\r\n</ul>', NULL, NULL, 260.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(863, 1, 6, NULL, '0980', 'Chalar Gura ( চালের গুঁড়া) -1kg', 'chalar-gura-caler-gunnda-1kg-P9om1M62AJIQp5AJyX7Gr7S6UE913WNVgPdzQ5IR', '<p>চালের গুড়াঃ<br />\r\n(পরিষ্কার, বাছাইকৃত এবং অতি যত্নসহকারে রোদে শুকানো)</p>\r\n\r\n<p>চিতই পিঠা, দুধ চিতই, ভাপা পিঠা, খোলা পিঠা, পুলী পিঠা, পোয়া পিঠা, নকশী পিঠা&hellip;. চালের গুড়ার কোনো পিঠাই এখন আর মিস হবেনা। সব রকমের চালের গুড়ার পিঠা তৈরি করতে পারবেন এখন খুব সহজে।</p>', NULL, NULL, 65.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(864, 1, 6, NULL, '0981', 'Ispahani Mirzapur Tea - 100 gm', 'ispahani-mirzapur-tea-100-gm-08r4vbtaMPyIjr5fnsgZkaItJeXgT6ZbZEhS5mpa', '<ul>\r\n	<li>Ispahani Mirzapur Tea - 100 gm</li>\r\n	<li>Best Quality Tea</li>\r\n</ul>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(865, 1, 6, NULL, '0982', 'Deshi Goru | EGC001', 'deshi-goru-egc001-ZjUe59keJMqRHtxk6DVC6H1TeURzH6TGEMuERnBt', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা</li>\r\n</ul>', NULL, NULL, 190000.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(866, 1, 6, NULL, '0983', 'Deshi Goru Big | EGC002', 'deshi-goru-big-egc002-wuI3wz1XWrlow2zIAVc3u7stERi4y0Hk0cNdxqMa', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট ৪৫৮ কেজি&nbsp;</li>\r\n</ul>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -17px; top: -8px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', NULL, NULL, 174000.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(867, 1, 6, NULL, '0984', 'Deshi Goru Big | EGC003', 'deshi-goru-big-egc003-98LL6lsRElYOCBqQp49liOoiKrvg8wOgtfI16xe2', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 400&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 152000.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(868, 1, 6, NULL, '0985', 'Deshi Goru Big | EGC004', 'deshi-goru-big-egc004-lKEwhZmtqyataK11jQmls5B0PhRBLixGRJ1Hu8ur', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 435&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 165300.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(869, 1, 6, NULL, '0986', 'Deshi Goru Big | EGC005', 'deshi-goru-big-egc005-9BM1AUGBODC5WYXAd3EjN6Qa3sA5hDf69qIJ4sMa', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 440&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 169400.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(870, 1, 6, NULL, '0987', 'Deshi Goru Big | EGC006', 'deshi-goru-big-egc006-C8FNNOoQjSDzOatwBXzqOozhGUXtx6yFmE15MOhQ', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 520&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 199000.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(871, 1, 6, NULL, '0988', 'Deshi Goru Big | EGC007', 'deshi-goru-big-egc007-pG5D0uczLT2ASzX35ksdVKr66x859sm6aHgShIuI', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 522&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 200970.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(872, 1, 6, NULL, '0989', 'Deshi Goru Big | EGC008', 'deshi-goru-big-egc008-Qt8MTT5hVRva1VHS9R71N4TqeSTHTtIt6ZGO0oN3', '<p>দেশী গরু<br />\r\nসরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;<br />\r\nলাইভ ওয়েট 520&nbsp;কেজি&nbsp;</p>', NULL, NULL, 199000.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(873, 1, 6, NULL, '0990', 'Deshi Goru Big | EGC009', 'deshi-goru-big-egc009-2TbiQZ5NEIzXeTCzH8Q4aHHN5KpHRrojhZp1nuOD', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 439&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 169000.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(874, 1, 6, NULL, '0991', 'Deshi Goru Medium | EGM-001', 'deshi-goru-medium-egm-001-CKCtWka7aZJUI9nNIdPaxutJa1q6IJKvEp4PqhEf', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 170&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 71400.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(875, 1, 6, NULL, '0992', 'Deshi Goru Medium | EGM-002', 'deshi-goru-medium-egm-002-Zx0KaFyVK4QF3W8JdvZhPRg1t9jXMn5ZhApTf7sc', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 150&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 62500.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(876, 1, 6, NULL, '0993', 'Deshi Goru Medium | EGM-003', 'deshi-goru-medium-egm-003-NnQvBOEX6gLGk4mt3cRrA5BY8P9QMBxkkArEjsqN', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 185&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 176775.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(877, 1, 6, NULL, '0994', 'Deshi Goru Medium | EGM-004', 'deshi-goru-medium-egm-004-3HArxPDfNK4Xnabydz61agoddES5ChTo974T5H0Q', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 170&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 70550.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(878, 1, 6, NULL, '0995', 'Deshi Goru Medium | EGM-005', 'deshi-goru-medium-egm-005-oWZ2cuHycvAO2CimVjaGoBXgkRn7Rbo2qhgUUUDz', '<ul>\r\n	<li>দেশী গরু</li>\r\n	<li>সরাসরি গৃহস্ত / খামার থেকে সংগ্রহ করা।&nbsp;</li>\r\n	<li>লাইভ ওয়েট 176&nbsp;কেজি&nbsp;</li>\r\n</ul>', NULL, NULL, 73500.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(879, 1, 6, NULL, '0996', 'Deshi Goru Medium | EGS001', 'deshi-goru-medium-egs001-J1Sr87OJUaKId7TZFpGljigZpewSFu7F3zcj8wnF', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 220 kg</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', NULL, NULL, 81500.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(880, 1, 6, NULL, '0997', 'Deshi Goru Medium | EGS002', 'deshi-goru-medium-egs002-zjMUoLoIIbLOu3zDNLXmpurltDw6wD0BSQwMnnEw', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 260 kg</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', NULL, NULL, 99000.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(881, 1, 6, NULL, '0998', 'Deshi Goru Medium | EGS003', 'deshi-goru-medium-egs003-MoY3Ib79JK8z1ZdRwfAyE8K2ol7APToHUrAu09wh', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 170</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', NULL, NULL, 62500.00, 0.00, 1, 1, NULL, NULL, 0, 1, NULL, NULL),
(882, 1, 6, NULL, '0999', 'Deshi Goru Medium | EGS004', 'deshi-goru-medium-egs004-YY6J8c5kozimaysKjrPiHEzmFDMdRDJbZDFbDY80', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 225 kg</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', NULL, NULL, 83250.00, 0.00, 1, 11, NULL, NULL, 0, 1, NULL, NULL),
(883, 1, 6, NULL, '1000', 'Deshi Goru Medium | EGS005', 'deshi-goru-medium-egs005-NigPEmJ2ac2xKLQ7vcixbF47NnabNmkxYY5bjLy1', '<ul>\r\n	<li>গৃহস্তের গরু</li>\r\n	<li>জাতঃ দেশাল</li>\r\n	<li>লাইভ ওয়েটঃ 210 kg</li>\r\n	<li>দাতঃ ২ দাঁত&nbsp;</li>\r\n</ul>', NULL, NULL, 77700.00, 0.00, 1, 11, NULL, NULL, 0, 1, NULL, NULL),
(884, 1, 6, NULL, '1001', 'Hilsha (ইলিশ) Fish | 700-900 gm', 'hilsha-ilis-fish-700-900-gm-7Y4ZFfgqAiTx5YtvRDUh0YwOe04J6eTrr4jULVmB', '<ul>\r\n	<li>পদ্মার ইলিশ মাছ।</li>\r\n	<li>সরাসরি চাঁদপুর থেকে ।&nbsp;</li>\r\n	<li>তাজা ইলিশ মাছ।&nbsp;</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, 950.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(885, 1, 6, NULL, '1002', 'Hilsha (ইলিশ) Fish | 1 kg - 1.2 kg', 'hilsha-ilis-fish-1-kg-12-kg-JONvPMesAhip7fkI0riHcAjyqo8B173WLOxyxgv9', '<ul>\r\n	<li>পদ্মার ইলিশ মাছ।</li>\r\n	<li>সরাসরি চাঁদপুর থেকে ।&nbsp;</li>\r\n	<li>তাজা ইলিশ মাছ।&nbsp;</li>\r\n</ul>', NULL, NULL, 1050.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(886, 1, 6, NULL, '1003', 'Hilsha (ইলিশ) Fish | 1.2 - 1.5 kg', 'hilsha-ilis-fish-12-15-kg-eOTElRhuIiFV6W8xDb6VXB2slu2m45hXF1ZnuZkt', '<ul>\r\n	<li>পদ্মার ইলিশ মাছ।</li>\r\n	<li>সরাসরি চাঁদপুর থেকে ।&nbsp;</li>\r\n	<li>তাজা ইলিশ</li>\r\n</ul>', NULL, NULL, 1350.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(887, 1, 6, NULL, '1004', 'Hilsha (ইলিশ) Fish | 1kg - 1.2 kg', 'hilsha-ilis-fish-1kg-12-kg-vlFX59uByRjojL99tgr7WMW0VnpJVXdcGHeQCfSs', '<p>পদ্দার ইলিশ</p>', NULL, NULL, 1250.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(888, 1, 6, NULL, '1005', 'TP-Link TL-WR841N 300Mbps Wireless Router', 'tp-link-tl-wr841n-300mbps-wireless-router-vqD2zobVvRxj77FUJrVeXGgUZz26lh7vAuRF6W59', '<ul>\r\n	<li>Model: TP-Link TL-WR841N</li>\r\n	<li>Speed: 11n: Up to 300Mbps</li>\r\n	<li>Frequency: 2.4-2.4835GHz</li>\r\n	<li>Interface: 1 x WAN &amp; 4 x LAN ports</li>\r\n</ul>', NULL, NULL, 2050.00, 1000.00, 1, 25, NULL, NULL, 0, 1, NULL, '2022-01-12 15:09:41'),
(889, 1, 6, NULL, '1006', 'TP-LINK TL-WR850N Wireless Router N300', 'tp-link-tl-wr850n-wireless-router-n300-s94m51EUxx1R3XHOgopeJhlrKjQdzhTHyeEFk0JM', '<ul>\r\n	<li>TP-LINK TL-WR850N Wireless Router N300 Black -</li>\r\n	<li>Share your Network - Speed Up to 300 Mbps -</li>\r\n	<li>WPS Button -</li>\r\n	<li>Agile Configuration</li>\r\n	<li>Support - Maximum Connection - Parental Control</li>\r\n</ul>', NULL, NULL, 1760.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(890, 1, 6, NULL, '1007', 'Tp-link Archer C20 AC750 Dual Band Router', 'tp-link-archer-c20-ac750-dual-band-router-R7N6ZUqJ9feGAnKJRhoJN137jeNI9dBo9NO96zGL', '<ul>\r\n	<li>Model: Tp-link Archerc20 AC750</li>\r\n	<li>4 10/100Mbps LAN ports</li>\r\n	<li>1 10/100Mbps WAN port</li>\r\n	<li>9V/0.6A(EU), 9V/0.85A(US)</li>\r\n</ul>', NULL, NULL, 2850.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(891, 1, 6, NULL, '1008', 'TP-Link TL-WR820N 300Mbps Wireless N Router', 'tp-link-tl-wr820n-300mbps-wireless-n-router-YXlZFc1lmoXhwmy9G3sYDFjksHWS6Ttt7hA8ODmp', '<p>300Mbps Wireless N Speed TL-WR820N 300Mbps wireless transmission rate ideal for both bandwidth sensitive tasks and basic work IPTV supports IGMP Proxy/Snooping, Bridge and Tag VLAN to optimize IPTV streaming Compatible with IPv6 (Internet Protocol version 6) Guest Network provides separate access for guests while securing the host network Parental Controls manage when and how connected devices can access the internet Security protocols protect your home network with firewalls and wireless encryption Wi-Fi Ideal for Everyday Use 300Mbps Wireless N Speed TL-WR820N</p>', NULL, NULL, 1650.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(892, 1, 6, NULL, '1009', 'TP-Link Archer C5 V4 AC1200 Wireless Dual Band Gigabit Router', 'tp-link-archer-c5-v4-ac1200-wireless-dual-band-gigabit-router-AWOpoGi1zTxI6m919kRPBiqklgXkhcB5BzMph9gs', '<ul>\r\n	<li>\r\n	<p>Interface: 4 10/1000Mbps LAN Ports 1 10/1000Mbps WAN Port 1 USB 2.0 Port</p>\r\n	</li>\r\n	<li>\r\n	<p>LED Indicator: Power Internet WLAN LAN</p>\r\n	</li>\r\n	<li>\r\n	<p>Antenna Type: 4 Fixed antennas (2.4GHz:2 x 5 dBi High Gain Antennas/5GHz: 2 x 5dBi High Gain Antennas)</p>\r\n	</li>\r\n	<li>\r\n	<p>Number of Routes: Concurrent Connected Devices : 15-20</p>\r\n	</li>\r\n	<li>\r\n	<p>Wireless Standards: IEEE 802.11n/g/b 2.4GHz IEEE 802.11ac/n/a 5GHz</p>\r\n	</li>\r\n	<li>\r\n	<p>Frequency: 2.4GHz and 5GHz</p>\r\n	</li>\r\n	<li>\r\n	<p>Wireless Functions: Enable/Disable Wireless Radio, WDS Bridge, WMM, Wireless Statistics</p>\r\n	</li>\r\n	<li>\r\n	<p>Management: Access Control, Local Management, Remote Management</p>\r\n	</li>\r\n	<li>\r\n	<p>Access Control: Parental Control, Local Management Control, Host list, Access Schedule, Rule Management</p>\r\n	</li>\r\n	<li>\r\n	<p>System Requirements: Microsoft Windows 10/8.1/8/7/Vista/XP/2000/NT/98SE, MAC OS, NetWare, UNIX or Linux</p>\r\n	</li>\r\n</ul>', NULL, NULL, 3650.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(893, 1, 6, NULL, '1010', 'TP- Link Archer C60 AC1350 Wireless Dual Band Router - White', 'tp-link-archer-c60-ac1350-wireless-dual-band-router-white-ga5yFvaBPC4DG8rTS9hNbCtDSNKCzOs0LUsQNrsL', '<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Get faster Wi-Fi at both the 2.4GHz band (450Mbps) and the 5GHz band (867Mbps) The advanced AC Wi-Fi unlocks the performance of all your wireless devices Three 2.4GHz antennas and two5GHz antennas createsuperior Wi-Fi coverage Beamforming technology delivers highly efficient wireless connection (supported by Version 2.0 and above)</li>\r\n	<li>Advanced software functions like Parental Control and Guest Network Tether app provides easy router management in your palm</li>\r\n	<li>The New Wi-Fi Standard for an Advanced Online Experience: The Archer C60 comes with the latest wireless standard &ndash; 802.11ac. This advanced Wi-Fi is designed for high-traffic online activities and can help to run applications at triple the speed of the previous 802.11n standard. The result: faster, stronger and more capable Wi-Fi to unleash all your wireless devices.</li>\r\n	<li>Fast,Concurrent Dual Band Wi-Fi: The Archer C60 provides you with simultaneous dual band Wi-Fi connections. 2.4GHz band: 3&times;3 MIMO creates fast and stable Wi-Fi at speeds of 450Mbps, making it perfect for daily applications like sending emails, browsing the web or listening to music.</li>\r\n	<li>5GHz band: Provides up to 867Mbps Wi-Fi for latency-sensitive entertainment so you can stream HD video, play online games and hold video chats all at the same time, without delay.</li>\r\n</ul>', NULL, NULL, 4199.00, 0.00, 1, 20, NULL, NULL, 0, 1, NULL, NULL),
(894, 1, 6, NULL, '1011', 'TP-Link TL-WR940N 450Mbps Wireless N Router', 'tp-link-tl-wr940n-450mbps-wireless-n-router-wXcOx7HwGhfPddRiI3jwGxx5SG5UACVxSD18Nkg0', '<ul>\r\n	<li>450Mbps wireless speed ideal for interruption sensitive applications like HD video streaming</li>\r\n	<li>Three antennas increase the wireless robustness and stability Supports 3 modes: Router, Range Extender and Access Point modes Easy wireless security encryption at a push of WPS button Bandwidth Control: assigns your preferred devices with more bandwidth</li>\r\n	<li>4 10/100Mbps LAN PORTS</li>\r\n	<li>1 10/100Mbps WAN PORT IEEE 802.11n, IEEE 802.11g, IEEE 802.11b</li>\r\n	<li>3*5dBi Fixed Omni Directional Antenna</li>\r\n</ul>', NULL, NULL, 2650.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(895, 1, 6, NULL, '1012', 'TP-Link TL-WR840N V2 300Mbps Wireless Router - White', 'tp-link-tl-wr840n-v2-300mbps-wireless-router-white-9tiqwoXgZJCmGUkRDI5mXtWuGucHoOWLDPwybaUQ', '<ul>\r\n	<li>Brand TP-Link</li>\r\n	<li>Model TL-WR840N V2</li>\r\n	<li>Network standards IEEE 802.11n, 11g, 11b</li>\r\n	<li>Outdoor range 400 sq. meter</li>\r\n	<li>Data transfer rate 300Mbps</li>\r\n	<li>Security protocols WEP, WPA/WPA2, WPA-PSK/WPA2-PSKencryptions, MAC Filtering, SSID Control, SPI Firewall, access control</li>\r\n	<li>Interface (Built-in) 1 x WAN port, 4 x LAN ports,</li>\r\n	<li>Antena 2 x External Antennas</li>\r\n	<li>Others 1200 - 1500 sq. feet</li>\r\n	<li>Warranty 1 year</li>\r\n	<li>Data Transfer Rate 300Mbps to 599Mbpls</li>\r\n	<li>Antena 2</li>\r\n</ul>', NULL, NULL, 1699.00, 0.00, 1, 20, NULL, NULL, 0, 1, NULL, NULL),
(896, 1, 6, NULL, '1013', 'TP Link Archer A9 AC1900 Wireless MU-MIMO Gigabit Router', 'tp-link-archer-a9-ac1900-wireless-mu-mimo-gigabit-router-BujWv52CDd0UL6tE4EO0S3eLtzzjaQb3xEghefpM', '<ul>\r\n	<li>Model: TP Link Archer A9 AC1900</li>\r\n	<li>802.11ac Wave2 Wi-Fi</li>\r\n	<li>MU-MIMO Technology</li>\r\n	<li>Boosted WiFi Coverage</li>\r\n	<li>1 Year Warranty</li>\r\n</ul>', NULL, NULL, 9300.00, 0.00, 1, 10, NULL, NULL, 0, 1, NULL, NULL),
(897, 1, 6, NULL, '1014', 'TP-Link WR845N 300Mbps Wireless N Router', 'tp-link-wr845n-300mbps-wireless-n-router-nQZIGlD4IgCvlKxQY671yw87Iqnpvh2aQuR2RgIX', '<ul>\r\n	<li>Model: TP-Link WR845N</li>\r\n	<li>Frequency: 2.4-2.4835GHz</li>\r\n	<li>Interface: 1 x LAN &amp; 4 x WAN ports</li>\r\n	<li>DIM: 9.1W x 5.7D x 1.4H in</li>\r\n</ul>', NULL, NULL, 1990.00, 0.00, 1, 15, NULL, NULL, 0, 1, NULL, NULL),
(898, 1, 6, NULL, '1015', 'TP-LINK TD-W8961ND 300 MBPS WIRELESS & ADSL 2 + ROUTER', 'tp-link-td-w8961nd-300-mbps-wireless-adsl-2-router-jjMkm8LMicKoj6chdE1fP7cvBZd6mgKJuDawMtuQ', '<ul>\r\n	<li>Model: TP-LINK TD-W8961</li>\r\n	<li>Antenna Omni directional, Detachable, Reverse SMA</li>\r\n	<li>Signal Rate 300Mbps</li>\r\n	<li>Frequency 2.400-2.4835GHz</li>\r\n	<li>1 WPS Button</li>\r\n</ul>', NULL, NULL, 2700.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(899, 1, 6, NULL, '1016', 'Tp-link TL-WR850N 300Mbps Wireless N Speed Router', 'tp-link-tl-wr850n-300mbps-wireless-n-speed-router-duD1wrGjuPgob15qvASeJwwM9fStjSYmJhYccXO9', '<ul>\r\n	<li>Model: Tp-link TL-WR850N</li>\r\n	<li>Signal Rate 300Mbps</li>\r\n	<li>Antenna 2 Antennas</li>\r\n	<li>Frequency 2.4-2.4835GHz</li>\r\n	<li>Button WPS/RESET Button</li>\r\n</ul>', NULL, NULL, 2100.00, 0.00, 1, 20, NULL, NULL, 0, 1, NULL, NULL),
(900, 1, 6, NULL, '1017', 'Tp-Link Archer AX10 AX1500 Wi-Fi 6 Gigabit Router', 'tp-link-archer-ax10-ax1500-wi-fi-6-gigabit-router-Rn8y8vFCtrAj7Jw37Y8REkwnucZiQ02kGkrKSc2A', '<ul>\r\n	<li>Model: Tp-Link Archer AX10</li>\r\n	<li>Wi-Fi 6 Technology</li>\r\n	<li>Triple-Core Processing</li>\r\n	<li>1.5 GHz Triple-Core CPU</li>\r\n	<li>Frequency: 5 GHz and 2.4 GHz</li>\r\n</ul>', NULL, NULL, 13500.00, 0.00, 1, 5, NULL, NULL, 0, 1, NULL, NULL),
(901, 1, 6, NULL, '1018', 'TP-Link TL-WR740N Wireless N Router', 'tp-link-tl-wr740n-wireless-n-router-8VO45cOurB7gK2FfFsR1thW7gkvsO3F2N66kk6Bb', '<ul>\r\n	<li>Model: TP-Link TL-WR740N</li>\r\n	<li>Frequency: 2.4-2.4835GHz</li>\r\n	<li>Interface: 1 x LAN &amp; 4 x WAN ports</li>\r\n	<li>DIM: 6.9W x 4.6D x 1.3H in</li>\r\n</ul>', NULL, NULL, 1150.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(902, 1, 6, NULL, '1019', 'Tenda F3 300Mbps Wi-Fi Router', 'tenda-f3-300mbps-wi-fi-router-h3OYqNr9pFLR7CofRMLxVCLsWC1edbWaOH5IQByG', '<ul>\r\n	<li>Model: Tenda F3</li>\r\n	<li>Interface: 1x WAN &amp; 3x LAN Ports</li>\r\n	<li>DIM: 127.4*90.5*26mm</li>\r\n	<li>Frequency: 2.4GHz</li>\r\n</ul>', NULL, NULL, 1599.00, 0.00, 1, 20, NULL, NULL, 0, 1, NULL, NULL),
(903, 1, 6, NULL, '1020', 'Tenda N301 Wireless N300 Easy Setup Router', 'tenda-n301-wireless-n300-easy-setup-router-ltrSrxuE48haLuUAoS1bBGr2nHXPX4RXltnpOsrn', '<ul>\r\n	<li>Model: Tenda N301</li>\r\n	<li>2 fixed 5dbi antennas</li>\r\n	<li>1 Reset/WPS Button</li>\r\n	<li>Frequency 2.412GHz-2.472GHz</li>\r\n</ul>', NULL, NULL, 1500.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(904, 1, 6, NULL, '1021', 'Tenda FH456 Wireless-N 300Mbps Router', 'tenda-fh456-wireless-n-300mbps-router-CFI7VSPnKOQigQEwMFM81VEtAK1DsVz0OGtNE0KO', '<ul>\r\n	<li>Model: Tenda FH456</li>\r\n	<li>Interface: 1x LAN &amp; 3x WAN Ports</li>\r\n	<li>DIM: 6.74*6.74*1.43in</li>\r\n	<li>Frequency: 2.4GHz</li>\r\n</ul>', NULL, NULL, 4250.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(905, 1, 6, NULL, '1022', 'Tenda F9 600M Whole-Home Coverage Wi-Fi Router', 'tenda-f9-600m-whole-home-coverage-wi-fi-router-rikSnknbsMiympJFHw9Md4WnHlf55fJi8cEIDvA4', '<ul>\r\n	<li>Model: Tenda F9 600M</li>\r\n	<li>Interface: 1x LAN &amp; 3x WAN Ports</li>\r\n	<li>DIM: 171.3*171.3*36.4 mm</li>\r\n	<li>Frequency: 2.4~2.4835 GHz</li>\r\n</ul>', NULL, NULL, 2499.00, 0.00, 1, 20, NULL, NULL, 0, 1, NULL, NULL),
(906, 1, 6, NULL, '1023', 'Tenda AC5 AC1200 Smart Dual-Band WiFi Router', 'tenda-ac5-ac1200-smart-dual-band-wifi-router-ZmyFX7pzTrmph6givy9TMHwspLoZc5t20r0plMRU', '<ul>\r\n	<li>Model: Tenda AC5</li>\r\n	<li>Antenna 5dBi External antenna *4</li>\r\n	<li>Frequency 2.4 GHz &amp; 5 GHz</li>\r\n	<li>Smart Sleeping Mode</li>\r\n	<li>Smart LED on/off</li>\r\n</ul>', NULL, NULL, 5500.00, 0.00, 1, 2, NULL, NULL, 0, 1, NULL, NULL),
(907, 1, 6, NULL, '1024', 'Tenda AC15 AC1900 Smart Dual-Band Gigabit WiFi Router', 'tenda-ac15-ac1900-smart-dual-band-gigabit-wifi-router-hZzqByAvXFm0MlhpqZOfYWr6M127KFHmF4e4yFDa', '<ul>\r\n	<li>Model: AC15</li>\r\n	<li>Dimension: 8.9 x 7.07 x 3.02 in</li>\r\n	<li>Frequency: 2.4G and 5G</li>\r\n	<li>Antenna: 3 x 3dBi dual brand</li>\r\n</ul>', NULL, NULL, 8400.00, 0.00, 1, 10, NULL, NULL, 0, 1, NULL, NULL),
(908, 1, 6, NULL, '1025', 'Tenda 4G630 3G/4G Wireless N300 Router', 'tenda-4g630-3g4g-wireless-n300-router-VwGEskqStBIQvEUKm8oMgvlidpoizdkHdYZWGdkW', '<ul>\r\n	<li>Model: Tenda 4G630</li>\r\n	<li>Wireless Link Rate 300Mbps</li>\r\n	<li>Frequency Range 2.4-2.4835GHz</li>\r\n	<li>Antenna two fixed 5dBi Omni</li>\r\n</ul>', NULL, NULL, 2150.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(909, 1, 6, NULL, '1026', 'Tenda AC6 AC1200 Smart Dual-Band Wireless Router', 'tenda-ac6-ac1200-smart-dual-band-wireless-router-FKHKohv2Gd6cgQzWcA36fE8S8gsHAJkZAhGpj2Zv', '<ul>\r\n	<li>Model: AC6</li>\r\n	<li>Interface: 1x WAN &amp; 3x LAN Ports</li>\r\n	<li>DIM: 220*141.5*49mm</li>\r\n	<li>Frequency: 2.4 &amp; 5GHz</li>\r\n</ul>', NULL, NULL, 3550.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(910, 1, 6, NULL, '1027', 'Tenda FH1202 1200Mbps Dual-Speed Wireless Wifi Router', 'tenda-fh1202-1200mbps-dual-speed-wireless-wifi-router-zmNC4cFce9CBdjsXZVolAeStd9hoGY5mGTApe07b', '<ul>\r\n	<li>Model: Tenda FH1202</li>\r\n	<li>Interface: 1x WAN &amp; 3x LANPorts</li>\r\n	<li>DIM: 153.2*153.2*40.04mm</li>\r\n	<li>Frequency: 2.4GHz and 5GHz</li>\r\n</ul>', NULL, NULL, 4250.00, 0.00, 1, 10, NULL, NULL, 0, 1, NULL, NULL),
(911, 1, 6, NULL, '1028', 'Tenda Wireless F6 300Mbps N300 Easy Setup 4 Antenna Router', 'tenda-wireless-f6-300mbps-n300-easy-setup-4-antenna-router-UJZDOGJYKftgRnqQ0FvU6wRaNi8w3q36pjaM6yJA', '<ul>\r\n	<li>Model: Tenda Wireless F6 300Mbps N300</li>\r\n	<li>4*5dBi High Gain Omni-Directional antennas</li>\r\n	<li>Support WISP and Universal Repeater</li>\r\n	<li>Support the easy-installation setup</li>\r\n	<li>Frequency: 2.4 GHz</li>\r\n</ul>', NULL, NULL, 1850.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(912, 1, 6, NULL, '1029', 'Mercusys MW301R 300mbps 2 Antenna Router', 'mercusys-mw301r-300mbps-2-antenna-router-tX1W13n6V0ebCnYLSCYkaCOppPPuFBbnqsAErQTY', '<ul>\r\n	<li>Model: Mercusys MW301R</li>\r\n	<li>Concurrent Dual Band Connections</li>\r\n	<li>Speed: up to 1200Mbps</li>\r\n	<li>Superior Online Experience</li>\r\n	<li>Strong Signal, Great Coverage</li>\r\n</ul>', NULL, NULL, 1450.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL);
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `subcategory_id`, `product_code`, `name`, `slug`, `product_details`, `short_description`, `specification`, `unit_price`, `discount_price`, `stock_status`, `quantity`, `special_note`, `video_link`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(913, 1, 6, NULL, '1030', 'Mercusys MW302R 300mbps 2 Antenna Multi-Mode Wireless N Router', 'mercusys-mw302r-300mbps-2-antenna-multi-mode-wireless-n-router-hgkEQaXgY8reysOC0EdGJFW09Zvd4i77mA19JUro', '<ul>\r\n	<li>Model: Mercusys MW302R</li>\r\n	<li>Speed: up to 300Mbps</li>\r\n	<li>LED Control &amp; IPv6 Supported</li>\r\n	<li>Superior Online Experience</li>\r\n	<li>Strong Signal, Great Coverage</li>\r\n</ul>', NULL, NULL, 1350.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(914, 1, 6, NULL, '1031', 'Mercusys MW305R 300Mbps Wireless N Router', 'mercusys-mw305r-300mbps-wireless-n-router-IWmP9CJ1gIgtTWAn0LY8EtWUA6i2juYf9tg5GXMf', '<ul>\r\n	<li>Model: Mercusys MW305R</li>\r\n	<li>Interface: 1WAN and 3 LAN</li>\r\n	<li>Frequency: 2.4 - 2.4835GHz</li>\r\n	<li>DIM:169 x 116 x 35 mm​</li>\r\n</ul>', NULL, NULL, 1420.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(915, 1, 6, NULL, '1032', 'Mercusys MW325R 300Mbps Enhanced Wireless N Router', 'mercusys-mw325r-300mbps-enhanced-wireless-n-router-lXlwEjPh48zH4XbDGWC0jateOiNVWagpNlR7rIa8', '<ul>\r\n	<li>Model: Mercusys MW325R</li>\r\n	<li>Interface: 1WAN and 4 LAN</li>\r\n	<li>Frequency: 2.4 - 2.4835GHz</li>\r\n	<li>DIM: 167 x 118 x 33 mm</li>\r\n</ul>', NULL, NULL, 2150.00, 0.00, 1, 20, NULL, NULL, 0, 1, NULL, NULL),
(916, 1, 6, NULL, '1033', 'Mercusys AC12(EU) 1200Mbps 4 Antenna Dual Band Router', 'mercusys-ac12eu-1200mbps-4-antenna-dual-band-router-CNkeKbnhrnqD3Gy8dFWqbn2Yd0izfhqFWfTVvbUb', '<ul>\r\n	<li>Model: Mercusys AC12(EU)</li>\r\n	<li>Concurrent Dual Band Connections</li>\r\n	<li>Speed: up to 1200Mbps</li>\r\n	<li>Superior Online Experience</li>\r\n	<li>Strong Signal, Great Coverage</li>\r\n</ul>', NULL, NULL, 3350.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(917, 1, 6, NULL, '1034', 'Mercusys MW155R 150 Mbps Wireless N Router', 'mercusys-mw155r-150-mbps-wireless-n-router-obeqw9lqRRfnVepp5MftVg3sp63XenC4CMvh6UNG', '<ul>\r\n	<li>Model: Mercusys MW155R</li>\r\n	<li>Interface: 1WAN and 4 LAN</li>\r\n	<li>Frequency: 2.4 - 2.4835GHz</li>\r\n	<li>DIM: 114 x 94 x 26 mm</li>\r\n</ul>', NULL, NULL, 1150.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(918, 1, 6, NULL, '1035', 'Xiaomi MI 4C R4CM 300 Mbps 4 Antenna Router (Global Version)', 'xiaomi-mi-4c-r4cm-300-mbps-4-antenna-router-global-version-GOcLqn4xiUkMKNt45udH4hjfE8mIleDtt3r5ioCy', '<ul>\r\n	<li>Model: 4C R4CM</li>\r\n	<li>Transmission Rate 300Mbps</li>\r\n	<li>Frequency 2.4GHz</li>\r\n	<li>Four 5dBi Antennas</li>\r\n</ul>', NULL, NULL, 2250.00, 0.00, 1, 20, NULL, NULL, 0, 1, NULL, NULL),
(919, 1, 6, NULL, '1036', 'Xiaomi MI 4C R4CM 300 Mbps 4 Antenna Router (Chinese Version)', 'xiaomi-mi-4c-r4cm-300-mbps-4-antenna-router-chinese-version-LKBGKN9Mr8RV4LK6bQVMJq4WOlCXX2V9lgcL1pQ8', '<ul>\r\n	<li>Model: 4C R4CM</li>\r\n	<li>Transmission Rate 300Mbps</li>\r\n	<li>Frequency 2.4GHz</li>\r\n	<li>Four 5dBi Antennas</li>\r\n</ul>', NULL, NULL, 1850.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(920, 1, 6, NULL, '1037', 'Amplificador Pro - 300Mbps WiFi Wireless Router Repeater - Black', 'amplificador-pro-300mbps-wifi-wireless-router-repeater-black-tU0emJqT0BL8nGwJnid1nM6o6ysNf2RRQVOjJ7jg', '<ul>\r\n	<li>Wireless Router Repetidor</li>\r\n	<li>Type: Wireless</li>\r\n	<li>Incredible Signal Strength</li>\r\n	<li>Maximum LAN data speed: 300Mbps</li>\r\n	<li>2x2 External Antenna</li>\r\n	<li>3 steps to connect the Router</li>\r\n</ul>', NULL, NULL, 1750.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(921, 1, 6, NULL, '1038', 'Tenda U1 300 Mbps Utral-Fast Wireless USB Adapter', 'tenda-u1-300-mbps-utral-fast-wireless-usb-adapter-jldqOLaX8lasJhf8g7paKK1dvw4sfQ509cTbKr42', '<ul>\r\n	<li>Model: Tenda U1</li>\r\n	<li>Frequency: 2.400~2.4835GHz</li>\r\n	<li>Dimension: 58&times;19.7&times;10.9 mm</li>\r\n	<li>Wi-Fi Protected Setup</li>\r\n</ul>', NULL, NULL, 1450.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(922, 1, 6, NULL, '1039', 'UiiSii HM13 In-Ear Dynamic Headset with Microphone-Black', 'uiisii-hm13-in-ear-dynamic-headset-with-microphone-black-tK7Q6ojoSvO9EiJ8bAHI2l2vqPBq1JgtEPaNDbZY', '<ul>\r\n	<li>\r\n	<p>Brand Name:UiiSii</p>\r\n	</li>\r\n	<li>\r\n	<p>Function:For Mobile Phone,For Internet Bar,for Video Game,For iPod,Sport,Common Headphone</p>\r\n	</li>\r\n	<li>\r\n	<p>Waterproof:No</p>\r\n	</li>\r\n	<li>\r\n	<p>Support Memory Card:No</p>\r\n	</li>\r\n	<li>\r\n	<p>Connectors:3.5mm</p>\r\n	</li>\r\n	<li>\r\n	<p>Model Number: UiiSii HM13</p>\r\n	</li>\r\n</ul>', NULL, NULL, 1600.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(923, 1, 6, NULL, '1040', 'UiiSii HM12 Gaming Headset On-Ear Deep Bass Good Treble Earphone - Black', 'uiisii-hm12-gaming-headset-on-ear-deep-bass-good-treble-earphone-black-XBsa1VSw4orakn2KLH7YBCSrAYcVoD9vnnhobuh6', '<ul>\r\n	<li>Brand name:UiiSii</li>\r\n	<li>Model number: HM-12</li>\r\n	<li>Plug diameter: 3.5mm</li>\r\n	<li>Cable length: 120cm</li>\r\n	<li>Headphone Category: Gaming Headset Mobile Phone Headphones</li>\r\n	<li>With or without microphone: With</li>\r\n	<li>Wired earphone plug type: L-bend</li>\r\n	<li>General impedance: 32&Omega;</li>\r\n	<li>Sensitivity: 100dB/mW</li>\r\n	<li>Frequency response range: 20-20000Hz</li>\r\n</ul>', NULL, NULL, 750.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(924, 1, 6, NULL, '1041', 'UiiSii C100 In-ear Earphone with MIC - Black', 'uiisii-c100-in-ear-earphone-with-mic-black-cSU7ChBm0eAshrT3se2cCrEuBJqK79HuCIBXWRZj', '<ul>\r\n	<li>Built-in HD microphone, chat with friends or families smooth and freely</li>\r\n	<li>One-key operation, handy to switch songs and get hands-free calls</li>\r\n	<li>3.5mm gold-plated jack, compatible with the mainstream audio-visual devices</li>\r\n	<li>Compatible with: Computer,iPhone,iPod,Mobile,phone,MP3,PC,Portable Media Player</li>\r\n</ul>', NULL, NULL, 550.00, 0.00, 1, 50, NULL, NULL, 0, 1, NULL, NULL),
(925, 1, 6, NULL, '1042', 'UiiSii BA-T8 HiFi Earphone Earbuds Dual Dynamaic Music In-Ear Earphone Noise Cancelling Wired with Mic For Smartphones - Black', 'uiisii-ba-t8-hifi-earphone-earbuds-dual-dynamaic-music-in-ear-earphone-noise-cancelling-wired-with-mic-for-smartphones-black-5FUDLMJDUL7AlLG3l3jqA1kACmw5EhFgKgiHWuuc', '<ul>\r\n	<li>Brand: UiiSii</li>\r\n	<li>Model: T8</li>\r\n	<li>100% Original Product</li>\r\n	<li>Connectors: 3.5mm</li>\r\n	<li>Control Button: Yes</li>\r\n	<li>Style: In-Ear</li>\r\n	<li>Communication: Wired</li>\r\n	<li>Vocalism Principle: Hybrid Technology</li>\r\n	<li>Volume Control: Yes</li>\r\n	<li>With Microphone: Yes</li>\r\n	<li>Resistance: 16&Omega;</li>\r\n	<li>Frequency Response Range: 20-20000Hz</li>\r\n	<li>Sensitivity: 108dB</li>\r\n	<li>Line Length: 1.2m</li>\r\n</ul>', NULL, NULL, 3850.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(926, 1, 6, NULL, '1044', 'UiiSii BT119 Wireless Bluetooth & Waterproof Earphone - Black', 'uiisii-bt119-wireless-bluetooth-waterproof-earphone-black-1vMJfH3Mjunz25MnVCx3doshqlc7AQLmM7fuDz0J', '<ul>\r\n	<li>120mAh large capacity built-in battery, standby time is about 240 hours, endurance is 10 hours &bull;</li>\r\n	<li>Bluetooth 5.0, compatibility, stability, and functionality are more powerful, and the signal connection is stable and fast within 10 meters</li>\r\n	<li>Slanted into the ear design, fully fits the auricle and is comfortable to wear for a long time</li>\r\n	<li>The two ends of the earphone can be magnetically attracted together for more convenient storage</li>\r\n	<li>Charging time: 1.5h</li>\r\n	<li>Impedance: 16 ohm</li>\r\n	<li>Sensitivity: 104dB</li>\r\n	<li>Frequency: 20 - 20Hz</li>\r\n	<li>Waterproof rating: IPX5</li>\r\n</ul>', NULL, NULL, 1650.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(927, 1, 6, NULL, '1045', 'Uiisii HM8 Spiral Metal In-ear Earphones Super Bass with Microphone 3.5mm - Red', 'uiisii-hm8-spiral-metal-in-ear-earphones-super-bass-with-microphone-35mm-red-W4qA8ivLCLzqEAX6dZDVLLjIjCZBAT1YQGnS4Pz8', '<ul>\r\n	<li>100% Authentic</li>\r\n	<li>Impedance: 16&Omega;</li>\r\n	<li>Sensitivity: 85&plusmn;3dB</li>\r\n	<li>Speaker size: 13.5mm</li>\r\n	<li>Plug Type: 3.5mm</li>\r\n	<li>Transducer Principle: Dynamic</li>\r\n	<li>Frequency Response:20Hz~20kHz 5</li>\r\n	<li>MIC: High-Quality Sensitive In-line Microphone</li>\r\n</ul>', NULL, NULL, 899.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(928, 1, 6, NULL, '1046', 'UiiSii UX In-Ear Dynamic Headset with Mic - Black', 'uiisii-ux-in-ear-dynamic-headset-with-mic-black-jLB43IkVYd1xAR7sKabBItZz2bV7FeZuyu2lLxxQ', '<ul>\r\n	<li>Brand: UiiSii</li>\r\n	<li>Model: UX</li>\r\n	<li>Type: 3.5mm</li>\r\n	<li>Speaker diameter 12mm</li>\r\n	<li>Frequency range 20~20000HZ</li>\r\n	<li>Sensitivity 102 + 3dB</li>\r\n	<li>Impedance 180</li>\r\n	<li>Wire length 120cm Pin 3.5mm</li>\r\n</ul>', NULL, NULL, 600.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(929, 1, 6, NULL, '1047', 'UiiSii UX In-Ear Dynamic Headset with Mic - White', 'uiisii-ux-in-ear-dynamic-headset-with-mic-white-f9Cac3Gm5dIT6Yt6VnRNoOVaTiWj0hAjGD1VnG4t', '<ul>\r\n	<li>Brand: UiiSii</li>\r\n	<li>Model: UX</li>\r\n	<li>Type: 3.5mm</li>\r\n	<li>Speaker diameter 12mm</li>\r\n	<li>Frequency range 20~20000HZ</li>\r\n	<li>Sensitivity 102 + 3dB</li>\r\n	<li>Impedance 180</li>\r\n	<li>Wire length 120cm Pin 3.5mm</li>\r\n</ul>', NULL, NULL, 600.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(930, 1, 6, NULL, '1048', 'UIISII BN19 Wireless Bluetooth & Waterpoof Earphone - Black', 'uiisii-bn19-wireless-bluetooth-waterpoof-earphone-black-lMP1yn7N8VkP17dKi3IJ4SlAZuoTWUA3qGb9Fp3R', '<ul>\r\n	<li>\r\n	<p>Brand:UIISII</p>\r\n	</li>\r\n	<li>\r\n	<p>Model:BN90J</p>\r\n	</li>\r\n	<li>\r\n	<p>Speaker:6mm Dual Dynamic Drive, 20Hz-20kHz, 32&Omega; &plusmn; 15%</p>\r\n	</li>\r\n	<li>\r\n	<p>Output:110&plusmn;3db</p>\r\n	</li>\r\n	<li>\r\n	<p>Microphone:MEMS, &ndash; 41dB&plusmn;3dB</p>\r\n	</li>\r\n	<li>\r\n	<p>Battery Life:24 Hours</p>\r\n	</li>\r\n	<li>\r\n	<p>Input Power:250mAh/3.7V</p>\r\n	</li>\r\n	<li>\r\n	<p>Earbud Charge Time:2.5 Hours</p>\r\n	</li>\r\n	<li>\r\n	<p>Standby Time:about 480 Hours</p>\r\n	</li>\r\n	<li>\r\n	<p>Version:Bluetooth 5.0</p>\r\n	</li>\r\n	<li>\r\n	<p>Bluetooth Chip:BK3266</p>\r\n	</li>\r\n	<li>\r\n	<p>Range:30+ ft</p>\r\n	</li>\r\n	<li>\r\n	<p>Support Protocols:HSP/HFP/A2DP/AVRCP</p>\r\n	</li>\r\n	<li>\r\n	<p>Wire length:11.81in</p>\r\n	</li>\r\n	<li>\r\n	<p>IP Rating: IPX5</p>\r\n	</li>\r\n</ul>', NULL, NULL, 1499.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(931, 1, 6, NULL, '1050', 'Remax RM-301 Candy Wired Earphone', 'remax-rm-301-candy-wired-earphone-TT2a6ZhlYTq5WMUgoeWlp00JQ5rTCE8u38NKKgZx', '<p><strong>Remax RM-301 Candy Wired Earphone</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Driver Diameter: 10mm</strong></li>\r\n	<li><strong>Frequency Response: 20Hz--20kHz</strong></li>\r\n	<li><strong>Impedance: 32&Omega;</strong></li>\r\n	<li><strong>Sensitivity(SPL): 90&plusmn;3db</strong></li>\r\n	<li><strong>Rated Input Power: 20mW</strong></li>\r\n	<li><strong>Plug: :3.5mm</strong></li>\r\n	<li><strong>Cord Length: 1.2meters</strong></li>\r\n</ul>', NULL, NULL, 650.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(932, 1, 6, NULL, '1051', 'Remax RM-501i Wired Music Headset', 'remax-rm-501i-wired-music-headset-7MdlYE5aLDsDgqnUIirY4AMNNT7eqQUopm2TMZQG', '<ul>\r\n	<li>Product Type : RM - 512</li>\r\n	<li>Frequency Responce : 20Hz-20kHz</li>\r\n	<li>Sensitivity : 95dB&plusmn;4dB</li>\r\n	<li>Impedence : 32&Omega;</li>\r\n	<li>Rated Input : 3mW</li>\r\n	<li>Drive Unit : 9mm dual units</li>\r\n	<li>Pin : 3.5 Straight</li>\r\n	<li>Cable Length : 1.2m</li>\r\n</ul>', NULL, NULL, 350.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(933, 1, 6, NULL, '1052', 'Remax RW-105 Music Earphone With HD Mic', 'remax-rw-105-music-earphone-with-hd-mic-4HaOJiFjhkf4qCNAoaQ7uuCOySPDWcs6t8cwTz2B', '<ul>\r\n	<li>High Purity OFC Oxygen Free Copper Wire</li>\r\n	<li>Easy Noise Isolation</li>\r\n	<li>Passive Shielding the External Noise Design Of The Ear Canal (IEMs)</li>\r\n	<li>Ergonomic Design</li>\r\n	<li>Fine Texture Mic Shell</li>\r\n</ul>', NULL, NULL, 450.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(934, 1, 6, NULL, '1053', 'REMAX RM 510 In-Ear Earphone - Black', 'remax-rm-510-in-ear-earphone-black-Qvltfe2ibqaIsDbktchDpQZL2EcuWqJV39M7q8KA', '<ul>\r\n	<li>Speaker size 10MM</li>\r\n	<li>Impedance 16+_15%</li>\r\n	<li>Frequency response 20-20000Hz</li>\r\n	<li>Sensitivity 87 +_3dB</li>\r\n	<li>Microphone sensitivity 42 +_ 3dB</li>\r\n	<li>Bear the maximum thrust 20mw</li>\r\n	<li>Plug:3.5mm LLine length 1.2M</li>\r\n</ul>', NULL, NULL, 700.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(935, 1, 6, NULL, '1054', 'REMAX RM-303 PURE MUSIC SURROUND EARPHONE', 'remax-rm-303-pure-music-surround-earphone-R5WBHKko7PmY1a7L5gLNc4BUkE3lQ7W2j2pynyy7', '<ul>\r\n	<li>Driver Diameter: 9mm</li>\r\n	<li>Headphone Style: In-Ear</li>\r\n	<li>Frequency Response: 20Hz--20kHz</li>\r\n	<li>Impedance: 16 &Omega;</li>\r\n	<li>Sensitivity(SPL): 100&plusmn;3db</li>\r\n	<li>Rated Input Power: 80mW7</li>\r\n	<li>Plug: :￠3.5mm</li>\r\n	<li>Cord Length: 1.2meters</li>\r\n	<li>Compatible Models: All Android Mobile Phone</li>\r\n</ul>', NULL, NULL, 950.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(936, 1, 6, NULL, '1055', 'REMAX RM 510 In-Ear Earphone With Metal box', 'remax-rm-510-in-ear-earphone-with-metal-box-tKjrPPlLaeaOVHGy9iLOmyxwGRFhctQAMLlBhgAM', '<ul>\r\n	<li>Cable length: 1.2m</li>\r\n	<li>Mic Sensitivity: 42+-3dB</li>\r\n	<li>Impedance: 16-15 percentage</li>\r\n	<li>Maximumpower&pound;&ordm;10mW</li>\r\n	<li>HD Microphone</li>\r\n	<li>Frequency range: 20-20000HZ</li>\r\n	<li>Level of sensitivity: 87-3dB</li>\r\n	<li>510 touch music wired earphone</li>\r\n	<li>Compatibility and Comfortable</li>\r\n</ul>', NULL, NULL, 650.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(937, 1, 6, NULL, '1056', 'REMAX RM 512 High Performance Wired In Ear Earphone Stereo with Mic, 3.5mm Jack', 'remax-rm-512-high-performance-wired-in-ear-earphone-stereo-with-mic-35mm-jack-2FcLGjX0sEBkSJeiMxomKY3p0GgeYXGV30z0oUEB', '<ul>\r\n	<li>Brand: REMAX</li>\r\n	<li>Model: RM-512</li>\r\n	<li>Features: HD Microphone / Compatibility / Volume Control</li>\r\n	<li>Material: TPE</li>\r\n	<li>Impedance: 32&Omega;</li>\r\n	<li>Frequency: 20-20k Hz</li>\r\n	<li>Bar Code Available(You can Check Its Originality.</li>\r\n</ul>', NULL, NULL, 300.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(938, 1, 6, NULL, '1057', 'Orginal Remax RM 610D In-Ear Headphone', 'orginal-remax-rm-610d-in-ear-headphone-8qfSW8GE1Oqr0z8YQTic3O6rLCpmBYofv7i8AMSc', '<ul>\r\n	<li>Working Power: 100mw</li>\r\n	<li>The headset pin: 3.5mm (plating)</li>\r\n	<li>Acuity: 95 + 3 db</li>\r\n	<li>Wire length: 120cm</li>\r\n	<li>Gold plated plugs</li>\r\n	<li>Driver Diameter: 9mm</li>\r\n	<li>Frequency Response: 20Hz--20kHz</li>\r\n	<li>Impedance: 16 &Omega;</li>\r\n	<li>Sensitivity(SPL): 100&plusmn;3db</li>\r\n	<li>Rated Input Power: 80mW7</li>\r\n	<li>Plug: :￠3.5mm</li>\r\n	<li>Cord Length: 1.2meters</li>\r\n	<li>Compatibility: iOS, Android, OS Mobile Platforms</li>\r\n	<li>SmartSwitch controller and earbuds included</li>\r\n	<li>Two-way mutual conversion with crystal clear sound</li>\r\n	<li>Unit size: 1cm (moving-coil speaker)</li>\r\n</ul>', NULL, NULL, 500.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(939, 1, 6, NULL, '1058', 'Remax RB-S28 Neck-Mounted Wireless Bluetooth Earphones', 'remax-rb-s28-neck-mounted-wireless-bluetooth-earphones-fODdGBqm3b0jOBMfTvF4KnTgJNNWvOEOntztPqke', '<ul>\r\n	<li>Type: Bluetooth Earphone</li>\r\n	<li>Material: Metal, Plastic</li>\r\n	<li>Transmission Distance: 10m</li>\r\n	<li>Bluetooth: Bluetooth 5.0</li>\r\n	<li>Frequency Response: 20Hz-2000Hz</li>\r\n	<li>Output Sensitivity: -90.5dB</li>\r\n	<li>Microphone Sensitivity: 42dB</li>\r\n	<li>Playing Time: 4-5 Hours</li>\r\n</ul>', NULL, NULL, 1650.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(940, 1, 6, NULL, '1059', 'Remax S2 Magnetic Wireless Bluetooth Headset', 'remax-s2-magnetic-wireless-bluetooth-headset-UZzuvun5wfIuqsR9haujYIYEim831dtUVfM6Exjs', '<ul>\r\n	<li>Brand: REMAX</li>\r\n	<li>Model: S2</li>\r\n	<li>Wearing type : In-Ear</li>\r\n	<li>Function: Multi connection function,Song Switching,Voice control,</li>\r\n	<li>Bluetooth Connectivity : Wireless</li>\r\n	<li>Application: Sport</li>\r\n	<li>Sound channel: Two-channel (stereo)</li>\r\n	<li>Frequency response: 20~20KHz</li>\r\n	<li>Microphone frequency: -41 &plusmn; dB</li>\r\n	<li>Input Power: 10mW</li>\r\n	<li>Standby time: 48 hours</li>\r\n	<li>Charging time: about 2 hours</li>\r\n	<li>Bluetooth: Yes</li>\r\n	<li>Bluetooth version: V4.1</li>\r\n	<li>Bluetooth distance: W/O obstacles 10m</li>\r\n	<li>Package Weight: 0.234 kg</li>\r\n	<li>1 x REMAX S2 Wireless</li>\r\n	<li>Bluetooth 4.1 Magnet Sport Headsets</li>\r\n	<li>1 x User Manual</li>\r\n	<li>1 x USB Cable</li>\r\n	<li>3 x Pairs EarBuds</li>\r\n</ul>', NULL, NULL, 2000.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(941, 1, 6, NULL, '1060', 'REMAX RM-711 WIRE CONTROLLED EARPLUG TYPE EARPHONE', 'remax-rm-711-wire-controlled-earplug-type-earphone-VMfn42Rp9eit03NXF0Ts3tYqHCjGSgtzxv6iVYaA', '<ul>\r\n	<li>Model RM-711</li>\r\n	<li>Appearancety peearplugtype</li>\r\n	<li>Technologycategorymovingcoiltype</li>\r\n	<li>Transmissionmodewired</li>\r\n	<li>Sensitivity100(dB)</li>\r\n	<li>Linelength120(CM)</li>\r\n	<li>Thegrossweightoftheproductis0.05kg</li>\r\n	<li>Compatibleplatform</li>\r\n	<li>Colorblack</li>\r\n</ul>', NULL, NULL, 850.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(942, 1, 6, NULL, '1061', 'Remax Rpp-139 10000Mah Leader Series Power Bank', 'remax-rpp-139-10000mah-leader-series-power-bank-neMOXM6mBKbb6bjiaQJXOXvk7Jwa66UjFcwzM7Wx', '<p>Real capacity:10000mAh</p>\r\n\r\n<p>Input port:Micro&amp;&amp;TypeC</p>\r\n\r\n<p>Input:5V/2A</p>\r\n\r\n<p>Output:5V/2A</p>\r\n\r\n<p>Polymer battery</p>\r\n\r\n<p>With LED digital screen display</p>', NULL, NULL, 1100.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(943, 1, 6, NULL, '1062', 'Remax Rpp-147 10000Mah Jany Series Power Bank', 'remax-rpp-147-10000mah-jany-series-power-bank-FkOifko2HMzba82lGja3Qgm4cOcLCd3tlm1zGC5o', '<p>Weight: 250g,<br />\r\nType-C Input: DC5V 2A,<br />\r\nSize: 135.7*67.3*15.5 mm,<br />\r\nMicro Input: DC5V 2A,<br />\r\nMaterial: PC+ABS,<br />\r\nCertification: RoHS/FCC/CE,<br />\r\nOutput: DC5V 2.1A,<br />\r\nBattery Capacity: 10000mAh,</p>', NULL, NULL, 1100.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(944, 1, 6, NULL, '1063', 'Remax Rpp-141 30000Mah Leader Series Power Bank', 'remax-rpp-141-30000mah-leader-series-power-bank-xv1We3JLcLSM62wcoRhtVitixBnmKcRlejzK1JM7', '<ul>\r\n	<li>Output Interface:DC,</li>\r\n	<li>Micro USB,</li>\r\n	<li>Type C Input</li>\r\n	<li>Interface:DC,</li>\r\n	<li>USB Supports</li>\r\n	<li>Solar Power:No</li>\r\n	<li>LED Illumination:No</li>\r\n	<li>Battery Type:Lithium Polymer Battery</li>\r\n	<li>Name:Remax</li>\r\n	<li>Models:RPP-141</li>\r\n	<li>Measurement:14.2 * 7.3 * 2.6 cm</li>\r\n	<li>Weight:500g</li>\r\n	<li>Socket Type:USB Outport:5 V / 2.0A</li>\r\n	<li>Input Signal:5 V / 2.0A</li>\r\n	<li>Product Name:Large Capacity Polymer USB Power Bank</li>\r\n	<li>Feature 1:Large Capacity</li>\r\n	<li>Shape:Lycra, shaped like a camera</li>\r\n</ul>', NULL, NULL, 2200.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(945, 1, 6, NULL, '1064', 'Remax RPP 123 5000mAh Power Bank Orginal', 'remax-rpp-123-5000mah-power-bank-orginal-FSgeB6PNgcD63LFDphcoeg9iE3NFDcj6tpBrXsfp', '<ul>\r\n	<li>Brand:Remax</li>\r\n	<li>Model:RPP-123</li>\r\n	<li>Battery Type:Linon 2 Battery</li>\r\n	<li>Weight:100g</li>\r\n	<li>Output:DC5V/2A(Max)</li>\r\n	<li>Output Interface:1 USB</li>\r\n	<li>Battery Capacity(mAh):5000mAh</li>\r\n	<li>Input Interface:Micro USB</li>\r\n</ul>', NULL, NULL, 925.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(946, 1, 6, NULL, '1065', 'REMAX LINON PRO POWER BANK 20000 mAh', 'remax-linon-pro-power-bank-20000-mah-yBMimHOQQDtI7gSHrJZrP8PQo440UqeX5ZcwnOfY', '<ul>\r\n	<li>Brand REMAX</li>\r\n	<li>Name Linon Pro Power Bank</li>\r\n	<li>Model RPP-73</li>\r\n	<li>Capacity 20000mAh</li>\r\n	<li>Electric Core Polymers</li>\r\n	<li>Input DC5V-2.0A(max)</li>\r\n	<li>Output DC5V-2.0A(max)</li>\r\n	<li>Materials ABS PC</li>\r\n</ul>', NULL, NULL, 2500.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(947, 1, 6, NULL, '1066', 'REMAX RPP-119 10,000mAh Portable Power Bank Dual USB-port Charging Station', 'remax-rpp-119-10000mah-portable-power-bank-dual-usb-port-charging-station-WbY7yPHdkS9bxqKRmnOSmyT2lQoYCSZ249fTwXj1', '<ul>\r\n	<li>BRAND NAME:Remax</li>\r\n	<li>MODEL:RPP-119</li>\r\n	<li>TYPE:Emergency / Portable</li>\r\n	<li>INPUT:5V-2.0A</li>\r\n	<li>OUTPUT:5V/2A</li>\r\n	<li>BATTERY CAPACITY:10000mAh</li>\r\n	<li>MATERIAL:PC+ABS</li>\r\n</ul>', NULL, NULL, 1800.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(948, 1, 6, NULL, '1067', 'REMAX Leader 2 USB 10000mAh Multiple Input Power Bank RPP-139', 'remax-leader-2-usb-10000mah-multiple-input-power-bank-rpp-139-ShSmpPQEVM1nfMsw5shiosm7BH9zz5P3Z1zba7jZ', '<ul>\r\n	<li>Manufacturer: Remax</li>\r\n	<li>Model: RPP-139</li>\r\n	<li>Battery capacity: 10,000mAh</li>\r\n	<li>Actual norm: 6100mAh</li>\r\n	<li>Compact design</li>\r\n	<li>High-quality ABS material</li>\r\n	<li>Compatibility: Micro port, Type-c, USB</li>\r\n	<li>Input: DC5V &ndash; 2.0A</li>\r\n	<li>Output: DC5V &ndash; 2.0A</li>\r\n	<li>Size: 1328.96 * 68.44 * 14.5mm</li>\r\n</ul>', NULL, NULL, 1150.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(949, 1, 6, NULL, '1068', 'Remax RPP-153 Janshon Series 10000mAh Power Bank', 'remax-rpp-153-janshon-series-10000mah-power-bank-ItaZWZaLlPf2Exhu0VA1FjbRGaWBDgodWLTmRaTl', '<p>Remax RPP-153 10000mAh Pro Powerful Power Bank :</p>\r\n\r\n<p>&gt; Brand Name:Remax</p>\r\n\r\n<p>&gt; Model Number:RPP-153</p>\r\n\r\n<p>&gt; Material:ABS+PC</p>\r\n\r\n<p>&gt; Color:White ,Black</p>\r\n\r\n<p>&gt; Output Interface:DC, Single USB</p>\r\n\r\n<p>&gt; Input Interface:Micro USB/AC, USB TYPE C</p>\r\n\r\n<p>&gt; Supports Solar Energy:No</p>\r\n\r\n<p>&gt; Is LED Lamp Illumination:No</p>\r\n\r\n<p>&gt; Battery Type:Li-Polymer Battery, Lithium Battery</p>\r\n\r\n<p>&gt; Place of Origin:Guangdong, China</p>\r\n\r\n<p>&gt; Socket Type:USB Port</p>\r\n\r\n<p>&gt; Features:Type C Micro inputs, Double Inputs</p>\r\n\r\n<p>&gt; Outport:DC 5V 2.0A</p>\r\n\r\n<p>&gt; Input:DC 5V 2.0A</p>\r\n\r\n<p>&gt; Capacity:10000mAh</p>', NULL, NULL, 1780.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(950, 1, 6, NULL, '1069', 'Remax RPP-106 20000mAh Power Bank Dual In And Out With LED Digital Display', 'remax-rpp-106-20000mah-power-bank-dual-in-and-out-with-led-digital-display-NjxfvvVUSuquw6lNY9bmldBHZeg5WgB9PfqHAstC', '<ul>\r\n	<li>Brand: Remax</li>\r\n	<li>Model: RPP-106</li>\r\n	<li>20000mAh</li>\r\n</ul>', NULL, NULL, 2400.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(951, 1, 6, NULL, '1070', 'Remax Proda PP-N3 Notebook 30000mAh Power Bank 4 USB Port-Black', 'remax-proda-pp-n3-notebook-30000mah-power-bank-4-usb-port-black-c3llrhTcG7EMXtIL1zbZdsdduQOhr31umgdX27fy', '<ul>\r\n	<li>Package includes: Pure 30000mAh Power Bank, Micro USB Charger Cable, and User Manual</li>\r\n	<li>Model: PP-N3</li>\r\n	<li>Capacity: 30000mAh</li>\r\n	<li>Input: DC5V/2.0A</li>\r\n	<li>Output: DC5V/4.2A</li>\r\n	<li>Product size: 16.3cm x 10.2cm x 1.2cm</li>\r\n	<li>Product weights: 400g</li>\r\n	<li>Package size: 22.5cm x 12.5cm x 1.5cm</li>\r\n	<li>Package weights: 500g</li>\r\n	<li>30000mAh Power Bank x 1</li>\r\n	<li>USB Charger Cable x 1</li>\r\n	<li>User Manual x 1</li>\r\n</ul>', NULL, NULL, 2950.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(952, 1, 6, NULL, '1071', 'Xiaomi Piston Basic In Ear Earphone - Black', 'xiaomi-piston-basic-in-ear-earphone-black-z5D1sOctgGeslPmWTrOmHetjqFFCspFvdxsMVSlO', '<ul>\r\n	<li>Color: Black,Blue,Pink,Purple,Silver</li>\r\n	<li>Function: Answering Phone,Microphone,Song Switching</li>\r\n	<li>Material: Aluminum Alloy,TPE</li>\r\n	<li>Model: Piston Earphones Fresh Version</li>\r\n	<li>Cable Length (m): 1.25m</li>\r\n	<li>Compatible with: iPod</li>\r\n	<li>Connectivity: Wired</li>\r\n	<li>Frequency response: 20-20000Hz</li>\r\n	<li>Impedance: 32ohms</li>\r\n	<li>Input Power: 5mW</li>\r\n	<li>Plug Type: 3.5mm</li>\r\n	<li>Sensitivity: 98 dB (S.P.L at 1KHz)</li>\r\n</ul>', NULL, NULL, 790.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(953, 1, 6, NULL, '1072', 'Xiaomi Mi Sports Bluetooth Earphone Youth Edition Black', 'xiaomi-mi-sports-bluetooth-earphone-youth-edition-black-RUXGuVEbnuq4g8Jt50zU8oKjOPV3bZqgk34AFjEL', '<ul>\r\n	<li>PRODUCT PACKAGING IN CHINESE ONLY.</li>\r\n	<li>Sweat proof running sports earphone</li>\r\n	<li>Anti-shedding sports earphone</li>\r\n	<li>11 hours long lasting battery life</li>\r\n	<li>IPX4 Professional waterproof</li>\r\n</ul>', NULL, NULL, 2250.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(954, 1, 6, NULL, '1073', 'Redmi AirDots Pro Touch with Display TWS Bluetooth Wireless Earbuds 5.0 TWS Earphones for Xiaomi', 'redmi-airdots-pro-touch-with-display-tws-bluetooth-wireless-earbuds-50-tws-earphones-for-xiaomi-jgMSSzL655z12lKIvZKxYimy7Wtx5s8y29lNBOO2', '<ul>\r\n	<li>Touch with Display</li>\r\n	<li>type c charging</li>\r\n	<li>7.2mm Audio Drivers</li>\r\n	<li>4.1g Compact Structure</li>\r\n	<li>One Touch to Connect and Listen To the Original Sound</li>\r\n	<li>Bluetooth 5.0</li>\r\n	<li>300mAh Charging Dock</li>\r\n	<li>Bluetooth 5.0, faster and more stable. .</li>\r\n	<li>Dustproof and IPX4 waterproof, Double-eared split design, single and double ears are free to wear. .</li>\r\n	<li>Will automatically pair, power on after taking out from the 280mAh charging box. .</li>\r\n</ul>', NULL, NULL, 2450.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(955, 1, 6, NULL, '1074', 'For Xiaomi Mi In-Ear Piston Type C Earphone', 'for-xiaomi-mi-in-ear-piston-type-c-earphone-yq7qSInPjKEIiqw301CGqHcdYKZlapvNDBlJsOBC', '<ul>\r\n	<li>Brand : Xiaomi</li>\r\n	<li>Type : In-Ear Wired</li>\r\n	<li>Connectors: Type c</li>\r\n	<li>Sensitivity: 98dB</li>\r\n	<li>Wire Length: 1.1m</li>\r\n	<li>Waterproof: Yes</li>\r\n	<li>Resistance: 32&Omega;</li>\r\n</ul>', NULL, NULL, 550.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(956, 1, 6, NULL, '1075', 'Redmi Mi Power Bank 10000mAh Dual Input & Dual Output - White', 'redmi-mi-power-bank-10000mah-dual-input-dual-output-white-yFVkDEbNjc3HrmnS7xyMA2c47qnd9P8pMDGajuv2', '<ul>\r\n	<li>10000mAh Large Capacity</li>\r\n	<li>More durable and optimises charging efficiency, offer constant power</li>\r\n	<li>Dual USB Input and Output</li>\r\n	<li>Two USB ports, which can charge the devices at the same time, the USB-C and Micro USB provide two charging ways, convenient and fast</li>\r\n	<li>Power Input</li>\r\n	<li>5V 2.1A power input, deliver fast and efficient charging for each connected device.</li>\r\n	<li>High-density Lithium Polymer Batteries</li>\r\n	<li>Adopts premium Lithium polymer battery cells. It&#39;s compatible with smartphones and tablets as well as a variety of digital cameras and handheld gaming devices.</li>\r\n	<li>No Cable inside Powerbank Box, Cable Provided Externally</li>\r\n</ul>', NULL, NULL, 1650.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(957, 1, 6, NULL, '1076', 'Xiaomi Version 2 Dual USB Power Bank 10000mAh - Black', 'xiaomi-version-2-dual-usb-power-bank-10000mah-black-tt7OqXRTS5MbJm5gXjtkEnvfr8gozZo5ph8DrHCo', '<ul>\r\n	<li>Batteries type: Li-pol</li>\r\n	<li>Input interface: Micro USB</li>\r\n	<li>Output interface: USB-A</li>\r\n	<li>Rated power:10000mAh 3.85V ( 38.5Wh )</li>\r\n	<li>Input current: 5.0V2.0A 9V/12V18W</li>\r\n	<li>Output current: 5.1V2.4A 9V/12V15W MAX</li>\r\n	<li>Charging time: About 4.2 hours (18W charger)</li>\r\n	<li>About 6.2 hours (10W charger)</li>\r\n	<li>Battery capacity: 10000mAhSafety</li>\r\n	<li>Short circuit protection</li>\r\n	<li>Charge and discharge temperature protection</li>\r\n	<li>Protection against electromagnetic</li>\r\n	<li>Input voltage protection</li>\r\n</ul>', NULL, NULL, 2300.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(958, 1, 6, NULL, '1077', 'Xiaomi_Mi 10000mAh Power bank 3 18W Two-way Quick Charge', 'xiaomi-mi-10000mah-power-bank-3-18w-two-way-quick-charge-djDnmNqaKvRR0EmCwoXdBtsQLsXpwc3mSPUeByhI', '<ul>\r\n	<li>Xiaomi_power bank 3 10000mAh USB-C two-way fast charge, USB-A and USB-C interface support 18W MAX fast charging,providing you with a convenient fast charging experience.</li>\r\n	<li>Xiaomi_power bank 3 10000mAh USB-C two-way fast charge version supports a variety of fast charge protocols,Intelligent identification device charging current, USB-C interface supports bidirectional 18W MAX fast charging,input and output faster.</li>\r\n	<li>14.2mm thin easier and comfortable in hand</li>\r\n	<li>Xiaomi_power bank 3 can be quickly charged using a USB-C interface with a power of up to 18W MAX.</li>\r\n	<li>Up to 93% conversion rate, Optimized charging/discharging efficiency</li>\r\n	<li>World-class chips are not only safer, they improve charging conversion rates and stabilize discharging voltage.With advanced resistance-capacitance sensors, 10000mAh Mi_Power Bank 2 is more durable and optimizes charging efficiency.</li>\r\n	<li>Incredibly dense, 10000mAh batteries supplied by ATL/Lishen are used to satisfy the portable power needs for your phone, tablet, camera, and more.</li>\r\n</ul>', NULL, NULL, 2850.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(959, 1, 6, NULL, '1078', 'Redmi 20000mAh 18W QC3.0 Power Bank Fast Charging Version White Large capacity Power Bank Portable Phone Charger', 'redmi-20000mah-18w-qc30-power-bank-fast-charging-version-white-large-capacity-power-bank-portable-phone-charger-cfqIjolLPlJOKfyXyTkkayl0EZQtWBTwT4uPysNb', '<ul>\r\n	<li>10000mAh Large Capacity</li>\r\n	<li>More durable and optimises charging efficiency, offer constant power</li>\r\n	<li>Dual USB Input and Output</li>\r\n	<li>Two USB ports, which can charge the devices at the same time, the USB-C and Micro USB provide two charging ways, convenient and fast</li>\r\n	<li>Power Input</li>\r\n	<li>5V 2.1A power input, deliver fast and efficient charging for each connected device.</li>\r\n	<li>High-density Lithium Polymer Batteries</li>\r\n	<li>Adopts premium Lithium polymer battery cells. It&#39;s compatible with smartphones and tablets as well as a variety of digital cameras and handheld gaming devices.</li>\r\n	<li>No Cable inside Powerbank Box, Cable Provided Externally</li>\r\n</ul>', NULL, NULL, 2750.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(960, 1, 6, NULL, '1079', 'Mi 12 Basic with Mic-Ultra deep bass In-Earphone for Xiaomi - White', 'mi-12-basic-with-mic-ultra-deep-bass-in-earphone-for-xiaomi-white-UNHQI051pqcqRT9dbA6R4YwWfUgCnTA0JLNZwgkj', '<ul>\r\n	<li>Earpiece Design: Earbud (In Ear)</li>\r\n	<li>Wireless Technology: Not applicable</li>\r\n	<li>Connector: 3.5mm Jack</li>\r\n	<li>Headphone Style: In-Ear</li>\r\n	<li>​Microphone</li>\r\n	<li>Headphone Jack: 3.5mm</li>\r\n	<li>Cable length: 115cm</li>\r\n	<li>Wire Material: Plastic</li>\r\n	<li>Compatible Models: All Android Mobile Phone.</li>\r\n	<li>Frequency Response Range: 20~20,000 Hz</li>\r\n	<li>Sensitivity: 104 dB</li>\r\n	<li>Impedance: 32 ohm</li>\r\n	<li>Cable Length: 110cm</li>\r\n</ul>', NULL, NULL, 180.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(961, 1, 6, NULL, '1080', 'Mi In-Ear Pro HD Headphones', 'mi-in-ear-pro-hd-headphones-LQYrDGctl7cEFokURalep0F2anYWmioN3Xf1FTkc', '<ul>\r\n	<li>Material: Metal</li>\r\n	<li>Type: In-Ear</li>\r\n	<li>Cable Length (m): 1.25m</li>\r\n	<li>Connecting interface: 3.5mm</li>\r\n	<li>Connectivity: Wired</li>\r\n	<li>Frequency response: 20 - 40KHz</li>\r\n	<li>Impedance: 32ohms</li>\r\n	<li>Plug Type: 3.5mm</li>\r\n</ul>', NULL, NULL, 1650.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(962, 1, 6, NULL, '1081', 'Mi In Ear Pro HD MAX Headphones - Golden', 'mi-in-ear-pro-hd-max-headphones-golden-LgtRJw44mJjqozKXKSHQOOE5OuIoUz6kKODLBQtd', '<ul>\r\n	<li>Every great story comes with great music</li>\r\n	<li>Product name:Mi In-Ear Headphones Pro HD</li>\r\n	<li>Model no.:QTEJ02JY</li>\r\n	<li>Type of Headphones:In-Ear</li>\r\n	<li>Weight:17g</li>\r\n	<li>Color:Silver</li>\r\n	<li>Wired control:Available</li>\r\n	<li>Cable length:1.25m</li>\r\n	<li>Jack type:3.5mm</li>\r\n	<li>Rated power:5mW</li>\r\n	<li>Speaker Impedance:32 &Omega;</li>\r\n	<li>Sensitivity:98 dB</li>\r\n	<li>Frequency response range:20 - 40,000 Hz</li>\r\n	<li>Standards:Q / WMSX004-2016</li>\r\n</ul>', NULL, NULL, 1850.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(963, 1, 6, NULL, '1082', 'Realme Buds 2 Subwoofer Stereo Wired Earphones with Mic', 'realme-buds-2-subwoofer-stereo-wired-earphones-with-mic-WasaISrkXKkS44uQRvhVxebU98aLHtTER3HBUNgq', '<ul>\r\n	<li>Brand: Realme</li>\r\n	<li>Color: Black</li>\r\n	<li>Type: In-ear</li>\r\n	<li>Connector: 3.5mm audio jack</li>\r\n	<li>In-line Remote: Yes</li>\r\n	<li>11.2mm bass boost driver</li>\r\n	<li>Built-in Magnets</li>\r\n	<li>In-line 3-Button Remote with Mic</li>\r\n	<li>Adjustable Cable Strap</li>\r\n</ul>', NULL, NULL, 750.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(964, 1, 6, NULL, '1083', 'Realme Buds R20 heavy bass & mic 3.5MM In-Ear Earphones', 'realme-buds-r20-heavy-bass-mic-35mm-in-ear-earphones-rkQIxVZPlB3GC83gUekhGpQaCwxuYfU3Z42kir5r', '<ul>\r\n	<li>Ultralight and classic flat-ear plugs design</li>\r\n	<li>Single-sided design allows to adjust and fit the earphone in right or left ear</li>\r\n	<li>High quality moving-coil loudspearker driver unit</li>\r\n	<li>High fidelity sound,enhance stable signal transmission</li>\r\n	<li>Driver Diameter: 14.2mm</li>\r\n	<li>Impedance: 32&Omega;</li>\r\n	<li>Sensitivity(SPL): 92&plusmn;3dB</li>\r\n	<li>Frequency Response: 20Hz--20000Hz</li>\r\n	<li>Power(Max): 50mw</li>\r\n	<li>Cable length: 120cm</li>\r\n	<li>Headset pin: 3.5mm</li>\r\n</ul>', NULL, NULL, 450.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(965, 1, 6, NULL, '1084', 'Realme Buds Wireless In-Ear Bluetooth Headset with Mic Sports headphones Earphone Audio Earbuds', 'realme-buds-wireless-in-ear-bluetooth-headset-with-mic-sports-headphones-earphone-audio-earbuds-07bNPxtnx2RvqlDKGUe9GD7488ah1VJo7h248TgC', '<ul>\r\n	<li>Type: Necklace Earphone</li>\r\n	<li>Quantity: 1 PCS</li>\r\n	<li>Material : Plastic</li>\r\n	<li>Color: Yellow</li>\r\n	<li>Geranic Name: Earphones</li>\r\n</ul>', NULL, NULL, 1750.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(966, 1, 6, NULL, '1085', 'Realme Buds Tws -2', 'realme-buds-tws-2-4sV3vHnpQYv2mOKgAtGiS6tquHbb3fn8p8z5IYEh', '<ul>\r\n	<li>Durable Build</li>\r\n	<li>Sweat Proof</li>\r\n	<li>Pure Base Performance</li>\r\n	<li>3 Button Mic</li>\r\n	<li>Universal Control</li>\r\n	<li>5 Hour Battery</li>\r\n	<li>Wireless</li>\r\n	<li>Power bank system charging</li>\r\n	<li>Smooth sound quality</li>\r\n	<li>Bluetooth standard:Bluetooth 5.1 version</li>\r\n	<li>Connection Standby: More than 5 Hours</li>\r\n	<li>Talk time : More than 3 hours</li>\r\n	<li>Song time :2.5 to 3 hours</li>\r\n	<li>Charging time :1 hour</li>\r\n</ul>', NULL, NULL, 1850.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(967, 1, 6, NULL, '1086', 'Realme Buds TWS -4', 'realme-buds-tws-4-O89QoCqsbeIlyf5FtPzlpkSSdkN3YnFEPaGNstX1', '<ul>\r\n	<li>Edition :Wireless 5.0</li>\r\n	<li>Model :TWS-4</li>\r\n	<li>Transmit Range : &lt;=15m</li>\r\n	<li>Battery:Rechargeable polymer lithum-on battery</li>\r\n	<li>Charge time:&lt;2.5H</li>\r\n	<li>Operate hours:About 4 hours(battery saturation) about 100 H(battery saturation)</li>\r\n	<li>Power bank system charging</li>\r\n	<li>Smooth sound quality</li>\r\n	<li>Bluetooth standard:Bluetooth 5.0 version</li>\r\n	<li>Battery Compartment Capacity:40mA</li>\r\n</ul>', NULL, NULL, 1990.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(968, 1, 6, NULL, '1087', 'For Realme Buds In-ear Earphone 100% Original Bass Boosted Editio', 'for-realme-buds-in-ear-earphone-100-original-bass-boosted-editio-lnRFM6E3A4hCq7ZNFsWfjnZHPopeelV70V4jwt8G', '<ul>\r\n	<li>160 percent Louder Bass:</li>\r\n	<li>Built-in Magnets:</li>\r\n	<li>Kevlar for Ultimate Durability:</li>\r\n	<li>Frequency Rate: 20-20,000Hz and Cable Length: 1.25 m</li>\r\n	<li>Three-Button Remote: Control your music, handle phone calls, and even summon Google Assistant with three tactile inline buttons and a mic</li>\r\n	<li>Unmatched Style: Iconic logo and transparent earbuds with yellow accents flawlessly complement your Realme device like no other earphones can.</li>\r\n</ul>', NULL, NULL, 1150.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(969, 1, 6, NULL, '1088', 'RMA108 IPX4 OPPO Realme Buds Air Wireless Earphones Bass headset Realme X50 Pro 5G 6 Pro X2 Pro 5i 5 Pro XT Q', 'rma108-ipx4-oppo-realme-buds-air-wireless-earphones-bass-headset-realme-x50-pro-5g-6-pro-x2-pro-5i-5-pro-xt-q-heuFAmEbiI2e4YPw52t0JsVRef4DH4PjHido60gK', '<ul>\r\n	<li>Light and ComfortableThe realme Buds Wireless are ergonomic and made from high-quality silica gel and memory nickel-titanium alloy for your ultimate comfort.</li>\r\n	<li>Brand Realme</li>\r\n	<li>Model RMA108</li>\r\n	<li>Type In the Ear</li>\r\n	<li>Connectivity Wireless</li>\r\n	<li>Deep Bass Yes</li>\r\n	<li>Impedance 16&thinsp;ohm</li>\r\n	<li>Frequency Response 20&thinsp;Hz (Min) &ndash; 20&thinsp;KHz (Max)</li>\r\n	<li>Battery Lithium Ion 110mAh Battery</li>\r\n	<li>Charging Time 1.5&thinsp;hours</li>\r\n</ul>', NULL, NULL, 1850.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(970, 1, 6, NULL, '1089', 'D-Link DIR-650IN N300 300mbps WiFi Router', 'd-link-dir-650in-n300-300mbps-wifi-router-QcRVPEBjXdpPVx6ifJcXtQ77BTKtpbgDErYX83Sp', '<ul>\r\n	<li>Model: DIR-650IN</li>\r\n	<li>WPA/WPA2 &amp; Firewall(NAT) Security</li>\r\n	<li>Wireless Interface</li>\r\n	<li>4 X 5dBi External Antenna</li>\r\n	<li>Dimension: 255.9 x 168 x 41.2 mm</li>\r\n</ul>', NULL, NULL, 2250.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(971, 1, 6, NULL, '1090', 'D-Link DIR-806IN AC750 Dual-Brand Wireless Router (3 Antenna)', 'd-link-dir-806in-ac750-dual-brand-wireless-router-3-antenna-Auno1GDs7Z0m9QAgMrDK5o8A6ugpIFoR3i2ulZKY', '<ul>\r\n	<li>Model: DIR-806IN</li>\r\n	<li>2.4GHz (2x2) and 5GHz (1x1) up to 750 Mbps</li>\r\n	<li>Advanced Security</li>\r\n	<li>User based bandwidth limitations</li>\r\n	<li>IPv6 and TR-069 Supported</li>\r\n</ul>', NULL, NULL, 2750.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(972, 1, 6, NULL, '1091', 'D-Link DIR-819 AC750 Dual Band Router', 'd-link-dir-819-ac750-dual-band-router-mAy3b1wOR9MFWgE8HDKOGfATo2eW4eK71zqMxXcA', '<ul>\r\n	<li>Model: D-Link DIR-819 AC750</li>\r\n	<li>Next Generation Wireless Technology</li>\r\n	<li>3 High-Gain Antennas</li>\r\n	<li>Backward Compatibility</li>\r\n	<li>up to 1200 Mbps</li>\r\n</ul>', NULL, NULL, 2750.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(973, 1, 6, NULL, '1092', 'D-Link DIR-841 AC1200 MU-MIMO Wi-Fi Gigabit Router (4 Antena)', 'd-link-dir-841-ac1200-mu-mimo-wi-fi-gigabit-router-4-antena-RqiIrJFitGXPQ0ybutoOknznvp7CA36ERDG2LiLk', '<ul>\r\n	<li>Model: DIR-841</li>\r\n	<li>Gigabit Ethernet WAN port, Fast Ethernet LAN ports</li>\r\n	<li>Up to 300Mbps for 2.4GHz</li>\r\n	<li>up to 867Mbps for 5GHz</li>\r\n	<li>IPV6 Support</li>\r\n</ul>', NULL, NULL, 3450.00, 0.00, 1, 10, NULL, NULL, 0, 1, NULL, NULL),
(974, 1, 6, NULL, '1093', 'D-Link DIR-1360 EXO AC1300 Dual Band Smart Mesh Wi-Fi Router', 'd-link-dir-1360-exo-ac1300-dual-band-smart-mesh-wi-fi-router-hDsHUZcujhHGNfK23UpPlRy6ZKNK0sPIYzdp6d1s', '<ul>\r\n	<li>Model: D-Link DIR-1360 EXO AC1300</li>\r\n	<li>Wi-Fi speeds of up to 400 Mbps (2.4 GHz) + 867 Mbps (5 GHz)</li>\r\n	<li>Built-in powerful McAfee protection</li>\r\n	<li>Give your smart home Wi-Fi a new voice</li>\r\n	<li>Comprehensive parental controls</li>\r\n</ul>', NULL, NULL, 8000.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(975, 1, 6, NULL, '1094', 'D-Link DIR-600M Wireless N150 Router', 'd-link-dir-600m-wireless-n150-router-rwsI0PgccrqzO119TOPc2pME0rVSzdMOhQQ16uEx', '<ul>\r\n	<li>Model: DIR-600M Wireless N150</li>\r\n	<li>Interface: 1x LAN &amp; 4x WAN Ports</li>\r\n	<li>DIM: 11.1 x 15.1 x 2.7 cm</li>\r\n	<li>Frequency: 2.4 Ghz to 2.4835 Ghz</li>\r\n</ul>', NULL, NULL, 1650.00, 0.00, 1, 15, NULL, NULL, 0, 1, NULL, NULL),
(976, 1, 6, NULL, '1095', 'D-Link DIR-816 Wireless AC750 Dual Brand Router ( 3 Antenna)', 'd-link-dir-816-wireless-ac750-dual-brand-router-3-antenna-MM0eaXlDKhjnM6xzxtpMm9ovJabGH188hgWG3q32', '<ul>\r\n	<li>Model: D-Link DIR-816</li>\r\n	<li>Interface: 1x LAN &amp; 4x WAN Ports</li>\r\n	<li>DIM: 108H X 192W X 30D MM</li>\r\n	<li>Frequency: 2.4 GHz to 5 GHz</li>\r\n</ul>', NULL, NULL, 3600.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(977, 1, 6, NULL, '1096', 'D-Link DWR‑921 4G LTE Router', 'd-link-dwr921-4g-lte-router-0eujjAX6jutyhOjiFPzFBfvrsoYvqYTq4FskLKb5', '<ul>\r\n	<li>Model: D-Link DWR‑921</li>\r\n	<li>Wireless speed 300 Mbps 2.4 GHz</li>\r\n	<li>2 Antennas</li>\r\n	<li>support 3G/4G LTE via SIM</li>\r\n</ul>', NULL, NULL, 7450.00, 0.00, 1, 5, NULL, NULL, 0, 1, NULL, NULL),
(978, 1, 6, NULL, '1097', 'D-link DWR-910 4G Lte Wireless USB Sim Supported Modem + Pocket Router', 'd-link-dwr-910-4g-lte-wireless-usb-sim-supported-modem-pocket-router-JkbjN83lUcdMwbZ6hUgGYLjBANrF6DEwBwUq8vm5', '<ul>\r\n	<li>Model: D-link DWR-910</li>\r\n	<li>USB 2.0 plug connects</li>\r\n	<li>SIM Slot (6-pin) allows</li>\r\n	<li>MicroSD card reader allows</li>\r\n</ul>', NULL, NULL, 2850.00, 0.00, 1, 10, NULL, NULL, 0, 1, NULL, NULL),
(979, 1, 6, NULL, '1098', 'Uiisii HM9', 'uiisii-hm9-oIVzzzUzQycsTmqCfhn2CuNCBaZEEhSO2sKV1d7t', '<ul>\r\n	<li>Brand Name:UiiSii</li>\r\n	<li>Model Number:UIISII HM9</li>\r\n	<li>With Microphone:Yes</li>\r\n	<li>Function:For Mobile Phone,Common Headphone</li>\r\n	<li>Support Apt-x:No</li>\r\n	<li>Style:In-Ear</li>\r\n	<li>Waterproof:No</li>\r\n	<li>Active Noise-Cancellation:Yes</li>\r\n	<li>Support Memory Card:No</li>\r\n	<li>Resistance:16&Omega;</li>\r\n	<li>Volume Control:Yes</li>\r\n	<li>Connectors:3.5mm</li>\r\n	<li>Communication:Wired</li>\r\n	<li>Frequency Response Range:20-20000Hz</li>\r\n	<li>Line Length:1.2m</li>\r\n	<li>Plug Type:Line Type</li>\r\n	<li>Wireless Type:None</li>\r\n	<li>Vocalism Principle:Dynamic</li>\r\n	<li>Support APP:No</li>\r\n	<li>Is wireless:No</li>\r\n	<li>Sensitivity:102&plusmn;3dB</li>\r\n	<li>Control Button:Yes</li>\r\n</ul>', NULL, NULL, 1150.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(980, 1, 6, NULL, '1099', 'Chili Powder | Organic 100 gm', 'chili-powder-organic-100-gm-sH2PmMMRAovOkfbsADzwsT6dMm6qTf0xd0KN1tLa', '<p>&nbsp;* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* সম্পুর্ণ খাঁটি মরিচ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।&nbsp;</p>', NULL, NULL, 60.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(981, 1, 6, NULL, '1100', 'Chili Powder | Organic 200 gm', 'chili-powder-organic-200-gm-dENrVwPAJz0ojT2gVBo8ncDykjRASn6A0YhLlScz', '<p>&nbsp;* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* সম্পুর্ণ খাঁটি মরিচ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।&nbsp;</p>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -28px; top: -5.77778px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(982, 1, 6, NULL, '1101', 'Chili Powder | Organic 500gm', 'chili-powder-organic-500gm-132c7KsDsJfXV09dPl3jhMaHQ4fjlq1ulskCrVWQ', '<p>&nbsp;* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* সম্পুর্ণ খাঁটি মরিচ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।&nbsp;</p>', NULL, NULL, 230.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(983, 1, 6, NULL, '1102', 'Turmeric Powder | Organic 250 gm', 'turmeric-powder-organic-250-gm-qJsgtNHUdw5dV9qww2fJAyO5xgfrADHk1eNRzh87', '<p>* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* খাঁটি হলুদ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(984, 1, 6, NULL, '1103', 'Turmeric Powder | Organic 500 gm', 'turmeric-powder-organic-500-gm-YU4ORqY8KKBxvuex9luKukBejCq5cxjxKAtkwjUA', '<p>* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* প্রাকৃতিক উপাদান থেকে সংগৃহীত।</p>\r\n\r\n<p>* খাঁটি হলুদ গুড়া।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাতকৃত এবং প্যাকেজিংকৃত।</p>', NULL, NULL, 150.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(985, 1, 6, NULL, '1104', 'Coriander Powder । ধনিয়া গুড়া -', 'coriander-powder-dhniya-gura-AmAh6Xjv6KPxIRJRahPnFHIsWC6Cat3B8kvaq7UZ', '<p>* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* স্বাস্থ্যসম্মত মসলা।</p>\r\n\r\n<p>* পরিশুদ্ধ উপাদানের নিশ্চয়তা।</p>\r\n\r\n<p>* সর্বোচ্চ গুনগতমানের নিশ্চয়তা।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাত ও প্যাকেজিংকৃত।</p>', NULL, NULL, 45.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(986, 1, 6, NULL, '1105', 'Coriander Powder । ধনিয়া গুড়া - 200 gm', 'coriander-powder-dhniya-gura-200-gm-Gl1SXgVfl0vvH6fb2oPgS76mmfhOHYfAo2nSfJra', '<p>* শতভাগ ভেজালমুক্ত।</p>\r\n\r\n<p>* স্বাস্থ্যসম্মত মসলা।</p>\r\n\r\n<p>* পরিশুদ্ধ উপাদানের নিশ্চয়তা।</p>\r\n\r\n<p>* সর্বোচ্চ গুনগতমানের নিশ্চয়তা।</p>\r\n\r\n<p>* নিজস্ব তত্ত্বাবধাণে প্রক্রিয়াজাত ও প্যাকেজিংকৃত।</p>', NULL, NULL, 80.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(987, 1, 6, NULL, '1106', 'Pure Ghee | 1 kg', 'pure-ghee-1-kg-Q7JDb3mFDb5TeCAfUpL7xHoNqjirIv3AmQ6uwhLs', '<p>. Pure Ghee From cow milk</p>\r\n\r\n<p>. Money-Back Guarantee if prove it&#39;s not pure</p>', NULL, NULL, 1550.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(988, 1, 6, NULL, '1107', 'Pure Ghee | 500 gm', 'pure-ghee-500-gm-Dp3A1y1o1SGkjxraAXLzWmXScnh7fWe7kx35aje3', '<p>. Pure Ghee From cow milk</p>\r\n\r\n<p>. Money-Back Guarantee if prove it&#39;s not pure</p>', NULL, NULL, 775.00, 740.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(989, 1, 6, NULL, '1108', 'Pure Ghee | 250 gm', 'pure-ghee-250-gm-qZw8CC0aiukQFQegaKoRzrVTk0GYPiahvom57x9R', '<p>. Pure Ghee From cow milk</p>\r\n\r\n<p>. Money-Back Guarantee if prove it&#39;s pure</p>', NULL, NULL, 410.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(990, 1, 6, NULL, '1109', 'i7s TWS Mini Wireless Bluetooth Earphone Stereo Earbud Headset With air Charging Box', 'i7s-tws-mini-wireless-bluetooth-earphone-stereo-earbud-headset-with-air-charging-box-Re8ZdgLtba8CA2ZB0nDTGQIIrGqVhDT4KXk5cJLb', '<ul>\r\n	<li>1. Driver: 15mm</li>\r\n	<li>2. Impedance: 32 OHM</li>\r\n	<li>3. Bluetooth version: Bluetooth 5.0</li>\r\n	<li>4. Bluetooth use band: 2.4GHz</li>\r\n	<li>5. Power level: CLASS II</li>\r\n	<li>6. Output power: 30mW</li>\r\n	<li>7. Bluetooth distance: 12 meters barrier</li>\r\n	<li>8. Frequency response: 20-20000Hz</li>\r\n	<li>9. Operating voltage range: 3.0V-4.2V</li>\r\n	<li>10. Mic sensitivity: -96dB</li>\r\n	<li>11. With A2DP / AVRCP high quality stereo audio transmission and remote control protocol</li>\r\n	<li>12. Powerful noise de-noising circuit (active noise reduction)</li>\r\n	<li>13. switch between Chinese and English (boot does not connect Bluetooth state, press the switch 2 times, hear the tone switch successfully)13. Talk time is about 2-3hours</li>\r\n	<li>14. music time about 2-3hours15. Standby time is about 100 hours</li>\r\n</ul>', NULL, NULL, 750.00, 0.00, 1, 25, NULL, NULL, 0, 1, NULL, NULL),
(991, 1, 6, NULL, '1110', 'Malta | 2 kg Pack', 'malta-2-kg-pack-rauQV4kObGb1I1kM9qZcmILtciGFUXrtznfaXdBQ', '<ul>\r\n	<li>Malta</li>\r\n	<li>The great source of Vitamin C</li>\r\n	<li>Inported From South africa</li>\r\n</ul>', NULL, NULL, 360.00, 299.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(992, 1, 6, NULL, '1111', 'Guava Thai | 2 Kg', 'guava-thai-2-kg-GEDvUJEyqu5E37ikYXC2PX2Yrxw8AxZM8gXPlApL', '<ul>\r\n	<li>Thai Guava</li>\r\n	<li>Big size</li>\r\n</ul>', NULL, NULL, 180.00, 140.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(993, 1, 6, NULL, '1112', 'Green Apple | 2 Kg', 'green-apple-2-kg-7AHZCqrrTGOQ41lEVmpldPHl6C4HkrSxxYpUUtJ2', '<ul>\r\n	<li>Green apple</li>\r\n	<li>Imported from South Africa</li>\r\n</ul>', NULL, NULL, 380.00, 360.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(994, 1, 6, NULL, '1113', 'Hog Plum (Amra) - 2 Kg', 'hog-plum-amra-2-kg-lJ0cgXA2oAgHHw8D5bVBiT2daT2hSu0JYsDaLdN4', '<ul>\r\n	<li>Hog Plum [Amra]</li>\r\n	<li>From barisal</li>\r\n</ul>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(995, 1, 6, NULL, '1114', 'দেশী পেয়ারা । স্বরূপকাঠি পেয়ারা- ২ কেজি', 'desee-peyara-swruupkathi-peyara-2-keji-oFq42SarGGvCal9oVScMHU8ltBNQW4r7X9i8K7ni', '<ul>\r\n	<li>দেশী সুস্বাদু পেয়ারা&nbsp;</li>\r\n	<li>স্বরূপকাঠি, বরিশাল।&nbsp;</li>\r\n</ul>', NULL, NULL, 180.00, 160.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL);
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `subcategory_id`, `product_code`, `name`, `slug`, `product_details`, `short_description`, `specification`, `unit_price`, `discount_price`, `stock_status`, `quantity`, `special_note`, `video_link`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(996, 1, 6, NULL, '1115', 'Pomelo Fruit (Jambura) | 1 Pcs', 'pomelo-fruit-jambura-1-pcs-KV8LGVmvjQg8pgjk1mijI8fxAcCbUo8zbMgIoRHj', '<p>Citrus fruit maxima (or Citrus grandis), (Common titles: pomelo, maniglia, pummelo, pommelo, pamplemousse, jabong (Hawaii), shaddick, or shaddock) is an organic (non-hybrid) lemon or lime, with the overall look of a big grapefruit, native to South and Southeast South america. The toronja is an unique member of the citrus fruit which has a surprising quantity of health benefits for all those people ready to do a little bit of searching for this. These amazing health benefits of pomelos consist of its capability to boost the defense mechanisms, improve digestive function, lower blood pressure, decrease cramping, stop anemia, increase bone power, reduce indications of premature ageing, protect center health, assist in weight loss, and boost dental and oral health. Pomelos are believed citrus fruits and veggies, and are carefully related to grapefruits and the additional members from the Citrus genus. Its medical name of Citrus norma because it is the biggest citrus fruit. The closest in dimensions to this ruler of citrus fruit fruits is actually a grapefruit. Pomelos are mainly found in Southeast Asia, which can be their indigenous region.</p>', NULL, NULL, 85.00, 80.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(997, 1, 6, NULL, '1116', 'Amla (Amloki) | 250 gm', 'amla-amloki-250-gm-mthkeDCMcQn9fJNHTda7dO97246kdPfC5ijJFNDF', '<ul>\r\n	<li>Amla good for health</li>\r\n	<li>Amla control hair fall</li>\r\n	<li>Amla control dry skin.</li>\r\n</ul>', NULL, NULL, 80.00, 0.00, 1, 1000, NULL, NULL, 0, 1, NULL, NULL),
(998, 1, 6, NULL, '1117', 'Discovery Peanut Butter  Chunky – 227gm', 'discovery-peanut-butter-chunky-227gm-Jh9FUC534YSbziHFXo7Ul2YaUNCj37tSKjFfXDh0', '<ul>\r\n	<li>Country of Origin: USA</li>\r\n	<li>Weight: 227 gm</li>\r\n	<li>One of the best Pasta brand from USA</li>\r\n</ul>', NULL, NULL, 255.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(999, 1, 6, NULL, '1118', 'Discovery Peanut Butter Smooth Creamy 510gm', 'discovery-peanut-butter-smooth-creamy-510gm-uawCiyr1mH868Gf50wL8c2TW6IhWgOr6sc5Bo4cb', '<ul>\r\n	<li>Capacity 510gm</li>\r\n	<li>Peanut Butter Smooth Creamy</li>\r\n</ul>', NULL, NULL, 500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1000, 1, 6, NULL, '1119', 'Discovery Peanut Butter- Smooth n Creamy 510G', 'discovery-peanut-butter-smooth-n-creamy-510g-QxtZzOFkVZzaSqEqUk0Hk2o444n9pp5IjB07w5zR', '<ul>\r\n	<li>Type: Peanut Butter</li>\r\n	<li>-Brand: Discovery</li>\r\n	<li>-Weight: 510gm</li>\r\n	<li>Smooth and creamy</li>\r\n	<li>made in usa</li>\r\n</ul>', NULL, NULL, 550.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1001, 1, 6, NULL, '1120', 'Discovery Peanut Butter-340gm', 'discovery-peanut-butter-340gm-5bcp8OpOEtmao2CMaHBmRLxcn5HdcwJjqYc3eBtX', '<ul>\r\n	<li>Country of Origin: USA</li>\r\n	<li>Weight: 340 gm</li>\r\n	<li>One of the best Pasta brand from USA</li>\r\n</ul>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1002, 1, 6, NULL, '1121', 'Discovery Apple Cider Vinegar With Mother-500 ml', 'discovery-apple-cider-vinegar-with-mother-500-ml-szui86vB5TcEraf3ZSTBffSyrXKDd9tSAFBzV296', '<ul>\r\n	<li>Product: Organic Apple Cider Vinegar with mother</li>\r\n	<li>Speciality: Certified Organic, Raw &ndash; Unfiltered</li>\r\n	<li>Weight: 500ml</li>\r\n	<li>Store: In a Dry location at Room Temperature</li>\r\n	<li>Exterior Container: Glass Bottle</li>\r\n	<li>Quality: 100% Original</li>\r\n</ul>', NULL, NULL, 875.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1003, 1, 6, NULL, '1122', 'Organic Apple Cider Vinegar with The Mother 1 Ltr | Discovery | Italy', 'organic-apple-cider-vinegar-with-the-mother-1-ltr-discovery-italy-Z6vPaYNreQudiyTGexOT0hmtdXd6rUzxlCAcLtGS', '<ul>\r\n	<li>Product Name: Organic Apple Cider Vinegar with the &#39;Mother&#39;</li>\r\n	<li>Origin: Italy</li>\r\n	<li>Weight: 1 Ltr</li>\r\n	<li>USDA Organic</li>\r\n	<li>Raw, Unfiltered</li>\r\n	<li>Unpasteurized, Naturally Gluten-Free</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, 1325.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1004, 1, 6, NULL, '1123', 'Discovery Apple Cider Vinegar 473ml', 'discovery-apple-cider-vinegar-473ml-nHFpCXiNz8uy6vAqB7ygfZ0I04NlshLpY2zel759', '<ul>\r\n	<li>Product Type: Vinegar</li>\r\n	<li>Brand:Discovery</li>\r\n	<li>Flavor: Apple Cider</li>\r\n	<li>Weight: 473ml</li>\r\n	<li>Product Origin: USA</li>\r\n	<li>Quality: 100% Original</li>\r\n	<li>Packaging: Glass Bottle</li>\r\n</ul>', NULL, NULL, 490.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1005, 1, 6, NULL, '1124', 'Discovery Organic Apple Cider Vinegar With the Mother 250ml', 'discovery-organic-apple-cider-vinegar-with-the-mother-250ml-8GMvf67B2TH81DOtkmeliVRDqQ4hNDVGa34IUhwI', '<ul>\r\n	<li>Product: Organic Apple Cider Vinegar with mother</li>\r\n	<li>Brand: Discovery</li>\r\n	<li>Speciality: Certified Organic, Raw &ndash; Unfiltered</li>\r\n	<li>Weight: 250 ml</li>\r\n	<li>Store: In a Dry location at Room Temperature</li>\r\n	<li>Exterior Container: Glass Bottle</li>\r\n	<li>Origin/Manufactured: Italy</li>\r\n	<li>Quality: 100% Original</li>\r\n</ul>', NULL, NULL, 500.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1006, 1, 6, NULL, '1125', 'Discovery BBQ Sauce 490 gm', 'discovery-bbq-sauce-490-gm-r8xuehtsZCVKqFRm2C0b2mqlL02yMVWO1z1QwQJF', '<ul>\r\n	<li>Product Type: BBQ Sauce</li>\r\n	<li>Brand: Discovery</li>\r\n	<li>Capacity: 490gm</li>\r\n	<li>Great quality food product</li>\r\n</ul>', NULL, NULL, 350.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1007, 1, 6, NULL, '1126', 'Discovery Mustard Sauces - 227gm', 'discovery-mustard-sauces-227gm-9dYvIjhVRiHqsFj8bEDZJzjFBk02dufBVGcJyvOT', '<ul>\r\n	<li>Discovery Mustard Sauces -</li>\r\n	<li>227g</li>\r\n	<li>Brand: Discovery</li>\r\n	<li>Flavor: Mustard</li>\r\n	<li>Origin: U.S.A</li>\r\n</ul>', NULL, NULL, 215.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1008, 1, 6, NULL, '1127', 'Pasta Hut Macaroni 500 gm', 'pasta-hut-macaroni-500-gm-NUaaaISGi9jFhHhyssJWafTje3fRbn1rwglJEkHt', '<p>Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes, then cooked by boiling or baking.</p>', NULL, NULL, 120.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1009, 1, 6, NULL, '1128', 'Pasta Hut Spaghetti 500 gm', 'pasta-hut-spaghetti-500-gm-COhQFL6s56O8hSQJiO2fhkH5uOBix0NoocDudxat', '<ul>\r\n	<li>Pasta Hut Spaghetti 500gm</li>\r\n	<li>&nbsp;Finely sized spaghetti</li>\r\n	<li>&nbsp;Contains curbs and glucose</li>\r\n	<li>&nbsp;Thick and long</li>\r\n	<li>&nbsp;Cholesterol free</li>\r\n	<li>&nbsp;Helps to balance your diet</li>\r\n	<li>Can have as a main food</li>\r\n</ul>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1010, 1, 6, NULL, '1129', 'Pasta Hat Spiral pasta 500 gm', 'pasta-hat-spiral-pasta-500-gm-BLWfklphYcyqbeokm80EAeRPczkarCXBDAjdH4kK', '<ul>\r\n	<li>Brand: Pasta Hat</li>\r\n	<li>Weight: 500gm</li>\r\n	<li>Origin: Dubai, UAE</li>\r\n	<li>Manufacturer: Emirates Macaroni Factory</li>\r\n	<li>Keep in a dry and hygienic place</li>\r\n	<li>This is a Vegetarian product</li>\r\n	<li>100% Halal</li>\r\n	<li>The product is safe for human consumption</li>\r\n	<li>No additives added</li>\r\n	<li>Ingredients: Durum Wheat Semolina</li>\r\n	<li>Premium quality product</li>\r\n	<li>Pure and Fresh Grocery Item</li>\r\n	<li>Good for Your Healthy Life</li>\r\n	<li>Highest quality</li>\r\n	<li>All thing buy at wholesale price</li>\r\n	<li>99 % of customer satisfaction</li>\r\n</ul>', NULL, NULL, 180.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1011, 1, 6, NULL, '1130', 'Luglio Pomace Olive Oil (5 ltr)-Cooking oil- Made in Italy | Discovery', 'luglio-pomace-olive-oil-5-ltr-cooking-oil-made-in-italy-discovery-hHKUUdcDyOCcTeRZyY9FC101vMDigFA4czTFikWR', '<ul>\r\n	<li>Olive Oil Is Rich in Healthy Monounsaturated Fats. ...</li>\r\n	<li>Olive Oil Contains Large Amounts of Antioxidants. ...</li>\r\n	<li>Olive Oil Has Strong Anti-Inflammatory Properties. ...</li>\r\n	<li>Olive Oil May Help Prevent Strokes. ...</li>\r\n	<li>Olive Oil Is Protective Against Heart Disease.</li>\r\n	<li>Olive oil is the natural oil extracted from olives, the fruit of the olive tree.</li>\r\n	<li>About 14% of the oil is saturated fat, whereas 11% is polyunsaturated, such as omega-6 and omega-3 fatty acids (1).</li>\r\n	<li>But the predominant fatty acid in olive oil is a monounsaturated fat called oleic acid, making up 73% of the total oil content.</li>\r\n	<li>Studies suggest that oleic acid reduces inflammation and may even have beneficial effects on genes linked to cancer (2Trusted Source, 3Trusted Source, 4Trusted Source, 5Trusted Source).</li>\r\n	<li>Monounsaturated fats are also quite resistant to high heat, making olive oil a healthy choice for cooking.</li>\r\n</ul>', NULL, NULL, 3800.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1012, 1, 6, NULL, '1131', 'PASTA HAT VERMICELLI FINE 500G', 'pasta-hat-vermicelli-fine-500g-9xvJVAyzjdL0Yhlo4lWEgiVIZljVOUQnLpjoq84h', '<h1>PASTA HAT VERMICELLI FINE 500G</h1>', NULL, NULL, 110.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1013, 1, 6, NULL, '1132', 'Pasta Hat Macaroni (Medium Shell)', 'pasta-hat-macaroni-medium-shell-oWUYzrz5FGs2gnhZz05TZaHNUI5AEBnrnkUX0e65', '<h1>Pasta Hat Macaroni (Medium Shell)</h1>', NULL, NULL, 130.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1014, 1, 6, NULL, '1133', 'Pasta Hat Elbow Pasta 500 gm', 'pasta-hat-elbow-pasta-500-gm-2rUHl8JAYzY7ALnmVQUbNhF5USorHsN0jnJRu7Tk', '<p>Pasta Hat Elbow Pasta 500 gm</p>', NULL, NULL, 125.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1015, 1, 6, NULL, '1134', 'Supermom Mild Baby Wipes | 80 pcs', 'supermom-mild-baby-wipes-80-pcs-URzmvH2bK8wMSSxrXZ4J7M7W7GI2Wde5P6COB17D', '<ul>\r\n	<li>Supermom mild baby wipes offer mildest care for the delicate skins of your baby. It is enriched with baby lotion and pH balanced which ensures required moisture of baby skin. Supermom mild baby wipes is also alcohol, soap and paraben free that prevents baby skin from any sort of side effects.</li>\r\n	<li>Baby lotion, Aqua, Cetylpyridinium chloride, Bronopol, Glycerol, Aloe Barbadensis Leaf Extract, Citric Acid, Propylene Glycol, Fragrance.</li>\r\n</ul>', NULL, NULL, 210.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1016, 1, 6, NULL, '1135', 'Cashew Nut Kaju Badam - 500gm', 'cashew-nut-kaju-badam-500gm-ScVD8dcbOHvmfmMJb9QaQha8JGF3KW5fxrudosDU', '<ul>\r\n	<li>Raw Cashew Nut</li>\r\n	<li>100% Pure and Fresh</li>\r\n	<li>Weight: 500gm</li>\r\n	<li>Premium Quality</li>\r\n	<li>Best Product</li>\r\n	<li>\r\n	<p>Kaju Nuts is best for Keto Dite.Kaju nuts is a very delicious nut. Kaju nuts increase the taste of any food. This nut contains abundant minerals, vitamins, and antioxidants. Kaju nut is rich in magnesium.</p>\r\n	</li>\r\n	<li>\r\n	<p>Kaju helps to strengthen the muscles and nerve function and bone. Kaju contains non-acids that are very beneficial for the heart. Kaju has high sodium and potassium. As a result, blood pressure is in control.</p>\r\n	</li>\r\n</ul>', NULL, NULL, 550.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:57'),
(1017, 1, 6, NULL, '1136', 'ALMOND KATH BADAM - 500gm', 'almond-kath-badam-500gm-fKC7hb4laFWyjslzVBFvVggHrR3EbjG9Bj6NMUd1', '<ul>\r\n	<li>Product Type: Almondnut</li>\r\n	<li>Capacity: 1Packet</li>\r\n	<li>Weight: 500Grm</li>\r\n	<li>All thing buy at wholesale price</li>\r\n	<li>100% clients satisfaction</li>\r\n	<li>100% Highest quality guarantee</li>\r\n	<li>Best price from others</li>\r\n</ul>', NULL, NULL, 860.00, 840.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1018, 1, 6, NULL, '1137', 'Pista Badam -250gm', 'pista-badam-250gm-HY177EoI4pBxkIov8adX6kpi4gBP1UGzgajXJXMd', '<ul>\r\n	<li>Product Type:Pista Badam</li>\r\n	<li>Capacity: 250g</li>\r\n	<li>100% Halal</li>\r\n	<li>Good Quality Product</li>\r\n</ul>', NULL, NULL, 650.00, 0.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL),
(1019, 1, 6, NULL, '1138', 'Natural Raw China Badam - 1kg', 'natural-raw-china-badam-1kg-69TArjnQo6hWB12doqgdXOWD5OSubG2iXXVONi25', '<ul>\r\n	<li>Natural Fresh China Badam</li>\r\n	<li>100% Organic</li>\r\n</ul>', NULL, NULL, 150.00, 100.00, 1, 100, NULL, NULL, 0, 1, NULL, '2021-11-30 12:32:57'),
(1020, 1, 6, NULL, '1139', 'Mix Dry Fruits and Roasted Nuts | 500gm', 'mix-dry-fruits-and-roasted-nuts-500gm-9cBS5eNAf1AG8Qjy55hJrsFuXgAxoB4fSrUqL6jn', '<ul>\r\n	<li>Mix Dry Fruits and Roasted Nuts</li>\r\n</ul>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ingredients</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Roasted Cashew nut (কাজু বাদাম)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Roasted Almond (কাঠ বাদাম)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Roasted peanut (চীনা বাদাম)</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Pistachio (পেস্তা বাদাম)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Walnut (আখরোট)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Pumpkin seeds ( মিষ্টি কুমড়ার বিচি)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Watermelon seeds (তরমুজের বিচি)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Black Raisin (কালো কিসমিস)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Brown Raisin (বাদামী কিসমিস)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * White Raisin (সাদা কিসিমিস)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Black Date palm (কালো খেজুর)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * White Date palm (সাদা খেজুর)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *Tutifruti (টুটি ফ্রূটি)<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Apricot (এপ্রিকট)</p>\r\n\r\n<ul>\r\n	<li>Keep in a dry place.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, 650.00, 550.00, 1, 100, NULL, NULL, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(3, 3, 'images/product/1582003708Special-chocolate-Cookies.jpg', NULL, NULL),
(4, 4, 'images/product/1582004017chocolate-chips-cookies.jpg', NULL, NULL),
(5, 5, 'images/product/1582004640Coconut-Cookies.jpg', NULL, NULL),
(6, 6, 'images/product/1582004733Original-Butter-Cookies.jpg', NULL, NULL),
(7, 7, 'images/product/1582005243Milk-Cookies.jpg', NULL, NULL),
(8, 8, 'images/product/1582006611Salcoti.jpg', NULL, NULL),
(9, 9, 'images/product/1582006942Hello-Cookies.png', NULL, NULL),
(11, 11, 'images/product/1582091277Screenshot_8.png', NULL, NULL),
(12, 12, 'images/product/1582093130Screenshot_12.png', NULL, NULL),
(13, 13, 'images/product/1582094303Screenshot_14.png', NULL, NULL),
(14, 14, 'images/product/1594195494mugdal.jpg', NULL, NULL),
(15, 15, 'images/product/1595106843a801b7dfe1f3-2.jpg', NULL, NULL),
(16, 16, 'images/product/1582095311Screenshot_17.png', NULL, NULL),
(17, 17, 'images/product/1582558460chasi chinigura 1kg.jpg', NULL, NULL),
(18, 18, 'images/product/1582105147miniket stnd.png', NULL, NULL),
(19, 19, 'images/product/1582106655rashid min.png', NULL, NULL),
(20, 20, 'images/product/1595104682mozammal miniket rice 10 kg.jpg', NULL, NULL),
(21, 21, 'images/product/1594193303nazirshail rice.webp', NULL, NULL),
(22, 22, 'images/product/1582107375nazir prem.png', NULL, NULL),
(23, 23, 'images/product/1595108619aci-pure-atta-2-kg.jpg', NULL, NULL),
(24, 24, 'images/product/1594363918super.jpg', NULL, NULL),
(25, 25, 'images/product/15995036964ca0e44c6064-13.jpg', NULL, NULL),
(26, 26, 'images/product/1599503787spm.jpg', NULL, NULL),
(27, 27, 'images/product/1595106722858c7360cc3d-84.jpg', NULL, NULL),
(28, 28, 'images/product/1582540572aci bashmati 1 kg.jpg', NULL, NULL),
(29, 29, 'images/product/1582540645aci katarivog  5 kg.png', NULL, NULL),
(30, 30, 'images/product/1582543997aci pure nazirshail 5 kg.jpg', NULL, NULL),
(31, 31, 'images/product/1582544075aci pure nazirshail 10 kg.png', NULL, NULL),
(32, 32, 'images/product/1582544203aci pure miniket 10 kg.png', NULL, NULL),
(33, 33, 'images/product/1595108705fresh-refined-sugar-1-kg.jpg', NULL, NULL),
(34, 34, 'images/product/1582556394Red cow butter oil.jpg', NULL, NULL),
(35, 35, 'images/product/1582556969ruchi mango pickle 1.jpg', NULL, NULL),
(36, 36, 'images/product/15951093123732318ce193-11e84172b1c3-5.jpg', NULL, NULL),
(37, 37, 'images/product/1589489495milk2.jpg', NULL, NULL),
(38, 38, 'images/product/1594852843patali gur.png', NULL, NULL),
(39, 39, 'images/product/1594853438Jhola Gur.png', NULL, NULL),
(40, 40, 'images/product/1594853260sundarbon honey websize 1000gm.jpg', NULL, NULL),
(41, 41, 'images/product/1582733597supermom baby diaper Extra Large (12-17kg) 20pcs.jpg', NULL, NULL),
(42, 42, 'images/product/1582744042Cup Noodles.jpg', NULL, NULL),
(43, 43, 'images/product/1582744397Nestle 2 Minute-8pack.png', NULL, NULL),
(44, 44, 'images/product/1582744750Nestle Maggie - 4pack.jpg', NULL, NULL),
(45, 45, 'images/product/1582745039chopstick-deshi-masala-Noodles 8 Pack.png', NULL, NULL),
(46, 46, 'images/product/1582745827nestle Maggi Healthy Thai Soup.jpg', NULL, NULL),
(47, 47, 'images/product/1582799899bogurar-doi-special.jpg', NULL, NULL),
(48, 48, 'images/product/1582815833Wheel Washing Powder 2in1 Clean & Rose1.jpg', NULL, NULL),
(49, 49, 'images/product/1582816197Wheel Washing Powder 2in1 Clean & Fresh2.jpg', NULL, NULL),
(50, 50, 'images/product/1582816264Wheel Washing Powder Laundry Bar3.jpg', NULL, NULL),
(51, 51, 'images/product/1582816331Rin Washing Powder Power Bright4.jpg', NULL, NULL),
(52, 52, 'images/product/1582816432Rin Washing Powder Bundle Pack5.jpg', NULL, NULL),
(53, 53, 'images/product/1582816672Rin Washing Powder Antibac6.jpg', NULL, NULL),
(54, 54, 'images/product/1582816750Rin Liquid Detergent7.jpg', NULL, NULL),
(55, 55, 'images/product/1582816832Surf Excel Washing Powder8.jpg', NULL, NULL),
(56, 56, 'images/product/1582816898Surf Excel Washing Powder (With Bucket).jpg', NULL, NULL),
(57, 57, 'images/product/1582817034Surf Excel Washing Powder Matic Top Load.jpg', NULL, NULL),
(58, 58, 'images/product/1582817102Surf Excel Matic Liquid Detergent Top Load.jpg', NULL, NULL),
(59, 59, 'images/product/1582971019fay  anti tobacco.jpg', NULL, NULL),
(60, 60, 'images/product/1582971078fay orchid.jpg', NULL, NULL),
(61, 61, 'images/product/1582971120fay airfreshener rose.jpg', NULL, NULL),
(62, 62, 'images/product/1582971173fay narcissus. jpeg.jpg', NULL, NULL),
(63, 63, 'images/product/1582971219fay lily.jpg', NULL, NULL),
(64, 64, 'images/product/1582971294Godrej Aer pocket Bundle.jpg', NULL, NULL),
(65, 65, 'images/product/1582971390Aer Room Freshener & 2 Aer Pocket Combo.jpg', NULL, NULL),
(66, 66, 'images/product/1582971449Godrej aer cool room spray.jpg', NULL, NULL),
(67, 67, 'images/product/1582971511Godrej Aer fresh green room spray.jpg', NULL, NULL),
(68, 68, 'images/product/1582971634Godrej aer Cool surf Blue click gel AC vent car freshener.jpg', NULL, NULL),
(69, 69, 'images/product/1582971699Godrej aer Cool Twist  surf Blue 45gm  car dashboard freshener.jpg', NULL, NULL),
(70, 70, 'images/product/1582971782Odonil natural Air freshener Lavender Meadows.jpg', NULL, NULL),
(71, 71, 'images/product/1582971829Odonil natural Air freshener jasmine mist.jpg', NULL, NULL),
(72, 72, 'images/product/1582972717Odonil natural Air freshener Mystic Rose.jpg', NULL, NULL),
(73, 73, 'images/product/1582972781Odonil natural Air freshener Mystic Rose.jpg', NULL, NULL),
(74, 74, 'images/product/1582972835Dettol All in one Air freshener jasmin.jpg', NULL, NULL),
(75, 75, 'images/product/1582972875Dettol All in one Air freshener Spiring.jpg', NULL, NULL),
(76, 76, 'images/product/1582983673Vim diswashing bar.jpg', NULL, NULL),
(77, 77, 'images/product/1582983730Vim diswashing bar.jpg', NULL, NULL),
(78, 78, 'images/product/1582983897Vim Dishwashing Liquid.jpg', NULL, NULL),
(79, 79, 'images/product/1582983938Vim Dishwashing Liquid.jpg', NULL, NULL),
(80, 80, 'images/product/1582983996VIM Dishwashing Powder.jpg', NULL, NULL),
(81, 81, 'images/product/1582984212Trix Dishwashing Liquid Refill Sparkling Clean with Lemon Fragrance.jpg', NULL, NULL),
(82, 82, 'images/product/1582984273Trix Monthly Pack.jpg', NULL, NULL),
(83, 83, 'images/product/1582984333Trix Lemon Dish Washing Liquid Lemon Refill Pack.jpg', NULL, NULL),
(84, 84, 'images/product/1583144022Rok.jpg', NULL, NULL),
(85, 85, 'images/product/1583143736harpic toilet.jpg', NULL, NULL),
(86, 86, 'images/product/1583143790harpic toilet.jpg', NULL, NULL),
(87, 87, 'images/product/1583143849Harpic Bathroom Cleaning Powder Original.jpg', NULL, NULL),
(88, 88, 'images/product/1583143895Harpic Toilet Cleaning Powder.jpg', NULL, NULL),
(89, 89, 'images/product/1583143936Harpic Toilet Cleaning Powder.jpg', NULL, NULL),
(90, 90, 'images/product/1583144091Lizol Floor Cleaner Lavender Disinfectant Surface.jpg', NULL, NULL),
(91, 91, 'images/product/1583144193Lizol Floor Cleaner Floral Disinfectant Surface.jpg', NULL, NULL),
(92, 92, 'images/product/1583144272Lizol Floor Cleaner Floral Disinfectant Surface.jpg', NULL, NULL),
(93, 93, 'images/product/1583144370Lizol Floor Cleaner Citrus Disinfectant Surface.jpg', NULL, NULL),
(94, 94, 'images/product/1583144423Lizol Floor Cleaner Citrus Disinfectant Surface.jpg', NULL, NULL),
(95, 95, 'images/product/1583144493Lizol Floor Cleaner Lavender Disinfectant Surface.jpg', NULL, NULL),
(96, 96, 'images/product/1583144568RokSol Tiles & Bathroom Cleaner.jpg', NULL, NULL),
(97, 97, 'images/product/1583144623Rok Floor Cleaner (Lemon).jpg', NULL, NULL),
(98, 98, 'images/product/1583144719Rok Citrus Floor Cleaner.jpg', NULL, NULL),
(99, 99, 'images/product/1583145031Rok Glasso Glass Cleaner.jpg', NULL, NULL),
(100, 100, 'images/product/1583145090Rok Glasso Glass Cleaner.jpg', NULL, NULL),
(101, 101, 'images/product/1583146195Rok Glasso Glass Cleaner,.jpg', NULL, NULL),
(102, 102, 'images/product/1583146238rok bleaching powder,.jpg', NULL, NULL),
(103, 103, 'images/product/1583146296rok phinayel.jpg', NULL, NULL),
(104, 104, 'images/product/1583146628Mr.Brasso Glass & Household Cleaner Refill.jpg', NULL, NULL),
(105, 105, 'images/product/1583146680Mr.Brasso Glass & Household Cleaner Spray.jpg', NULL, NULL),
(106, 106, 'images/product/1583146739Shakti Liquid Toilet Cleaner.jpg', NULL, NULL),
(107, 107, 'images/product/1583146800fixol finish.jpeg', NULL, NULL),
(108, 108, 'images/product/1583146862Dettol Handwash Pump Re-energize.jpg', NULL, NULL),
(109, 109, 'images/product/1583146924Dettol Handwash Pump Skincare.jpg', NULL, NULL),
(110, 110, 'images/product/1583146973Dettol Handwash Pump Cool.jpg', NULL, NULL),
(111, 111, 'images/product/1583147034Dettol Handwash Refill Poly Cool.jpg', NULL, NULL),
(112, 112, 'images/product/1583147091Dettol Handwash pump Gold.png', NULL, NULL),
(113, 113, 'images/product/1583147261Dettol Handwash pump gold Refill pack.jpg', NULL, NULL),
(114, 114, 'images/product/1583147524Dettol Handwash  Refill Sensitive.jpeg', NULL, NULL),
(115, 115, 'images/product/1583147579Dettol Handwash Refill Poly Re-energize.jpg', NULL, NULL),
(116, 116, 'images/product/1583147653Dettol Anticeptic Liquid. 50 ml.jpg', NULL, NULL),
(117, 117, 'images/product/1583147709Dettol Anticeptic Liquid.jpg', NULL, NULL),
(118, 118, 'images/product/1583147759Dettol Anticeptic Liquid. 50 ml.jpg', NULL, NULL),
(119, 119, 'images/product/1583147871Dettol Handwash Refill Poly Original.jpg', NULL, NULL),
(120, 120, 'images/product/1583147934Dettol Handwash Pump Sensitive.jpg', NULL, NULL),
(121, 121, 'images/product/1583154047Savlon Liquid. 112.jpg', NULL, NULL),
(122, 122, 'images/product/1583154117Savlon Liquid. 112.jpg', NULL, NULL),
(123, 123, 'images/product/1583154182Savlon Liquid .500.png', NULL, NULL),
(124, 124, 'images/product/1583154770Savlon Antiseptic Cream. 30 gm.jpg', NULL, NULL),
(125, 125, 'images/product/1583154911Savlon Antiseptic Cream. 30 gm.jpg', NULL, NULL),
(126, 126, 'images/product/1583155098savlon aloe vera.jpeg', NULL, NULL),
(127, 127, 'images/product/1583155589savlon aloe vera.jpeg', NULL, NULL),
(128, 128, 'images/product/1583155775Savlon Ocean Blue Antiseptic Handwash.jpg', NULL, NULL),
(129, 129, 'images/product/1583155912Savlon Ocean Blue Antiseptic Hand Wash (Refill).jpg', NULL, NULL),
(130, 130, 'images/product/1583155973Savlon Instant Hand Sanitizer.png', NULL, NULL),
(131, 131, 'images/product/1583156042Savlon Cool Antiseptic Soap.jpg', NULL, NULL),
(132, 132, 'images/product/1583156324Lifebuoy Handwash Total Refill.jpg', NULL, NULL),
(133, 133, 'images/product/1583156371Lifebuoy Handwash Care Refill.jpeg', NULL, NULL),
(134, 134, 'images/product/1583156456Lifebuoy Handwash Total Pump.png', NULL, NULL),
(135, 135, 'images/product/1583156519Lifebuoy Handwash Lemon Fresh Pump.jpg', NULL, NULL),
(136, 136, 'images/product/1583156806Lifebuoy Handwash Lemon Fresh Refill.jpg', NULL, NULL),
(137, 137, 'images/product/1583156867Lifebuoy Handwash Care Pump.jpg', NULL, NULL),
(138, 138, 'images/product/1583160563Bashundhara Toilet Tissue (17X 4pcs).jpg', NULL, NULL),
(139, 139, 'images/product/1583160672Bashundhara Gold Toilet Tissue (25X2pcs).jpeg', NULL, NULL),
(140, 140, 'images/product/1583160744Bashundhara Facial Tissue  150x2.jpg', NULL, NULL),
(141, 141, 'images/product/1583160883Bashundhara Facial Tissue 120x2.jpg', NULL, NULL),
(142, 142, 'images/product/1583161066Bashundhara Paper Napkins 13 Unscented.jpg', NULL, NULL),
(143, 143, 'images/product/1583161125Bashundhara Kitchen Towel 2 Rolls.jpg', NULL, NULL),
(144, 144, 'images/product/1583161182Bashundhara Hand Towel 1 ply.jpg', NULL, NULL),
(145, 145, 'images/product/1583214657Fresh Perfumed Facial Tissue (150 X 2) ply Box.jpg', NULL, NULL),
(146, 146, 'images/product/1583214721Fresh Perfumed Facial Tissue  (120 X 2) ply Box.jpg', NULL, NULL),
(147, 147, 'images/product/1583214801Fresh Paper Napkins 13 Perfumed (100X1 Ply).jpg', NULL, NULL),
(148, 148, 'images/product/1583214953Fresh Toilet Tissue (Family Value Pack).jpg', NULL, NULL),
(149, 149, 'images/product/1583215040Fresh Hand Towel (250X1 Ply).jpg', NULL, NULL),
(150, 150, 'images/product/1583215133Fresh kitchen Towel Roll 2 rolls.jpeg', NULL, NULL),
(151, 151, 'images/product/1583215226Fresh White Wallet Tissue (10X2 Ply).jpg', NULL, NULL),
(152, 152, 'images/product/1583389375Sunsilk Shampoo Hijab Recharge.jpg', NULL, NULL),
(153, 153, 'images/product/1583557510Surf Excel Powder Matic Front.jpg', NULL, NULL),
(154, 154, 'images/product/1583557609Surf Excel Matic Liquid Detergent Front Load.jpg', NULL, NULL),
(155, 155, 'images/product/1583557936Chamak Fabric Brightner.jpg', NULL, NULL),
(156, 156, 'images/product/1583558114Chaka Advanced Ball soap.jpg', NULL, NULL),
(157, 157, 'images/product/1583558169Chaka Advanced Lemon washing powder.jpg', NULL, NULL),
(158, 158, 'images/product/1583558219Godrej Good Knight Power Activ + Cartridge.jpg', NULL, NULL),
(159, 159, 'images/product/1583558224Chaka Super White Washing Powder.jpg', NULL, NULL),
(160, 160, 'images/product/1583558293Keya glycerine Laundry soap.jpg', NULL, NULL),
(161, 161, 'images/product/1583558296Godrej Good Knight Xpress System Liquid Vapouriser Cartridge.png', NULL, NULL),
(162, 162, 'images/product/1583558367ACI Smart Laundry Soap.jpg', NULL, NULL),
(163, 163, 'images/product/1583558416ACI Smart Washing Powder.jpg', NULL, NULL),
(164, 164, 'images/product/1583558441Godrej Good Knight Power Active (Dual Power) Machine + Refill.jpg', NULL, NULL),
(165, 165, 'images/product/1583558461ACI Smart Supreme Washing Powder.jpg', NULL, NULL),
(166, 166, 'images/product/1583558546Godrej Good Knight Advanced Xpress Coil.jpg', NULL, NULL),
(167, 167, 'images/product/1583558654Godrej Hit Lime Mosquitoes & Flies Spray.jpg', NULL, NULL),
(168, 168, 'images/product/1583558717Godrej New Hit Mosquitoes Spray.jpg', NULL, NULL),
(169, 169, 'images/product/1583558746Tide Detergent Powder Jasmine&Rose.jpg', NULL, NULL),
(170, 170, 'images/product/1583558775Godrej New Hit Cockroaches Spray.jpg', NULL, NULL),
(171, 171, 'images/product/1583558907Godrej Good Knight Xpress Liquid Vapouriser Machine & Refill.jpg', NULL, NULL),
(172, 172, 'images/product/1583559001Godrej New Hit Anti Roach Gel 45 Days.jpg', NULL, NULL),
(173, 173, 'images/product/1583559187Godrej Good Knight Mosquito Fabric Roll On.jpg', NULL, NULL),
(174, 174, 'images/product/1583559980ACI Aerosol Insect Spray Jumbo 800.jpg', NULL, NULL),
(175, 175, 'images/product/1583560072ACI Aerosol Insect Spray 450, 125 ml.jpg', NULL, NULL),
(176, 176, 'images/product/1583560182ACI All Out Ultra Mosquito Liquid Vaporizer Refill.jpeg', NULL, NULL),
(177, 177, 'images/product/1583560308Xpel Aerosol.jpeg', NULL, NULL),
(178, 178, 'images/product/1583560360Sunsilk Shampoo Hijab Recharge.jpg', NULL, NULL),
(179, 179, 'images/product/1583560836Sunsilk Shampoo Hijab Anti-Breakage.jpg', NULL, NULL),
(180, 180, 'images/product/1583560891Sunsilk Shampoo Hijab Anti-Breakage.jpg', NULL, NULL),
(181, 181, 'images/product/1583561071Sunsilk Shampoo Hijab Anti Dandruff.jpg', NULL, NULL),
(182, 182, 'images/product/1583561124Sunsilk Shampoo Lusciously Thick & Long.jpg', NULL, NULL),
(183, 183, 'images/product/1583561163Sunsilk Shampoo Lusciously Thick & Long.jpg', NULL, NULL),
(184, 184, 'images/product/1583561238Sunsilk Shampoo Perfect Straight.jpg', NULL, NULL),
(185, 185, 'images/product/1583561276Sunsilk Shampoo Perfect Straight.jpg', NULL, NULL),
(186, 186, 'images/product/1583561349Sunsilk Conditioner Perfect Straight.jpg', NULL, NULL),
(187, 187, 'images/product/1583561655Sunsilk Shampoo Stunning Black Shine.jpg', NULL, NULL),
(188, 188, 'images/product/1583561694Sunsilk Shampoo Stunning Black Shine.jpg', NULL, NULL),
(189, 189, 'images/product/1583562445Finis Insect Powder.jpeg', NULL, NULL),
(190, 190, 'images/product/1583562386Odomos Mosquito Repellent Cream.jpg', NULL, NULL),
(191, 191, 'images/product/1583561923Sunsilk Shampoo Hair Fall Solution.jpg', NULL, NULL),
(192, 192, 'images/product/1583562004Sunsilk Shampoo Hair Fall Solution.jpg', NULL, NULL),
(193, 193, 'images/product/1583562056Sunsilk Shampoo Healthy Growth.jpg', NULL, NULL),
(194, 194, 'images/product/1583562094Sunsilk Shampoo Healthy Growth.jpg', NULL, NULL),
(195, 195, 'images/product/1583562191Sunsilk Co Creations Soft & Smooth Shampoo.jpg', NULL, NULL),
(196, 196, 'images/product/1583562199Finis Insect Powder.jpeg', NULL, NULL),
(197, 197, 'images/product/1583562367Sunsilk Co Creations Perfect Straight Shampoo.jpg', NULL, NULL),
(198, 198, 'images/product/1583562452Sunsilk Lively Clean & Fresh Shampoo.jpg', NULL, NULL),
(199, 199, 'images/product/1583562501Tresemme Conditioner Keratin Smooth.jpg', NULL, NULL),
(200, 200, 'images/product/1583562622Naphthalene Ball.jpeg', NULL, NULL),
(201, 201, 'images/product/1583562666Tresemme Hair Fall Defense Shampoo.jpg', NULL, NULL),
(202, 202, 'images/product/1583562705Tresemme Hair Fall Defense Shampoo.jpg', NULL, NULL),
(203, 203, 'images/product/1583562846Tresemme Shampoo Keratin Smooth.jpg', NULL, NULL),
(204, 204, 'images/product/1583562884Tresemme Shampoo Keratin Smooth.jpg', NULL, NULL),
(205, 205, 'images/product/1583563176Clear Shampoo Anti Hairfall Anti Dandruff.jpg', NULL, NULL),
(206, 206, 'images/product/1583563211Clear Shampoo Anti Hairfall Anti Dandruff.jpg', NULL, NULL),
(207, 207, 'images/product/1583563915Clear Men Anti Dandruff Shampoo.jpg', NULL, NULL),
(208, 208, 'images/product/1583563956Clear Men Anti Dandruff Shampoo.jpg', NULL, NULL),
(209, 209, 'images/product/1583564040Clear Shampoo Men Cool Sport Menthol Anti  Dandruff.jpg', NULL, NULL),
(210, 210, 'images/product/1583564278Clear Shampoo Men Cool Sport Menthol Anti  Dandruff.jpg', NULL, NULL),
(211, 211, 'images/product/1583564393Clear Complete Active Care Shampoo.jpg', NULL, NULL),
(212, 212, 'images/product/1583564434Clear Complete Active Care Shampoo.jpg', NULL, NULL),
(213, 213, 'images/product/1583564488Clear Anti Hairfall Shampoo.jpg', NULL, NULL),
(214, 214, 'images/product/1583564763Head & Shoulders Anti-Hairfall Shampoo.jpg', NULL, NULL),
(215, 215, 'images/product/1583564810Head & Shoulders Anti-Hairfall Shampoo.jpg', NULL, NULL),
(216, 216, 'images/product/1583564938Head & Shoulders Smooth & Silky Shampoo.jpg', NULL, NULL),
(217, 217, 'images/product/1583564994Head & Shoulders Smooth & Silky Shampoo.jpg', NULL, NULL),
(218, 218, 'images/product/1583565208Head & Shoulders Clean & Balanced Shampoo.jpg', NULL, NULL),
(219, 219, 'images/product/1583565244Head & Shoulders Clean & Balanced Shampoo.jpg', NULL, NULL),
(220, 220, 'images/product/1583565316Head & Shoulders Cool Menthol Shampoo.jpg', NULL, NULL),
(221, 221, 'images/product/1583565363Head & Shoulders Cool Menthol Shampoo.jpg', NULL, NULL),
(222, 222, 'images/product/1583565422Head & Shoulders Cool Menthol Shampoo.jpg', NULL, NULL),
(223, 223, 'images/product/1583569445Head & Shoulders Lemon Fresh Shampoo.jpg', NULL, NULL),
(224, 224, 'images/product/1583569522Head & Shoulders Anti Dandruff Shampoo Sliky Black.jpg', NULL, NULL),
(225, 225, 'images/product/1583569579Head & Shoulders Smooth & Silky Shampoo.jpg', NULL, NULL),
(226, 226, 'images/product/1583569636head & Shoulders Smooth & Silky 2in1 Shampoo+Co.jpg', NULL, NULL),
(227, 227, 'images/product/1583572290Head & Shoulder 2 In 1 Active Protect Shampoo.jpg', NULL, NULL),
(228, 228, 'images/product/1583572336Head & Shoulder 2 In 1 Active Protect Shampoo.jpg', NULL, NULL),
(229, 229, 'images/product/1583572385Head & Shoulder Silky Black Shampoo.jpg', NULL, NULL),
(230, 230, 'images/product/1583572646Dove Beauty Bar White.jpg', NULL, NULL),
(231, 231, 'images/product/1583572686Dove Beauty Bar White.jpg', NULL, NULL),
(232, 232, 'images/product/1583572729Dove Beauty Bar Pink.jpg', NULL, NULL),
(233, 233, 'images/product/1583572766Dove Beauty Bar Pink.jpg', NULL, NULL),
(234, 234, 'images/product/1583572837Dove Shampoo Hairfall Rescue.jpg', NULL, NULL),
(235, 235, 'images/product/1583572877Dove Shampoo Hairfall Rescue.jpg', NULL, NULL),
(236, 236, 'images/product/1583572925Dove Shampoo Hairfall Rescue.jpg', NULL, NULL),
(237, 237, 'images/product/1583731101Dove Shampoo Oxygen Moisture.jpg', NULL, NULL),
(238, 238, 'images/product/1583731153Dove Shampoo Environmental Defense.jpg', NULL, NULL),
(239, 239, 'images/product/1583731203Dove Micellar Water.jpg', NULL, NULL),
(240, 240, 'images/product/1583731266Dove Conditioner Hairfall Rescue.jpg', NULL, NULL),
(241, 241, 'images/product/1583731310Dove Conditioner Intense Repair.jpg', NULL, NULL),
(242, 242, 'images/product/1583731368Dove Shampoo Intense Repair.jpg', NULL, NULL),
(243, 243, 'images/product/1583731483Dove Shampoo Intense Repair.jpg', NULL, NULL),
(244, 244, 'images/product/1583731531Dove Shampoo Nourishing Oil Care.jpg', NULL, NULL),
(245, 245, 'images/product/1583731572Dove Shampoo Nourishing Oil Care.jpg', NULL, NULL),
(246, 246, 'images/product/1583731620Dove Face Wash Beauty Moisture Facial Cleanser.jpg', NULL, NULL),
(247, 247, 'images/product/1583731665Dove Face Wash Beauty Moisture.jpg', NULL, NULL),
(248, 248, 'images/product/1583731740Dove Shampoo Healthy Growth.jpg', NULL, NULL),
(249, 249, 'images/product/1583731801Dove Shampoo Healthy Growth.jpg', NULL, NULL),
(250, 250, 'images/product/1583731848Dove Baby Rich Moisture Lotion.jpg', NULL, NULL),
(251, 251, 'images/product/1583731915Dove Beauty Cream.jpg', NULL, NULL),
(252, 252, 'images/product/1583731961Dove Baby Sensitive Moisture Lotion.jpg', NULL, NULL),
(253, 253, 'images/product/1583732020Dove Go Fresh Roll On.jpg', NULL, NULL),
(254, 254, 'images/product/1583732083Dove Men Shampoo Thick & Strong.jpg', NULL, NULL),
(255, 255, 'images/product/1583732161Dove Intensive Body Lotion.jpg', NULL, NULL),
(256, 256, 'images/product/1583732209Dove Caring Cucumber & Green Tea Scent Hand wash.jpg', NULL, NULL),
(257, 257, 'images/product/1583732341Dove Caring Cucumber & Green Tea Scent Hand wash.jpg', NULL, NULL),
(258, 258, 'images/product/1583732511Dove Caring Fine Silk Hand wash.jpg', NULL, NULL),
(259, 259, 'images/product/1583733214Dove Intensive Cream.jpg', NULL, NULL),
(260, 260, 'images/product/1583733346Kumarika Long & Black Shampoo.jpg', NULL, NULL),
(261, 261, 'images/product/1583733394Kumarika Soft & Shine Shampoo.jpg', NULL, NULL),
(262, 262, 'images/product/1583733434Kumarika Thick & Strong Shampoo.jpg', NULL, NULL),
(263, 263, 'images/product/1583733568Pantene Lively Clean Shampoo.jpg', NULL, NULL),
(264, 264, 'images/product/1583734190Pantene Long Black Shampoo.jpg', NULL, NULL),
(265, 265, 'images/product/1583734248Pantene Silky Smooth Care Shampoo.jpg', NULL, NULL),
(266, 266, 'images/product/1583734503Clinic Plus Strong & Long Shampoo.jpg', NULL, NULL),
(267, 267, 'images/product/1583734544Clinique Shampoo Strong and Long.jpg', NULL, NULL),
(268, 268, 'images/product/1583734824Himalaya Anti Dandruff Shampoo.jpg', NULL, NULL),
(269, 269, 'images/product/1583735100Xpel Hair Care Banana Conditioner.jpg', NULL, NULL),
(270, 270, 'images/product/1583735489Lever Ayush Shampoo Thick & Long Growth Shikakai.jpg', NULL, NULL),
(271, 271, 'images/product/1583735840L\'oreal Elvive Total Repair 5 Shampoo.jpg', NULL, NULL),
(272, 272, 'images/product/1583735886L\'oreal Men Anti Dandruff 2 in 1 (Shampoo + Conditioner).jpg', NULL, NULL),
(273, 273, 'images/product/1583746667Lux Soap Bar Soft Touch.jpg', NULL, NULL),
(274, 274, 'images/product/1583746708Lux Soap Bar Soft Touch.jpg', NULL, NULL),
(275, 275, 'images/product/1583746753Lux Soap Bar Velvet Touch.jpg', NULL, NULL),
(276, 276, 'images/product/1583746804Lux Soap Bar Velvet Touch.jpg', NULL, NULL),
(277, 277, 'images/product/1583746841Lux Soap Bar Velvet Touch.jpg', NULL, NULL),
(278, 278, 'images/product/1583746886Lux Soap Bar Fresh Splash.jpg', NULL, NULL),
(279, 279, 'images/product/1583746930Lux Soap Bar Hypnotic Rose.jpg', NULL, NULL),
(280, 280, 'images/product/1583746974Lux Body Wash White Impress.jpg', NULL, NULL),
(281, 281, 'images/product/1583747017Lux Soap Bar Sensuous Sandal.jpg', NULL, NULL),
(282, 282, 'images/product/1583747073Dove Micellar Water.jpg', NULL, NULL),
(283, 283, 'images/product/1583747275Lifebuoy Soap Silver Shield Formula 100 gm.jpg', NULL, NULL),
(284, 284, 'images/product/1583747323Lifebuoy Soap Bar Total.jpg', NULL, NULL),
(285, 285, 'images/product/1583747364Lifebuoy Soap Bar Care.jpg', NULL, NULL),
(286, 286, 'images/product/1583747397Lifebuoy Soap Bar Care.jpg', NULL, NULL),
(287, 287, 'images/product/1583747454Lifebuoy Soap Bar Neem.jpg', NULL, NULL),
(288, 288, 'images/product/1583747591Lifebuoy Bar Soap Attar Protect.jpg', NULL, NULL),
(289, 289, 'images/product/1583747765Dettol Soap Cool Bathing Bar.jpg', NULL, NULL),
(290, 290, 'images/product/1583747802Dettol Soap Original Bathing Bar Soap.jpg', NULL, NULL),
(291, 291, 'images/product/1583747865Dettol Soap Original Bathing Bar Soap.jpg', NULL, NULL),
(292, 292, 'images/product/1583747908Dettol Bathing Bar Soap Skincare.jpg', NULL, NULL),
(293, 293, 'images/product/1583748373Nivea Sea Minerals Fresh Shower Gel.jpg', NULL, NULL),
(294, 294, 'images/product/1583748424Nivea Care & Roses Body Wash.jpg', NULL, NULL),
(295, 295, 'images/product/1583748472Nivea Care & Coconut Body Wash.jpg', NULL, NULL),
(296, 296, 'images/product/1583748513Nivea Men Cool Kick Shower Gel.jpg', NULL, NULL),
(297, 297, 'images/product/1583748689Fresh Start Shower Gel Mint & Cucumber.jpg', NULL, NULL),
(298, 298, 'images/product/1583748728Fresh Start Shower Gel Cococut & Lime.jpg', NULL, NULL),
(299, 299, 'images/product/1583748758Xpel Fresh Start Shower Gel Tea Tree & Lemon.jpg', NULL, NULL),
(300, 300, 'images/product/1583748809Meril Milk & Bely Soap.jpg', NULL, NULL),
(301, 301, 'images/product/1583749521Meril Milk Soap Bar.jpg', NULL, NULL),
(302, 302, 'images/product/1583749554Meril Milk & Pomegranate Soap.jpg', NULL, NULL),
(303, 303, 'images/product/1583749606Meril Baby Mild Honey Soap.jpg', NULL, NULL),
(304, 304, 'images/product/1583750173ACI Savlon Fresh Soap.jpg', NULL, NULL),
(305, 305, 'images/product/1583750210ACI Savlon Active Antiseptic Soap.jpg', NULL, NULL),
(306, 306, 'images/product/1583750242ACI Savlon Mild Antiseptic Soap.jpg', NULL, NULL),
(307, 307, 'images/product/1583750272ACI Neem Original Honey & Turmeric Soap.jpg', NULL, NULL),
(308, 308, 'images/product/1583750383Savlon Sensitive Soap.jpg', NULL, NULL),
(309, 309, 'images/product/1583750417Savlon Cool Soap.jpg', NULL, NULL),
(310, 310, 'images/product/1583750673Lever Ayush Soap Bar Natural Fair Saffron.jpg', NULL, NULL),
(311, 311, 'images/product/1583750710Lever Ayush Soap Bar Natural Purifying Turmeric.jpg', NULL, NULL),
(312, 312, 'images/product/1583750821Sandalina Sandal & Rose Soap.jpg', NULL, NULL),
(313, 313, 'images/product/1583754293Nivea Intensive Moisture Body Milk.jpg', NULL, NULL),
(314, 314, 'images/product/1583754336Nivea Soft Crème.jpg', NULL, NULL),
(315, 315, 'images/product/1583754379Nivea Soft Crème.jpg', NULL, NULL),
(316, 316, 'images/product/1583754417Nivea Express Hydration Body Lotion.jpg', NULL, NULL),
(317, 317, 'images/product/1583754457Nivea Light Moisturising & Cleansing Lotion.jpg', NULL, NULL),
(318, 318, 'images/product/1583754491Nivea Extra Rich Moisturising Lotion.jpg', NULL, NULL),
(319, 319, 'images/product/1583754540Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf).jpg', NULL, NULL),
(320, 320, 'images/product/1583754582Fair And Lovely Fairness Cream Advanced Multivitamin (Free Scarf).jpg', NULL, NULL),
(321, 321, 'images/product/1583755281Fair And Lovely Advanced Multivitamin Body Fairness Milk.jpg', NULL, NULL),
(322, 322, 'images/product/1583755324Fair And Lovely Face Cream Blemish Balm.jpg', NULL, NULL),
(323, 323, 'images/product/1583755361Fair And Lovely Face Cream Blemish Balm.jpg', NULL, NULL),
(324, 324, 'images/product/1583755586Fair And Lovely Fairness Cream Ayurvedic Care.jpg', NULL, NULL),
(325, 325, 'images/product/1583755661Fair And Lovely Fairness Cream Winter.jpg', NULL, NULL),
(326, 326, 'images/product/1583755707Fair & Lovely Multivitamin Cream.jpg', NULL, NULL),
(327, 327, 'images/product/1583755814Fair And Lovely Advanced Multivitamin Body Fairness Milk.jpg', NULL, NULL),
(328, 328, 'images/product/1583756298Fair And Lovely Face Cream Blemish Balm.jpg', NULL, NULL),
(329, 329, 'images/product/1583756363Fair And Lovely Fairness Cream Advanced Multivitamin.jpg', NULL, NULL),
(330, 330, 'images/product/1583756404Fair And Lovely Fairness Cream Winter.jpg', NULL, NULL),
(331, 331, 'images/product/1583756482Mens Fair And Lovely Fairness Cream Rapid Action.jpg', NULL, NULL),
(332, 332, 'images/product/1583756523Mens Fair And Lovely Fairness Cream Rapid Action.jpg', NULL, NULL),
(333, 333, 'images/product/1583756735Vaseline Lotion Deep Restore.jpg', NULL, NULL),
(334, 334, 'images/product/1583756770Vaseline Lotion Deep Restore.jpg', NULL, NULL),
(335, 335, 'images/product/1583756806Vaseline Lotion Deep Restore.jpg', NULL, NULL),
(336, 336, 'images/product/1583756849Vaseline Lotion Healthy White.jpg', NULL, NULL),
(337, 337, 'images/product/1583756890Vaseline Lotion Healthy White.jpg', NULL, NULL),
(338, 338, 'images/product/1583756925Vaseline Lotion Healthy White.jpg', NULL, NULL),
(339, 339, 'images/product/1583816309Vaseline Intensive Care Cocoa Glow Body Lotion.jpg', NULL, NULL),
(340, 340, 'images/product/1583816343Vaseline Intensive Care Cocoa Radiant Gel Oil.jpg', NULL, NULL),
(341, 341, 'images/product/1583816470Woman\'s World Whitening Body Lotion.jpg', NULL, NULL),
(342, 342, 'images/product/1583816718Pond\'s Day Cream White Beauty.jpg', NULL, NULL),
(343, 343, 'images/product/1583817966Pond\'s Day Cream White Beauty.jpg', NULL, NULL),
(344, 344, 'images/product/1583818139Pond\'s Day Cream White Beauty.jpg', NULL, NULL),
(345, 345, 'images/product/1583819070Pond’s Oil Control Vanishing Cream.jpg', NULL, NULL),
(346, 346, 'images/product/1583819111Ponds Day Cream Age Miracle.jpg', NULL, NULL),
(347, 347, 'images/product/1583819203Cute Winter Moisturising Cream.jpg', NULL, NULL),
(348, 348, 'images/product/1583819379Cute Vanishing Cream.jpg', NULL, NULL),
(349, 349, 'images/product/1583819601Cute Beauty Milk Body Lotion.jpg', NULL, NULL),
(350, 350, 'images/product/1583819760Boro Plus Antiseptic Cream.jpg', NULL, NULL),
(351, 351, 'images/product/1583819843Boro Plus Antiseptic Cream.jpg', NULL, NULL),
(352, 352, 'images/product/1583819880Boro Plus Antiseptic Cream.jpg', NULL, NULL),
(353, 353, 'images/product/1583819971Boroplus Moisturising Body Lotion Almond.jpg', NULL, NULL),
(354, 354, 'images/product/1583820009Boroplus Whitening Body Lotion.jpg', NULL, NULL),
(355, 355, 'images/product/1583820130Boro Plus Perfect Tauch Moisturising Cream.jpg', NULL, NULL),
(356, 356, 'images/product/1583820257Boroplus Moiturising Lotion Alovera & Millk.jpg', NULL, NULL),
(357, 357, 'images/product/1583820633Oxy Whitening Cream.jpg', NULL, NULL),
(358, 358, 'images/product/1583820675Boroline Antiseptic Ayurvedic Cream.jpg', NULL, NULL),
(359, 359, 'images/product/1583820720Himalaya Clear Complex Whitening Day Cream.jpg', NULL, NULL),
(360, 360, 'images/product/1583820753Himalaya Revitalizing Night Cream.jpg', NULL, NULL),
(361, 361, 'images/product/1583820787Himalaya Anti Wrinkle Cream.jpg', NULL, NULL),
(362, 362, 'images/product/1583820823Revive Moisturizing Lotion.jpg', NULL, NULL),
(363, 363, 'images/product/1583824079Pond\'s Face Wash Pure White.jpg', NULL, NULL),
(364, 364, 'images/product/1583824860Pond\'s Face Wash White Beauty.jpg', NULL, NULL),
(365, 365, 'images/product/1583824908Pond\'s Face Wash White Beauty.jpg', NULL, NULL),
(366, 366, 'images/product/1583824947Ponds Face Wash Pimple Clear.jpg', NULL, NULL),
(367, 367, 'images/product/1583826466Pond\'s Face Wash Daily.jpg', NULL, NULL),
(368, 368, 'images/product/1583831106Ponds Face Wash Scrub.jpg', NULL, NULL),
(369, 369, 'images/product/1583831153Ponds Men Facewash Lightning Oil Clear.jpg', NULL, NULL),
(370, 370, 'images/product/1583831188Ponds Men Facewash Lightning Oil Clear.jpg', NULL, NULL),
(371, 371, 'images/product/1583831220Ponds Face Wash Daily.jpg', NULL, NULL),
(372, 372, 'images/product/1583831297Ponds Men Facewash Energy Charge.jpg', NULL, NULL),
(373, 373, 'images/product/1583831330Ponds Men Facewash Energy Charge.jpg', NULL, NULL),
(374, 374, 'images/product/1583831369Ponds Men Facewash Acne Solution.jpg', NULL, NULL),
(375, 375, 'images/product/1583831405Ponds Men Facewash Acne Solution.jpg', NULL, NULL),
(376, 376, 'images/product/1583831815Ponds Men Facewash Power Clear.jpg', NULL, NULL),
(377, 377, 'images/product/1583831923Clean & Clear Morning Energy Brightening Berry Face Wash.jpg', NULL, NULL),
(378, 378, 'images/product/1583831961Clean & Clear Morning Energy Face Wash Lemon.jpg', NULL, NULL),
(379, 379, 'images/product/1583832008Clean & Clear Morning Energy Face Wash.jpg', NULL, NULL),
(380, 380, 'images/product/1583832057Clean & Clear Blackhead Daily Scrub Oil Free.jpg', NULL, NULL),
(381, 381, 'images/product/1583832113Clean & Clear Blackhead Daily Scrub Oil Free.jpg', NULL, NULL),
(382, 382, 'images/product/1583832501Himalaya Fresh Srart Oil Clear Face Wash Lemon.jpg', NULL, NULL),
(383, 383, 'images/product/1583832541Himalaya Fresh Srart Oil Clear Face Wash Strawberry.jpg', NULL, NULL),
(384, 384, 'images/product/1583832596Himalaya Fresh Srart Oil Clear Face Wash Peach.jpg', NULL, NULL),
(385, 385, 'images/product/1583832631Lever Ayush Face Wash Natural Fairness Saffron.jpg', NULL, NULL),
(386, 386, 'images/product/1583832666Lever Ayush Face wash Anti Pimple Turmeric.jpg', NULL, NULL),
(387, 387, 'images/product/1583832698Lever Ayush Face wash Anti Pimple Turmeric.jpg', NULL, NULL),
(388, 388, 'images/product/1583832781Lever Ayush Face Cream Anti Marks Turmeric.jpg', NULL, NULL),
(389, 389, 'images/product/1583832810Lever Ayush Face Cream Anti Marks Turmeric.jpg', NULL, NULL),
(390, 390, 'images/product/1583833102Fair And Lovely Face Wash InstaGlow.jpg', NULL, NULL),
(391, 391, 'images/product/1583833135Fair And Lovely Face Wash InstaGlow.jpg', NULL, NULL),
(392, 392, 'images/product/1583833183Mens Fair And Lovely Face Wash Rapid Action.jpg', NULL, NULL),
(393, 393, 'images/product/1583833214Mens Fair And Lovely Face Wash Rapid Action.jpg', NULL, NULL),
(394, 394, 'images/product/1583833250Fair And Lovely Face Wash Ayurvedic.jpg', NULL, NULL),
(395, 395, 'images/product/1583833311Emami Fair And Handsome Fairness Cream.jpg', NULL, NULL),
(396, 396, 'images/product/1583833363Emami Naturally Fair Face Wash.jpg', NULL, NULL),
(397, 397, 'images/product/1583833445Emami Naturally Fair Face cream.jpg', NULL, NULL),
(398, 398, 'images/product/1583835956Nivea Men 48h Cool Kick Deodorent.jpg', NULL, NULL),
(399, 399, 'images/product/1583836000Nivea Men 48h Fresh Active Deodorent.jpg', NULL, NULL),
(400, 400, 'images/product/1583836052Nivea Pearl & Beauty 48h Deodorent.jpg', NULL, NULL),
(401, 401, 'images/product/1583836091Nivea Men Ice Cool Body Deodorizer.jpg', NULL, NULL),
(402, 402, 'images/product/1583836183Axe Body Perfume Signature Intense Body Perfume.jpg', NULL, NULL),
(403, 403, 'images/product/1583836218Axe Body Perfume Signature Suave Body Perfume.jpg', NULL, NULL),
(404, 404, 'images/product/1583836303Axe Deodorant Dark Temptation.jpg', NULL, NULL),
(405, 405, 'images/product/1583836355Axe Body Perfume Signature Mysterious Body Perfume.jpg', NULL, NULL),
(406, 406, 'images/product/1583836406Set Wet Go Man Pocket Perfume Rockstar.jpg', NULL, NULL),
(407, 407, 'images/product/1583836799Set Wet Go Man Pocket Perfume Aviator.jpg', NULL, NULL),
(408, 408, 'images/product/1583836849Set Wet Body Spray Deodorant Perfume Cool Avatar.jpg', NULL, NULL),
(409, 409, 'images/product/1583837337Set Wet Body Spray Deodorant Perfume Swag Avatar.jpg', NULL, NULL),
(410, 410, 'images/product/1583837381Set Wet Hair Styling Gel for Men Value Pack (Wet Look).jpg', NULL, NULL),
(411, 411, 'images/product/1583837422Set Wet Hair Styling Gel for Men Value Pack (Wet Look).jpg', NULL, NULL),
(412, 412, 'images/product/1583837816X-Men Perfume Body Spray Gas Free Impact.jpg', NULL, NULL),
(413, 413, 'images/product/1583838170X-Men Perfume Body Spray Gas Free Focus.jpg', NULL, NULL),
(414, 414, 'images/product/1583838201X-Men For Boss Perfume Premium Deo Spray Motion.jpg', NULL, NULL),
(415, 415, 'images/product/1583838239X-Men for Boss EDT Perfume Luxury.jpg', NULL, NULL),
(416, 416, 'images/product/1583838280Fogg Body Spray Marco.jpg', NULL, NULL),
(417, 417, 'images/product/1583838320Fogg Body Spray Paradise.jpg', NULL, NULL),
(418, 418, 'images/product/1583838352Fogg Body spray Victor.jpg', NULL, NULL),
(419, 419, 'images/product/1583838393Fogg Body Spray Napoleon.jpg', NULL, NULL),
(420, 420, 'images/product/1583838656Fogg Body spray Blue Ocean.jpg', NULL, NULL),
(421, 421, 'images/product/1583838690Fogg Fresh Spicy Body Spray.jpg', NULL, NULL),
(422, 422, 'images/product/1583838751Fogg Scent Men Impressio.jpg', NULL, NULL),
(423, 423, 'images/product/1583838876Fogg Blue Forest Body Spray.jpg', NULL, NULL),
(424, 424, 'images/product/1583838919Fogg Fresh Aqua Body Spray.jpg', NULL, NULL),
(425, 425, 'images/product/1583839004Denim Aqua Body Spray.jpg', NULL, NULL),
(426, 426, 'images/product/1583839038Denim Musk Body Spray.jpg', NULL, NULL),
(427, 427, 'images/product/1583839087Denim Black Body Spray.jpg', NULL, NULL),
(428, 428, 'images/product/1583839788Havoc Gold Deodorant Spray.jpg', NULL, NULL),
(429, 429, 'images/product/1583839842Havoc Deodorant Spray.jpg', NULL, NULL),
(430, 430, 'images/product/1583839893Dove Go Fresh Roll On.jpg', NULL, NULL),
(431, 431, 'images/product/1583840023Yardley English Rose Deodorant Roll On.jpg', NULL, NULL),
(432, 432, 'images/product/1583840307Adidas Pure Game Body Spray.jpg', NULL, NULL),
(433, 433, 'images/product/1583840350Adidas Ice Dive Body Spray.jpg', NULL, NULL),
(434, 434, 'images/product/1583840383Adidas Intense Touch Body Spray.jpg', NULL, NULL),
(435, 435, 'images/product/1583840421Adidas Victory League.jpg', NULL, NULL),
(436, 436, 'images/product/1583840509Wild Stone Body Perfume Steel.jpg', NULL, NULL),
(437, 437, 'images/product/1583840692Wild Stone Hydra Energy Body Spray.jpg', NULL, NULL),
(438, 438, 'images/product/1583840731Wild Stone Legend Body Deodorant.jpg', NULL, NULL),
(439, 439, 'images/product/1583840769Wild Stone Body Perfume Titanium.jpg', NULL, NULL),
(440, 440, 'images/product/1583840860Wild Stone Forest Spice Deodorant.jpg', NULL, NULL),
(441, 441, 'images/product/1583840916Engage On Man Pocket Perfume (Classic Woody).jpg', NULL, NULL),
(442, 442, 'images/product/1583841029Engage On Man Pocket Perfume (Cool Marine).jpg', NULL, NULL),
(443, 443, 'images/product/1583841071Engage Woman Body Spray.jpg', NULL, NULL),
(444, 444, 'images/product/1583841102Layer Shot Bullet Burst.jpg', NULL, NULL),
(445, 445, 'images/product/1583841144Ossum Perfumed Body Mist Delight.jpg', NULL, NULL),
(446, 446, 'images/product/1583992326B8 Whisper Choice Ultra 6 pads.jpg', NULL, NULL),
(447, 447, 'images/product/1583992368B3 Whisper Maxi Nights Xl Wings 15 Pads.jpg', NULL, NULL),
(448, 448, 'images/product/1583992751B6 Whisper Ultra Clean XL Wings 15 Pads.jpg', NULL, NULL),
(449, 449, 'images/product/1583992791B7 Whisper Choice Wings 7 Pads.jpg', NULL, NULL),
(450, 450, 'images/product/1583992832B4 Whisper Maxi Nights XL Wings 7 Pads.jpg', NULL, NULL),
(451, 451, 'images/product/1583992869B5 Whisper Ultra 8 Pads.jpg', NULL, NULL),
(452, 452, 'images/product/1583992907B1 Whisper Maxi Fit 15 Pads.jpg', NULL, NULL),
(453, 453, 'images/product/1583992943B2 Whisper Maxi Fit 8 Pads.jpg', NULL, NULL),
(454, 454, 'images/product/1583992993AF4 Whisper Ultra Clean XL Wings 8 Pads.jpg', NULL, NULL),
(455, 455, 'images/product/1583993214C4 Senora Sanitary Napkin (Panty) 15 pcs.jpg', NULL, NULL),
(456, 456, 'images/product/1583993258C8 Senora Confidence Regular Flow (Panty System) 16 pcs.jpg', NULL, NULL),
(457, 457, 'images/product/1583993300C5 Senora Sanitary Napkin (Belt 15 pcs.jpg', NULL, NULL),
(458, 458, 'images/product/1583993342C3 Senora Sanitary Napkin Regular Flow (Belt) 10 pcs.jpg', NULL, NULL),
(459, 459, 'images/product/1583993389C9 Senora Confidence Regular Flow (Panty System) 10 pcs.jpg', NULL, NULL),
(460, 460, 'images/product/1583993429C2 Senora Sanitary Napkin Regular Flow (Panty) 10 pcs.jpg', NULL, NULL),
(461, 461, 'images/product/1583993622C1 Senora Ultra-thin Heavy Flow 8 pcs.jpg', NULL, NULL),
(462, 462, 'images/product/1583993672A8 ACI Freedom Heavy Flow Wings 16 Pads.jpg', NULL, NULL),
(463, 463, 'images/product/1583993746A10 ACI Freedom Heavy Flow Sanitary Napkin 8 Pads.jpg', NULL, NULL),
(464, 464, 'images/product/1583993795Freedom Pregnancy Test 1 Strip.jpg', NULL, NULL),
(465, 465, 'images/product/1583993897A6 ACI Freedom Regular Flow Non-Wing Popular 8 pads.jpg', NULL, NULL),
(466, 466, 'images/product/1583993938Freedom Pregnancy Test Tool Set.jpg', NULL, NULL),
(467, 467, 'images/product/1583993996Gillette Venus Woman Razor (Buy 1 Get 1 Offe.jpg', NULL, NULL),
(468, 468, 'images/product/1583994037A3 ACI Freedom Regular Flow Wings 10 pads.jpg', NULL, NULL),
(469, 469, 'images/product/1583994198A14 Freedom Teens Ultra Chic Soft Sanitary Napkin.jpg', NULL, NULL),
(470, 470, 'images/product/1583994235A4 ACI Freedom Regular Flow Panty 15 pads.jpg', NULL, NULL),
(471, 471, 'images/product/1583994273A11 ACI Savlon Freedom Regular Flow Belt System 15 pads.jpg', NULL, NULL),
(472, 472, 'images/product/1583994309A7 ACI Freedom Regular Flow Belt 10 pads.jpg', NULL, NULL),
(473, 473, 'images/product/1594202927complan boy.jpg', NULL, NULL),
(474, 474, 'images/product/1584076924Complan Chocholate.jpg', NULL, NULL),
(475, 475, 'images/product/1584077139Complan Chocholate.jpg', NULL, NULL),
(476, 476, 'images/product/1584077172Complan Chocholate.jpg', NULL, NULL),
(477, 477, 'images/product/1584077220ovaltine malted chocolate drink jar.jpg', NULL, NULL),
(478, 478, 'images/product/1584077272Horlicks jar.jpg', NULL, NULL),
(479, 479, 'images/product/1584077352chokholate Horlicks jar.jpg', NULL, NULL),
(480, 480, 'images/product/1584077389womens Horlicks jar.jpg', NULL, NULL),
(481, 481, 'images/product/1584077439Mothers Horlicks Bib.jpg', NULL, NULL),
(482, 482, 'images/product/1584077481Horlicks refill.jpg', NULL, NULL),
(483, 483, 'images/product/1584077539Horlicks Grouth plus.jpg', NULL, NULL),
(484, 484, 'images/product/1584077615cadbury bourn vita.jpg', NULL, NULL),
(485, 485, 'images/product/1584077671Nestle Nesquik Strawberry powder.jpg', NULL, NULL),
(486, 486, 'images/product/1584077781Nestle nestum higher in whole grain ceral milk drink.jpg', NULL, NULL),
(487, 487, 'images/product/1584077856Nestle nestum higher in whole grain ceral milk drink.jpg', NULL, NULL),
(488, 488, 'images/product/1584078013Quality brown premium egg.jpg', NULL, NULL),
(489, 489, 'images/product/1584078061Purnava vitamin egg.jpg', NULL, NULL),
(490, 490, 'images/product/1584078119purnava omega 3 enriched egg.jpg', NULL, NULL),
(491, 491, 'images/product/1584078305Nestle koko krunch cereals box (FREE maggi 2 min thai soup).jpg', NULL, NULL),
(492, 492, 'images/product/1584078356nestle corn flakes breakfast cereal box.jpg', NULL, NULL),
(493, 493, 'images/product/1584078403Nestle koko krunch Duo cereals box.jpg', NULL, NULL),
(494, 494, 'images/product/1584078510nestle MILO breakfast chocolate cereal box.jpg', NULL, NULL),
(495, 495, 'images/product/1584078545nestle corn flakes breakfast cereal box (FREE maggi masala noodles).jpg', NULL, NULL),
(496, 496, 'images/product/1584078583quaker oats poly.jpg', NULL, NULL),
(497, 497, 'images/product/1584078615quaker oats australia.jpg', NULL, NULL),
(498, 498, 'images/product/1584078713quaker white oats.jpg', NULL, NULL),
(499, 499, 'images/product/1594202652dfgghhkjgf.jpg', NULL, NULL),
(500, 500, 'images/product/1594202776dfgghhkjgf.jpg', NULL, NULL),
(501, 501, 'images/product/1584078826Kelloggs chocos fills centre filled pillows.jpg', NULL, NULL),
(502, 502, 'images/product/1584078872sajeeb corn flakes.jpg', NULL, NULL),
(503, 503, 'images/product/1584079253shezan choko crunch.jpg', NULL, NULL),
(504, 504, 'images/product/1584079326vitalia sugar free corn flakes.jpg', NULL, NULL),
(505, 505, 'images/product/1584079391vitalia fit & active muesli.jpg', NULL, NULL),
(506, 506, 'images/product/1584079442Premuim grade fruit & nut muesli.jpg', NULL, NULL),
(507, 507, 'images/product/1584079475Premuim grade blueberry muesli.jpg', NULL, NULL),
(508, 508, 'images/product/1584079881Premuim grade blueberry muesli.jpg', NULL, NULL),
(509, 509, 'images/product/1584079957Premuim grade apricot muesli.jpg', NULL, NULL),
(510, 510, 'images/product/1584080041Premuim grade fig muesli.jpg', NULL, NULL),
(511, 511, 'images/product/1594203063image1.jpg', NULL, NULL),
(512, 512, 'images/product/1584091291Milk vita Butter.jpg', NULL, NULL),
(513, 513, 'images/product/1584091333Pran butter (fresco container).jpg', NULL, NULL),
(514, 514, 'images/product/1584091373pran mango jam.jpg', NULL, NULL),
(515, 515, 'images/product/1584091404pran mango jam.jpg', NULL, NULL),
(516, 516, 'images/product/1584091538alfa mayoannaise.jpg', NULL, NULL),
(517, 517, 'images/product/1584091794alfa mayoannaise.jpg', NULL, NULL),
(518, 518, 'images/product/1584092213Harman mayonnaise.jpg', NULL, NULL),
(519, 519, 'images/product/1584092251Harman mayonnaise.jpg', NULL, NULL),
(520, 520, 'images/product/1584092449harman peanut butter creamy.jpg', NULL, NULL),
(521, 521, 'images/product/1584092491calypso mayonnaise.jpg', NULL, NULL),
(522, 522, 'images/product/1584092529calypso mayonnaise.jpg', NULL, NULL),
(523, 523, 'images/product/1584092565foster clarks orange jelly.jpg', NULL, NULL),
(524, 524, 'images/product/1584092601foster clarks jam strawberry.jpg', NULL, NULL),
(525, 525, 'images/product/1584092644foster clarks cherry jelly.jpg', NULL, NULL),
(526, 526, 'images/product/1584092679foster clarks mango jelly.jpg', NULL, NULL),
(527, 527, 'images/product/1584092724foster clarks mixed fruit jam.jpg', NULL, NULL),
(528, 528, 'images/product/1584097954crown peanut butter chunky.jpg', NULL, NULL),
(529, 529, 'images/product/1584097999crown peanut butter smoot & creamy.jpg', NULL, NULL),
(530, 530, 'images/product/1584098087nocilla two colour chocolate.jpg', NULL, NULL),
(531, 531, 'images/product/1584098224nutella hazelnut cocoa spread.jpg', NULL, NULL),
(532, 532, 'images/product/1584098276amul pasteurised butter.jpg', NULL, NULL),
(533, 533, 'images/product/1584098338farm fresh Butter.jpg', NULL, NULL),
(534, 534, 'images/product/1584098500alamarai processed cream cheese.jpg', NULL, NULL),
(535, 535, 'images/product/1584098554Ruchi orange jam.jpg', NULL, NULL),
(536, 536, 'images/product/1584098654Ahmed orange jelly.jpg', NULL, NULL),
(537, 537, 'images/product/1594202460ahmed sugar.jpg', NULL, NULL),
(538, 538, 'images/product/1584098752Ahmed mixed fruit jam.jpg', NULL, NULL),
(539, 539, 'images/product/1584098789ahmed suger free guava jelly.jpg', NULL, NULL),
(540, 540, 'images/product/1584098855ahmed mixed fruit jelly.jpg', NULL, NULL),
(541, 541, 'images/product/1584098890ahmed pineapple jelly.jpg', NULL, NULL),
(542, 542, 'images/product/1584098936ahmed guava jelly.jpg', NULL, NULL),
(543, 543, 'images/product/1584098978ahmed apple jam.jpg', NULL, NULL),
(544, 544, 'images/product/1584099011ahmed mango jam.jpg', NULL, NULL),
(545, 545, 'images/product/1584099055ahmed pineapple jam.jpg', NULL, NULL),
(546, 546, 'images/product/1584099119Khushboo premium orange jelly.jpg', NULL, NULL),
(547, 547, 'images/product/1594202311sundrop.jpg', NULL, NULL),
(548, 548, 'images/product/1584099237sundrop peanut butter crunchy.jpg', NULL, NULL),
(549, 549, 'images/product/1584099278BD orange jelly.jpg', NULL, NULL),
(550, 550, 'images/product/1584099327shezan orange jelly.jpg', NULL, NULL),
(551, 551, 'images/product/1584099570American Green chunky peanut butter.jpg', NULL, NULL),
(552, 552, 'images/product/1584099644Pran puffed rice (MURI).jpg', NULL, NULL),
(553, 553, 'images/product/1584099725Pran puffed rice (MURI).jpg', NULL, NULL),
(554, 554, 'images/product/1584099823Pran All time cream roll.jpg', NULL, NULL),
(555, 555, 'images/product/1584099859Pran fattened rice (chira).jpg', NULL, NULL),
(556, 556, 'images/product/1584100000Golden Harvest frozen paratha family pack.jpg', NULL, NULL),
(557, 557, 'images/product/1584261472Golden Harvest aloo paratha.jpg', NULL, NULL),
(558, 558, 'images/product/1584262888Golden harvest mega deshi paratha.jpg', NULL, NULL),
(559, 559, 'images/product/1584262951cocola chocolate water roll jar.jpg', NULL, NULL),
(560, 560, 'images/product/1584263244Dan cake vanilla Muffin.jpg', NULL, NULL),
(561, 561, 'images/product/1584263293dan cake chocolate muffin.jpg', NULL, NULL),
(562, 562, 'images/product/1584263364dan cake vanilla muffine.jpg', NULL, NULL),
(563, 563, 'images/product/1584263915dan cake chocolate layer cake.jpg', NULL, NULL),
(564, 564, 'images/product/1584263975dan cake lemon pound cake.jpg', NULL, NULL),
(565, 565, 'images/product/1584264015Tiffany crunch\'N\' cream hazelnut wafers.jpg', NULL, NULL),
(566, 566, 'images/product/1594195871Tiffany crunch\'N\' cream orange wafers.jpg', NULL, NULL),
(567, 567, 'images/product/1584264151Ispanahi Bakery Fresh dry cake.jpg', NULL, NULL),
(568, 568, 'images/product/1584264543Lamisa Paratha family pack.jpg', NULL, NULL),
(569, 569, 'images/product/1584264628Lamisa premium paratha.jpg', NULL, NULL),
(570, 570, 'images/product/15951077862018-04-06_221313.522794cocolaeggnoodles180gm_5ab381498dfe5-.3446.jpg', NULL, NULL),
(571, 571, 'images/product/1584267532cocola junior cup noodles.jpg', NULL, NULL),
(572, 572, 'images/product/1584267593nestle Maggi 2 minute noodles masala 8 pack.jpg', NULL, NULL),
(573, 573, 'images/product/1584267634nestle Maggi 2 minute noodles masala 4 pack.jpg', NULL, NULL),
(574, 574, 'images/product/1584267798Chopstick deshi masala instant noodles (Free surprise Gift) 8 pack.jpg', NULL, NULL),
(575, 575, 'images/product/1584267893Nestle Maggi Healty thai soup.jpg', NULL, NULL),
(576, 576, 'images/product/1584267944nestle maggi healty soup corn with chicken Flavour.jpg', NULL, NULL),
(577, 577, 'images/product/1584267987Nestle maggi shaad e magic seasoning.jpg', NULL, NULL),
(578, 578, 'images/product/1584268030Nestle maggi healty soup vegetables.jpg', NULL, NULL),
(579, 579, 'images/product/1584268349kolson Macaroni shell.jpg', NULL, NULL),
(580, 580, 'images/product/1584268387kolson Bamboo.jpg', NULL, NULL),
(581, 581, 'images/product/1584268449kolson macaroni screw.jpg', NULL, NULL),
(582, 582, 'images/product/1584268486kolson macaroni assorted pack.jpg', NULL, NULL),
(583, 583, 'images/product/1584268530Dekko pasta.jpg', NULL, NULL),
(584, 584, 'images/product/1584268634Bashundhara sea shell pasta.jpg', NULL, NULL),
(585, 585, 'images/product/1584268671Pasta hat macaroni (Rigate).jpg', NULL, NULL),
(586, 586, 'images/product/1584268855Pasta hat macaroni (Medium shell).jpg', NULL, NULL);
INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(587, 587, 'images/product/1584268891pasta hat macaroni (screw).jpg', NULL, NULL),
(588, 588, 'images/product/1584268935pasta hat macaroni (Big Elbow).jpg', NULL, NULL),
(589, 589, 'images/product/1584269300Nestle Kitkat 4 finger.jpg', NULL, NULL),
(590, 590, 'images/product/1584269337kitkat 2 finger.jpg', NULL, NULL),
(591, 591, 'images/product/1584269376Nestle Chocolate Assorted Chocolate.jpg', NULL, NULL),
(592, 592, 'images/product/1584269458Nestle nesquik chocolate powder.jpg', NULL, NULL),
(593, 593, 'images/product/1584269883Snikers Chocolate.jpg', NULL, NULL),
(594, 594, 'images/product/1584269929Snikers Chocolate.jpg', NULL, NULL),
(595, 595, 'images/product/1584270318snikers family pack chocolate.jpg', NULL, NULL),
(596, 596, 'images/product/1584270368snikers power pack.jpg', NULL, NULL),
(597, 597, 'images/product/1584270506Cadbury Dairy Milk silk chocolate.jpg', NULL, NULL),
(598, 598, 'images/product/1584270547cadbury 5 star chocolate.jpg', NULL, NULL),
(599, 599, 'images/product/1584272139cadbury choclairs.jpg', NULL, NULL),
(600, 600, 'images/product/1584272277cadbury dairy millk silk fruit & nut.jpg', NULL, NULL),
(601, 601, 'images/product/1584272325cadbury bournville rich cocoa dark chocolate.jpg', NULL, NULL),
(602, 602, 'images/product/1584272584cadbury original drinking chocolate.jpg', NULL, NULL),
(603, 603, 'images/product/1584272673cadbury gems surprise chocolate ball.jpg', NULL, NULL),
(604, 604, 'images/product/1584272813cadbury gems surprise chocolate.jpg', NULL, NULL),
(605, 605, 'images/product/1584273444cadbury dairy milk silk roast almond.jpg', NULL, NULL),
(606, 606, 'images/product/1584273519cadbury fuse chocolate.jpg', NULL, NULL),
(607, 607, 'images/product/1584273551cadbury bournville raisin and nusts dark chocolate.jpg', NULL, NULL),
(608, 608, 'images/product/1584273737cadbury bournville cranberry dark chocolate.jpg', NULL, NULL),
(609, 609, 'images/product/1584273784cadbury bournville cranberry dark chocolate.jpg', NULL, NULL),
(610, 610, 'images/product/1584273886cadbury dairy milk lickables.jpg', NULL, NULL),
(611, 611, 'images/product/1584273930kopiko coffee candy.jpg', NULL, NULL),
(612, 612, 'images/product/1584274052kopiko coffee cappuccino.jpg', NULL, NULL),
(613, 613, 'images/product/1584274203olympic tetul candy.jpg', NULL, NULL),
(614, 614, 'images/product/1584274271olympic juicy litchi candy.jpg', NULL, NULL),
(615, 615, 'images/product/1584274462olympic mango candy.jpg', NULL, NULL),
(616, 616, 'images/product/1584274518Alpenliebe original caramel candy pouch.jpg', NULL, NULL),
(617, 617, 'images/product/1584274631Alpenliebe Creamfills Box.jpg', NULL, NULL),
(618, 618, 'images/product/1584274670Alpenliebe pop Party Pack Lollipop surprise Gift.jpg', NULL, NULL),
(619, 619, 'images/product/1584339146Ispahani Mirzapore Best leaf Tea.jpg', NULL, NULL),
(620, 620, 'images/product/1584339184Ispahani Mirzapore Best leaf Tea.jpg', NULL, NULL),
(621, 621, 'images/product/1584339227Ispahani Mirzapur Red dust tea.jpg', NULL, NULL),
(622, 622, 'images/product/1584339254ispahani mirzapore Tea bag.jpg', NULL, NULL),
(623, 623, 'images/product/1584339298Ispahani blender\'s choice green tea.jpg', NULL, NULL),
(624, 624, 'images/product/1584339326Ispahani blender\'s choice green tea.jpg', NULL, NULL),
(625, 625, 'images/product/1584339359Ispahani blender\'s choice green tea.jpg', NULL, NULL),
(626, 626, 'images/product/1584339387Ispahani blender\'s choice green tea.jpg', NULL, NULL),
(627, 627, 'images/product/1584339699Ispahani mirzapore PD tea.jpg', NULL, NULL),
(628, 628, 'images/product/1584339748Ispahani zareen premium tea.jpg', NULL, NULL),
(629, 629, 'images/product/1584339823Brooke bond Taaza Tea black tea.jpg', NULL, NULL),
(630, 630, 'images/product/1584339857Brooke bond Taaza Tea black tea.jpg', NULL, NULL),
(631, 631, 'images/product/1584339906Brooke bond Taaza Tea bag 50pcs.jpg', NULL, NULL),
(632, 632, 'images/product/1584340176Fresh Premium Tea (cup free).jpg', NULL, NULL),
(633, 633, 'images/product/1584340213Fresh Premium Tea (spoon free).jpg', NULL, NULL),
(634, 634, 'images/product/1584340332kazi & kazi Green tea.jpg', NULL, NULL),
(635, 635, 'images/product/1584340367kazi & kazi Orthodox Green tea.jpg', NULL, NULL),
(636, 636, 'images/product/1584340398kazi & kazi Ginger tea.jpg', NULL, NULL),
(637, 637, 'images/product/1584340608kazi & kazi Tulsi tea.jpg', NULL, NULL),
(638, 638, 'images/product/1584341232kazi & kazi black tea.jpg', NULL, NULL),
(639, 639, 'images/product/1584341687kazi & kazi Lemongrass tea.jpg', NULL, NULL),
(640, 640, 'images/product/1584341737kazi & kazi medley tea.jpg', NULL, NULL),
(641, 641, 'images/product/1584341859kazi & kazi Lemongrass herbal infusion.jpg', NULL, NULL),
(642, 642, 'images/product/1584341896Finlays pure Green tea bags.jpg', NULL, NULL),
(643, 643, 'images/product/1584341962Finlays pure green tea box.jpg', NULL, NULL),
(644, 644, 'images/product/1584342005finlays natural green tea bags.jpg', NULL, NULL),
(645, 645, 'images/product/1584342072finlays masala cha tea bags.jpg', NULL, NULL),
(646, 646, 'images/product/1584342129finlay premium tea.jpg', NULL, NULL),
(647, 647, 'images/product/1584342159finlay gold tea.jpg', NULL, NULL),
(648, 648, 'images/product/1584342189finlay gold tea.jpg', NULL, NULL),
(649, 649, 'images/product/1584342541Tetley premium tea bags.jpg', NULL, NULL),
(650, 650, 'images/product/1584342630tetly green tea (PURE original) tea bags.jpg', NULL, NULL),
(651, 651, 'images/product/1584346595Nestle Nescafe classic instant coffee jar.jpg', NULL, NULL),
(652, 652, 'images/product/1584346643Nestle Nescafe classic instant coffee jar.jpg', NULL, NULL),
(653, 653, 'images/product/1584346677Nestle Nescafe classic instant coffee jar.jpg', NULL, NULL),
(654, 654, 'images/product/1584346713Nescafe classice pouch pack (container free).jpg', NULL, NULL),
(655, 655, 'images/product/1584346846nestle coffee mate richer & creamer BIB.jpg', NULL, NULL),
(656, 656, 'images/product/1584346882nestle coffee mate creamer.jpg', NULL, NULL),
(657, 657, 'images/product/1584346930nescafe gold jar.jpg', NULL, NULL),
(658, 658, 'images/product/1584346994nescafe matinal jar.jpg', NULL, NULL),
(659, 659, 'images/product/1584347036nescafe ipoh original white coffee.jpg', NULL, NULL),
(660, 660, 'images/product/1584347118nescafe singapore kopi C.jpg', NULL, NULL),
(661, 661, 'images/product/1584347157nestle nescafe creamy latte.jpg', NULL, NULL),
(662, 662, 'images/product/1584347229Nestea iced tea lemon.jpg', NULL, NULL),
(663, 663, 'images/product/1584347329Tora bika cappuccino.jpg', NULL, NULL),
(664, 664, 'images/product/1584347368Tora bika creamy latte.jpg', NULL, NULL),
(665, 665, 'images/product/1584347401Kopico white mocca mocha coffee.jpg', NULL, NULL),
(666, 666, 'images/product/1584347487Mac coffee gold jar.jpg', NULL, NULL),
(667, 667, 'images/product/1584347536Mac coffee gold jar.jpg', NULL, NULL),
(668, 668, 'images/product/1584347569Mac coffee original jar.jpg', NULL, NULL),
(669, 669, 'images/product/1584347606mac coffee coffee & creamer 2 in 1.jpg', NULL, NULL),
(670, 670, 'images/product/1584347729Bru pure instant coffee jar.jpg', NULL, NULL),
(671, 671, 'images/product/1584347839Bru pure instant coffee jar.jpg', NULL, NULL),
(672, 672, 'images/product/1584347877Bru original coffee jar.jpg', NULL, NULL),
(673, 673, 'images/product/1584347908Bru original rich aromatic coffee jar.jpg', NULL, NULL),
(674, 674, 'images/product/1584347989Latina 100% Juich (Apple).jpg', NULL, NULL),
(675, 675, 'images/product/1584348080Latina 100% Juich (Orange).jpg', NULL, NULL),
(676, 676, 'images/product/1584348157Pran Drinko Litchi Juice.jpg', NULL, NULL),
(677, 677, 'images/product/1584348219pran apple fruit drink.jpg', NULL, NULL),
(678, 678, 'images/product/1584348262pran frooto mango fruit drink.jpg', NULL, NULL),
(679, 679, 'images/product/1584348291pran frooto mango fruit drink.jpg', NULL, NULL),
(680, 680, 'images/product/1584348323pran frooto mango fruit drink.jpg', NULL, NULL),
(681, 681, 'images/product/1584348416shezan mango fruit drinks.jpg', NULL, NULL),
(682, 682, 'images/product/1584348448shezan mango juice.jpg', NULL, NULL),
(683, 683, 'images/product/1584348487sajeeb lichi flavored drink.jpg', NULL, NULL),
(684, 684, 'images/product/1584348537sajeeb orange flavored drink.jpg', NULL, NULL),
(685, 685, 'images/product/1584348587Masafi mango nectar juice.jpg', NULL, NULL),
(686, 686, 'images/product/1584348624Masafi apple juice.jpg', NULL, NULL),
(687, 687, 'images/product/1584348668Masafi Tropical Fruits Necter.jpg', NULL, NULL),
(688, 688, 'images/product/1584348713Aloe vera mango drink.jpg', NULL, NULL),
(689, 689, 'images/product/1584348748Aloe vera prome drink.jpg', NULL, NULL),
(690, 690, 'images/product/1584348788Ocean spray cranberry classic juice.jpg', NULL, NULL),
(691, 691, 'images/product/1594195069coca-cola-225-ltr.jpg', NULL, NULL),
(692, 692, 'images/product/1594194998coca-cola-225-ltr.jpg', NULL, NULL),
(693, 693, 'images/product/1594194826coca cola.jpg', NULL, NULL),
(694, 694, 'images/product/1584349666cocacola can.jpg', NULL, NULL),
(695, 695, 'images/product/1584349706cocacola classic.jpg', NULL, NULL),
(696, 696, 'images/product/1584349979Sprite.jpg', NULL, NULL),
(697, 697, 'images/product/1584350032Sprite.jpg', NULL, NULL),
(698, 698, 'images/product/1584350067Sprite.jpg', NULL, NULL),
(699, 699, 'images/product/1584350102sprite can.jpg', NULL, NULL),
(700, 700, 'images/product/15843501357up pet.jpg', NULL, NULL),
(701, 701, 'images/product/15843501657up pet.jpg', NULL, NULL),
(702, 702, 'images/product/15843502037up can.jpg', NULL, NULL),
(703, 703, 'images/product/1584350248pepsi can.jpg', NULL, NULL),
(704, 704, 'images/product/1584350307clemon pet.jpg', NULL, NULL),
(705, 705, 'images/product/1584350432clemon pet.jpg', NULL, NULL),
(706, 706, 'images/product/1584350470pran up.jpg', NULL, NULL),
(707, 707, 'images/product/1584350507pran up.jpg', NULL, NULL),
(708, 708, 'images/product/1584350541Frutica mango juice.jpg', NULL, NULL),
(709, 709, 'images/product/1584350578Rooh Afza.jpg', NULL, NULL),
(710, 710, 'images/product/1584350612Rooh Afza.jpg', NULL, NULL),
(711, 711, 'images/product/1584351254Glaxos D pack.jpg', NULL, NULL),
(712, 712, 'images/product/1584351306Glaxos D orange.jpg', NULL, NULL),
(713, 713, 'images/product/1584351365Tang Mango powder.jpg', NULL, NULL),
(714, 714, 'images/product/1584351570Tang Lemon Powder.jpg', NULL, NULL),
(715, 715, 'images/product/1584351605Tang orange pack.jpg', NULL, NULL),
(716, 716, 'images/product/1584351775Tang mango jar.jpg', NULL, NULL),
(717, 717, 'images/product/1584351857Tang pineapple powder.jpg', NULL, NULL),
(718, 718, 'images/product/1584351958Tang Tropical Coctail Powder.jpg', NULL, NULL),
(719, 719, 'images/product/1584352060Foster clarks Drink orange.jpg', NULL, NULL),
(720, 720, 'images/product/1584352101Foster clarks mandarin jar.jpg', NULL, NULL),
(721, 721, 'images/product/1584352282Foster clarks pineapple jar.jpg', NULL, NULL),
(722, 722, 'images/product/1584352328forter clarks lemon instant flavoured drink.jpg', NULL, NULL),
(723, 723, 'images/product/1584352867Ispi Instant Powder drink (orange).jpg', NULL, NULL),
(724, 724, 'images/product/1584352906Ispi Instant Powder drink (orange).jpg', NULL, NULL),
(725, 725, 'images/product/1584352940Ispi soft Powder drink (mango).jpg', NULL, NULL),
(726, 726, 'images/product/1584352977ispi instant powder drink jar (orange).jpg', NULL, NULL),
(727, 727, 'images/product/1584470635almer-hand-sanitizer-50-ml.jpg', NULL, NULL),
(728, 728, 'images/product/1584470801lifebuoy-handwash-total-pump-200-ml.jpg', NULL, NULL),
(729, 729, 'images/product/1584470897lifebuoy-handwash-lemon-fresh-refill-170-ml.jpg', NULL, NULL),
(730, 730, 'images/product/1584471011aci-savlon-active-handwash-bottle-250-ml.jpg', NULL, NULL),
(731, 731, 'images/product/1584471076aci-savlon-antiseptic-handwash-ocean-blue-pump-300-ml.jpg', NULL, NULL),
(732, 732, 'images/product/1584538057ad0cf987-73ec-492e-9316-63e5e01d5482.jpg', NULL, NULL),
(733, 733, 'images/product/15845390584f375ec9-3121-4919-8ba2-164c675794fa.jpg', NULL, NULL),
(734, 734, 'images/product/15845391525c9dac41-c6a2-4dd6-bcc4-10d6eb68fb85.jpg', NULL, NULL),
(735, 735, 'images/product/1584539417edee90c5-6fc1-4a5d-ab1f-d311c6588cac.jpg', NULL, NULL),
(736, 736, 'images/product/15845398432adbda95-8fbf-4e57-8d35-5865dccc9cc4.jpg', NULL, NULL),
(737, 737, 'images/product/1584540051a0bcf037-e227-4971-910e-58de015f9806.jpg', NULL, NULL),
(738, 738, 'images/product/1584540330e9600291-ef79-47f6-8912-508289c4f3f4.jpg', NULL, NULL),
(739, 739, 'images/product/1584540421b9a0c967-9c0b-4812-8b01-7586aa931a14.jpg', NULL, NULL),
(740, 740, 'images/product/1584554474arla-dano-daily-pusti-milk-powder-1-kg.jpg', NULL, NULL),
(741, 741, 'images/product/1593963999chicken-egg-layer.png', NULL, NULL),
(742, 742, 'images/product/1593963617organic-mustard-oil.jpeg', NULL, NULL),
(743, 743, 'images/product/1584608710Marks gold high calcium low fat milk powder for 40+ yrs.jpg', NULL, NULL),
(744, 744, 'images/product/1584608747marks milk based diabetic diet.jpg', NULL, NULL),
(745, 745, 'images/product/1584608779marks active school milk powder.jpg', NULL, NULL),
(746, 746, 'images/product/1584608811Marks active school 2 in 1 chocolate milk powder.jpg', NULL, NULL),
(747, 747, 'images/product/1584608888Marks full cream milk powder.jpg', NULL, NULL),
(748, 748, 'images/product/1584608923Marks diet low fat milk powder.jpg', NULL, NULL),
(749, 749, 'images/product/1584608973Pran full cream milk powder.jpg', NULL, NULL),
(750, 750, 'images/product/1584615006Meril Baby Shampoo.jpg', NULL, NULL),
(751, 751, 'images/product/1584615039Meril Baby Olive Oil.jpg', NULL, NULL),
(752, 752, 'images/product/1584615082Meril Baby Lotion.jpg', NULL, NULL),
(753, 753, 'images/product/1584615133Meril Baby Mild Honey Soap.jpg', NULL, NULL),
(754, 754, 'images/product/1584615267Johnson\'s Baby Original Baby Softness Lotion.jpg', NULL, NULL),
(755, 755, 'images/product/1584615297Johnson\'s Baby Shampoo.jpg', NULL, NULL),
(756, 756, 'images/product/1584615327Johnson\'s Baby Blossoms Soap.jpg', NULL, NULL),
(757, 757, 'images/product/1584615356Johnson\'s Baby Oil.jpg', NULL, NULL),
(758, 758, 'images/product/1584615786Johnson\'s Baby Soap.png', NULL, NULL),
(759, 759, 'images/product/1584615817Johnson\'s Baby 24 Hour Moisture Lotion.jpg', NULL, NULL),
(760, 760, 'images/product/1584615845Johnson\'s Baby Milk + Rice Cream.jpg', NULL, NULL),
(761, 761, 'images/product/1584615878Johnson\'s Baby Bath Milk + Rice.jpg', NULL, NULL),
(762, 762, 'images/product/1584615910Johnson\'s Baby Powder.jpg', NULL, NULL),
(763, 763, 'images/product/1584615940Johnson\'s Baby Hair Oil.jpg', NULL, NULL),
(764, 764, 'images/product/1584615974Johnson\'s Baby Jelly Lightly Fragranced.jpg', NULL, NULL),
(765, 765, 'images/product/1584616003Johnson\'s Blossoms Baby Powder.jpg', NULL, NULL),
(766, 766, 'images/product/1584616038Johnson\'s Baby Jelly Lightly Fragranced.jpg', NULL, NULL),
(767, 767, 'images/product/1584616079Johnson\'s Top To Toe Baby Wash.jpg', NULL, NULL),
(768, 768, 'images/product/1584616670Dove Baby Rich Moisture Lotion.jpg', NULL, NULL),
(769, 769, 'images/product/1584616709Dove Baby Sensitive Moisture Lotion.jpg', NULL, NULL),
(770, 770, 'images/product/1584616913Parachute Just for Baby - Baby Lotion.jpg', NULL, NULL),
(771, 771, 'images/product/1584617026Parachute Just for Baby - Baby Oil.jpg', NULL, NULL),
(772, 772, 'images/product/1584617115Parachute Just for Baby - Baby Powder.jpg', NULL, NULL),
(773, 773, 'images/product/1584617253Parachute Just for Baby - Baby Soap.jpg', NULL, NULL),
(774, 774, 'images/product/1584617288Parachute Just for Baby Baby Soap Combo.jpg', NULL, NULL),
(775, 775, 'images/product/1584694143Pampers Baby Dry Pants Diaper Pant - 36 pcs.jpg', NULL, NULL),
(776, 776, 'images/product/1584694351Pampers Baby Dry Pants Diaper Pant - 44 pcs.jpg', NULL, NULL),
(777, 777, 'images/product/1584694433Pampers Baby Dry Pants Diaper Pant  - 54 pcs.jpg', NULL, NULL),
(778, 778, 'images/product/1584694519Pampers Baby Dry Pants Diaper Pant - 28 pcs.jpg', NULL, NULL),
(779, 779, 'images/product/1584694623Pampers Baby Dry Diaper Belt -38 pcs.jpg', NULL, NULL),
(780, 780, 'images/product/1584694695Pampers Baby Diaper Belt - 40 pcs.jpg', NULL, NULL),
(781, 781, 'images/product/1584694988Pampers Baby Dry Size 4 Jumbo Plus Pack Pants - 72 pcs.jpg', NULL, NULL),
(782, 782, 'images/product/1584695061Pampers Baby Dry Pants Diaper Pant New born - 60 pcs.jpg', NULL, NULL),
(783, 783, 'images/product/1584695147ampers Baby Dry Size 6 Jumbo Plus Pack Pants- 52 pcs.jpg', NULL, NULL),
(784, 784, 'images/product/1584695208Pampers Baby Dry Pants Diaper Pant - 23 pcs.jpg', NULL, NULL),
(785, 785, 'images/product/1584696223Pampers Baby Dry Size 5 Essential Pack Pants - 33 pcs.jpg', NULL, NULL),
(786, 786, 'images/product/1584696700Pampers Baby Dry Size 2 Jumbo Plus Pack Belt - 68 pcs.jpg', NULL, NULL),
(787, 787, 'images/product/1584697173Pampers Baby Dry Size 5 Jumbo Plus Pack Belt - 72 pcs.jpg', NULL, NULL),
(788, 788, 'images/product/1584697272Pampers Baby Dry Size 8 Jumbo Plus Pack Belt - 52pcs.jpg', NULL, NULL),
(789, 789, 'images/product/1584697364Pampers Baby Dry Size 1 Jumbo Plus Pack Belt - 72 pcs.jpg', NULL, NULL),
(790, 790, 'images/product/1584697532Pampers Baby Dry Size 4 Essential Pack Pants - 38 pcs.jpg', NULL, NULL),
(791, 791, 'images/product/1584697573Pampers Baby Dry Size 3 Essential Pack Pants - 44 pcs.jpg', NULL, NULL),
(792, 792, 'images/product/1584697609Pampers Baby Dry Size 3 Jumbo Plus Pack Pants - 80 pcs.jpg', NULL, NULL),
(793, 793, 'images/product/1584697658Pampers Baby Dry Pants Diaper Pant - 76 pcs.jpg', NULL, NULL),
(794, 794, 'images/product/1584697754Pampers Baby Dry Size 6 Jumbo Plus Pack Belt - 62 pcs.jpg', NULL, NULL),
(795, 795, 'images/product/1584697983Huggies Baby Diaper Ultra Belt - 40pcs.jpg', NULL, NULL),
(796, 796, 'images/product/1584698020Huggies Baby Diaper Ultra Belt - 34 pcs.jpg', NULL, NULL),
(797, 797, 'images/product/1584698055Huggies Baby Diaper Ultra Belt - 44 pcs.jpg', NULL, NULL),
(798, 798, 'images/product/1584698084Huggies Dry Baby Diaper Belt - 30 pcs.jpg', NULL, NULL),
(799, 799, 'images/product/1584698114Huggies Dry Baby Diaper Belt  - 30 pcs.jpg', NULL, NULL),
(800, 800, 'images/product/1584698148Huggies Baby Diaper Dry Belt - 36 pcs.jpg', NULL, NULL),
(801, 801, 'images/product/1584698190Huggies Baby Diaper WonderPants Pant - 42 pcs.jpg', NULL, NULL),
(802, 802, 'images/product/1584698224Huggies Baby Diaper WonderPants Pant - 24 pcs.jpg', NULL, NULL),
(803, 803, 'images/product/1584698258Huggies Baby Diaper WonderPants Pant - 46 pcs.jpg', NULL, NULL),
(804, 804, 'images/product/1584698289Huggies Baby Diaper WonderPants Pant - 38 pcs.jpg', NULL, NULL),
(805, 805, 'images/product/1584698611Huggies Baby Diaper WonderPants Pant - 54 pcs.jpg', NULL, NULL),
(806, 806, 'images/product/1584698645Huggies Baby Diaper WonderPants Pant - 38 pcs.jpg', NULL, NULL),
(807, 807, 'images/product/1584698687Huggies Baby Diaper WonderPants Pant  - 28 pcs.jpg', NULL, NULL),
(808, 808, 'images/product/1584698718Huggies Dry Baby Belt Diaper - 60 pcs.jpg', NULL, NULL),
(809, 809, 'images/product/1584698750Huggies Dry Baby Diaper Belt - 60 pcs.jpg', NULL, NULL),
(810, 810, 'images/product/1584698996Huggies Dry Baby Diaper Belt - 72 pcs.jpg', NULL, NULL),
(811, 811, 'images/product/1584699031Huggies Dry Pants Baby Diaper Pant - 50 pcs.jpg', NULL, NULL),
(812, 812, 'images/product/1584699062Huggies Dry Pants Baby Diaper Pant - 42 pcs.jpg', NULL, NULL),
(813, 813, 'images/product/1584699092Huggies Dry Pants Baby Diaper Pant  - 60 pcs.jpg', NULL, NULL),
(814, 814, 'images/product/1584699123Huggies Dry Baby Diaper Belt - 48 pcs.jpg', NULL, NULL),
(815, 815, 'images/product/1584699658Huggies Dry Pants Baby Diaper Pant - 66 pcs.jpg', NULL, NULL),
(816, 816, 'images/product/1584699689Huggies Gold Diaper Ultra Pants Boys & Girls - 38 pcs.jpg', NULL, NULL),
(817, 817, 'images/product/1584699721Huggies Dry Pants Baby Diaper (Pant ) - 32 pcs.jpg', NULL, NULL),
(818, 818, 'images/product/1584699771Huggies Dry Baby Diaper New Born Belt - 64 pcs.jpg', NULL, NULL),
(819, 819, 'images/product/1584699804Huggies Baby Diaper Ultra New Born Belt - 48 pcs.jpg', NULL, NULL),
(820, 820, 'images/product/1584699877Huggies Dry Pants Baby Diaper Belt - 40 pcs.jpg', NULL, NULL),
(821, 821, 'images/product/1584699924Huggies Baby Diaper Ultra Belt - 30 pcs.jpg', NULL, NULL),
(822, 822, 'images/product/1584700023MamyPoko Pants Diaper Pant - 36 pcs.jpg', NULL, NULL),
(823, 823, 'images/product/1584700058MamyPoko Pants Diaper Pant - 42 pcs.jpg', NULL, NULL),
(824, 824, 'images/product/1584700093MamyPoko Pants Diaper Pant - 52 pcs.jpg', NULL, NULL),
(825, 825, 'images/product/1584700357MamyPoko Pants Diaper Pant - 44 pcs.jpg', NULL, NULL),
(826, 826, 'images/product/1584700442MamyPoko Pants Diaper Pant - 32 pcs.jpg', NULL, NULL),
(827, 827, 'images/product/1584702899MamyPoko Pants Diaper (Pant) - 22 pcs.jpg', NULL, NULL),
(828, 828, 'images/product/1584702937MamyPoko Pants Diaper Boys Pant - 64 pcs.jpg', NULL, NULL),
(829, 829, 'images/product/1584702970MamyPoko Pants Diaper Pant Boys - 52 pcs.jpg', NULL, NULL),
(830, 830, 'images/product/1594363611mamy.jpg', NULL, NULL),
(831, 831, 'images/product/1584703117MamyPoko Pants Boys Diaper Pant - 46 pcs.jpg', NULL, NULL),
(832, 832, 'images/product/1584703155MamyPoko Pants Baby Diaper Pant Girls - 38 pcs.jpg', NULL, NULL),
(833, 833, 'images/product/1584703189MamyPoko Pants Baby Diaper Pant Girls - 52 pcs.jpg', NULL, NULL),
(834, 834, 'images/product/1584703224MamyPoko Pants Diaper Pant - 36 pcs.jpg', NULL, NULL),
(835, 835, 'images/product/1594152926onion imported.png', NULL, NULL),
(836, 836, 'images/product/1594153115onion deshi.webp', NULL, NULL),
(837, 837, 'images/product/1584812427onion red.jpg', NULL, NULL),
(838, 838, 'images/product/158876581232_t.jpg', NULL, NULL),
(839, 839, 'images/product/1588766729AamRupali.jpg', NULL, NULL),
(840, 840, 'images/product/1588766786gopalvog.webp', NULL, NULL),
(841, 841, 'images/product/1588767401langra-mango-rajshahi.jpeg', NULL, NULL),
(842, 842, 'images/product/1590891931Lychee-Fruit.jpg', NULL, NULL),
(843, 843, 'images/product/1594285098cow.jpg', NULL, NULL),
(844, 844, 'images/product/1594285294013a31eff3e581df8e3279dd1e0349ca.jpg_80x80q90.jpg', NULL, NULL),
(845, 845, 'images/product/159428559077ac698a2ac853fb86f2b00e2d0f6710.jpg_80x80q90.jpg', NULL, NULL),
(846, 846, 'images/product/1594285791cow1.jpg', NULL, NULL),
(847, 847, 'images/product/1594285963cow3.jpg', NULL, NULL),
(848, 848, 'images/product/1594853370sundarbon honey websize 500gm.jpg', NULL, NULL),
(849, 849, 'images/product/1594938009fozli-mango.png', NULL, NULL),
(850, 850, 'images/product/1595104796mozammal miniket 20kg.jpg', NULL, NULL),
(851, 851, 'images/product/1595104946mozammal chinigura 1kg.jpg', NULL, NULL),
(852, 852, 'images/product/1595105252nazirshail-rice-premium-5-kg.jpg', NULL, NULL),
(853, 853, 'images/product/1595105337chinigura-rice-1-kg.jpg', NULL, NULL),
(854, 854, 'images/product/1595105570pran-chinigura-rice-2_1-kg.jpg', NULL, NULL),
(855, 855, 'images/product/1595105634atop-rice-1-kg.jpg', NULL, NULL),
(856, 856, 'images/product/1595105684katarivog-rice-1-kg.jpg', NULL, NULL),
(857, 857, 'images/product/1595105750rupchanda-chinigura-premium-aromatic-rice-1-kg.jpg', NULL, NULL),
(858, 858, 'images/product/15951069779301a98b7ac7-nazirshail-rice-premium-5-kg.jpg', NULL, NULL),
(859, 859, 'images/product/1595107052bddb100058f9-0289979_rashid-miniket-rice-25kg.jpeg', NULL, NULL),
(860, 860, 'images/product/1595107435ed69e1f6495b-ginger-local-500x500.jpg', NULL, NULL),
(861, 861, 'images/product/1595107565ce3f94e2ffa0-download.jpg', NULL, NULL),
(862, 862, 'images/product/1595107630bed55ee4c8be-roshun.jpg', NULL, NULL),
(863, 863, 'images/product/1595108929rice-flour-500x500-416x416.jpg', NULL, NULL),
(864, 864, 'images/product/15951092082019-07-24_052822.754956Thumbnail_5.jpg', NULL, NULL),
(865, 865, 'images/product/1595262599EGC001.jpeg', NULL, NULL),
(866, 866, 'images/product/1595262801EGC002.jpeg', NULL, NULL),
(867, 867, 'images/product/1595262872EGC003.jpeg', NULL, NULL),
(868, 868, 'images/product/1595262970EGC004.jpeg', NULL, NULL),
(869, 869, 'images/product/1595263205EGC005.jpeg', NULL, NULL),
(870, 870, 'images/product/1595263313EGC006.jpeg', NULL, NULL),
(871, 871, 'images/product/1595263383EGC007.jpeg', NULL, NULL),
(872, 872, 'images/product/1595263465EGC008.jpeg', NULL, NULL),
(873, 873, 'images/product/1595263634EGC009.jpeg', NULL, NULL),
(874, 874, 'images/product/1595264017EGM-001.jpg', NULL, NULL),
(875, 875, 'images/product/1595264146EGM-002.jpg', NULL, NULL),
(876, 876, 'images/product/1595264226EGM-003.jpg', NULL, NULL),
(877, 877, 'images/product/1595264303EGM-004.jpg', NULL, NULL),
(878, 878, 'images/product/1595264485EGM-005.jpg', NULL, NULL),
(879, 879, 'images/product/1595440627EGS001_220kg.jpg', NULL, NULL),
(880, 880, 'images/product/1595441343EGS002_250.jpg', NULL, NULL),
(881, 881, 'images/product/1595441577EGS003_160.jpg', NULL, NULL),
(882, 882, 'images/product/1595441837EGS004_1.jpg', NULL, NULL),
(883, 883, 'images/product/1595442252EGS005_210.jpg', NULL, NULL),
(884, 884, 'images/product/1596820980ilish Fish.png', NULL, NULL),
(885, 885, 'images/product/1596821243ilish Fish.png', NULL, NULL),
(886, 886, 'images/product/1596821422ilish Fish.png', NULL, NULL),
(887, 887, 'images/product/1597508213ilish Fish.png', NULL, NULL),
(888, 888, 'images/product/1597865952WR841N.jpg', NULL, NULL),
(889, 889, 'images/product/1597866110WR850N.jpg', NULL, NULL),
(890, 890, 'images/product/15978662611_C20.jpg', NULL, NULL),
(891, 891, 'images/product/1597866445WR820N.jpg', NULL, NULL),
(892, 892, 'images/product/1597866641C5 2.png', NULL, NULL),
(893, 893, 'images/product/1597866921C60.jpg', NULL, NULL),
(894, 894, 'images/product/1597867081WR940N.jpg', NULL, NULL),
(895, 895, 'images/product/1597867252WR840N.jpg', NULL, NULL),
(896, 896, 'images/product/1597867616A9.jpg', NULL, NULL),
(897, 897, 'images/product/1597867707WR845N.jpg', NULL, NULL),
(898, 898, 'images/product/1597867806W8961ND.jpg', NULL, NULL),
(899, 899, 'images/product/1597867892tl-wr840n-2-500x500.jpg', NULL, NULL),
(900, 900, 'images/product/1597867982archer-ax10-500x500.jpg', NULL, NULL),
(901, 901, 'images/product/1597868062hyu-500x500 (1).jpg', NULL, NULL),
(902, 902, 'images/product/1597868280Tenda F3-1-500x500.jpg', NULL, NULL),
(903, 903, 'images/product/1597868351Tenda N301-1-500x500.jpg', NULL, NULL),
(904, 904, 'images/product/15978684352-500x500.jpg', NULL, NULL),
(905, 905, 'images/product/1597868507f9-1-500x500.jpg', NULL, NULL),
(906, 906, 'images/product/1597868561ac5-500x500.jpg', NULL, NULL),
(907, 907, 'images/product/1597868634ac15-2-500x500.jpg', NULL, NULL),
(908, 908, 'images/product/15978686984g630-1-500x500.jpg', NULL, NULL),
(909, 909, 'images/product/1597868830ac6-1-500x500.jpg', NULL, NULL),
(910, 910, 'images/product/1597868893Tenda FH1202-1-500x500.jpg', NULL, NULL),
(911, 911, 'images/product/1597868964f6-1-500x500.jpg', NULL, NULL),
(912, 912, 'images/product/1597870032mw301r-1-500x500.jpg', NULL, NULL),
(913, 913, 'images/product/1597870094mw302r-1-500x500.jpg', NULL, NULL),
(914, 914, 'images/product/1597870160mw305r-1-500x500.jpg', NULL, NULL),
(915, 915, 'images/product/1597870351MW325R.jpg', NULL, NULL),
(916, 916, 'images/product/1597870414ac12-2-500x500.jpg', NULL, NULL),
(917, 917, 'images/product/159787048024-500x500.jpg', NULL, NULL),
(918, 918, 'images/product/1597870672mi-4c-1-500x500.jpg', NULL, NULL),
(919, 919, 'images/product/1597870751mi-4c-1-500x500.jpg', NULL, NULL),
(920, 920, 'images/product/1597870951-font-b-Xiaomi-b-font-font-b-WiFi-b-font-font-b-Amplifier-b-font.jpg', NULL, NULL),
(921, 921, 'images/product/1597871090u1-500x500.jpg', NULL, NULL),
(922, 922, 'images/product/1598091110UiiSii HM13.jpg', NULL, NULL),
(923, 923, 'images/product/1598091458UiiSii HM12.jpg', NULL, NULL),
(924, 924, 'images/product/1598091684UiiSii C100.jpg', NULL, NULL),
(925, 925, 'images/product/1598092300UiiSii T8.jpg', NULL, NULL),
(926, 926, 'images/product/1598092695UiiSii BT119.jpg', NULL, NULL),
(927, 927, 'images/product/1598093079UiiSii HM8.jpg', NULL, NULL),
(928, 928, 'images/product/1598093359UiiSii UX B.jpg', NULL, NULL),
(929, 929, 'images/product/1598093433UiiSii UX W.jpg', NULL, NULL),
(930, 930, 'images/product/1598093961UiiSii BN19 2.png', NULL, NULL),
(931, 931, 'images/product/1598103050rem 301.jpg', NULL, NULL),
(932, 932, 'images/product/1598103198501i rem.jpg', NULL, NULL),
(933, 933, 'images/product/1598103308rem 105.jpg', NULL, NULL),
(934, 934, 'images/product/1598103396rem 510.jpg', NULL, NULL),
(935, 935, 'images/product/1598103471rem 303.jpg', NULL, NULL),
(936, 936, 'images/product/1598103582rem 510.jpg', NULL, NULL),
(937, 937, 'images/product/1598103931rem 512.jpg', NULL, NULL),
(938, 938, 'images/product/1598104131rem 610d.jpg', NULL, NULL),
(939, 939, 'images/product/1598104297s28.jpg', NULL, NULL),
(940, 940, 'images/product/1598104375s2..jpg', NULL, NULL),
(941, 941, 'images/product/1598104899711.jpg', NULL, NULL),
(942, 942, 'images/product/1598105096rpp 139..jpg', NULL, NULL),
(943, 943, 'images/product/1598105271rpp 147.jpg', NULL, NULL),
(944, 944, 'images/product/1598105534rrp 141.jpg', NULL, NULL),
(945, 945, 'images/product/1598105641123.jpg', NULL, NULL),
(946, 946, 'images/product/1598105759rrp 73.jpg', NULL, NULL),
(947, 947, 'images/product/1598105894119.jpg', NULL, NULL),
(948, 948, 'images/product/1598106059leader 2.jpg', NULL, NULL),
(949, 949, 'images/product/1598106175rpp 153.jpg', NULL, NULL),
(950, 950, 'images/product/1598106284106.jpg', NULL, NULL),
(951, 951, 'images/product/1598106438n3.jpg', NULL, NULL),
(952, 952, 'images/product/1598106638piston basic.jpg', NULL, NULL),
(953, 953, 'images/product/1598106812sports youth.jpg', NULL, NULL),
(954, 954, 'images/product/1598106981airdots pro,.jpg', NULL, NULL),
(955, 955, 'images/product/1598107076type c.jpg', NULL, NULL),
(956, 956, 'images/product/1598108623redmi.jpg', NULL, NULL),
(957, 957, 'images/product/1598109453xiaomi 2.jpg', NULL, NULL),
(958, 958, 'images/product/1598109658xiaomi v3.jpg', NULL, NULL),
(959, 959, 'images/product/1598109835redmi  c30.jpg', NULL, NULL),
(960, 960, 'images/product/1598109996mi 12.jpg', NULL, NULL),
(961, 961, 'images/product/1598110256Mi In-Ear Pro HD Headphones.jpg', NULL, NULL),
(962, 962, 'images/product/1598110388Mi In-Ear Pro HD Headphones.jpg', NULL, NULL),
(963, 963, 'images/product/1598110568buds2.jpg', NULL, NULL),
(964, 964, 'images/product/1598110677r20.jpg', NULL, NULL),
(965, 965, 'images/product/1598110953realme buds.jpg', NULL, NULL),
(966, 966, 'images/product/1598111152realmi airbuds.jpg', NULL, NULL),
(967, 967, 'images/product/1598111310airbuds 4.jpg', NULL, NULL),
(968, 968, 'images/product/1598111497airdots.jpg', NULL, NULL),
(969, 969, 'images/product/1598111649105 ipx4.jpg', NULL, NULL),
(970, 970, 'images/product/1598118091650IN.jpg', NULL, NULL),
(971, 971, 'images/product/1598119908806in-ac750-1-500x500.jpg', NULL, NULL),
(972, 972, 'images/product/1598119967819 AC750.jpg', NULL, NULL),
(973, 973, 'images/product/1598120191841 AC1200.jpg', NULL, NULL),
(974, 974, 'images/product/1598120306DIR-1360 EXO AC1300.jpg', NULL, NULL),
(975, 975, 'images/product/1598120557DIR-600M.jpeg', NULL, NULL),
(976, 976, 'images/product/1598120712DIR-816 Wireless AC750.jpg', NULL, NULL),
(977, 977, 'images/product/1598120907DWR‑921 4G.jpg', NULL, NULL),
(978, 978, 'images/product/1598121151DWR-910 4G.jpg', NULL, NULL),
(979, 979, 'images/product/1598123282HM9.jpg', NULL, NULL),
(980, 980, 'images/product/1598123744morich-gura.jpg', NULL, NULL),
(981, 981, 'images/product/1598123796morich-gura.jpg', NULL, NULL),
(982, 982, 'images/product/1598123833morich-gura.jpg', NULL, NULL),
(983, 983, 'images/product/1598123971holud-gura.jpg', NULL, NULL),
(984, 984, 'images/product/1598124091holud-gura.jpg', NULL, NULL),
(985, 985, 'images/product/1598124275dhoniya-gura.jpg', NULL, NULL),
(986, 986, 'images/product/1598124341dhoniya-gura.jpg', NULL, NULL),
(987, 987, 'images/product/1598193980118118259_308850877044085_9163016870802367596_n.jpg', NULL, NULL),
(988, 988, 'images/product/1598194100118118259_308850877044085_9163016870802367596_n.jpg', NULL, NULL),
(989, 989, 'images/product/1598194177118118259_308850877044085_9163016870802367596_n.jpg', NULL, NULL),
(990, 990, 'images/product/15982788291129e9b2cc5273175b278534afe2a325.jpg_720x720q75.jpg', NULL, NULL),
(991, 991, 'images/product/1598736118malta.jpg', NULL, NULL),
(992, 992, 'images/product/15987361960002370_guava-thai-500-gm_360.png', NULL, NULL),
(993, 993, 'images/product/1598736375green apple.png', NULL, NULL),
(994, 994, 'images/product/15987364820003021_hog-plum-amra-500-gm_360.png', NULL, NULL),
(995, 995, 'images/product/1598737946deshi peyara.jpg', NULL, NULL),
(996, 996, 'images/product/1598737174jambura.jpg', NULL, NULL),
(997, 997, 'images/product/1598737536amla 22.JPG', NULL, NULL),
(998, 998, 'images/product/1598996377Discovery Peanut Butter chunky.jpg', NULL, NULL),
(999, 999, 'images/product/1598996529Peanut Butter Smooth Creamy.jpg', NULL, NULL),
(1000, 1000, 'images/product/1598996645Discovery Peanut Butter- Smooth n Creamy 510G.jpg', NULL, NULL),
(1001, 1001, 'images/product/1598996815Discovery Peanut Butter-340gm.jpg', NULL, NULL),
(1002, 1002, 'images/product/1598996977Organic Apple Cider Vinegar with mother.jpg', NULL, NULL),
(1003, 1003, 'images/product/1598997126Organic Unfiltered Apple Cider Virgin 1Ltr.jpg', NULL, NULL),
(1004, 1004, 'images/product/1598997281Discovery Apple Cider Vinegar 473ml.jpg', NULL, NULL),
(1005, 1005, 'images/product/1598997431Organic Apple Cider Vinegar with mother 250ml.jpg', NULL, NULL),
(1006, 1006, 'images/product/1601133246discovery bbq sauce.jpg', NULL, NULL),
(1007, 1007, 'images/product/1598997724Discovery Mustard Sauce- 227gm.jpg', NULL, NULL),
(1008, 1008, 'images/product/1599071768Pasta Hut Macaroni 500 gm.jpg', NULL, NULL),
(1009, 1009, 'images/product/1599071896Pasta Hat Spaghetti Pasta 500 gm - Imported Food.jpg', NULL, NULL),
(1010, 1010, 'images/product/1599072092Pasta Hat Spirali pasta 500 gm Imported Food.jpg', NULL, NULL),
(1011, 1011, 'images/product/1599072461Luglio Olive pomace Oil-5litre(Cooking Oil)- Made in Italy.jpg', NULL, NULL),
(1012, 1012, 'images/product/1599072520pasta_hat_vermicelli_fine_500g.png', NULL, NULL),
(1013, 1013, 'images/product/1599072774_mpimage0.jpg', NULL, NULL),
(1014, 1014, 'images/product/1599072869Pasta Hat Elbow Pasta , 500gm.jpg', NULL, NULL),
(1015, 1015, 'images/product/1599509679spm wipes.jpg', NULL, NULL),
(1016, 1016, 'images/product/1599763693kaju badam.jpg', NULL, NULL),
(1017, 1017, 'images/product/1599764142kath badam 2.png', NULL, NULL),
(1018, 1018, 'images/product/1599764493pista badam.jpg', NULL, NULL),
(1019, 1019, 'images/product/1599764978china badam.jpg', NULL, NULL),
(1020, 1020, 'images/product/1601132971dry fuits nuts final.jpg', NULL, NULL),
(1034, 10, 'images/product/16249767041582087020teer oil ltr.png', '2021-06-29 08:25:04', '2021-06-29 08:25:04'),
(1035, 10, 'images/product/16249767041582087387Screenshot_1.png', '2021-06-29 08:25:04', '2021-06-29 08:25:04'),
(1036, 10, 'images/product/16249767041582088377Screenshot_3.png', '2021-06-29 08:25:05', '2021-06-29 08:25:05'),
(1037, 10, 'images/product/16249767051582088569Screenshot_4.png', '2021-06-29 08:25:05', '2021-06-29 08:25:05'),
(1038, 10, 'images/product/16249767051582088700Screenshot_5.png', '2021-06-29 08:25:05', '2021-06-29 08:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

CREATE TABLE `product_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_units`
--

INSERT INTO `product_units` (`id`, `product_id`, `unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 3, 2, NULL, NULL),
(4, 4, 2, NULL, NULL),
(5, 5, 2, NULL, NULL),
(6, 6, 2, NULL, NULL),
(7, 7, 2, NULL, NULL),
(8, 8, 2, NULL, NULL),
(9, 9, 2, NULL, NULL),
(10, 10, 2, NULL, NULL),
(11, 11, 2, NULL, NULL),
(12, 12, 2, NULL, NULL),
(13, 13, 2, NULL, NULL),
(14, 14, 2, NULL, NULL),
(15, 15, 2, NULL, NULL),
(16, 16, 2, NULL, NULL),
(17, 17, 2, NULL, NULL),
(18, 18, 2, NULL, NULL),
(19, 19, 2, NULL, NULL),
(20, 20, 2, NULL, NULL),
(21, 21, 2, NULL, NULL),
(22, 22, 2, NULL, NULL),
(23, 23, 2, NULL, NULL),
(24, 24, 2, NULL, NULL),
(25, 25, 2, NULL, NULL),
(26, 26, 2, NULL, NULL),
(27, 27, 2, NULL, NULL),
(28, 28, 2, NULL, NULL),
(29, 29, 2, NULL, NULL),
(30, 30, 2, NULL, NULL),
(31, 31, 2, NULL, NULL),
(32, 32, 2, NULL, NULL),
(33, 33, 2, NULL, NULL),
(34, 34, 2, NULL, NULL),
(35, 35, 2, NULL, NULL),
(36, 36, 2, NULL, NULL),
(37, 37, 2, NULL, NULL),
(38, 38, 2, NULL, NULL),
(39, 39, 2, NULL, NULL),
(40, 40, 2, NULL, NULL),
(41, 41, 2, NULL, NULL),
(42, 42, 2, NULL, NULL),
(43, 43, 2, NULL, NULL),
(44, 44, 2, NULL, NULL),
(45, 45, 2, NULL, NULL),
(46, 46, 2, NULL, NULL),
(47, 47, 2, NULL, NULL),
(48, 48, 2, NULL, NULL),
(49, 49, 2, NULL, NULL),
(50, 50, 2, NULL, NULL),
(51, 51, 2, NULL, NULL),
(52, 52, 2, NULL, NULL),
(53, 53, 2, NULL, NULL),
(54, 54, 2, NULL, NULL),
(55, 55, 2, NULL, NULL),
(56, 56, 2, NULL, NULL),
(57, 57, 2, NULL, NULL),
(58, 58, 2, NULL, NULL),
(59, 59, 2, NULL, NULL),
(60, 60, 2, NULL, NULL),
(61, 61, 2, NULL, NULL),
(62, 62, 2, NULL, NULL),
(63, 63, 2, NULL, NULL),
(64, 64, 2, NULL, NULL),
(65, 65, 2, NULL, NULL),
(66, 66, 2, NULL, NULL),
(67, 67, 2, NULL, NULL),
(68, 68, 2, NULL, NULL),
(69, 69, 2, NULL, NULL),
(70, 70, 2, NULL, NULL),
(71, 71, 2, NULL, NULL),
(72, 72, 2, NULL, NULL),
(73, 73, 2, NULL, NULL),
(74, 74, 2, NULL, NULL),
(75, 75, 2, NULL, NULL),
(76, 76, 2, NULL, NULL),
(77, 77, 2, NULL, NULL),
(78, 78, 2, NULL, NULL),
(79, 79, 2, NULL, NULL),
(80, 80, 2, NULL, NULL),
(81, 81, 2, NULL, NULL),
(82, 82, 2, NULL, NULL),
(83, 83, 2, NULL, NULL),
(84, 84, 2, NULL, NULL),
(85, 85, 2, NULL, NULL),
(86, 86, 2, NULL, NULL),
(87, 87, 2, NULL, NULL),
(88, 88, 2, NULL, NULL),
(89, 89, 2, NULL, NULL),
(90, 90, 2, NULL, NULL),
(91, 91, 2, NULL, NULL),
(92, 92, 2, NULL, NULL),
(93, 93, 2, NULL, NULL),
(94, 94, 2, NULL, NULL),
(95, 95, 2, NULL, NULL),
(96, 96, 2, NULL, NULL),
(97, 97, 2, NULL, NULL),
(98, 98, 2, NULL, NULL),
(99, 99, 2, NULL, NULL),
(100, 100, 2, NULL, NULL),
(101, 101, 2, NULL, NULL),
(102, 102, 2, NULL, NULL),
(103, 103, 2, NULL, NULL),
(104, 104, 2, NULL, NULL),
(105, 105, 2, NULL, NULL),
(106, 106, 2, NULL, NULL),
(107, 107, 2, NULL, NULL),
(108, 108, 2, NULL, NULL),
(109, 109, 2, NULL, NULL),
(110, 110, 2, NULL, NULL),
(111, 111, 2, NULL, NULL),
(112, 112, 2, NULL, NULL),
(113, 113, 2, NULL, NULL),
(114, 114, 2, NULL, NULL),
(115, 115, 2, NULL, NULL),
(116, 116, 2, NULL, NULL),
(117, 117, 2, NULL, NULL),
(118, 118, 2, NULL, NULL),
(119, 119, 2, NULL, NULL),
(120, 120, 2, NULL, NULL),
(121, 121, 2, NULL, NULL),
(122, 122, 2, NULL, NULL),
(123, 123, 2, NULL, NULL),
(124, 124, 2, NULL, NULL),
(125, 125, 2, NULL, NULL),
(126, 126, 2, NULL, NULL),
(127, 127, 2, NULL, NULL),
(128, 128, 2, NULL, NULL),
(129, 129, 2, NULL, NULL),
(130, 130, 2, NULL, NULL),
(131, 131, 2, NULL, NULL),
(132, 132, 2, NULL, NULL),
(133, 133, 2, NULL, NULL),
(134, 134, 2, NULL, NULL),
(135, 135, 2, NULL, NULL),
(136, 136, 2, NULL, NULL),
(137, 137, 2, NULL, NULL),
(138, 138, 2, NULL, NULL),
(139, 139, 2, NULL, NULL),
(140, 140, 2, NULL, NULL),
(141, 141, 2, NULL, NULL),
(142, 142, 2, NULL, NULL),
(143, 143, 2, NULL, NULL),
(144, 144, 2, NULL, NULL),
(145, 145, 2, NULL, NULL),
(146, 146, 2, NULL, NULL),
(147, 147, 2, NULL, NULL),
(148, 148, 2, NULL, NULL),
(149, 149, 2, NULL, NULL),
(150, 150, 2, NULL, NULL),
(151, 151, 2, NULL, NULL),
(152, 152, 2, NULL, NULL),
(153, 153, 2, NULL, NULL),
(154, 154, 2, NULL, NULL),
(155, 155, 2, NULL, NULL),
(156, 156, 2, NULL, NULL),
(157, 157, 2, NULL, NULL),
(158, 158, 2, NULL, NULL),
(159, 159, 2, NULL, NULL),
(160, 160, 2, NULL, NULL),
(161, 161, 2, NULL, NULL),
(162, 162, 2, NULL, NULL),
(163, 163, 2, NULL, NULL),
(164, 164, 2, NULL, NULL),
(165, 165, 2, NULL, NULL),
(166, 166, 2, NULL, NULL),
(167, 167, 2, NULL, NULL),
(168, 168, 2, NULL, NULL),
(169, 169, 2, NULL, NULL),
(170, 170, 2, NULL, NULL),
(171, 171, 2, NULL, NULL),
(172, 172, 2, NULL, NULL),
(173, 173, 2, NULL, NULL),
(174, 174, 2, NULL, NULL),
(175, 175, 2, NULL, NULL),
(176, 176, 2, NULL, NULL),
(177, 177, 2, NULL, NULL),
(178, 178, 2, NULL, NULL),
(179, 179, 2, NULL, NULL),
(180, 180, 2, NULL, NULL),
(181, 181, 2, NULL, NULL),
(182, 182, 2, NULL, NULL),
(183, 183, 2, NULL, NULL),
(184, 184, 2, NULL, NULL),
(185, 185, 2, NULL, NULL),
(186, 186, 2, NULL, NULL),
(187, 187, 2, NULL, NULL),
(188, 188, 2, NULL, NULL),
(189, 189, 2, NULL, NULL),
(190, 190, 2, NULL, NULL),
(191, 191, 2, NULL, NULL),
(192, 192, 2, NULL, NULL),
(193, 193, 2, NULL, NULL),
(194, 194, 2, NULL, NULL),
(195, 195, 2, NULL, NULL),
(196, 196, 2, NULL, NULL),
(197, 197, 2, NULL, NULL),
(198, 198, 2, NULL, NULL),
(199, 199, 2, NULL, NULL),
(200, 200, 2, NULL, NULL),
(201, 201, 2, NULL, NULL),
(202, 202, 2, NULL, NULL),
(203, 203, 2, NULL, NULL),
(204, 204, 2, NULL, NULL),
(205, 205, 2, NULL, NULL),
(206, 206, 2, NULL, NULL),
(207, 207, 2, NULL, NULL),
(208, 208, 2, NULL, NULL),
(209, 209, 2, NULL, NULL),
(210, 210, 2, NULL, NULL),
(211, 211, 2, NULL, NULL),
(212, 212, 2, NULL, NULL),
(213, 213, 2, NULL, NULL),
(214, 214, 2, NULL, NULL),
(215, 215, 2, NULL, NULL),
(216, 216, 2, NULL, NULL),
(217, 217, 2, NULL, NULL),
(218, 218, 2, NULL, NULL),
(219, 219, 2, NULL, NULL),
(220, 220, 2, NULL, NULL),
(221, 221, 2, NULL, NULL),
(222, 222, 2, NULL, NULL),
(223, 223, 2, NULL, NULL),
(224, 224, 2, NULL, NULL),
(225, 225, 2, NULL, NULL),
(226, 226, 2, NULL, NULL),
(227, 227, 2, NULL, NULL),
(228, 228, 2, NULL, NULL),
(229, 229, 2, NULL, NULL),
(230, 230, 2, NULL, NULL),
(231, 231, 2, NULL, NULL),
(232, 232, 2, NULL, NULL),
(233, 233, 2, NULL, NULL),
(234, 234, 2, NULL, NULL),
(235, 235, 2, NULL, NULL),
(236, 236, 2, NULL, NULL),
(237, 237, 2, NULL, NULL),
(238, 238, 2, NULL, NULL),
(239, 239, 2, NULL, NULL),
(240, 240, 2, NULL, NULL),
(241, 241, 2, NULL, NULL),
(242, 242, 2, NULL, NULL),
(243, 243, 2, NULL, NULL),
(244, 244, 2, NULL, NULL),
(245, 245, 2, NULL, NULL),
(246, 246, 2, NULL, NULL),
(247, 247, 2, NULL, NULL),
(248, 248, 2, NULL, NULL),
(249, 249, 2, NULL, NULL),
(250, 250, 2, NULL, NULL),
(251, 251, 2, NULL, NULL),
(252, 252, 2, NULL, NULL),
(253, 253, 2, NULL, NULL),
(254, 254, 2, NULL, NULL),
(255, 255, 2, NULL, NULL),
(256, 256, 2, NULL, NULL),
(257, 257, 2, NULL, NULL),
(258, 258, 2, NULL, NULL),
(259, 259, 2, NULL, NULL),
(260, 260, 2, NULL, NULL),
(261, 261, 2, NULL, NULL),
(262, 262, 2, NULL, NULL),
(263, 263, 2, NULL, NULL),
(264, 264, 2, NULL, NULL),
(265, 265, 2, NULL, NULL),
(266, 266, 2, NULL, NULL),
(267, 267, 2, NULL, NULL),
(268, 268, 2, NULL, NULL),
(269, 269, 2, NULL, NULL),
(270, 270, 2, NULL, NULL),
(271, 271, 2, NULL, NULL),
(272, 272, 2, NULL, NULL),
(273, 273, 2, NULL, NULL),
(274, 274, 2, NULL, NULL),
(275, 275, 2, NULL, NULL),
(276, 276, 2, NULL, NULL),
(277, 277, 2, NULL, NULL),
(278, 278, 2, NULL, NULL),
(279, 279, 2, NULL, NULL),
(280, 280, 2, NULL, NULL),
(281, 281, 2, NULL, NULL),
(282, 282, 2, NULL, NULL),
(283, 283, 2, NULL, NULL),
(284, 284, 2, NULL, NULL),
(285, 285, 2, NULL, NULL),
(286, 286, 2, NULL, NULL),
(287, 287, 2, NULL, NULL),
(288, 288, 2, NULL, NULL),
(289, 289, 2, NULL, NULL),
(290, 290, 2, NULL, NULL),
(291, 291, 2, NULL, NULL),
(292, 292, 2, NULL, NULL),
(293, 293, 2, NULL, NULL),
(294, 294, 2, NULL, NULL),
(295, 295, 2, NULL, NULL),
(296, 296, 2, NULL, NULL),
(297, 297, 2, NULL, NULL),
(298, 298, 2, NULL, NULL),
(299, 299, 2, NULL, NULL),
(300, 300, 2, NULL, NULL),
(301, 301, 2, NULL, NULL),
(302, 302, 2, NULL, NULL),
(303, 303, 2, NULL, NULL),
(304, 304, 2, NULL, NULL),
(305, 305, 2, NULL, NULL),
(306, 306, 2, NULL, NULL),
(307, 307, 2, NULL, NULL),
(308, 308, 2, NULL, NULL),
(309, 309, 2, NULL, NULL),
(310, 310, 2, NULL, NULL),
(311, 311, 2, NULL, NULL),
(312, 312, 2, NULL, NULL),
(313, 313, 2, NULL, NULL),
(314, 314, 2, NULL, NULL),
(315, 315, 2, NULL, NULL),
(316, 316, 2, NULL, NULL),
(317, 317, 2, NULL, NULL),
(318, 318, 2, NULL, NULL),
(319, 319, 2, NULL, NULL),
(320, 320, 2, NULL, NULL),
(321, 321, 2, NULL, NULL),
(322, 322, 2, NULL, NULL),
(323, 323, 2, NULL, NULL),
(324, 324, 2, NULL, NULL),
(325, 325, 2, NULL, NULL),
(326, 326, 2, NULL, NULL),
(327, 327, 2, NULL, NULL),
(328, 328, 2, NULL, NULL),
(329, 329, 2, NULL, NULL),
(330, 330, 2, NULL, NULL),
(331, 331, 2, NULL, NULL),
(332, 332, 2, NULL, NULL),
(333, 333, 2, NULL, NULL),
(334, 334, 2, NULL, NULL),
(335, 335, 2, NULL, NULL),
(336, 336, 2, NULL, NULL),
(337, 337, 2, NULL, NULL),
(338, 338, 2, NULL, NULL),
(339, 339, 2, NULL, NULL),
(340, 340, 2, NULL, NULL),
(341, 341, 2, NULL, NULL),
(342, 342, 2, NULL, NULL),
(343, 343, 2, NULL, NULL),
(344, 344, 2, NULL, NULL),
(345, 345, 2, NULL, NULL),
(346, 346, 2, NULL, NULL),
(347, 347, 2, NULL, NULL),
(348, 348, 2, NULL, NULL),
(349, 349, 2, NULL, NULL),
(350, 350, 2, NULL, NULL),
(351, 351, 2, NULL, NULL),
(352, 352, 2, NULL, NULL),
(353, 353, 2, NULL, NULL),
(354, 354, 2, NULL, NULL),
(355, 355, 2, NULL, NULL),
(356, 356, 2, NULL, NULL),
(357, 357, 2, NULL, NULL),
(358, 358, 2, NULL, NULL),
(359, 359, 2, NULL, NULL),
(360, 360, 2, NULL, NULL),
(361, 361, 2, NULL, NULL),
(362, 362, 2, NULL, NULL),
(363, 363, 2, NULL, NULL),
(364, 364, 2, NULL, NULL),
(365, 365, 2, NULL, NULL),
(366, 366, 2, NULL, NULL),
(367, 367, 2, NULL, NULL),
(368, 368, 2, NULL, NULL),
(369, 369, 2, NULL, NULL),
(370, 370, 2, NULL, NULL),
(371, 371, 2, NULL, NULL),
(372, 372, 2, NULL, NULL),
(373, 373, 2, NULL, NULL),
(374, 374, 2, NULL, NULL),
(375, 375, 2, NULL, NULL),
(376, 376, 2, NULL, NULL),
(377, 377, 2, NULL, NULL),
(378, 378, 2, NULL, NULL),
(379, 379, 2, NULL, NULL),
(380, 380, 2, NULL, NULL),
(381, 381, 2, NULL, NULL),
(382, 382, 2, NULL, NULL),
(383, 383, 2, NULL, NULL),
(384, 384, 2, NULL, NULL),
(385, 385, 2, NULL, NULL),
(386, 386, 2, NULL, NULL),
(387, 387, 2, NULL, NULL),
(388, 388, 2, NULL, NULL),
(389, 389, 2, NULL, NULL),
(390, 390, 2, NULL, NULL),
(391, 391, 2, NULL, NULL),
(392, 392, 2, NULL, NULL),
(393, 393, 2, NULL, NULL),
(394, 394, 2, NULL, NULL),
(395, 395, 2, NULL, NULL),
(396, 396, 2, NULL, NULL),
(397, 397, 2, NULL, NULL),
(398, 398, 2, NULL, NULL),
(399, 399, 2, NULL, NULL),
(400, 400, 2, NULL, NULL),
(401, 401, 2, NULL, NULL),
(402, 402, 2, NULL, NULL),
(403, 403, 2, NULL, NULL),
(404, 404, 2, NULL, NULL),
(405, 405, 2, NULL, NULL),
(406, 406, 2, NULL, NULL),
(407, 407, 2, NULL, NULL),
(408, 408, 2, NULL, NULL),
(409, 409, 2, NULL, NULL),
(410, 410, 2, NULL, NULL),
(411, 411, 2, NULL, NULL),
(412, 412, 2, NULL, NULL),
(413, 413, 2, NULL, NULL),
(414, 414, 2, NULL, NULL),
(415, 415, 2, NULL, NULL),
(416, 416, 2, NULL, NULL),
(417, 417, 2, NULL, NULL),
(418, 418, 2, NULL, NULL),
(419, 419, 2, NULL, NULL),
(420, 420, 2, NULL, NULL),
(421, 421, 2, NULL, NULL),
(422, 422, 2, NULL, NULL),
(423, 423, 2, NULL, NULL),
(424, 424, 2, NULL, NULL),
(425, 425, 2, NULL, NULL),
(426, 426, 2, NULL, NULL),
(427, 427, 2, NULL, NULL),
(428, 428, 2, NULL, NULL),
(429, 429, 2, NULL, NULL),
(430, 430, 2, NULL, NULL),
(431, 431, 2, NULL, NULL),
(432, 432, 2, NULL, NULL),
(433, 433, 2, NULL, NULL),
(434, 434, 2, NULL, NULL),
(435, 435, 2, NULL, NULL),
(436, 436, 2, NULL, NULL),
(437, 437, 2, NULL, NULL),
(438, 438, 2, NULL, NULL),
(439, 439, 2, NULL, NULL),
(440, 440, 2, NULL, NULL),
(441, 441, 2, NULL, NULL),
(442, 442, 2, NULL, NULL),
(443, 443, 2, NULL, NULL),
(444, 444, 2, NULL, NULL),
(445, 445, 2, NULL, NULL),
(446, 446, 2, NULL, NULL),
(447, 447, 2, NULL, NULL),
(448, 448, 2, NULL, NULL),
(449, 449, 2, NULL, NULL),
(450, 450, 2, NULL, NULL),
(451, 451, 2, NULL, NULL),
(452, 452, 2, NULL, NULL),
(453, 453, 2, NULL, NULL),
(454, 454, 2, NULL, NULL),
(455, 455, 2, NULL, NULL),
(456, 456, 2, NULL, NULL),
(457, 457, 2, NULL, NULL),
(458, 458, 2, NULL, NULL),
(459, 459, 2, NULL, NULL),
(460, 460, 2, NULL, NULL),
(461, 461, 2, NULL, NULL),
(462, 462, 2, NULL, NULL),
(463, 463, 2, NULL, NULL),
(464, 464, 2, NULL, NULL),
(465, 465, 2, NULL, NULL),
(466, 466, 2, NULL, NULL),
(467, 467, 2, NULL, NULL),
(468, 468, 2, NULL, NULL),
(469, 469, 2, NULL, NULL),
(470, 470, 2, NULL, NULL),
(471, 471, 2, NULL, NULL),
(472, 472, 2, NULL, NULL),
(473, 473, 2, NULL, NULL),
(474, 474, 2, NULL, NULL),
(475, 475, 2, NULL, NULL),
(476, 476, 2, NULL, NULL),
(477, 477, 2, NULL, NULL),
(478, 478, 2, NULL, NULL),
(479, 479, 2, NULL, NULL),
(480, 480, 2, NULL, NULL),
(481, 481, 2, NULL, NULL),
(482, 482, 2, NULL, NULL),
(483, 483, 2, NULL, NULL),
(484, 484, 2, NULL, NULL),
(485, 485, 2, NULL, NULL),
(486, 486, 2, NULL, NULL),
(487, 487, 2, NULL, NULL),
(488, 488, 2, NULL, NULL),
(489, 489, 2, NULL, NULL),
(490, 490, 2, NULL, NULL),
(491, 491, 2, NULL, NULL),
(492, 492, 2, NULL, NULL),
(493, 493, 2, NULL, NULL),
(494, 494, 2, NULL, NULL),
(495, 495, 2, NULL, NULL),
(496, 496, 2, NULL, NULL),
(497, 497, 2, NULL, NULL),
(498, 498, 2, NULL, NULL),
(499, 499, 2, NULL, NULL),
(500, 500, 2, NULL, NULL),
(501, 501, 2, NULL, NULL),
(502, 502, 2, NULL, NULL),
(503, 503, 2, NULL, NULL),
(504, 504, 2, NULL, NULL),
(505, 505, 2, NULL, NULL),
(506, 506, 2, NULL, NULL),
(507, 507, 2, NULL, NULL),
(508, 508, 2, NULL, NULL),
(509, 509, 2, NULL, NULL),
(510, 510, 2, NULL, NULL),
(511, 511, 2, NULL, NULL),
(512, 512, 2, NULL, NULL),
(513, 513, 2, NULL, NULL),
(514, 514, 2, NULL, NULL),
(515, 515, 2, NULL, NULL),
(516, 516, 2, NULL, NULL),
(517, 517, 2, NULL, NULL),
(518, 518, 2, NULL, NULL),
(519, 519, 2, NULL, NULL),
(520, 520, 2, NULL, NULL),
(521, 521, 2, NULL, NULL),
(522, 522, 2, NULL, NULL),
(523, 523, 2, NULL, NULL),
(524, 524, 2, NULL, NULL),
(525, 525, 2, NULL, NULL),
(526, 526, 2, NULL, NULL),
(527, 527, 2, NULL, NULL),
(528, 528, 2, NULL, NULL),
(529, 529, 2, NULL, NULL),
(530, 530, 2, NULL, NULL),
(531, 531, 2, NULL, NULL),
(532, 532, 2, NULL, NULL),
(533, 533, 2, NULL, NULL),
(534, 534, 2, NULL, NULL),
(535, 535, 2, NULL, NULL),
(536, 536, 2, NULL, NULL),
(537, 537, 2, NULL, NULL),
(538, 538, 2, NULL, NULL),
(539, 539, 2, NULL, NULL),
(540, 540, 2, NULL, NULL),
(541, 541, 2, NULL, NULL),
(542, 542, 2, NULL, NULL),
(543, 543, 2, NULL, NULL),
(544, 544, 2, NULL, NULL),
(545, 545, 2, NULL, NULL),
(546, 546, 2, NULL, NULL),
(547, 547, 2, NULL, NULL),
(548, 548, 2, NULL, NULL),
(549, 549, 2, NULL, NULL),
(550, 550, 2, NULL, NULL),
(551, 551, 2, NULL, NULL),
(552, 552, 2, NULL, NULL),
(553, 553, 2, NULL, NULL),
(554, 554, 2, NULL, NULL),
(555, 555, 2, NULL, NULL),
(556, 556, 2, NULL, NULL),
(557, 557, 2, NULL, NULL),
(558, 558, 2, NULL, NULL),
(559, 559, 2, NULL, NULL),
(560, 560, 2, NULL, NULL),
(561, 561, 2, NULL, NULL),
(562, 562, 2, NULL, NULL),
(563, 563, 2, NULL, NULL),
(564, 564, 2, NULL, NULL),
(565, 565, 2, NULL, NULL),
(566, 566, 2, NULL, NULL),
(567, 567, 2, NULL, NULL),
(568, 568, 2, NULL, NULL),
(569, 569, 2, NULL, NULL),
(570, 570, 2, NULL, NULL),
(571, 571, 2, NULL, NULL),
(572, 572, 2, NULL, NULL),
(573, 573, 2, NULL, NULL),
(574, 574, 2, NULL, NULL),
(575, 575, 2, NULL, NULL),
(576, 576, 2, NULL, NULL),
(577, 577, 2, NULL, NULL),
(578, 578, 2, NULL, NULL),
(579, 579, 2, NULL, NULL),
(580, 580, 2, NULL, NULL),
(581, 581, 2, NULL, NULL),
(582, 582, 2, NULL, NULL),
(583, 583, 2, NULL, NULL),
(584, 584, 2, NULL, NULL),
(585, 585, 2, NULL, NULL),
(586, 586, 2, NULL, NULL),
(587, 587, 2, NULL, NULL),
(588, 588, 2, NULL, NULL),
(589, 589, 2, NULL, NULL),
(590, 590, 2, NULL, NULL),
(591, 591, 2, NULL, NULL),
(592, 592, 2, NULL, NULL),
(593, 593, 2, NULL, NULL),
(594, 594, 2, NULL, NULL),
(595, 595, 2, NULL, NULL),
(596, 596, 2, NULL, NULL),
(597, 597, 2, NULL, NULL),
(598, 598, 2, NULL, NULL),
(599, 599, 2, NULL, NULL),
(600, 600, 2, NULL, NULL),
(601, 601, 2, NULL, NULL),
(602, 602, 2, NULL, NULL),
(603, 603, 2, NULL, NULL),
(604, 604, 2, NULL, NULL),
(605, 605, 2, NULL, NULL),
(606, 606, 2, NULL, NULL),
(607, 607, 2, NULL, NULL),
(608, 608, 2, NULL, NULL),
(609, 609, 2, NULL, NULL),
(610, 610, 2, NULL, NULL),
(611, 611, 2, NULL, NULL),
(612, 612, 2, NULL, NULL),
(613, 613, 2, NULL, NULL),
(614, 614, 2, NULL, NULL),
(615, 615, 2, NULL, NULL),
(616, 616, 2, NULL, NULL),
(617, 617, 2, NULL, NULL),
(618, 618, 2, NULL, NULL),
(619, 619, 2, NULL, NULL),
(620, 620, 2, NULL, NULL),
(621, 621, 2, NULL, NULL),
(622, 622, 2, NULL, NULL),
(623, 623, 2, NULL, NULL),
(624, 624, 2, NULL, NULL),
(625, 625, 2, NULL, NULL),
(626, 626, 2, NULL, NULL),
(627, 627, 2, NULL, NULL),
(628, 628, 2, NULL, NULL),
(629, 629, 2, NULL, NULL),
(630, 630, 2, NULL, NULL),
(631, 631, 2, NULL, NULL),
(632, 632, 2, NULL, NULL),
(633, 633, 2, NULL, NULL),
(634, 634, 2, NULL, NULL),
(635, 635, 2, NULL, NULL),
(636, 636, 2, NULL, NULL),
(637, 637, 2, NULL, NULL),
(638, 638, 2, NULL, NULL),
(639, 639, 2, NULL, NULL),
(640, 640, 2, NULL, NULL),
(641, 641, 2, NULL, NULL),
(642, 642, 2, NULL, NULL),
(643, 643, 2, NULL, NULL),
(644, 644, 2, NULL, NULL),
(645, 645, 2, NULL, NULL),
(646, 646, 2, NULL, NULL),
(647, 647, 2, NULL, NULL),
(648, 648, 2, NULL, NULL),
(649, 649, 2, NULL, NULL),
(650, 650, 2, NULL, NULL),
(651, 651, 2, NULL, NULL),
(652, 652, 2, NULL, NULL),
(653, 653, 2, NULL, NULL),
(654, 654, 2, NULL, NULL),
(655, 655, 2, NULL, NULL),
(656, 656, 2, NULL, NULL),
(657, 657, 2, NULL, NULL),
(658, 658, 2, NULL, NULL),
(659, 659, 2, NULL, NULL),
(660, 660, 2, NULL, NULL),
(661, 661, 2, NULL, NULL),
(662, 662, 2, NULL, NULL),
(663, 663, 2, NULL, NULL),
(664, 664, 2, NULL, NULL),
(665, 665, 2, NULL, NULL),
(666, 666, 2, NULL, NULL),
(667, 667, 2, NULL, NULL),
(668, 668, 2, NULL, NULL),
(669, 669, 2, NULL, NULL),
(670, 670, 2, NULL, NULL),
(671, 671, 2, NULL, NULL),
(672, 672, 2, NULL, NULL),
(673, 673, 2, NULL, NULL),
(674, 674, 2, NULL, NULL),
(675, 675, 2, NULL, NULL),
(676, 676, 2, NULL, NULL),
(677, 677, 2, NULL, NULL),
(678, 678, 2, NULL, NULL),
(679, 679, 2, NULL, NULL),
(680, 680, 2, NULL, NULL),
(681, 681, 2, NULL, NULL),
(682, 682, 2, NULL, NULL),
(683, 683, 2, NULL, NULL),
(684, 684, 2, NULL, NULL),
(685, 685, 2, NULL, NULL),
(686, 686, 2, NULL, NULL),
(687, 687, 2, NULL, NULL),
(688, 688, 2, NULL, NULL),
(689, 689, 2, NULL, NULL),
(690, 690, 2, NULL, NULL),
(691, 691, 2, NULL, NULL),
(692, 692, 2, NULL, NULL),
(693, 693, 2, NULL, NULL),
(694, 694, 2, NULL, NULL),
(695, 695, 2, NULL, NULL),
(696, 696, 2, NULL, NULL),
(697, 697, 2, NULL, NULL),
(698, 698, 2, NULL, NULL),
(699, 699, 2, NULL, NULL),
(700, 700, 2, NULL, NULL),
(701, 701, 2, NULL, NULL),
(702, 702, 2, NULL, NULL),
(703, 703, 2, NULL, NULL),
(704, 704, 2, NULL, NULL),
(705, 705, 2, NULL, NULL),
(706, 706, 2, NULL, NULL),
(707, 707, 2, NULL, NULL),
(708, 708, 2, NULL, NULL),
(709, 709, 2, NULL, NULL),
(710, 710, 2, NULL, NULL),
(711, 711, 2, NULL, NULL),
(712, 712, 2, NULL, NULL),
(713, 713, 2, NULL, NULL),
(714, 714, 2, NULL, NULL),
(715, 715, 2, NULL, NULL),
(716, 716, 2, NULL, NULL),
(717, 717, 2, NULL, NULL),
(718, 718, 2, NULL, NULL),
(719, 719, 2, NULL, NULL),
(720, 720, 2, NULL, NULL),
(721, 721, 2, NULL, NULL),
(722, 722, 2, NULL, NULL),
(723, 723, 2, NULL, NULL),
(724, 724, 2, NULL, NULL),
(725, 725, 2, NULL, NULL),
(726, 726, 2, NULL, NULL),
(727, 727, 2, NULL, NULL),
(728, 728, 2, NULL, NULL),
(729, 729, 2, NULL, NULL),
(730, 730, 2, NULL, NULL),
(731, 731, 2, NULL, NULL),
(732, 732, 2, NULL, NULL),
(733, 733, 2, NULL, NULL),
(734, 734, 2, NULL, NULL),
(735, 735, 2, NULL, NULL),
(736, 736, 2, NULL, NULL),
(737, 737, 2, NULL, NULL),
(738, 738, 2, NULL, NULL),
(739, 739, 2, NULL, NULL),
(740, 740, 2, NULL, NULL),
(741, 741, 2, NULL, NULL),
(742, 742, 2, NULL, NULL),
(743, 743, 2, NULL, NULL),
(744, 744, 2, NULL, NULL),
(745, 745, 2, NULL, NULL),
(746, 746, 2, NULL, NULL),
(747, 747, 2, NULL, NULL),
(748, 748, 2, NULL, NULL),
(749, 749, 2, NULL, NULL),
(750, 750, 2, NULL, NULL),
(751, 751, 2, NULL, NULL),
(752, 752, 2, NULL, NULL),
(753, 753, 2, NULL, NULL),
(754, 754, 2, NULL, NULL),
(755, 755, 2, NULL, NULL),
(756, 756, 2, NULL, NULL),
(757, 757, 2, NULL, NULL),
(758, 758, 2, NULL, NULL),
(759, 759, 2, NULL, NULL),
(760, 760, 2, NULL, NULL),
(761, 761, 2, NULL, NULL),
(762, 762, 2, NULL, NULL),
(763, 763, 2, NULL, NULL),
(764, 764, 2, NULL, NULL),
(765, 765, 2, NULL, NULL),
(766, 766, 2, NULL, NULL),
(767, 767, 2, NULL, NULL),
(768, 768, 2, NULL, NULL),
(769, 769, 2, NULL, NULL),
(770, 770, 2, NULL, NULL),
(771, 771, 2, NULL, NULL),
(772, 772, 2, NULL, NULL),
(773, 773, 2, NULL, NULL),
(774, 774, 2, NULL, NULL),
(775, 775, 2, NULL, NULL),
(776, 776, 2, NULL, NULL),
(777, 777, 2, NULL, NULL),
(778, 778, 2, NULL, NULL),
(779, 779, 2, NULL, NULL),
(780, 780, 2, NULL, NULL),
(781, 781, 2, NULL, NULL),
(782, 782, 2, NULL, NULL),
(783, 783, 2, NULL, NULL),
(784, 784, 2, NULL, NULL),
(785, 785, 2, NULL, NULL),
(786, 786, 2, NULL, NULL),
(787, 787, 2, NULL, NULL),
(788, 788, 2, NULL, NULL),
(789, 789, 2, NULL, NULL),
(790, 790, 2, NULL, NULL),
(791, 791, 2, NULL, NULL),
(792, 792, 2, NULL, NULL),
(793, 793, 2, NULL, NULL),
(794, 794, 2, NULL, NULL),
(795, 795, 2, NULL, NULL),
(796, 796, 2, NULL, NULL),
(797, 797, 2, NULL, NULL),
(798, 798, 2, NULL, NULL),
(799, 799, 2, NULL, NULL),
(800, 800, 2, NULL, NULL),
(801, 801, 2, NULL, NULL),
(802, 802, 2, NULL, NULL),
(803, 803, 2, NULL, NULL),
(804, 804, 2, NULL, NULL),
(805, 805, 2, NULL, NULL),
(806, 806, 2, NULL, NULL),
(807, 807, 2, NULL, NULL),
(808, 808, 2, NULL, NULL),
(809, 809, 2, NULL, NULL),
(810, 810, 2, NULL, NULL),
(811, 811, 2, NULL, NULL),
(812, 812, 2, NULL, NULL),
(813, 813, 2, NULL, NULL),
(814, 814, 2, NULL, NULL),
(815, 815, 2, NULL, NULL),
(816, 816, 2, NULL, NULL),
(817, 817, 2, NULL, NULL),
(818, 818, 2, NULL, NULL),
(819, 819, 2, NULL, NULL),
(820, 820, 2, NULL, NULL),
(821, 821, 2, NULL, NULL),
(822, 822, 2, NULL, NULL),
(823, 823, 2, NULL, NULL),
(824, 824, 2, NULL, NULL),
(825, 825, 2, NULL, NULL),
(826, 826, 2, NULL, NULL),
(827, 827, 2, NULL, NULL),
(828, 828, 2, NULL, NULL),
(829, 829, 2, NULL, NULL),
(830, 830, 2, NULL, NULL),
(831, 831, 2, NULL, NULL),
(832, 832, 2, NULL, NULL),
(833, 833, 2, NULL, NULL),
(834, 834, 2, NULL, NULL),
(835, 835, 2, NULL, NULL),
(836, 836, 2, NULL, NULL),
(837, 837, 2, NULL, NULL),
(838, 838, 2, NULL, NULL),
(839, 839, 2, NULL, NULL),
(840, 840, 2, NULL, NULL),
(841, 841, 2, NULL, NULL),
(842, 842, 2, NULL, NULL),
(843, 843, 2, NULL, NULL),
(844, 844, 2, NULL, NULL),
(845, 845, 2, NULL, NULL),
(846, 846, 2, NULL, NULL),
(847, 847, 2, NULL, NULL),
(848, 848, 2, NULL, NULL),
(849, 849, 2, NULL, NULL),
(850, 850, 2, NULL, NULL),
(851, 851, 2, NULL, NULL),
(852, 852, 2, NULL, NULL),
(853, 853, 2, NULL, NULL),
(854, 854, 2, NULL, NULL),
(855, 855, 2, NULL, NULL),
(856, 856, 2, NULL, NULL),
(857, 857, 2, NULL, NULL),
(858, 858, 2, NULL, NULL),
(859, 859, 2, NULL, NULL),
(860, 860, 2, NULL, NULL),
(861, 861, 2, NULL, NULL),
(862, 862, 2, NULL, NULL),
(863, 863, 2, NULL, NULL),
(864, 864, 2, NULL, NULL),
(865, 865, 2, NULL, NULL),
(866, 866, 2, NULL, NULL),
(867, 867, 2, NULL, NULL),
(868, 868, 2, NULL, NULL),
(869, 869, 2, NULL, NULL),
(870, 870, 2, NULL, NULL),
(871, 871, 2, NULL, NULL),
(872, 872, 2, NULL, NULL),
(873, 873, 2, NULL, NULL),
(874, 874, 2, NULL, NULL),
(875, 875, 2, NULL, NULL),
(876, 876, 2, NULL, NULL),
(877, 877, 2, NULL, NULL),
(878, 878, 2, NULL, NULL),
(879, 879, 2, NULL, NULL),
(880, 880, 2, NULL, NULL),
(881, 881, 2, NULL, NULL),
(882, 882, 2, NULL, NULL),
(883, 883, 2, NULL, NULL),
(884, 884, 2, NULL, NULL),
(885, 885, 2, NULL, NULL),
(886, 886, 2, NULL, NULL),
(887, 887, 2, NULL, NULL),
(888, 888, 2, NULL, NULL),
(889, 889, 2, NULL, NULL),
(890, 890, 2, NULL, NULL),
(891, 891, 2, NULL, NULL),
(892, 892, 2, NULL, NULL),
(893, 893, 2, NULL, NULL),
(894, 894, 2, NULL, NULL),
(895, 895, 2, NULL, NULL),
(896, 896, 2, NULL, NULL),
(897, 897, 2, NULL, NULL),
(898, 898, 2, NULL, NULL),
(899, 899, 2, NULL, NULL),
(900, 900, 2, NULL, NULL),
(901, 901, 2, NULL, NULL),
(902, 902, 2, NULL, NULL),
(903, 903, 2, NULL, NULL),
(904, 904, 2, NULL, NULL),
(905, 905, 2, NULL, NULL),
(906, 906, 2, NULL, NULL),
(907, 907, 2, NULL, NULL),
(908, 908, 2, NULL, NULL),
(909, 909, 2, NULL, NULL),
(910, 910, 2, NULL, NULL),
(911, 911, 2, NULL, NULL),
(912, 912, 2, NULL, NULL),
(913, 913, 2, NULL, NULL),
(914, 914, 2, NULL, NULL),
(915, 915, 2, NULL, NULL),
(916, 916, 2, NULL, NULL),
(917, 917, 2, NULL, NULL),
(918, 918, 2, NULL, NULL),
(919, 919, 2, NULL, NULL),
(920, 920, 2, NULL, NULL),
(921, 921, 2, NULL, NULL),
(922, 922, 2, NULL, NULL),
(923, 923, 2, NULL, NULL),
(924, 924, 2, NULL, NULL),
(925, 925, 2, NULL, NULL),
(926, 926, 2, NULL, NULL),
(927, 927, 2, NULL, NULL),
(928, 928, 2, NULL, NULL),
(929, 929, 2, NULL, NULL),
(930, 930, 2, NULL, NULL),
(931, 931, 2, NULL, NULL),
(932, 932, 2, NULL, NULL),
(933, 933, 2, NULL, NULL),
(934, 934, 2, NULL, NULL),
(935, 935, 2, NULL, NULL),
(936, 936, 2, NULL, NULL),
(937, 937, 2, NULL, NULL),
(938, 938, 2, NULL, NULL),
(939, 939, 2, NULL, NULL),
(940, 940, 2, NULL, NULL),
(941, 941, 2, NULL, NULL),
(942, 942, 2, NULL, NULL),
(943, 943, 2, NULL, NULL),
(944, 944, 2, NULL, NULL),
(945, 945, 2, NULL, NULL),
(946, 946, 2, NULL, NULL),
(947, 947, 2, NULL, NULL),
(948, 948, 2, NULL, NULL),
(949, 949, 2, NULL, NULL),
(950, 950, 2, NULL, NULL),
(951, 951, 2, NULL, NULL),
(952, 952, 2, NULL, NULL),
(953, 953, 2, NULL, NULL),
(954, 954, 2, NULL, NULL),
(955, 955, 2, NULL, NULL),
(956, 956, 2, NULL, NULL),
(957, 957, 2, NULL, NULL),
(958, 958, 2, NULL, NULL),
(959, 959, 2, NULL, NULL),
(960, 960, 2, NULL, NULL),
(961, 961, 2, NULL, NULL),
(962, 962, 2, NULL, NULL),
(963, 963, 2, NULL, NULL),
(964, 964, 2, NULL, NULL),
(965, 965, 2, NULL, NULL),
(966, 966, 2, NULL, NULL),
(967, 967, 2, NULL, NULL),
(968, 968, 2, NULL, NULL),
(969, 969, 2, NULL, NULL),
(970, 970, 2, NULL, NULL),
(971, 971, 2, NULL, NULL),
(972, 972, 2, NULL, NULL),
(973, 973, 2, NULL, NULL),
(974, 974, 2, NULL, NULL),
(975, 975, 2, NULL, NULL),
(976, 976, 2, NULL, NULL),
(977, 977, 2, NULL, NULL),
(978, 978, 2, NULL, NULL),
(979, 979, 2, NULL, NULL),
(980, 980, 2, NULL, NULL),
(981, 981, 2, NULL, NULL),
(982, 982, 2, NULL, NULL),
(983, 983, 2, NULL, NULL),
(984, 984, 2, NULL, NULL),
(985, 985, 2, NULL, NULL),
(986, 986, 2, NULL, NULL),
(987, 987, 2, NULL, NULL),
(988, 988, 2, NULL, NULL),
(989, 989, 2, NULL, NULL),
(990, 990, 2, NULL, NULL),
(991, 991, 2, NULL, NULL),
(992, 992, 2, NULL, NULL),
(993, 993, 2, NULL, NULL),
(994, 994, 2, NULL, NULL),
(995, 995, 2, NULL, NULL),
(996, 996, 2, NULL, NULL),
(997, 997, 2, NULL, NULL),
(998, 998, 2, NULL, NULL),
(999, 999, 2, NULL, NULL),
(1000, 1000, 2, NULL, NULL),
(1001, 1001, 2, NULL, NULL),
(1002, 1002, 2, NULL, NULL),
(1003, 1003, 2, NULL, NULL),
(1004, 1004, 2, NULL, NULL),
(1005, 1005, 2, NULL, NULL),
(1006, 1006, 2, NULL, NULL),
(1007, 1007, 2, NULL, NULL),
(1008, 1008, 2, NULL, NULL),
(1009, 1009, 2, NULL, NULL),
(1010, 1010, 2, NULL, NULL),
(1011, 1011, 2, NULL, NULL),
(1012, 1012, 2, NULL, NULL),
(1013, 1013, 2, NULL, NULL),
(1014, 1014, 2, NULL, NULL),
(1015, 1015, 2, NULL, NULL),
(1016, 1016, 2, NULL, NULL),
(1017, 1017, 2, NULL, NULL),
(1018, 1018, 2, NULL, NULL),
(1019, 1019, 2, NULL, NULL),
(1020, 1020, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int(11) NOT NULL,
  `expire_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `name`, `slug`, `image`, `serial`, `expire_date`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Promotion Offer', 'Promotion-Offer', 'images/promotion/1635412342slider11.jpg', 1, NULL, 1, '2021-10-28 09:12:23', '2021-10-28 09:12:23'),
(7, 'Promotion Offer u', 'Promotion-Offer-u', 'images/promotion/1635412498slider10.jpg', 2, NULL, 1, '2021-10-28 09:14:58', '2021-11-30 12:32:57'),
(8, 'Promotion Offer', 'Promotion-Offer', 'images/promotion/1635445565slider9.jpg', 3, NULL, 1, '2021-10-28 18:26:05', '2021-10-28 18:26:05'),
(9, 'Patient Two', 'Patient-Two', 'images/promotion/1635445579slider10.jpg', 4, NULL, 1, '2021-10-28 18:26:19', '2021-10-28 18:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_products`
--

CREATE TABLE `promotion_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `discount_price` double(8,2) NOT NULL,
  `status` int(191) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_products`
--

INSERT INTO `promotion_products` (`id`, `promotion_id`, `product_id`, `unit_price`, `discount_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 23, 70.00, 50.00, 1, '2021-10-31 08:36:33', '2021-11-18 06:30:08'),
(2, 6, 15, 130.00, 100.00, 0, '2021-11-01 04:26:21', '2021-11-18 06:30:05'),
(3, 7, 21, 270.00, 200.00, 1, '2021-11-01 09:32:49', '2021-11-30 12:32:56'),
(4, 7, 27, 570.00, 100.00, 1, '2021-11-01 09:32:58', '2021-11-30 12:32:56'),
(5, 7, 32, 700.00, 300.00, 1, '2021-11-01 09:33:52', '2021-11-30 12:32:56'),
(6, 7, 844, 118200.00, 100.00, 1, '2021-11-16 17:42:58', '2021-11-30 12:32:56'),
(7, 7, 200, 70.00, 50.00, 1, '2021-11-16 17:44:20', '2021-11-30 12:32:56'),
(8, 7, 85, 160.00, 100.00, 1, '2021-11-16 17:45:17', '2021-11-30 12:32:56'),
(9, 7, 312, 36.00, 20.00, 1, '2021-11-16 17:46:02', '2021-11-30 12:32:56'),
(10, 7, 61, 220.00, 100.00, 1, '2021-11-18 08:07:03', '2021-11-30 12:32:57'),
(11, 7, 1019, 150.00, 100.00, 1, '2021-11-18 08:07:17', '2021-11-30 12:32:57'),
(12, 7, 1016, 550.00, 100.00, 1, '2021-11-18 08:07:24', '2021-11-30 12:32:57'),
(13, 7, 39, 280.00, 100.00, 1, '2021-11-18 08:07:34', '2021-11-30 12:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `review`, `created_at`, `updated_at`) VALUES
(1, 1, 71, 2, 'It\'s a nice product. Thanks seller for the best product', '2021-08-19 11:09:32', '2021-08-19 11:09:32'),
(2, 1, 27, 3, 'it\'s real product. thanks', '2021-08-19 12:11:22', '2021-08-19 12:11:22'),
(3, 1, 27, 1, 'its awesome product', '2021-08-19 12:11:59', '2021-08-19 12:11:59'),
(4, 1, 92, 3, 'sdfdsfsdf', '2021-08-26 02:04:44', '2021-08-26 02:04:44'),
(5, 1, 12, 2, 'this product is nice', '2021-08-29 11:06:02', '2021-08-29 11:06:02'),
(6, 1, 71, 3, 'dd', '2021-09-01 00:40:24', '2021-09-01 00:40:24'),
(7, 1, 71, 4, 'check image', '2021-09-01 03:01:37', '2021-09-01 03:01:37'),
(8, 1, 71, 5, 'sdfsdfdsf', '2021-09-01 03:07:31', '2021-09-01 03:07:31'),
(9, 1, 71, 5, 'check image', '2021-09-01 03:26:36', '2021-09-01 03:26:36'),
(10, 1, 71, 5, 'dsfdsfdfsd', '2021-09-01 03:30:19', '2021-09-01 03:30:19'),
(11, 1, 71, 2, 'serertewrtewt', '2021-09-01 03:36:08', '2021-09-01 03:36:08'),
(13, 4, 404, 5, 'Just awesome', '2021-11-06 10:17:04', '2021-11-07 05:46:52'),
(14, 4, 405, 5, 'This originally nice product', '2021-12-15 05:49:40', '2021-12-15 05:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `review_images`
--

CREATE TABLE `review_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `review_images`
--

INSERT INTO `review_images` (`id`, `review_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 10, 'images/review/16304886194bc22387-ed14-4a96-882e-370e688b5863.jpg', '2021-09-01 03:30:19', '2021-09-01 03:30:19'),
(2, 10, 'images/review/16304886191593711159106277650_276505176903652_5525818149765392198_n.jpg', '2021-09-01 03:30:19', '2021-09-01 03:30:19'),
(3, 11, 'images/review/16304889681246280_16061017110043391702.jpg', '2021-09-01 03:36:08', '2021-09-01 03:36:08'),
(4, 11, 'images/review/16304889681597742695_5f3b9e671b2f4-thumb.jpg', '2021-09-01 03:36:08', '2021-09-01 03:36:08'),
(5, 11, 'images/review/1630488968besthotelsites-1.jpg', '2021-09-01 03:36:09', '2021-09-01 03:36:09'),
(18, 13, 'images/review/1636265040slider9.jpg', '2021-11-07 06:04:00', '2021-11-07 06:04:00'),
(22, 13, 'images/review/1636265410slider10.jpg', '2021-11-07 06:10:11', '2021-11-07 06:10:11');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `post_code` int(11) DEFAULT NULL,
  `delivery_charge` double(8,2) NOT NULL DEFAULT '0.00',
  `delivery_time` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `user_id`, `full_name`, `mobile`, `email`, `district`, `city_town`, `address`, `post_code`, `delivery_charge`, `delivery_time`, `created_at`, `updated_at`) VALUES
(2, 4, 'Raju Real', '01889967514', 'raj6u@mail.com', '63', 'Dhaka', 'Mohammadpur, Shamoly, Dhaka', 1207, 90.00, 10, NULL, '2021-11-04 18:19:03'),
(3, 6, 'Raju 3', '01889967516', 'mkraju.bigm@gmail.com', '63', 'Kaunia', 'Shibu(Lichu bagan), Baruahat', 5440, 90.00, 10, NULL, '2021-11-16 17:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(5, 'S', 's', '2021-09-26 08:12:00', '2021-09-26 08:12:00'),
(6, 'M', 'm', '2021-09-26 08:12:11', '2021-09-26 08:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(191) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_offers`
--

CREATE TABLE `special_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount_price` double(8,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_offers`
--

INSERT INTO `special_offers` (`id`, `product_id`, `discount_price`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(4, 16, 100.00, '2021-10-17 00:00:00', '2021-10-29 23:59:59', 1, '2021-10-17 17:07:46', '2021-10-28 18:38:12'),
(5, 13, 40.00, '2021-10-29 00:00:00', '2021-10-29 23:59:59', 1, '2021-10-28 18:43:35', '2021-10-28 18:43:35'),
(6, 888, 1000.00, '2022-01-12 00:00:00', '2022-01-13 23:59:59', 1, '2022-01-12 15:09:41', '2022-01-12 15:09:41');

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
(8, 4, 7, '000007', 'MX-21696319', '61d067b199e82', NULL, '2022-01-01 20:39:45', '125896', 10.00, NULL, 9.75, 'BDT', 'BDT', '10.00', '1.0000', 'SUCCESS', NULL, '22010120404561488746730d79d', 'BKASH-BKash', 'KX9A11P39YTV', 'BGT68792022010191990', NULL, NULL, 'BKash Mobile Banking', 'MOBILEBANKING', 'MB', 'Bangladesh', 'BD', 'mobixpresscombdlive', '66dbc0923309597eb6d766b18e874886', 'amount,bank_tran_id,base_fair,card_brand,card_issuer,card_issuer_country,card_issuer_country_code,card_no,card_sub_brand,card_type,currency,currency_amount,currency_rate,currency_type,error,risk_level,risk_title,status,store_amount,store_id,tran_date,tran_id,val_id,value_a,value_b,value_c,value_d', 'd728906fe8c2e39bb1af2603640ccc5452cf50927611f8a8a9c31fef72cfbd9a', '0.00', '0', 'Safe', 'Raju Real', '01889967514', 'Dhaka', '1207', 'Mohammadpur, Shamoly, Dhaka', NULL, '2022-01-01 14:42:20'),
(9, 4, 6, '000006', 'MX-28968537', '61d07e944c49d', NULL, '2022-01-01 22:17:24', '125896', 20.00, NULL, NULL, 'BDT', NULL, NULL, NULL, 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raju Real', '01889967514', 'Dhaka', '1207', 'Mohammadpur, Shamoly, Dhaka', NULL, NULL),
(10, 4, 5, '000005', 'MX-56205055', '61d6eb01168bf', NULL, '2022-01-06 19:13:37', '125896', 91.00, NULL, NULL, 'BDT', NULL, NULL, NULL, 'FAILED', 'Insufficient balance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raju Real', '01889967514', 'Dhaka', '1207', 'Mohammadpur, Shamoly, Dhaka', NULL, '2022-01-06 13:16:33');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'mkraju.bigm@gmail.com', '2021-08-19 00:11:37', '2021-08-19 00:11:37'),
(2, 'mkraju@mail.com', '2021-08-19 00:12:55', '2021-08-19 00:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(5, 1, 'Wireless Head Phone', 'wireless-head-phone', 'images/subcategory/1625852279giant_127653.jpeg', '2021-06-11 07:36:56', '2021-07-09 11:37:59'),
(6, 3, 'Black cover', 'black-cover', 'images/subcategory/1625852310maxresdefault.jpg', '2021-07-09 11:38:31', '2021-07-09 11:38:31'),
(7, 1, 'Promotion Offer', 'promotion-offer', NULL, '2021-07-20 02:49:31', '2021-07-20 02:49:31'),
(8, 4, 'SMARTPHONE', 'smartphone', 'images/subcategory/1642519445Top-10-Mobile-Brands-in-World-1-1.jpg', '2022-01-18 15:24:05', '2022-01-18 15:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Kg', 'kg', '2021-06-11 10:40:16', '2021-06-11 10:40:16'),
(3, 'Piece', 'piece', '2021-06-11 10:40:49', '2021-06-11 10:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `image`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'মো: মোক্তাদিরুল ইসলাম', 'raj6u@mail.com', '01889967514', 'images/user/1634227178img_avatar.png', 1, NULL, '$2y$10$fzAJHvHpiXhRCSa4wpHJzergQXjeZogQFZJibi8EmIHMXnjgjGVCK', '8C92RS1SPIFcA6BqOHJ1JcAeY5wWRnUGYw9h6osR2Wag5lBXhmZO7xXplQix', '2021-10-05 09:37:11', '2021-11-04 12:39:52'),
(5, 'Raju 2', NULL, '01889967515', NULL, 1, NULL, '$2y$10$/JHfmn0x6eqRxrEZVWYYGOjMYtdS2jZslP/f7EuYrYFnjTo.sfySG', NULL, '2021-11-16 14:32:00', '2021-11-16 14:32:00'),
(6, 'Raju 3', NULL, '01889967516', NULL, 1, NULL, '$2y$10$UL3VcTHcN5K5CtnqOK4p0.LHcAPD2x8uQE0.izih8CNn45c1NX9pG', NULL, '2021-11-16 15:50:44', '2021-11-16 15:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_messages`
--

CREATE TABLE `user_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_messages`
--

INSERT INTO `user_messages` (`id`, `name`, `mobile`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Promotion Offer', '01889967514', NULL, 'Test message', 'i\'m just checking mesas', '2021-08-18 23:14:37', '2021-08-18 23:14:37'),
(2, 'Promotion Offer', '01889967514', NULL, 'dgbd', 'sss', '2021-08-18 23:34:26', '2021-08-18 23:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_products`
--

CREATE TABLE `voucher_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `serial` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voucher_products`
--

INSERT INTO `voucher_products` (`id`, `product_id`, `serial`, `status`, `created_at`, `updated_at`) VALUES
(4, 8, 1, 1, '2021-08-20 04:49:08', '2021-08-20 04:49:08'),
(5, 12, 3, 1, '2021-08-20 04:49:24', '2021-08-20 04:49:24'),
(6, 9, 3, 1, '2021-08-20 04:49:59', '2021-08-20 04:49:59'),
(7, 13, 4, 1, '2021-08-20 04:50:16', '2021-08-20 04:50:16'),
(8, 15, 5, 1, '2021-08-20 04:50:23', '2021-08-20 04:50:23'),
(9, 21, 6, 1, '2021-08-20 04:50:31', '2021-08-20 04:50:31'),
(10, 53, 7, 1, '2021-08-20 04:50:40', '2021-08-20 04:51:58'),
(11, 23, 8, 1, '2021-08-20 04:50:48', '2021-08-20 04:50:48'),
(12, 60, 9, 1, '2021-08-20 04:50:57', '2021-08-20 04:51:45'),
(13, 52, 10, 1, '2021-08-20 04:51:06', '2021-08-20 04:51:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colors_slug_unique` (`slug`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_coupon_code_unique` (`coupon_code`);

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
-- Indexes for table `coupon_user_useds`
--
ALTER TABLE `coupon_user_useds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_valid_users`
--
ALTER TABLE `coupon_valid_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_products`
--
ALTER TABLE `featured_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_categories`
--
ALTER TABLE `front_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_category_products`
--
ALTER TABLE `front_category_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_otps`
--
ALTER TABLE `mobile_otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_arrivals_products`
--
ALTER TABLE `new_arrivals_products`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `products_product_code_unique` (`product_code`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_products`
--
ALTER TABLE `promotion_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_images`
--
ALTER TABLE `review_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sizes_slug_unique` (`slug`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_offers`
--
ALTER TABLE `special_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ssl_commerz_transactions`
--
ALTER TABLE `ssl_commerz_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_categories_slug_unique` (`slug`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `units_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_messages`
--
ALTER TABLE `user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_products`
--
ALTER TABLE `voucher_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupon_groups`
--
ALTER TABLE `coupon_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupon_group_users`
--
ALTER TABLE `coupon_group_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `coupon_user_useds`
--
ALTER TABLE `coupon_user_useds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupon_valid_users`
--
ALTER TABLE `coupon_valid_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `featured_products`
--
ALTER TABLE `featured_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `front_categories`
--
ALTER TABLE `front_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `front_category_products`
--
ALTER TABLE `front_category_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `mobile_otps`
--
ALTER TABLE `mobile_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `new_arrivals_products`
--
ALTER TABLE `new_arrivals_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_prices`
--
ALTER TABLE `order_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1039;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `promotion_products`
--
ALTER TABLE `promotion_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `review_images`
--
ALTER TABLE `review_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `special_offers`
--
ALTER TABLE `special_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ssl_commerz_transactions`
--
ALTER TABLE `ssl_commerz_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_messages`
--
ALTER TABLE `user_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `voucher_products`
--
ALTER TABLE `voucher_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
