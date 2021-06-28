CREATE DATABASE  IF NOT EXISTS `pizzeria` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizzeria`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
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
-- Table structure for table `categoria_pizzas`
--

DROP TABLE IF EXISTS `categoria_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_pizzas` (
  `categoria_pizzas_id` int NOT NULL AUTO_INCREMENT,
  `categoria_pizzas_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoria_pizzas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_pizzas`
--

LOCK TABLES `categoria_pizzas` WRITE;
/*!40000 ALTER TABLE `categoria_pizzas` DISABLE KEYS */;
INSERT INTO `categoria_pizzas` VALUES (1,'Napolitana'),(2,'Romana'),(3,'Milanesa');
/*!40000 ALTER TABLE `categoria_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `cliente_nombre` varchar(45) DEFAULT NULL,
  `cliente_apellidos` varchar(100) DEFAULT NULL,
  `cliente_direccion` varchar(255) DEFAULT NULL,
  `cliente_telefono` varchar(45) DEFAULT NULL,
  `localidad_id` int NOT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `fk_cliente_localidad1_idx` (`localidad_id`),
  CONSTRAINT `fk_cliente_localidad1` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`localidad_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Victor','Romero','C/ Sant joan 23','600112233',1),(2,'Luis','García','C/ Aragó 55','600223344',4),(3,'Martí','Rimbó','C/ Provença 12','600223344',3),(4,'Laura','Tremosa','C/ Ponent 21','612545987',6),(5,'Clara','Bonmatí','C/ Figueres 78','654657887',7);
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
  `empleado_apellidos` varchar(45) DEFAULT NULL,
  `empleado_telefono` varchar(10) DEFAULT NULL,
  `empleado_puesto` enum('Cocinero','Repartidor') DEFAULT NULL,
  `tienda_id` int NOT NULL,
  PRIMARY KEY (`empleado_id`),
  KEY `fk_empleado_tienda1_idx` (`tienda_id`),
  CONSTRAINT `fk_empleado_tienda1` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`tienda_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Jesus','Martínez','654455568','Repartidor',1),(2,'Aitor','Menta','654498788','Cocinero',1),(3,'Alberto','Perez','123917223','Repartidor',4),(4,'Alejandro','Laguna','654657887','Cocinero',4),(5,'Maribel','Perez','465465465','Cocinero',2),(6,'Luisa','Gomez','654654798','Repartidor',2),(7,'Diego','Romero','654654654','Cocinero',3),(8,'Gabriel','Montero','654658797','Repartidor',3);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `localidad_id` int NOT NULL AUTO_INCREMENT,
  `localidad_nombre` varchar(45) DEFAULT NULL,
  `provincia_id` int NOT NULL,
  PRIMARY KEY (`localidad_id`),
  KEY `fk_localidad_provincia_idx` (`provincia_id`),
  CONSTRAINT `fk_localidad_provincia` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`provincia_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Sabadell',1),(2,'Mataró',1),(3,'Badalona',1),(4,'Girona',2),(5,'Figueres',2),(6,'Lleida',3),(7,'Sort',3),(8,'Tarragona',4),(9,'Torredembarra',4);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `tienda_id` int NOT NULL,
  `pedido_fecha` datetime DEFAULT NULL,
  `pedido_tipo` enum('A domicilio','Recoger') DEFAULT NULL,
  `pedido_precio_total` decimal(10,2) DEFAULT NULL,
  `pedido_reparto_id` int DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `fk_pedido_cliente1_idx` (`cliente_id`),
  KEY `fk_pedido_tienda1_idx` (`tienda_id`),
  KEY `fk_pedido_pedido_reparto1_idx` (`pedido_reparto_id`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_pedido_reparto1` FOREIGN KEY (`pedido_reparto_id`) REFERENCES `pedido_reparto` (`pedido_reparto_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_tienda1` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`tienda_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,2,'2021-06-23 09:39:00','A domicilio',30.55,1),(2,1,1,'2021-02-03 17:00:00','A domicilio',45.23,2),(3,1,3,'2021-04-01 19:00:00','Recoger',15.25,NULL),(4,2,4,'2021-03-21 21:00:00','Recoger',21.25,NULL),(5,2,3,'2021-05-13 17:00:00','A domicilio',32.25,3),(6,3,1,'2021-05-18 21:30:00','Recoger',43.56,NULL),(7,5,1,'2021-06-03 18:30:00','Recoger',25.25,NULL),(8,4,2,'2021-04-13 18:30:00','Recoger',56.55,NULL),(9,5,3,'2020-12-01 21:30:00','Recoger',21.25,NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_detalle`
--

DROP TABLE IF EXISTS `pedido_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_detalle` (
  `pedido_detalle_id` int NOT NULL AUTO_INCREMENT,
  `pedido_detalle_cantidad` int DEFAULT NULL,
  `pedido_id` int NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`pedido_detalle_id`),
  KEY `fk_pedido_detalle_pedido1_idx` (`pedido_id`),
  KEY `fk_pedido_detalle_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_pedido_detalle_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`pedido_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_detalle_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_detalle`
--

LOCK TABLES `pedido_detalle` WRITE;
/*!40000 ALTER TABLE `pedido_detalle` DISABLE KEYS */;
INSERT INTO `pedido_detalle` VALUES (1,2,1,1),(2,3,1,8),(3,1,2,2),(4,1,2,9),(5,2,3,10),(6,3,3,3),(7,2,3,11),(8,1,4,12),(9,2,4,4),(10,3,5,13),(11,4,5,5),(12,2,6,1),(13,1,6,6),(14,2,7,2),(15,3,7,7),(16,3,8,2),(17,2,8,3),(18,5,9,8),(19,6,9,3);
/*!40000 ALTER TABLE `pedido_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_reparto`
--

DROP TABLE IF EXISTS `pedido_reparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_reparto` (
  `pedido_reparto_id` int NOT NULL AUTO_INCREMENT,
  `pedido_reparto_hora` datetime DEFAULT NULL,
  `empleado_id` int NOT NULL,
  PRIMARY KEY (`pedido_reparto_id`),
  KEY `fk_pedido_reparto_empleado1_idx` (`empleado_id`),
  CONSTRAINT `fk_pedido_reparto_empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_reparto`
--

LOCK TABLES `pedido_reparto` WRITE;
/*!40000 ALTER TABLE `pedido_reparto` DISABLE KEYS */;
INSERT INTO `pedido_reparto` VALUES (1,'2021-02-03 10:00:00',1),(2,'2021-02-03 12:00:00',1),(3,'2021-02-03 13:00:00',3);
/*!40000 ALTER TABLE `pedido_reparto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `producto_nombre` varchar(45) DEFAULT NULL,
  `producto_descripcion` varchar(255) DEFAULT NULL,
  `producto_precio` decimal(10,2) DEFAULT NULL,
  `producto_tipo` enum('Pizzas','Hamburguesas','Bebidas') DEFAULT NULL,
  `producto_imagen` varchar(255) DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `fk_producto_categoria1_idx` (`categoria_id`),
  CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_pizzas` (`categoria_pizzas_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Pizza Iberica','Jamon iberico + gorgonzola',12.55,'Pizzas','imgrandom.png',1),(2,'Pizza Carbonara','Carbonara + guanciale',11.56,'Pizzas','imgrandom.png',2),(3,'Pizza Margherita','Classic margherita',10.75,'Pizzas','imgrandom.png',2),(4,'Triple Burguer','250gr ',9.75,'Hamburguesas','imgrandom.png',NULL),(5,'Doble Burger','175gr',8.56,'Hamburguesas','imgrandom.png',NULL),(6,'Burger classic','100gr',7.50,'Hamburguesas','imgrandom.png',NULL),(7,'Coca Cola','33cl',1.50,'Bebidas','imgrandom.png',NULL),(8,'Agua mineral','33cl',1.00,'Bebidas','imgrandom.png',NULL),(9,'Cerveza','33cl',2.20,'Bebidas','imgrandom.png',NULL),(10,'Nestea','33cl',1.70,'Bebidas','imgrandom.png',NULL),(11,'Cafe','Expresso',1.20,'Bebidas','imgrandom.png',NULL),(12,'Pizza flor di cotto','Jamon york +  mozzarella',10.75,'Pizzas','imgrandom.png',3),(13,'Pizza catalana','Butifarra +  mozzarella',12.75,'Pizzas','imgrandom.png',3);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `provincia_id` int NOT NULL AUTO_INCREMENT,
  `provincia_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`provincia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Barcelona'),(2,'Girona'),(3,'Lleida'),(4,'Tarragona');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `tienda_id` int NOT NULL AUTO_INCREMENT,
  `tienda_nombre` varchar(45) DEFAULT NULL,
  `tienda_direccion` varchar(255) DEFAULT NULL,
  `localidad_id` int NOT NULL,
  PRIMARY KEY (`tienda_id`),
  KEY `fk_tienda_localidad1_idx` (`localidad_id`),
  CONSTRAINT `fk_tienda_localidad1` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`localidad_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'La mejor tienda','C/ aosfbasogb',1),(2,'La de Tarragona','C/ 917gasfhas',8),(3,'La segunda mejor tienda','C/ aaoiusbfiab',5),(4,'La lleidetana','C/ asdgaogujb',7);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-23 10:02:12
