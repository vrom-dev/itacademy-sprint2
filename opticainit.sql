-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveedor` (
  `proveedor_id` INT NOT NULL AUTO_INCREMENT,
  `proveedor_nombre` VARCHAR(45) NULL,
  `proveedor_telefono` VARCHAR(9) NULL,
  `proveedor_fax` VARCHAR(9) NULL,
  `proveedor_nif` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`proveedor_id`),
  UNIQUE INDEX `proveedor_nif_UNIQUE` (`proveedor_nif` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`direccion` (
  `direccion_id` INT NOT NULL AUTO_INCREMENT,
  `direccion_calle` VARCHAR(255) NULL,
  `direccion_numero` INT NULL,
  `direccion_piso` VARCHAR(10) NULL,
  `direccion_puerta` VARCHAR(10) NULL,
  `direccion_ciudad` VARCHAR(45) NULL,
  `direccion_zipcode` VARCHAR(10) NULL,
  `direccion_pais` VARCHAR(45) NULL,
  PRIMARY KEY (`direccion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `marca_id` INT NOT NULL AUTO_INCREMENT,
  `marca_nombre` VARCHAR(45) NULL,
  `proveedor_id` INT NOT NULL,
  PRIMARY KEY (`marca_id`),
  INDEX `fk_brand_supplier1_idx` (`proveedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_brand_supplier1`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`gafa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`gafa` (
  `gafa_id` INT NOT NULL AUTO_INCREMENT,
  `gafa_graduacion_derecha` VARCHAR(45) NULL,
  `gafa_graduacion_izquierda` VARCHAR(45) NULL,
  `gafa_montura` ENUM("Flotante", "Pasta", "Metálica") NULL,
  `gafa_montura_color` VARCHAR(45) NULL,
  `gafa_cristal_color` VARCHAR(45) NULL,
  `gafa_precio` DECIMAL(10,2) NULL,
  `marca_id` INT NOT NULL,
  PRIMARY KEY (`gafa_id`),
  INDEX `fk_glasses_brand1_idx` (`marca_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_brand1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `optica`.`marca` (`marca_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`cliente` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_telefono` VARCHAR(9) NULL,
  `cliente_email` VARCHAR(255) NULL,
  `cliente_fecha_registro` DATETIME NULL,
  `cliente_referido_id` INT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `fk_client_client1_idx` (`cliente_referido_id` ASC) VISIBLE,
  UNIQUE INDEX `cliente_email_UNIQUE` (`cliente_email` ASC) VISIBLE,
  CONSTRAINT `fk_client_client1`
    FOREIGN KEY (`cliente_referido_id`)
    REFERENCES `optica`.`cliente` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleado` (
  `empleado_id` INT NOT NULL AUTO_INCREMENT,
  `empleado_nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`empleado_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`factura` (
  `factura_id` INT NOT NULL AUTO_INCREMENT,
  `factura_date` DATETIME NULL,
  `empleado_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`factura_id`),
  INDEX `fk_invoice_employee1_idx` (`empleado_id` ASC) VISIBLE,
  INDEX `fk_invoice_client1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_employee1`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `optica`.`empleado` (`empleado_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_invoice_client1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `optica`.`cliente` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`detalle_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`detalle_factura` (
  `detalle_factura_id` INT NOT NULL AUTO_INCREMENT,
  `factura_id` INT NOT NULL,
  `linea_factura_cantidad` INT NULL,
  `gafa_id` INT NOT NULL,
  PRIMARY KEY (`detalle_factura_id`),
  INDEX `fk_invoice_detail_invoice1_idx` (`factura_id` ASC) VISIBLE,
  INDEX `fk_linea_factura_gafa1_idx` (`gafa_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_detail_invoice1`
    FOREIGN KEY (`factura_id`)
    REFERENCES `optica`.`factura` (`factura_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_linea_factura_gafa1`
    FOREIGN KEY (`gafa_id`)
    REFERENCES `optica`.`gafa` (`gafa_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`proveedor_direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveedor_direccion` (
  `proveedor_direccion_id` INT NOT NULL AUTO_INCREMENT,
  `proveedor_id` INT NOT NULL,
  `direccion_id` INT NOT NULL,
  PRIMARY KEY (`proveedor_direccion_id`),
  INDEX `fk_proveedor_direccion_proveedor1_idx` (`proveedor_id` ASC) VISIBLE,
  INDEX `fk_proveedor_direccion_direccion1_idx` (`direccion_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor_direccion_proveedor1`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_proveedor_direccion_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `optica`.`direccion` (`direccion_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`cliente_direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`cliente_direccion` (
  `cliente_direccion_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `direccion_id` INT NOT NULL,
  PRIMARY KEY (`cliente_direccion_id`),
  INDEX `fk_cliente_direccion_cliente1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_cliente_direccion_direccion1_idx` (`direccion_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_direccion_cliente1`
    FOREIGN KEY (`client_id`)
    REFERENCES `optica`.`cliente` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cliente_direccion_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `optica`.`direccion` (`direccion_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
