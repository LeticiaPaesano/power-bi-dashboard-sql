-- Star Schema: Análise de Professores (Universidade)
CREATE SCHEMA IF NOT EXISTS `universidade_dw` DEFAULT CHARACTER SET utf8mb4;
USE `universidade_dw`;

-- Dimensão Professor (SCD Tipo 2)
CREATE TABLE IF NOT EXISTS `d_professor` (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `professor_id` INT NOT NULL,
  `nome` VARCHAR(90) NOT NULL,
  `titulacao` VARCHAR(45) NULL,
  `regime_trabalho` VARCHAR(45) NULL,
  `professor_atual` ENUM('Y', 'N') NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  PRIMARY KEY (`id_professor`)
) ENGINE = InnoDB;

-- Dimensão Departamento
CREATE TABLE IF NOT EXISTS `d_departamento` (
  `id_departamento` INT NOT NULL AUTO_INCREMENT,
  `departamento_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `campus` VARCHAR(45) NULL,
  `coordenador_id` INT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE = InnoDB;

-- Dimensão Curso
CREATE TABLE IF NOT EXISTS `d_curso` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `curso_id` INT NOT NULL,
  `nome_curso` VARCHAR(90) NOT NULL,
  `nivel` VARCHAR(45) NULL,
  `modalidade` VARCHAR(45) NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE = InnoDB;

-- Dimensão Disciplina
CREATE TABLE IF NOT EXISTS `d_disciplina` (
  `id_disciplina` INT NOT NULL AUTO_INCREMENT,
  `disciplina_id` INT NOT NULL,
  `nome_disciplina` VARCHAR(90) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `carga_horaria_padrao` INT NULL,
  PRIMARY KEY (`id_disciplina`)
) ENGINE = InnoDB;

-- Dimensão Data (chave no formato AAAAMMDD)
CREATE TABLE IF NOT EXISTS `d_date` (
  `id_date` INT NOT NULL,
  `data` DATE NOT NULL,
  `dia` TINYINT NOT NULL,
  `mes` TINYINT NOT NULL,
  `nome_mes` VARCHAR(15) NOT NULL,
  `trimestre` TINYINT NOT NULL,
  `semestre` TINYINT NOT NULL,
  `ano` SMALLINT NOT NULL,
  `ano_semestre` CHAR(6) NOT NULL,
  PRIMARY KEY (`id_date`),
  UNIQUE INDEX `data_UNIQUE` (`data` ASC)
) ENGINE = InnoDB;

-- Tabela Fato
CREATE TABLE IF NOT EXISTS `f_oferta_professor` (
  `sk_oferta` INT NOT NULL AUTO_INCREMENT,
  `carga_horaria` INT NOT NULL,
  `qtd_alunos` INT NOT NULL DEFAULT 0,
  `qtd_prerequisitos` INT NOT NULL DEFAULT 0,
  `eh_coordenador` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
  `id_professor` INT NOT NULL,
  `id_departamento` INT NOT NULL,
  `id_curso` INT NOT NULL,
  `id_disciplina` INT NOT NULL,
  `id_date` INT NOT NULL,
  PRIMARY KEY (`sk_oferta`),
  CONSTRAINT `fk_f_oferta_professor_d_professor`
    FOREIGN KEY (`id_professor`) REFERENCES `d_professor` (`id_professor`),
  CONSTRAINT `fk_f_oferta_professor_d_departamento1`
    FOREIGN KEY (`id_departamento`) REFERENCES `d_departamento` (`id_departamento`),
  CONSTRAINT `fk_f_oferta_professor_d_curso1`
    FOREIGN KEY (`id_curso`) REFERENCES `d_curso` (`id_curso`),
  CONSTRAINT `fk_f_oferta_professor_d_disciplina1`
    FOREIGN KEY (`id_disciplina`) REFERENCES `d_disciplina` (`id_disciplina`),
  CONSTRAINT `fk_f_oferta_professor_d_date1`
    FOREIGN KEY (`id_date`) REFERENCES `d_date` (`id_date`)
) ENGINE = InnoDB;
