-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2019 at 12:02 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bacsilog`
--

-- --------------------------------------------------------

--
-- Table structure for table `document_agreement`
--

CREATE TABLE `document_agreement` (
  `id` int(10) NOT NULL,
  `da_date` date DEFAULT NULL,
  `da_status` varchar(10) DEFAULT NULL,
  `da_duration` date DEFAULT NULL,
  `franchisee_id` int(10) NOT NULL,
  `franchisee_franchisee_id` int(10) NOT NULL,
  `franchisee_management_id` int(10) NOT NULL,
  `franchisee_document_agreement_id` int(10) NOT NULL,
  `franchisee_form_id` int(10) NOT NULL,
  `franchisee_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `id` int(10) NOT NULL,
  `franchisee_id` int(10) NOT NULL,
  `franchisee_franchisee_id` int(10) NOT NULL,
  `franchisee_management_id` int(10) NOT NULL,
  `franchisee_document_agreement_id` int(10) NOT NULL,
  `franchisee_form_id` int(10) NOT NULL,
  `franchisee_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `franchisee`
--

CREATE TABLE `franchisee` (
  `id` int(10) NOT NULL,
  `fran_fname` varchar(20) DEFAULT NULL,
  `fran_lname` varchar(20) DEFAULT NULL,
  `fran_birthday` date DEFAULT NULL,
  `fran_address` varchar(20) DEFAULT NULL,
  `fran_salary` int(10) DEFAULT NULL,
  `fran_email` varchar(20) DEFAULT NULL,
  `fran_num` int(12) DEFAULT NULL,
  `franchisee_id` int(10) NOT NULL,
  `management_id` int(10) NOT NULL,
  `document_agreement_id` int(10) NOT NULL,
  `form_id` int(10) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `franchisee`
--

INSERT INTO `franchisee` (`id`, `fran_fname`, `fran_lname`, `fran_birthday`, `fran_address`, `fran_salary`, `fran_email`, `fran_num`, `franchisee_id`, `management_id`, `document_agreement_id`, `form_id`, `location_id`) VALUES
(1, 'Jo', 'Sy', '1989-05-09', 'Makati City', 50000, 'js@gmail.com', 2147483647, 1, 551, 221, 331, 441),
(2, 'OJ', 'Ty', '1991-07-02', 'Taguig City', 75000, 'ot@gmail.com', 2147483647, 2, 552, 222, 332, 442);

-- --------------------------------------------------------

--
-- Table structure for table `franchisee_has_management`
--

CREATE TABLE `franchisee_has_management` (
  `franchisee_id` int(10) NOT NULL,
  `franchisee_franchisee_id` int(10) NOT NULL,
  `franchisee_management_id` int(10) NOT NULL,
  `franchisee_document_agreement_id` int(10) NOT NULL,
  `franchisee_form_id` int(10) NOT NULL,
  `franchisee_location_id` int(11) NOT NULL,
  `management_id` int(10) NOT NULL,
  `management_location_id` int(11) NOT NULL,
  `management_executive_id` int(10) NOT NULL,
  `management_finance_fin_dept` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `franchisee_has_management`
--

INSERT INTO `franchisee_has_management` (`franchisee_id`, `franchisee_franchisee_id`, `franchisee_management_id`, `franchisee_document_agreement_id`, `franchisee_form_id`, `franchisee_location_id`, `management_id`, `management_location_id`, `management_executive_id`, `management_finance_fin_dept`) VALUES
(1, 1, 551, 221, 331, 441, 551, 441, 661, 771),
(2, 2, 552, 222, 332, 442, 552, 442, 662, 772);

-- --------------------------------------------------------

--
-- Stand-in structure for view `franchisee_management`
-- (See below for the actual view)
--
CREATE TABLE `franchisee_management` (
`franchisee_id` int(10)
,`fran_fname` varchar(20)
,`fran_lname` varchar(20)
,`fran_salary` int(10)
,`management_id` int(10)
,`manage_dept` varchar(10)
,`manage_employee` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `franchise_fee`
--

CREATE TABLE `franchise_fee` (
  `id` int(10) NOT NULL,
  `fran_fee_amount` int(10) DEFAULT NULL,
  `fran_fee_receipt` int(10) DEFAULT NULL,
  `franchisee_id` int(10) NOT NULL,
  `franchisee_franchisee_id` int(10) NOT NULL,
  `franchisee_management_id` int(10) NOT NULL,
  `franchisee_document_agreement_id` int(10) NOT NULL,
  `franchisee_form_id` int(10) NOT NULL,
  `franchisee_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `id` int(10) NOT NULL,
  `lic_code` int(10) DEFAULT NULL,
  `franchisee_id` int(10) NOT NULL,
  `franchisee_franchisee_id` int(10) NOT NULL,
  `franchisee_management_id` int(10) NOT NULL,
  `franchisee_document_agreement_id` int(10) NOT NULL,
  `franchisee_form_id` int(10) NOT NULL,
  `franchisee_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `id` int(10) NOT NULL,
  `manage_dept` varchar(10) DEFAULT NULL,
  `manage_employee` varchar(10) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `executive_id` int(10) NOT NULL,
  `finance_fin_dept` int(11) NOT NULL,
  `location_id1` int(11) NOT NULL,
  `management_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`id`, `manage_dept`, `manage_employee`, `location_id`, `executive_id`, `finance_fin_dept`, `location_id1`, `management_id`) VALUES
