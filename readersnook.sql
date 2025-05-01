-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: readers_nook
-- ------------------------------------------------------
-- Server version	8.0.41
CREATE DATABASE IF NOT EXISTS readersnook;
USE readersnook;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adjustment`
--

DROP TABLE IF EXISTS `adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjustment` (
  `Adjustment_ID` int NOT NULL AUTO_INCREMENT,
  `Relation` varchar(100) NOT NULL,
  `Attribute_Changed` varchar(100) NOT NULL,
  `Activity` enum('INSERT','UPDATE','Delete') NOT NULL,
  `Prev_Value` varchar(100) NOT NULL,
  `New_Value` varchar(100) NOT NULL,
  `RecordedOn` date NOT NULL,
  `RecordedBy` int DEFAULT NULL,
  PRIMARY KEY (`Adjustment_ID`),
  KEY `fk_recorder_by_user_idx` (`RecordedBy`),
  CONSTRAINT `fk_recorder_by_user` FOREIGN KEY (`RecordedBy`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustment`
--

LOCK TABLES `adjustment` WRITE;
/*!40000 ALTER TABLE `adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `Author_ID` int NOT NULL AUTO_INCREMENT,
  `Author_Name` varchar(70) NOT NULL,
  `RecordedOn` date NOT NULL,
  PRIMARY KEY (`Author_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` int NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `PublicationDate` date NOT NULL,
  `AisleLocation` varchar(20) NOT NULL,
  `StockQuantity` int NOT NULL,
  `RecordedOn` date NOT NULL,
  `RecordedBy` int DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `RecordedBy` (`RecordedBy`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`RecordedBy`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_delivered`
--

DROP TABLE IF EXISTS `book_delivered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_delivered` (
  `Book_Delivered_ID` int NOT NULL AUTO_INCREMENT,
  `Delivery_ID` int DEFAULT NULL,
  `ISBN` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  `Unitcost` decimal(10,2) NOT NULL,
  `RecordedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `RecordedBy` int DEFAULT NULL,
  PRIMARY KEY (`Book_Delivered_ID`),
  KEY `Delivery_ID` (`Delivery_ID`),
  KEY `ISBN` (`ISBN`),
  KEY `RecordedBy` (`RecordedBy`),
  CONSTRAINT `book_delivered_ibfk_1` FOREIGN KEY (`Delivery_ID`) REFERENCES `delivery` (`Delivery_ID`),
  CONSTRAINT `book_delivered_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `book_delivered_ibfk_3` FOREIGN KEY (`RecordedBy`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_delivered`
--

LOCK TABLES `book_delivered` WRITE;
/*!40000 ALTER TABLE `book_delivered` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_delivered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `Delivery_ID` int NOT NULL AUTO_INCREMENT,
  `Receipt_No` varchar(50) NOT NULL,
  `Publisher_ID` int DEFAULT NULL,
  `Delivery_Status` varchar(20) DEFAULT 'Pending',
  `RecordedBy` int DEFAULT NULL,
  PRIMARY KEY (`Delivery_ID`),
  KEY `Publisher_ID` (`Publisher_ID`),
  KEY `RecordedBy` (`RecordedBy`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Publisher_ID`) REFERENCES `publisher` (`Publisher_ID`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`RecordedBy`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `Genre_ID` int NOT NULL AUTO_INCREMENT,
  `Genre` varchar(100) NOT NULL,
  `RecordedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `RecordedBy` int DEFAULT NULL,
  PRIMARY KEY (`Genre_ID`),
  KEY `RecordedBy` (`RecordedBy`),
  CONSTRAINT `genre_ibfk_1` FOREIGN KEY (`RecordedBy`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `Position_ID` int NOT NULL AUTO_INCREMENT,
  `Position` varchar(45) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Position_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `Publisher_ID` int NOT NULL,
  `Supplier_Name` varchar(100) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Contact_No` varchar(20) DEFAULT NULL,
  `RecordOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `RecordedBy` int NOT NULL,
  PRIMARY KEY (`Publisher_ID`),
  KEY `RecordedBy` (`RecordedBy`),
  CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`RecordedBy`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `Sale_ID` int NOT NULL,
  `RecordedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `RecordedBy` int NOT NULL,
  PRIMARY KEY (`Sale_ID`),
  KEY `RecordedBy` (`RecordedBy`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`RecordedBy`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_item`
--

DROP TABLE IF EXISTS `sale_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_item` (
  `Sale_ID` int DEFAULT NULL,
  `ISBN` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  KEY `Sale_ID` (`Sale_ID`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `sale_item_ibfk_1` FOREIGN KEY (`Sale_ID`) REFERENCES `sale` (`Sale_ID`),
  CONSTRAINT `sale_item_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_item`
--

LOCK TABLES `sale_item` WRITE;
/*!40000 ALTER TABLE `sale_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Sex` enum('m','f') NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Position_ID` int DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `fk_position_idx` (`Position_ID`),
  CONSTRAINT `fk_position` FOREIGN KEY (`Position_ID`) REFERENCES `position` (`Position_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-01 13:40:09
