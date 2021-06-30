DROP DATABASE IF EXISTS `youtube`;
CREATE DATABASE `youtube`;
USE `youtube`;

CREATE TABLE `usuario` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nombre_usuario` varchar(45) NOT NULL,
  `usuario_email` varchar(255) NOT NULL,
  `usuario_fecha_nacimiento` varchar(45) DEFAULT NULL,
  `usuario_sexo` varchar(15) DEFAULT NULL,
  `usuario_pais` varchar(3) DEFAULT NULL,
  `usuario_zipcode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuario_nombre_usuario_UNIQUE` (`usuario_nombre_usuario`),
  UNIQUE KEY `usuario_email_UNIQUE` (`usuario_email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
INSERT INTO `usuario` VALUES (1,'pere','vudgidg@gmail.com','1995-01-01','M','ESP','08000'),(2,'marti','AGHABS@gmail.com','1985-01-01','M','ESP','08221'),(3,'maria','asfhasfvbf@gmail.com','1975-01-01','F','ESP','02455'),(4,'tomas','agfasbasg@gmail.com','1985-01-01','M','ESP','05454'),(5,'laura','agiabgaisg@gmail.com','1979-01-01','F','ESP','65465'),(6,'clara','agiabaisg@gmail.com','1992-01-01','F','ESP','65456');

CREATE TABLE `video` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `video_titulo` varchar(45) DEFAULT NULL,
  `video_descripcion` varchar(45) DEFAULT NULL,
  `video_size` int DEFAULT NULL,
  `video_filename` varchar(45) DEFAULT NULL,
  `video_durada` varchar(45) DEFAULT NULL,
  `video_thumbnail` varchar(45) DEFAULT NULL,
  `video_reproduccions` int DEFAULT NULL,
  `video_fecha_creacion` datetime DEFAULT NULL,
  `video_estado` enum('publico','privado','oculto') DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `fk_video_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_video_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
INSERT INTO `video` VALUES (1,'Video 1','Descripción 1',12,'video.mp4','3:25','video.png',13,'2021-06-23 00:00:00','privado',1),(2,'Video 2','Descripción 2',22,'video.mp4','2:12','video.png',4412,'2021-06-11 00:00:00','publico',2),(3,'Video 3','Descripción 3',1,'video.mp4','1:23','video.png',41255,'2021-06-01 00:00:00','privado',3),(4,'Video 4','Descripción 4',23,'video.mp4','10:64','video.png',1231,'2021-02-23 00:00:00','publico',1),(5,'Video 5','Descripción 5',455,'video.mp4','11:42','video.png',123,'2021-03-23 00:00:00','oculto',2),(6,'Video 6','Descripción 6',546,'video.mp4','42:45','video.png',32,'2021-05-23 00:00:00','publico',3),(7,'Video 7','Descripción 7',112,'video.mp4','21:09','video.png',21,'2021-05-23 00:00:00','publico',1);

CREATE TABLE `comentario` (
  `comentario_id` int NOT NULL AUTO_INCREMENT,
  `comentario_texto` varchar(255) DEFAULT NULL,
  `comentario_fecha` datetime DEFAULT NULL,
  `video_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`comentario_id`),
  KEY `fk_comentario_video1_idx` (`video_id`),
  KEY `fk_comentario_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comentario_video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
INSERT INTO `comentario` VALUES (1,'Comentario random','2021-06-23 00:00:00',1,3),(2,'Comentario random 2','2021-06-23 00:00:00',2,3),(3,'Comentario random 3','2021-06-23 00:00:00',3,3),(4,'Comentario random 4','2021-06-23 00:00:00',4,2),(5,'Comentario random 5','2021-06-23 00:00:00',5,1),(6,'Comentario random 5','2021-06-23 00:00:00',6,2),(7,'Comentario random 6','2021-06-23 00:00:00',7,2),(8,'Comentario random 7','2021-06-23 00:00:00',7,1),(9,'Comentario random 8','2021-06-23 00:00:00',1,3);

CREATE TABLE `accion_comentarios` (
  `accion_comentarios_id` int NOT NULL AUTO_INCREMENT,
  `accion_comentarios_tipo` enum('like','dislike') NOT NULL,
  `accion_comentarios_fecha` datetime DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `comentario_id` int NOT NULL,
  PRIMARY KEY (`accion_comentarios_id`),
  KEY `fk_accion_comentarios_usuario1_idx` (`usuario_id`),
  KEY `fk_accion_comentarios_comentario1_idx` (`comentario_id`),
  CONSTRAINT `fk_accion_comentarios_comentario1` FOREIGN KEY (`comentario_id`) REFERENCES `comentario` (`comentario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_accion_comentarios_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
