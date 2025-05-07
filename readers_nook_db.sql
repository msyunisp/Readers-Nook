-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: May 05, 2025 at 02:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `readers_nook_db`
--
CREATE DATABASE IF NOT EXISTS `readers_nook_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `readers_nook_db`;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `activity_type_id` int(11) DEFAULT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `user_id`, `activity_type_id`, `reference_type`, `reference_id`) VALUES
(1, 1, 1, 'Book', 1001),
(2, 2, 1, 'Book', 1002),
(3, 3, 2, 'Stock', 1003),
(4, 4, 3, 'User', 1004),
(5, 5, 4, 'User', 1005);

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `activity_log_id` int(11) NOT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `attribute` varchar(50) DEFAULT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`activity_log_id`, `activity_id`, `attribute`, `old_value`, `new_value`) VALUES
(1, 1, 'Book Title', 'Old Book Title', 'New Book Title'),
(2, 2, 'Stock Level', '10', '15'),
(3, 3, 'Price', '100', '120'),
(4, 4, 'User Role', 'Customer', 'Admin'),
(5, 5, 'Email', 'oldemail@example.com', 'newemail@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `activity_type`
--

CREATE TABLE `activity_type` (
  `activity_type_id` int(11) NOT NULL,
  `activity_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_type`
--

INSERT INTO `activity_type` (`activity_type_id`, `activity_type`) VALUES
(1, 'Borrow'),
(2, 'Return'),
(3, 'Reserve'),
(4, 'Cancel Reservation'),
(5, 'Late Return');

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_Name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `first_Name`, `middle_name`, `last_name`) VALUES
(1, 'George', 'R.', 'Martin'),
(2, 'J.K.', NULL, 'Rowling'),
(3, 'J.R.R.', NULL, 'Tolkien'),
(4, 'Agatha', NULL, 'Christie'),
(5, 'Stephen', NULL, 'King'),
(6, 'Haruki', NULL, 'Murakami'),
(7, 'Jane', NULL, 'Austen'),
(8, 'Mark', NULL, 'Twain'),
(9, 'Ernest', NULL, 'Hemingway'),
(10, 'Leo', NULL, 'Tolstoy');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` int(11) NOT NULL,
  `book_title` varchar(200) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `publication_year` year(4) DEFAULT NULL,
  `stock_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `book_title`, `unit_price`, `section_id`, `description`, `publication_year`, `stock_level`) VALUES
(67, 'Atomic Habits', 780, 5, 'A self-help guide by James Clear about forming good habits and breaking bad ones.', '2018', 13),
(123, 'Of Mice and Men', 499, 1, 'A classic novella by John Steinbeck about the dreams and struggles of two displaced ranch workers.', '1993', 12),
(125, 'Harry Potter and the Goblet of Fire', 899, 2, 'The fourth installment in the Harry Potter series, where Harry competes in the Triwizard Tournament.', '2000', 20),
(152, 'Steve Jobs', 850, 4, 'A biography by Walter Isaacson based on the life of Apple co-founder Steve Jobs.', '2011', 6),
(190, 'Charlotte’s Web', 430, 6, 'A children’s novel by E.B. White about a pig named Wilbur and his friendship with a spider.', '2004', 18),
(215, 'The Girl with the Dragon Tattoo', 750, 3, 'A mystery-thriller by Stieg Larsson involving a journalist and a hacker.', '2008', 8),
(218, 'The Road', 690, 1, 'A post-apocalyptic novel by Cormac McCarthy about a father and son’s journey.', '2006', 7),
(224, 'The Hobbit', 650, 2, 'A fantasy novel by J.R.R. Tolkien following the adventure of Bilbo Baggins.', '2005', 10),
(234, 'To Kill a Mockingbird', 599, 1, 'A novel by Harper Lee exploring racial injustice and moral growth in the Deep South.', '2006', 15),
(275, 'Zen and the Art of Motorcycle Maintenance', 720, 5, 'A philosophical novel by Robert M. Pirsig exploring quality and values.', '1999', 9);

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `ISBN` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`ISBN`, `author_id`) VALUES
(67, 3),
(67, 7),
(123, 1),
(123, 6),
(125, 2),
(125, 5),
(152, 6),
(190, 1),
(190, 4),
(190, 8),
(215, 2),
(215, 4),
(218, 10),
(224, 5),
(234, 3),
(275, 7),
(275, 9);

-- --------------------------------------------------------

--
-- Table structure for table `book_delivered`
--

CREATE TABLE `book_delivered` (
  `book_delivered_id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `ISBN` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_delivered`
--

INSERT INTO `book_delivered` (`book_delivered_id`, `delivery_id`, `ISBN`, `quantity`, `unit_cost`) VALUES
(1, 1, 218, 50, 224),
(2, 2, 67, 30, 125),
(3, 3, 224, 20, 123),
(4, 4, 234, 40, 67),
(5, 5, 190, 25, 234);

-- --------------------------------------------------------

--
-- Table structure for table `book_genre`
--

CREATE TABLE `book_genre` (
  `ISBN` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_genre`
