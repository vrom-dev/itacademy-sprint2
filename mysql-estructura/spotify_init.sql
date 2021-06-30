DROP DATABASE IF EXISTS `spotify`;
CREATE DATABASE `spotify`;
USE `spotify`;

CREATE TABLE `artista` (
  `artista_id` int NOT NULL AUTO_INCREMENT,
  `artista_nombre` varchar(45) DEFAULT NULL,
  `artista_imagen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`artista_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
INSERT INTO `artista` VALUES (1,'Otis Redding','otis.png'),(2,'Nina Simone','nina.png'),(3,'The Cramps','cramps.png'),(4,'Led Zeppelin','ledzep.png'),(5,'Deep Purple','deepurple.png');

CREATE TABLE `album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `artista_id` int NOT NULL,
  `album_titulo` varchar(45) DEFAULT NULL,
  `album_fecha_publicacion` datetime DEFAULT NULL,
  `album_imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_album_artista1_idx` (`artista_id`),
  CONSTRAINT `fk_album_artista1` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`artista_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
INSERT INTO `album` VALUES (1,1,'Pain In My Heart','1964-01-01 00:00:00','otisalbum.png'),(2,1,'The Great Otis Redding Sings Soul Ballads ','1965-01-01 00:00:00','otisalbum2.png'),(3,2,'Little Girl Blue','1958-01-01 00:00:00','ninaalbum.png'),(4,2,'Nina Simone And Her Friends','1959-01-01 00:00:00','ninaalbum2.png'),(5,3,'Gravest Hits','1979-01-01 00:00:00','thecramps.png'),(6,4,'Led Zeppelin','1969-01-01 00:00:00','zep.png'),(7,4,'Led Zeppelin II','1969-01-01 00:00:00','zep2.png'),(8,5,'Shades of Deep Purple','1968-01-01 00:00:00','deep.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
INSERT INTO `usuario` VALUES (1,'luis','aishfvbasf@gmai.com','1234','1980-01-01 00:00:00','M','ESP','08222'),(2,'maria','asgouasbg@gmail.com','1234','1989-01-01 00:00:00','F','ESP','08888'),(3,'victor','asgfyasfbb@gmail.com','1234','1988-01-01 00:00:00','M','ESP','09999'),(4,'josep','ashbasgf@gmail.com','1234','1998-01-01 00:00:00','M','ESP','08485');

CREATE TABLE `album_favorito` (
  `usuario_id` int NOT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`album_id`),
  KEY `fk_album_favorito_usuario1_idx` (`usuario_id`),
  KEY `fk_album_favorito_album1_idx` (`album_id`),
  CONSTRAINT `fk_album_favorito_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_album_favorito_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `album_favorito` VALUES (1,1),(1,2),(2,5),(2,6),(3,6),(4,3),(4,8);

CREATE TABLE `estilo_musical` (
  `estilo_musical_id` int NOT NULL AUTO_INCREMENT,
  `estilo_musical_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`estilo_musical_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
INSERT INTO `estilo_musical` VALUES (1,'Blues'),(2,'Rock'),(3,'Punk');

CREATE TABLE `artista_estilo_musical` (
  `estilo_musical_id` int NOT NULL,
  `artista_id` int NOT NULL,
  PRIMARY KEY (`estilo_musical_id`,`artista_id`),
  KEY `fk_artista_estilo_musical_estilo_musical1_idx` (`estilo_musical_id`),
  KEY `fk_artista_estilo_musical_artista1_idx` (`artista_id`),
  CONSTRAINT `fk_artista_estilo_musical_artista1` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`artista_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artista_estilo_musical_estilo_musical1` FOREIGN KEY (`estilo_musical_id`) REFERENCES `estilo_musical` (`estilo_musical_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `artista_estilo_musical` VALUES (1,4),(1,5),(2,1),(2,2),(3,3);

CREATE TABLE `artista_favorito` (
  `usuario_id` int NOT NULL,
  `artista_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`artista_id`),
  KEY `fk_artista_favorito_usuario1_idx` (`usuario_id`),
  KEY `fk_artista_favorito_artista1_idx` (`artista_id`),
  CONSTRAINT `fk_artista_favorito_artista1` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`artista_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artista_favorito_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `artista_favorito` VALUES (1,1),(1,2),(1,4),(2,3),(2,4),(3,4),(4,2),(4,5);

CREATE TABLE `artista_relacionado` (
  `artista_id1` int NOT NULL,
  `artista_id2` int NOT NULL,
  PRIMARY KEY (`artista_id2`,`artista_id1`),
  KEY `fk_artista_relacionado_artista2_idx` (`artista_id2`),
  KEY `fk_artista_relacionado_artista1` (`artista_id1`),
  CONSTRAINT `fk_artista_relacionado_artista1` FOREIGN KEY (`artista_id1`) REFERENCES `artista` (`artista_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artista_relacionado_artista2` FOREIGN KEY (`artista_id2`) REFERENCES `artista` (`artista_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `artista_relacionado` VALUES (2,1),(3,1),(4,1),(1,2),(3,2),(1,4),(3,4),(5,4),(3,5),(4,5);

CREATE TABLE `cancion` (
  `cancion_id` int NOT NULL AUTO_INCREMENT,
  `album_id` int NOT NULL,
  `cancion_titulo` varchar(45) DEFAULT NULL,
  `cancion_duracion` varchar(45) DEFAULT NULL,
  `cancion_reproducciones` int DEFAULT NULL,
  PRIMARY KEY (`cancion_id`),
  KEY `fk_cancion_album1_idx` (`album_id`),
  CONSTRAINT `fk_cancion_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
INSERT INTO `cancion` VALUES (1,6,'Good Times, Bad Times','2:47',15000),(2,6,'Babe Im Gonna Leave You','6:43',25000),(3,6,'Your Time Is Gonna Come','4.35',10000),(4,1,'Pain in My Heart','2:22',9000),(5,1,'The Dog','2:30',5000),(6,4,'Try a Little Tenderness','3:43',12000);

CREATE TABLE `cancion_favorita` (
  `usuario_id` int NOT NULL,
  `cancion_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`,`cancion_id`),
  KEY `fk_cancion_favorita_usuario1_idx` (`usuario_id`),
  KEY `fk_cancion_favorita_cancion1_idx` (`cancion_id`),
  CONSTRAINT `fk_cancion_favorita_cancion1` FOREIGN KEY (`cancion_id`) REFERENCES `cancion` (`cancion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cancion_favorita_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `cancion_favorita` VALUES (1,1),(1,2),(2,1),(2,2),(2,4),(3,2),(4,2),(4,5);

CREATE TABLE `paypal` (
  `paypal_id` int NOT NULL AUTO_INCREMENT,
  `paypal_username` varchar(45) DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`paypal_id`),
  KEY `fk_paypal_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_paypal_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
INSERT INTO `paypal` VALUES (1,'aishfvbasf@gmai.com',1),(2,'asgouasbg@gmail.com',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
INSERT INTO `tarjeta_credito` VALUES (1,54654546546546,12,2021,123,1),(2,56465454222214,2,2023,213,2),(3,47855889556658,5,2022,234,3),(4,44785658887878,6,2024,334,4);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
INSERT INTO `pago` VALUES (1,'2021-04-01 00:00:00',NULL,10,1,NULL),(2,'2021-03-01 00:00:00',NULL,10,NULL,2);

CREATE TABLE `playlist` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `playlist_titulo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `playlist_fecha_creacion` datetime DEFAULT NULL,
  `playlist_fecha_eliminacion` datetime DEFAULT NULL,
  `playlist_estado` enum('activa','eliminada') DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlist_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_playlist_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
INSERT INTO `playlist` VALUES (1,'Otis playlist','2021-01-01 00:00:00','2021-05-01 00:00:00','eliminada',1),(2,'Nina playlist','2021-02-01 00:00:00',NULL,'activa',2),(3,'LZ playlist','2021-03-01 00:00:00',NULL,'activa',3),(4,'DP playlist','2021-04-01 00:00:00',NULL,'activa',2);


CREATE TABLE `playlist_cancion` (
  `playlist_id` int NOT NULL,
  `cancion_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`,`cancion_id`),
  KEY `fk_playlist_cancion_playlist_idx` (`playlist_id`),
  KEY `fk_playlist_cancion_cancion1_idx` (`cancion_id`),
  CONSTRAINT `fk_playlist_cancion_cancion1` FOREIGN KEY (`cancion_id`) REFERENCES `cancion` (`cancion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_cancion_playlist` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `playlist_cancion` VALUES (1,1),(1,2),(2,2),(2,3),(3,1),(3,4),(3,5),(4,1),(4,3),(4,4),(4,5);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
INSERT INTO `suscripcion` VALUES (1,'2021-04-01 00:00:00','2021-05-01 00:00:00','tarjeta',1,1),(2,'2021-03-01 00:00:00','2021-04-01 00:00:00','paypal',2,2);