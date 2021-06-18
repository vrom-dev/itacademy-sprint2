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
  `proveedor_nif` VARCHAR(8) NULL,
  PRIMARY KEY (`proveedor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`direccion` (
  `direccion_id` INT NOT NULL AUTO_INCREMENT,
  `direccion_calle` VARCHAR(45) NULL,
  `direccion_numero` VARCHAR(45) NULL,
  `direccion_piso` VARCHAR(45) NULL,
  `direccion_puerta` VARCHAR(45) NULL,
  `direccion_ciudad` VARCHAR(45) NULL,
  `direccion_zipcode` VARCHAR(45) NULL,
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
  PRIMARY KEY (`marca_id`, `proveedor_id`),
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
  `gafa_montura` VARCHAR(45) NULL,
  `gafa_montura_color` VARCHAR(45) NULL,
  `gafa_cristal_color` VARCHAR(45) NULL,
  `gafa_precio` VARCHAR(45) NULL,
  `marca_id` INT NOT NULL,
  PRIMARY KEY (`gafa_id`, `marca_id`),
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
  `cliente_referido_id` INT NOT NULL,
  PRIMARY KEY (`client_id`, `cliente_referido_id`),
  INDEX `fk_client_client1_idx` (`cliente_referido_id` ASC) VISIBLE,
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
-- Table `optica`.`cliente_direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`cliente_direccion` (
  `direccion_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`direccion_id`, `cliente_id`),
  INDEX `fk_client_address_client1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_address_address`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `optica`.`direccion` (`direccion_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_client_address_client1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `optica`.`cliente` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`proveedor_direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveedor_direccion` (
  `proveedor_id` INT NOT NULL,
  `direccion_id` INT NOT NULL,
  PRIMARY KEY (`proveedor_id`, `direccion_id`),
  INDEX `fk_supplier_address_address1_idx` (`direccion_id` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_address_supplier1`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_supplier_address_address1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `optica`.`direccion` (`direccion_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`factura` (
  `factura_id` INT NOT NULL AUTO_INCREMENT,
  `factura_date` DATETIME NULL,
  `empleado_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`factura_id`, `empleado_id`, `cliente_id`),
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
-- Table `optica`.`linea_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`linea_factura` (
  `linea_factura_id` INT NOT NULL AUTO_INCREMENT,
  `gafa_id` INT NOT NULL,
  `factura_id` INT NOT NULL,
  `linea_factura_cantidad` INT NULL,
  PRIMARY KEY (`linea_factura_id`, `gafa_id`, `factura_id`),
  INDEX `fk_invoice_detail_glasses1_idx` (`gafa_id` ASC) VISIBLE,
  INDEX `fk_invoice_detail_invoice1_idx` (`factura_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_detail_glasses1`
    FOREIGN KEY (`gafa_id`)
    REFERENCES `optica`.`gafa` (`gafa_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_invoice_detail_invoice1`
    FOREIGN KEY (`factura_id`)
    REFERENCES `optica`.`factura` (`factura_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
