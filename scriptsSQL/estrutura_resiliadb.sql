CREATE DATABASE ResiliaDB;

USE ResiliaDB;

CREATE TABLE `Enderecos` (
  `id_endereco` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cep` bigint NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` int NOT NULL,
  `complemento` varchar(100),
  `estado` varchar(2) NOT NULL,
  `pais` varchar(50) NOT NULL
);

CREATE TABLE `Pessoas_facilitadoras` (
  `id_pessoa_facilitadora` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(255),
  `nascimento` date,
  `cpf` varchar(11),
  `email` varchar(100),
  `telefone` varchar(15),
  `formacao` varchar(45),
  `frente` varchar(25),
  `id_endereco_fk` int NOT NULL,
  FOREIGN KEY (id_endereco_fk) REFERENCES enderecos(id_endereco) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Modulos` (
  `id_modulos` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tema` varchar(50),
  `qtd_horas` int,
  `descricao` varchar(255),
  `id_pessoa_facilitadora_fk` int NOT NULL,
  FOREIGN KEY (id_pessoa_facilitadora_fk) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_pessoa_facilitadora2_fk` int NOT NULL,
  FOREIGN KEY (id_pessoa_facilitadora2_fk) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Cursos` (
  `id_curso` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(100),
  `carga_horaria` int,
  `preco` int
);

CREATE TABLE `Curso_modulos` (
`id_cursos_fk` int NOT NULL,
FOREIGN KEY (id_cursos_fk) REFERENCES cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
`id_modulos_fk` int NOT NULL,
FOREIGN KEY (id_modulos_fk) REFERENCES modulos(id_modulos) ON UPDATE CASCADE ON DELETE CASCADE,
`id_pessoa_facilitadora_fk` int NOT NULL,
FOREIGN KEY (id_pessoa_facilitadora_fk) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE,
`id_pessoa_facilitadora2_fk` int NOT NULL,
  FOREIGN KEY (id_pessoa_facilitadora2_fk) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Turmas` (
  `id_turma` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `periodo_aulas` varchar(25),
  `data_inicio` date,
  `data_termino` date,
  `id_curso_fk` int NOT NULL,
  FOREIGN KEY (id_curso_fk) REFERENCES cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Facilitadores_turma` (
  `id_pessoa_facilitadora_fk` int NOT NULL,
  FOREIGN KEY (id_pessoa_facilitadora_fk) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_pessoa_facilitadora2_fk` int NOT NULL,
  FOREIGN KEY (id_pessoa_facilitadora2_fk) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_turma_fk` int NOT NULL,
  FOREIGN KEY (id_turma_fk) REFERENCES turmas(id_turma) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Pagamento_facilitadores` (
  `id_pagamento_facilitador` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `valor_pagamento_modulo` int,
  `qtd_modulos` int,
  `data_pagamento` date,
  `id_pessoa_facilitadora_fk` int NOT NULL,
  FOREIGN KEY (id_pessoa_facilitadora_fk) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Estudantes` (
  `id_estudante` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(255),
  `nascimento` date,
  `cpf` varchar(11),
  `email` varchar(100),
  `telefone` varchar(15),
  `pcd` varchar(3),
  `status` varchar(25),
  `id_turma_fk` int NOT NULL,
  FOREIGN KEY (id_turma_fk) REFERENCES turmas(id_turma) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_endereco_fk` int NOT NULL,
  FOREIGN KEY (id_endereco_fk) REFERENCES enderecos(id_endereco) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Financas_estudante` (
  `id_financas_estudante` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `valor_total` int,
  `forma_pagamento` varchar(25),
  `status_pagamento` varchar(50),
  `id_curso_fk` int NOT NULL,
  FOREIGN KEY (id_curso_fk) REFERENCES cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_estudante_fk` int NOT NULL,
  FOREIGN KEY (id_estudante_fk) REFERENCES estudantes(id_estudante) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Estudante_curso` (
  `data_matricula` date,
  `evasao` int,
  `id_estudante_fk` int NOT NULL,
  FOREIGN KEY (id_estudante_fk) REFERENCES estudantes(id_estudante) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_curso_fk` int NOT NULL,
  FOREIGN KEY (id_curso_fk) REFERENCES cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_turma_fk` int NOT NULL,
  FOREIGN KEY (id_turma_fk) REFERENCES turmas(id_turma) ON UPDATE CASCADE ON DELETE CASCADE
);






