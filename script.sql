-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sistema_trabalho_individual
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistema_trabalho_individual
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_trabalho_individual` DEFAULT CHARACTER SET utf8 ;
USE `sistema_trabalho_individual` ;

-- -----------------------------------------------------
-- Table `sistema_trabalho_individual`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_trabalho_individual`.`Cursos` (
  `idCursos` INT NOT NULL AUTO_INCREMENT,
  `Nome_Curso` VARCHAR(45) NULL,
  PRIMARY KEY (`idCursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_trabalho_individual`.`Turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_trabalho_individual`.`Turmas` (
  `idTurmas` INT NOT NULL AUTO_INCREMENT,
  `Número` VARCHAR(45) NULL,
  PRIMARY KEY (`idTurmas`),
  CONSTRAINT `fk_Turmas_Cursos`
    FOREIGN KEY (`idTurmas`)
    REFERENCES `sistema_trabalho_individual`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_trabalho_individual`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_trabalho_individual`.`Alunos` (
  `idAlunos` INT NOT NULL AUTO_INCREMENT,
  `Nome_Aluno` VARCHAR(45) NULL,
  PRIMARY KEY (`idAlunos`),
  CONSTRAINT `fk_Alunos_Turmas1`
    FOREIGN KEY (`idAlunos`)
    REFERENCES `sistema_trabalho_individual`.`Turmas` (`idTurmas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_trabalho_individual`.`Facilitadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_trabalho_individual`.`Facilitadores` (
  `idFacilitadores` INT NOT NULL AUTO_INCREMENT,
  `Facilitadores_Nome` VARCHAR(45) NULL,
  `Turmas_idTurmas` INT NOT NULL,
  PRIMARY KEY (`idFacilitadores`, `Turmas_idTurmas`),
  INDEX `fk_Facilitadores_Turmas1_idx` (`Turmas_idTurmas` ASC) VISIBLE,
  CONSTRAINT `fk_Facilitadores_Turmas1`
    FOREIGN KEY (`Turmas_idTurmas`)
    REFERENCES `sistema_trabalho_individual`.`Turmas` (`idTurmas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
