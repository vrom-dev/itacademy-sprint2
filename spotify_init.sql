CREATE DATABASE  IF NOT EXISTS `spotify` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spotify`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: spotify
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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `artista_id` int NOT NULL,
  `album_titulo` varchar(45) DEFAULT NULL,
  `album_fecha_publicacion` datetime DEFAULT NULL,
  `album_imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_album_artista1_idx` (`artista_id`),
  CONSTRAINT `fk_album_artista1` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`artista_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,1,'Pain In My Heart','1964-01-01 00:00:00','otisalbum.png'),(2,1,'The Great Otis Redding Sings Soul Ballads ','1965-01-01 00:00:00','otisalbum2.png'),(3,2,'Little Girl Blue','1958-01-01 00:00:00','ninaalbum.png'),(4,2,'Nina Simone And Her Friends','1959-01-01 00:00:00','ninaalbum2.png'),(5,3,'Gravest Hits','1979-01-01 00:00:00','thecramps.png'),(6,4,'Led Zeppelin','1969-01-01 00:00:00','zep.png'),(7,4,'Led Zeppelin II','1969-01-01 00:00:00','zep2.png'),(8,5,'Shades of Deep Purple','1968-01-01 00:00:00','deep.png');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_favorito`
--

DROP TABLE IF EXISTS `album_favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_favorito` (
  `usuario_id` int NOT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`album_id`),
  KEY `fk_album_favorito_usuario1_idx` (`usuario_id`),
  KEY `fk_album_favorito_album1_idx` (`album_id`),
  CONSTRAINT `fk_album_favorito_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_album_favorito_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_favorito`
--

LOCK TABLES `album_favorito` WRITE;
/*!40000 ALTER TABLE `album_favorito` DISABLE KEYS */;
INSERT INTO `album_favorito` VALUES (1,1),(1,2),(2,5),(2,6),(3,6),(4,3),(4,8);
/*!40000 ALTER TABLE `album_favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `artista_id` int NOT NULL AUTO_INCREMENT,
  `artista_nombre` varchar(45) DEFAULT NULL,
  `artista_imagen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`artista_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Otis Redding','otis.png'),(2,'Nina Simone','nina.png'),(3,'The Cramps','cramps.png'),(4,'Led Zeppelin','ledzep.png'),(5,'Deep Purple','deepurple.png');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_estilo_musical`
--

