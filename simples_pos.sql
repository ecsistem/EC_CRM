-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2024 at 06:24 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simples_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'G01', 'General', 'no_image.png'),
(3, '001', 'Cimentos', 'no_image.png');

-- --------------------------------------------------------

--
-- Table structure for table `tec_combo_items`
--

CREATE TABLE `tec_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_customers`
--

CREATE TABLE `tec_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `store_id`) VALUES
(1, 'Cliente Padrão', '', '', '0000-0000', 'cliente@edsoncosta.tech', NULL),
(3, 'teste', '', '', '919000000', 'teste@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_gift_cards`
--

INSERT INTO `tec_gift_cards` (`id`, `date`, `card_no`, `value`, `customer_id`, `balance`, `expiry`, `created_by`, `store_id`) VALUES
(1, '2023-02-14 00:52:56', '2748 1315 1611 1139', '100.0000', NULL, '100.0000', '2023-02-01', 1, NULL),
(2, '2023-02-14 20:12:19', '6331 3793 8552 6760', '80.0000', NULL, '80.0000', '2023-03-01', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`, `store_id`) VALUES
(17, '2023-01-12 23:06:27', 17, 1, NULL, 'cash', '', '', '', '', '', '', '31.5000', NULL, 1, NULL, '', '100.0000', '68.5000', '', NULL, NULL, NULL, 1),
(18, '2023-01-12 23:09:36', 18, 1, NULL, 'cash', '', '', '', '', '', '', '21.0000', NULL, 1, NULL, '', '100.0000', '79.0000', '', NULL, NULL, NULL, 1),
(19, '2023-01-12 23:10:06', 19, 3, NULL, 'cash', '', '', '', '', '', '', '10.5000', NULL, 1, NULL, '', '10.5000', '0.0000', '', NULL, NULL, NULL, 1),
(21, '2023-01-12 23:17:00', 21, 1, NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '100.0000', NULL, 1, NULL, '', '100.0000', '89.5000', NULL, '', 1, '2023-01-12 23:18:13', 1),
(22, '2023-01-12 23:20:13', 22, 1, NULL, 'cash', '', '', '', '', '', '', '10.5000', NULL, 1, NULL, '', '100.0000', '89.5000', '', NULL, NULL, NULL, 1),
(23, '2023-01-12 23:28:37', 23, 1, NULL, 'cash', '', '', '', '', '', '', '10.5000', NULL, 2, NULL, '', '50.0000', '39.5000', '', NULL, NULL, NULL, 1),
(25, '2023-02-13 23:15:24', 25, 1, NULL, 'cash', '', '', '', '', '', '', '31.5000', NULL, 1, NULL, '', '100.0000', '68.5000', '', NULL, NULL, NULL, 1),
(26, '2023-02-13 23:36:45', 26, 1, NULL, 'cash', '', '', '', '', '', '', '16.0000', NULL, 1, NULL, '', '16.0000', '0.0000', '', NULL, NULL, NULL, 1),
(27, '2023-02-13 23:50:11', 27, 1, NULL, 'cash', '', '', '', '', '', '', '16.0000', NULL, 1, NULL, '', '16.0000', '0.0000', '', NULL, NULL, NULL, 1),
(28, '2023-02-13 23:53:54', 28, 1, NULL, 'cash', '', '', '', '', '', '', '16.0000', NULL, 1, NULL, '', '20.0000', '4.0000', '', NULL, NULL, NULL, 1),
(29, '2023-02-14 17:43:54', 29, 1, NULL, 'cash', '', '', '', '', '', '', '15.0000', NULL, 1, NULL, '', '15.0000', '0.0000', '', NULL, NULL, NULL, 1),
(30, '2023-02-14 17:45:33', 30, 1, NULL, 'cash', '', '', '', '', '', '', '10.5000', NULL, 1, NULL, '', '10.5000', '0.0000', '', NULL, NULL, NULL, 1),
(31, '2023-02-14 20:08:20', 31, 1, NULL, 'cash', '', '', '', '', '', '', '26.5000', NULL, 1, NULL, '', '50.0000', '23.5000', '', NULL, NULL, NULL, 1),
(32, '2023-07-26 20:36:38', 32, 1, NULL, 'cash', '', '', '', '', '', '', '16.0000', NULL, 1, NULL, '', '20.0000', '4.0000', '', NULL, NULL, NULL, 1),
(33, '2024-01-24 02:27:06', 33, 1, NULL, 'cash', '', '', '', '', '', '', '52.5000', NULL, 1, NULL, '', '100.0000', '47.5000', '', NULL, NULL, NULL, 1),
(34, '2024-01-24 02:34:41', 34, 1, NULL, 'cash', '', '', '', '', '', '', '25.0000', NULL, 1, NULL, '', '30.0000', '5.0000', '', NULL, NULL, NULL, 1),
(35, '2024-01-24 02:37:32', 35, 1, NULL, 'cash', '', '', '', '', '', '', '25.0000', NULL, 1, NULL, '', '25.0000', '0.0000', '', NULL, NULL, NULL, 1),
(36, '2024-01-24 02:38:00', 36, 1, NULL, 'cash', '', '', '', '', '', '', '25.0000', NULL, 1, NULL, '', '25.0000', '0.0000', '', NULL, NULL, NULL, 1),
(37, '2024-01-24 02:55:57', 37, 3, NULL, 'cash', '', '', '', '', '', '', '75.0000', NULL, 1, NULL, '', '75.0000', '0.0000', '', NULL, NULL, NULL, 1),
(38, '2024-01-24 02:59:05', 38, 1, NULL, 'cash', '', '', '', '', '', '', '85.0000', NULL, 2, NULL, '', '100.0000', '15.0000', '', NULL, NULL, NULL, 1),
(39, '2024-01-24 03:22:32', 39, 1, NULL, 'cash', '', '', '', '', '', '', '20.0000', NULL, 2, NULL, '', '20.0000', '0.0000', '', NULL, NULL, NULL, 1),
(40, '2024-01-24 03:27:21', 40, 1, NULL, 'cash', '', '', '', '', '', '', '10.0000', NULL, 2, NULL, '', '10.0000', '0.0000', '', NULL, NULL, NULL, 1),
(41, '2024-01-24 03:29:53', 41, 1, NULL, 'cash', '', '', '', '', '', '', '10.0000', NULL, 2, NULL, '', '10.0000', '0.0000', '', NULL, NULL, NULL, 1),
(42, '2024-01-24 03:40:02', 42, 1, NULL, 'cash', '', '', '', '', '', '', '95.0000', NULL, 2, NULL, '', '200.0000', '105.0000', '', NULL, NULL, NULL, 1),
(43, '2024-01-24 04:02:08', 43, 1, NULL, 'cash', '', '', '', '', '', '', '10.0000', NULL, 2, NULL, '', '10.0000', '0.0000', '', NULL, NULL, NULL, 1),
(44, '2024-01-24 04:11:48', 44, 1, NULL, 'cash', '', '', '', '', '', '', '85.0000', NULL, 2, NULL, '', '200.0000', '115.0000', '', NULL, NULL, NULL, 1),
(45, '2024-01-24 12:04:45', 45, 1, NULL, 'cash', '', '', '', '', '', '', '2.5000', NULL, 1, NULL, '', '5.0000', '2.5000', '', NULL, NULL, NULL, 1),
(46, '2024-02-08 23:09:29', 46, 1, NULL, 'cash', '', '', '', '', '', '', '50.0000', NULL, 1, NULL, '', '200.0000', '150.0000', '', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_printers`
--

CREATE TABLE `tec_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_products`
--

CREATE TABLE `tec_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `price` decimal(25,4) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 1,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text DEFAULT NULL,
  `alert_quantity` decimal(10,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`) VALUES
