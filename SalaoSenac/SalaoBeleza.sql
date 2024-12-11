-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SalaoBeleza
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SalaoBeleza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SalaoBeleza` DEFAULT CHARACTER SET utf8 ;
USE `SalaoBeleza` ;

-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Feedbacks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Feedbacks` (
  `id_Feedback` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(100) NOT NULL,
  `data_Feedback` DATE NOT NULL,
  `nota` CHAR(2) NOT NULL,
  PRIMARY KEY (`id_Feedback`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Clientes` (
  `id_Cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `data_Nasc` DATE NOT NULL,
  `Feedbacks_id` INT NOT NULL,
  PRIMARY KEY (`id_Cliente`),
  INDEX `fk_Clientes_Feedbacks1_idx` (`Feedbacks_id` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_Feedbacks1`
    FOREIGN KEY (`Feedbacks_id`)
    REFERENCES `SalaoBeleza`.`Feedbacks` (`id_Feedback`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`TelefoneCli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`TelefoneCli` (
  `id_Telefone` INT NOT NULL,
  `numero` INT NOT NULL,
  `Clientes_id` INT NOT NULL,
  INDEX `fk_TelefoneCli_Clientes_idx` (`Clientes_id` ASC) VISIBLE,
  PRIMARY KEY (`id_Telefone`),
  CONSTRAINT `fk_TelefoneCli_Clientes`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `SalaoBeleza`.`Clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`EnderecoCli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`EnderecoCli` (
  `Clientes_id` INT NOT NULL,
  `UF` CHAR(2) NOT NULL,
  `cidade` VARCHAR(60) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `rua` VARCHAR(70) NOT NULL,
  `numero` INT(11) NOT NULL,
  `comp` VARCHAR(45) NULL,
  `cep` INT(9) NOT NULL,
  INDEX `fk_EnderecoCli_Clientes1_idx` (`Clientes_id` ASC) VISIBLE,
  PRIMARY KEY (`Clientes_id`),
  CONSTRAINT `fk_EnderecoCli_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `SalaoBeleza`.`Clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Pagamentos` (
  `id_Pagamento` INT NOT NULL AUTO_INCREMENT,
  `metedo_Pagamento` VARCHAR(45) NOT NULL,
  `data_Pagamento` DATE NOT NULL,
  `status_Pagamento` VARCHAR(45) NOT NULL,
  `desconto` DECIMAL(4,2) NOT NULL,
  `valor` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`id_Pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Agendamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Agendamentos` (
  `id_Agendamentos` INT NOT NULL AUTO_INCREMENT,
  `horario` TIME NOT NULL,
  `status_Agendamento` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  `Clientes_id` INT NOT NULL,
  `Pagamentos_id` INT NOT NULL,
  PRIMARY KEY (`id_Agendamentos`),
  INDEX `fk_Agendamentos_Clientes1_idx` (`Clientes_id` ASC) VISIBLE,
  INDEX `fk_Agendamentos_Pagamentos1_idx` (`Pagamentos_id` ASC) VISIBLE,
  CONSTRAINT `fk_Agendamentos_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `SalaoBeleza`.`Clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agendamentos_Pagamentos1`
    FOREIGN KEY (`Pagamentos_id`)
    REFERENCES `SalaoBeleza`.`Pagamentos` (`id_Pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Servicos` (
  `id_Servico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(7,2) NOT NULL,
  `duracao` INT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Servico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Agendamentos_Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Agendamentos_Servicos` (
  `Servicos_id` INT NOT NULL,
  `Agendamentos_id` INT NOT NULL,
  `quantidade` INT(11) NOT NULL,
  INDEX `fk_Agendamentos_Servicos_Servicos1_idx` (`Servicos_id` ASC) VISIBLE,
  INDEX `fk_Agendamentos_Servicos_Agendamentos1_idx` (`Agendamentos_id` ASC) VISIBLE,
  PRIMARY KEY (`Servicos_id`, `Agendamentos_id`),
  CONSTRAINT `fk_Agendamentos_Servicos_Servicos1`
    FOREIGN KEY (`Servicos_id`)
    REFERENCES `SalaoBeleza`.`Servicos` (`id_Servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agendamentos_Servicos_Agendamentos1`
    FOREIGN KEY (`Agendamentos_id`)
    REFERENCES `SalaoBeleza`.`Agendamentos` (`id_Agendamentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Profissionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Profissionais` (
  `id_Profissional` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `salario` DECIMAL(7,2) NOT NULL,
  `data_Nasc` DATE NOT NULL,
  PRIMARY KEY (`id_Profissional`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Telefone_Pro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Telefone_Pro` (
  `id_Telefone_Pro` INT NOT NULL AUTO_INCREMENT,
  `numero` INT(11) NOT NULL,
  `Profissionais_id` INT NOT NULL,
  PRIMARY KEY (`id_Telefone_Pro`),
  INDEX `fk_Telefone_Pro_Profissionais1_idx` (`Profissionais_id` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Pro_Profissionais1`
    FOREIGN KEY (`Profissionais_id`)
    REFERENCES `SalaoBeleza`.`Profissionais` (`id_Profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Profissionais_Feedbacks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Profissionais_Feedbacks` (
  `Profissionais_id` INT NOT NULL,
  `Feedbacks_id` INT NOT NULL,
  PRIMARY KEY (`Profissionais_id`, `Feedbacks_id`),
  INDEX `fk_Profissionais_has_Feedbacks_Feedbacks1_idx` (`Feedbacks_id` ASC) VISIBLE,
  INDEX `fk_Profissionais_has_Feedbacks_Profissionais1_idx` (`Profissionais_id` ASC) VISIBLE,
  CONSTRAINT `fk_Profissionais_has_Feedbacks_Profissionais1`
    FOREIGN KEY (`Profissionais_id`)
    REFERENCES `SalaoBeleza`.`Profissionais` (`id_Profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profissionais_has_Feedbacks_Feedbacks1`
    FOREIGN KEY (`Feedbacks_id`)
    REFERENCES `SalaoBeleza`.`Feedbacks` (`id_Feedback`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Endereco_Pro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Endereco_Pro` (
  `Profissionais_id` INT NOT NULL,
  `UF` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT(11) NOT NULL,
  `comp` VARCHAR(45) NULL,
  `cep` INT(9) NOT NULL,
  `Endereco_Procol` VARCHAR(45) NULL,
  INDEX `fk_Endereco_Pro_Profissionais1_idx` (`Profissionais_id` ASC) VISIBLE,
  PRIMARY KEY (`Profissionais_id`),
  CONSTRAINT `fk_Endereco_Pro_Profissionais1`
    FOREIGN KEY (`Profissionais_id`)
    REFERENCES `SalaoBeleza`.`Profissionais` (`id_Profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Especialidades` (
  `id_Especialidade` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco_Base` DECIMAL(7,2) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Especialidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoBeleza`.`Profissionais_Especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoBeleza`.`Profissionais_Especialidades` (
  `Profissionais_id` INT NOT NULL,
  `Especialidades_id` INT NOT NULL,
  `certificado` VARCHAR(45) NOT NULL,
  `nivel_Experiencia` INT NOT NULL,
  PRIMARY KEY (`Profissionais_id`, `Especialidades_id`),
  INDEX `fk_Profissionais_has_Especialidades_Especialidades1_idx` (`Especialidades_id` ASC) VISIBLE,
  INDEX `fk_Profissionais_has_Especialidades_Profissionais1_idx` (`Profissionais_id` ASC) VISIBLE,
  CONSTRAINT `fk_Profissionais_has_Especialidades_Profissionais1`
    FOREIGN KEY (`Profissionais_id`)
    REFERENCES `SalaoBeleza`.`Profissionais` (`id_Profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profissionais_has_Especialidades_Especialidades1`
    FOREIGN KEY (`Especialidades_id`)
    REFERENCES `SalaoBeleza`.`Especialidades` (`id_Especialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
