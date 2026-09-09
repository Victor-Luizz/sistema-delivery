CREATE DATABASE  IF NOT EXISTS `reserva` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reserva`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: reserva
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'b0375c9c-11d4-11f1-9ce4-00d861077f4b:1-60';

--
-- Table structure for table `cardapio`
--

DROP TABLE IF EXISTS `cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardapio` (
  `Disponibilidade` varchar(10) DEFAULT NULL,
  `Preco` decimal(10,2) DEFAULT NULL,
  `Descricao` varchar(80) DEFAULT NULL,
  `Nome_Prato` varchar(20) NOT NULL,
  `CNPJ` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Nome_Prato`),
  KEY `CNPJ` (`CNPJ`),
  CONSTRAINT `cardapio_ibfk_1` FOREIGN KEY (`CNPJ`) REFERENCES `restaurante` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Nome_Clien` varchar(40) DEFAULT NULL,
  `CPF` varchar(15) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `Logradouro` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contem`
--

DROP TABLE IF EXISTS `contem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contem` (
  `Preco_pedido` decimal(10,2) DEFAULT NULL,
  `Nome_Prato` varchar(20) DEFAULT NULL,
  KEY `Nome_Prato` (`Nome_Prato`),
  CONSTRAINT `contem_ibfk_1` FOREIGN KEY (`Nome_Prato`) REFERENCES `cardapio` (`Nome_Prato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entregador`
--

DROP TABLE IF EXISTS `entregador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregador` (
  `Nome` varchar(40) DEFAULT NULL,
  `CPF_Entreg` varchar(15) NOT NULL,
  `Placa` varchar(10) DEFAULT NULL,
  `Cor` varchar(10) DEFAULT NULL,
  `CNPJ` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CPF_Entreg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fazer`
--

DROP TABLE IF EXISTS `fazer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fazer` (
  `CPF` varchar(15) DEFAULT NULL,
  KEY `CPF` (`CPF`),
  CONSTRAINT `fazer_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `Status` varchar(12) DEFAULT NULL,
  `Hora` varchar(10) DEFAULT NULL,
  `Data` varchar(10) DEFAULT NULL,
  `Valor_total` decimal(10,2) DEFAULT NULL,
  `CNPJ` varchar(15) DEFAULT NULL,
  `CPF_Entreg` varchar(15) DEFAULT NULL,
  KEY `CNPJ` (`CNPJ`),
  KEY `CPF_Entreg` (`CPF_Entreg`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`CNPJ`) REFERENCES `restaurante` (`CNPJ`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`CPF_Entreg`) REFERENCES `entregador` (`CPF_Entreg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `restaurante`
--

DROP TABLE IF EXISTS `restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurante` (
  `Nome_Rest` varchar(20) DEFAULT NULL,
  `CNPJ` varchar(15) NOT NULL,
  `Tipo_cozinha` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone_clien`
--

DROP TABLE IF EXISTS `telefone_clien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_clien` (
  `Telefone_PK` int NOT NULL,
  `Telefone` int DEFAULT NULL,
  `CPF_FK` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Telefone_PK`),
  KEY `CPF_FK` (`CPF_FK`),
  CONSTRAINT `telefone_clien_ibfk_1` FOREIGN KEY (`CPF_FK`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone_entreg`
--

DROP TABLE IF EXISTS `telefone_entreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_entreg` (
  `Telefone_PK` int NOT NULL,
  `Telefone` int DEFAULT NULL,
  `CPF_Entreg_FK` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Telefone_PK`),
  KEY `CPF_Entreg_FK` (`CPF_Entreg_FK`),
  CONSTRAINT `telefone_entreg_ibfk_1` FOREIGN KEY (`CPF_Entreg_FK`) REFERENCES `entregador` (`CPF_Entreg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-08 23:38:58