--

INSERT INTO `book_genre` (`ISBN`, `genre_id`) VALUES
(67, 7),
(123, 1),
(125, 2),
(152, 6),
(190, 8),
(215, 4),
(218, 10),
(224, 5),
(234, 3),
(275, 9);

-- --------------------------------------------------------

--
-- Table structure for table `book_sale`
--

CREATE TABLE `book_sale` (
  `ISBN` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_sale`
--

INSERT INTO `book_sale` (`ISBN`, `sale_id`, `quantity`) VALUES
(123, 1, 3),
(125, 2, 2),
(152, 4, 1),
(190, 5, 4),
(224, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `book_supplier`
--

CREATE TABLE `book_supplier` (
  `supplier_id` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_supplier`
--

INSERT INTO `book_supplier` (`supplier_id`, `ISBN`) VALUES
(1, 234),
(2, 224),
(3, 190),
(4, 67),
(5, 218);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `SI_no` varchar(50) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `delivered_on` date DEFAULT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `SI_no`, `supplier_id`, `status_id`, `delivered_on`, `comments`) VALUES
(1, 'SI001', 1, 1, '2025-04-10', 'Delivery pending due to stock availability'),
(2, 'SI002', 2, 2, '2025-04-12', 'Shipped on time, arrived in good condition'),
(3, 'SI003', 3, 3, '2025-04-14', 'Successfully delivered, no issues reported'),
(4, 'SI004', 4, 4, '2025-04-16', 'Return initiated due to damaged goods'),
(5, 'SI005', 5, 5, '2025-04-18', 'Cancelled due to supplier error');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_status`
--

CREATE TABLE `delivery_status` (
  `delivery_status_id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_status`
--

INSERT INTO `delivery_status` (`delivery_status_id`, `status`) VALUES
(1, 'Pending'),
(2, 'Shipped'),
(3, 'Delivered'),
(4, 'Returned'),
(5, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
(1, 'Science Fiction'),
(2, 'Romance'),
(3, 'Mystery'),
(4, 'Fantasy'),
(5, 'Historical'),
(6, 'Biography'),
(7, 'Self-Help'),
(8, 'Thriller'),
(9, 'Children'),
(10, 'Non-Fiction');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Cashier'),
(3, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_id` int(11) NOT NULL,
  `sold_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`sale_id`, `sold_on`) VALUES
(1, '2025-05-01 10:30:00'),
(2, '2025-05-02 14:45:00'),
(3, '2025-05-03 09:15:00'),
(4, '2025-05-04 11:00:00'),
(5, '2025-05-05 13:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(50) DEFAULT NULL,
  `section_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section_name`, `section_type_id`) VALUES
(1, 'Modern Literature', 1),
(2, 'Biographies', 2),
(3, 'Science & Tech Reference', 3),
(4, 'Kids Corner', 4),
(5, 'Magazines', 5),
(6, 'Audio Visuals', 6),
(7, 'Historical Fiction', 1),
(8, 'Self Help', 2),
(9, 'Academic Journals', 3),
(10, 'Early Readers', 4);

-- --------------------------------------------------------

--
-- Table structure for table `section_type`
--

CREATE TABLE `section_type` (
  `section_type_id` int(11) NOT NULL,
  `section_type_name` varchar(50) DEFAULT NULL,
  `max_shelf_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_type`
--

INSERT INTO `section_type` (`section_type_id`, `section_type_name`, `max_shelf_no`) VALUES
(1, 'Fiction', 10),
(2, 'Non-Fiction', 12),
(3, 'Reference', 8),
(4, 'Children', 6),
(5, 'Periodicals', 5),
(6, 'Multimedia', 4);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `supplier_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `email`, `street`, `city`, `post_code`, `supplier_type_id`) VALUES
(1, 'Books Direct', 'contact@booksdirect.com', '123 Book St', 'New York', '10001', 1),
(2, 'Global Books', 'info@globalbooks.com', '456 Globe Rd', 'London', 'EC1V 2NX', 2),
(3, 'Online Library Supplies', 'sales@onlinelibrarysupplies.com', '789 Web Ave', 'San Francisco', '94105', 3),
(4, 'Book Wholesalers', 'contact@bookwholesalers.com', '101 Wholesale Blvd', 'Los Angeles', '90001', 4),
(5, 'Govt. Print Services', 'service@govtprints.com', '202 Government Rd', 'Washington D.C.', '20500', 5);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_type`
--

CREATE TABLE `supplier_type` (
  `supplier_type_id` int(11) NOT NULL,
  `supplier_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_type`
--

INSERT INTO `supplier_type` (`supplier_type_id`, `supplier_type`) VALUES
(1, 'Local Supplier'),
(2, 'International Supplier'),
(3, 'Online Supplier'),
(4, 'Wholesale Supplier'),
(5, 'Government Supplier');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_Name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `contact_no` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_Name`, `middle_name`, `last_name`, `contact_no`, `email`, `street`, `city`, `post_code`, `role_id`, `date_of_birth`, `password`) VALUES
(1, 'Anna', 'Marie', 'Santos', '09171234567', 'anna.santos@example.com', '123 Mango St.', 'Quezon City', '1101', 2, '1995-04-12', 'passAnna123'),
(2, 'Juan', 'Reyes', 'Dela Cruz', '09181234567', 'juan.dc@example.com', '456 Banana Ave.', 'Manila', '1000', 2, '1988-09-05', 'secureJuan88'),
(3, 'Maria', 'Luz', 'Garcia', '09191234567', 'maria.garcia@example.com', '789 Pine Rd.', 'Cebu City', '6000', 1, '1990-02-20', 'adminMaria90'),
(4, 'Carlos', 'Miguel', 'Lopez', '09201234567', 'carlos.lopez@example.com', '321 Acacia Ln.', 'Davao City', '8000', 2, '1999-06-30', 'userCarlos99'),
(5, 'Grace', 'Angeles', 'Torres', '09211234567', 'grace.torres@example.com', '654 Narra Blvd.', 'Makati', '1226', 2, '2000-11-15', 'guestGrace00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `activity_type_id` (`activity_type_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`activity_log_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `activity_type`
--
ALTER TABLE `activity_type`
  ADD PRIMARY KEY (`activity_type_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`ISBN`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `book_delivered`
--
ALTER TABLE `book_delivered`
  ADD PRIMARY KEY (`book_delivered_id`),
  ADD KEY `delivery_id` (`delivery_id`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `book_genre`
--
ALTER TABLE `book_genre`
  ADD PRIMARY KEY (`ISBN`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `book_sale`
--
ALTER TABLE `book_sale`
  ADD PRIMARY KEY (`ISBN`,`sale_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `book_supplier`
--
ALTER TABLE `book_supplier`
  ADD PRIMARY KEY (`supplier_id`,`ISBN`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `delivery_status`
--
ALTER TABLE `delivery_status`
  ADD PRIMARY KEY (`delivery_status_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `section_type_id` (`section_type_id`);

--
-- Indexes for table `section_type`
--
ALTER TABLE `section_type`
  ADD PRIMARY KEY (`section_type_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supplier_type_id` (`supplier_type_id`);

--
-- Indexes for table `supplier_type`
--
ALTER TABLE `supplier_type`
  ADD PRIMARY KEY (`supplier_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `activity_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `book_delivered`
--
ALTER TABLE `book_delivered`
  MODIFY `book_delivered_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery_status`
--
ALTER TABLE `delivery_status`
  MODIFY `delivery_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `section_type`
--
ALTER TABLE `section_type`
  MODIFY `section_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier_type`
--
ALTER TABLE `supplier_type`
  MODIFY `supplier_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `activity_ibfk_2` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_type` (`activity_type_id`);

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints for table `book_delivered`
--
ALTER TABLE `book_delivered`
  ADD CONSTRAINT `book_delivered_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`),
  ADD CONSTRAINT `book_delivered_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`);

--
-- Constraints for table `book_genre`
--
ALTER TABLE `book_genre`
  ADD CONSTRAINT `book_genre_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `book_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`);

--
-- Constraints for table `book_sale`
--
ALTER TABLE `book_sale`
  ADD CONSTRAINT `book_sale_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `book_sale_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`);

--
-- Constraints for table `book_supplier`
--
ALTER TABLE `book_supplier`
  ADD CONSTRAINT `book_supplier_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `book_supplier_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `delivery_status` (`delivery_status_id`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`section_type_id`) REFERENCES `section_type` (`section_type_id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`supplier_type_id`) REFERENCES `supplier_type` (`supplier_type_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