(1, '010110101010101', 'teste', 1, '10.0000', 'no_image.png', '0', '5.0000', 0, '0.0000', 'code128', 'standard', '', '4.0000'),
(2, '240920222022', 'IDF em Vegas', 2, '20.0000', 'no_image.png', '0', '10.0000', 0, '0.0000', 'code128', 'standard', '', '50.0000'),
(4, '11111111', 'Cimento CP II F 32 Todas as Obras 50kg Votoran', 3, '50.0000', 'e3cb59875727d3ed245883fd9de156ce.jpg', '0', '25.0000', 0, '0.0000', 'code128', 'standard', '', '15.0000'),
(5, '222222222', 'Cimento CP II F 32 Todas as Obras 25kg Votoran', 3, '25.0000', 'daee8ddbda0781aa157777ce05f291a1.jpg', '0', '10.0000', 0, '0.0000', 'code128', 'standard', '', '8.0000'),
(6, '7898543595663', 'Fita Veda Rosca', 1, '2.5000', 'no_image.png', '0', '1.0000', 0, '0.0000', 'code128', 'standard', '', '10.0000');

-- --------------------------------------------------------

--
-- Table structure for table `tec_product_store_qty`
--

CREATE TABLE `tec_product_store_qty` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_product_store_qty`
--

INSERT INTO `tec_product_store_qty` (`id`, `product_id`, `store_id`, `quantity`, `price`) VALUES
(1, 1, 1, '71.0000', '10.0000'),
(2, 2, 1, '68.0000', '20.0000'),
(3, 3, 1, '42.0000', '15.0000'),
(4, 4, 1, '24.0000', '50.0000'),
(5, 5, 1, '23.0000', '25.0000'),
(6, 6, 1, '49.0000', '2.5000');

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_purchases`
--

