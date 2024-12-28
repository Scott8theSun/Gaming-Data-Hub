-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: group2project
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement` (
  `AchievementID` int NOT NULL,
  `PlayerID` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `AchievementDesc` varchar(250) DEFAULT NULL,
  `UnlockDate` datetime DEFAULT NULL,
  PRIMARY KEY (`AchievementID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `achievement_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `achievement_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `DeveloperID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`DeveloperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `GameID` int NOT NULL,
  `DeveloperID` int DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `ReleaseDate` datetime DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  PRIMARY KEY (`GameID`),
  KEY `DeveloperID` (`DeveloperID`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`DeveloperID`) REFERENCES `developer` (`DeveloperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameachievement`
--

DROP TABLE IF EXISTS `gameachievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameachievement` (
  `GameID` int NOT NULL,
  `AchievementID` int NOT NULL,
  PRIMARY KEY (`GameID`,`AchievementID`),
  KEY `AchievementID` (`AchievementID`),
  CONSTRAINT `gameachievement_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`),
  CONSTRAINT `gameachievement_ibfk_2` FOREIGN KEY (`AchievementID`) REFERENCES `achievement` (`AchievementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameachievement`
--

LOCK TABLES `gameachievement` WRITE;
/*!40000 ALTER TABLE `gameachievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameachievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamesession`
--

DROP TABLE IF EXISTS `gamesession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamesession` (
  `SessionID` int NOT NULL,
  `GameID` int DEFAULT NULL,
  `PlayerID` int DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`SessionID`),
  KEY `GameID` (`GameID`),
  KEY `PlayerID` (`PlayerID`),
  CONSTRAINT `gamesession_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`),
  CONSTRAINT `gamesession_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamesession`
--

LOCK TABLES `gamesession` WRITE;
/*!40000 ALTER TABLE `gamesession` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamesession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `PlayerID` int NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `JoinDate` datetime DEFAULT NULL,
  `IsBanned` tinyint(1) DEFAULT NULL,
  `BannedUntil` datetime DEFAULT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerachievement`
--

DROP TABLE IF EXISTS `playerachievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerachievement` (
  `PlayerID` int NOT NULL,
  `AchievementID` int NOT NULL,
  `UnlockDate` datetime DEFAULT NULL,
  PRIMARY KEY (`PlayerID`,`AchievementID`),
  KEY `AchievementID` (`AchievementID`),
  CONSTRAINT `playerachievement_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `playerachievement_ibfk_2` FOREIGN KEY (`AchievementID`) REFERENCES `achievement` (`AchievementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerachievement`
--

LOCK TABLES `playerachievement` WRITE;
/*!40000 ALTER TABLE `playerachievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerachievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `ReportID` int NOT NULL,
  `ReporterID` int DEFAULT NULL,
  `OffenderID` int DEFAULT NULL,
  `ReportDesc` text,
  `ReportStatus` char(10) DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `ReporterID` (`ReporterID`),
  KEY `OffenderID` (`OffenderID`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`ReporterID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`OffenderID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `chk_status` CHECK ((`ReportStatus` in (_utf8mb4'Pending',_utf8mb4'Resolved')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `ReviewID` int NOT NULL,
  `ReviewerID` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `Content` text,
  `StarRating` int DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `ReviewerID` (`ReviewerID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ReviewerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-14 17:36:22
