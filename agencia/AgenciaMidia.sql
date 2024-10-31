-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AgenciaMidia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AgenciaMidia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AgenciaMidia` DEFAULT CHARACTER SET utf8 ;
USE `AgenciaMidia` ;

-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Funcionario` (
  `id_Funcionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `ch` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `habilidade` VARCHAR(100) NOT NULL,
  `dataAdmissao` DATETIME NOT NULL,
  `salario` DECIMAL(7,2) NOT NULL,
  `cpf` INT NOT NULL,
  `dataNasc` DATE NOT NULL,
  PRIMARY KEY (`id_Funcionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`EnderecoFunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`EnderecoFunc` (
  `Funcionarios_id` INT NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `cidade` VARCHAR(60) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `rua` VARCHAR(70) NOT NULL,
  `numero` INT(11) NOT NULL,
  `comp` VARCHAR(45) NULL,
  `cep` VARCHAR(9) NOT NULL,
  INDEX `fk_EnderecoFunc_Funcionarios_idx` (`Funcionarios_id` ASC) VISIBLE,
  PRIMARY KEY (`Funcionarios_id`),
  CONSTRAINT `fk_EnderecoFunc_Funcionarios`
    FOREIGN KEY (`Funcionarios_id`)
    REFERENCES `AgenciaMidia`.`Funcionario` (`id_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Dependente` (
  `idDependente` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `CPF` VARCHAR(13) NOT NULL,
  `parentesco` VARCHAR(15) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `Funcionarios_id` INT NOT NULL,
  PRIMARY KEY (`idDependente`),
  INDEX `fk_Dependente_Funcionarios1_idx` (`Funcionarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Funcionarios1`
    FOREIGN KEY (`Funcionarios_id`)
    REFERENCES `AgenciaMidia`.`Funcionario` (`id_Funcionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Ferias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Ferias` (
  `idFerias` INT NOT NULL,
  `qtdDias` INT(11) NOT NULL,
  `anoRef` YEAR(4) NOT NULL,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NOT NULL,
  `Funcionarios_id` INT NOT NULL,
  PRIMARY KEY (`idFerias`, `Funcionarios_id`),
  INDEX `fk_Ferias_Funcionarios1_idx` (`Funcionarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ferias_Funcionarios1`
    FOREIGN KEY (`Funcionarios_id`)
    REFERENCES `AgenciaMidia`.`Funcionario` (`id_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Projeto` (
  `idProjeto` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `dataInicio` DATE NOT NULL,
  `DataFim` DATE NOT NULL,
  `Funcionarios_id` INT NOT NULL,
  PRIMARY KEY (`idProjeto`),
  INDEX `fk_Projeto_Funcionarios1_idx` (`Funcionarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Projeto_Funcionarios1`
    FOREIGN KEY (`Funcionarios_id`)
    REFERENCES `AgenciaMidia`.`Funcionario` (`id_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Cargo` (
  `idCargo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `faixaSalarial` DECIMAL(7,2) NOT NULL,
  `Funcionarios_id` INT NOT NULL,
  PRIMARY KEY (`idCargo`),
  INDEX `fk_Cargo_Funcionarios1_idx` (`Funcionarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cargo_Funcionarios1`
    FOREIGN KEY (`Funcionarios_id`)
    REFERENCES `AgenciaMidia`.`Funcionario` (`id_Funcionario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `sexo` CHAR(2) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `CPF` INT NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Campanha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Campanha` (
  `idCampanha` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `objetivo` VARCHAR(100) NOT NULL,
  `orcamento` DECIMAL(9,2) NOT NULL,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NOT NULL,
  `Funcionarios_id` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idCampanha`),
  INDEX `fk_Campanha_Funcionarios1_idx` (`Funcionarios_id` ASC) VISIBLE,
  INDEX `fk_Campanha_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Campanha_Funcionarios1`
    FOREIGN KEY (`Funcionarios_id`)
    REFERENCES `AgenciaMidia`.`Funcionario` (`id_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Campanha_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `AgenciaMidia`.`Cliente` (`idCliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Conteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Conteudo` (
  `idConteudo` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `dataPubli` DATETIME NOT NULL,
  `links` VARCHAR(255) NOT NULL,
  `texto` VARCHAR(255) NOT NULL,
  `videoURL` VARCHAR(255) NOT NULL,
  `imagemURL` VARCHAR(255) NOT NULL,
  `Campanha_idCampanha` INT NOT NULL,
  PRIMARY KEY (`idConteudo`),
  INDEX `fk_Conteudo_Campanha1_idx` (`Campanha_idCampanha` ASC) VISIBLE,
  CONSTRAINT `fk_Conteudo_Campanha1`
    FOREIGN KEY (`Campanha_idCampanha`)
    REFERENCES `AgenciaMidia`.`Campanha` (`idCampanha`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`AgendamentoPost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`AgendamentoPost` (
  `idAgendamento` INT NOT NULL,
  `statusPost` VARCHAR(45) NOT NULL,
  `plataforma` VARCHAR(45) NOT NULL,
  `dataPost` DATE NOT NULL,
  `horarioPost` DATETIME NOT NULL,
  `Conteudo_id` INT NOT NULL,
  PRIMARY KEY (`idAgendamento`),
  INDEX `fk_AgendamentoPost_Conteudo1_idx` (`Conteudo_id` ASC) VISIBLE,
  CONSTRAINT `fk_AgendamentoPost_Conteudo1`
    FOREIGN KEY (`Conteudo_id`)
    REFERENCES `AgenciaMidia`.`Conteudo` (`idConteudo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`MetricaPost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`MetricaPost` (
  `idMetricaPost` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `valor` INT(11) NOT NULL,
  `dataRegistro` DATETIME NOT NULL,
  `Conteudo_id` INT NOT NULL,
  PRIMARY KEY (`idMetricaPost`),
  INDEX `fk_MetricaPost_Conteudo1_idx` (`Conteudo_id` ASC) VISIBLE,
  CONSTRAINT `fk_MetricaPost_Conteudo1`
    FOREIGN KEY (`Conteudo_id`)
    REFERENCES `AgenciaMidia`.`Conteudo` (`idConteudo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`MetricasCampanha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`MetricasCampanha` (
  `idMetrica` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `valor` INT(11) NOT NULL,
  `dataRegistro` DATETIME NOT NULL,
  `Campanha_id` INT NOT NULL,
  PRIMARY KEY (`idMetrica`),
  INDEX `fk_MetricasCampanha_Campanha1_idx` (`Campanha_id` ASC) VISIBLE,
  CONSTRAINT `fk_MetricasCampanha_Campanha1`
    FOREIGN KEY (`Campanha_id`)
    REFERENCES `AgenciaMidia`.`Campanha` (`idCampanha`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Campanha_idCampanha` INT NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  INDEX `fk_Fornecedor_Campanha1_idx` (`Campanha_idCampanha` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_Campanha1`
    FOREIGN KEY (`Campanha_idCampanha`)
    REFERENCES `AgenciaMidia`.`Campanha` (`idCampanha`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Telefone` (
  `idTelefone` INT NOT NULL,
  `numero` VARCHAR(15) NOT NULL,
  `Funcionarios_idFuncionarios` INT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`idTelefone`),
  INDEX `fk_Telefone_Funcionarios1_idx` (`Funcionarios_idFuncionarios` ASC) VISIBLE,
  INDEX `fk_Telefone_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Funcionarios1`
    FOREIGN KEY (`Funcionarios_idFuncionarios`)
    REFERENCES `AgenciaMidia`.`Funcionario` (`id_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `AgenciaMidia`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Transacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Transacao` (
  `idTransacao` INT NOT NULL,
  `data` DATETIME NOT NULL,
  `valor` DECIMAL(9,2) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `Fornecedor_id` INT NOT NULL,
  PRIMARY KEY (`idTransacao`),
  INDEX `fk_Transacao_Fornecedor1_idx` (`Fornecedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Transacao_Fornecedor1`
    FOREIGN KEY (`Fornecedor_id`)
    REFERENCES `AgenciaMidia`.`Fornecedor` (`idFornecedor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Interacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Interacao` (
  `idInteracao` INT NOT NULL,
  `dataInteracao` DATETIME NOT NULL,
  `tipoInteracao` VARCHAR(45) NOT NULL,
  `descricao` TEXT(200) NOT NULL,
  `Cliente_id` INT NOT NULL,
  PRIMARY KEY (`idInteracao`),
  INDEX `fk_Interacao_Cliente1_idx` (`Cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_Interacao_Cliente1`
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `AgenciaMidia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`EnderecoCli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`EnderecoCli` (
  `Cliente_idCliente` INT NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `cidade` VARCHAR(60) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `rua` VARCHAR(70) NOT NULL,
  `numero` INT(11) NOT NULL,
  `comp` VARCHAR(45) NULL,
  `cep` VARCHAR(9) NOT NULL,
  INDEX `fk_EnderecoCli_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  PRIMARY KEY (`Cliente_idCliente`),
  CONSTRAINT `fk_EnderecoCli_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `AgenciaMidia`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`TelefoneCli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`TelefoneCli` (
  `idTelefone` INT NOT NULL,
  `numero` VARCHAR(15) NOT NULL,
  `Cliente_id` INT NOT NULL,
  PRIMARY KEY (`idTelefone`),
  INDEX `fk_TelefoneCli_Cliente1_idx` (`Cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_TelefoneCli_Cliente1`
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `AgenciaMidia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`FormaPag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`FormaPag` (
  `idFormaPag` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `parcela` INT NOT NULL,
  `valorTotal` DECIMAL(10,2) NOT NULL,
  `Cliente_id` INT NOT NULL,
  PRIMARY KEY (`idFormaPag`),
  INDEX `fk_FormaPag_Cliente1_idx` (`Cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_FormaPag_Cliente1`
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `AgenciaMidia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgenciaMidia`.`Contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`Contrato` (
  `idContrato` INT NOT NULL,
  `termos` LONGTEXT NOT NULL,
  `custoServico` DECIMAL(10,2) NOT NULL,
  `dataFim` DATE NOT NULL,
  `dataInicio` DATE NOT NULL,
  `Cliente_id` INT NOT NULL,
  PRIMARY KEY (`idContrato`),
  INDEX `fk_Contrato_Cliente1_idx` (`Cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_Contrato_Cliente1`
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `AgenciaMidia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `AgenciaMidia` ;

-- -----------------------------------------------------
-- Placeholder table for view `AgenciaMidia`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AgenciaMidia`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `AgenciaMidia`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgenciaMidia`.`view1`;
USE `AgenciaMidia`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
