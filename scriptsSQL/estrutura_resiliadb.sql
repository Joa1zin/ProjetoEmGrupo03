CREATE DATABASE ResiliaDB;

USE ResiliaDB;

CREATE TABLE `enderecos` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `cep` bigint NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` int NOT NULL,
  `complemento` varchar(100),
  `estado` varchar(2) NOT NULL,
  `pais` varchar(50) NOT NULL
);

CREATE TABLE `estudante` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `nome` varchar(255),
  `nascimento` date,
  `cpf` varchar(11),
  `email` varchar(100),
  `telefone` varchar(15),
  `pcd` boolean NOT NULL,
  `status` varchar(25),
  `ID_turmas_fk` int NOT NULL,
  `ID_endereco_fk` int NOT NULL,
  `ID_financas_fk` int NOT NULL
);

CREATE TABLE `financas_aluno` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `valor_total` int,
  `forma_pagamento` varchar(25),
  `status_pagamento` varchar(50),
  `ID_curso_fk` int NOT NULL
);

CREATE TABLE `pagamento_facilitadores` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `valor_pagamento_modulo` int,
  `qntd_modulos` int,
  `data_pagamento` date,
  `ID_curso_fk` int NOT NULL,
  `ID_pessoas_facilitadoras_fk` int NOT NULL
);

CREATE TABLE `estudante_curso` (
  `id` int PRIMARY KEY NOT NULL,
  `data_matricula` date,
  `evasao` int,
  `ID_estudante_fk` int NOT NULL,
  `ID_curso_fk` int NOT NULL,
  `ID_turmas_fk` int NOT NULL
);

CREATE TABLE `pessoas_facilitadoras` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `nome` varchar(255),
  `nascimento` date,
  `cpf` varchar(11),
  `email` varchar(100),
  `telefone` varchar(15),
  `formacao` varchar(45),
  `frente` varchar(25),
  `ID_endereco_fk` int NOT NULL
);

CREATE TABLE `facilitadores_turma` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `ID_pessoas_facilitadoras_fk` int NOT NULL,
  `ID_turmas_fk` int NOT NULL
);

CREATE TABLE `turmas` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `numero` int,
  `periodo_aulas` varchar(25),
  `data_inicio` date,
  `data_termino` date,
  `ID_curso_fk` int NOT NULL
);

CREATE TABLE `modulos` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `tema` varchar(50),
  `qntd_horas` int,
  `descricao` varchar(255),
  `ID_pessoas_facilitadoras_fk` int NOT NULL
);

CREATE TABLE `cursos` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `nome` varchar(100),
  `carga_horaria` int,
  `preco` int,
  `grade_curricular` varchar(100),
  `ID_modulos_fk` int NOT NULL
);

ALTER TABLE `turmas` ADD FOREIGN KEY (`id`) REFERENCES `estudante` (`ID_turmas_fk`);

ALTER TABLE `estudante` ADD FOREIGN KEY (`ID_endereco_fk`) REFERENCES `enderecos` (`id`);

ALTER TABLE `estudante` ADD FOREIGN KEY (`ID_financas_fk`) REFERENCES `financas_aluno` (`id`);

ALTER TABLE `financas_aluno` ADD FOREIGN KEY (`ID_curso_fk`) REFERENCES `cursos` (`id`);

ALTER TABLE `pagamento_facilitadores` ADD FOREIGN KEY (`ID_curso_fk`) REFERENCES `cursos` (`id`);

ALTER TABLE `pagamento_facilitadores` ADD FOREIGN KEY (`ID_pessoas_facilitadoras_fk`) REFERENCES `pessoas_facilitadoras` (`id`);

ALTER TABLE `estudante_curso` ADD FOREIGN KEY (`ID_estudante_fk`) REFERENCES `estudante` (`id`);

ALTER TABLE `estudante_curso` ADD FOREIGN KEY (`ID_curso_fk`) REFERENCES `cursos` (`id`);

ALTER TABLE `estudante_curso` ADD FOREIGN KEY (`ID_turmas_fk`) REFERENCES `turmas` (`id`);

ALTER TABLE `pessoas_facilitadoras` ADD FOREIGN KEY (`ID_endereco_fk`) REFERENCES `enderecos` (`id`);

ALTER TABLE `facilitadores_turma` ADD FOREIGN KEY (`ID_pessoas_facilitadoras_fk`) REFERENCES `pessoas_facilitadoras` (`id`);

ALTER TABLE `facilitadores_turma` ADD FOREIGN KEY (`ID_turmas_fk`) REFERENCES `turmas` (`id`);

ALTER TABLE `turmas` ADD FOREIGN KEY (`ID_curso_fk`) REFERENCES `cursos` (`id`);

ALTER TABLE `modulos` ADD FOREIGN KEY (`ID_pessoas_facilitadoras_fk`) REFERENCES `pessoas_facilitadoras` (`id`);

ALTER TABLE `cursos` ADD FOREIGN KEY (`ID_modulos_fk`) REFERENCES `modulos` (`id`);
