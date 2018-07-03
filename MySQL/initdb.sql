CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cd`
--

DROP TABLE IF EXISTS `cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd` (
  `idCD` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Interpret` varchar(45) DEFAULT NULL,
  `Anzahl Songs` int(11) DEFAULT NULL,
  `Datum` varchar(45) DEFAULT NULL,
  `Interpret_idInterpret` int(11) NOT NULL,
  PRIMARY KEY (`idCD`),
  KEY `fk_CD_Interpret1_idx` (`Interpret_idInterpret`),
  CONSTRAINT `fk_CD_Interpret1` FOREIGN KEY (`Interpret_idInterpret`) REFERENCES `interpret` (`idInterpret`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd`
--

LOCK TABLES `cd` WRITE;
/*!40000 ALTER TABLE `cd` DISABLE KEYS */;
INSERT INTO `cd` VALUES (1,'Kühe machen Mühe','DJ Emma',4,'00.00.0000',1),(2,'Achterbahn','DJ Emma',6,'00.00.0000',1),(3,'Pula Hits','DJ Emma',4,'00.00.0000',1),(4,'Hallo Kuh','DJ Emma',2,'00.00.0000',1),(5,'Die Kuh macht Muh','DJ Emma',3,'00.00.0000',1);
/*!40000 ALTER TABLE `cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interpret`
--

DROP TABLE IF EXISTS `interpret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interpret` (
  `idInterpret` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Vorname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInterpret`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interpret`
--

LOCK TABLES `interpret` WRITE;
/*!40000 ALTER TABLE `interpret` DISABLE KEYS */;
INSERT INTO `interpret` VALUES (1,'Jan','Röthlisberger');
/*!40000 ALTER TABLE `interpret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunde`
--

DROP TABLE IF EXISTS `kunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunde` (
  `idKunde` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Vorname` varchar(45) DEFAULT NULL,
  `Strasse + Nr.` varchar(45) DEFAULT NULL,
  `Ort` varchar(45) DEFAULT NULL,
  `Land` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idKunde`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunde`
--

LOCK TABLES `kunde` WRITE;
/*!40000 ALTER TABLE `kunde` DISABLE KEYS */;
INSERT INTO `kunde` VALUES (1,'Linder','Michael','Buchzopfen 16','3250 Lyss','CH','qwert','Michael'),(2,'MarcAndre','Clenin','Hausmattstr. 38','3063 Ittigen','CH','qwert','Mac'),(3,'Noa','Herzog','Eimattstr. 115','3032 Hinterkappeln','CH','qwert','Noa');
/*!40000 ALTER TABLE `kunde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `idSong` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `CD_idCD` int(11) NOT NULL,
  `Interpret_idInterpret` int(11) NOT NULL,
  PRIMARY KEY (`idSong`),
  KEY `fk_Song_CD_idx` (`CD_idCD`),
  KEY `fk_Song_Interpret1_idx` (`Interpret_idInterpret`),
  CONSTRAINT `fk_Song_CD` FOREIGN KEY (`CD_idCD`) REFERENCES `cd` (`idCD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Song_Interpret1` FOREIGN KEY (`Interpret_idInterpret`) REFERENCES `interpret` (`idInterpret`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Song1',1,1),(2,'Song2',2,1),(3,'Song3',3,1),(4,'Song4',4,1),(5,'Song5',2,1),(6,'Song6',3,1),(7,'Song7',1,1),(8,'Song8',1,1),(9,'Song9',1,1),(10,'Song10',1,1),(11,'Song11',3,1),(12,'Song12',4,1);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-03 14:11:17