INSERT INTO `tec_purchases` (`id`, `reference`, `date`, `note`, `total`, `attachment`, `supplier_id`, `received`, `created_by`, `store_id`) VALUES
(1, '', '2024-01-24 02:49:00', '', '200.0000', NULL, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchase_items`
--

CREATE TABLE `tec_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_purchase_items`
--

INSERT INTO `tec_purchase_items` (`id`, `purchase_id`, `product_id`, `quantity`, `cost`, `subtotal`) VALUES
(1, 1, 5, '20.0000', '10.0000', '200.0000');

-- --------------------------------------------------------

--
-- Table structure for table `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `store_id`) VALUES
(1, '2019-03-19 18:19:22', 1, '200.0000', 'close', '221.0000', 0, 0, '221.0000', 0, 0, '', '2022-06-17 20:40:19', NULL, 1, 1),
(2, '2022-06-17 20:41:29', 1, '0.0000', 'close', '524.5000', 0, 0, '524.5000', 0, 0, '', '2022-09-24 23:47:24', NULL, 1, 1),
(3, '2022-09-24 23:47:34', 1, '100.0000', 'close', '225.5000', 0, 0, '225.5000', 0, 10, '', '2023-01-12 22:53:46', NULL, 1, 1),
(4, '2022-09-25 15:29:28', 2, '100.0000', 'close', '100.0000', 0, 0, '100.0000', 0, 0, '', '2022-09-25 15:32:28', NULL, 2, 1),
(5, '2022-09-26 13:28:48', 2, '100.0000', 'close', '110.5000', 0, 0, '110.5000', 0, 0, '', '2023-01-12 23:30:00', NULL, 2, 1),
(6, '2023-01-12 23:06:07', 1, '50.0000', 'close', '113.0000', 0, 0, '110.0000', 0, 0, '', '2023-01-12 23:12:13', NULL, 1, 1),
(7, '2023-01-12 23:13:09', 1, '10.0000', 'close', '395.5000', 0, 0, '200.0000', 0, 0, '', '2024-01-24 02:41:44', NULL, 1, 1),
(8, '2024-01-24 02:43:47', 1, '200.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(9, '2024-01-24 02:58:10', 2, '10.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_sales`
--

CREATE TABLE `tec_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(10,4) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`, `store_id`, `hold_ref`) VALUES
(17, '2023-01-12 20:06:27', 1, 'Cliente Padrão', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '1.5000', '1.5000', '31.5000', 1, '3.0000', '31.5000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(18, '2023-01-12 20:09:36', 1, 'Cliente Padrão', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '1.0000', '1.0000', '21.0000', 1, '1.0000', '21.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(19, '2023-01-12 20:10:06', 3, 'teste', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '0.5000', '0.5000', '10.5000', 1, '1.0000', '10.5000', 1, NULL, NULL, '', 'paid', '0.0000', 1, '10101010'),
(21, '2023-01-12 20:17:15', 1, 'Cliente Padrão', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '0.5000', '0.5000', '10.5000', 1, '1.0000', '100.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(22, '2023-01-12 20:20:13', 1, 'Cliente Padrão', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '0.5000', '0.5000', '10.5000', 1, '1.0000', '10.5000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(23, '2023-01-12 20:28:37', 1, 'Cliente Padrão', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '0.5000', '0.5000', '10.5000', 1, '1.0000', '10.5000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(25, '2023-02-13 20:15:24', 1, 'Cliente Padrão', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '1.5000', '1.5000', '31.5000', 1, '2.0000', '31.5000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(26, '2023-02-13 20:36:45', 1, 'Cliente Padrão', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '0.7500', '0.7500', '15.7500', 1, '1.0000', '16.0000', 1, NULL, NULL, '', 'paid', '0.2500', 1, ''),
(27, '2023-02-13 20:50:11', 1, 'Cliente Padrão', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '0.7500', '0.7500', '15.7500', 1, '1.0000', '16.0000', 1, NULL, NULL, '', 'paid', '0.2500', 1, ''),
(28, '2023-02-13 20:53:54', 1, 'Cliente Padrão', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '0.7500', '0.7500', '15.7500', 1, '1.0000', '16.0000', 1, NULL, NULL, '', 'paid', '0.2500', 1, ''),
(29, '2023-02-14 14:43:54', 1, 'Cliente Padrão', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '15.0000', 1, '1.0000', '15.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(30, '2023-02-14 14:45:33', 1, 'Cliente Padrão', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '0.5000', '0.5000', '10.5000', 1, '1.0000', '10.5000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(31, '2023-02-14 17:08:20', 1, 'Cliente Padrão', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '1.2500', '1.2500', '26.2500', 2, '2.0000', '26.5000', 1, NULL, NULL, '', 'paid', '0.2500', 1, ''),
(32, '2023-07-26 17:36:38', 1, 'Cliente Padrão', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '0.7500', '0.7500', '15.7500', 1, '1.0000', '16.0000', 1, NULL, NULL, '', 'paid', '0.2500', 1, ''),
(33, '2024-01-23 23:27:06', 1, 'Cliente Padrão', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '2.5000', '2.5000', '52.5000', 1, '1.0000', '52.5000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(34, '2024-01-23 23:34:41', 1, 'Cliente Padrão', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '25.0000', 1, '1.0000', '25.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(35, '2024-01-23 23:37:32', 1, 'Cliente Padrão', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '25.0000', 1, '1.0000', '25.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(36, '2024-01-23 23:38:00', 1, 'Cliente Padrão', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '25.0000', 1, '1.0000', '25.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(37, '2024-01-23 23:55:57', 3, 'teste', '75.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '75.0000', 2, '2.0000', '75.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, '101010'),
(38, '2024-01-23 23:59:05', 1, 'Cliente Padrão', '85.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '85.0000', 3, '3.0000', '85.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(39, '2024-01-24 00:22:32', 1, 'Cliente Padrão', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '20.0000', 1, '2.0000', '20.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(40, '2024-01-24 00:27:21', 1, 'Cliente Padrão', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '10.0000', 1, '1.0000', '10.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(41, '2024-01-24 00:29:53', 1, 'Cliente Padrão', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '10.0000', 1, '1.0000', '10.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(42, '2024-01-24 00:40:02', 1, 'Cliente Padrão', '95.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '95.0000', 3, '4.0000', '95.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(43, '2024-01-24 01:02:08', 1, 'Cliente Padrão', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '10.0000', 1, '1.0000', '10.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(44, '2024-01-24 01:11:48', 1, 'Cliente Padrão', '85.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '85.0000', 3, '3.0000', '85.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(45, '2024-01-24 09:04:45', 1, 'Cliente Padrão', '2.5000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '2.5000', 1, '1.0000', '2.5000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(46, '2024-02-08 20:09:29', 1, 'Cliente Padrão', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '50.0000', 1, '1.0000', '50.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_sale_items`
--

CREATE TABLE `tec_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT 0.0000,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`, `product_code`, `product_name`, `comment`) VALUES
(19, 17, 1, '3.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '30.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(20, 18, 2, '1.0000', '20.0000', '20.0000', '0', '0.0000', 0, '0.0000', '20.0000', '20.0000', '10.0000', '240920222022', 'IDF em Vegas', ''),
(21, 19, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(24, 21, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(25, 22, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(26, 23, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(29, 25, 3, '2.0000', '15.0000', '15.0000', '0', '0.0000', 0, '0.0000', '30.0000', '15.0000', '10.0000', '0000000000101010', 'Caipírinha', ''),
(30, 26, 3, '1.0000', '15.0000', '15.0000', '0', '0.0000', 0, '0.0000', '15.0000', '15.0000', '10.0000', '0000000000101010', 'Caipírinha', ''),
(31, 27, 3, '1.0000', '15.0000', '15.0000', '0', '0.0000', 0, '0.0000', '15.0000', '15.0000', '10.0000', '0000000000101010', 'Caipírinha', ''),
(32, 28, 3, '1.0000', '15.0000', '15.0000', '0', '0.0000', 0, '0.0000', '15.0000', '15.0000', '10.0000', '0000000000101010', 'Caipírinha', ''),
(33, 29, 3, '1.0000', '15.0000', '15.0000', '0', '0.0000', 0, '0.0000', '15.0000', '15.0000', '10.0000', '0000000000101010', 'Caipírinha', ''),
(34, 30, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(35, 31, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(36, 31, 3, '1.0000', '15.0000', '15.0000', '0', '0.0000', 0, '0.0000', '15.0000', '15.0000', '10.0000', '0000000000101010', 'Caipírinha', ''),
(37, 32, 3, '1.0000', '15.0000', '15.0000', '0', '0.0000', 0, '0.0000', '15.0000', '15.0000', '10.0000', '0000000000101010', 'Caipírinha', ''),
(38, 33, 4, '1.0000', '50.0000', '50.0000', '0', '0.0000', 0, '0.0000', '50.0000', '50.0000', '25.0000', '11111111', 'Cimento CP II F 32 Todas as Obras 50kg Votoran', ''),
(39, 34, 5, '1.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '25.0000', '25.0000', '10.0000', 'CIMENTO', 'Cimento CP II F 32 Todas as Obras 25kg Votoran', ''),
(40, 35, 5, '1.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '25.0000', '25.0000', '10.0000', '222222222', 'Cimento CP II F 32 Todas as Obras 25kg Votoran', ''),
(41, 36, 5, '1.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '25.0000', '25.0000', '10.0000', '222222222', 'Cimento CP II F 32 Todas as Obras 25kg Votoran', ''),
(42, 37, 4, '1.0000', '50.0000', '50.0000', '0', '0.0000', 0, '0.0000', '50.0000', '50.0000', '25.0000', '11111111', 'Cimento CP II F 32 Todas as Obras 50kg Votoran', ''),
(43, 37, 5, '1.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '25.0000', '25.0000', '10.0000', '222222222', 'Cimento CP II F 32 Todas as Obras 25kg Votoran', ''),
(44, 38, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(45, 38, 4, '1.0000', '50.0000', '50.0000', '0', '0.0000', 0, '0.0000', '50.0000', '50.0000', '25.0000', '11111111', 'Cimento CP II F 32 Todas as Obras 50kg Votoran', ''),
(46, 38, 5, '1.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '25.0000', '25.0000', '10.0000', '222222222', 'Cimento CP II F 32 Todas as Obras 25kg Votoran', ''),
(47, 39, 1, '2.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '20.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(48, 40, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(49, 41, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(50, 42, 1, '2.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '20.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(51, 42, 4, '1.0000', '50.0000', '50.0000', '0', '0.0000', 0, '0.0000', '50.0000', '50.0000', '25.0000', '11111111', 'Cimento CP II F 32 Todas as Obras 50kg Votoran', ''),
(52, 42, 5, '1.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '25.0000', '25.0000', '10.0000', '222222222', 'Cimento CP II F 32 Todas as Obras 25kg Votoran', ''),
(53, 43, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(54, 44, 1, '1.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '10.0000', '10.0000', '5.0000', '010110101010101', 'teste', ''),
(55, 44, 4, '1.0000', '50.0000', '50.0000', '0', '0.0000', 0, '0.0000', '50.0000', '50.0000', '25.0000', '11111111', 'Cimento CP II F 32 Todas as Obras 50kg Votoran', ''),
(56, 44, 5, '1.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '25.0000', '25.0000', '10.0000', '222222222', 'Cimento CP II F 32 Todas as Obras 25kg Votoran', ''),
(57, 45, 6, '1.0000', '2.5000', '2.5000', '0', '0.0000', 0, '0.0000', '2.5000', '2.5000', '1.0000', '7898543595663', 'Fita Veda Rosca', ''),
(58, 46, 4, '1.0000', '50.0000', '50.0000', '0', '0.0000', 0, '0.0000', '50.0000', '50.0000', '25.0000', '11111111', 'Cimento CP II F 32 Todas as Obras 50kg Votoran', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('00r86t40g3qjdfc87upq7lur99b96v48', '10.0.0.106', 1664117544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373332323b),
('09oq55507su3ife276b28v5gpiei48im', '127.0.0.1', 1676396600, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363339363630303b),
('0abdf4il7km8a622gvcs6d9lpj0slk28', '10.0.0.101', 1664118366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131383336363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634303633393537223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('0cu5tiogtrisdhb7989589c79i4q1klv', '127.0.0.1', 1665200071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353230303033343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363635303133323231223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('0fsmaig8h3ftdke1ao0cqrnu6ukiie3g', '127.0.0.1', 1707434273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730373433343237333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303937323330223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b),
('0qn8rs7kdh009vmbp9mjc8t8p3f7oso1', '127.0.0.1', 1673533695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533333639353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635373632223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('1cnusj45135pis7tlqkrtsc8nqmq2img', '127.0.0.1', 1667065727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373036353639363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635343835223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('1fqm9slrn447uvr56a0b4nh59es6jm67', '127.0.0.1', 1706064189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036343138393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303536353837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b),
('1l8uo4sda38efgr17af1lb7mv8ko6g9u', '192.168.137.1', 1664115077, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131353037373b),
('1licpd3tj00locidl67orfdnivam3eea', '127.0.0.1', 1676335752, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333353735323b),
('1ph97nbfhsfmhf7ac0v711lktlcmqsgc', '10.0.0.106', 1664124491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343132343439313b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313233383234223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('204uelrch6fjnqub6jjrknatr2gsa5vp', '127.0.0.1', 1673535020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533353032303b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634323339333638223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32362031303a32383a3438223b),
('227pp68iai4mon5fpjn576po9cc88sv6', '127.0.0.1', 1673543381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333534333331373b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353238373138223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('2cl44vumsiicnjpumfb2cl35om9e2so9', '127.0.0.1', 1706066045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036363034353b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b),
('2go4slcl897g9tv9rcldsfa1ubf9epnf', '127.0.0.1', 1706063226, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036333232363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303536353837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('2j5mgokctbd3nvm7c93233al01v7viaa', '127.0.0.1', 1676336055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333363035353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('34dfh3ln28qcjd5ij1k62tdoi6vr5j5s', '127.0.0.1', 1667066702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373036363730323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635373038223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('35fn46ruvudjscv9gntn4bkarbceu3cb', '127.0.0.1', 1706097986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363039373938363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303730323131223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b726d73706f737c693a313b6d6573736167657c733a32383a2256656e64612061646963696f6e61646120636f6d207375636573736f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('3cih80e4qrr4qa5vdmn709o8fked27d5', '127.0.0.1', 1673566856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536363630363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353538393838223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('3ekp8dblk8q6d1qo8054f5cap1k04r36', '127.0.0.1', 1676405188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363430353138373b),
('3elhdgnjmcjin09j8d37rcp67cq3floh', '127.0.0.1', 1673535392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533353339323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353238373138223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('3eoue4p1vvtqbt3f745k8ghkkvs5ibcm', '10.0.0.106', 1664198282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139383238323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313937383634223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b726d73706f737c693a313b),
('3lpvvkl9li4ab69a9el8elebjf4tdi64', '10.0.0.106', 1664163622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136333632323b),
('3nmq2mp0k8no11hbdccih3mukb78iv99', '127.0.0.1', 1673565419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536353431393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('3pdj72n54sj9oh3edklhn1c2hpd3931l', '127.0.0.1', 1676405502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363430353530323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736343035313838223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('4ckc91ujauobsvhsgr4di6rd87ijdgei', '127.0.0.1', 1690403746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303430333734363b),
('4fash2j9b8rhp16q1me1s3tj4b3gn7nj', '127.0.0.1', 1674091692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637343039313639323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733363732313933223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('4ff0ropda35d42dnfj5uoo06rvl4eboo', '192.168.137.5', 1664115093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131353039333b),
('4fk4t0b648ha3o7r9c5fpedc284o9k1n', '127.0.0.1', 1673530523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533303532333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635373632223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('4gt4bd0db9j87a3kno0rr4l2rnof2ih5', '127.0.0.1', 1710868734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731303836383730333b),
('4rs89lan6ftj4r03m698mb8v7bsbtmle', '10.0.0.106', 1664166527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136363436313b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313636323430223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('4unbu7d3cqgbttq85d851rsjhsrp8mmg', '10.0.0.106', 1664127571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343132373537313b),
('518amusecdits4bl8nmb93af59n1009c', '127.0.0.1', 1706098665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363039383632343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303730323131223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b),
('582uovrnul865d6haficd9cff5t5u2n0', '127.0.0.1', 1673565057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536353035373b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a373a2235302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a30363a3037223b),
('58m9sijm6ohjbhsjava5ie3e9urjm637', '127.0.0.1', 1706071152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363037313036303b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303635303236223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b),
('5h3qkfdhlj9rfob7kigh5lrna95vmv4n', '127.0.0.1', 1667067875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373036373837353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635373038223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('5hrkb62a3125bi10ehcu4v329is9367b', '127.0.0.1', 1676331722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333313732323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('5r54kr3bknbektbfubsfq3f8ve6gmhlf', '10.0.0.132', 1664120679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343132303637393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313137363630223b6c6173745f69707c733a31303a2231302e302e302e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('5t9l6r0u0kcvpn06s0vsv22t6stgoc4o', '127.0.0.1', 1690403131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303430333133303b),
('67j14dge2kkvir2fgvfqq9q35j46li4s', '10.0.0.101', 1664164089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136343038393b),
('6edm2cvg3lp8n33mjdm5ev1fr4d1vii6', '192.168.137.216', 1673559123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333535393132333b),
('6ll8thuq1alg7cb8fdmae45ud6uh062t', '127.0.0.1', 1676335752, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333353735323b),
('6m67rjce6ca267gghp0lc6uvaa08lm92', '10.0.0.106', 1664117218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373036333b),
('6rh046905ugujju2b0s0ukfa78q3mnpr', '127.0.0.1', 1706063852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036333835323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303536353837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('6sapk5e313j7fhgltpmipfv9g0kplqpq', '127.0.0.1', 1710291463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731303239313338323b),
('6tif5247jb2k82rlt84ts6onfcgq43cc', '10.0.0.106', 1664196715, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139363731353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313936343531223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('6tqm61hlabboe0qj1tj1iquevdi3fai2', '127.0.0.1', 1664164086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136343038363b),
('6u8jmdh45js6hvne4sku57h8g77sch86', '10.0.0.106', 1664166240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136363234303b),
('74d9d5c3o572vh27iklev5bjnpa6pd4v', '10.0.0.106', 1664160627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136303632373b),
('75k5ke1lhedsuq61q7aatqg8vcc4cjsd', '127.0.0.1', 1673533388, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533333338383b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635373632223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('7bevgubqja78g89oie3vi58bsgtc6oig', '127.0.0.1', 1710270309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731303237303330393b),
('7fegbirl78qptmtfnvhbe30u4e1ruphe', '127.0.0.1', 1664117035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373033353b),
('7mr9nud6qehml3vcp8vt4pmlt50g6qk3', '127.0.0.1', 1664159796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343135393739363b),
('7p52iqhub11540usj44tvma98addokp2', '10.0.0.106', 1664160293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136303239333b),
('813bseflgj3lsblpnfn87s4m8ip4rbgi', '127.0.0.1', 1676335753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333353735333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('860a4253v90i3g99sc1ol08o3ekh0jg2', '127.0.0.1', 1676333117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333333131373b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('86223spr0fpugrkt4jnag6j7hs19hdlh', '127.0.0.1', 1667010925, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373031303930343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363635323030303532223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('89od4v6eb47s6ctd8b1s850e1v2knu7r', '127.0.0.1', 1674930379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637343933303337393b),
('8mc2afqbh61qdon8lip943tcnlv62io0', '127.0.0.1', 1674930683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637343933303638333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363734303931323432223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('8o368453m9f0lijbimjfgndqb5ok8pmp', '10.0.0.101', 1664119483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131393438313b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634303633393537223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('90j2cabd7gpdmo7c08t5ni41cg8lsf0u', '127.0.0.1', 1676333446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333333434363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('932egiu2cqrbjggv52e15u0024rv4c3t', '10.0.0.101', 1664199909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139393632373b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313939343530223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('99s8djdfcqvuf819u21ffoqncqbbrlsi', '10.0.0.101', 1664117883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373838333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634303633393537223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('9a9cspb1qhd0l2hs7kraifdjii6196st', '127.0.0.1', 1664238991, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343233383938353b),
('9dd91qnpdt0lvqca8h9mesug9rju4if1', '127.0.0.1', 1706068731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036383733313b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b726d73706f737c693a313b),
('9lv4en17qvnosmio8f77m671vj59tgmr', '127.0.0.1', 1673528513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333532383531333b),
('9q2h7grhf0ntuid4ep3qpmnlgni42qup', '10.0.0.101', 1664164616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136343631363b),
('9vebkh5hthbvsn6ia7invortq665s5af', '127.0.0.1', 1710270311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731303237303331303b),
('9vhlvlfvsajjfffch6se6p4ef2k6l6i7', '127.0.0.1', 1667067875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373036373837353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635373038223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('9vjdgt1f02g7puq6cscsmepuusv06rk3', '127.0.0.1', 1673629545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333632383631353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636333134223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('a4615igocdjc2i5koobh86uva98nisod', '127.0.0.1', 1676332196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333323139363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('a5qd4r5chn4e4f9c0m6t1v6naksu5sp9', '127.0.0.1', 1674091840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637343039313834303b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363734303931303430223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('aejk6tdvto7f7na8s8s11if328bh7nl9', '10.0.0.106', 1664161546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136313534363b),
('aidambke48oesj65g17g5ee0igjhanvo', '127.0.0.1', 1706097229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363039373232393b),
('b02opqd1vusbhlce5mbro26bhrebt0qs', '127.0.0.1', 1664117237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373231383b),
('b3eagkp7u9qv5g24kmpj9se9lsgile6k', '10.0.0.106', 1664165561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136353536313b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313634393234223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('bdu2kj8nqsgcirofggko1n7hdeam3cd6', '10.0.0.106', 1664196751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139363731353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313936343834223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('bs0mjgj1ae68och7sep3o4hagkm31j1f', '127.0.0.1', 1673538476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533383437363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353238373138223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('c5826gqtfvlia68kmfbehipm2hdvlg5o', '127.0.0.1', 1706066540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036363534303b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b),
('c8fqoj6aj6dq4s691pf10utchj2j2jtk', '127.0.0.1', 1673561585, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536313538353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('cd3018sjm8v02a6dvni5cd92oentjkrv', '127.0.0.1', 1673528719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333532383731393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635373632223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c4e3b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('cjl343g5beuf1losm1576n23sab68cfq', '127.0.0.1', 1706058060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363035383036303b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363930343033373437223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('csk5ve7m3jsh3thqtliqs73fjjp3g9m3', '127.0.0.1', 1673560847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536303834373b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('d9rmmq475n06h2oni6i3rtbus2psthpv', '127.0.0.1', 1664199443, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139393434333b),
('da5svfancq5nk4mehlkbkamp9aplbor2', '127.0.0.1', 1676336117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333363035353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('dia1kuffs31ojea6ui7f2jurcjrhm05q', '127.0.0.1', 1706065465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036353436353b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b),
('dnkeimhbvaievenhb2nvv1ogkg1vm2ep', '10.0.0.101', 1664199627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139393632373b),
('e0sdil9jk0er040mfh4lh02sr8q4n4d3', '127.0.0.1', 1676332664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333323636343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b726d73706f737c693a313b6d6573736167657c733a32383a2256656e64612061646963696f6e61646120636f6d207375636573736f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('e628s9c8gimo47md4b2ijq1j09ne2js0', '127.0.0.1', 1706062875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036323837353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303536353837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('ek77tgtlrmvkjci1l4l7vsijf62ivdr3', '192.168.137.163', 1664116608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131363630383b),
('enm1f0d95o2bqblqfkqk1i9o3q1ougck', '10.0.0.106', 1664197863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139373836333b),
('eqh8qreepjfqtav3tcckd51vanmrv43e', '10.0.0.106', 1664197917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139373931373b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313937313933223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('esbke5t4hrbpmr1f6rllu1fv5f1illjr', '127.0.0.1', 1674091988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637343039313933353b),
('ev8vuagk8lm6lfi9tc6g6doc9la8l5n2', '192.168.137.225', 1673556900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333535363930303b),
('f0rk5n2kkohbcd6gknm0cvuf2oo75bnq', '127.0.0.1', 1664239349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343233393334393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634323338393735223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('f1iqai80dv5dv8cbs9gv5i11di1jmg9k', '192.168.137.225', 1673556935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333535363933353b),
('f71u6a8kq4t5cotndhesn9bng2gj1cnn', '127.0.0.1', 1673533078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533333037383b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635373632223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('fel1pnrosdc94pm24q0rft49ln4dq7fi', '127.0.0.1', 1664239560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343233393536303b),
('fu2p36nea6d6ed7f6geerhmrjc07795j', '127.0.0.1', 1710281959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731303238313935383b),
('fvt21flguui0ggn0t1d0do1vg1f8ieq7', '127.0.0.1', 1664238873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343233383837333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634323338313336223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('g5ll2n9mrckj57d4an45l9kgpu381uc3', '10.0.0.106', 1664114133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131343132343b),
('g651hvsn6d71vqcpno12j2jktvcncsro', '10.0.0.106', 1664160964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136303936343b),
('g6l29t1s0t485d5jdf27g256tlhjnu9h', '127.0.0.1', 1706098624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363039383632343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303730323131223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b),
('gdo1ofpju4jvu611crd1qelnp30np6p7', '127.0.0.1', 1706069908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036393930383b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303635303830223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b726d73706f737c693a313b),
('gpi8vji69gfl2f5gpscqu9kk2sacslpo', '192.168.137.163', 1664116608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131363630383b),
('h5797nqme6g4ftlklq31vjgoaoglfa5n', '127.0.0.1', 1664114843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131343834333b),
('hf6it588u6bgkqep2eguk0dvjh5lifhq', '127.0.0.1', 1706070080, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363037303038303b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b),
('hjbo0kv9e3e1o6gi23ektc1gjn1mknaf', '127.0.0.1', 1706069396, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036393339363b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b726d73706f737c693a313b),
('hkmt3tkl7lkhdkt6pjobjtp2hocro2h9', '127.0.0.1', 1664123681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343132333638313b),
('hl85es2grdmh4rv12co4iss1t5g70had', '10.0.0.106', 1664164923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136343932333b),
('ho35bu8jdu07leag735cra97vat1oeeh', '127.0.0.1', 1673539058, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533393035383b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353238373138223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('hqtckug22ndukq1m8m0vhdfkb23110vr', '127.0.0.1', 1674091814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637343039313639323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733363732313933223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('hsp2f10eh6tmrckv95gkpe1lojb2ofpn', '127.0.0.1', 1673539425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533393432353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353238373138223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('i052auj6sqblt8tbnnqv8o0jqo5j7tvr', '127.0.0.1', 1706066841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036363834313b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b),
('i7t15r0kam6972811t854q2lhts520v7', '127.0.0.1', 1673566086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536363038363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('i8od0sdmh1ovg98muhpsepkl6n5oqe7u', '10.0.0.106', 1664163068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136333036383b),
('ig0nr2u4fs0b7ooie90ianlakjcbfklp', '127.0.0.1', 1710281959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731303238313935393b),
('ikko9vptvinsu40vgbomlr9lvqeh372i', '10.0.0.106', 1664128640, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343132383634303b),
('islkkqe28teegda1qv7863a7ovbdkufi', '127.0.0.1', 1667065409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373036353430353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303130393234223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('j5mkuc0594tg4b68svpboldkf639ckeo', '127.0.0.1', 1673541904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333534313930343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353238373138223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('japv5nbfh9h03bmthhoduk5ndjf7c8tf', '127.0.0.1', 1665013407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636353031333235373b),
('jbl5kj833kqht5vhrosfikq3jrv7iv4n', '127.0.0.1', 1673672299, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333637323137323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733363238363337223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('jdo7o1p7v30sfup0qt08ihrvr6rojlnr', '10.0.0.101', 1664164093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136343038393b),
('ji0qoeg9hu83q8oa99rqei5h0ah421ai', '127.0.0.1', 1676405577, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363430353530323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736343035313838223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('jmmku5eaoobnpahnqceibt0m5fuguvak', '10.0.0.106', 1664166643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136363633393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313636353237223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('jpfrmcelmcfp36jif0m5nrufphvg96tu', '127.0.0.1', 1676396733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363339363630303b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333331313037223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b726d73706f737c693a313b6d6573736167657c733a32383a2256656e64612061646963696f6e61646120636f6d207375636573736f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('jtlsp1b6j05bcedhs4tk48iv47t5296c', '127.0.0.1', 1673534268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533343236383b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303635373632223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('k41o6po4e52nad2pok0cgvjeilmmqnbe', '127.0.0.1', 1667064900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373036343930303b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303130393234223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('k63khmbfh9b0hilppuajkq3i144fjckr', '127.0.0.1', 1673564313, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536343331333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b),
('k7ljuo9mukd57fbk9s31huupummegehs', '127.0.0.1', 1706058361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363035383336313b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363930343033373437223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('k8nja5m3kjehp9f63sduljfes1uc2627', '127.0.0.1', 1664117248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373033353b),
('kk50ieln45t1me96bk97s7nkbmfqqutj', '127.0.0.1', 1706071060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363037313036303b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303635303236223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b),
('kutjal93b90m7i1i6a845odcv94oumaq', '127.0.0.1', 1676331395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333313339353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('kvclhb75e9v6fm9ge1j4thba78ff9aav', '192.168.137.225', 1673557186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333535373138363b),
('lbpd04m1sa6k3n5fj52981rcgc2sl4sv', '127.0.0.1', 1673543317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333534333331373b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353238373138223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('ld2qu9jjd5lbstd8vim16o8i7malla8v', '127.0.0.1', 1706097664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363039373636343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303730323131223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b),
('lkhjju4g294570d2i4es0l8vjp022eis', '10.0.0.106', 1664199444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139393434343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313937353537223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('mef8s9b1k4v9rn2k4ht0vklio22f985u', '10.0.0.101', 1664120085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131393837313b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313139373136223b6c6173745f69707c733a31303a2231302e302e302e313031223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b),
('mibp934vkoou1c7nk010bmm5nj2um6f2', '10.0.0.106', 1664164392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136343339323b),
('mj0tomcnm8trmgetf01p649rf14m7js6', '10.0.0.106', 1664116619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131363631393b),
('mjs9us36ktv01iohgioiehcugkcjlq63', '127.0.0.1', 1710291464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731303239313338333b),
('ms686ceesctbbo8t0qbl5qh3l94si3o3', '10.0.0.106', 1664199450, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139393434343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313938393834223b6c6173745f69707c733a31303a2231302e302e302e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('n48dcti1o5sqk512817toc4mr9ucb0ck', '127.0.0.1', 1707434382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730373433343237333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303937323330223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b),
('n7usr0n4ndmj0n8dvrirnoi401iad9k4', '10.0.0.132', 1664120797, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343132303637393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313137363630223b6c6173745f69707c733a31303a2231302e302e302e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('nhoejv947nuoe1p0id57o49n7pmru1tm', '127.0.0.1', 1706063528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036333532383b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303536353837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('np5tjd1tpf9b0org8f2j57unvi3i5bme', '127.0.0.1', 1667065405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373036353430353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303130393234223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('o32kmh0jttgq1l1khq70dsb3blrj1dg0', '127.0.0.1', 1706057490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363035373439303b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363930343033373437223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('oo0kibomd9n7shku2k453q3api9qvn07', '10.0.0.132', 1664119095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131393039353b),
('oqr2hr99lfqs632og51ieek9bml9pstb', '10.0.0.106', 1664197512, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139373531323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313937313637223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('p171ahrhaodm6caojhe94v1b0i6msa8k', '127.0.0.1', 1673559382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333535393338323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('p4bnpaafrb0j4842gee1am08fjfeneol', '10.0.0.106', 1664131744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343133313734343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313233393732223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('pceqe2grl5b1m1df34ubvrsa9hjem1q8', '127.0.0.1', 1674930683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637343933303638333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363734303931323432223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('pk25fj3e9rlc97atqr7uuvs6kuuia9g9', '10.0.0.101', 1664166483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136363438333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313634363035223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('pkuhktferbtr62ltm75ogij2mmss26qf', '10.0.0.106', 1664142205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343134323230343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313238363437223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('prpnajt30mlqjdr6ad42c1sj4qd5kiu8', '10.0.0.132', 1664120368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343132303336383b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313137363630223b6c6173745f69707c733a31303a2231302e302e302e313031223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('ptm116ccejimoc94nkk2ragq0qboeo9h', '10.0.0.106', 1664164029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136343032393b),
('q4f5gvn8tjgoo919u14aign1cr1eoa86', '127.0.0.1', 1673563630, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536333633303b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('q7cnoddeca299sagv29q1neuik5lkgia', '127.0.0.1', 1676331092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333313039323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363734393330343432223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('qfsqcmoenr5dlb46jmt4pbkoaoslh789', '127.0.0.1', 1667065063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373036343931333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303634363131223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('qgk0tf3t6dn1aeog7umhv93eo7jv54id', '10.0.0.101', 1664119868, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131393730383b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313139353432223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32352031323a32393a3238223b),
('qi5089ln22lce1i1kaulihua3topm9di', '127.0.0.1', 1706059707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363035393730373b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363930343033373437223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('qme064ndrm6ge011ml36knjoh7rq2f53', '10.0.0.106', 1664114990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131343939303b),
('qn1hj7ce3oepqjid6rrf1oths75dketg', '127.0.0.1', 1706067876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036373837363b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b726d73706f737c693a313b6d6573736167657c733a32383a2256656e64612061646963696f6e61646120636f6d207375636573736f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('qol2oqaqmppslnmge4p5s5qsv1vfmjll', '127.0.0.1', 1706068272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036383237323b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b726d73706f737c693a313b),
('qps7g0qu8o4n7dj2bj0l2t4p3igdgj0a', '127.0.0.1', 1673528494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333532383438373b),
('qt2s4go51jd16r700g8kis3404sg0p4e', '127.0.0.1', 1664117267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373236373b),
('qupthcn560g7hrna6elterb4rfkr04r1', '10.0.0.106', 1664166614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136363631343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313634393433223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('r1r7m1uqjbopgfcebong6nu0q79f0j79', '127.0.0.1', 1707433497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730373433333439363b),
('r8cgq6srpdo8696d8fv0iddnvpo7j0o4', '10.0.0.106', 1664198588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139383538363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313937383634223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b726d73706f737c693a313b),
('rb13moqm1ejh442armabkmnvo2qlpcch', '127.0.0.1', 1706067419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036373431393b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b726d73706f737c693a313b),
('rdmf1jp56stmtnjn5uhh3okr7jhtfggr', '127.0.0.1', 1664123683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343132333638313b),
('rf7o5kvbvc313curgkk3qljajp79p9fc', '10.0.0.106', 1664162002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136323030323b),
('rk90n8t2gu8n75tjr1o4cc0qqot97bb9', '10.0.0.106', 1664162318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136323331383b),
('rngtcbq841eporl5kjd2tujorhr1ca6d', '127.0.0.1', 1706070139, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036393930383b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303635303830223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b),
('s57arhhetu0hc2a5v76q5db37k3e8rac', '127.0.0.1', 1664116530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131363533303b),
('set6dpltto0j540hp2s2gof2oid4tfeg', '10.0.0.106', 1664117573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373537333b),
('sg6fo7n782thldcr9127bcs2ds72ev28', '127.0.0.1', 1706069076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036393037363b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a32313a2261646d696e406564736f6e636f7374612e74656368223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353636313033223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2239223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a35383a3130223b726d73706f737c693a313b),
('sjildnqsa568pra45a6ariv484top6d1', '127.0.0.1', 1673563289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536333238393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('sotbnfhojtrqkn7mav2tgc6kq9blpnq1', '127.0.0.1', 1676331092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333313039323b),
('srl54b1ehji4trieihhgr6dgsp7a9prn', '10.0.0.106', 1664165926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136353932363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313634393433223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b637372666b65797c733a383a22536358564b4a6244223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a224a3243657130486e6a3768365659515031616b63223b),
('t01tpglb3buse6782ihtqn8cv67urpld', '127.0.0.1', 1664199444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139393434333b),
('t3nte7c26da4qriippsludenoip2lsdl', '127.0.0.1', 1690403914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313639303430333931333b),
('tag8d646ckse3c9mlbnulata93remrgu', '127.0.0.1', 1664117218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373231383b),
('tcfpmgj3va5n1f09qd3qvor5a8nssh6p', '127.0.0.1', 1676333686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333333638353b),
('td8248dg1fim2tbeqg7i93v28muvi797', '127.0.0.1', 1673564749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536343734393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b),
('tdhm8tbcboeit99ngtm24kubci7idr2a', '10.0.0.106', 1664117063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343131373036333b),
('tgqq0icndugfn37esseee9o4s3relke8', '127.0.0.1', 1673563932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536333933323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353335303435223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('th101hcc5onm7h267goj9m8l5butvp39', '127.0.0.1', 1706056569, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363035363536393b),
('thhtgto2326klpbtk05lnbmarmvtsd6e', '10.0.0.106', 1664164031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136343032393b),
('tne393gken0rhcmr732bc79p5vl3sopl', '127.0.0.1', 1706059043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363035393034333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363930343033373437223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('tp4us9c9mi988ephcfuu9pp7gu13g0un', '127.0.0.1', 1706064822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036343832323b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303536353837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b),
('tprtfgjisf2f3ts41muuhn236h76nifu', '10.0.0.106', 1664131744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343133313734343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313233393732223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('u090rsi752erk5h6b4j24d8jhpfsqlpr', '127.0.0.1', 1707433959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730373433333935393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303937323330223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b726d73706f737c693a313b6d6573736167657c733a32383a2256656e64612061646963696f6e61646120636f6d207375636573736f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('uiriq3gj7jm71v8i4gbb25tvf61okm84', '127.0.0.1', 1673534699, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333533343639393b6964656e746974797c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a32343a2276656e6465646f72406564736f6e636f7374612e74656368223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a363a22436169786120223b6c6173745f6e616d657c733a31303a22446520656e7472616461223b637265617465645f6f6e7c733a32303a2232352f5365702f323032322031323a323520504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634323339333638223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c693a313b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32362031303a32383a3438223b),
('us5dpp3d3u0kr1esl25oo61hff5fediq', '127.0.0.1', 1676334378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333343337383b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('v26bosm1e7n7q8lbh20hc3t6e0obrbk3', '127.0.0.1', 1667065678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636373036353436343b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363637303634393437223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('vfsmg6d0lo8hcdbjg6pbi3a5i93uljtp', '127.0.0.1', 1706064491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730363036343439313b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373036303536353837223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a33363a2233343964633431356235636431363539383733356533643665373563643263622e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2238223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30312d32332032333a34333a3437223b),
('vh1tsg4a043e6nmvfh06n5s8eklkeu12', '127.0.0.1', 1674091271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637343039313237313b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363734303931303430223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('vjmhqf7ksgpumii864f776ho95a0jo05', '10.0.0.101', 1664166500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343136363438333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313634363035223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b6572726f727c733a33383a223c703e4f206c6f67696e2066616c686f752c2074656e7465206e6f76616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('vk71eun6dcnunlggh712su8gojn3pqvt', '10.0.0.106', 1664198622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636343139383631353b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363634313937393331223b6c6173745f69707c733a31303a2231302e302e302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e566f63c3aa20657374c3a120636f6e65637461646f20636f6d207375636573736f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30392d32342032303a34373a3334223b),
('vouor7vi3mca805atov0v2v9a9tc4e7q', '127.0.0.1', 1673566606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637333536363630363b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363733353538393838223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('vq7tmaitk8545f5pfgsm3bil5roe31u2', '127.0.0.1', 1676330099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333303039393b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363734393330343432223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b),
('vtgmf53ni60f48si0c2jn6h763r56b52', '127.0.0.1', 1676334033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313637363333343033333b6964656e746974797c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a2261646d696e406564736f6e636f7374612e74656368223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32303a2232352f4a756e2f323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363736333239383135223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a373a2231302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30312d31322032303a31333a3039223b);

-- --------------------------------------------------------

--
-- Table structure for table `tec_settings`
--

CREATE TABLE `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `footer` varchar(1000) DEFAULT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) DEFAULT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT 2,
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT 42,
  `rounding` tinyint(1) DEFAULT 0,
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT 1,
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT 2,
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
  `local_printers` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `print_img` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`, `theme_style`, `after_sale_page`, `overselling`, `multi_store`, `qty_decimals`, `symbol`, `sac`, `display_symbol`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `rtl`, `print_img`) VALUES
(1, 'idf.png', 'IDF CLUB', '0105292122', 'j/M/Y', 'h:i A', 'noreply@edsoncosta.tech', 'portuguese', '4.0.28', 'default', 'Asia/Kuala_Lumpur', 'mail', 'pop.gmail.com', 'noreply@spos.tecdiary.my', '', '25', '', 0, 0, NULL, 'BRL', 1, '0%', 25, 30, NULL, NULL, 3, 0, 1, '0', 1, NULL, 10, 2, '.', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'ALT+F8', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 2, '1234', 0, '', '', '', '', 'green', 0, 0, 0, 2, 'R$', 0, 1, 1, 1, 'null', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tec_stores`
--

CREATE TABLE `tec_stores` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `receipt_header` text DEFAULT NULL,
  `receipt_footer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_stores`
--

INSERT INTO `tec_stores` (`id`, `name`, `code`, `logo`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `receipt_header`, `receipt_footer`) VALUES
(1, 'IDF PDV', 'IDF', '772095ef8d57725be17a269d385abb91.png', '', '012345678', 'Rua Joaquim Costa, Centro', '', 'Capanema', 'Pará', '68700-16', 'Brasil', 'MYR', '', 'Este recibo é emitido pelo IDF Clube. Obrigado por sua visita! Esperamos vê-lo novamente em breve para mais diversão e boas bebidas.');

-- --------------------------------------------------------

--
-- Table structure for table `tec_suppliers`
--

CREATE TABLE `tec_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'Test Supplier', '1', '2', '0123456789', 'supplier@tecdairy.com');

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_items`
--

CREATE TABLE `tec_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_suspended_items`
--

INSERT INTO `tec_suspended_items` (`id`, `suspend_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `product_code`, `product_name`, `comment`) VALUES
(5, 4, 4, '2.0000', '50.0000', '50.0000', '0', '0.0000', 0, '0.0000', '100.0000', '50.0000', '11111111', 'Cimento CP II F 32 Todas as Obras 50kg Votoran', ''),
(9, 5, 1, '3.0000', '10.0000', '10.0000', '0', '0.0000', 0, '0.0000', '30.0000', '10.0000', '010110101010101', 'teste', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_sales`
--

CREATE TABLE `tec_suspended_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_suspended_sales`
--

INSERT INTO `tec_suspended_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `hold_ref`, `store_id`) VALUES
(4, '2024-01-24 00:04:25', 3, 'teste', '100.0000', '0.0000', '15%', '15.0000', '15.0000', '0.0000', '0%', '0.0000', '0.0000', '85.0000', 1, '2.0000', '0.0000', 2, NULL, NULL, '', '101010', 1),
(5, '2024-01-24 01:19:13', 3, 'teste', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '30.0000', 1, '3.0000', '0.0000', 2, NULL, NULL, '', '101010', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_users`
--

CREATE TABLE `tec_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 2,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) VALUES
(1, 0x3132372e302e302e31, 0x3132372e302e302e31, 'admin', 'fe941d48eb1fbce34b4588ae500861570fb0e398', NULL, 'admin@edsoncosta.tech', NULL, NULL, NULL, 'b2d2c8fd5d9a5f19901279ac74cec92dc15ac970', 1435204774, 1707433535, 1, 'Admin', 'Admin', 'Tecdiary', '012345678', '349dc415b5cd16598735e3d6e75cd2cb.png', 'male', 1, NULL),
(2, 0x3132372e302e302e31, 0x31302e302e302e313031, 'admin@edsoncosta.tech', 'cd529361866edae1d644228dc48d10b7fda54daa', NULL, 'vendedor@edsoncosta.tech', NULL, NULL, NULL, 'df44c9a357f94a71ebb34b4f0a5cdefaa622e6d4', 1664119542, 1706069478, 1, 'Caixa ', 'De entrada', NULL, '0000000', NULL, 'female', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_user_logins`
--

CREATE TABLE `tec_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_user_logins`
--

INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x38302e32332e3132312e313134, 'admin@tecdiary.com', '2019-03-19 16:47:42'),
(2, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2019-03-19 18:17:26'),
(3, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-05-17 17:28:51'),
(4, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-05-17 18:31:02'),
(5, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-17 17:37:04'),
(6, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-17 18:07:57'),
(7, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-17 18:23:02'),
(8, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-17 18:24:09'),
(9, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-18 05:05:38'),
(10, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-18 15:24:46'),
(11, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-18 16:01:48'),
(12, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-18 17:19:56'),
(13, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-18 17:23:08'),
(14, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-18 17:24:01'),
(15, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-20 16:41:33'),
(16, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-21 21:43:37'),
(17, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-22 14:06:29'),
(18, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-06-25 20:34:06'),
(19, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2022-08-04 15:29:53'),
(20, 1, NULL, 0x3a3a31, 'admin@edsoncosta.tech', '2022-09-24 15:27:30'),
(21, 1, NULL, 0x3a3a31, 'admin@edsoncosta.tech', '2022-09-24 15:51:05'),
(22, 1, NULL, 0x3a3a31, 'admin@edsoncosta.tech', '2022-09-24 17:01:33'),
(23, 1, NULL, 0x3a3a31, 'admin@edsoncosta.tech', '2022-09-24 23:23:58'),
(24, 1, NULL, 0x3a3a31, 'admin@edsoncosta.tech', '2022-09-24 23:59:17'),
(25, 1, NULL, 0x31302e302e302e313031, 'admin@edsoncosta.tech', '2022-09-25 14:54:20'),
(26, 1, NULL, 0x31302e302e302e313332, 'admin@edsoncosta.tech', '2022-09-25 15:18:59'),
(27, 2, NULL, 0x31302e302e302e313031, 'vendedor@edsoncosta.tech', '2022-09-25 15:28:36'),
(28, 2, NULL, 0x31302e302e302e313031, 'vendedor@edsoncosta.tech', '2022-09-25 15:32:10'),
(29, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-25 16:35:33'),
(30, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-25 16:37:04'),
(31, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-25 16:39:32'),
(32, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-25 17:57:27'),
(33, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 02:58:22'),
(34, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:18:44'),
(35, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:19:31'),
(36, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:21:34'),
(37, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:24:03'),
(38, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:25:49'),
(39, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:34:27'),
(40, 1, NULL, 0x31302e302e302e313031, 'admin@edsoncosta.tech', '2022-09-26 03:39:28'),
(41, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:40:27'),
(42, 1, NULL, 0x31302e302e302e313031, 'admin@edsoncosta.tech', '2022-09-26 03:42:06'),
(43, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:44:46'),
(44, 1, NULL, 0x31302e302e302e313031, 'admin@edsoncosta.tech', '2022-09-26 03:48:53'),
(45, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:53:12'),
(46, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:56:27'),
(47, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 03:56:46'),
(48, 1, NULL, 0x31302e302e302e313031, 'admin@edsoncosta.tech', '2022-09-26 03:57:41'),
(49, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 04:02:04'),
(50, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 04:02:23'),
(51, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 04:16:43'),
(52, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 04:24:00'),
(53, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 04:28:47'),
(54, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 04:30:43'),
(55, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 12:45:24'),
(56, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 12:47:31'),
(57, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 12:48:04'),
(58, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 12:51:55'),
(59, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 12:52:47'),
(60, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 12:56:21'),
(61, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 12:59:27'),
(62, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 12:59:53'),
(63, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 13:05:57'),
(64, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 13:11:04'),
(65, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 13:12:11'),
(66, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 13:23:41'),
(67, 1, NULL, 0x31302e302e302e313031, 'admin@edsoncosta.tech', '2022-09-26 13:26:36'),
(68, 2, NULL, 0x31302e302e302e313031, 'vendedor@edsoncosta.tech', '2022-09-26 13:28:41'),
(69, 1, NULL, 0x31302e302e302e313031, 'admin@edsoncosta.tech', '2022-09-26 13:29:44'),
(70, 2, NULL, 0x31302e302e302e313031, 'vendedor@edsoncosta.tech', '2022-09-26 13:30:34'),
(71, 1, NULL, 0x31302e302e302e313036, 'admin@edsoncosta.tech', '2022-09-26 13:37:30'),
(72, 1, NULL, 0x31302e302e302e313031, 'admin@edsoncosta.tech', '2022-09-26 13:40:27'),
(73, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-09-27 00:22:16'),
(74, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-09-27 00:26:04'),
(75, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-09-27 00:36:15'),
(76, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-09-27 00:39:06'),
(77, 2, NULL, 0x3132372e302e302e31, 'vendedor@edsoncosta.tech', '2022-09-27 00:42:48'),
(78, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-10-05 23:40:22'),
(79, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-10-08 03:34:12'),
(80, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-10-29 02:35:24'),
(81, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-10-29 17:30:11'),
(82, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-10-29 17:35:47'),
(83, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-10-29 17:44:45'),
(84, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-10-29 17:48:28'),
(85, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2022-10-29 17:49:22'),
(86, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-01-12 13:05:18'),
(87, 2, NULL, 0x3132372e302e302e31, 'vendedor@edsoncosta.tech', '2023-01-12 14:40:20'),
(88, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-01-12 14:50:45'),
(89, 2, NULL, 0x3132372e302e302e31, 'vendedor@edsoncosta.tech', '2023-01-12 23:28:24'),
(90, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-01-12 23:31:54'),
(91, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-01-13 16:50:37'),
(92, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-01-14 04:56:33'),
(93, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-01-19 01:17:20'),
(94, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-01-19 01:20:42'),
(95, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-01-28 18:27:22'),
(96, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-02-13 23:10:15'),
(97, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-02-13 23:31:47'),
(98, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-02-14 17:43:39'),
(99, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-02-14 20:07:00'),
(100, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-07-26 20:28:12'),
(101, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2023-07-26 20:35:47'),
(102, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2024-01-24 00:36:27'),
(103, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2024-01-24 01:28:31'),
(104, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2024-01-24 02:57:06'),
(105, 2, NULL, 0x3132372e302e302e31, 'vendedor@edsoncosta.tech', '2024-01-24 02:58:01'),
(106, 2, NULL, 0x3132372e302e302e31, 'vendedor@edsoncosta.tech', '2024-01-24 04:11:18'),
(107, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2024-01-24 04:23:31'),
(108, 1, NULL, 0x3132372e302e302e31, 'admin@edsoncosta.tech', '2024-02-08 23:05:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_customers`
--
ALTER TABLE `tec_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `tec_groups`
--
ALTER TABLE `tec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_payments`
--
ALTER TABLE `tec_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_printers`
--
ALTER TABLE `tec_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_products`
--
ALTER TABLE `tec_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_registers`
--
ALTER TABLE `tec_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sales`
--
ALTER TABLE `tec_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sessions`
--
ALTER TABLE `tec_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tec_settings`
--
ALTER TABLE `tec_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tec_stores`
--
ALTER TABLE `tec_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_users`
--
ALTER TABLE `tec_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_customers`
--
ALTER TABLE `tec_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tec_groups`
--
ALTER TABLE `tec_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tec_printers`
--
ALTER TABLE `tec_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tec_stores`
--
ALTER TABLE `tec_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
