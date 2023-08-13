CREATE DATABASE ResiliaDB;

USE ResiliaDB;

CREATE TABLE `Enderecos` (
  `id_endereco` int UNIQUE PRIMARY KEY NOT NULL,
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
  `id_pessoa_facilitadora` int UNIQUE PRIMARY KEY NOT NULL,
  `nome` varchar(255),
  `nascimento` date,
  `cpf` varchar(11),
  `email` varchar(100),
  `telefone` varchar(15),
  `formacao` varchar(45),
  `frente` varchar(25),
  `id_endereco_fk` int NOT NULL,
  FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Modulos` (
  `id_modulo` int UNIQUE PRIMARY KEY NOT NULL,
  `tema` varchar(50),
  `qtd_horas` int,
  `descricao` varchar(255),
  `id_pessoa_facilitadora_fk` int NOT NULL,
  FOREIGN KEY (id_pessoa_facilitadora) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Cursos` (
  `id_curso` int UNIQUE PRIMARY KEY NOT NULL,
  `nome` varchar(100),
  `carga_horaria` int,
  `preco` int,
  `grade_curricular` varchar(100),
  `id_modulos_fk` int NOT NULL,
  FOREIGN KEY (id_modulos) REFERENCES modulos(id_modulos) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Turmas` (
  `id_turma` int UNIQUE PRIMARY KEY NOT NULL,
  `numero` int,
  `periodo_aulas` varchar(25),
  `data_inicio` date,
  `data_termino` date,
  `id_curso_fk` int NOT NULL,
  FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Facilitadores_turma` (
  `id_facilitadores_turma` int UNIQUE PRIMARY KEY NOT NULL,
  `id_pessoa_facilitadora_fk` int NOT NULL,
  FOREIGN KEY (id_pessoa_facilitadora) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_turma_fk` int NOT NULL,
  FOREIGN KEY (id_turma) REFERENCES turmas(id_turma) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Pagamento_facilitadores` (
  `id_pagamento_facilitador` int UNIQUE PRIMARY KEY NOT NULL,
  `valor_pagamento_modulo` int,
  `qtd_modulos` int,
  `data_pagamento` date,
  `id_curso_fk` int NOT NULL,
  FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_pessoa_facilitadora_fk` int NOT NULL,
  FOREIGN KEY (id_pessoa_facilitadora) REFERENCES pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Financas_aluno` (
  `id_financas_aluno` int UNIQUE PRIMARY KEY NOT NULL,
  `valor_total` int,
  `forma_pagamento` varchar(25),
  `status_pagamento` varchar(50),
  `id_curso_fk` int NOT NULL,
  FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `Estudantes` (
  `id_estudante` int UNIQUE PRIMARY KEY NOT NULL,
  `nome` varchar(255),
  `nascimento` date,
  `cpf` varchar(11),
  `email` varchar(100),
  `telefone` varchar(15),
  `pcd` boolean NOT NULL,
  `status` varchar(25),
  `id_turma_fk` int NOT NULL,
  FOREIGN KEY (id_turma) REFERENCES turmas(id_turma) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_endereco_fk` int NOT NULL,
  FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_financas_aluno` int NOT NULL,
  FOREIGN KEY (id_financas_aluno) REFERENCES financas_aluno(id_financas_aluno) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE `Estudante_curso` (
  `id_estudante_curso` int PRIMARY KEY NOT NULL,
  `data_matricula` date,
  `evasao` int,
  `id_estudante_fk` int NOT NULL,
  FOREIGN KEY (id_estudante) REFERENCES estudantes(id_estudante) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_curso_fk` int NOT NULL,
  FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
  `id_turma_fk` int NOT NULL,
  FOREIGN KEY (id_turma) REFERENCES turmas(id_turma) ON UPDATE CASCADE ON DELETE CASCADE
);





