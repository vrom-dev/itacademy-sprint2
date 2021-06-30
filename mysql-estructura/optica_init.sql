DROP DATABASE IF EXISTS `optica`;
CREATE DATABASE `optica`;
USE `optica`;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
INSERT INTO `cliente` VALUES (1,'666666666','emailcliente3@gmail.com','2021-06-22 10:18:59','Calle 1234',23,'1','A','Barcelona','13245','ESP',NULL),(2,'777777777','emailcliente4@gmail.com','2021-06-22 10:20:23','Calle 11241',2,'2','B','Sabadell','12124','ESP',NULL),(3,'999999999','emailcliente6@gmail.com','2021-06-22 10:20:23','Calle 124124',412,'5','A','Mataró','12412','ESP',NULL),(4,'333333336','emailcliente7@gmail.com','2021-06-22 10:20:23','Calle 112412',12,'8','A','Bilbao','56457','ESP',1),(5,'444444444','emailcliente8@gmail.com','2021-06-22 10:20:23','Calle 235',55,'4','C','Sevilla','42353','ESP',2);

CREATE TABLE `empleado` (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `empleado_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
INSERT INTO `empleado` VALUES (1,'Joan'),(2,'Laura'),(3,'Lluis'),(4,'Martina');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
INSERT INTO `proveedor` VALUES (1,'Proveedor principal','123444556','123444556','Calle 1234',23,'1','A','Barcelona','28885','ESP','44455661A'),(2,'Proveedor secundario','123555667','123555667','Calle 1222',1,'2','B','Sabadell','25565','ESP','55544772B'),(3,'Proveedor alternativo','123455564','123455564','Calle 1122',234,'6','C','Paris','13246','FR','65463512C');

CREATE TABLE `gafa` (
  `gafa_id` int NOT NULL AUTO_INCREMENT,
  `gafa_graduacion_derecha` decimal(10,2) DEFAULT NULL,
  `gafa_graduacion_izquierda` decimal(10,2) DEFAULT NULL,
  `gafa_montura` enum('Flotante','Pasta','Metálica') DEFAULT NULL,
  `gafa_montura_color` varchar(45) DEFAULT NULL,
  `gafa_cristal_color` varchar(45) DEFAULT NULL,
  `gafa_precio` decimal(10,2) DEFAULT NULL,
  `gafa_marca` varchar(45) DEFAULT NULL,
  `gafa_fecha_venta` datetime DEFAULT NULL,
  `proveedor_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `empleado_id` int NOT NULL,
  PRIMARY KEY (`gafa_id`),
  KEY `fk_gafa_proveedor1_idx` (`proveedor_id`),
  KEY `fk_gafa_cliente1_idx` (`cliente_id`),
  KEY `fk_gafa_empleado1_idx` (`empleado_id`),
  CONSTRAINT `fk_gafa_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gafa_empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gafa_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
INSERT INTO `gafa` VALUES (1,0.00,0.00,'Flotante','Negro','Transparente',100.80,'Ray-B','2021-01-01 00:00:00',2,1,1),(2,0.00,0.00,'Pasta','Blanco','Oscuro',80.56,'Ray-B','2021-03-01 00:00:00',2,1,3),(3,1.25,1.55,'Metálica','Marrón','Oscuro',123.25,'Diesel','2021-05-01 00:00:00',1,2,2),(4,0.00,0.00,'Flotante','Negro','Oscuro',100.25,'Diesel','2021-06-01 00:00:00',1,4,2),(5,3.15,3.15,'Pasta','Rojo','Transparente',125.36,'Cotet','2021-01-11 00:00:00',2,5,4);