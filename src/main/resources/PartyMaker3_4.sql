-- MySQL Script generated by MySQL Workbench
-- Mon 31 Oct 2016 17:45:42 EET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS partymaker2 DEFAULT CHARACTER SET utf8 ;
USE partymaker2 ;

-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`role` (
  `id_role` INT NOT NULL AUTO_INCREMENT,
  `user_role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`billing` (
  `id_billing` INT NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(45) NULL,
  PRIMARY KEY (`id_billing`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NULL DEFAULT NULL,
  `phoneNumber` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `emergencyContact` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `enable` TINYINT(1) NULL DEFAULT NULL,
  `updated_date` VARCHAR(45) NULL DEFAULT NULL,
  `created_date` VARCHAR(45) NULL DEFAULT NULL,
  `id_role` INT NOT NULL,
  `id_billing` INT NOT NULL,
  PRIMARY KEY (`id_user`, `id_role`, `id_billing`),
  INDEX `fk_user_role_idx` (`id_role` ASC),
  INDEX `fk_user_billing1_idx` (`id_billing` ASC),
  CONSTRAINT `fk_user_role`
    FOREIGN KEY (`id_role`)
    REFERENCES partymaker2.`role` (`id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_billing1`
    FOREIGN KEY (`id_billing`)
    REFERENCES partymaker2.`billing` (`id_billing`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`id_event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`id_event` (
  `id_event` INT NOT NULL AUTO_INCREMENT,
  `club_name` VARCHAR(45) NULL DEFAULT NULL,
  `date` VARCHAR(45) NULL DEFAULT NULL,
  `time` VARCHAR(45) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `club_capacity` VARCHAR(45) NULL DEFAULT NULL,
  `party_name` VARCHAR(45) NULL DEFAULT NULL,
  `zip_code` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_event`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_has_event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`user_has_event` (
  `id_user` INT NOT NULL,
  `id_event` INT NOT NULL,
  PRIMARY KEY (`id_user`,`id_event`),
  INDEX `fk_user_has_event_event1_idx` (`id_event` ASC),
  INDEX `fk_user_has_event_user1_idx` (`id_user` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`id_user` )
    REFERENCES partymaker2.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`id_event`)
    REFERENCES partymaker2.`id_event` (`id_event`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`table` (
  `id_table` INT NOT NULL AUTO_INCREMENT,
  `price` VARCHAR(45) NULL DEFAULT NULL,
  `available` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `booked` VARCHAR(45) NULL DEFAULT NULL,
  `id_event` INT NOT NULL,
  PRIMARY KEY (`id_table`, `id_event`),
  INDEX `fk_table_event1_idx` (`id_event` ASC),
  CONSTRAINT `fk_table_event1`
    FOREIGN KEY (`id_event`)
    REFERENCES partymaker2.`id_event` (`id_event`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bottle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`bottle` (
  `id_bottle` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `price` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `available` VARCHAR(45) NULL DEFAULT NULL,
  `booked` VARCHAR(45) NULL DEFAULT NULL,
  `created_date` VARCHAR(45) NULL DEFAULT NULL,
  `id_event` INT NOT NULL,

  PRIMARY KEY (`id_bottle`, `id_event`),
  INDEX `fk_bottle_event1_idx` (`id_event` ASC),
  CONSTRAINT `fk_bottle_event1`
    FOREIGN KEY (`id_event`)
    REFERENCES partymaker2.`id_event` (`id_event`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`ticket` (
  `id_ticket` INT NOT NULL AUTO_INCREMENT,
  `price` VARCHAR(45) NULL DEFAULT NULL,
  `available` VARCHAR(45) NULL DEFAULT NULL,
  `booked` VARCHAR(45) NULL DEFAULT NULL,
  `created_date` VARCHAR(45) NULL DEFAULT NULL,
  `id_event` INT NOT NULL,
  PRIMARY KEY (`id_ticket`, `id_event`),
  INDEX `fk_ticket_event1_idx` (`id_event` ASC),
  CONSTRAINT `fk_ticket_event1`
    FOREIGN KEY (`id_event`)
    REFERENCES partymaker2.`id_event` (`id_event`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`photo` (
  `id_photo` INT NOT NULL AUTO_INCREMENT,
  `photo` VARCHAR(45) NULL DEFAULT NULL,
  `id_event` INT NOT NULL,
  PRIMARY KEY (`id_photo`, `id_event`),
  INDEX `fk_photo_event1_idx` (`id_event` ASC),
  CONSTRAINT `fk_photo_event1`
    FOREIGN KEY (`id_event`)
    REFERENCES partymaker2.`id_event` (`id_event`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ranting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS partymaker2.`ranting` (
  `id_ranting` INT NOT NULL,
  `text` LONGTEXT NULL DEFAULT NULL,
  `id_event` INT NOT NULL,
  `id_user` INT NOT NULL,
  `id_role` INT NOT NULL,
  PRIMARY KEY (`id_ranting`, `id_event`, `id_user`, `id_role`),
  INDEX `fk_ranting_event1_idx` (`id_event` ASC),
  INDEX `fk_ranting_user1_idx` (`id_user` ASC, `id_role` ASC),
  CONSTRAINT `fk_ranting_event1`
    FOREIGN KEY (`id_event`)
    REFERENCES partymaker2.`id_event` (`id_event`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ranting_user1`
    FOREIGN KEY (`id_user` , `id_role`)
    REFERENCES partymaker2.`user` (`id_user` , `id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
