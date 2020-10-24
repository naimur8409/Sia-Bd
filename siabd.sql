-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2020 at 10:00 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siabd`
--

-- --------------------------------------------------------

--
-- Table structure for table `cash_books`
--

CREATE TABLE `cash_books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense` double(8,2) DEFAULT NULL,
  `income` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cost_types`
--

CREATE TABLE `cost_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cost_types`
--

INSERT INTO `cost_types` (`id`, `name`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'helooo', 1, 1, '2020-08-10 10:07:03', '2020-08-10 10:07:03'),
(2, 'new', 0, 0, '2020-08-10 10:14:33', '2020-08-10 10:43:45'),
(3, 'sssssssswwwwwww', 0, 0, '2020-08-10 10:44:00', '2020-08-10 10:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `flag_image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'india', '/storage/india.png', 1, NULL, '2020-08-10 11:39:34', '2020-08-10 11:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `default_upload_titles`
--

CREATE TABLE `default_upload_titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `default_upload_titles`
--

INSERT INTO `default_upload_titles` (`id`, `title`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'new title', NULL, '2020-08-10 12:44:08', '2020-08-10 12:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `degree_types`
--

CREATE TABLE `degree_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `degree_types`
--

INSERT INTO `degree_types` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'D', 1, NULL, '2020-08-18 03:59:08', '2020-08-18 03:59:08'),
(2, 'B', 1, NULL, '2020-08-18 03:59:08', '2020-08-18 03:59:08'),
(3, 'P', 1, NULL, '2020-08-18 03:59:10', '2020-08-18 03:59:10'),
(4, 'M', 1, NULL, '2020-08-18 03:59:10', '2020-08-18 03:59:10'),
(5, 'I', 1, NULL, '2020-08-18 03:59:11', '2020-08-18 03:59:11'),
(6, 'L', 1, NULL, '2020-08-18 03:59:13', '2020-08-18 03:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `required_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `uploaded_by` bigint(20) UNSIGNED DEFAULT NULL,
  `document_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `approved_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `student_id`, `required_by`, `approved_by`, `uploaded_by`, `document_title`, `file_location`, `status`, `approved_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 1, 'ssc_image', 'files/documents/ssc-8-1597142515.jpeg', 1, '2020-08-11 10:41:55', '2020-08-11 04:41:55', '2020-08-11 04:41:55'),
(2, 1, 1, NULL, 1, 'hsc_image', 'files/documents/hsc-8-1597142515.pdf', 1, '2020-08-11 10:41:55', '2020-08-11 04:41:55', '2020-08-11 04:41:55'),
(3, 1, 1, NULL, 1, 'additional_skill_image', 'files/documents/additional_skill_image-8-1597142515.png', 1, '2020-08-11 10:41:55', '2020-08-11 04:41:55', '2020-08-11 04:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `father` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wife` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_party_id` bigint(20) UNSIGNED DEFAULT NULL,
  `related_party_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `total_less` double(8,2) DEFAULT NULL,
  `total_paid` double(8,2) DEFAULT NULL,
  `total_balance` double(8,2) DEFAULT NULL,
  `total_discount` double(8,2) DEFAULT NULL,
  `total_makingcharge` double(8,2) DEFAULT NULL,
  `payment_deadline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_trxid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extstring2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_06_22_045131_create_programs_table', 2),
(7, '2020_07_06_061810_create_roles_table', 3),
(8, '2020_07_06_061950_create_permissions_table', 3),
(9, '2020_07_06_062556_create_permission_role_table', 4),
(10, '2020_07_06_062748_create_invoices_table', 5),
(12, '2020_07_06_062839_create_cash_books_table', 5),
(13, '2020_07_06_063025_create_employees_table', 5),
(14, '2020_07_06_062822_create_cost_types_table', 6),
(15, '2020_08_10_044006_create_documents_table', 6),
(16, '2020_08_10_044132_create_countries_table', 6),
(17, '2020_08_10_044151_create_universities_table', 6),
(18, '2020_08_10_044211_create_subjects_table', 6),
(19, '2020_08_10_044230_create_degree_types_table', 6),
(20, '2020_08_10_062850_create_default_upload_titles_table', 6),
(21, '2020_07_04_054116_create_student_lists_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lebel` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'others',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `lebel`, `label_group`, `created_at`, `updated_at`) VALUES
(1, 'ignition.healthCheck', 'ignition healthCheck', 'ignition', NULL, NULL),
(2, 'ignition.executeSolution', 'ignition executeSolution', 'ignition', NULL, NULL),
(3, 'ignition.shareReport', 'ignition shareReport', 'ignition', NULL, NULL),
(4, 'ignition.scripts', 'ignition scripts', 'ignition', NULL, NULL),
(5, 'ignition.styles', 'ignition styles', 'ignition', NULL, NULL),
(6, 'login', 'login', 'login', NULL, NULL),
(7, 'logout', 'logout', 'logout', NULL, NULL),
(8, 'register', 'register', 'register', NULL, NULL),
(9, 'password.request', 'password request', 'password', NULL, NULL),
(10, 'password.email', 'password email', 'password', NULL, NULL),
(11, 'password.reset', 'password reset', 'password', NULL, NULL),
(12, 'password.update', 'password update', 'password', NULL, NULL),
(13, 'password.confirm', 'password confirm', 'password', NULL, NULL),
(14, 'user.role.index', 'user role index', 'user', NULL, NULL),
(15, 'user.role.create', 'user role create', 'user', NULL, NULL),
(16, 'user.role.store', 'user role store', 'user', NULL, NULL),
(17, 'user.role.edit', 'user role edit', 'user', NULL, NULL),
(18, 'user.role.update', 'user role update', 'user', NULL, NULL),
(19, 'user.role.destroy', 'user role destroy', 'user', NULL, NULL),
(20, 'home', 'home', 'home', NULL, NULL),
(21, 'eligibility_check', 'eligibility_check', 'eligibility_check', NULL, NULL),
(22, 'studentlist.create', 'studentlist create', 'studentlist', NULL, NULL),
(23, 'studentlist.store', 'studentlist store', 'studentlist', NULL, NULL),
(24, 'cost_type.create', 'cost_type create', 'cost_type', NULL, NULL),
(25, 'cost_type.store', 'cost_type store', 'cost_type', NULL, NULL),
(26, 'apply', 'apply', 'apply', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(5, 3),
(10, 3),
(6, 2),
(7, 2),
(8, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(26, 2),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(255) UNSIGNED DEFAULT NULL,
  `university_id` bigint(255) UNSIGNED DEFAULT NULL,
  `degree_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuition_fee` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `country_id`, `university_id`, `degree_type_id`, `degree`, `subject_id`, `base`, `code`, `tuition_fee`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Diploma (Engg.) Computer Sc. & Engg. (CSE)', '1', 'After 10th', 'P102', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(2, 1, 1, 1, 'Diploma (Engg.) Computer Sc. & Engg. (CSE) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After ITI etc)', 'P102-L', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(3, 1, 1, 1, 'Dual Programme Diploma (Engg.) - B.Tech. (Computer Science & Engineering)', '1', 'After 10th', 'P102-NB', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(4, 1, 1, 1, 'Diploma (Engg.) Electronics & Comm. Engg. (ECE)', '1', 'After 10th', 'P105', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(5, 1, 1, 1, 'Diploma (Engg.) Electronics & Comm. Engg. (ECE) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After ITI etc)', 'P105-L', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(6, 1, 1, 1, 'Dual Programme Diploma (Engg.) - B.Tech. (Electronics & Communication Engineering)', '1', 'After 10th', 'P105-NB', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(7, 1, 1, 1, 'Diploma (Engg.) Electrical Engg. (EE)', '1', 'After 10th', 'P106', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(8, 1, 1, 1, 'Diploma (Engg.) Electrical Engg. (EE) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After ITI etc)', 'P106-L', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(9, 1, 1, 1, 'Dual Programme Diploma (Engg) - B.Tech. (Electrical Engineering)', '1', 'After 10th', 'P106-NB', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(10, 1, 1, 1, 'Diploma (Engg.) Civil Engg. (CE)', '1', 'After 10th', 'P107', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(11, 1, 1, 1, 'Diploma (Engg.) Civil Engg. (CE) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After ITI etc)', 'P107-L', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(12, 1, 1, 1, 'Dual Programme Diploma (Engg.) - B.Tech. (Civil Engineering)', '1', 'After 10th', 'P107-NB', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(13, 1, 1, 1, 'Diploma (Engg.) Mechanical Engg. (ME)', '1', 'After 10th', 'P108', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(14, 1, 1, 1, 'Diploma (Engg.) Mechanical Engg. (ME) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After ITI etc)', 'P108-L', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(15, 1, 1, 1, 'Dual Programme Diploma (Engg.) - B.Tech. (Mechanical Engineering)', '1', 'After 10th', 'P108-NB', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(16, 1, 1, 1, 'Diploma (Engg.) Automobile Engg. (AE)', '1', 'After 10th', 'P109', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(17, 1, 1, 1, 'Diploma (Engg.) Automobile Engg. (AE) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After ITI etc)', 'P109-L', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(18, 1, 1, 1, 'Dual Programme Diploma (Engg) - B.Tech. (Automobile Engineering)', '1', 'After 10th', 'P109-NB', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(19, 1, 1, 2, 'B.Sc. (Information Technology)', '2', 'After 10+2 (12th)', 'P123', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:08'),
