CREATE DATABASE  IF NOT EXISTS `optica` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `optica`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: optica
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `cliente_telefono` varchar(9) DEFAULT NULL,
  `cliente_email` varchar(255) DEFAULT NULL,
  `cliente_fecha_registro` datetime DEFAULT NULL,
  `cliente_calle` varchar(255) DEFAULT NULL,
  `cliente_numero` int DEFAULT NULL,
  `cliente_piso` varchar(10) DEFAULT NULL,
  `cliente_puerta` varchar(10) DEFAULT NULL,
  `cliente_ciudad` varchar(45) DEFAULT NULL,
  `cliente_zipcode` varchar(10) DEFAULT NULL,
  `cliente_pais` varchar(45) DEFAULT NULL,
  `cliente_referido_id` int DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `cliente_email_UNIQUE` (`cliente_email`),
  KEY `fk_client_client1_idx` (`cliente_referido_id`),
  CONSTRAINT `fk_client_client1` FOREIGN KEY (`cliente_referido_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'666666666','emailcliente3@gmail.com','2021-06-22 10:18:59','Calle 1234',23,'1','A','Barcelona','13245','ESP',NULL),(2,'777777777','emailcliente4@gmail.com','2021-06-22 10:20:23','Calle 11241',2,'2','B','Sabadell','12124','ESP',NULL),(3,'999999999','emailcliente6@gmail.com','2021-06-22 10:20:23','Calle 124124',412,'5','A','Mataró','12412','ESP',NULL),(4,'333333336','emailcliente7@gmail.com','2021-06-22 10:20:23','Calle 112412',12,'8','A','Bilbao','56457','ESP',1),(5,'444444444','emailcliente8@gmail.com','2021-06-22 10:20:23','Calle 235',55,'4','C','Sevilla','42353','ESP',2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `empleado_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Joan'),(2,'Laura'),(3,'Lluis'),(4,'Martina');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `factura_id` int NOT NULL AUTO_INCREMENT,
  `factura_fecha` datetime DEFAULT NULL,
  `empleado_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `gafa_id` int NOT NULL,
  PRIMARY KEY (`factura_id`),
  KEY `fk_invoice_employee1_idx` (`empleado_id`),
  KEY `fk_invoice_client1_idx` (`cliente_id`),
  KEY `fk_factura_gafa1_idx` (`gafa_id`),
  CONSTRAINT `fk_factura_gafa1` FOREIGN KEY (`gafa_id`) REFERENCES `gafa` (`gafa_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_invoice_client1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_invoice_employee1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2021-06-22 10:41:33',1,1,1),(2,'2019-06-22 10:41:33',3,2,4),(3,'2019-06-22 10:41:33',2,3,2),(4,'2021-06-22 10:41:33',3,4,3),(5,'2020-09-22 10:41:33',3,5,5),(7,'2020-05-22 10:41:33',2,3,4),(8,'2020-02-01 10:41:33',3,3,5);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafa`
--

DROP TABLE IF EXISTS `gafa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafa` (
  `gafa_id` int NOT NULL AUTO_INCREMENT,
  `gafa_graduacion_derecha` decimal(10,2) DEFAULT NULL,
  `gafa_graduacion_izquierda` decimal(10,2) DEFAULT NULL,
  `gafa_montura` enum('Flotante','Pasta','Metálica') DEFAULT NULL,
  `gafa_montura_color` varchar(45) DEFAULT NULL,
  `gafa_cristal_color` varchar(45) DEFAULT NULL,
  `gafa_precio` decimal(10,2) DEFAULT NULL,
  `gafa_marca` varchar(45) DEFAULT NULL,
  `proveedor_id` int NOT NULL,
  PRIMARY KEY (`gafa_id`),
  KEY `fk_gafa_proveedor1_idx` (`proveedor_id`),
  CONSTRAINT `fk_gafa_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafa`
--

LOCK TABLES `gafa` WRITE;
/*!40000 ALTER TABLE `gafa` DISABLE KEYS */;
INSERT INTO `gafa` VALUES (1,0.00,0.00,'Flotante','Negro','Transparente',100.80,'Ray-B',2),(2,0.00,0.00,'Pasta','Blanco','Oscuro',80.56,'Ray-B',2),(3,1.25,1.55,'Metálica','Marrón','Oscuro',123.25,'Diesel',1),(4,0.00,0.00,'Flotante','Negro','Oscuro',100.25,'Diesel',1),(5,3.15,3.15,'Pasta','Rojo','Transparente',125.36,'Cotet',2);
/*!40000 ALTER TABLE `gafa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_nombre` varchar(45) DEFAULT NULL,
  `proveedor_telefono` varchar(9) DEFAULT NULL,
  `proveedor_fax` varchar(9) DEFAULT NULL,
  `proveedor_calle` varchar(255) DEFAULT NULL,
  `proveedor_numero` int DEFAULT NULL,
  `proveedor_piso` varchar(10) DEFAULT NULL,
  `proveedor_puerta` varchar(10) DEFAULT NULL,
  `proveedor_ciudad` varchar(45) DEFAULT NULL,
  `proveedor_zipcode` varchar(10) DEFAULT NULL,
  `proveedor_pais` varchar(45) DEFAULT NULL,
  `proveedor_nif` varchar(9) NOT NULL,
  PRIMARY KEY (`proveedor_id`),
  UNIQUE KEY `proveedor_nif_UNIQUE` (`proveedor_nif`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Proveedor principal','123444556','123444556','Calle 1234',23,'1','A','Barcelona','28885','ESP','44455661A'),(2,'Proveedor secundario','123555667','123555667','Calle 1222',1,'2','B','Sabadell','25565','ESP','55544772B'),(3,'Proveedor alternativo','123455564','123455564','Calle 1122',234,'6','C','Paris','13246','FR','65463512C');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-22 12:37:13
