-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 07, 2019 at 03:37 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_hristins_dakic_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `adress_id` int(11) NOT NULL,
  `street_name` varchar(100) DEFAULT NULL,
  `house_number` varchar(50) DEFAULT NULL,
  `fk_zipcode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adress`
--

INSERT INTO `adress` (`adress_id`, `street_name`, `house_number`, `fk_zipcode`) VALUES
(1, 'Am Westbahnhof', '1', '1150'),
(2, 'Am Hauptbahnhof', '2', '1100'),
(3, 'Guntherstrasse', '3', '1150'),
(4, 'Bestegasse', '5', '1070'),
(5, 'Oberegasse', '3', '1080'),
(6, 'Unteregasse', '4', '1070');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `registration_num` varchar(55) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_model_id` int(11) DEFAULT NULL,
  `fk_discount_id` int(11) DEFAULT NULL,
  `daily_rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`registration_num`, `fk_location_id`, `fk_model_id`, `fk_discount_id`, `daily_rate`) VALUES
('BH54322', 2, 1, 1, 31),
('MN32456', 1, 3, 1, 45),
('W245366', 2, 3, 1, 31),
('W352506', 1, 1, 1, 44),
('WV53573', 1, 4, NULL, 60),
('YX43567', 2, 2, NULL, 33);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `zipcode` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`zipcode`, `city`, `state`) VALUES
('1070', 'Vienna', 'Austria'),
('1080', 'Vienna', 'Austria'),
('1100', 'Vienna', 'Austria'),
('1120', 'Vienna', 'Austria'),
('1150', 'Vienna', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `fk_adress_id` int(11) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `driving_licence` varchar(55) DEFAULT NULL,
  `customer_phone` int(20) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `fk_adress_id`, `first_name`, `last_name`, `birth_date`, `driving_licence`, `customer_phone`, `customer_email`) VALUES
(11, 3, 'Hristina', 'Dakic', '1978-12-03', 'AB12345', 699123456, 'hristina.dakic@gmail.com'),
(12, 3, 'John', 'Bester', '1986-04-05', 'XY34566', 699124568, 'bester@gmail.com'),
(13, 5, 'Maria', 'Ober', '1987-03-05', 'LA54367', 676124786, 'ober@gmail.com'),
(14, 6, 'Anna', 'Unter', '1976-06-08', 'VW5373536', 676544371, 'unter@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL,
  `discount_amount` int(10) DEFAULT NULL,
  `discount_description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`discount_id`, `discount_amount`, `discount_description`) VALUES
(1, 25, 'Christmas special'),
(2, 30, 'Summer special');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_num` int(11) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL,
  `payment_details` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_num`, `invoice_date`, `payment_amount`, `payment_details`) VALUES
(111, '2019-09-06', 132, 'Creditcard'),
(112, '2019-09-05', 213, 'PayPal'),
(113, '2019-09-07', 138, 'Bank Transfer'),
(114, '2019-09-07', 213, 'Creditcard');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `fk_adress_id` int(11) DEFAULT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  `location_phone` int(11) DEFAULT NULL,
  `location_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `fk_adress_id`, `location_name`, `location_phone`, `location_email`) VALUES
(1, 1, 'Westpoint Car Rental', 1723459, 'westpoint@gmail.com'),
(2, 2, 'Hauptpoint Car Rental', 1723458, 'hauptpoint@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `model_id` int(11) NOT NULL,
  `fk_specification_id` int(10) UNSIGNED DEFAULT NULL,
  `model_name` varchar(55) DEFAULT NULL,
  `production_year` int(11) DEFAULT NULL,
  `category` enum('limousine','suv','cabrio','pick-up','mini-bus','van') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`model_id`, `fk_specification_id`, `model_name`, `production_year`, `category`) VALUES
(1, 1, 'Audi A4', 2015, 'limousine'),
(2, 2, 'Opel Astra', 2016, 'limousine'),
(3, 3, 'BMW', 2014, 'cabrio'),
(4, 4, ' VW Caddy', 2013, 'mini-bus');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_num` int(10) UNSIGNED NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_pick_up_location` int(11) DEFAULT NULL,
  `fk_return_location` int(11) DEFAULT NULL,
  `fk_invoice_num` int(11) DEFAULT NULL,
  `fk_registration_num` varchar(55) DEFAULT NULL,
  `pick_up_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_num`, `fk_customer_id`, `fk_pick_up_location`, `fk_return_location`, `fk_invoice_num`, `fk_registration_num`, `pick_up_date`, `return_date`) VALUES
(111, 11, 2, 2, 111, 'BH54322', '2019-09-06', '2019-09-09'),
(112, 12, 1, 2, 112, 'W245366', '2019-09-05', '2019-09-08'),
(113, 14, 2, 2, 113, 'WV53573', '2019-09-08', '2019-09-14'),
(114, 13, 1, 1, 114, 'W352506', '2019-09-12', '2019-09-15');

-- --------------------------------------------------------

--
-- Table structure for table `specifications`
--

CREATE TABLE `specifications` (
  `specification_id` int(10) UNSIGNED NOT NULL,
  `AC` enum('yes','no') DEFAULT NULL,
  `gearing` enum('Manual','Automatic') DEFAULT NULL,
  `passanger_num` int(11) DEFAULT NULL,
  `door_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `specifications`
--

INSERT INTO `specifications` (`specification_id`, `AC`, `gearing`, `passanger_num`, `door_num`) VALUES
(1, 'yes', 'Manual', 5, 5),
(2, 'no', 'Automatic', 5, 3),
(3, 'yes', 'Manual', 2, 2),
(4, 'yes', 'Automatic', 8, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`adress_id`),
  ADD KEY `fk_zipcode` (`fk_zipcode`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`registration_num`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_model_id` (`fk_model_id`),
  ADD KEY `fk_discount_id` (`fk_discount_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`zipcode`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_num`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `fk_specification_id` (`fk_specification_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_num`),
  ADD KEY `fk_pick_up_location` (`fk_pick_up_location`),
  ADD KEY `fk_return_location` (`fk_return_location`),
  ADD KEY `fk_invoice_num` (`fk_invoice_num`),
  ADD KEY `fk_registration_num` (`fk_registration_num`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `specifications`
--
ALTER TABLE `specifications`
  ADD PRIMARY KEY (`specification_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_num` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `specifications`
--
ALTER TABLE `specifications`
  MODIFY `specification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`fk_zipcode`) REFERENCES `city` (`zipcode`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`fk_model_id`) REFERENCES `models` (`model_id`),
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`fk_discount_id`) REFERENCES `discounts` (`discount_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`);

--
-- Constraints for table `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_ibfk_1` FOREIGN KEY (`fk_specification_id`) REFERENCES `specifications` (`specification_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_pick_up_location`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_return_location`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_invoice_num`) REFERENCES `invoice` (`invoice_num`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`fk_registration_num`) REFERENCES `cars` (`registration_num`),
  ADD CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
