-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema agrotech_coop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema agrotech_coop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agrotech_coop` DEFAULT CHARACTER SET utf8 ;
USE `agrotech_coop` ;

-- -----------------------------------------------------
-- Table `agrotech_coop`.`cultivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrotech_coop`.`cultivos` (
  `id_cultivo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `metodo` ENUM('hidroponico', 'suelo') NOT NULL,
  PRIMARY KEY (`id_cultivo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrotech_coop`.`tipos_sensores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrotech_coop`.`tipos_sensores` (
  `id_tipo_sensor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT(100) NULL,
  PRIMARY KEY (`id_tipo_sensor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrotech_coop`.`parcelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrotech_coop`.`parcelas` (
  `id_parcela` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(100) NULL,
  `area` DECIMAL(10,2) NOT NULL,
  `id_cultivo` INT NOT NULL,
  PRIMARY KEY (`id_parcela`),
  INDEX `id_cultivo_idx` (`id_cultivo` ASC) VISIBLE,
  CONSTRAINT `id_cultivo`
    FOREIGN KEY (`id_cultivo`)
    REFERENCES `agrotech_coop`.`cultivos` (`id_cultivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrotech_coop`.`sensores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrotech_coop`.`sensores` (
  `id_sensor` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_sensor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `estado` ENUM('activo', 'inactivo') NULL,
  PRIMARY KEY (`id_sensor`),
  INDEX `id_tipo_sensor_idx` (`id_tipo_sensor` ASC) VISIBLE,
  CONSTRAINT `id_tipo_sensor`
    FOREIGN KEY (`id_tipo_sensor`)
    REFERENCES `agrotech_coop`.`tipos_sensores` (`id_tipo_sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrotech_coop`.`mediciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrotech_coop`.`mediciones` (
  `id_medicion` INT NOT NULL AUTO_INCREMENT,
  `id_sensor` INT NOT NULL,
  `id_parcela` INT NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`id_medicion`),
  INDEX `id_sensor_idx` (`id_sensor` ASC) VISIBLE,
  INDEX `id_parcela_idx` (`id_parcela` ASC) VISIBLE,
  CONSTRAINT `id_sensor`
    FOREIGN KEY (`id_sensor`)
    REFERENCES `agrotech_coop`.`sensores` (`id_sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_parcela`
    FOREIGN KEY (`id_parcela`)
    REFERENCES `agrotech_coop`.`parcelas` (`id_parcela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
