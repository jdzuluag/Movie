-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `localTravel` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localTravel`.`Comprador` (
  `documento` BIGINT NOT NULL,
  `nombre` VARCHAR(120) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `contraseña` VARCHAR(120) NOT NULL,
  `telefono` BIGINT NOT NULL,
  `direccion` VARCHAR(70) NULL,
  PRIMARY KEY (`documento`),
  UNIQUE INDEX `documento_UNIQUE` (`documento` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localTravel`.`Vendedor` (
  `NIT` BIGINT NOT NULL,
  `nombre_empresa` VARCHAR(85) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `municipio` VARCHAR(55) NOT NULL,
  `nombre_vendedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIT`),
  UNIQUE INDEX `NIT_UNIQUE` (`NIT` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Excursion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localTravel`.`Excursion` (
  `id` BIGINT NOT NULL,
  `precio` BIGINT NOT NULL,
  `nombre` VARCHAR(65) NOT NULL,
  `destino` VARCHAR(45) NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `Vendedor_NIT` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `Vendedor_NIT`),
  INDEX `fk_Excursion_Vendedor1_idx` (`Vendedor_NIT` ASC) VISIBLE,
  CONSTRAINT `fk_Excursion_Vendedor1`
    FOREIGN KEY (`Vendedor_NIT`)
    REFERENCES `localTravel`.`Vendedor` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localTravel`.`Reserva` (
  `id` BIGINT NOT NULL,
  `cant_personas` INT NOT NULL,
  `total` BIGINT NOT NULL,
  `Comprador_documento` BIGINT NOT NULL,
  `Excursion_id` BIGINT NOT NULL,
  `Excursion_Vendedor_NIT` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `Comprador_documento`, `Excursion_id`, `Excursion_Vendedor_NIT`),
  INDEX `fk_Reserva_Comprador_idx` (`Comprador_documento` ASC) VISIBLE,
  INDEX `fk_Reserva_Excursion1_idx` (`Excursion_id` ASC, `Excursion_Vendedor_NIT` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Comprador`
    FOREIGN KEY (`Comprador_documento`)
    REFERENCES `localTravel`.`Comprador` (`documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Excursion1`
    FOREIGN KEY (`Excursion_id` , `Excursion_Vendedor_NIT`)
    REFERENCES `localTravel`.`Excursion` (`id` , `Vendedor_NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localTravel`.`Rol` (
  `id` INT NOT NULL,
  `nombre_rol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Permisos_Comprador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localTravel`.`Permisos_Comprador` (
  `Comprador_documento` BIGINT NOT NULL,
  `Rol_id` INT NOT NULL,
  PRIMARY KEY (`Comprador_documento`, `Rol_id`),
  INDEX `fk_Comprador_has_Rol_Rol1_idx` (`Rol_id` ASC) VISIBLE,
  INDEX `fk_Comprador_has_Rol_Comprador1_idx` (`Comprador_documento` ASC) VISIBLE,
  CONSTRAINT `fk_Comprador_has_Rol_Comprador1`
    FOREIGN KEY (`Comprador_documento`)
    REFERENCES `mydb`.`Comprador` (`documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comprador_has_Rol_Rol1`
    FOREIGN KEY (`Rol_id`)
    REFERENCES `localTravel`.`Rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Permisos_Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localTravel`.`Permisos_Vendedor` (
  `Rol_id` INT NOT NULL,
  `Vendedor_NIT` BIGINT NOT NULL,
  PRIMARY KEY (`Rol_id`, `Vendedor_NIT`),
  INDEX `fk_Rol_has_Vendedor_Vendedor1_idx` (`Vendedor_NIT` ASC) VISIBLE,
  INDEX `fk_Rol_has_Vendedor_Rol1_idx` (`Rol_id` ASC) VISIBLE,
  CONSTRAINT `fk_Rol_has_Vendedor_Rol1`
    FOREIGN KEY (`Rol_id`)
    REFERENCES `mydb`.`Rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rol_has_Vendedor_Vendedor1`
    FOREIGN KEY (`Vendedor_NIT`)
    REFERENCES `localTravel`.`Vendedor` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