DROP TABLE IF EXISTS `artista_estilo_musical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista_estilo_musical` (
  `estilo_musical_id` int NOT NULL,
  `artista_id` int NOT NULL,
  PRIMARY KEY (`estilo_musical_id`,`artista_id`),
  KEY `fk_artista_estilo_musical_estilo_musical1_idx` (`estilo_musical_id`),
  KEY `fk_artista_estilo_musical_artista1_idx` (`artista_id`),
  CONSTRAINT `fk_artista_estilo_musical_artista1` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`artista_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artista_estilo_musical_estilo_musical1` FOREIGN KEY (`estilo_musical_id`) REFERENCES `estilo_musical` (`estilo_musical_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_estilo_musical`
--

LOCK TABLES `artista_estilo_musical` WRITE;
/*!40000 ALTER TABLE `artista_estilo_musical` DISABLE KEYS */;
INSERT INTO `artista_estilo_musical` VALUES (1,4),(1,5),(2,1),(2,2),(3,3);
/*!40000 ALTER TABLE `artista_estilo_musical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_favorito`
--

DROP TABLE IF EXISTS `artista_favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista_favorito` (
  `usuario_id` int NOT NULL,
  `artista_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`artista_id`),
  KEY `fk_artista_favorito_usuario1_idx` (`usuario_id`),
  KEY `fk_artista_favorito_artista1_idx` (`artista_id`),
  CONSTRAINT `fk_artista_favorito_artista1` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`artista_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artista_favorito_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_favorito`
--

LOCK TABLES `artista_favorito` WRITE;
/*!40000 ALTER TABLE `artista_favorito` DISABLE KEYS */;
INSERT INTO `artista_favorito` VALUES (1,1),(1,2),(1,4),(2,3),(2,4),(3,4),(4,2),(4,5);
/*!40000 ALTER TABLE `artista_favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion` (
  `cancion_id` int NOT NULL AUTO_INCREMENT,
  `album_id` int NOT NULL,
  `cancion_titulo` varchar(45) DEFAULT NULL,
  `cancion_duracion` varchar(45) DEFAULT NULL,
  `cancion_reproducciones` int DEFAULT NULL,
  PRIMARY KEY (`cancion_id`),
  KEY `fk_cancion_album1_idx` (`album_id`),
  CONSTRAINT `fk_cancion_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancion`
--

LOCK TABLES `cancion` WRITE;
/*!40000 ALTER TABLE `cancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancion_favorita`
--

DROP TABLE IF EXISTS `cancion_favorita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion_favorita` (
  `usuario_id` int NOT NULL,
  `cancion_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`cancion_id`),
  KEY `fk_cancion_favorita_usuario1_idx` (`usuario_id`),
  KEY `fk_cancion_favorita_cancion1_idx` (`cancion_id`),
  CONSTRAINT `fk_cancion_favorita_cancion1` FOREIGN KEY (`cancion_id`) REFERENCES `cancion` (`cancion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cancion_favorita_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancion_favorita`
--

LOCK TABLES `cancion_favorita` WRITE;
/*!40000 ALTER TABLE `cancion_favorita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancion_favorita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estilo_musical`
--

DROP TABLE IF EXISTS `estilo_musical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estilo_musical` (
  `estilo_musical_id` int NOT NULL AUTO_INCREMENT,
  `estilo_musical_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`estilo_musical_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estilo_musical`
--

LOCK TABLES `estilo_musical` WRITE;
/*!40000 ALTER TABLE `estilo_musical` DISABLE KEYS */;
INSERT INTO `estilo_musical` VALUES (1,'rock'),(2,'soul'),(3,'punk');
/*!40000 ALTER TABLE `estilo_musical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `pago_fecha` datetime DEFAULT NULL,
  `pago_numero_orden` int DEFAULT NULL,
  `pago_total` int DEFAULT NULL,
  `tarjeta_credito_id` int DEFAULT NULL,
  `paypal_id` int DEFAULT NULL,
  PRIMARY KEY (`pago_id`),
  KEY `fk_pago_tarjeta_credito1_idx` (`tarjeta_credito_id`),
  KEY `fk_pago_paypal1_idx` (`paypal_id`),
  CONSTRAINT `fk_pago_paypal1` FOREIGN KEY (`paypal_id`) REFERENCES `paypal` (`paypal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pago_tarjeta_credito1` FOREIGN KEY (`tarjeta_credito_id`) REFERENCES `tarjeta_credito` (`tarjeta_credito_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal` (
  `paypal_id` int NOT NULL AUTO_INCREMENT,
  `paypal_username` varchar(45) DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`paypal_id`),
  KEY `fk_paypal_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_paypal_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
INSERT INTO `paypal` VALUES (1,'aishfvbasf@gmai.com',1),(2,'asgouasbg@gmail.com',2);
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `playlist_titulo` varchar(45) DEFAULT NULL,
  `playlist_fecha_creacion` datetime DEFAULT NULL,
  `playlist_fecha_eliminacion` datetime DEFAULT NULL,
  `playlist_estado` enum('activa','eliminada') DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlist_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_playlist_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_cancion`
--

DROP TABLE IF EXISTS `playlist_cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_cancion` (
  `playlist_id` int NOT NULL,
  `cancion_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`,`cancion_id`),
  KEY `fk_playlist_cancion_playlist_idx` (`playlist_id`),
  KEY `fk_playlist_cancion_cancion1_idx` (`cancion_id`),
  CONSTRAINT `fk_playlist_cancion_cancion1` FOREIGN KEY (`cancion_id`) REFERENCES `cancion` (`cancion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_cancion_playlist` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_cancion`
--

LOCK TABLES `playlist_cancion` WRITE;
/*!40000 ALTER TABLE `playlist_cancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripcion`
--

DROP TABLE IF EXISTS `suscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripcion` (
  `suscripcion_id` int NOT NULL,
  `suscripcion_fecha_inicio` datetime DEFAULT NULL,
  `suscripcion_fecha_renovacion` datetime DEFAULT NULL,
  `suscripcion_forma_de_pago` enum('paypal','tarjeta') DEFAULT NULL,
  `pago_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`suscripcion_id`),
  KEY `fk_suscripcion_pago1_idx` (`pago_id`),
  KEY `fk_suscripcion_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_suscripcion_pago1` FOREIGN KEY (`pago_id`) REFERENCES `pago` (`pago_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_suscripcion_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripcion`
--

LOCK TABLES `suscripcion` WRITE;
/*!40000 ALTER TABLE `suscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta_credito`
--

DROP TABLE IF EXISTS `tarjeta_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta_credito` (
  `tarjeta_credito_id` int NOT NULL AUTO_INCREMENT,
  `tarjeta_credito_numero` bigint DEFAULT NULL,
  `tarjeta_credito_mes` int DEFAULT NULL,
  `tarjeta_credito_year` int DEFAULT NULL,
  `tarjeta_credito_csv` int DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`tarjeta_credito_id`),
  KEY `fk_tarjeta_credito_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_tarjeta_credito_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta_credito`
--

LOCK TABLES `tarjeta_credito` WRITE;
/*!40000 ALTER TABLE `tarjeta_credito` DISABLE KEYS */;
INSERT INTO `tarjeta_credito` VALUES (1,54654546546546,12,2021,123,1),(2,56465454222214,2,2023,213,2),(3,47855889556658,5,2022,234,3),(4,44785658887878,6,2024,334,4);
/*!40000 ALTER TABLE `tarjeta_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_username` varchar(45) NOT NULL,
  `usuario_email` varchar(255) NOT NULL,
  `usuario_password` varchar(45) DEFAULT NULL,
  `usuario_fecha_nacimiento` datetime DEFAULT NULL,
  `usuario_sexo` varchar(3) DEFAULT NULL,
  `usuario_pais` varchar(3) DEFAULT NULL,
  `usuario_zipcode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_username_UNIQUE` (`usuario_username`),
  UNIQUE KEY `usuario_email_UNIQUE` (`usuario_email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'luis','aishfvbasf@gmai.com','1234','1980-01-01 00:00:00','M','ESP','08222'),(2,'maria','asgouasbg@gmail.com','1234','1989-01-01 00:00:00','F','ESP','08888'),(3,'victor','asgfyasfbb@gmail.com','1234','1988-01-01 00:00:00','M','ESP','09999'),(4,'josep','ashbasgf@gmail.com','1234','1998-01-01 00:00:00','M','ESP','08485');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-23 12:54:39
