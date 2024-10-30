-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EscolaMusica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EscolaMusica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EscolaMusica` DEFAULT CHARACTER SET utf8 ;
USE `EscolaMusica` ;

-- -----------------------------------------------------
-- Table `EscolaMusica`.`Compositor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Compositor` (
  `id_Compositor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(15) NOT NULL,
  `data_Nasc` DATE NOT NULL,
  `data_Falec` DATE NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `periodo` VARCHAR(45) NOT NULL,
  `principal_Estrumento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Compositor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`Sinfonia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Sinfonia` (
  `id_Sinfonia` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `movimentos` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `duracao` INT NOT NULL,
  `data_Criacao` DATE NOT NULL,
  `Compositor_id` INT NULL,
  PRIMARY KEY (`id_Sinfonia`),
  INDEX `fk_Sinfonia_Compositor1_idx` (`Compositor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Sinfonia_Compositor1`
    FOREIGN KEY (`Compositor_id`)
    REFERENCES `EscolaMusica`.`Compositor` (`id_Compositor`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`Instrumento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Instrumento` (
  `id_Instrumento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `pais_Origem` VARCHAR(45) NOT NULL,
  `periodo_Historico` VARCHAR(45) NOT NULL,
  `familia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Instrumento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`Musico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Musico` (
  `id_Musico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(15) NOT NULL,
  `identidade` VARCHAR(15) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `data_Nasc` DATE NOT NULL,
  `formacao` VARCHAR(45) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `anos_Experiencia` FLOAT NOT NULL,
  PRIMARY KEY (`id_Musico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`Historico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Historico` (
  `data_Entrada` DATE NOT NULL,
  `data_Saida` DATE NULL,
  `motivo_Saida` VARCHAR(45) NOT NULL,
  `posicao` VARCHAR(45) NOT NULL,
  `Musico_id` INT NOT NULL,
  INDEX `fk_Historico_Musico1_idx` (`Musico_id` ASC) VISIBLE,
  PRIMARY KEY (`Musico_id`),
  CONSTRAINT `fk_Historico_Musico1`
    FOREIGN KEY (`Musico_id`)
    REFERENCES `EscolaMusica`.`Musico` (`id_Musico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`funcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`funcao` (
  `data_Inicio` DATE NOT NULL,
  `data_Fim` DATE NULL,
  `comentarios` VARCHAR(45) NOT NULL,
  `Instrumento_id` INT NOT NULL,
  `Musico_id` INT NOT NULL,
  `Sinfonia_id` INT NOT NULL,
  INDEX `fk_funcao_Instrumento_idx` (`Instrumento_id` ASC) VISIBLE,
  INDEX `fk_funcao_Musico1_idx` (`Musico_id` ASC) VISIBLE,
  INDEX `fk_funcao_Sinfonia1_idx` (`Sinfonia_id` ASC) VISIBLE,
  PRIMARY KEY (`Sinfonia_id`, `Musico_id`, `Instrumento_id`),
  CONSTRAINT `fk_funcao_Instrumento`
    FOREIGN KEY (`Instrumento_id`)
    REFERENCES `EscolaMusica`.`Instrumento` (`id_Instrumento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_funcao_Musico1`
    FOREIGN KEY (`Musico_id`)
    REFERENCES `EscolaMusica`.`Musico` (`id_Musico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_funcao_Sinfonia1`
    FOREIGN KEY (`Sinfonia_id`)
    REFERENCES `EscolaMusica`.`Sinfonia` (`id_Sinfonia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`Orquestra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Orquestra` (
  `id_Orquestra` INT NOT NULL AUTO_INCREMENT,
  `data_Criacao` DATE NOT NULL,
  `regiao` VARCHAR(45) NOT NULL,
  `website` VARCHAR(150) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Orquestra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Telefone` (
  `id_Telefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NOT NULL,
  `Orquestra_id` INT NOT NULL,
  `Musico_id` INT NOT NULL,
  PRIMARY KEY (`id_Telefone`),
  INDEX `fk_Telefone_Orquestra1_idx` (`Orquestra_id` ASC) VISIBLE,
  INDEX `fk_Telefone_Musico1_idx` (`Musico_id` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Orquestra1`
    FOREIGN KEY (`Orquestra_id`)
    REFERENCES `EscolaMusica`.`Orquestra` (`id_Orquestra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Telefone_Musico1`
    FOREIGN KEY (`Musico_id`)
    REFERENCES `EscolaMusica`.`Musico` (`id_Musico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`Apresentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Apresentacao` (
  `id_Apresentacao` INT NOT NULL AUTO_INCREMENT,
  `data_Apresentacao` DATE NOT NULL,
  `publico_Estimado` INT NOT NULL,
  `comentarios` VARCHAR(45) NOT NULL,
  `tipo_Evento` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `Orquestra_id` INT NOT NULL,
  PRIMARY KEY (`id_Apresentacao`),
  INDEX `fk_Apresentacao_Orquestra1_idx` (`Orquestra_id` ASC) VISIBLE,
  CONSTRAINT `fk_Apresentacao_Orquestra1`
    FOREIGN KEY (`Orquestra_id`)
    REFERENCES `EscolaMusica`.`Orquestra` (`id_Orquestra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`Apresentacao_Sinfonia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Apresentacao_Sinfonia` (
  `ordem_Execucao` INT NOT NULL,
  `duracao_Exercucao` INT NOT NULL,
  `Sinfonia_id` INT NOT NULL,
  `Apresentacao_id` INT NOT NULL,
  INDEX `fk_Apresentacao_Sinfonia_Sinfonia1_idx` (`Sinfonia_id` ASC) VISIBLE,
  INDEX `fk_Apresentacao_Sinfonia_Apresentacao1_idx` (`Apresentacao_id` ASC) VISIBLE,
  PRIMARY KEY (`Apresentacao_id`, `Sinfonia_id`),
  CONSTRAINT `fk_Apresentacao_Sinfonia_Sinfonia1`
    FOREIGN KEY (`Sinfonia_id`)
    REFERENCES `EscolaMusica`.`Sinfonia` (`id_Sinfonia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Apresentacao_Sinfonia_Apresentacao1`
    FOREIGN KEY (`Apresentacao_id`)
    REFERENCES `EscolaMusica`.`Apresentacao` (`id_Apresentacao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EscolaMusica`.`Musico_Orquestra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EscolaMusica`.`Musico_Orquestra` (
  `id_Musico_Orquestra` INT NOT NULL AUTO_INCREMENT,
  `data_entrada` DATE NOT NULL,
  `data_Saida` DATE NOT NULL,
  `posicao` VARCHAR(45) NOT NULL,
  `comentarios` TEXT(200) NOT NULL,
  `Orquestra_id` INT NOT NULL,
  `Musico_id` INT NOT NULL,
  PRIMARY KEY (`id_Musico_Orquestra`),
  INDEX `fk_Musico_Orquestra_Orquestra1_idx` (`Orquestra_id` ASC) VISIBLE,
  INDEX `fk_Musico_Orquestra_Musico1_idx` (`Musico_id` ASC) VISIBLE,
  CONSTRAINT `fk_Musico_Orquestra_Orquestra1`
    FOREIGN KEY (`Orquestra_id`)
    REFERENCES `EscolaMusica`.`Orquestra` (`id_Orquestra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Musico_Orquestra_Musico1`
    FOREIGN KEY (`Musico_id`)
    REFERENCES `EscolaMusica`.`Musico` (`id_Musico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
