-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hackathon
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `faqID` int(11) NOT NULL AUTO_INCREMENT,
  `riskAssessmentID` int(11) DEFAULT NULL,
  `yesRiskFactor` decimal(5,4) DEFAULT NULL,
  `noRiskFactor` decimal(5,4) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `yesNode` int(11) DEFAULT NULL,
  `noNode` int(11) DEFAULT NULL,
  `isStart` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`faqID`),
  KEY `riskAssessmentID` (`riskAssessmentID`),
  CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`riskAssessmentID`) REFERENCES `riskassessment` (`riskAssessmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,1,0.3000,0.8000,'Have you experienced one or more flooding events in your life ?',2,3,1),(2,1,0.2000,0.4000,'Has your municipality prepared an emergency plan?',0,0,0),(3,1,0.7000,0.9000,'Do you feel well prepared to face a flooding event?',4,5,0),(4,1,0.5000,0.7000,'In your opinion what is the flood risk area where you live?',0,0,0),(5,1,0.8000,0.9000,'Do you live near the river?',6,0,0),(6,1,0.9000,1.0000,'In your opinion what Is there flood risk area where you live?',0,0,0);
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `locationID` int(11) NOT NULL AUTO_INCREMENT,
  `country` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Nepal','1','bkt'),(2,'Nepal','1','bkt'),(3,'Nepal','1','bkt'),(4,'country','state','city'),(5,'country','state','city'),(6,'country','state','city'),(7,'country','state','city'),(8,'country','state','city'),(9,'country','state','city'),(10,'country','state','city'),(11,'country','state','city'),(12,'country','state','city'),(13,'country','state','city'),(14,'country','state','city'),(15,'country','state','city'),(16,'country','state','city'),(17,'country','state','city'),(18,'country','state','city'),(19,'country','state','city'),(20,'country','state','city'),(21,'country','state','city'),(22,'country','state','city'),(23,'country','state','city'),(24,'country','state','city'),(25,'country','state','city'),(26,'country','state','city'),(27,'country','state','city'),(28,'country','state','city'),(29,'country','state','city'),(30,'country','state','city'),(31,'country','state','city'),(32,'country','state','city'),(33,'country','state','city'),(34,'Afghanistan','Badgis','Qal\'eh-ye Naw'),(35,'Afghanistan','Badakhshan','Fayzabad'),(36,'Afghanistan','Badakhshan','Fayzabad'),(37,'Afghanistan','Badakhshan','Fayzabad'),(38,'Afghanistan','Badakhshan','Fayzabad'),(39,'Afghanistan','Badakhshan','Fayzabad'),(40,'Afghanistan','Badakhshan','Fayzabad'),(41,'Afghanistan','Badakhshan','Fayzabad'),(42,'Albania','Bulqize','Bulqize'),(43,'Albania','Bulqize','Bulqize'),(44,'Afghanistan','Badgis','Qal\'eh-ye Naw'),(45,'Albania','Bulqize','Bulqize'),(46,'Albania','Bulqize','Bulqize'),(47,'Albania','Bulqize','Bulqize'),(48,'Afghanistan','Baglan','Baghlan'),(49,'Afghanistan','Delvine','Delvine'),(50,'Afghanistan','Badakhshan','Eshkashem');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalcity`
--

DROP TABLE IF EXISTS `personalcity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalcity` (
  `personalCountriesID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `country` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  PRIMARY KEY (`personalCountriesID`),
  KEY `userID` (`userID`),
  CONSTRAINT `personalcity_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalcity`
--

LOCK TABLES `personalcity` WRITE;
/*!40000 ALTER TABLE `personalcity` DISABLE KEYS */;
INSERT INTO `personalcity` VALUES (2,1,'nepal','bagmati','kathmandu'),(4,10,'American Samoa','Western','Anomabu'),(5,10,'Hong Kong S.A.R.','Hong Kong','al-Aghwat'),(6,10,'Algeria','Bulqize','Bulqize'),(7,10,'Nepal','Bagmati','Bhaktapur');
/*!40000 ALTER TABLE `personalcity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalcontact`
--

DROP TABLE IF EXISTS `personalcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalcontact` (
  `personalContactID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `relation` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `isSelected` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`personalContactID`),
  KEY `userID` (`userID`),
  CONSTRAINT `personalcontact_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalcontact`
--

LOCK TABLES `personalcontact` WRITE;
/*!40000 ALTER TABLE `personalcontact` DISABLE KEYS */;
INSERT INTO `personalcontact` VALUES (1,10,'popular','mother','master@gmail.com',9828173521,1),(2,10,'srijita','child','srijita@gmail.com',9832723823,1),(3,10,'pops','child','webpk144@gmail.com',9832723823,1);
/*!40000 ALTER TABLE `personalcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskassessment`
--

DROP TABLE IF EXISTS `riskassessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskassessment` (
  `riskAssessmentID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  PRIMARY KEY (`riskAssessmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskassessment`
--

LOCK TABLES `riskassessment` WRITE;
/*!40000 ALTER TABLE `riskassessment` DISABLE KEYS */;
INSERT INTO `riskassessment` VALUES (1,'Flood Risk Assessment','You will be asked 10 different questions in this survey, and you will be asked more questions based on your answersto the prior questions.'),(2,'Tornado Risk Assessment','You will be asked 15 different questions in this survey, and you will be asked more questions based on your answersto the prior questions.');
/*!40000 ALTER TABLE `riskassessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `locationID` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `deactivated` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`userID`),
  KEY `locationID` (`locationID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'a','v@gmail.com',NULL,12,'male',0),(2,26,'popular','popular@gmail.com',NULL,26,'Male',0),(3,1,'a','ABC@gmail.com',NULL,12,'male',0),(4,1,'a','BC@gmail.com','hilife123',12,'male',0),(5,31,'Sajat Shrestha','sajat@gmail.com','123456789',20,'Male',0),(6,35,'ram','ram@gmail.com','ram123456789',26,'Gender',0),(7,43,'ram','ram@2gmail.com','ram@gmail.com',6,'Gender',0),(8,44,'Mausam Khanal','m@gmail.com','123456789',30,'Gender',0),(9,45,'name ','name@gmail.com','name12345',26,'Gender',0),(10,49,'sjt','sjt@gmail.com','sjt123456',21,'Gender',0),(11,50,'hi','hi@gmail.com','123456789',26,'Gender',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userassessment`
--

DROP TABLE IF EXISTS `userassessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userassessment` (
  `userAssessmentID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `riskAssessmentID` int(11) DEFAULT NULL,
  `isTaken` tinyint(1) DEFAULT NULL,
  `riskFactor` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`userAssessmentID`),
  KEY `userID` (`userID`),
  KEY `riskAssessmentID` (`riskAssessmentID`),
  CONSTRAINT `userassessment_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `userassessment_ibfk_2` FOREIGN KEY (`riskAssessmentID`) REFERENCES `riskassessment` (`riskAssessmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userassessment`
--

LOCK TABLES `userassessment` WRITE;
/*!40000 ALTER TABLE `userassessment` DISABLE KEYS */;
INSERT INTO `userassessment` VALUES (1,10,1,1,0.4000),(2,9,1,1,0.4000),(3,9,1,1,0.2000),(4,9,1,1,0.2000);
/*!40000 ALTER TABLE `userassessment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-19  7:22:57
