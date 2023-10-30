-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyecto_pelis
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto_pelis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_pelis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `proyecto_pelis` ;

-- -----------------------------------------------------
-- Table `proyecto_pelis`.`actores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_pelis`.`actores` (
  `actor_id` BIGINT NOT NULL,
  `full_name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_pelis`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_pelis`.`categorias` (
  `category_id` BIGINT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_pelis`.`idiomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_pelis`.`idiomas` (
  `language_id` BIGINT NOT NULL,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_pelis`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_pelis`.`peliculas` (
  `film_id` BIGINT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `language_id` BIGINT NULL DEFAULT NULL,
  `length` BIGINT NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `category_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `language_id_idx` (`language_id` ASC) VISIBLE,
  INDEX `category_id_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `proyecto_pelis`.`categorias` (`category_id`),
  CONSTRAINT `language_id`
    FOREIGN KEY (`language_id`)
    REFERENCES `proyecto_pelis`.`idiomas` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_pelis`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_pelis`.`inventario` (
  `inventory_id` BIGINT NOT NULL,
  `film_id` BIGINT NULL DEFAULT NULL,
  `store_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `film_id`
    FOREIGN KEY (`film_id`)
    REFERENCES `proyecto_pelis`.`peliculas` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_pelis`.`alquileres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_pelis`.`alquileres` (
  `rental_id` BIGINT NOT NULL,
  `rental_date` TEXT NULL DEFAULT NULL,
  `inventory_id` BIGINT NULL DEFAULT NULL,
  `customer_id` BIGINT NULL DEFAULT NULL,
  `return_date` TEXT NULL DEFAULT NULL,
  `staff_id` BIGINT NULL DEFAULT NULL,
  `rental_duration` BIGINT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `inventory_id_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `inventory_id`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `proyecto_pelis`.`inventario` (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
