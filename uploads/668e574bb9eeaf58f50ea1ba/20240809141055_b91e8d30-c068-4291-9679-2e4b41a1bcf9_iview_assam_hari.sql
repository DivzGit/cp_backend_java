-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2024 at 07:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iview_assam_hari`
--

-- --------------------------------------------------------

--
-- Table structure for table `ba_approver_lists`
--

CREATE TABLE `ba_approver_lists` (
  `id` int(11) NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `priority_level` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ba_approver_lists`
--

INSERT INTO `ba_approver_lists` (`id`, `org_id`, `priority_level`) VALUES
(1, 4, '[{\"level\":1,\"user_id\":179},{\"level\":2,\"user_id\":180},{\"level\":3,\"user_id\":181},{\"level\":4,\"user_id\":182},{\"level\":5,\"user_id\":182}]'),
(2, 5, '[{\"level\":1,\"user_id\":183},{\"level\":2,\"user_id\":179},{\"level\":2,\"user_id\":180},{\"level\":3,\"user_id\":181},{\"level\":4,\"user_id\":182}]');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `updated_at`, `created_at`) VALUES
(1, 'capex', 0, '2022-05-02 23:09:36', '2022-05-02 23:09:36'),
(2, 'others', 0, '2022-05-02 23:09:36', '2022-05-02 23:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `checklists`
--

CREATE TABLE `checklists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `master_id` varchar(255) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `checkbox_for` varchar(255) DEFAULT NULL,
  `checkbox_label` varchar(255) DEFAULT NULL,
  `checkbox_value` varchar(255) DEFAULT NULL,
  `weightage` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'HEPL', NULL, NULL, NULL),
(2, 'CITPL', NULL, NULL, NULL),
(3, 'SITPL', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_status`, `created_at`, `updated_at`) VALUES
(1, 'USD', 1, NULL, '2022-10-20 01:07:02'),
(2, 'LKR', 1, '2022-10-10 22:50:47', '2022-10-20 01:07:06'),
(3, 'Euro', 1, '2022-10-10 22:50:58', '2022-10-11 02:00:10'),
(4, 'Dhaka', 1, '2022-10-10 22:59:56', '2022-10-11 01:58:54'),
(5, 'AED', 1, '2022-10-11 02:01:17', '2022-10-11 02:01:17'),
(8, 'JPY', 1, '2022-10-11 02:09:05', '2022-10-11 02:09:05'),
(11, 'RS', 1, '2022-10-20 00:56:01', '2022-10-20 00:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `created_at`, `deleted_at`) VALUES
(1, 'Internal Audit', '2022-11-09 13:14:50', '2022-11-09 13:14:50'),
(2, 'Accounts', '2022-11-09 13:14:50', '2022-11-09 13:14:50'),
(3, 'IT Infra', '2022-11-09 13:15:09', '2022-11-09 13:15:09'),
(4, 'Packaging & Designing', '2022-11-09 13:15:09', '2022-11-09 13:15:09'),
(5, 'Digifox', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(6, 'HR-Core', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(7, 'HR- L&D', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(8, 'HR-SSC', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(9, 'ADMIN', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(10, 'SOCIAL ANTS', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(11, 'OPERATION', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(12, 'CK Institution', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(13, 'IT software', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(14, 'HR', '2023-01-11 19:42:08', '2023-01-11 19:42:08'),
(15, 'Customer Success', '2023-01-11 19:44:39', '2023-01-11 19:44:39'),
(16, 'Sales', '2023-01-11 19:44:39', '2023-01-11 19:44:39'),
(17, 'CITPL', '2023-01-11 19:45:11', '2023-01-11 19:45:11'),
(18, 'Business Head', '2023-01-11 19:45:11', '2023-01-11 19:45:11');

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
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `feedback_type` int(11) DEFAULT NULL COMMENT '1=>assign feeback 2=>reject feedback	',
  `feedback` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `invoice_id` int(11) DEFAULT NULL,
  `assigned_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `feedback_type`, `feedback`, `created_at`, `updated_at`, `invoice_id`, `assigned_by`) VALUES
(1, 1, 'das', '2024-07-16 05:26:52', '2024-07-16 05:26:52', 3, 3),
(2, 1, NULL, '2024-07-16 07:36:26', '2024-07-16 07:36:26', 7, 3),
(3, 1, 're', '2024-07-16 07:38:20', '2024-07-16 07:38:20', 6, 3),
(4, 2, 'sad', '2024-07-18 07:07:22', '2024-07-18 07:07:22', 8, 3),
(5, 1, 'rw', '2024-07-18 07:10:53', '2024-07-18 07:10:53', 4, 3),
(6, 100, 'asd', '2024-07-18 07:40:18', '2024-07-18 07:40:18', 4, 1),
(7, 1, 'test', '2024-07-18 09:19:39', '2024-07-18 09:19:39', 8, 3),
(8, 100, 'sdfg', '2024-07-18 12:20:50', '2024-07-18 12:20:50', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `first`
--

CREATE TABLE `first` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `org_pkey` int(11) DEFAULT NULL,
  `ticket_id` varchar(255) DEFAULT NULL,
  `invoice_id` varchar(255) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `role_assigned` int(11) DEFAULT NULL,
  `assigned_to_checker` int(11) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `document_orginal_name` varchar(255) DEFAULT NULL,
  `document_ext` varchar(255) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `document_url` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uploaded_at` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT 'deleted-0\r\napprovel-flow\r\nscanner file upload - 1\r\nscanner assign to ba- 2\r\nba to ba- 3\r\nba to bm - 4\r\nbm to bm - 5\r\nbm to fs - 6\r\nfs to fp - 7\r\nfp to fp - 8\r\nfp to ba - 9\r\n\r\nReject flow\r\n \r\nba to sc-11\r\nbm to ba-12\r\nfs to bm -13\r\nfp to fs -14\r\nba to ba-15\r\nfp to ba-16\r\nfp to bm-17\r\nticket closed - 100',
  `reason_for_reject` varchar(50) DEFAULT NULL,
  `rejected` int(11) DEFAULT NULL,
  `feedback_id` int(11) DEFAULT NULL,
  `revert_status` int(11) DEFAULT NULL,
  `reverted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `scanner_id` int(11) DEFAULT NULL,
  `ba_id` int(11) DEFAULT NULL,
  `fp_id` int(11) DEFAULT NULL,
  `ba_approvers` longtext DEFAULT NULL,
  `invoice_name` varchar(255) DEFAULT NULL,
  `invoice_amount` varchar(255) DEFAULT NULL,
  `invoice_description` varchar(255) DEFAULT NULL,
  `invoice_date` varchar(255) DEFAULT NULL,
  `po_no` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `po_type` int(11) DEFAULT NULL,
  `grn_no` varchar(255) DEFAULT NULL,
  `grn_value` varchar(50) DEFAULT NULL,
  `grn_date` date DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `sap_ref` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `scanner_checklists_status` int(11) DEFAULT NULL,
  `scanner_remark` varchar(250) DEFAULT NULL,
  `ba_remark` varchar(250) DEFAULT NULL,
  `ba_reason` varchar(250) DEFAULT NULL,
  `bh_to_bm` varchar(250) DEFAULT NULL,
  `bm_to_fs` varchar(250) DEFAULT NULL,
  `fs_to_fm` varchar(250) DEFAULT NULL,
  `fs_to_fc` varchar(250) DEFAULT NULL,
  `fm_to_fc` varchar(250) DEFAULT NULL,
  `fc_to_qc` varchar(250) DEFAULT NULL,
  `fp_to_ba` text DEFAULT NULL,
  `qcmark` varchar(255) DEFAULT NULL,
  `completed_date` varchar(255) DEFAULT NULL,
  `onhold_status` tinyint(1) DEFAULT 0,
  `onhold_by` int(11) DEFAULT NULL,
  `qc_verified` tinyint(1) DEFAULT 0,
  `qc_status` int(11) DEFAULT NULL,
  `sap_posting_date` date DEFAULT NULL,
  `sap_posted_by` int(11) DEFAULT NULL,
  `invoice_value` varchar(255) DEFAULT NULL,
  `vendor_gst` varchar(255) DEFAULT NULL,
  `gate_entry_no` int(11) DEFAULT NULL,
  `gate_entry_date` date DEFAULT NULL,
  `document_no` text DEFAULT NULL,
  `document_type` int(11) DEFAULT NULL COMMENT '1-RE\r\n2-AA\r\n3-KN\r\n4-ZE\r\n5-SA\r\n6-AB\r\n7-CP',
  `ir_no` varchar(250) DEFAULT NULL,
  `processstatus` varchar(255) DEFAULT NULL,
  `revalidated_by` int(11) DEFAULT NULL,
  `req_gst_applicable` int(11) DEFAULT NULL,
  `scanner_gst_applicable` int(11) DEFAULT NULL,
  `channel` int(11) DEFAULT NULL COMMENT '1=>green 2=>yellow	',
  `req_channel` int(11) DEFAULT NULL COMMENT '1=>green 2=>yellow 3=>Red	',
  `req_id` varchar(255) DEFAULT NULL,
  `utr_attachment` varchar(255) DEFAULT NULL,
  `flow_status` int(11) DEFAULT NULL COMMENT 'deleted-0\r\napprovel flow\r\nscanner file upload - 1\r\nscanner assign to ba- 2\r\nba to ba- 3\r\nba to bm - 4\r\nbm to bm - 5\r\nbm to fs - 6\r\nfs to fp - 7\r\nfp to fp - 8\r\nfp to ba - 9\r\n\r\n\r\nreject flow\r\nba to sc-11\r\nbm to ba-12\r\nfs to bm -13\r\nfp to fs -14\r\nba to ba-15\r\nfp to ba-16\r\nfp to bm-17\r\nticket closed - 100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `organization_id`, `org_pkey`, `ticket_id`, `invoice_id`, `uploaded_by`, `assigned_to`, `role_assigned`, `assigned_to_checker`, `document_name`, `document_orginal_name`, `document_ext`, `document_path`, `document_url`, `invoice_no`, `remarks`, `password`, `uploaded_at`, `status`, `reason_for_reject`, `rejected`, `feedback_id`, `revert_status`, `reverted_by`, `created_at`, `updated_at`, `deleted_at`, `assigned_by`, `scanner_id`, `ba_id`, `fp_id`, `ba_approvers`, `invoice_name`, `invoice_amount`, `invoice_description`, `invoice_date`, `po_no`, `attachment`, `po_type`, `grn_no`, `grn_value`, `grn_date`, `vendor_name`, `sap_ref`, `category_id`, `scanner_checklists_status`, `scanner_remark`, `ba_remark`, `ba_reason`, `bh_to_bm`, `bm_to_fs`, `fs_to_fm`, `fs_to_fc`, `fm_to_fc`, `fc_to_qc`, `fp_to_ba`, `qcmark`, `completed_date`, `onhold_status`, `onhold_by`, `qc_verified`, `qc_status`, `sap_posting_date`, `sap_posted_by`, `invoice_value`, `vendor_gst`, `gate_entry_no`, `gate_entry_date`, `document_no`, `document_type`, `ir_no`, `processstatus`, `revalidated_by`, `req_gst_applicable`, `scanner_gst_applicable`, `channel`, `req_channel`, `req_id`, `utr_attachment`, `flow_status`) VALUES
(3, 1, 3, 'assam-0724/00003', NULL, 2, 24, NULL, NULL, 'assam-0724-00003.png', 'pngtree-boy-character-cartoon-3d-png-image_9125458.png', 'png', 'upload/invoice_document/26/', 'http://127.0.0.1/upload/invoice_document/26/1601935718.png', '96', NULL, NULL, '2024-07-15', 7, NULL, NULL, NULL, NULL, NULL, '2024-07-15 09:33:57', '2024-07-16 05:26:52', NULL, 3, 2, 3, NULL, NULL, NULL, NULL, NULL, '2012-06-29', NULL, 'D:\\xampp\\tmp\\php45AF.tmp', 2, NULL, NULL, NULL, 'Wing Haney', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'das', 'das', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(4, 1, 4, 'assam-0724/00004', NULL, 2, 1, NULL, NULL, 'assam-0724-00004.png', 'pngtree-boy-character-cartoon-3d-png-image_9125458.png', 'png', 'upload/invoice_document/26/', 'http://127.0.0.1/upload/invoice_document/26/1807828869.png', '345', NULL, NULL, '2024-07-15', 100, NULL, NULL, NULL, NULL, NULL, '2024-07-15 12:12:33', '2024-07-18 07:40:18', NULL, 1, 2, 3, 1, NULL, NULL, NULL, NULL, '2024-07-15', NULL, 'D:\\xampp\\tmp\\phpE31A.tmp', 2, NULL, NULL, NULL, 'new', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rw', 'rw', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, '2024-07-18', 1, NULL, NULL, NULL, NULL, '345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100),
(5, 2, 1, 'haridwar-0724/00001', NULL, 2, NULL, NULL, NULL, 'haridwar-0724-00001.png', 'image (2).png', 'png', 'upload/invoice_document/30/', 'http://127.0.0.1/upload/invoice_document/30/1574151682.png', NULL, NULL, NULL, '2024-07-16', 1, NULL, NULL, NULL, NULL, NULL, '2024-07-16 06:40:54', '2024-07-16 06:40:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 1, 5, 'assam-0724/00005', NULL, 2, 24, NULL, NULL, 'assam-0724-00005.png', 'image (2).png', 'png', 'upload/invoice_document/2/', 'http://127.0.0.1/upload/invoice_document/2/1004778441.png', NULL, NULL, NULL, '2024-07-16', 7, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:32:51', '2024-07-16 07:38:20', NULL, 3, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, '100', NULL, 1, '30', 'Sed dolor incididunt', '2024-07-16', 'Stuart Walton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 're', 're', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(7, 1, 6, 'assam-0724/00006', NULL, 2, 24, NULL, NULL, 'assam-0724-00006.png', 'image (2).png', 'png', 'upload/invoice_document/2/', 'http://127.0.0.1/upload/invoice_document/2/1866404218.png', '70', NULL, NULL, '2024-07-16', 7, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:34:41', '2024-07-16 07:36:26', NULL, 3, 2, 3, NULL, NULL, NULL, NULL, NULL, '2024-07-16', NULL, 'non_po_upload/336855466.png', 2, NULL, NULL, NULL, 'Oprah Maldonado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Voluptas expedita ei', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(8, 1, 7, 'assam-0724/00007', NULL, 2, 1, NULL, NULL, 'assam-0724-00007.png', 'pngtree-boy-character-cartoon-3d-png-image_9125458.png', 'png', 'upload/invoice_document/2/', 'http://127.0.0.1/upload/invoice_document/2/641088950.png', '435', NULL, NULL, '2024-07-18', 100, 'sad', NULL, NULL, NULL, NULL, '2024-07-18 05:31:04', '2024-07-18 12:20:50', NULL, 1, 2, 3, 1, NULL, NULL, NULL, NULL, '2024-07-18', NULL, NULL, 2, NULL, NULL, NULL, 'new', NULL, NULL, NULL, NULL, NULL, 'sad', NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, '2024-07-18', 1, '3543', NULL, NULL, NULL, '435', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100),
(9, 1, 8, 'assam-0724/00008', NULL, 2, 1, NULL, NULL, 'assam-0724-00008.png', 'image (3).png', 'png', 'upload/invoice_document/2/', 'http://127.0.0.1/upload/invoice_document/2/1998947825.png', NULL, NULL, NULL, '2024-07-18', 2, NULL, NULL, NULL, NULL, NULL, '2024-07-18 12:44:38', '2024-07-22 09:15:25', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '62', NULL, 1, '93', 'Vel beatae in rem is', '1991-12-23', 'Tatiana Faulkner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(10, 1, 9, 'assam-0724/00009', NULL, 2, NULL, NULL, NULL, 'assam-0724-00009.png', 'image (3).png', 'png', 'upload/invoice_document/2/', 'http://127.0.0.1/upload/invoice_document/2/1629727733.png', NULL, NULL, NULL, '2024-07-22', 1, NULL, NULL, NULL, NULL, NULL, '2024-07-22 09:28:32', '2024-07-22 09:28:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_activities`
--

CREATE TABLE `invoice_activities` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `req_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `activity` text DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `ticket_status` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_activities`
--

INSERT INTO `invoice_activities` (`id`, `organization_id`, `invoice_id`, `req_id`, `user_id`, `role`, `activity`, `remark`, `ticket_status`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, NULL, 26, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-15 05:16:34', '2024-07-15 05:16:34'),
(2, NULL, 2, NULL, 26, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-15 06:46:21', '2024-07-15 06:46:21'),
(3, NULL, 2, NULL, 26, 'scanner', 'Scanner Assign Ticket toArijit Saha(arijit.s@cavinkare.com)', 'sad', 1, 1, '2024-07-15 09:28:53', '2024-07-15 09:28:53'),
(4, NULL, 3, NULL, 26, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-15 09:33:57', '2024-07-15 09:33:57'),
(5, NULL, 3, NULL, 26, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-15 12:10:43', '2024-07-15 12:10:43'),
(6, NULL, 4, NULL, 26, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-15 12:12:33', '2024-07-15 12:12:33'),
(7, NULL, 4, NULL, 26, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-15 12:19:03', '2024-07-15 12:19:03'),
(8, NULL, 3, NULL, 3, 'Bisiness Approver', 'Bisiness Approver Approved Ticket toPrabhu R(erodecash@cavinkare.com)', 'das', 1, 1, '2024-07-16 05:26:52', '2024-07-16 05:26:52'),
(9, NULL, 5, NULL, 30, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-16 06:40:54', '2024-07-16 06:40:54'),
(10, NULL, 6, NULL, 2, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-16 07:32:51', '2024-07-16 07:32:51'),
(11, NULL, 6, NULL, 2, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-16 07:34:28', '2024-07-16 07:34:28'),
(12, NULL, 7, NULL, 2, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-16 07:34:41', '2024-07-16 07:34:41'),
(13, NULL, 7, NULL, 2, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-16 07:35:11', '2024-07-16 07:35:11'),
(14, NULL, 7, NULL, 3, 'Bisiness Approver', 'Bisiness Approver Approved Ticket toPrabhu R(erodecash@cavinkare.com)', NULL, 1, 1, '2024-07-16 07:36:26', '2024-07-16 07:36:26'),
(15, NULL, 6, NULL, 3, 'Bisiness Approver', 'Bisiness Approver Approved Ticket toPrabhu R(erodecash@cavinkare.com)', 're', 1, 1, '2024-07-16 07:38:20', '2024-07-16 07:38:20'),
(16, NULL, 8, NULL, 2, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-18 05:31:04', '2024-07-18 05:31:04'),
(17, NULL, 8, NULL, 2, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-18 06:45:57', '2024-07-18 06:45:57'),
(18, NULL, 8, NULL, 2, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-18 06:57:40', '2024-07-18 06:57:40'),
(19, NULL, 8, NULL, 3, 'Business-Approver', 'Business-Approver Reverted Ticket toDaniel Jothikumar.G(erodetanker@cavinkare.com)', 'sad', 2, 1, '2024-07-18 07:07:22', '2024-07-18 07:07:22'),
(20, NULL, 4, NULL, 3, 'Bisiness Approver', 'Bisiness Approver Approved Ticket toGanesan N(sganesan@cavinkare.com)', 'rw', 1, 1, '2024-07-18 07:10:53', '2024-07-18 07:10:53'),
(21, NULL, 4, NULL, 1, 'Finance-Processor', 'Finance-Processor  Ticket Closed', 'asd', 1, 1, '2024-07-18 07:40:18', '2024-07-18 07:40:18'),
(22, NULL, 8, NULL, 2, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-18 07:41:32', '2024-07-18 07:41:32'),
(23, NULL, 8, NULL, 2, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-18 07:42:01', '2024-07-18 07:42:01'),
(24, NULL, 8, NULL, 2, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-18 07:42:42', '2024-07-18 07:42:42'),
(25, NULL, 8, NULL, 2, 'scanner', 'Scanner Assign Ticket toRathinavel.P(rathinavel.p@hepl.com)', NULL, 1, 1, '2024-07-18 07:53:42', '2024-07-18 07:53:42'),
(26, NULL, 8, NULL, 3, 'Bisiness Approver', 'Bisiness Approver Approved Ticket toGanesan N(sganesan@cavinkare.com)', 'test', 1, 1, '2024-07-18 09:19:39', '2024-07-18 09:19:39'),
(27, NULL, 8, NULL, 1, 'Finance-Processor', 'Finance-Processor  Ticket Closed', 'sdfg', 1, 1, '2024-07-18 12:20:50', '2024-07-18 12:20:50'),
(28, NULL, 9, NULL, 2, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-18 12:44:38', '2024-07-18 12:44:38'),
(29, NULL, 9, NULL, 2, 'scanner', 'Scanner Assign Ticket toGanesan N(vicky@hepl.com)', NULL, 1, 1, '2024-07-22 09:15:25', '2024-07-22 09:15:25'),
(30, NULL, 10, NULL, 2, 'scanner', 'Uploading Document', '', 1, 0, '2024-07-22 09:28:32', '2024-07-22 09:28:32');

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
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('99f4c14f-e9d8-4802-a173-8e7736d6deff', '', 3, 0, 0, '[]', 'a:0:{}', NULL, 1692764943, 1692764943),
('99f4c1b4-b8a7-4edb-9170-e9f8c09cf3a7', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1692765009, 1692765009),
('99f4c461-a16f-4e19-ba86-51bd8a1213ac', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1692765458, 1692765458);

-- --------------------------------------------------------

--
-- Table structure for table `masters`
--

CREATE TABLE `masters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `master_value` varchar(255) DEFAULT NULL,
  `role_slug` varchar(255) DEFAULT NULL,
  `alias_name` varchar(255) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `master_for` varchar(255) DEFAULT NULL COMMENT '1-admin\r\n3-scanner\r\n4-bm\r\n6-fs\r\n7-fc\r\n8-fp\r\n10-bh_budget_amount\r\n\r\n',
  `file_needs` varchar(255) DEFAULT NULL,
  `text_needs` varchar(255) DEFAULT NULL,
  `check_box_for` varchar(255) DEFAULT NULL,
  `checkbox_value1` varchar(255) DEFAULT NULL,
  `checkbox_value2` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `masters`
--

INSERT INTO `masters` (`id`, `org_id`, `created_at`, `updated_at`, `master_value`, `role_slug`, `alias_name`, `mark`, `master_for`, `file_needs`, `text_needs`, `check_box_for`, `checkbox_value1`, `checkbox_value2`, `status`) VALUES
(1, NULL, '2022-03-30 05:22:48', '2022-03-30 05:22:48', 'Admin', 'admin', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, '2022-03-30 04:28:15', '2022-03-30 04:28:15', 'Scanner', 'scanner_id', 'SCAN', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, '2022-03-30 04:30:39', '2022-03-30 04:30:39', 'Bussiness Maker', 'bm_id', 'BM', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, '2022-03-30 04:31:46', '2022-04-04 03:35:57', 'Bussiness Approver', 'ba_id', 'BA', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, '2022-07-01 05:03:00', '2022-07-01 05:03:00', 'Bussiness Head', 'bh_id', 'BH', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(42, NULL, '2022-04-04 22:29:18', '2022-04-04 22:30:03', 'Finance sorter', 'fs_id', 'FS', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(43, NULL, '2022-04-04 22:29:31', '2022-06-20 11:19:01', 'Finance Maker', 'fm_id', 'FM', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(44, NULL, '2022-04-11 23:54:04', '2022-04-11 23:54:04', 'Finance Checker', 'fc_id', 'FC', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(45, NULL, '2022-04-11 23:54:04', '2022-04-11 23:54:05', 'Quality checker', 'qc_id', 'QC', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(46, NULL, '2022-04-11 23:54:04', '2022-04-11 23:54:05', 'Finance Processor', 'fp_id', 'FP', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL),
(273, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'CK Name', NULL, NULL, 1, '3', NULL, NULL, NULL, 'Yes', 'No', NULL),
(274, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'CK PAN Number', NULL, NULL, 1, '3', NULL, NULL, NULL, 'Yes', 'No', NULL),
(275, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'CK GSTIN Number', NULL, NULL, 1, '3', NULL, NULL, NULL, 'Yes', 'No', NULL),
(276, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'CK Correct Shipping Address', NULL, NULL, 1, '3', NULL, NULL, NULL, 'Yes', 'No', NULL),
(313, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Enter the invoice date - same as given in invoice', NULL, NULL, 1, '8', NULL, NULL, NULL, 'Yes', 'No', NULL),
(314, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Enter the invoice number - same as given in invoice', NULL, NULL, 1, '8', NULL, NULL, NULL, 'Yes', 'No', NULL),
(315, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Update the Posting date as today\'s date', NULL, NULL, 1, '8', NULL, NULL, NULL, 'Yes', 'No', NULL),
(316, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Enter the invoice Value (inclusive of tax)- same as given in invoice', NULL, NULL, 1, '8', NULL, NULL, NULL, 'Yes', 'No', NULL),
(317, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Check the Invoice currency matches with the currency appears in SAP', NULL, NULL, 1, '8', NULL, NULL, NULL, 'Yes', 'No', NULL),
(630, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Check the TDS is applicable or not(Simulation)', NULL, NULL, 1, '9', NULL, NULL, NULL, 'Yes', 'No', NULL),
(631, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Check if debit total & credit total matches and balance is 0(Simulation)', NULL, NULL, 1, '9', NULL, NULL, NULL, 'Yes', 'No', NULL),
(632, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Click on Save as parked document/Post the document(Simulation)', NULL, NULL, 1, '9', NULL, NULL, NULL, 'Yes', 'No', NULL),
(633, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Supporting Documents ', NULL, NULL, 1, '4', NULL, NULL, NULL, 'Yes', 'No', NULL),
(634, 4, '2023-03-29 18:30:00', '2023-03-29 18:30:00', 'Travel list', NULL, NULL, 1, '4', NULL, NULL, NULL, 'Yes', 'No', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_03_21_080534_create_masters_table', 1),
(7, '2022_03_24_052003_create_employees_table', 3),
(11, '2022_03_29_133531_add_columns_to_masters_table', 6),
(12, '2022_03_22_052521_create_invoices_table', 7),
(13, '2022_03_29_081750_add_deleted_to_invoices_table', 7),
(14, '2022_03_29_095618_add_assigndata_to_invoices_table', 7),
(15, '2022_04_01_063517_add_checkboxdata_to_invoices_table', 8),
(16, '2022_04_02_053525_rename_employee_id_in_employees_table', 9),
(21, '2022_04_07_100333_add_assignedby_to_invoices_table', 10),
(22, '2022_04_07_115446_create_checklists_table', 10),
(23, '2022_04_07_121639_add_invoice_id_checklists_table', 11),
(24, '2022_04_18_045009_add_checklists_to_invoices_table', 12),
(25, '2022_05_31_103416_create_first_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `mis_report`
--

CREATE TABLE `mis_report` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `scanner_rev_date` varchar(255) DEFAULT NULL,
  `scanner_proc_date` datetime DEFAULT NULL,
  `scanner_approve_reason` text DEFAULT NULL,
  `scanner_rej_reason` varchar(255) DEFAULT NULL,
  `ba1_rev_date` datetime DEFAULT NULL,
  `ba1_proc_date` datetime DEFAULT NULL,
  `ba1_approve_reason` text DEFAULT NULL,
  `ba1_rej_date` datetime DEFAULT NULL,
  `ba1_rej_reason` varchar(255) DEFAULT NULL,
  `ba2_rev_date` datetime DEFAULT NULL,
  `ba2_proc_date` datetime DEFAULT NULL,
  `ba2_approve_reason` text DEFAULT NULL,
  `ba2_rej_date` datetime DEFAULT NULL,
  `ba2_rej_reason` varchar(255) DEFAULT NULL,
  `ba3_rev_date` datetime DEFAULT NULL,
  `ba3_proc_date` datetime DEFAULT NULL,
  `ba3_approve_reason` text DEFAULT NULL,
  `ba3_rej_date` datetime DEFAULT NULL,
  `ba3_rej_reason` varchar(255) DEFAULT NULL,
  `ba4_rev_date` datetime DEFAULT NULL,
  `ba4_proc_date` datetime DEFAULT NULL,
  `ba4_approve_reason` text DEFAULT NULL,
  `ba4_rej_date` datetime DEFAULT NULL,
  `ba4_rej_reason` varchar(255) DEFAULT NULL,
  `ba5_rev_date` datetime DEFAULT NULL,
  `ba5_proc_date` datetime DEFAULT NULL,
  `ba5_approve_reason` text DEFAULT NULL,
  `ba5_rej_date` datetime DEFAULT NULL,
  `ba5_rej_reason` text DEFAULT NULL,
  `fp_ba_rev_date` datetime DEFAULT NULL,
  `fp_ba_proc_date` datetime DEFAULT NULL,
  `fp_ba_approve_reason` text DEFAULT NULL,
  `fp_ba_rej_date` datetime DEFAULT NULL,
  `fp_ba_rej_reason` text DEFAULT NULL,
  `bm_l1_proc_date` datetime DEFAULT NULL,
  `bm_l1_approve_reason` text DEFAULT NULL,
  `bm_li_rev_date` datetime DEFAULT NULL,
  `bm_l1_rej_date` datetime DEFAULT NULL,
  `bm_l1_rej_reason` varchar(255) DEFAULT NULL,
  `bm_l2_rev_date` datetime DEFAULT NULL,
  `bm_l2_proc_date` datetime DEFAULT NULL,
  `bm_l2_rej_reason` varchar(255) DEFAULT NULL,
  `bm_l2_approve_reason` text DEFAULT NULL,
  `fs_rev_date` datetime DEFAULT NULL,
  `fs_proc_date` datetime DEFAULT NULL,
  `fs_approve_reason` text DEFAULT NULL,
  `fs_rej_reason` varchar(255) DEFAULT NULL,
  `fp_proc_date` datetime DEFAULT NULL,
  `fp_approve_reason` text DEFAULT NULL,
  `fp_rej_date` datetime DEFAULT NULL,
  `fp_rej_reason` text DEFAULT NULL,
  `fp_rev_date` datetime DEFAULT NULL,
  `fp2_proc_date` datetime DEFAULT NULL,
  `fp2_approve_reason` text DEFAULT NULL,
  `fp2_rej_date` datetime DEFAULT NULL,
  `fm_rev_date` datetime DEFAULT NULL,
  `fm_proc_date` datetime DEFAULT NULL,
  `fm_rej_reason` varchar(255) DEFAULT NULL,
  `fm_rej_date` datetime DEFAULT NULL,
  `fs_rej_date` datetime DEFAULT NULL,
  `fc_rev_date` datetime DEFAULT NULL,
  `fc_proc_date` datetime DEFAULT NULL,
  `fc_rej_reason` varchar(255) DEFAULT NULL,
  `fc_rej_date` datetime DEFAULT NULL,
  `fm_hold_date` datetime DEFAULT NULL,
  `fm_release_date` datetime DEFAULT NULL,
  `fm_hold_reason` varchar(255) DEFAULT NULL,
  `fc_hold_date` datetime DEFAULT NULL,
  `fc_release_date` datetime DEFAULT NULL,
  `fc_hold_reason` varchar(255) DEFAULT NULL,
  `fc_remark` varchar(255) DEFAULT NULL,
  `qc_rev_date` datetime DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `flow_status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `complete_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mis_report`
--

INSERT INTO `mis_report` (`id`, `invoice_id`, `organization_id`, `scanner_rev_date`, `scanner_proc_date`, `scanner_approve_reason`, `scanner_rej_reason`, `ba1_rev_date`, `ba1_proc_date`, `ba1_approve_reason`, `ba1_rej_date`, `ba1_rej_reason`, `ba2_rev_date`, `ba2_proc_date`, `ba2_approve_reason`, `ba2_rej_date`, `ba2_rej_reason`, `ba3_rev_date`, `ba3_proc_date`, `ba3_approve_reason`, `ba3_rej_date`, `ba3_rej_reason`, `ba4_rev_date`, `ba4_proc_date`, `ba4_approve_reason`, `ba4_rej_date`, `ba4_rej_reason`, `ba5_rev_date`, `ba5_proc_date`, `ba5_approve_reason`, `ba5_rej_date`, `ba5_rej_reason`, `fp_ba_rev_date`, `fp_ba_proc_date`, `fp_ba_approve_reason`, `fp_ba_rej_date`, `fp_ba_rej_reason`, `bm_l1_proc_date`, `bm_l1_approve_reason`, `bm_li_rev_date`, `bm_l1_rej_date`, `bm_l1_rej_reason`, `bm_l2_rev_date`, `bm_l2_proc_date`, `bm_l2_rej_reason`, `bm_l2_approve_reason`, `fs_rev_date`, `fs_proc_date`, `fs_approve_reason`, `fs_rej_reason`, `fp_proc_date`, `fp_approve_reason`, `fp_rej_date`, `fp_rej_reason`, `fp_rev_date`, `fp2_proc_date`, `fp2_approve_reason`, `fp2_rej_date`, `fm_rev_date`, `fm_proc_date`, `fm_rej_reason`, `fm_rej_date`, `fs_rej_date`, `fc_rev_date`, `fc_proc_date`, `fc_rej_reason`, `fc_rej_date`, `fm_hold_date`, `fm_release_date`, `fm_hold_reason`, `fc_hold_date`, `fc_release_date`, `fc_hold_reason`, `fc_remark`, `qc_rev_date`, `assigned_to`, `flow_status`, `created_date`, `complete_date`) VALUES
(1, 1, 1, '2024-07-15 10:46:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 1, NULL, NULL),
(2, 2, 1, '2024-07-15 12:16:21', '2024-07-15 14:58:53', 'sad', NULL, '2024-07-15 14:58:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 2, NULL, NULL),
(3, 3, 1, '2024-07-15 15:03:57', '2024-07-15 17:40:43', NULL, NULL, '2024-07-15 17:40:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 10:56:52', 'das', NULL, NULL, NULL, NULL, NULL, '2024-07-16 10:56:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 7, NULL, NULL),
(4, 4, 1, '2024-07-15 17:42:33', '2024-07-15 17:49:03', NULL, NULL, '2024-07-15 17:49:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 12:40:53', 'rw', NULL, '2024-07-18 13:10:18', NULL, NULL, NULL, '2024-07-18 12:40:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100, NULL, '2024-07-18 13:10:18'),
(5, 5, 2, '2024-07-16 12:10:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1, NULL, NULL),
(6, 6, 1, '2024-07-16 13:02:51', '2024-07-16 13:04:28', NULL, NULL, '2024-07-16 13:04:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:08:20', 're', NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:08:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 7, NULL, NULL),
(7, 7, 1, '2024-07-16 13:04:41', '2024-07-16 13:05:11', NULL, NULL, '2024-07-16 13:05:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:06:26', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:06:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 7, NULL, NULL),
(8, 8, 1, '2024-07-18 11:01:04', '2024-07-18 13:23:42', NULL, NULL, '2024-07-18 13:23:42', NULL, NULL, '2024-07-18 12:37:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 14:49:39', 'test', NULL, '2024-07-18 17:50:50', NULL, NULL, NULL, '2024-07-18 14:49:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 100, NULL, '2024-07-18 17:50:50'),
(9, 9, 1, '2024-07-18 18:14:38', '2024-07-22 14:45:25', NULL, NULL, '2024-07-22 14:45:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL),
(10, 10, 1, '2024-07-22 14:58:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'assam', '2024-02-15 10:11:02', '2024-02-15 10:11:02'),
(2, 'haridwar', '2024-02-15 10:11:02', '2024-02-15 10:11:02');

-- --------------------------------------------------------

--
-- Table structure for table `other_documents`
--

CREATE TABLE `other_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `file_for` text DEFAULT NULL,
  `document_orginal_name` varchar(255) DEFAULT NULL,
  `document_ext` varchar(255) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `document_url` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `other_documents`
--

INSERT INTO `other_documents` (`id`, `invoice_id`, `uploaded_by`, `document_name`, `file_for`, `document_orginal_name`, `document_ext`, `document_path`, `document_url`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 402, 4, '1710937925.pdf', '', 'EID30762.pdf', 'pdf', 'upload/invoice_document/4/', 'https://iviewplant.cavinkare.in/upload/invoice_document/4/1710937925.pdf', NULL, NULL, NULL),
(2, 2472, 56, '1717053412.pdf', 'Correct one', 'Iview-Bhiwandi-0524-00047.pdf', 'pdf', 'upload/invoice_document/56/', 'https://iviewplant.cavinkare.in/upload/invoice_document/56/1717053412.pdf', NULL, NULL, NULL),
(3, 2471, 57, '1717053518.PNG', '4500145372', 'Lakshmi 4500145372.PNG', 'PNG', 'upload/invoice_document/57/', 'https://iviewplant.cavinkare.in/upload/invoice_document/57/1717053518.PNG', NULL, NULL, NULL),
(4, 2473, 56, '1717061962.pdf', 'Correct one', 'Invoice 167.pdf', 'pdf', 'upload/invoice_document/56/', 'https://iviewplant.cavinkare.in/upload/invoice_document/56/1717061962.pdf', NULL, NULL, NULL),
(5, 2478, 56, '1717139594.PNG', '', 'Shivam Packaging.PNG', 'PNG', 'upload/invoice_document/56/', 'https://iviewplant.cavinkare.in/upload/invoice_document/56/1717139594.PNG', NULL, NULL, NULL),
(6, 2587, 27, '1717475126.PNG', '', 'Capture.PNG', 'PNG', 'upload/invoice_document/27/', 'https://iviewplant.cavinkare.in/upload/invoice_document/27/1717475126.PNG', NULL, NULL, NULL),
(7, 2586, 27, '1717562409.PNG', '', 'Capture.PNG', 'PNG', 'upload/invoice_document/27/', 'https://iviewplant.cavinkare.in/upload/invoice_document/27/1717562409.PNG', NULL, NULL, NULL),
(8, 3049, 27, '1718617589.pdf', '', 'INV-1_.pdf', 'pdf', 'upload/invoice_document/27/', 'https://iviewplant.cavinkare.in/upload/invoice_document/27/1718617589.pdf', NULL, NULL, NULL),
(9, 3245, 56, '1718694005.pdf', '', 'BMC WATER BILL MAY 2024.pdf', 'pdf', 'upload/invoice_document/56/', 'https://iviewplant.cavinkare.in/upload/invoice_document/56/1718694005.pdf', NULL, NULL, NULL),
(10, 2638, 27, '1718790297.pdf', '', 'Scan_20240618_142142.pdf', 'pdf', 'upload/invoice_document/27/', 'https://iviewplant.cavinkare.in/upload/invoice_document/27/1718790297.pdf', NULL, NULL, NULL),
(11, 2477, 56, '1718798606.pdf', '', 'Sanjivani printers ( inv-06 ) 19-Jun-2024 16-16-43 (1).pdf', 'pdf', 'upload/invoice_document/56/', 'https://iviewplant.cavinkare.in/upload/invoice_document/56/1718798606.pdf', NULL, NULL, NULL),
(12, 3251, 27, '1718873900.pdf', '', '043-24-25 bill scan copy.pdf', 'pdf', 'upload/invoice_document/27/', 'https://iviewplant.cavinkare.in/upload/invoice_document/27/1718873900.pdf', NULL, NULL, NULL),
(13, 3655, 56, '1719486061.pdf', '', '6 MONTH MAITANACE CHARGES (1).pdf', 'pdf', 'upload/invoice_document/56/', 'https://iviewplant.cavinkare.in/upload/invoice_document/56/1719486061.pdf', NULL, NULL, NULL),
(14, 3759, 27, '1719834551.pdf', '', 'Scan_20240701_162226 (1).pdf', 'pdf', 'upload/invoice_document/27/', 'https://iviewplant.cavinkare.in/upload/invoice_document/27/1719834551.pdf', NULL, NULL, NULL),
(15, 3505, 57, '1719896077.pdf', 'PO & GRN new one', 'Vidhisha pepper ( 642 )(1) 25-Jun-2024 13-46-10 (1).pdf', 'pdf', 'upload/invoice_document/57/', 'https://iviewplant.cavinkare.in/upload/invoice_document/57/1719896077.pdf', NULL, NULL, NULL),
(16, 3826, 27, '1720085350.pdf', 'GRN', 'grn.pdf', 'pdf', 'upload/invoice_document/27/', 'https://iviewplant.cavinkare.in/upload/invoice_document/27/1720085350.pdf', NULL, NULL, NULL),
(17, 3848, 56, '1720517747.pdf', '', 'MATHADI CHALLAN.pdf', 'pdf', 'upload/invoice_document/56/', 'https://iviewplant.cavinkare.in/upload/invoice_document/56/1720517747.pdf', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('erodetanker@cavinkare.com', '$2y$10$9NNvj9wAkRdRrdvBLBmUYOqz83HclznRaVt/LqLAVtPQkN3IHKfXe', '2024-03-11 11:34:07'),
('amurugan@cavinkare.com', '$2y$10$aWrD2axd2RxEPwR9t8FOn.tBfMtoVa.6DK8TNJ/n45Z4irBRVIaa6', '2024-05-20 10:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preapproved_documents`
--

CREATE TABLE `preapproved_documents` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `file_for` text DEFAULT NULL,
  `document_orginal_name` varchar(255) NOT NULL,
  `document_ext` varchar(255) NOT NULL,
  `document_path` varchar(255) NOT NULL,
  `document_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile_pics`
--

CREATE TABLE `profile_pics` (
  `id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `file_for` text DEFAULT NULL,
  `document_orginal_name` varchar(255) NOT NULL,
  `document_ext` varchar(255) NOT NULL,
  `document_path` varchar(255) NOT NULL,
  `document_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qc_marks`
--

CREATE TABLE `qc_marks` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `checklist_id` int(11) DEFAULT NULL,
  `checklist_for` int(11) DEFAULT NULL,
  `mark` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requestor_tickets`
--

CREATE TABLE `requestor_tickets` (
  `id` int(11) NOT NULL,
  `req_id` varchar(255) DEFAULT NULL,
  `request` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `bill_qty` int(11) DEFAULT NULL,
  `vendorquote` varchar(255) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  `budget_value` varchar(255) DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `requestor_id` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `dh_id` int(11) DEFAULT NULL,
  `purchasebm_id` int(11) DEFAULT NULL,
  `dh1_id` int(11) DEFAULT NULL,
  `bh_id` int(11) DEFAULT NULL,
  `purchasebm1_id` int(11) DEFAULT NULL,
  `poqc_id` int(11) DEFAULT NULL,
  `quote1` longtext DEFAULT NULL,
  `quote2` longtext DEFAULT NULL,
  `quote3` longtext DEFAULT NULL,
  `selected_quote` longtext DEFAULT NULL,
  `final_quote` varchar(255) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `pofile` varchar(255) DEFAULT NULL,
  `vendor_code` varchar(255) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `vendor_gst` varchar(255) DEFAULT NULL,
  `vendor_amount` int(11) DEFAULT NULL,
  `vendor_applicable` int(11) DEFAULT NULL,
  `pobm_checklist` tinyint(1) DEFAULT 0,
  `rejected_by` int(11) DEFAULT NULL,
  `rejected_byscanner` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_reason` varchar(255) DEFAULT NULL,
  `rejected_reason` varchar(255) DEFAULT NULL,
  `poqc_verified` int(11) DEFAULT NULL COMMENT '1=>approve 2=>observation 3=>revert\r\n',
  `channel` int(11) DEFAULT NULL COMMENT '1=>green 2=>yellow 3=>red',
  `poqc_completed_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role_slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `role_slug`, `created_at`, `updated_at`) VALUES
(1, 'scanner', 'scanner', '2023-03-14 16:56:34', '2023-03-14 16:56:34'),
(2, 'Business Manager', 'business_manager', '2023-03-14 16:56:34', '2023-03-14 16:56:34'),
(3, 'Business Approver', 'business_approver', '2023-03-14 16:57:27', '2023-03-14 16:57:27'),
(4, 'Business Head', 'business_head', '2023-03-14 16:57:27', '2023-03-14 16:57:27'),
(5, 'Finance Sorter', 'finance_sorter', '2023-03-14 16:59:01', '2023-03-14 16:59:01'),
(6, 'Finance Maker', 'finance_maker', '2023-03-14 16:59:01', '2023-03-14 16:59:01'),
(7, 'Finance Checker', 'finance_checker', '2023-03-14 17:00:29', '2023-03-14 17:00:29'),
(8, 'Internal Audit', 'internal_audit', '2023-03-14 17:00:29', '2023-03-14 17:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_flow_condition`
--

CREATE TABLE `ticket_flow_condition` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `conditionflow` text DEFAULT NULL,
  `budget_amount` int(11) DEFAULT NULL,
  `role_order` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_flow_condition`
--

INSERT INTO `ticket_flow_condition` (`id`, `organization_id`, `conditionflow`, `budget_amount`, `role_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'lesser', 0, '{\n\"1\":{\"role\":2,\"column\":\"scanner_id\"},\n\"2\":{\"role\":4,\"column\":\"ba_id\"},\n\"3\":{\"role\":3,\"column\":\"bm_id\"},\n\"4\":{\"role\":42,\"column\":\"fs_id\"},\n\"5\":{\"role\":46,\"column\":\"fp_id\"}\n}', '2023-03-11 10:13:36', '2023-03-11 10:13:36'),
(3, 3, 'lesser', 0, '{\n\"1\":{\"role\":2,\"column\":\"scanner_id\"},\n\"2\":{\"role\":4,\"column\":\"ba_id\"},\n\"3\":{\"role\":3,\"column\":\"bm_id\"},\n\"4\":{\"role\":42,\"column\":\"fs_id\"},\n\"5\":{\"role\":46,\"column\":\"fp_id\"}\n}', '2023-03-20 11:13:12', '2023-03-20 11:13:12'),
(4, 2, 'lesser', 0, '{\n\"1\":{\"role\":2,\"column\":\"scanner_id\"},\n\"2\":{\"role\":4,\"column\":\"ba_id\"},\n\"3\":{\"role\":3,\"column\":\"bm_id\"},\n\"4\":{\"role\":42,\"column\":\"fs_id\"},\n\"5\":{\"role\":46,\"column\":\"fp_id\"}\n}', '2023-03-20 11:13:12', '2023-03-20 11:13:12'),
(5, 4, 'lesser', 0, '{\n\"1\":{\"role\":2,\"column\":\"scanner_id\"},\n\"2\":{\"role\":4,\"column\":\"ba_id\"},\n\"3\":{\"role\":3,\"column\":\"bm_id\"},\n\"4\":{\"role\":42,\"column\":\"fs_id\"},\n\"5\":{\"role\":46,\"column\":\"fp_id\"}\n}', '2023-03-29 15:51:29', '2023-03-29 15:51:29'),
(6, 5, 'lesser', 0, '{\n\"1\":{\"role\":2,\"column\":\"scanner_id\"},\n\"2\":{\"role\":4,\"column\":\"ba_id\"},\n\"3\":{\"role\":3,\"column\":\"bm_id\"},\n\"4\":{\"role\":42,\"column\":\"fs_id\"},\n\"5\":{\"role\":46,\"column\":\"fp_id\"}\n}', '2023-03-29 15:51:29', '2023-03-29 15:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `org_set` varchar(255) DEFAULT NULL,
  `employee_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `role_set` varchar(255) DEFAULT NULL,
  `pbm_role` int(11) DEFAULT NULL,
  `is_supervisor` tinyint(1) DEFAULT 0,
  `supervisor` int(11) DEFAULT NULL,
  `dh_id` int(11) DEFAULT NULL,
  `is_divisonhead` tinyint(1) DEFAULT 0,
  `department` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_pwdreset` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `organization_id`, `org_set`, `employee_code`, `name`, `login_id`, `phone`, `email`, `role`, `role_set`, `pbm_role`, `is_supervisor`, `supervisor`, `dh_id`, `is_divisonhead`, `department`, `email_verified_at`, `password`, `remember_token`, `profile_pic`, `created_at`, `updated_at`, `deleted_at`, `is_pwdreset`) VALUES
(1, 1, '1', '5963', 'Ganesan N', 'IVIEW1', '9965770714', 'vicky@hepl.com', 46, NULL, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 1),
(2, 1, '1', 'KCSL089', 'arun', 'IVIEW2', '7502462952', 'arun@hepl.com', 2, '2,4', 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 1),
(3, 1, '1', '901126', 'Rathinavel.P', 'IVIEW3', '9944006071', 'rathinavel.p@hepl.com', 4, '', 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'v9VO8sbv7OkUFhAmwyjoSnzJV3gHDMbGHbJIlqRsmqyDQa1H1QowGpgPuron', '', '0000-00-00 00:00:00', '2024-06-28 10:06:50', NULL, 1),
(4, 2, '1', '1011567', 'John Paul M', 'IVIEW4', '9942814981', 'erodestores@cavinkare.com', 46, '', 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', '', 'upload/profilepics/4.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 1),
(5, 2, '1', '8425', 'Sankar.M', 'IVIEW5', '9597877686', 'erodestores@cavinkare.com', 4, '', 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 1),
(6, 2, '1', '1013050', 'Srinivasan.K', 'IVIEW6', '9629449468', 'erodeenggstores@cavinKare.com', 2, '', 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 1),
(60, 1, '1', '5963', 'ajay', 'IVIEW1', '9965770714', 'ajay@hepl.com', 46, NULL, 0, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users11111`
--

CREATE TABLE `users11111` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `role_set` varchar(255) DEFAULT NULL,
  `pbm_role` int(11) DEFAULT NULL,
  `is_supervisor` tinyint(1) DEFAULT 0,
  `supervisor` int(11) DEFAULT NULL,
  `dh_id` int(11) DEFAULT NULL,
  `is_divisonhead` tinyint(1) DEFAULT 0,
  `department` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_pwdreset` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users11111`
--

INSERT INTO `users11111` (`id`, `employee_code`, `name`, `phone`, `email`, `role`, `role_set`, `pbm_role`, `is_supervisor`, `supervisor`, `dh_id`, `is_divisonhead`, `department`, `email_verified_at`, `password`, `remember_token`, `profile_pic`, `created_at`, `updated_at`, `deleted_at`, `is_pwdreset`) VALUES
(1, NULL, 'admin', NULL, 'admin@hepl.in', 1, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$/mscS.KdC/UA6n3plSrTYe.AUMuEEhw5Nhs5Btqb4IeqnLoUaXQLq', NULL, NULL, '2022-03-21 20:01:46', '2022-03-21 20:01:46', '0000-00-00 00:00:00', 0),
(43, NULL, 'Kalayairasi', '8300792399', 'kalaiyarasi.r@hemas.in', 43, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$ZtnM/r3IufAX10PCxJTF6.vsOm08MC5o3Jx4hPRilqhxX2JVHzfSK', NULL, 'upload/profilepics/43.png', '2022-07-01 10:34:12', '2022-07-01 10:34:38', '0000-00-00 00:00:00', 0),
(44, NULL, 'Ushaguru', NULL, 'ushaguru@cavinkare.com', 5, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$vSwEGURCYDv1k6hmHFq6k.NFpwW4Uj4nEKdQFMYxWksDD3utvZu32', 'rV5bTdn2HhP2p9zzUgahUzKCrlQCuTZK6gdGdRzH0MW2NcfDxKCQOw2Jb96l', 'upload/profilepics/44.png', '2022-07-01 10:35:25', '2022-07-01 10:35:25', '0000-00-00 00:00:00', 0),
(45, NULL, 'Pradeesh', '9840433537', 'pradeeshn@cavinkare.com', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$N3lvqdAqDDIpY7mWj6fIYuDYLBQ80ryWysBI1KXpYLEIR4GsyIW.W', NULL, 'upload/profilepics/45.png', '2022-07-01 10:36:17', '2022-07-01 10:36:17', '0000-00-00 00:00:00', 0),
(50, NULL, 'Roop Sundar Reddy', '8884997977', 'roopsundar@hemas.in', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$jP25aGXNnGpT/JdCuj8G/OjJVKmAlVoy2hp6.J0aDBL7JiJF4bTTS', NULL, 'upload/profilepics/50.png', '2022-07-01 11:05:13', '2022-07-01 11:05:13', '0000-00-00 00:00:00', 0),
(51, NULL, 'Prasanna', '8825430671', 'prasanna.r@hemas.in', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$ZZx45ZFb0Fx3upLhflsXnuRxJFih3l5dhrsKMP95.z3YjdCpmbNl.', 'szgFwWo7YqgQUGVZlcg6Vp6FTMCq9FzeBq4gBJspdsgVw2B2b2dDNfwB16PR', 'upload/profilepics/51.png', '2022-07-01 11:06:20', '2022-07-01 11:06:20', '0000-00-00 00:00:00', 0),
(52, NULL, 'Kiruthiga', NULL, 'hrpayroll1@hemas.in', 3, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$UzyKXp1XsGNH4USRdYbRDexknsHEsOsBzKGozbFXfYSwRAalW6J/2', 'vKCfjKBTn3SebTKvUEEi5Z3GLPuHYdV5iUfNhqXnWUuHmds4xj1POjrOd6hn', 'upload/profilepics/52.png', '2022-07-01 11:07:02', '2022-08-08 11:44:41', '0000-00-00 00:00:00', 0),
(53, NULL, 'internalaudit', NULL, 'internalaudit@hemas.in', 45, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$/mscS.KdC/UA6n3plSrTYe.AUMuEEhw5Nhs5Btqb4IeqnLoUaXQLq', 'LIfMVGYTPDIllvno5VMsNhf3uBsoFoRQn6cYtkyAqQ4Xbwo9ZwfBnpmqejsh', 'upload/profilepics/53.png', '2022-07-01 11:07:22', '2022-07-07 07:02:40', '0000-00-00 00:00:00', 0),
(54, NULL, 'Kadiravan', '8681071783', 'kadiravan.k@hemas.in', 44, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$PVj91DizKUC1oRQCNWONvufLtkD434xqCF1akXxFaxV2Il7Nu45o.', NULL, 'upload/profilepics/54.png', '2022-07-01 11:07:51', '2022-07-01 11:07:51', '0000-00-00 00:00:00', 0),
(55, NULL, 'Purushothaman', '8220281971', 'purushothaman@hemas.in', 3, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$/D9WJCgB9Q01KPHCNaCcd.RDsSRUA6kiAxzzO/1mQNZYepB0jBg7a', '92juUUvtZY8wPgjkXwl1KKDR74Lf15cMhVTVnmzkC0yGigWH4baHIBG8qguL', 'upload/profilepics/55.35', '2022-07-01 11:08:17', '2022-07-01 11:08:17', '0000-00-00 00:00:00', 0),
(56, NULL, 'Adhithya', '9698477102', 'adhithya.g@hemas.in', 42, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$fpD4xD0/KGXFSG9yRky18e2/pe5kwj2mmkwxsljinnkGaWrSNMNCS', 'XyZ8QiEMfLtIY7sdKxF9vrjxYIyI7yh0B3ZhrVm3xBuNsPU4Ovc19GnNEDQH', 'upload/profilepics/56.png', '2022-07-01 11:08:43', '2022-07-01 11:08:43', '0000-00-00 00:00:00', 0),
(57, NULL, 'Rajasekaran', '8680947588', 'rajasekaran@hemas.in', 450000, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$MQ.9n4Preo.Dx2cC3U28zeqU4VDTKVc8tP7tdxxNcsytx213Ifyhm', 'gWWJrqURmqtxqn73w8XggR1oLnTZabnLzZNspCxlRilYswjJ4zdxK0EnMUuV', 'upload/profilepics/57.png', '2022-07-01 11:09:00', '2022-07-14 07:42:33', '0000-00-00 00:00:00', 0),
(58, NULL, 'Suresh Kumar', '8220351459', 'sureshkumar@hemas.in', 2, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$HLtmBmXW/zW/uffLdxT6bO3rK8Z0v5V7qDDiP//J4DKRyw3mSrGbK', 'kZ52iXqoDCFcVEkMRtJG8kaD63tFy3nlxcPxW1nQfhaR9CmMjqLUXPPE7l11', 'upload/profilepics/58.jpg', '2022-07-01 11:09:26', '2022-07-01 11:09:26', '0000-00-00 00:00:00', 0),
(59, NULL, 'karthik', NULL, 'karthik.m@hemas.in', 3, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$w93Bz7i4aVJqW9Hml8MIrubAfAbgVM2tuvrNAiigDHKRcXvqn.34W', NULL, 'upload/profilepics/59.png', '2022-07-01 11:09:45', '2022-07-01 11:09:45', '0000-00-00 00:00:00', 0),
(60, NULL, 'Prabhakaran', NULL, 'prabhakaran.s@hemas.in', 3, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$TffAhsM1HKUZmLKKRoPfX.VcIn7XLkj1jFn/kWPu0Fzi9Am0hmxT.', 'S7gDon2CDVKctDLaYIXxTTjBa1OvIswIDtLirN2Xq4pVd5w5EXGQsumbkREz', 'upload/profilepics/60.png', '2022-07-01 11:10:09', '2022-07-01 11:10:09', '0000-00-00 00:00:00', 0),
(61, NULL, 'Vendor Invoices', NULL, 'vendorinvoices@hemas.in', 43, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$eIoaRld91hb0Nld5AjekQ.CXNClw0Z9Cl6aeblVAsvV7LaXC.v9T2', 'SRC7eyOk8FwaGuGs5T8UGpkB5kHGdwHYnY0IxMak895884hCfWvMt2iUAqMI', 'upload/profilepics/61.jpg', '2022-07-01 11:10:34', '2022-07-01 11:10:34', '0000-00-00 00:00:00', 0),
(62, NULL, 'Bharathwaj', NULL, 'bharathwaj@hemas.in', 3, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$2IVRJ.HW0V0SkafOhWHi0uRafBfrro2dI6QEUq8j0vJBtYpMWfiQa', 'cGHfA5BSzUiKBkHi6a9GDlRCAJWv0ijrAJhuSWYPb7vW3Z9ty28q1WWyp6WN', 'upload/profilepics/62.png', '2022-07-01 11:11:00', '2022-07-01 11:11:00', '0000-00-00 00:00:00', 0),
(63, NULL, 'Murali', NULL, 'murali.p@hemas.in', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$YF0gsY9izrjauoNDTvJyu.36Vv8oA27zlm5srbq1KuEi4cEqRgpFW', 'GCuuWynESHdlfnLW8KVHA6fCB8IF6pQQJ6XTm3pgHtfVdzzrVJyy4NOFmZPb', 'upload/profilepics/63.png', '2022-07-01 11:11:17', '2022-07-13 05:37:41', '0000-00-00 00:00:00', 0),
(64, NULL, 'Aishwaryaa', NULL, 'aishwaryaa.b@hemas.in', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$0QUbuhTbg2.15Og3OyfNd.cSP.1HStFwoqg1BRIh49fy7cSVU4U6i', NULL, 'upload/profilepics/64.png', '2022-07-01 11:11:41', '2022-07-01 11:11:41', '0000-00-00 00:00:00', 0),
(65, '900362', 'Leelavinothan', '9500700240', 'test@hemas.in', 1, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$HMcAeTihw0SC.ta09O5cnukAOc95AEJzP3HshWOxc3QMUX8wtPMEC', 'dmVLfUTf9ZAVTNBbwb6bwBDUcy8pgDdtLYQeKWGJwDBTbkOhpKlkGb3wfFNT', NULL, '2022-07-01 12:16:39', '2023-02-11 12:12:22', '0000-00-00 00:00:00', 0),
(66, NULL, 'Rajesh MS', '8073369050', 'rajesh.ms@hemas.in', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$tuHYOv0O2UESODy465uJWuOIDgqIqyAlPbMpxmkmVeN1dQAe0d8fC', 'YeN6wuU2omOsLS3c2JvTN7zyWTUajuL5K6VCV07IEXMJjtXtgRzinEc4KrV1', NULL, '2022-09-19 06:22:11', '2022-09-19 06:38:34', '0000-00-00 00:00:00', 0),
(67, '30002', 'test2', '123', 'test2@hemas.in', 3, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$YkFXjb.pOJ2u0BSHI8kZJ.3XuC8pgR6NKDoYnz.IM.EyebgQQe936', NULL, NULL, '2022-09-26 10:34:05', '2022-10-07 04:46:56', '0000-00-00 00:00:00', 0),
(68, '777', 'Tester', '6969696969', 'test3@hemas.in', 2, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$uvUhrNbX0bz0Gm/RanUB1.nsQzxF3Y7jZ41dinweqvgMZmvG50fIe', NULL, NULL, '2022-09-28 07:49:38', '2022-09-30 06:21:41', '0000-00-00 00:00:00', 0),
(69, NULL, 'Ramesh PR', NULL, 'ramesh.pr@hepl.com', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$qZ6CFQ83MGiL3fwfsT9q6uNOrtEPj8.SNysLh7anZ5XZa9sToVwqm', 'OF4FqtZt60HgIuA7BWB3sdsCA5mSSaPDCXKlKdL5XYpsCHKT04et7LFxtyre', NULL, '2022-10-11 07:29:53', '2023-02-14 07:22:59', '0000-00-00 00:00:00', 0),
(70, NULL, 'Manasa.V', '9986585959', 'manasa.v@hepl.com', 3, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$2.WnDkM3p1xXg96lk0HV2eMLW77E1stgeLqW/T4irdMgf9qXNtqGq', 'Xb1YgiRuMHjcjZB7uD0Qgsf1TTelIG6lkP0Hk03SoiV2f04gLoT4GNbFmdig', NULL, '2022-10-18 04:40:13', '2022-10-18 04:40:13', '0000-00-00 00:00:00', 0),
(71, NULL, 'Sreelakshmi C S', '9074483581', 'sreelakshmi.cs@hepl.com', 3, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$vajliUBtjznEDphPY/n9aOQ697GOGye0GbR2.2.ADy6IbkQx95csK', NULL, NULL, '2022-10-18 04:41:03', '2022-10-18 04:41:03', '0000-00-00 00:00:00', 0),
(72, NULL, 'Srikanth GR', '9840167518', 'srikanth.gr@hemas.in', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$zDN9dNFBj6BsrTunMy77h.N4Xcw97XoaEk15hIaURtbfUs5hdcFQO', 'ndBQqHrkj10lr0mZnoykVWFFJq6pGwNfHV45BFZk9mmEy4Zb5EXpbX9o9TSV', NULL, '2022-10-20 12:19:25', '2022-10-20 12:19:25', '0000-00-00 00:00:00', 0),
(73, NULL, 'Balaji R', '9894441181', 'balaji@hepl.com', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$kxHOq.wp6GTCwlPPzXNQRezlMWAM30fODQEGictd/pjKziPhDm6RW', 'HX5krasMEX1koSXEx7BMy6juZBSrQyxpTyMtb1FoVvu6iqR4iy4qjwGslDXU', NULL, '2022-11-09 07:09:30', '2023-01-06 08:57:18', '0000-00-00 00:00:00', 0),
(74, '900033', 'Purushothaman G', '9710603783', 'purushothaman.vg@hepl.com', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$eoZ7bHxXdG3qjjuLB5mNAOfcfGPHgo3hM3.lzFN0J4jmn4bVCKj8C', NULL, NULL, '2022-12-08 12:02:20', '2022-12-08 12:02:20', '0000-00-00 00:00:00', 0),
(75, NULL, 'Jeesha R', '9176688081', 'jeesha.r@hepl.com', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$fdtov8ZWE/IMXFWU8avB9e8UcSNSBnis9iMltlwX4OTjr8fb/Jrqy', 'Ssw3WIcnj2QcL38s87SDqTYxeR2YyA4KDAJaRdiblUagyIUzcE4mr6BOUxR5', NULL, '2022-12-09 09:44:47', '2022-12-09 09:57:55', '0000-00-00 00:00:00', 0),
(76, NULL, 'Vairam Vasu', '9150000904', 'vairam.v@hepl.com', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$2Ivwmnc1F8UwCHVPrBa3HevZt3tGZpJVRCCmNyhHPmtqb4xEl2y.u', '51Wxg7PtL7CLbzzm5OQLibHKZoLd58tCUcRWfNL9A9ph7112126QlylGbtAa', NULL, '2023-01-23 09:38:34', '2023-01-23 09:38:34', '0000-00-00 00:00:00', 0),
(77, NULL, 'Jyotsna V', '8939962123', 'jyotsna.v@ckacademy.com', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$BOc7BVD64RnthxqRs2.DZOeLYPKf/eWXBrWvS9eVlLtBKUWvT2wTK', NULL, NULL, '2023-02-07 07:38:29', '2023-02-07 07:38:29', '0000-00-00 00:00:00', 0),
(78, NULL, 'Hemalatha P', '9790262493', 'hemalatha.p@ckacademy.com', 3, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$w7qEF6QQU2PcWX3M581dT.szMvOnbnc4mGoK81kxV89QNNCh2PWYW', 'sxWIp31aAn4OERLMKIFxbYZ75YxZGLPfOgB3PivqeH7hZGTzd0XciCTnENFk', NULL, '2023-02-07 07:40:00', '2023-02-07 07:40:00', '0000-00-00 00:00:00', 0),
(79, NULL, 'Saravanan M', '9940616325', 'saravanan.m@hepl.com', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$jSBBcpKs6SfK74eKqA10U.t1T3fkwiViqaCIy2mrIwD4t8Wq3zP8a', 'Jo3tG7t15zlFXVyYsVtu2elQoXU8gqGLfycHAny0KcAX8jo93UCSMcvOuYGc', NULL, '2023-02-10 10:12:49', '2023-02-14 05:14:20', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `usersold`
--

CREATE TABLE `usersold` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `org_set` varchar(255) DEFAULT NULL,
  `employee_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `role_set` varchar(255) DEFAULT NULL,
  `pbm_role` int(11) DEFAULT NULL,
  `is_supervisor` tinyint(1) DEFAULT 0,
  `supervisor` int(11) DEFAULT NULL,
  `dh_id` int(11) DEFAULT NULL,
  `is_divisonhead` tinyint(1) DEFAULT 0,
  `department` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_pwdreset` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usersold`
--

INSERT INTO `usersold` (`id`, `organization_id`, `org_set`, `employee_code`, `name`, `login_id`, `phone`, `email`, `role`, `role_set`, `pbm_role`, `is_supervisor`, `supervisor`, `dh_id`, `is_divisonhead`, `department`, `email_verified_at`, `password`, `remember_token`, `profile_pic`, `created_at`, `updated_at`, `deleted_at`, `is_pwdreset`) VALUES
(44, 4, '4', NULL, 'Ushaguru', 'IVIEW44', NULL, 'ushaguru@yopmail.com', 5, NULL, NULL, 1, 0, NULL, 1, 18, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, '2022-07-01 05:05:25', '2022-07-01 05:05:25', NULL, 1),
(45, 4, '4', NULL, 'Pradeesh', 'IVIEW45', '9840433537', 'pradeeshn@yopmail.com', 4, NULL, NULL, 1, 44, 45, 0, 11, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, '2022-07-01 05:06:17', '2022-07-01 05:06:17', NULL, 1),
(50, 4, '4', NULL, 'Roop Sundar Reddy', 'IVIEW50', '8884997977', 'roopsundar.k@yopmail.com', 4, NULL, NULL, 1, 44, 50, 1, 2, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, '2022-07-01 05:35:13', '2022-07-01 05:35:13', NULL, 1),
(53, 4, '4', '9999', 'internalaudit', 'IVIEW53', NULL, 'internalaudit@yopmail.com', 45, NULL, NULL, 0, 55, 50, 0, 1, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'e7RJ8qUoS3fNFZkBDKIPWLdxCld0oIpAnM5sEKMhGfT2lZsZ7XkB4NScCmpP', NULL, '2022-07-01 05:37:22', '2022-07-01 05:37:22', NULL, 1),
(175, 4, '4', 'A0323157713', 'Hari Murthi', 'IVIEW175', NULL, 'harimurthy.m@yopmail.com', 2, '2', NULL, 0, 176, 50, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'zf24kTFkF0eSe7Yx2cE9t4nzpSw1ZkNKliKEBPpqrxO0BvADGNzYWmCaa3lZ', NULL, NULL, NULL, NULL, 0),
(176, 4, '4', '900708', 'Kumanan R', 'IVIEW176', NULL, 'kumanan.r@yopmail.com', 42, NULL, NULL, 1, 50, 50, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'fXk6Hq7idhe4WbAYQSSOZ4pDW9HXVpcA2d2XvVEyojOWE3QR05rH2H30iqpu', NULL, NULL, NULL, NULL, 0),
(177, 4, '4', '901081', 'Mathivanan', 'IVIEW177', NULL, 'mathivanan.g@yopmail.com', 44, NULL, NULL, 0, 176, 50, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, NULL, NULL, NULL, 0),
(178, 5, '3,5', NULL, 'surendar', 'IVIEW178', NULL, 'surendar.r@hepl.com', 43, '2,43', NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, NULL, NULL, NULL, 0),
(179, 4, '4', '1015168', 'Baskar Babu', 'IVIEW179', NULL, 'sugumar.v@hepl.com', 4, NULL, NULL, 0, 471, 45, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'lrQ9oa3nnd2pMA3gxTalh5qijqxIihSAIWSgfOpGv8cNSQEpU1fv2meY5kGd', NULL, NULL, NULL, NULL, 0),
(180, 4, '4', '1013145', 'Raja Reddy', 'IVIEW180', NULL, 'rajareddyk@yopmail.com', 4, NULL, NULL, 0, 471, 471, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'IsWAAKqzdqIRQDatNWi7I6z6pmRN62oqy3ziYAVxGqEiLVGz0Z9yblppyZf2', NULL, NULL, NULL, NULL, 0),
(181, 4, '4', '1013708', 'Hitendra', 'IVIEW181', NULL, 'hitendrab@yopmail.com', 4, NULL, NULL, 0, 182, 182, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, NULL, NULL, NULL, 0),
(182, 4, '4', '1013753', 'Germanus', 'IVIEW182', NULL, 'marshel@yopmail.com', 4, NULL, NULL, 1, 472, 182, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'JkNekAIZ404wex9q31W54gxovZeCT5ksp5hlrlm5ubH7RYafDkqKM3lOOs1m', NULL, NULL, NULL, NULL, 0),
(183, 5, '4', '100255', 'Bosco Akilan\r\n', 'IVIEW183', '', 'fm_pp@rohitindia.com', 4, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, NULL, NULL, NULL, 0),
(469, 4, '4', '900432', 'Surrender R', 'IVIEW469', NULL, 'surendar.r@yopmail.com', 43, '43', NULL, 0, 176, 50, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'ojpTLpf7g7sam4hCWCxJ18HQFwTmfWRNlpXKjlhfLG8xYtcr6qK5tEmNNpb6', NULL, NULL, NULL, NULL, 0),
(470, 5, '5', NULL, 'Mathivanan', 'IVIEW470', NULL, 'mathivanang@hepl.com', 44, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'YRa5jPPDrNGdO24SuuQ2m5wRhvabPRUASEAKVkAx94pWYABwA8vl7whmvfAW', NULL, '2023-09-28 09:34:34', NULL, NULL, 0),
(471, 4, '4', 'VD00020', 'Elango', 'IVIEW471', NULL, 'n.elango@yopmail.com', 4, NULL, NULL, 1, 472, 471, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'mezZJ4edd89duqoD5tjH3iYC04Ab4Qaxd2dqsjAP7E4TJoJuj3dELuhVgVBd', NULL, NULL, NULL, NULL, 0),
(472, 4, '4', '1', 'CKR', 'IVIEW472', NULL, 'ckr@yopmail.com', 5, '5', NULL, 1, NULL, NULL, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'mwZksZPaa2F0bqn7t8R24zrc1d6QIQeX0FzvpREkyoaSANhzwdgNFgQlQ1k8', NULL, NULL, NULL, NULL, 0),
(473, 4, '4', '900460', 'Karthikeyan', 'IVIEW473', NULL, 'karthikeyan.am@yopmail.com', 4, NULL, NULL, 1, 50, 50, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'mwZksZPaa2F0bqn7t8R24zrc1d6QIQeX0FzvpREkyoaSANhzwdgNFgQlQ1k8', NULL, NULL, NULL, NULL, 0),
(474, 4, '4', '1002356', 'Prabhakaran', 'IVIEW60', NULL, 'bm@yopmail.com', 3, NULL, 155, 0, 63, 44, 0, 9, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, '2022-07-01 05:40:09', '2022-07-01 05:40:09', NULL, 1),
(475, 4, '4', '5963', 'Ganesan kumar b', 'IVIEW61', NULL, 'sganesan@cavinkare.com', 46, '46', 155, 0, 63, 44, 0, 9, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, '2022-07-01 05:40:09', '2022-07-01 05:40:09', NULL, 1),
(476, 4, '4', '5963\r\n', 'Ganesan N\r\n', 'IVIEW', NULL, 'sganesan@yopmail.com', 42, NULL, NULL, 1, 50, 50, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', 'EzKjI4I8jSWqlh1iaW9Cc0SsFzfWKytp5L40yvkFgynJ3JlsBL71iviyePGT', NULL, NULL, NULL, NULL, 1),
(477, 4, '4', 'KCSL089', 'Daniel Jothikumar.G', 'IVIEW500', NULL, 'erodetanker@yopmail.com', 3, '3', NULL, 0, 176, 50, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, NULL, NULL, NULL, 1),
(478, 4, '4', '901126', 'Rathinavel.P', 'IVIEW181', NULL, 'rathinavel.p@yopmail.com\r\n', 4, NULL, NULL, 0, 182, 182, 0, NULL, NULL, '$2y$10$qRr7Y82o.mEat7uqGTxXFOLXiWNFjtO7QcorlsXwKyWaDjX19SFNW', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ba_approver_lists`
--
ALTER TABLE `ba_approver_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checklists`
--
ALTER TABLE `checklists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `first`
--
ALTER TABLE `first`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `invoice_activities`
--
ALTER TABLE `invoice_activities`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `masters`
--
ALTER TABLE `masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mis_report`
--
ALTER TABLE `mis_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_documents`
--
ALTER TABLE `other_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `preapproved_documents`
--
ALTER TABLE `preapproved_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_pics`
--
ALTER TABLE `profile_pics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qc_marks`
--
ALTER TABLE `qc_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requestor_tickets`
--
ALTER TABLE `requestor_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_flow_condition`
--
ALTER TABLE `ticket_flow_condition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users11111`
--
ALTER TABLE `users11111`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `usersold`
--
ALTER TABLE `usersold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ba_approver_lists`
--
ALTER TABLE `ba_approver_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `checklists`
--
ALTER TABLE `checklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `first`
--
ALTER TABLE `first`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_activities`
--
ALTER TABLE `invoice_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `masters`
--
ALTER TABLE `masters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=636;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mis_report`
--
ALTER TABLE `mis_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `other_documents`
--
ALTER TABLE `other_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preapproved_documents`
--
ALTER TABLE `preapproved_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile_pics`
--
ALTER TABLE `profile_pics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qc_marks`
--
ALTER TABLE `qc_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requestor_tickets`
--
ALTER TABLE `requestor_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ticket_flow_condition`
--
ALTER TABLE `ticket_flow_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users11111`
--
ALTER TABLE `users11111`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `usersold`
--
ALTER TABLE `usersold`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=479;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