(20, 1, 1, 2, 'B.Sc. (Information Technology) [Lateral Entry]', '2', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P123-L', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(21, 1, 1, 2, 'BCA', '2', 'After 10+2 (12th)', 'P124', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(22, 1, 1, 2, 'BCA (Hons.)', '2', 'After 10+2 (12th)', 'P124-H', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(23, 1, 1, 1, 'Dual Degree BCA (Hons.) - MCA (Hons.)', '2', 'After 10+2 (12th)', 'P124-HF', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(24, 1, 1, 2, 'BCA [Lateral Entry]', '2', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P124-L', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(25, 1, 1, 1, 'Dual Degree BCA - MCA', '2', 'After 10+2 (12th)', 'P124-NF', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(26, 1, 1, 2, 'B.Tech. (Biotechnology)', '1', 'After 10+2 (12th)', 'P131', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(27, 1, 1, 2, 'B.Tech. (Biotechnology) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P131-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(28, 1, 1, 2, 'B.Tech. (Computer Science & Engineering)', '1', 'After 10+2 (12th)', 'P132', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(29, 1, 1, 2, 'B.Tech. (Computer Science & Engineering) (Hons.)', '1', 'After 10+2 (12th)', 'P132-H', 118000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(30, 1, 1, 2, 'B.Tech. (Computer Science & Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P132-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(31, 1, 1, 1, 'Dual Degree B.Tech. - M.Tech. (Computer Science & Engineering)', '1', 'After 10+2 (12th)', 'P132-ND', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(32, 1, 1, 1, 'Dual Degree B.Tech. (Computer Science & Engineering)-MBA', '1', 'After 10+2 (12th)', 'P132-NE', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(33, 1, 1, 2, 'B.Tech. (Information Technology)', '1', 'After 10+2 (12th)', 'P133', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(34, 1, 1, 2, 'B.Tech. (Information Technology) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P133-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(35, 1, 1, 2, 'B.Tech. (Electronics & Communication Engineering)', '1', 'After 10+2 (12th)', 'P135', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(36, 1, 1, 2, 'B.Tech. (Electronics & Communication Engineering) (Hons.)', '1', 'After 10+2 (12th)', 'P135-H', 118000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(37, 1, 1, 2, 'B.Tech. (Electronics & Communication Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P135-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(38, 1, 1, 2, 'B.Tech. (Electrical Engineering)', '1', 'After 10+2 (12th)', 'P136', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(39, 1, 1, 2, 'B.Tech. (Electrical Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P136-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(40, 1, 1, 2, 'B.Tech. (Civil Engineering)', '1', 'After 10+2 (12th)', 'P137', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(41, 1, 1, 2, 'B.Tech. (Civil Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P137-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(42, 1, 1, 2, 'B.Tech. (Mechanical Engineering)', '1', 'After 10+2 (12th)', 'P138', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(43, 1, 1, 2, 'B.Tech. (Mechanical Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P138-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(44, 1, 1, 2, 'B.Tech. (ME - Mechatronics) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P138-LN1', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(45, 1, 1, 2, 'B.Tech. (ME - Mechatronics)', '1', 'After 10+2 (12th)', 'P138-NN1', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(46, 1, 1, 2, 'B.Tech. (Automobile Engineering)', '1', 'After 10+2 (12th)', 'P139', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(47, 1, 1, 2, 'B.Tech. (Automobile Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P139-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(48, 1, 1, 2, 'B.Tech. (Electrical and Electronics Engineering)', '1', 'After 10+2 (12th)', 'P13A', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(49, 1, 1, 2, 'B.Tech. (Electrical and Electronics Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P13A-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(50, 1, 1, 2, 'B.Tech. (Chemical Engineering)', '1', 'After 10+2 (12th)', 'P13C', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(51, 1, 1, 2, 'B.Tech. (Chemical Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P13C-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(52, 1, 1, 2, 'B.Tech. (Aerospace Engineering)', '1', 'After 10+2 (12th)', 'P13E', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(53, 1, 1, 2, 'B.Tech. (Aerospace Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P13E-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(54, 1, 1, 2, 'B.Tech. (Biomedical Engineering)', '1', 'After 10+2 (12th)', 'P13O', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:09'),
(55, 1, 1, 2, 'B.Tech. (Biomedical Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P13O-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(56, 1, 1, 2, 'B.Tech. (Food Technology)', '1', 'After 10+2 (12th)', 'P13Q', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(57, 1, 1, 2, 'B.Tech. (Food Technology) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P13Q-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(58, 1, 1, 2, 'B.Tech. (Petroleum Engineering)', '1', 'After 10+2 (12th)', 'P13W', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(59, 1, 1, 2, 'B.Tech. (Petroleum Engineering) [Lateral Entry]', '1', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P13W-L', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(60, 1, 1, 3, 'PGDCA', '2', 'After Graduation', 'P154', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(61, 1, 1, 4, 'M.Sc. (Information Technology)', '2', 'After Graduation', 'P163', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(62, 1, 1, 4, 'M.Sc. (Computer Science)', '2', 'After Graduation', 'P164', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(63, 1, 1, 4, 'M.Tech. (Biotechnology) [Full Time]', '1', 'After Graduation', 'P171', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(64, 1, 1, 4, 'M.Tech. (Computer Science and Engineering) [Full Time]', '3', 'After Graduation', 'P172', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(65, 1, 1, 4, 'M.Tech. (Electronics and Communication Engineering) [Full Time]', '4', 'After Graduation', 'P175', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(66, 1, 1, 4, 'M.Tech. (Automobile Engineering) [Full Time]', '5', 'After Graduation', 'P179', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(67, 1, 1, 4, 'M.Tech. (Data Science and Analytics) [Full Time]', '3', 'After Graduation', 'P17AC', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(68, 1, 1, 4, 'M.Tech. (Information Security and Cyber Forensics) [Full Time]', '3', 'After Graduation', 'P17AD', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(69, 1, 1, 4, 'M.Tech. (VLSI Design) [Full Time]', '4', 'After Graduation', 'P17F', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(70, 1, 1, 4, 'M.Tech. (Power Systems) [Full Time]', '6', 'After Graduation', 'P17J', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(71, 1, 1, 4, 'M.Tech. (Thermal Engineering) [Full Time]', '5', 'After Graduation', 'P17K', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(72, 1, 1, 4, 'M.Tech. (Transportation Engineering) [Full Time]', '7', 'After Graduation', 'P17M', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(73, 1, 1, 4, 'M.Tech. (Structural Engineering) [Full Time]', '7', 'After Graduation', 'P17N', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(74, 1, 1, 4, 'M.Tech. (Food Technology) [Full Time]', '1', 'After Graduation', 'P17Q', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(75, 1, 1, 4, 'M.Tech. (Construction Management) [Full Time]', '7', 'After Graduation', 'P17R', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(76, 1, 1, 4, 'M.Tech. (Robotics) [Full Time]', '5', 'After Graduation', 'P17T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(77, 1, 1, 4, 'M.Tech. (Geotechnical Engineering) [Full Time]', '7', 'After Graduation', 'P17U', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(78, 1, 1, 4, 'M.Tech. (Machine Learning and Artificial Intelligence) [Full Time]', '3', 'After Graduation', 'P17X', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(79, 1, 1, 4, 'M.Tech. (Renewable Energy) [Full Time]', '6', 'After Graduation', 'P17Z', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(80, 1, 1, 4, 'MCA', '2', 'After Graduation', 'P184', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(81, 1, 1, 4, 'MCA (Hons.) [Lateral Entry]', '2', 'Lateral Entry/Other Programmes(After Graduation)', 'P184-D', 88000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(82, 1, 1, 4, 'MCA (Hons.)', '2', 'After Graduation', 'P184-H', 88000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(83, 1, 1, 4, 'MCA [Lateral Entry]', '2', 'Lateral Entry/Other Programmes(After Graduation)', 'P184-L', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:10'),
(84, 1, 1, 5, 'Integrated B.Tech. - M.Tech. (Computer Science & Engineering)', '1', 'After 10+2 (12th)', 'P192-ND', 118000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(85, 1, 1, 5, 'Integrated B.Tech. (Computer Science & Engineering) - MBA', '1', 'After 10+2 (12th)', 'P192-NE', 118000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(86, 1, 1, 2, 'B.Sc. (Hons.) Biotechnology', '8', 'After 10+2 (12th)', 'P220-H', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(87, 1, 1, 2, 'B.Sc. (Hons.) Microbiology', '9', 'After 10+2 (12th)', 'P223-H', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(88, 1, 1, 2, 'B.Sc. (Hons.) Food Technology', '10', 'After 10+2 (12th)', 'P224-H', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(89, 1, 1, 2, 'B.Sc. (Nutrition & Dietetics)', '11', 'After 10+2 (12th)', 'P225', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(90, 1, 1, 2, 'B.Sc. (Hons.) Botany', '12', 'After 10+2 (12th)', 'P22A-HN4', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(91, 1, 1, 2, 'B.Sc. (Hons.) Zoology', '13', 'After 10+2 (12th)', 'P22A-HN5', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(92, 1, 1, 2, 'B.Sc. (Hons.) Chemistry', '14', 'After 10+2 (12th)', 'P22A-HN6', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(93, 1, 1, 2, 'B.Sc. (Hons.) Physics', '15', 'After 10+2 (12th)', 'P22A-HN7', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(94, 1, 1, 2, 'B.Sc. (Hons.) Mathematics', '16', 'After 10+2 (12th)', 'P22A-HN8', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(95, 1, 1, 2, 'B.Sc. (Computer Science)', '2', 'After 10+2 (12th)', 'P22A-NN3', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(96, 1, 1, 2, 'B.Sc. (Forensic Sciences)', '17', 'After 10+2 (12th)', 'P22G', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(97, 1, 1, 2, 'B.Sc. (Hons.) Agriculture', '18', 'After 10+2 (12th)', 'P24B-H', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(98, 1, 1, 4, 'M.Sc. (Hons.) Biotechnology', '8', 'After Graduation', 'P260-H', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(99, 1, 1, 4, 'M.Sc. (Hons.) Botany', '12', 'After Graduation', 'P261-H', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(100, 1, 1, 4, 'M.Sc. (Hons.) Zoology', '13', 'After Graduation', 'P262-H', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(101, 1, 1, 4, 'M.Sc. (Hons.) Microbiology', '9', 'After Graduation', 'P263-H', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(102, 1, 1, 4, 'M.Sc. (Food Science & Technology)', '10', 'After Graduation', 'P264', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(103, 1, 1, 4, 'M.Sc. (Nutrition & Dietetics)', '11', 'After Graduation', 'P265', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(104, 1, 1, 4, 'M.Sc. (Hons.) Chemistry', '14', 'After Graduation', 'P266-H', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(105, 1, 1, 4, 'M.Sc. (Hons.) Physics', '15', 'After Graduation', 'P268-H', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(106, 1, 1, 4, 'M.Sc. (Hons.) Mathematics', '16', 'After Graduation', 'P269-H', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(107, 1, 1, 4, 'M.Sc. Ag. (Agronomy)', '18', 'After Graduation', 'P26B-NN1', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(108, 1, 1, 4, 'M.Sc. Ag. (Soil Science and Agriculture Chemistry)', '18', 'After Graduation', 'P26B-NN2', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(109, 1, 1, 4, 'M.Sc. Ag. (Genetics & Plant Breeding)', '18', 'After Graduation', 'P26B-NN3', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(110, 1, 1, 4, 'M.Sc. Ag. (Entomology)', '18', 'After Graduation', 'P26B-NN5', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(111, 1, 1, 4, 'M.Sc. Ag. (Plant Pathology)', '18', 'After Graduation', 'P26B-NN6', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(112, 1, 1, 4, 'M.Sc. Ag. Horticulture (Fruit Science)', '18', 'After Graduation', 'P26C', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(113, 1, 1, 4, 'M.Sc. Ag. Horticulture (Vegetable Science)', '18', 'After Graduation', 'P26E', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(114, 1, 1, 4, 'M.Sc. Ag. Horticulture (Floriculture and Landscaping)', '18', 'After Graduation', 'P26F-NN1', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(115, 1, 1, 4, 'M.Sc. (Forensic Sciences)', '17', 'After Graduation', 'P26G', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(116, 1, 1, 4, 'M.Sc. (Statistics and Data Analytics)', '16', 'After Graduation', 'P26J', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(117, 1, 1, 5, 'Integrated B.Sc. - B.Ed.', '19', 'After 10+2 (12th)', 'P29A-NK', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(118, 1, 1, 1, 'Diploma in Business Administration', '20', 'After 10th', 'P301', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(119, 1, 1, 1, 'Diploma in Food Production', '21', 'After 10th', 'P304-NN1', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:11'),
(120, 1, 1, 1, 'Diploma in Airline Cabin Crew and Hospitality', '21', 'After 10+2 (12th)', 'P315', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(121, 1, 1, 2, 'BBA (Hons.)', '20', 'After 10+2 (12th)', 'P320-H', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(122, 1, 1, 1, 'Dual Degree BBA (Hons.) - MBA', '20', 'After 10+2 (12th)', 'P320-HE', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(123, 1, 1, 1, 'Dual Degree BBA - MBA', '20', 'After 10+2 (12th)', 'P320-NE', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(124, 1, 1, 2, 'BBA (Information Technology )', '20', 'After 10+2 (12th)', 'P320-NN1', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(125, 1, 1, 2, 'BBA (Tourism & Hospitality)', '21', 'After 10+2 (12th)', 'P320-NN4', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(126, 1, 1, 2, 'BBA (Financial Markets)', '20', 'After 10+2 (12th)', 'P320-NN6', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(127, 1, 1, 2, 'BBA (International Finance)', '20', 'After 10+2 (12th)', 'P320-NNG', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(128, 1, 1, 2, 'BBA', '20', 'After 10+2 (12th)', 'P321', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(129, 1, 1, 2, 'BBA [Lateral Entry]', '20', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P321-L', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(130, 1, 1, 2, 'B.Com.', '22', 'After 10+2 (12th)', 'P322', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(131, 1, 1, 2, 'B.Com. (Hons.)', '22', 'After 10+2 (12th)', 'P322-H', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(132, 1, 1, 1, 'Dual Degree B.Com (Hons.)-MBA', '22', 'After 10+2 (12th)', 'P322-HE', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(133, 1, 1, 2, 'B.Com. [Lateral Entry]', '22', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P322-L', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(134, 1, 1, 2, 'B.Com. (Management Accounting and International Finance)', '22', 'After 10+2 (12th)', 'P322-NN2', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(135, 1, 1, 2, 'B.Sc. (Hons.) Economics', '23', 'After 10+2 (12th)', 'P323-H', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(136, 1, 1, 2, 'B.Sc. (Hotel Management)', '21', 'After 10+2 (12th)', 'P324', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(137, 1, 1, 2, 'B.Sc. (Hotel Management) [Lateral Entry]', '21', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P324-L', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(138, 1, 1, 2, 'B.Sc. (Airlines, Tourism & Hospitality)', '21', 'After 10+2 (12th)', 'P325', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(139, 1, 1, 2, 'B.Sc. (Airlines, Tourism & Hospitality) [Lateral Entry]', '21', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P325-L', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(140, 1, 1, 2, 'Bachelor of Hotel Mgt & Catering Technology (BHMCT)', '21', 'After 10+2 (12th)', 'P344', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(141, 1, 1, 2, 'Bachelor of Hotel Mgt & Catering Technology (BHMCT) [Lateral Entry]', '21', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P344-L', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:12'),
(142, 1, 1, 4, 'M.Com.', '22', 'After Graduation', 'P362', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(143, 1, 1, 4, 'M.Sc. (Hons.) Economics', '23', 'After Graduation', 'P363-H', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(144, 1, 1, 4, 'M.Sc. (Hotel Management)', '21', 'After Graduation', 'P364', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(145, 1, 1, 4, 'MBA (Hons.)', '20', 'After Graduation', 'P370-HNLE', 190000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(146, 1, 1, 4, 'MBA (International Business)', '20', 'After Graduation', 'P370-NN2E', 145000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(147, 1, 1, 4, 'MBA (Hospital & Healthcare Management)', '20', 'After Graduation', 'P370-NN3E', 145000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(148, 1, 1, 4, 'MBA (Tourism and Hospitality)', '21', 'After Graduation', 'P370-NN4', 145000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(149, 1, 1, 4, 'MBA (Financial Markets)', '20', 'After Graduation', 'P370-NN6E', 190000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(150, 1, 1, 4, 'MBA (Supply Chain & Logistics)', '20', 'After Graduation', 'P370-NN7E', 190000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(151, 1, 1, 4, 'MBA (Business Analytics)', '20', 'After Graduation', 'P370-NNBE', 190000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(152, 1, 1, 4, 'MBA', '20', 'After Graduation', 'P371-NNAE', 145000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(153, 1, 1, 2, 'BBA, LL.B. (Hons.){No exit/discontinue option after BBA}', '24', 'After 10+2 (12th)', 'P391-HH', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(154, 1, 1, 5, 'Integrated BBA - MBA', '20', 'After 10+2 (12th)', 'P391-NE', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(155, 1, 1, 2, 'B.Com., LL.B.(Hons.){No exit/discontinue option after B.Com}', '24', 'After 10+2 (12th)', 'P392-HH', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(156, 1, 1, 5, 'Integrated B.Com.- MBA', '22', 'After 10+2 (12th)', 'P392-NE', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(157, 1, 1, 2, 'Bachelor of Arts (B.A.)', '25', 'After 10+2 (12th)', 'P420', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(158, 1, 1, 2, 'B.A. (Hons.) English Political Science History Sociology Geography Psychology Punjabi', '25', 'After 10+2 (12th)', 'P420-H', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(159, 1, 1, 2, 'B.A. (Fine Arts)', '26', 'After 10+2 (12th)', 'P421', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(160, 1, 1, 2, 'B.A. (Music Vocal)', '27', 'After 10+2 (12th)', 'P422-NN5', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(161, 1, 1, 2, 'B.A. (Theatre)', '27', 'After 10+2 (12th)', 'P422-NN7', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(162, 1, 1, 2, 'Bachelor of Fine Arts (BFA)', '26', 'After 10+2 (12th)', 'P441', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(163, 1, 1, 2, 'BPA (Music Vocal)', '27', 'After 10+2 (12th)', 'P442-NN5', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(164, 1, 1, 2, 'BPA (Theatre)', '27', 'After 10+2 (12th)', 'P442-NN7', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(165, 1, 1, 4, 'M.A. (Music Vocal)', '27', 'After Graduation', 'P462-NN5', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(166, 1, 1, 4, 'M.A. (Music Instrumental)', '27', 'After Graduation', 'P462-NNA', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(167, 1, 1, 4, 'M.A. (English)', '28', 'After Graduation', 'P463', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(168, 1, 1, 4, 'M.A. (Punjabi)', '29', 'After Graduation', 'P464', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(169, 1, 1, 4, 'M.A. (History)', '30', 'After Graduation', 'P466', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(170, 1, 1, 4, 'M.A. (Sociology)', '31', 'After Graduation', 'P467', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(171, 1, 1, 4, 'M.A. (Political Science)', '32', 'After Graduation', 'P468', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(172, 1, 1, 4, 'M.Sc. (Geography)', '33', 'After Graduation', 'P469-NN1', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(173, 1, 1, 4, 'M.A. (Psychology)', '34', 'After Graduation', 'P46A', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(174, 1, 1, 4, 'M.A. (Public Administration)', '35', 'After Graduation', 'P46F', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(175, 1, 1, 4, 'M.A. (Clinical Psychology)', '34', 'After Graduation', 'P46G', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(176, 1, 1, 4, 'Master of Fine Arts (MFA)', '26', 'After Graduation', 'P471', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(177, 1, 1, 2, 'B.A., LL.B.(Hons.){No exit/discontinue option after B.A.}', '24', 'After 10+2 (12th)', 'P490-HH', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(178, 1, 1, 5, 'Integrated B.A. - B.Ed.', '19', 'After 10+2 (12th)', 'P490-NK', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:13'),
(179, 1, 1, 6, 'LL.B.', '24', 'After Graduation', 'P4AE', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(180, 1, 1, 6, 'LL.M.', '24', 'After Graduation', 'P4BE-NN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(181, 1, 1, 1, 'Diploma in Medical Lab. Technology (DMLT)', '36', 'After 10th', 'P501', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(182, 1, 1, 1, 'Dual Programme DMLT - B.Sc. (Medical Lab. Technology)', '36', 'After 10th', 'P501-NA', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(183, 1, 1, 2, 'B.Sc. (Medical Laboratory Technology)', '36', 'After 10+2 (12th)', 'P521', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(184, 1, 1, 2, 'B.Sc. (Medical Laboratory Technology) [Lateral Entry]', '36', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P521-L', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(185, 1, 1, 2, 'B.Pharm. [Lateral Entry]', '37', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P540-LNN-D', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(186, 1, 1, 2, 'B.Pharm.', '37', 'After 10+2 (12th)', 'P540-NNN-D', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(187, 1, 1, 2, 'Bachelor of Physiotherapy (BPT)', '38', 'After 10+2 (12th)', 'P542', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(188, 1, 1, 2, 'Bachelor of Physiotherapy (BPT) [Lateral Entry]', '38', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P542-L', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(189, 1, 1, 2, 'B.Pharm. (Ayurveda)', '39', 'After 10+2 (12th)', 'P543', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(190, 1, 1, 2, 'B.Pharm. (Ayurveda) [Lateral Entry]', '39', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P543-L', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(191, 1, 1, 4, 'M.Sc. (Clinical Microbiology)', '36', 'After Graduation', 'P564', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(192, 1, 1, 4, 'M.Sc. (Clinical Biochemistry)', '36', 'After Graduation', 'P565', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(193, 1, 1, 4, 'M.Pharm. (Pharmaceutics)', '37', 'After Graduation', 'P570-NN1-D', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(194, 1, 1, 4, 'M.Pharm. (Pharmacology)', '37', 'After Graduation', 'P570-NN2-D', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(195, 1, 1, 4, 'M.Pharm. (Pharmaceutical Chemistry)', '37', 'After Graduation', 'P570-NN3-D', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(196, 1, 1, 4, 'M.Pharm. (Ayurveda)', '39', 'After Graduation', 'P570-NN7', 68000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(197, 1, 1, 4, 'M.Pharm. (Quality Assurance)', '37', 'After Graduation', 'P570-NN9', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(198, 1, 1, 4, 'M.Pharm. (Pharmaceutical Analysis)', '37', 'After Graduation', 'P570-NNB-D', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(199, 1, 1, 4, 'M.Pharm. (Pharmacy Practice)', '37', 'After Graduation', 'P570-NND-D', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(200, 1, 1, 4, 'MPT (Orthopedics)', '38', 'After Graduation', 'P572-NN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(201, 1, 1, 4, 'MPT (Neurology)', '38', 'After Graduation', 'P572-NN2', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(202, 1, 1, 2, 'B.Sc. (Health and Physical Education)', '40', 'After 10+2 (12th)', 'P622', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(203, 1, 1, 2, 'B.Sc. (Health and Physical Education) [Lateral Entry]', '40', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P622-LN1', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(204, 1, 1, 2, 'Bachelor of Physical Education & Sports (BPES)', '40', 'After 10+2 (12th)', 'P625', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(205, 1, 1, 2, 'B.Ed.', '19', 'After Graduation', 'P6A1', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:14'),
(206, 1, 1, 2, 'B.P.Ed.', '40', 'After Graduation', 'P6A2', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(207, 1, 1, 4, 'M.Ed.', '19', 'After Graduation', 'P6B1', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(208, 1, 1, 4, 'M.P.Ed.', '40', 'After Graduation', 'P6B2', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(209, 1, 1, 5, 'Integrated B.Ed.-M.Ed.', '19', 'After Post Graduation', 'P6F1-NM', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(210, 1, 1, 1, 'Diploma in Architectural Assistantship', '41', 'After 10th', 'P701', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(211, 1, 1, 1, 'Diploma in Architectural Assistantship [Lateral Entry]', '41', 'Lateral Entry/Other Programmes(After ITI etc)', 'P701-L', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(212, 1, 1, 1, 'Dual Programme Diploma in Architectural Assistantship - B.Tech. (Civil Engineering)', '41', 'After 10th', 'P701-NB', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(213, 1, 1, 1, 'Dual Programme Diploma in Architectural Assistantship - B.Design (Interior & Furniture)', '41', 'After 10th', 'P701-NC', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(214, 1, 1, 1, 'Diploma in Fashion Design', '42', 'After 10th', 'P705', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(215, 1, 1, 1, 'Dual Programme Diploma in Fashion Design - B.Design (Fashion)', '42', 'After 10th', 'P705-NC', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(216, 1, 1, 1, 'Diploma in Digital Photography', '26', 'After 10+2 (12th)', 'P714-NN2', 58000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(217, 1, 1, 2, 'B.Sc. (Design - Interior & Furniture) [Lateral Entry]', '43', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P722-LN1', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(218, 1, 1, 2, 'B.Sc. (Design - Fashion) [Lateral Entry]', '42', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P722-LN3', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(219, 1, 1, 2, 'B.Sc. (Design - Interior & Furniture)', '43', 'After 10+2 (12th)', 'P722-NN1', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(220, 1, 1, 2, 'B.Sc. (Design - Fashion)', '42', 'After 10+2 (12th)', 'P722-NN3', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(221, 1, 1, 2, 'B.Sc. (Design - Graphics)', '44', 'After 10+2 (12th)', 'P722-NN5', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(222, 1, 1, 2, 'B.Sc. (Design - Multimedia)', '44', 'After 10+2 (12th)', 'P722-NN7', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(223, 1, 1, 2, 'B.Sc. (Design - Gaming)', '44', 'After 10+2 (12th)', 'P722-NN8', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(224, 1, 1, 2, 'B.A. (Journalism & Mass Communication)', '45', 'After 10+2 (12th)', 'P724', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(225, 1, 1, 2, 'B.Sc. (Film & TV Production)', '45', 'After 10+2 (12th)', 'P727', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(226, 1, 1, 2, 'B. Arch.', '41', 'After 10+2 (12th)', 'P741', 108000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(227, 1, 1, 2, 'B.Design (Interior & Furniture) [Lateral Entry]', '43', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P742-LN1', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(228, 1, 1, 2, 'B.Design (Product & Industrial) [Lateral Entry]', '46', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P742-LN2', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(229, 1, 1, 2, 'B.Design (Fashion) [Lateral Entry]', '42', 'Lateral Entry/Other Programmes(After 3 yrs. Diploma)', 'P742-LN3', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(230, 1, 1, 2, 'B.Design (Interior & Furniture)', '43', 'After 10+2 (12th)', 'P742-NN1', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:15'),
(231, 1, 1, 2, 'B.Design (Product & Industrial)', '46', 'After 10+2 (12th)', 'P742-NN2', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(232, 1, 1, 2, 'B.Design (Fashion)', '42', 'After 10+2 (12th)', 'P742-NN3', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(233, 1, 1, 2, 'B.Design (Graphics)', '44', 'After 10+2 (12th)', 'P742-NN5', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(234, 1, 1, 2, 'B.Design (Film & TV Production)', '45', 'After 10+2 (12th)', 'P742-NN6', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(235, 1, 1, 2, 'B.Design (Multimedia)', '44', 'After 10+2 (12th)', 'P742-NN7', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(236, 1, 1, 2, 'B.Design (Gaming)', '44', 'After 10+2 (12th)', 'P742-NN8', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(237, 1, 1, 2, 'B. Plan.', '47', 'After 10+2 (12th)', 'P743', 98000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(238, 1, 1, 4, 'M.Sc. (Design - Fashion)', '42', 'After Graduation', 'P762-NN3', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(239, 1, 1, 4, 'M.Sc. (Design - Multimedia)', '44', 'After Graduation', 'P762-NN7', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(240, 1, 1, 4, 'M.A. (Journalism & Mass Communication)', '45', 'After Graduation', 'P764', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(241, 1, 1, 4, 'M.Sc. (Film and TV Production)', '45', 'After Graduation', 'P767', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(242, 1, 1, 4, 'M.Design (Interior & Furniture)', '43', 'After Graduation', 'P772-NN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(243, 1, 1, 4, 'M.Design (Product & Industrial)', '46', 'After Graduation', 'P772-NN2', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(244, 1, 1, 4, 'M.Design (Fashion)', '42', 'After Graduation', 'P772-NN3', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(245, 1, 1, 4, 'M.Design (Multimedia)', '44', 'After Graduation', 'P772-NN7', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(246, 1, 1, 4, 'M. Plan.', '47', 'After Graduation', 'P773', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(247, 1, 1, 3, 'Ph.D. (Electronics & Communication Engineering) [Full Time]', '1', 'After Post Graduation-Ph.D', 'P1D5', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(248, 1, 1, 3, 'Ph.D. (Electronics & Communication Engineering) [Part Time]', '1', 'After Post Graduation-Ph.D', 'P1D5-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(249, 1, 1, 3, 'Ph.D. (Electrical Engineering) [Full Time]', '1', 'After Post Graduation-Ph.D', 'P1D6', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(250, 1, 1, 3, 'Ph.D. (Electrical Engineering) [Part Time]', '1', 'After Post Graduation-Ph.D', 'P1D6-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(251, 1, 1, 3, 'Ph.D. (Mechanical Engineering) [Full Time]', '1', 'After Post Graduation-Ph.D', 'P1D8', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(252, 1, 1, 3, 'Ph.D. (Mechanical Engineering) [Part Time]', '1', 'After Post Graduation-Ph.D', 'P1D8-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(253, 1, 1, 3, 'Ph.D. (Chemical Engineering) [Full Time]', '1', 'After Post Graduation-Ph.D', 'P1DC', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(254, 1, 1, 3, 'Ph.D. (Chemical Engineering) [Part Time]', '1', 'After Post Graduation-Ph.D', 'P1DC-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(255, 1, 1, 3, 'Ph.D. (Molecular Biology and Genetic Engineering) [Full Time]', '1', 'After Post Graduation-Ph.D', 'P2DS', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(256, 1, 1, 3, 'Ph.D. (Molecular Biology and Genetic Engineering) [Part Time]', '1', 'After Post Graduation-Ph.D', 'P2DS-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(257, 1, 1, 3, 'Ph.D. (Aerospace Engineering) [Full Time]', '1', 'After Post Graduation-Ph.D', 'P1DE', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(258, 1, 1, 3, 'Ph.D. (Aerospace Engineering) [Part Time]', '1', 'After Post Graduation-Ph.D', 'P1DE-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(259, 1, 1, 3, 'Ph.D. (Geospatial Information Science and Technology) [Full Time]', '1', 'After Post Graduation-Ph.D', 'P1DV', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:16'),
(260, 1, 1, 3, 'Ph.D. (Geospatial Information Science and Technology) [Part Time]', '1', 'After Post Graduation-Ph.D', 'P1DV-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(261, 1, 1, 3, 'Ph.D (Agronomy) [Full Time]', '18', 'After Post Graduation-Ph.D', 'P2DB-NN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(262, 1, 1, 3, 'Ph.D. (Entomology) [Full Time]', '18', 'After Post Graduation-Ph.D', 'P2DB-NN5', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(263, 1, 1, 3, 'Ph.D. Horticulture (Fruit Science)[Full Time]', '18', 'After Post Graduation-Ph.D', 'P2DC-NN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(264, 1, 1, 3, 'Ph.D. (Genetics and Plant Breeding) [Full Time]', '18', 'After Post Graduation-Ph.D', 'P2DB-NN3', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(265, 1, 1, 3, 'Ph.D. (Plant Pathology) [Full Time]', '18', 'After Post Graduation-Ph.D', 'P2DB-NN6', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(266, 1, 1, 3, 'Ph.D. Horticulture (Vegetable Science) [Full Time]', '18', 'After Post Graduation-Ph.D', 'P2DE-NN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(267, 1, 1, 3, 'Ph.D. (Soil Science and Agriculture Chemistry) [Full Time]', '18', 'After Post Graduation-Ph.D', 'P2DB-NN8', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(268, 1, 1, 3, 'Ph.D. (Food Science and Technology) [Full Time]', '10', 'After Post Graduation-Ph.D', 'P2D4-NN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(269, 1, 1, 3, 'Ph.D. (Biotechnology) [Full Time]', '8', 'After Post Graduation-Ph.D', 'P2D0', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(270, 1, 1, 3, 'Ph.D. (Biotechnology) [Part Time]', '8', 'After Post Graduation-Ph.D', 'P2D0-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(271, 1, 1, 3, 'Ph.D. (Microbiology) [Full Time]', '9', 'After Post Graduation-Ph.D', 'P2D3', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(272, 1, 1, 3, 'Ph.D. (Microbiology) [Part Time]', '9', 'After Post Graduation-Ph.D', 'P2D3-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(273, 1, 1, 3, 'Ph.D. (Biochemistry) [Full Time]', '48', 'After Post Graduation-Ph.D', 'P2D7', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(274, 1, 1, 3, 'Ph.D. (Biochemistry) [Part Time]', '48', 'After Post Graduation-Ph.D', 'P2D7-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(275, 1, 1, 3, 'Ph.D. (Botany) [Full Time]', '12', 'After Post Graduation-Ph.D', 'P2D1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(276, 1, 1, 3, 'Ph.D. (Botany) [Part Time]', '12', 'After Post Graduation-Ph.D', 'P2D1-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(277, 1, 1, 3, 'Ph.D. (Zoology) [Full Time]', '13', 'After Post Graduation-Ph.D', 'P2D2', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(278, 1, 1, 3, 'Ph.D. (Zoology) [Part Time]', '13', 'After Post Graduation-Ph.D', 'P2D2-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(279, 1, 1, 3, 'Ph.D. (Chemistry) [Full Time]', '14', 'After Post Graduation-Ph.D', 'P2D6', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(280, 1, 1, 3, 'Ph.D. (Chemistry) [Part Time]', '14', 'After Post Graduation-Ph.D', 'P2D6-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(281, 1, 1, 3, 'Ph.D. (Physics) [Full Time]', '15', 'After Post Graduation-Ph.D', 'P2D8', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(282, 1, 1, 3, 'Ph.D. (Physics) [Part Time]', '15', 'After Post Graduation-Ph.D', 'P2D8-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(283, 1, 1, 3, 'Ph.D. (Mathematics) [Full Time]', '16', 'After Post Graduation-Ph.D', 'P2D9', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:17'),
(284, 1, 1, 3, 'Ph.D. (Mathematics) [Part Time]', '16', 'After Post Graduation-Ph.D', 'P2D9-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(285, 1, 1, 3, 'Ph.D. (Management) [Full Time]', '20', 'After Post Graduation-Ph.D', 'P3D1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(286, 1, 1, 3, 'Ph.D. (Management) [Part Time]', '20', 'After Post Graduation-Ph.D', 'P3D1-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(287, 1, 1, 3, 'Ph.D. (Law) [Full Time]', '24', 'After Post Graduation-Ph.D', 'P4DE', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(288, 1, 1, 3, 'Ph.D. (Law) [Part Time]', '24', 'After Post Graduation-Ph.D', 'P4DE-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(289, 1, 1, 3, 'Ph.D. (Fine Arts) [Full Time]', '26', 'After Post Graduation-Ph.D', 'P4D1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(290, 1, 1, 3, 'Ph.D. (Fine Arts) [Part Time]', '26', 'After Post Graduation-Ph.D', 'P4D1-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(291, 1, 1, 3, 'Ph.D. (Design) [Full Time]', '49', 'After Post Graduation-Ph.D', 'P7D2', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(292, 1, 1, 3, 'Ph.D. (Design) [Part Time]', '49', 'After Post Graduation-Ph.D', 'P7D2-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(293, 1, 1, 3, 'Ph.D. (Journalism and Mass Communication) [Full Time]', '45', 'After Post Graduation-Ph.D', 'P7D4', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(294, 1, 1, 3, 'Ph.D. (Journalism and Mass Communication) [Part Time]', '45', 'After Post Graduation-Ph.D', 'P7D4-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(295, 1, 1, 3, 'Ph.D. (Performing Arts-Music) [Full Time]', '27', 'After Post Graduation-Ph.D', 'P4D2-NN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(296, 1, 1, 3, 'Ph.D. (Performing Arts-Music) [Part Time]', '27', 'After Post Graduation-Ph.D', 'P4D2-TN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(297, 1, 1, 3, 'Ph.D. (Performing Arts-Theatre) [Full Time]', '27', 'After Post Graduation-Ph.D', 'P4D2-NNA', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(298, 1, 1, 3, 'Ph.D. (Performing Arts-Theatre) [Part Time]', '27', 'After Post Graduation-Ph.D', 'P4D2-TNA', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(299, 1, 1, 3, 'Ph.D. (Psychology) [Full Time]', '34', 'After Post Graduation-Ph.D', 'P4DA', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(300, 1, 1, 3, 'Ph.D. (Psychology) [Part Time]', '34', 'After Post Graduation-Ph.D', 'P4DA-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(301, 1, 1, 3, 'Ph.D. (History) [Full Time]', '30', 'After Post Graduation-Ph.D', 'P4D6', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(302, 1, 1, 3, 'Ph.D. (History) [Part Time]', '30', 'After Post Graduation-Ph.D', 'P4D6-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(303, 1, 1, 3, 'Ph.D. (Public Administration) [Full Time]', '35', 'After Post Graduation-Ph.D', 'P4DF', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(304, 1, 1, 3, 'Ph.D. (Public Administration) [Part Time]', '35', 'After Post Graduation-Ph.D', 'P4DF-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(305, 1, 1, 3, 'Ph.D. (Physical Education) [Full Time]', '40', 'After Post Graduation-Ph.D', 'P6D2', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(306, 1, 1, 3, 'Ph.D. (Physical Education) [Part Time]', '40', 'After Post Graduation-Ph.D', 'P6D2-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(307, 1, 1, 3, 'Ph.D. (Pharmaceutics) [Full Time]', '37', 'After Post Graduation-Ph.D', 'P5D0-NN1', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(308, 1, 1, 3, 'Ph.D. (Pharmaceutical Chemistry) [Full Time]', '37', 'After Post Graduation-Ph.D', 'P5D0-NN3', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(309, 1, 1, 3, 'Ph.D. (Pharmaceutical Chemistry) [Part Time]', '37', 'After Post Graduation-Ph.D', 'P5D0-TN3', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(310, 1, 1, 3, 'Ph.D. (Pharmacognosy) [Full Time]', '37', 'After Post Graduation-Ph.D', 'P5D0-NN6', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(311, 1, 1, 3, 'Ph.D. (Pharmacognosy) [Part Time]', '37', 'After Post Graduation-Ph.D', 'P5D0-TN6', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(312, 1, 1, 3, 'Ph.D. (Pharmacology) [Full Time]', '37', 'After Post Graduation-Ph.D', 'P5D0-NN2', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(313, 1, 1, 3, 'Ph.D. (Pharmacology) [Part Time]', '37', 'After Post Graduation-Ph.D', 'P5D0-TN2', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:18'),
(314, 1, 1, 3, 'Ph.D. (Ayurvedic Pharmacy) [Full Time]', '39', 'After Post Graduation-Ph.D', 'P5D0-NN8', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:19'),
(315, 1, 1, 3, 'Ph.D. (Ayurvedic Pharmacy) [Part Time]', '39', 'After Post Graduation-Ph.D', 'P5D0-TN8', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:19'),
(316, 1, 1, 3, 'Ph.D. (Clinical Microbiology) [Full Time]', '36', 'After Post Graduation-Ph.D', 'P5D4', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:19'),
(317, 1, 1, 3, 'Ph.D. (Clinical Microbiology) [Part Time]', '36', 'After Post Graduation-Ph.D', 'P5D4-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:19'),
(318, 1, 1, 3, 'Ph.D. (Clinical Biochemistry) [Full Time]', '36', 'After Post Graduation-Ph.D', 'P5D5', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:19'),
(319, 1, 1, 3, 'Ph.D. (Clinical Biochemistry) [Part Time]', '36', 'After Post Graduation-Ph.D', 'P5D5-T', 78000, '0000-00-00 00:00:00', '2020-08-18 03:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'student', NULL, NULL),
(3, 'counselor', '2020-07-11 06:34:56', '2020-07-11 06:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `student_lists`
--

CREATE TABLE `student_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `counselor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `program_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone_home` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_code` int(11) DEFAULT NULL,
  `present_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_profession` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_profession` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

--
-- Dumping data for table `student_lists`
--

INSERT INTO `student_lists` (`id`, `user_id`, `counselor_id`, `program_id`, `phone_home`, `student_code`, `present_address`, `permanent_address`, `f_name`, `f_profession`, `f_contact`, `m_name`, `m_profession`, `m_contact`, `passport_no`, `ssc`, `hsc`, `hons`, `masters`, `others`, `additional_skill`, `additional_skill_score`, `nid`, `b_reg_no`, `is_deleted`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 8, NULL, 14, NULL, NULL, 'kjsdf', NULL, 'father', 'f pro', '01230023001', 'mom', 'm pto', '10530023001', '41651465', '{\"group\":\"Arts\",\"gpa\":\"5.00\",\"year\":\"2008\",\"institution\":\"BS Ideal\"}', '{\"group\":\"Business Studies\",\"gpa\":\"4.30\",\"year\":\"2010\",\"institution\":\"hmmc\"}', '{\"group\":null,\"gpa\":null,\"year\":null,\"institution\":null}', '{\"group\":null,\"gpa\":null,\"year\":null,\"institution\":null}', '{\"title\":null,\"group\":null,\"gpa\":null,\"year\":null,\"institution\":null}', 'IELTS', '8.5', NULL, NULL, 0, 'new_leads', 1, NULL, NULL, '2020-08-11 04:41:55', '2020-08-11 04:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Engineering', 1, NULL, '2020-08-10 12:27:05', '2020-08-10 12:27:05'),
(2, 'Computer Applications', 1, NULL, '2020-08-10 12:28:34', '2020-08-10 12:28:34'),
(3, 'Engineering (CSE)', NULL, NULL, '2020-08-18 03:46:35', '2020-08-18 03:46:35'),
(4, 'Engineering (ECE)', NULL, NULL, '2020-08-18 03:46:36', '2020-08-18 03:46:36'),
(5, 'Engineering (ME)', NULL, NULL, '2020-08-18 03:46:36', '2020-08-18 03:46:36'),
(6, 'Engineering (EE)', NULL, NULL, '2020-08-18 03:46:36', '2020-08-18 03:46:36'),
(7, 'Engineering (CE)', NULL, NULL, '2020-08-18 03:46:36', '2020-08-18 03:46:36'),
(8, 'Biotechnology', NULL, NULL, '2020-08-18 03:46:36', '2020-08-18 03:46:36'),
(9, 'Microbiology', NULL, NULL, '2020-08-18 03:46:36', '2020-08-18 03:46:36'),
(10, 'Food Technology', NULL, NULL, '2020-08-18 03:46:36', '2020-08-18 03:46:36'),
(11, 'Nutrition & Dietetics', NULL, NULL, '2020-08-18 03:46:37', '2020-08-18 03:46:37'),
(12, 'Botany', NULL, NULL, '2020-08-18 03:46:37', '2020-08-18 03:46:37'),
(13, 'Zoology', NULL, NULL, '2020-08-18 03:46:37', '2020-08-18 03:46:37'),
(14, 'Chemistry', NULL, NULL, '2020-08-18 03:46:37', '2020-08-18 03:46:37'),
(15, 'Physics', NULL, NULL, '2020-08-18 03:46:37', '2020-08-18 03:46:37'),
(16, 'Mathematics', NULL, NULL, '2020-08-18 03:46:37', '2020-08-18 03:46:37'),
(17, 'Forensic Sciences', NULL, NULL, '2020-08-18 03:46:37', '2020-08-18 03:46:37'),
(18, 'Agriculture', NULL, NULL, '2020-08-18 03:46:37', '2020-08-18 03:46:37'),
(19, 'Education', NULL, NULL, '2020-08-18 03:46:38', '2020-08-18 03:46:38'),
(20, 'Management', NULL, NULL, '2020-08-18 03:46:38', '2020-08-18 03:46:38'),
(21, 'Hotel Management & Tourism', NULL, NULL, '2020-08-18 03:46:39', '2020-08-18 03:46:39'),
(22, 'Commerce', NULL, NULL, '2020-08-18 03:46:39', '2020-08-18 03:46:39'),
(23, 'Economics', NULL, NULL, '2020-08-18 03:46:39', '2020-08-18 03:46:39'),
(24, 'Law', NULL, NULL, '2020-08-18 03:46:39', '2020-08-18 03:46:39'),
(25, 'Arts (Humanities)', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(26, 'Fine Arts', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(27, 'Performing Arts', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(28, 'English & Foreign Languages', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(29, 'Indian Languages', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(30, 'History', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(31, 'Sociology', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(32, 'Political Science', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(33, 'Geography', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(34, 'Psychology', NULL, NULL, '2020-08-18 03:46:40', '2020-08-18 03:46:40'),
(35, 'Public Administration', NULL, NULL, '2020-08-18 03:46:41', '2020-08-18 03:46:41'),
(36, 'Medical Laboratory Sciences', NULL, NULL, '2020-08-18 03:46:41', '2020-08-18 03:46:41'),
(37, 'Pharmaceutical Sciences', NULL, NULL, '2020-08-18 03:46:41', '2020-08-18 03:46:41'),
(38, 'Physiotherapy', NULL, NULL, '2020-08-18 03:46:42', '2020-08-18 03:46:42'),
(39, 'Ayurvedic Pharmaceutical Sciences', NULL, NULL, '2020-08-18 03:46:42', '2020-08-18 03:46:42'),
(40, 'Physical Education', NULL, NULL, '2020-08-18 03:46:42', '2020-08-18 03:46:42'),
(41, 'Architecture', NULL, NULL, '2020-08-18 03:46:42', '2020-08-18 03:46:42'),
(42, 'Fashion Design', NULL, NULL, '2020-08-18 03:46:43', '2020-08-18 03:46:43'),
(43, 'Interior & Furniture Design', NULL, NULL, '2020-08-18 03:46:43', '2020-08-18 03:46:43'),
(44, 'Multimedia & Animation', NULL, NULL, '2020-08-18 03:46:43', '2020-08-18 03:46:43'),
(45, 'Journalism & Film Production', NULL, NULL, '2020-08-18 03:46:43', '2020-08-18 03:46:43'),
(46, 'Product & Industrial Design', NULL, NULL, '2020-08-18 03:46:43', '2020-08-18 03:46:43'),
(47, 'Planning', NULL, NULL, '2020-08-18 03:46:43', '2020-08-18 03:46:43'),
(48, 'Biochemistry', NULL, NULL, '2020-08-18 03:46:43', '2020-08-18 03:46:43'),
(49, 'Design', NULL, NULL, '2020-08-18 03:46:44', '2020-08-18 03:46:44');

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `name`, `logo_image`, `status`, `country_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'LOVELY PROFESSIONAL UNIVERSITY', '/storage/university.png', 1, 2, NULL, '2020-08-10 12:14:59', '2020-08-10 12:14:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role_id`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'M R RAHMAN', 1, 'admin@siabd.com', '01830023001', NULL, '$2y$10$8M/my8jlOJrwkj1FSZuDYO8rKhKo0FjTf8TeLcl1Cac3ra6f6d6w6', NULL, '2020-06-21 11:14:55', '2020-06-21 11:14:55'),
(2, 'counselorMIA', 3, 'counselor@gmail.com', '01810000000', NULL, '$2y$10$8M/my8jlOJrwkj1FSZuDYO8rKhKo0FjTf8TeLcl1Cac3ra6f6d6w6', NULL, '2020-07-08 07:15:04', '2020-07-08 07:15:04'),
(4, 'Namandsds', 2, 'adcd@gmd.cj', 'kjsdbfbfjksdbfbfjkd', NULL, '$2y$10$wBn2nZJNKJi9GCGhk6TVnuivWKEcsK4L8K/fMd4hkfz5sgTZS9bUe', NULL, '2020-07-08 07:34:16', '2020-07-08 07:34:16'),
(7, 'newStu', 2, 'student@gmail.com', '01730023001', NULL, '$2y$10$j6SMqTQ3yXxz4eVzLeYOeuwN1e0IH/LMwmzOJ2BkZe1V30cmzmkcm', NULL, '2020-08-09 09:57:05', '2020-08-09 09:57:05'),
(8, 'Jamal Uddin', 2, 'jamal@gmail.com', '01330023001', NULL, '$2y$10$Lc6hq8ctvyVpnmUskH7gIOd3885Zs./xpZVdXgXxM8FamaH8cy37W', NULL, '2020-08-11 04:41:55', '2020-08-11 04:41:55'),
(9, 'new Counselor', 3, 'newcounselor@gmail.com', '01430023001', NULL, '$2y$10$HlrfWG5.dQnV1K8OUxv3bOmMSnbM8NHxRDSKAdJrjYTAjxnVOefTu', NULL, '2020-08-16 00:22:08', '2020-08-16 00:22:08'),
(10, 'acb', 3, 'wdf@sdf.cvd', '01523232323', NULL, '$2y$10$E1GSzPflVINlgb8WlhEfAOfP9eoYXjJDE14usPNqItVujDbixQ5uW', NULL, '2020-08-16 00:25:02', '2020-08-16 00:25:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cash_books`
--
ALTER TABLE `cash_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_books_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `cost_types`
--
ALTER TABLE `cost_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_upload_titles`
--
ALTER TABLE `default_upload_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `degree_types`
--
ALTER TABLE `degree_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cash_books`
--
ALTER TABLE `cash_books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cost_types`
--
ALTER TABLE `cost_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `default_upload_titles`
--
ALTER TABLE `default_upload_titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `degree_types`
--
ALTER TABLE `degree_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_lists`
--
ALTER TABLE `student_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cash_books`
--
ALTER TABLE `cash_books`
  ADD CONSTRAINT `cash_books_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
