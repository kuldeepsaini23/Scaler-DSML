CREATE DATABASE  IF NOT EXISTS `problem_solving_session` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `problem_solving_session`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: problem_solving_session
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `Candidate`
--

DROP TABLE IF EXISTS `Candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Candidate` (
  `id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate`
--

LOCK TABLES `Candidate` WRITE;
/*!40000 ALTER TABLE `Candidate` DISABLE KEYS */;
INSERT INTO `Candidate` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E');
/*!40000 ALTER TABLE `Candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customer_id` int DEFAULT NULL,
  `customer_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (101,'Alice'),(102,'Bob'),(103,'Charlie');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `customer_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `revenue` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,2018,50),(1,2021,30),(1,2020,70),(2,2021,-50),(3,2018,10),(3,2016,50),(4,2021,20);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_id` int DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `order_cost` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `seller_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'2020-03-01',1500,101,1),(2,'2020-05-25',2400,102,2),(3,'2019-05-25',800,101,3),(4,'2020-09-13',1000,103,2),(5,'2019-02-11',700,101,2);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seller`
--

DROP TABLE IF EXISTS `Seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seller` (
  `seller_id` int DEFAULT NULL,
  `seller_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seller`
--

LOCK TABLES `Seller` WRITE;
/*!40000 ALTER TABLE `Seller` DISABLE KEYS */;
INSERT INTO `Seller` VALUES (1,'Daniel'),(2,'Elizabeth'),(3,'Frank');
/*!40000 ALTER TABLE `Seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveyLog`
--

DROP TABLE IF EXISTS `SurveyLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SurveyLog` (
  `id` int DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `answer_id` int DEFAULT NULL,
  `q_num` int DEFAULT NULL,
  `timestamp` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyLog`
--

LOCK TABLES `SurveyLog` WRITE;
/*!40000 ALTER TABLE `SurveyLog` DISABLE KEYS */;
INSERT INTO `SurveyLog` VALUES (5,'show',285,NULL,1,123),(5,'answer',285,124124,1,124),(5,'show',369,NULL,2,125),(5,'skip',369,NULL,2,126);
/*!40000 ALTER TABLE `SurveyLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserVisits`
--

DROP TABLE IF EXISTS `UserVisits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserVisits` (
  `user_id` int DEFAULT NULL,
  `visit_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserVisits`
--

LOCK TABLES `UserVisits` WRITE;
/*!40000 ALTER TABLE `UserVisits` DISABLE KEYS */;
INSERT INTO `UserVisits` VALUES (1,'2020-11-28'),(1,'2020-10-20'),(1,'2020-12-03'),(2,'2020-10-05'),(2,'2020-12-09'),(3,'2020-11-11');
/*!40000 ALTER TABLE `UserVisits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vote`
--

DROP TABLE IF EXISTS `Vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vote` (
  `id` int DEFAULT NULL,
  `candidateId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vote`
--

LOCK TABLES `Vote` WRITE;
/*!40000 ALTER TABLE `Vote` DISABLE KEYS */;
INSERT INTO `Vote` VALUES (1,2),(2,4),(3,3),(4,2),(5,5);
/*!40000 ALTER TABLE `Vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26 20:22:40
