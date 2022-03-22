-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: sessionformation
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `Numero_Agent` int NOT NULL,
  `Prénom_Agent` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Nom_Agent` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code_etablissement` int NOT NULL,
  PRIMARY KEY (`Numero_Agent`),
  KEY `code_etablissement_idx` (`code_etablissement`),
  CONSTRAINT `code_etablissement` FOREIGN KEY (`code_etablissement`) REFERENCES `etablissement` (`code_etablissement`),
  CONSTRAINT `Nom_Length` CHECK ((length(`Nom_Agent`) > 3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Damien','Ferrari',1),(2,'Sandra','Couturas',1),(3,'Jotaro','Joestar',1);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cours`
--

DROP TABLE IF EXISTS `cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cours` (
  `Code_Cours` bigint NOT NULL AUTO_INCREMENT,
  `Intitulé_Cours` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Code_Cours`),
  UNIQUE KEY `Code_Cours` (`Code_Cours`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cours`
--

LOCK TABLES `cours` WRITE;
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
INSERT INTO `cours` VALUES (1,'Math');
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cours_ouvrage`
--

DROP TABLE IF EXISTS `cours_ouvrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cours_ouvrage` (
  `Code_Cours` bigint NOT NULL,
  `Code_Ouvrage` int NOT NULL,
  PRIMARY KEY (`Code_Cours`,`Code_Ouvrage`),
  KEY `Code_Ouvrage` (`Code_Ouvrage`),
  CONSTRAINT `cours_ouvrage_ibfk_1` FOREIGN KEY (`Code_Ouvrage`) REFERENCES `ouvrage` (`Code_Ouvrage`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cours_ouvrage_ibfk_2` FOREIGN KEY (`Code_Cours`) REFERENCES `cours` (`Code_Cours`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cours_ouvrage`
--

LOCK TABLES `cours_ouvrage` WRITE;
/*!40000 ALTER TABLE `cours_ouvrage` DISABLE KEYS */;
INSERT INTO `cours_ouvrage` VALUES (1,1);
/*!40000 ALTER TABLE `cours_ouvrage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etablissement`
--

DROP TABLE IF EXISTS `etablissement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etablissement` (
  `code_etablissement` int NOT NULL,
  `Nom_Etablissement` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Adresse_Etablissement` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`code_etablissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etablissement`
--

LOCK TABLES `etablissement` WRITE;
/*!40000 ALTER TABLE `etablissement` DISABLE KEYS */;
INSERT INTO `etablissement` VALUES (1,'Afpa','53 Rue Maurice Rollinat');
/*!40000 ALTER TABLE `etablissement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ouvrage`
--

DROP TABLE IF EXISTS `ouvrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ouvrage` (
  `Code_Ouvrage` int NOT NULL AUTO_INCREMENT,
  `Intitulé_Ouvrage` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Code_Ouvrage`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ouvrage`
--

LOCK TABLES `ouvrage` WRITE;
/*!40000 ALTER TABLE `ouvrage` DISABLE KEYS */;
INSERT INTO `ouvrage` VALUES (1,'Cours Algo');
/*!40000 ALTER TABLE `ouvrage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participer_session`
--

DROP TABLE IF EXISTS `participer_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participer_session` (
  `Numero_Session` int NOT NULL,
  `Numero_Agent` int NOT NULL,
  PRIMARY KEY (`Numero_Session`,`Numero_Agent`),
  KEY `Numero_Agent` (`Numero_Agent`),
  CONSTRAINT `participer_session_ibfk_1` FOREIGN KEY (`Numero_Agent`) REFERENCES `agent` (`Numero_Agent`),
  CONSTRAINT `participer_session_ibfk_3` FOREIGN KEY (`Numero_Session`) REFERENCES `session` (`Numéro_Session`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participer_session`
--

LOCK TABLES `participer_session` WRITE;
/*!40000 ALTER TABLE `participer_session` DISABLE KEYS */;
INSERT INTO `participer_session` VALUES (2,1),(1,2),(2,3);
/*!40000 ALTER TABLE `participer_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `Numéro_Session` int NOT NULL AUTO_INCREMENT,
  `Numéro_Animateur` int NOT NULL,
  `Code_Cours` bigint NOT NULL,
  `DateDebut` date NOT NULL,
  `DateFin` date NOT NULL,
  `Libellé_Session` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Numéro_Session`),
  KEY `Code_Cours` (`Code_Cours`),
  KEY `session_ibfk_4_idx` (`Numéro_Animateur`),
  CONSTRAINT `session_ibfk_3` FOREIGN KEY (`Code_Cours`) REFERENCES `cours` (`Code_Cours`),
  CONSTRAINT `date_constraint` CHECK ((`DateFin` > `DateDebut`))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,3,1,'2021-12-06','2022-07-29','DWWM'),(2,2,1,'2021-12-06','2022-03-22','CA');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-22 10:02:04
