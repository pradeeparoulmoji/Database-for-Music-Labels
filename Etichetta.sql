-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: etichetta
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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `IdAlbum` int NOT NULL AUTO_INCREMENT,
  `Artista` varchar(30) DEFAULT NULL,
  `TitoloAlbum` varchar(40) DEFAULT NULL,
  `DataUscita` date DEFAULT NULL,
  PRIMARY KEY (`IdAlbum`),
  UNIQUE KEY `AlbumUnico` (`Artista`,`DataUscita`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`Artista`) REFERENCES `artista` (`Pseudonimo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Dua Lipa','Future Nostalgia','2020-03-24'),(2,'George Michael','Faith','1987-10-12'),(3,'Miley Cyrus','PLastic Hearts','2020-05-03');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `Pseudonimo` varchar(30) NOT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `PercentualeVendita` tinyint DEFAULT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Cognome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Pseudonimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES ('Dua Lipa','dualipabusiness@email.com',10,'Dua','Lipa'),('Elthon John','elthon@email.com',20,'Reginald','Dwight'),('Freddie Mercury','fmercury@email.com',15,'Farrokh','Boulsara'),('George Michael','gmichael@email.com',15,'George','Michael'),('Lil Pump','trashpump@email.com',3,'Gazzy','garcia'),('Lil Wayne','liltunechi@email.com',10,'Dwayne','Carter'),('Miley Cyrus','queenmiley@email.com',12,'Miley','Cyrus');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canzone`
--

DROP TABLE IF EXISTS `canzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canzone` (
  `IdCanzone` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(40) DEFAULT NULL,
  `DataUscita` date DEFAULT NULL,
  PRIMARY KEY (`IdCanzone`),
  UNIQUE KEY `CanzoneUnico` (`Titolo`,`DataUscita`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canzone`
--

LOCK TABLES `canzone` WRITE;
/*!40000 ALTER TABLE `canzone` DISABLE KEYS */;
INSERT INTO `canzone` VALUES (22,'A Milli','2008-04-29'),(17,'Bohemian Rhapsody','1975-10-31'),(34,'Boys Will Be Boys','2020-03-23'),(32,'Break My Heart','2020-03-25'),(15,'Candle in the Wind','1973-10-06'),(9,'Careless Whisper','1984-07-24'),(27,'Cool','2020-03-23'),(16,'Don\'t Let the Sun Go Down on Me','1974-05-20'),(8,'Don\'t Start Now','2019-10-31'),(10,'Faith','1987-10-12'),(26,'Future Nostalgia','2020-03-24'),(33,'Good in Bed','2020-03-23'),(30,'Hallucinate','2020-03-23'),(11,'Last Christmas','1984-12-10'),(1,'Levitating','2020-08-14'),(21,'Lollipop','2008-03-13'),(31,'Love Again','2020-03-23'),(25,'Malibu','2017-05-11'),(3,'New Rules','2017-07-07'),(24,'Party in the USA','2009-08-11'),(28,'Physical','2020-01-30'),(29,'Pretty Please','2020-03-23'),(12,'Rocket Man','1972-04-28'),(19,'Somebody to Love','1976-11-12'),(14,'Tiny Dancer','1971-02-07'),(20,'Under Pressure','1981-10-26'),(18,'We Will Rock You','1977-10-07'),(23,'Wrecking Ball','2013-08-25'),(13,'Your Song','1970-10-26');
/*!40000 ALTER TABLE `canzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaborazione`
--

DROP TABLE IF EXISTS `collaborazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collaborazione` (
  `Artista` varchar(30) NOT NULL,
  `IdImpiegato` int NOT NULL,
  PRIMARY KEY (`Artista`,`IdImpiegato`),
  KEY `collaborazione_ibfk_2` (`IdImpiegato`),
  CONSTRAINT `collaborazione_ibfk_1` FOREIGN KEY (`Artista`) REFERENCES `artista` (`Pseudonimo`),
  CONSTRAINT `collaborazione_ibfk_2` FOREIGN KEY (`IdImpiegato`) REFERENCES `impiegato` (`IdImpiegato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaborazione`
--

LOCK TABLES `collaborazione` WRITE;
/*!40000 ALTER TABLE `collaborazione` DISABLE KEYS */;
INSERT INTO `collaborazione` VALUES ('George Michael',60),('Lil Wayne',60),('Miley Cyrus',60);
/*!40000 ALTER TABLE `collaborazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `impiegatoNoProd` BEFORE INSERT ON `collaborazione` FOR EACH ROW BEGIN
    IF (SELECT ruolo FROM impiegato WHERE impiegato.Idimpiegato = NEW.Idimpiegato) = 'Personale di Produzione' or 'Impiegato Secondario'  THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insertion not allowed for impiegato with the role "Personale di Produzione".';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `copiafisica`
--

DROP TABLE IF EXISTS `copiafisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copiafisica` (
  `IdCopiaFisica` int NOT NULL AUTO_INCREMENT,
  `IdAlbum` int DEFAULT NULL,
  `Tipo` varchar(40) DEFAULT NULL,
  `DataGenerazione` date DEFAULT NULL,
  PRIMARY KEY (`IdCopiaFisica`),
  KEY `IdAlbum` (`IdAlbum`),
  CONSTRAINT `copiafisica_ibfk_1` FOREIGN KEY (`IdAlbum`) REFERENCES `album` (`IdAlbum`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copiafisica`
--

LOCK TABLES `copiafisica` WRITE;
/*!40000 ALTER TABLE `copiafisica` DISABLE KEYS */;
INSERT INTO `copiafisica` VALUES (1,1,'Cd','2023-09-01'),(2,1,'Vinile','2023-07-02'),(3,1,'Cd','2021-08-03'),(4,1,'Cd','2021-09-07'),(5,1,'Audiocassetta','2022-09-05'),(6,1,'CD','2022-01-05'),(7,1,'Vinile','2023-01-15'),(8,3,'CD','2020-05-23');
/*!40000 ALTER TABLE `copiafisica` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `datacopiafisica` BEFORE INSERT ON `copiafisica` FOR EACH ROW BEGIN
    IF NEW.Datagenerazione < (SELECT Datauscita FROM album WHERE Idalbum = NEW.Idalbum) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'DataVendita cannot be earlier than DataGenerazione.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `impiegato`
--

DROP TABLE IF EXISTS `impiegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impiegato` (
  `IdImpiegato` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) DEFAULT NULL,
  `Cognome` varchar(30) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `ruolo` varchar(25) DEFAULT NULL,
  `PercentualeVendita` tinyint DEFAULT NULL,
  `IdSedeDiLavoro` int DEFAULT NULL,
  PRIMARY KEY (`IdImpiegato`),
  UNIQUE KEY `ImpiegatoUnico` (`Nome`,`Cognome`,`Email`),
  KEY `IdSedeDiLavoro` (`IdSedeDiLavoro`),
  CONSTRAINT `impiegato_ibfk_1` FOREIGN KEY (`IdSedeDiLavoro`) REFERENCES `sededilavoro` (`IdSedeDiLavoro`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impiegato`
--

LOCK TABLES `impiegato` WRITE;
/*!40000 ALTER TABLE `impiegato` DISABLE KEYS */;
INSERT INTO `impiegato` VALUES (60,'John','Smith','john.smith@example.com','A&R',0,1),(61,'Alice','Johnson','alice.johnson@example.com','Personale di Produzione',8,2),(62,'Robert','Davis','robert.davis@example.com','Impiegato Secondario',0,3),(63,'Emily','Brown','emily.brown@example.com','Manager',0,4),(64,'Michael','Williams','michael.williams@example.com','A&R',0,5),(65,'Jessica','Martinez','jessica.martinez@example.com','Personale di Produzione',6,1),(66,'Daniel','Wilson','daniel.wilson@example.com','Impiegato Secondario',0,2),(67,'Sarah','Anderson','sarah.anderson@example.com','Manager',0,3),(68,'William','Taylor','william.taylor@example.com','A&R',0,4),(78,'Aroul','da Vinci','aroulkingproduction@email.com','Personale di Produzione',15,4),(79,'Juohn','Smith','john.smith@example.com','Personale di Produzione',10,2),(107,'Carlos','Alcatraz','carlos@dd.dd','A&R',0,1),(108,'Billy','Hargrove','bh@dmd.cc','Personale di Produzione',6,10),(152,'Denzel','Washington','dz@ss.ss','Manager',0,2);
/*!40000 ALTER TABLE `impiegato` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Produttori` BEFORE INSERT ON `impiegato` FOR EACH ROW BEGIN
    IF NEW.ruolo = 'Personale di Produzione' AND NEW.idsededilavoro = 4 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Non valido';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `produttore` BEFORE INSERT ON `impiegato` FOR EACH ROW BEGIN
    IF new.ruolo = 'Personale di Produzione' and  (SELECT tipo FROM sededilavoro WHERE IdSedeDiLavoro = NEW.IdSedeDiLavoro) != 'Studio di Produzione' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'DataVendita cannot be earlier than DataGenerazione.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `impiegatiregolari` BEFORE INSERT ON `impiegato` FOR EACH ROW BEGIN
    IF new.ruolo != 'Personale di Produzione' and  (SELECT tipo FROM sededilavoro WHERE IdSedeDiLavoro = NEW.IdSedeDiLavoro) = 'Studio di Produzione' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'DataVendita cannot be earlier than DataGenerazione.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `percentualeImp` BEFORE INSERT ON `impiegato` FOR EACH ROW BEGIN
    IF new.ruolo != 'Personale di Produzione' and new.percentualevendita != 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'DataVendita cannot be earlier than DataGenerazione.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inclusione`
--

DROP TABLE IF EXISTS `inclusione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inclusione` (
  `IdAlbum` int NOT NULL,
  `IdCanzone` int NOT NULL,
  PRIMARY KEY (`IdAlbum`,`IdCanzone`),
  KEY `inclusione_ibfk_2` (`IdCanzone`),
  CONSTRAINT `inclusione_ibfk_1` FOREIGN KEY (`IdAlbum`) REFERENCES `album` (`IdAlbum`),
  CONSTRAINT `inclusione_ibfk_2` FOREIGN KEY (`IdCanzone`) REFERENCES `canzone` (`IdCanzone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inclusione`
--

LOCK TABLES `inclusione` WRITE;
/*!40000 ALTER TABLE `inclusione` DISABLE KEYS */;
INSERT INTO `inclusione` VALUES (1,8),(1,30),(1,32);
/*!40000 ALTER TABLE `inclusione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CanzoneAlbum` BEFORE INSERT ON `inclusione` FOR EACH ROW BEGIN
    IF  (SELECT datauscita FROM canzone WHERE new.idcanzone = idcanzone) < (SELECT datauscita FROM album WHERE Idalbum = Idalbum) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insertion not allowed for impiegato with the role "Personale di Produzione".';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `licenza`
--

DROP TABLE IF EXISTS `licenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenza` (
  `IdFatturaMensile` int DEFAULT NULL,
  `IdCanzone` int NOT NULL,
  `IdUtilizzatore` int NOT NULL,
  `FeePerRiproduzione` smallint DEFAULT NULL,
  `DataEmissione` date DEFAULT NULL,
  `NumeroRiproduzioniMensile` int DEFAULT NULL,
  PRIMARY KEY (`IdCanzone`,`IdUtilizzatore`),
  KEY `IdUtilizzatore` (`IdUtilizzatore`),
  KEY `IdFatturaMensile` (`IdFatturaMensile`),
  CONSTRAINT `licenza_ibfk_2` FOREIGN KEY (`IdUtilizzatore`) REFERENCES `utilizzatoreterzo` (`IdUtilizzatore`),
  CONSTRAINT `licenza_ibfk_3` FOREIGN KEY (`IdCanzone`) REFERENCES `canzone` (`IdCanzone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenza`
--

LOCK TABLES `licenza` WRITE;
/*!40000 ALTER TABLE `licenza` DISABLE KEYS */;
INSERT INTO `licenza` VALUES (105104,1,1,500,'2023-05-22',10),(105103,1,2,0,'2023-05-11',30000000),(105105,10,10,10000,'2023-05-11',1),(105101,28,1,0,'2023-05-11',10000000),(105102,29,1,0,'2023-05-11',10000000),(105104,30,4,500,'2023-05-11',10);
/*!40000 ALTER TABLE `licenza` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dataTerzo` BEFORE INSERT ON `licenza` FOR EACH ROW BEGIN
    IF new.dataemissione < (SELECT Datauscita FROM canzone WHERE IdCanzone = NEW.IdCanzone) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'DataVendita cannot be earlier than DataGenerazione.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movimenti`
--

DROP TABLE IF EXISTS `movimenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimenti` (
  `IdFattura` int NOT NULL,
  `Ammontare` int DEFAULT NULL,
  `Tipo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IdFattura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimenti`
--

LOCK TABLES `movimenti` WRITE;
/*!40000 ALTER TABLE `movimenti` DISABLE KEYS */;
INSERT INTO `movimenti` VALUES (101,-1000,'Strumentazione'),(102,-5000,'Strumentazione'),(103,-1500,'Strumentazione'),(104,-2000,'Strumentazione'),(105,-3000,'Strumentazione'),(109,-800,'Strumentazione'),(5101,12,'Vendita'),(5102,80,'Vendita'),(5103,12,'Vendita'),(5104,12,'Vendita'),(5105,25,'Vendita'),(5106,25,'Vendita'),(105101,1000000,'Licenza'),(105102,1000000,'Licenza'),(105103,3000000,'Licenza'),(105104,5000,'Licenza'),(105105,10000,'Licenza');
/*!40000 ALTER TABLE `movimenti` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `verificanegativo` BEFORE INSERT ON `movimenti` FOR EACH ROW BEGIN
    IF NEW.ammontare >= 0 and new.tipo = 'Strumentazione' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insertion of non-negative values is not allowed.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `verificaLicenzaVendita` BEFORE INSERT ON `movimenti` FOR EACH ROW BEGIN
    IF NEW.ammontare <= 0 and (NEW.tipo = 'Vendita' or NEW.tipo = 'Licenza') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'vendita o licenza deve essere positiva.';
     END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pubblicazione`
--

DROP TABLE IF EXISTS `pubblicazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pubblicazione` (
  `IdCanzone` int NOT NULL,
  `Artista` varchar(30) NOT NULL,
  `IdProduttore` int NOT NULL,
  PRIMARY KEY (`IdCanzone`,`Artista`,`IdProduttore`),
  KEY `pubblicazione_ibfk_1` (`Artista`),
  KEY `pubblicazione_ibfk_2` (`IdProduttore`),
  CONSTRAINT `pubblicazione_ibfk_1` FOREIGN KEY (`Artista`) REFERENCES `artista` (`Pseudonimo`),
  CONSTRAINT `pubblicazione_ibfk_2` FOREIGN KEY (`IdProduttore`) REFERENCES `impiegato` (`IdImpiegato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pubblicazione`
--

LOCK TABLES `pubblicazione` WRITE;
/*!40000 ALTER TABLE `pubblicazione` DISABLE KEYS */;
INSERT INTO `pubblicazione` VALUES (1,'George Michael',78),(10,'Dua Lipa',78);
/*!40000 ALTER TABLE `pubblicazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sededilavoro`
--

DROP TABLE IF EXISTS `sededilavoro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sededilavoro` (
  `IdSedeDiLavoro` int NOT NULL AUTO_INCREMENT,
  `Citta` varchar(20) DEFAULT NULL,
  `Indirizzo` varchar(40) DEFAULT NULL,
  `CAP` mediumint DEFAULT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdSedeDiLavoro`),
  UNIQUE KEY `SedeUnica` (`Citta`,`Indirizzo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sededilavoro`
--

LOCK TABLES `sededilavoro` WRITE;
/*!40000 ALTER TABLE `sededilavoro` DISABLE KEYS */;
INSERT INTO `sededilavoro` VALUES (1,'New York','123 Main Street',10001,'Ufficio'),(2,'Los Angeles','456 Elm Avenue',90002,'Ufficio'),(3,'Chicago','789 Oak Road',60603,'Ufficio'),(4,'San Francisco','101 Pine Lane',94101,'Ufficio'),(5,'Miami','555 Beach Boulevard',33125,'Ufficio'),(6,'Miami','444 Beacon Avenue',33125,'Ufficio'),(7,'Phoenix','999 Desert Road',85001,'Studio di produzione'),(8,'Philadelphia','777 Liberty Street',19101,'Studio di produzione'),(9,'Denver','555 Mountain View',80201,'Studio di produzione'),(10,'Austin','666 Tech Drive',73301,'Studio di produzione'),(11,'Nashville','111 Music Street',37201,'Studio di produzione'),(12,'Portland','222 Green Park',97201,'Studio di produzione');
/*!40000 ALTER TABLE `sededilavoro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strumentazione`
--

DROP TABLE IF EXISTS `strumentazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strumentazione` (
  `Tipo` varchar(20) DEFAULT NULL,
  `IdFattura` int DEFAULT NULL,
  `IdStrumento` int NOT NULL,
  `Marca` varchar(30) DEFAULT NULL,
  `Modello` varchar(30) DEFAULT NULL,
  `DataAcquisto` date DEFAULT NULL,
  `IdSedeDiLavoro` int DEFAULT NULL,
  PRIMARY KEY (`IdStrumento`),
  KEY `IdSedeDiLavoro` (`IdSedeDiLavoro`),
  KEY `fatturaS_idx` (`IdFattura`),
  CONSTRAINT `movs` FOREIGN KEY (`IdFattura`) REFERENCES `movimenti` (`IdFattura`),
  CONSTRAINT `strumentazione_ibfk_2` FOREIGN KEY (`IdSedeDiLavoro`) REFERENCES `sededilavoro` (`IdSedeDiLavoro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strumentazione`
--

LOCK TABLES `strumentazione` WRITE;
/*!40000 ALTER TABLE `strumentazione` DISABLE KEYS */;
INSERT INTO `strumentazione` VALUES ('Chitarra',109,81,'Fender','Telecaster','2023-09-08',10),('Chitarra',101,17527,'Fender','Stratocaster','2023-09-08',8),('Batteria',103,32727,'Pearl','Export Series','2023-09-10',10),('Violino',105,52772,'Stradivarius','Concert','2023-09-12',9),('Saxofono',104,72274,'Selmer','Super Action 80','2023-09-11',8),('Pianoforte',102,227527,'Yamaha','Grand','2023-09-09',8);
/*!40000 ALTER TABLE `strumentazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `Numero` varchar(15) NOT NULL,
  `IdSedeDiLavoro` int DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  KEY `IdSedeDiLavoro` (`IdSedeDiLavoro`),
  CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`IdSedeDiLavoro`) REFERENCES `sededilavoro` (`IdSedeDiLavoro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES ('123-456-7890',1),('555-123-4567',2),('444-555-6666',3),('777-888-9999',4),('555-555-5555',5),('123-789-4561',6),('999-888-7777',7),('111-222-3333',8),('777-999-5555',9),('444-333-2222',10);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizzatoreterzo`
--

DROP TABLE IF EXISTS `utilizzatoreterzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilizzatoreterzo` (
  `IdUtilizzatore` int NOT NULL AUTO_INCREMENT,
  `NomeLegale` varchar(60) DEFAULT NULL,
  `Indirizzosocieta` varchar(100) DEFAULT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdUtilizzatore`),
  UNIQUE KEY `IdUtilizzatoreUnico` (`NomeLegale`,`Indirizzosocieta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizzatoreterzo`
--

LOCK TABLES `utilizzatoreterzo` WRITE;
/*!40000 ALTER TABLE `utilizzatoreterzo` DISABLE KEYS */;
INSERT INTO `utilizzatoreterzo` VALUES (1,'Spotify AB','Regeringsgatan 19, Stoccolma, Svezia.','Streaming'),(2,'Apple Inc.','One Apple Park Way, Cupertino, California','Streaming'),(3,'Netflix Inc.','123 Stream Street, Movieville, Flixland','SYNC'),(4,'CBS Television Studios','456 Studio Drive, Hollywood, CA 90001','SYNC'),(5,'Universal Records','789 Music Avenue, Los Angeles, CA 90002','Sample'),(7,'Def Jam Recordings','101 Hip-Hop Street, New York, NY 10003','Sample'),(8,'MSC Cruises','123 Cruise Avenue, Ocean City','Live Performance'),(9,'Coachella','81 800 Ave 51 Empire Polo Club Indio, CA 92201','Live Performance'),(10,'Dua Lipa Europe Tour','London HA9 0WS, Regno Unito','Live Performance');
/*!40000 ALTER TABLE `utilizzatoreterzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendita`
--

DROP TABLE IF EXISTS `vendita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendita` (
  `IdFattura` int DEFAULT NULL,
  `IdCopiaFisica` int NOT NULL,
  `Acquirente` varchar(60) DEFAULT NULL,
  `DataVendita` date DEFAULT NULL,
  PRIMARY KEY (`IdCopiaFisica`),
  CONSTRAINT `vendita_ibfk_2` FOREIGN KEY (`IdCopiaFisica`) REFERENCES `copiafisica` (`IdCopiaFisica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendita`
--

LOCK TABLES `vendita` WRITE;
/*!40000 ALTER TABLE `vendita` DISABLE KEYS */;
INSERT INTO `vendita` VALUES (5101,1,'Mediaworld','2023-09-09'),(5102,2,'Privato','2023-09-09'),(5103,3,'Amazon','2023-09-09'),(5104,4,'Amazon','2023-09-09'),(5105,5,'Ebay','2023-09-09'),(5106,6,'Ebay','2023-07-21');
/*!40000 ALTER TABLE `vendita` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CheckDataVendita` BEFORE INSERT ON `vendita` FOR EACH ROW BEGIN
    IF NEW.DataVendita < (SELECT DataGenerazione FROM copiafisica WHERE IdCopiaFisica = NEW.IdCopiaFisica) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'DataVendita cannot be earlier than DataGenerazione.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'etichetta'
--
/*!50003 DROP PROCEDURE IF EXISTS `infoCassa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `infoCassa`()
BEGIN
    select avg(ammontare), max(ammontare), sum(ammontare) from movimenti ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MovimentiCanzoneScelta1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MovimentiCanzoneScelta1`(IN valore int)
BEGIN
    select * from movimenti inner join licenza on movimenti.IdFattura = licenza.IdFatturaMensile where IdCanzone = valore ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PercentualeProduttoreCanzone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PercentualeProduttoreCanzone`(IN idsong int)
BEGIN
    select movimenti.tipo, licenza.idcanzone, impiegato.*, sum(ammontare), (sum(ammontare)/100*impiegato.percentualevendita) from movimenti 
inner join licenza on movimenti.IdFattura = licenza.IdFatturaMensile 
inner join pubblicazione on licenza.idcanzone = pubblicazione.Idcanzone 
inner join impiegato on pubblicazione.Idproduttore = impiegato.IdImpiegato
where pubblicazione.IdCanzone = idsong;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-10 18:01:39