INSERT INTO `accion_comentarios` VALUES (1,'like','2021-06-01 00:00:00',2,1),(2,'dislike','2021-06-01 00:00:00',3,1),(3,'like','2021-06-01 00:00:00',1,2),(4,'dislike','2021-06-01 00:00:00',2,2),(5,'dislike','2021-06-01 00:00:00',3,3),(6,'dislike','2021-06-01 00:00:00',1,3),(7,'like','2021-06-01 00:00:00',6,4),(8,'dislike','2021-06-01 00:00:00',4,4),(9,'like','2021-06-01 00:00:00',5,5),(10,'like','2021-06-01 00:00:00',3,5),(11,'like','2021-06-01 00:00:00',2,6),(12,'like','2021-06-01 00:00:00',5,6),(13,'dislike','2021-06-01 00:00:00',4,7),(14,'like','2021-06-01 00:00:00',3,7),(15,'like','2021-06-01 00:00:00',1,8),(16,'like','2021-06-01 00:00:00',6,9);

CREATE TABLE `accion_videos` (
  `accion_videos_id` int NOT NULL AUTO_INCREMENT,
  `accion_videos_tipo` enum('like','dislike','none') NOT NULL,
  `accion_videos_fecha` datetime DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`accion_videos_id`),
  KEY `fk_accion_usuario1_idx` (`usuario_id`),
  KEY `fk_accion_video1_idx` (`video_id`),
  CONSTRAINT `fk_accion_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_accion_video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
INSERT INTO `accion_videos` VALUES (1,'like','2021-06-01 00:00:00',2,1),(2,'like','2021-06-01 00:00:00',3,1),(3,'like','2021-06-01 00:00:00',4,2),(4,'like','2021-06-01 00:00:00',1,2),(5,'like','2021-06-01 00:00:00',6,3),(6,'dislike','2021-06-01 00:00:00',1,3),(7,'like','2021-06-01 00:00:00',5,4),(8,'dislike','2021-06-01 00:00:00',3,4),(9,'like','2021-06-01 00:00:00',5,5),(10,'dislike','2021-06-01 00:00:00',1,5),(11,'like','2021-06-01 00:00:00',6,6),(12,'like','2021-06-01 00:00:00',2,6),(13,'like','2021-06-01 00:00:00',4,7),(14,'dislike','2021-06-01 00:00:00',1,7);

CREATE TABLE `canal` (
  `canal_id` int NOT NULL AUTO_INCREMENT,
  `canal_nombre` varchar(45) DEFAULT NULL,
  `canal_descripcion` varchar(45) DEFAULT NULL,
  `canal_fecha_creacion` datetime DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`canal_id`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  KEY `fk_canal_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_canal_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
INSERT INTO `canal` VALUES (1,'canal de pere','Descripcion random','2021-06-23 00:00:00',1),(2,'canal de marti','Descripcion random','2021-03-23 00:00:00',2),(3,'canal de maria','Descripcion random','2021-01-23 00:00:00',3);

CREATE TABLE `etiqueta` (
  `etiqueta_id` int NOT NULL AUTO_INCREMENT,
  `etiqueta_nombre` varchar(45) DEFAULT NULL,
  `video_id` int NOT NULL,
  PRIMARY KEY (`etiqueta_id`),
  KEY `fk_etiqueta_video1_idx` (`video_id`),
  CONSTRAINT `fk_etiqueta_video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
INSERT INTO `etiqueta` VALUES (1,'javascript',1),(2,'java',2),(3,'python',1),(4,'sql',2),(5,'programming',3);

CREATE TABLE `playlist` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(45) DEFAULT NULL,
  `playlist_fecha_creacion` datetime DEFAULT NULL,
  `playlist_estado` enum('publica','privada') DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `fk_playlist_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_playlist_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
INSERT INTO `playlist` VALUES (1,'playlist definitiva','2021-06-23 00:00:00','publica',1),(2,'playlist 2','2021-06-23 00:00:00','privada',2),(3,'playlist 3','2021-06-23 00:00:00','publica',1);

CREATE TABLE `playlist_video` (
  `video_id` int NOT NULL,
  `playlist_id` int NOT NULL,
  PRIMARY KEY (`video_id`,`playlist_id`),
  KEY `fk_playlist_has_video_playlist1_idx` (`playlist_id`),
  CONSTRAINT `fk_playlist_has_video_playlist1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_has_video_video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `playlist_video` VALUES (1,1),(2,1),(4,1),(6,1),(7,1),(1,2),(2,2),(3,2),(5,2),(6,2),(2,3),(4,3),(5,3),(6,3),(7,3);

CREATE TABLE `suscripcion` (
  `canal_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`canal_id`,`usuario_id`),
  KEY `fk_suscripciones_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_suscripciones_canal` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`canal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_suscripciones_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `suscripcion` VALUES (2,1),(3,1),(1,2);