(551, 'Marketing', 'Lucky Chan', 441, 661, 771, 441, 551),
(552, 'Executive', 'Tim Bang', 442, 662, 772, 442, 552);

-- --------------------------------------------------------

--
-- Table structure for table `management_has_financial_review`
--

CREATE TABLE `management_has_financial_review` (
  `management_id` int(10) NOT NULL,
  `management_location_id` int(11) NOT NULL,
  `management_executive_id` int(10) NOT NULL,
  `management_finance_fin_dept` int(11) NOT NULL,
  `financial_review_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `management_has_stall`
--

CREATE TABLE `management_has_stall` (
  `management_id` int(10) NOT NULL,
  `management_location_id` int(11) NOT NULL,
  `management_executive_id` int(10) NOT NULL,
  `management_finance_fin_dept` int(11) NOT NULL,
  `stall_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `royalty`
--

CREATE TABLE `royalty` (
  `id` int(11) NOT NULL,
  `royal_date` date DEFAULT NULL,
  `royal_expiry` date DEFAULT NULL,
  `franchisee_id` int(10) NOT NULL,
  `franchisee_franchisee_id` int(10) NOT NULL,
  `franchisee_management_id` int(10) NOT NULL,
  `franchisee_document_agreement_id` int(10) NOT NULL,
  `franchisee_form_id` int(10) NOT NULL,
  `franchisee_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `franchisee_management`
--
DROP TABLE IF EXISTS `franchisee_management`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `franchisee_management`  AS  select `franchisee`.`franchisee_id` AS `franchisee_id`,`franchisee`.`fran_fname` AS `fran_fname`,`franchisee`.`fran_lname` AS `fran_lname`,`franchisee`.`fran_salary` AS `fran_salary`,`management`.`management_id` AS `management_id`,`management`.`manage_dept` AS `manage_dept`,`management`.`manage_employee` AS `manage_employee` from ((`franchisee` join `franchisee_has_management` on(`franchisee`.`franchisee_id` = `franchisee_has_management`.`franchisee_id`)) join `management` on(`management`.`management_id` = `franchisee_has_management`.`management_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `document_agreement`
--
ALTER TABLE `document_agreement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_document_agreement_franchisee1_idx` (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_form_franchisee1_idx` (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`);

--
-- Indexes for table `franchisee`
--
ALTER TABLE `franchisee`
  ADD PRIMARY KEY (`id`,`franchisee_id`,`management_id`,`document_agreement_id`,`form_id`,`location_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `franchisee_has_management`
--
ALTER TABLE `franchisee_has_management`
  ADD PRIMARY KEY (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`,`management_id`,`management_location_id`,`management_executive_id`,`management_finance_fin_dept`),
  ADD KEY `fk_franchisee_has_management_management1_idx` (`management_id`,`management_location_id`,`management_executive_id`,`management_finance_fin_dept`),
  ADD KEY `fk_franchisee_has_management_franchisee1_idx` (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`);

--
-- Indexes for table `franchise_fee`
--
ALTER TABLE `franchise_fee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_franchise_fee_franchisee1_idx` (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_license_franchisee1_idx` (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`id`,`location_id`,`executive_id`,`finance_fin_dept`),
  ADD KEY `fk_management_executive1_idx` (`executive_id`),
  ADD KEY `fk_management_finance1_idx` (`finance_fin_dept`),
  ADD KEY `fk_management_location1_idx` (`location_id1`);

--
-- Indexes for table `management_has_financial_review`
--
ALTER TABLE `management_has_financial_review`
  ADD PRIMARY KEY (`management_id`,`management_location_id`,`management_executive_id`,`management_finance_fin_dept`,`financial_review_id`),
  ADD KEY `fk_management_has_financial_review_financial_review1_idx` (`financial_review_id`),
  ADD KEY `fk_management_has_financial_review_management1_idx` (`management_id`,`management_location_id`,`management_executive_id`,`management_finance_fin_dept`);

--
-- Indexes for table `management_has_stall`
--
ALTER TABLE `management_has_stall`
  ADD PRIMARY KEY (`management_id`,`management_location_id`,`management_executive_id`,`management_finance_fin_dept`,`stall_id`),
  ADD KEY `fk_management_has_stall_stall1_idx` (`stall_id`),
  ADD KEY `fk_management_has_stall_management1_idx` (`management_id`,`management_location_id`,`management_executive_id`,`management_finance_fin_dept`);

--
-- Indexes for table `royalty`
--
ALTER TABLE `royalty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_royalty_franchisee1_idx` (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `franchisee`
--
ALTER TABLE `franchisee`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `franchise_fee`
--
ALTER TABLE `franchise_fee`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management`
--
ALTER TABLE `management`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=553;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `document_agreement`
--
ALTER TABLE `document_agreement`
  ADD CONSTRAINT `fk_document_agreement_franchisee1` FOREIGN KEY (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`) REFERENCES `franchisee` (`id`, `franchisee_id`, `management_id`, `document_agreement_id`, `form_id`, `location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `form`
--
ALTER TABLE `form`
  ADD CONSTRAINT `fk_form_franchisee1` FOREIGN KEY (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`) REFERENCES `franchisee` (`id`, `franchisee_id`, `management_id`, `document_agreement_id`, `form_id`, `location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `franchisee_has_management`
--
ALTER TABLE `franchisee_has_management`
  ADD CONSTRAINT `fk_franchisee_has_management_franchisee1` FOREIGN KEY (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`) REFERENCES `franchisee` (`id`, `franchisee_id`, `management_id`, `document_agreement_id`, `form_id`, `location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_franchisee_has_management_management1` FOREIGN KEY (`management_id`,`management_location_id`,`management_executive_id`,`management_finance_fin_dept`) REFERENCES `management` (`id`, `location_id`, `executive_id`, `finance_fin_dept`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `franchise_fee`
--
ALTER TABLE `franchise_fee`
  ADD CONSTRAINT `fk_franchise_fee_franchisee1` FOREIGN KEY (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`) REFERENCES `franchisee` (`id`, `franchisee_id`, `management_id`, `document_agreement_id`, `form_id`, `location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `license`
--
ALTER TABLE `license`
  ADD CONSTRAINT `fk_license_franchisee1` FOREIGN KEY (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`) REFERENCES `franchisee` (`id`, `franchisee_id`, `management_id`, `document_agreement_id`, `form_id`, `location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `management`
--
ALTER TABLE `management`
  ADD CONSTRAINT `fk_management_executive1` FOREIGN KEY (`executive_id`) REFERENCES `mydb`.`executive` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_management_finance1` FOREIGN KEY (`finance_fin_dept`) REFERENCES `mydb`.`finance` (`fin_dept`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_management_location1` FOREIGN KEY (`location_id1`) REFERENCES `mydb`.`stall` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `management_has_financial_review`
--
ALTER TABLE `management_has_financial_review`
  ADD CONSTRAINT `fk_management_has_financial_review_financial_review1` FOREIGN KEY (`financial_review_id`) REFERENCES `mydb`.`financial_review` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_management_has_financial_review_management1` FOREIGN KEY (`management_id`,`management_location_id`,`management_executive_id`,`management_finance_fin_dept`) REFERENCES `management` (`id`, `location_id`, `executive_id`, `finance_fin_dept`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `management_has_stall`
--
ALTER TABLE `management_has_stall`
  ADD CONSTRAINT `fk_management_has_stall_management1` FOREIGN KEY (`management_id`,`management_location_id`,`management_executive_id`,`management_finance_fin_dept`) REFERENCES `management` (`id`, `location_id`, `executive_id`, `finance_fin_dept`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_management_has_stall_stall1` FOREIGN KEY (`stall_id`) REFERENCES `mydb`.`stall` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `royalty`
--
ALTER TABLE `royalty`
  ADD CONSTRAINT `fk_royalty_franchisee1` FOREIGN KEY (`franchisee_id`,`franchisee_franchisee_id`,`franchisee_management_id`,`franchisee_document_agreement_id`,`franchisee_form_id`,`franchisee_location_id`) REFERENCES `franchisee` (`id`, `franchisee_id`, `management_id`, `document_agreement_id`, `form_id`, `location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
