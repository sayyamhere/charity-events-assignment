-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: charityevents_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Fun Run'),(2,'Gala Dinner'),(3,'Auction'),(4,'Concert'),(5,'Community Event');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `organisation_id` int NOT NULL,
  `category_id` int NOT NULL,
  `event_name` varchar(150) NOT NULL,
  `description` text,
  `event_date` date NOT NULL,
  `event_time` time DEFAULT NULL,
  `location` varchar(150) NOT NULL,
  `purpose` text,
  `ticket_price` decimal(10,2) DEFAULT '0.00',
  `fundraising_goal` decimal(10,2) DEFAULT '0.00',
  `amount_raised` decimal(10,2) DEFAULT '0.00',
  `status` varchar(20) DEFAULT 'active',
  PRIMARY KEY (`event_id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`organisation_id`),
  CONSTRAINT `events_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,1,1,'Sydney Charity Fun Run','Community fun run to raise money for families in need.','2026-10-20','08:00:00','Sydney Olympic Park','Support local families.',25.00,10000.00,3500.00,'active'),(2,1,2,'Hope Gala Dinner','Fundraising dinner supporting community programs.','2026-11-05','18:30:00','Sydney CBD','Support community programs.',80.00,20000.00,8000.00,'active'),(3,1,3,'Charity Art Auction','An auction featuring artwork donated by local artists.','2026-11-15','17:00:00','Parramatta','Support youth programs.',10.00,15000.00,4200.00,'active'),(4,1,4,'Music for Hope','Charity concert featuring local musicians.','2026-12-01','19:00:00','Darling Harbour','Support people experiencing hardship.',40.00,25000.00,9000.00,'active'),(5,1,5,'Community Family Day','Family-friendly community fundraising event.','2026-12-10','10:00:00','Centennial Park','Support community services.',0.00,5000.00,1200.00,'active'),(6,1,1,'Run for Education','Charity run supporting educational programs.','2027-01-15','07:30:00','Bondi Beach','Provide educational resources to children.',20.00,12000.00,2500.00,'active'),(7,1,2,'Summer Charity Dinner','Dinner event raising funds for local charities.','2027-02-10','18:00:00','Circular Quay','Support local charity projects.',75.00,18000.00,6000.00,'active'),(8,1,4,'Community Benefit Concert','Live music event supporting community projects.','2027-03-05','18:30:00','Parramatta Park','Fund community development projects.',30.00,20000.00,5000.00,'active');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organisations` (
  `organisation_id` int NOT NULL AUTO_INCREMENT,
  `organisation_name` varchar(100) NOT NULL,
  `description` text,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`organisation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisations`
--

LOCK TABLES `organisations` WRITE;
/*!40000 ALTER TABLE `organisations` DISABLE KEYS */;
INSERT INTO `organisations` VALUES (1,'Sydney Community Charity','A non-profit organisation supporting local communities.','info@sydneycommunitycharity.org','0290001234');
/*!40000 ALTER TABLE `organisations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-02 14:44:59
