CREATE DATABASE IF NOT EXISTS ResiliaDB;

USE ResiliaDB;

CREATE TABLE IF NOT EXISTS `Enderecos` (
  `id_endereco` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cep` int NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` int NOT NULL,
  `complemento` varchar(100),
  `estado` varchar(2) NOT NULL,
  `pais` varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Pessoas_facilitadoras` (
  `id_pessoa_facilitadora` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(255),
  `nascimento` date,
  `cpf` varchar(11),
  `email` varchar(100),
  `telefone` varchar(15),
  `formacao` varchar(45),
  `frente` varchar(25),
  `id_endereco_fk` int NOT NULL,
  
  FOREIGN KEY (id_endereco_fk) REFERENCES Enderecos(id_endereco) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Modulos` (
  `id_modulos` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tema` varchar(255),
  `qtd_horas` int,
  `descricao` varchar(255),
  `id_pessoa_facilitadora_fk` int NOT NULL,
  `id_pessoa_facilitadora2_fk` int NOT NULL,
  
  FOREIGN KEY (id_pessoa_facilitadora_fk) REFERENCES Pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_pessoa_facilitadora2_fk) REFERENCES Pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Cursos` (
  `id_curso` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(100),
  `carga_horaria` int,
  `preco` int
);

CREATE TABLE IF NOT EXISTS `Curso_modulos` (
  `id_cursos_fk` int NOT NULL,
  `id_modulos_fk` int NOT NULL,
  `id_pessoa_facilitadora_fk` int NOT NULL,
  `id_pessoa_facilitadora2_fk` int NOT NULL,
  
  FOREIGN KEY (id_cursos_fk) REFERENCES Cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_modulos_fk) REFERENCES Modulos(id_modulos) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_pessoa_facilitadora_fk) REFERENCES Pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_pessoa_facilitadora2_fk) REFERENCES Pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Turmas` (
  `id_turma` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `periodo_aulas` varchar(25),
  `data_inicio` date,
  `data_termino` date,
  `id_curso_fk` int NOT NULL,
  
  FOREIGN KEY (id_curso_fk) REFERENCES Cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Facilitadores_turma` (
  `id_pessoa_facilitadora_fk` int NOT NULL,
  `id_pessoa_facilitadora2_fk` int NOT NULL,
  `id_turma_fk` int NOT NULL,
  
  FOREIGN KEY (id_pessoa_facilitadora_fk) REFERENCES Pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_pessoa_facilitadora2_fk) REFERENCES Pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_turma_fk) REFERENCES Turmas(id_turma) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Pagamento_facilitadores` (
  `id_pagamento_facilitador` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `valor_pagamento_modulo` int,
  `qtd_modulos` int,
  `data_pagamento` date,
  `id_pessoa_facilitadora_fk` int NOT NULL,
  
  FOREIGN KEY (id_pessoa_facilitadora_fk) REFERENCES Pessoas_facilitadoras(id_pessoa_facilitadora) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Estudantes` (
  `id_estudante` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(255),
  `nascimento` date,
  `cpf` varchar(11),
  `email` varchar(100),
  `telefone` varchar(15),
  `pcd` varchar(5),
  `status` varchar(25),
  `id_turma_fk` int NOT NULL,
  `id_endereco_fk` int NOT NULL,
  
  FOREIGN KEY (id_turma_fk) REFERENCES Turmas(id_turma) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_endereco_fk) REFERENCES Enderecos(id_endereco) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Financas_estudante` (
  `id_financas_estudante` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `valor_total` int,
  `forma_pagamento` varchar(25),
  `status_pagamento` varchar(50),
  `id_curso_fk` int NOT NULL,
  `id_estudante_fk` int NOT NULL,
  
  FOREIGN KEY (id_curso_fk) REFERENCES Cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_estudante_fk) REFERENCES Estudantes(id_estudante) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Estudante_curso` (
  `data_matricula` date,
  `evasao` int,
  `id_estudante_fk` int NOT NULL,
  `id_curso_fk` int NOT NULL,
  `id_turma_fk` int NOT NULL,
  
  FOREIGN KEY (id_estudante_fk) REFERENCES Estudantes(id_estudante) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_curso_fk) REFERENCES Cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_turma_fk) REFERENCES Turmas(id_turma) ON UPDATE CASCADE ON DELETE CASCADE
);

###### INSERÇÃO DOS DADOS ABAIXO ######

#inserindo endereços na tabela 'Enderecos'
INSERT INTO ResiliaDB.Enderecos(cep,cidade,bairro,rua,numero,complemento,estado,pais)
	VALUES
	('02568567','São Paulo', 'Jardim Osório', 'Alameda dos Ipês', '106', 'casa','SP', 'Brasil'),
	('81567890', 'Curitiba', 'Graciosa', 'Rua dos Plátanos', '4587', 'apto 201', 'PR', 'Brasil'),
	('81454789', 'Curitiba', 'Vila Planalto', 'Avenida das Araucárias', '5102', 'n/a', 'PR','Brasil'),
	('84467890', 'Ponta Grossa', 'Jaraguá', 'Rua Goiabas', '945', 'n/a', 'PR','Brasil'),
	('08658901', 'Matinhos', 'Vila Bonfim', 'Rua Araçás', '4587', 'casa 01', 'PR', 'Brasil'),
	('80719042', 'Curitiba', 'Alto da Glória', 'Rua Orquídeas', '254', 'n/a', 'PR', 'Brasil'),
	('67890123', 'Belo Horizonte', 'Bacacheri', 'Avenida Graciosa', '159', 'casa 02', 'MG', 'Brasil'),
	('68541234', 'Brasília', 'Jardim Francês', 'Praça da Lua', '104', 'apto 1692 bloco B', 'DF', 'Brasil'),
	('81122345', 'Curitiba', 'Vale Lima', 'Rua do Limoeiro', '515', 'apto 134', 'PR', 'Brasil'),
	('90123456', 'Santa Maria', 'Cidade Nova', 'Rua Augusta', '4587','n/a', 'RS', 'Brasil'),
	('11734567', 'São Paulo', 'Brooklin', 'Rua Deputado Leal', '777','n/a','SP', 'Brasil'),
	('80406789', 'Pinhais', 'Alto Alegre', 'Rua das Azaleias', '5471','casa 02', 'PR', 'Brasil'),
	('81178901', 'Curitiba', 'Vila da Penha', 'Rua Vinte de Setembro', '3541', 'n/a', 'PR', 'Brasil'),
	('12345678', 'Santos', 'São Brás', 'Avenida Treze de Maio', '145', 'apto 31' ,'SP', 'Brasil'),
	('80789002', 'Pinhais', 'Campeche', 'Alameda Santos', '784','apto 13', 'PR', 'Brasil'),
	('81540423', 'Curitiba', 'Jardim Carapina', 'Rua Boa Esperança', '450', 'n/a', 'PR', 'Brasil'),
	('80901034', 'São José dos Pinhais', 'Campestre', 'Rua das Carmelitas', '4598','n/a', 'PR', 'Brasil'),
	('85012345', 'Curitiba', 'Jardim Maristela', 'Avenida das Hortências', '5421', 'n/a', 'PR', 'Brasil'),
	('94527000', 'Piraquara', 'Cidade Baixa', 'Rua das Lavandas', '532','casa 12', 'PR', 'Brasil'),
	('81548260', 'Curitiba', 'Xaxim', 'Avenida Presidente Shrek', '1371', 'n/a', 'PR', 'Brasil'),
	('80045630', 'Curitiba', 'Santo Antônio', 'Rua Doutor Fresálio', '4587','apto B', 'PR', 'Brasil'),
	('11234457', 'São José dos Campos', 'Vila Ipiranga', 'Rua Sete de Setembro', '137', 'n/a', 'SP', 'Brasil'),
	('67105020','Ananindeua','Marituba','Passagem Eliete','12','n/a','PA','Brasil'),
	('77424080','Gurupi','Residencial Daniela','Rua 18','20','casa','TO','Brasil'),
	('57073498','Maceió','Cidade Universitária','9ª Travessa Alameda da Paz','576','casa','AL','Brasil'),
	('69084070','Manaus','Zumbi dos Palmares','Rua Irmã Creuza Coelho','123','ap 12','AM','Brasil'),
	('45613276','Itabuna','Ferradas','Travessa Bela Vista','90','n/a','BA','Brasil'),
	('29092920','Vitória','Jardim Camburi','Avenida Doutor Herwan Modenese Wanderley','242','ap 24','ES','Brasil'),
	('29211162','Guarapari','Bela Vista','Avenida Pedro Machado','56','ap 10','ES','Brasil'),
	('38414626','Uberlândia','Jardim Europa','Rua Wesley Cintra','10','casa','MG','Brasil'),
	('38405258','Uberlândia','Custódio Pereira','Rua Cônego Pedro Pezzuti','14','n/a','MG','Brasil'),
	('03617160','São Paulo','Vila Marieta','Praça Caciporé','156','n/a','SP','Brasil'),
	('02114008','São Paulo','Vila Maria Baixa','Travessa Floriano Faissal','234','ap 15','SP','Brasil'),
	('68902315','Macapá','Muca','Avenida Quilombo dos Palmares','23','n/a','AP','Brasil'),
	('82640570','Curitiba','Santa Cândida','Rua Professor Rodolfo Belz','14','n/a','PR','Brasil'),
	('90250616','Porto Alegre','Farrapos','Rua Dois Mil e Quatorze','12','casa','RS','Brasil'),
	('81470478','Curitiba','Tatuquara','Rua Herculano Cordeiro','28','casa','PR','Brasil'),
	('76807670','Porto Velho','Cohab','Rua São Miguel','11','casa','RO','Brasil'),
	('21941080','Rio de Janeiro','Jardim Guanabara','Rua Grão de Areia','42','casa','RJ','Brasil'),
	('88106125','São José','Picadas do Sul','Rua Nicodemos C. da Silva','213','casa','SC','Brasil'),
	('82400250','Curitiba','Butiatuvinha','Rua José Botega','423','casa','PR','Brasil'),
	('18320000','Apiaí','Jardim Santo Antônio','Rua Júlio Reis Munhão','26','casa','SP','Brasil'),
	('80215140','Curitiba','Jardim Botânico','Rua Brasílio Itiberê','650','ap 12','PR','Brasil'),
	('49090650','Aracaju','Bugio','Rua E1','50','casa','SE','Brasil'),
	('01234567','Cidade Nova', 'Jardim Primavera', 'Rua das Flores', '123', 'casa','SP', 'Brasil'),
	('34567890', 'Vila Antiga', 'Centro Histórico', 'Avenida Principal', '456', 'ap245', 'MG', 'Brasil'),
	('23456789', 'Colorido', 'Arco-Íris', 'Avenida das Cores', '888', 'ap36', 'GO', 'Brasil'),
	('34567890', 'Amigo', 'Companhia', 'Rua da Amizade', '999', 'n/a', 'TO', 'Brasil'),
	('45678901', 'Aurora', 'Brilhante', 'Praça do Sol Nascente', '131', 'casa', 'MG', 'Brasil'),
	('56789012', 'Calmo', 'Serenata', 'Avenida da Tranquilidade', '222', 'n/a', 'PI', 'Brasil'),
	('67890123', 'Oceânico', 'Marítima', 'Rua das Ondas', '333', 'ap85', 'CE', 'Brasil'),
	('78901234', 'Aventureiro', 'Desafio', 'Praça da Aventura', '484', 'casa', 'AM', 'Brasil'),
	('89012345', 'Sábio', 'Inteligência', 'Avenida da Sabedoria', '555', 'ap154', 'RN', 'Brasil'),
	('90123456', 'Energético', 'Vitalidade', 'Rua da Energia', '676','ap78', 'AM', 'Brasil'),
	('01234567', 'Florido', 'Jardim Floral', 'Praça das Flores', '777','casa','AL', 'Brasil'),
	('23456789', 'Feliz', 'Alegre', 'Avenida da Felicidade', '888','casa', 'RR', 'Brasil'),
	('45678901', 'Praia Bela', 'Litoralville', 'Rua do Sol', '789', 'casa', 'RJ', 'Brasil'),
	('12345678', 'Centro Urbano', 'Metrópole', 'Praça Central', '101','fundos' ,'SP', 'Brasil'),
	('56789012', 'Vista Verde', 'Planalto', 'Rua das Montanhas', '212','ap300', 'PR', 'Brasil'),
	('67890123', 'Parque Feliz', 'Alegria', 'Avenida do Parque', '333','ap265', 'BA', 'Brasil'),
	('78901234', 'Céu Azul', 'Esperança', 'Rua dos Sonhos', '444','casa', 'RS', 'Brasil'),
	('87635278', 'Bonito', 'Bonitinho', 'Aesthetic Beaut', '888', 'casa', 'MG', 'Brasil'),
	('82958394', 'Jardins', 'Santo', 'Rua da beleza', '767', 'ap 2345', 'SP', 'Brasil' ),
	('89012345', 'Liberdade', 'Libertária', 'Praça da Liberdade', '555', 'n/a', 'ES', 'Brasil'),
	('90123456', 'Estrelado', 'Celesteville', 'Avenida das Estrelas', '666','casa', 'SC', 'Brasil'),
	('01234567', 'Harmonioso', 'Serenidade', 'Rua da Harmonia', '797', 'n/a', 'AM', 'Brasil'),
	('82348093', 'Curitiba' , 'Rebouças', 'Rua Chile', '2241', 'ap42', 'PR', 'Brasil'),
	('89574293', 'Pinhais', 'Jardim Amélia', 'Brigadeiro Franco', '32', 'casa', 'PR', 'Brasil'),
	('18320123', 'Joinville', 'Floresta', 'Rua Francisco', '46', 'casa', 'SC', 'Brasil'),
	('18320000', 'Apiaí', 'Jardim Sol Nascente', 'Rua Professora Maria da Glória', '53', 'casa', 'SP', 'Brasil'),
	('82104012', 'Joinville', 'Anitta Garibaldi', 'Rua Anitta Garibaldi', '1203', 'casa', 'SC', 'Brasil'),
	('23428987', 'Curitiba', 'Mercês', 'Rua Oscar Freire', '312', 'casa', 'PR', 'Brasil'),
	('23402393', 'Piraquara', 'Quitandinha', 'Rua Gonçala de Carvalho', '432', 'casa', 'PR', 'Brasil'),
	('42432434', 'Blumenau', 'Cerro Azul', 'Rua Barão de Itapitinha', '626', 'ap2', 'SC', 'Brasil'),
	('54834095', 'Toledo', 'Jardim Saira', 'Rua Avenida Atlântica', '54', 'casa', 'PR', 'Brasil'),
	('31231059', 'Cascavel', 'Vila Madalena', 'Rua Afonso Pena Cruz', '234', 'ap43', 'PR', 'Brasil'),
	('89468498', 'Iporanga', 'Palmital', 'Rua Monssenhor Cassesse', '12', 'n/a', 'SP', 'Brasil'),
	('84923482', 'Itaoca', 'Fazendinha', 'Rua Tapioca', '42', 'casa', 'SP', 'Brasil'),
	('98059683', 'Barra do Chapéu', 'Caximba', 'Rua XV de Novembro', '567', 'casa', 'SP', 'Brasil'),
	('82318912', 'Campo Largo', 'Jardim Rivamal', 'Postos de Caldas', '2342', 'casa', 'PR', 'Brasil'),
	('35348576', 'Ponta Grossa', 'Morro do Padre', 'Rua Alcides Ferraz', '583', 'ap76', 'PR', 'Brasil'),
	('84792347', 'Porto Alegre', 'Jardim Ipiranga', 'Rua Paulo Brificado', '654', 'casa', 'RS', 'Brasil'),
	('64564565', 'Campo Magro', 'São Brasil', 'Rua Pedro Pizatto', '756', 'n/a', 'PR', 'Brasil'),
	('87653234', 'Colombo', 'Pilarzinho', 'Rua Raquel Prado', '42', 'casa', 'PR', 'Brasil'),
	('89538754', 'Pelotas', 'Jardim Boarque', 'Rua Arapongas', '765', 'ap765', 'RS', 'Brasil'),
	('46749548', 'Americana', 'Centro', 'Rua Sherlock Rolmes', '4543', 'ap45', 'SP', 'Brasil');


 #inserindo pessoas facilitadoras na tabela 'Pessoas_facilitadoras'       
 INSERT INTO ResiliaDB.Pessoas_facilitadoras(nome,nascimento,cpf,email,telefone,formacao,frente,id_endereco_fk)
	VALUES
	('Fernanda Bossatto', '1975-01-24', '45211478563','fer.bossatto@resilia.com','(11) 98458-5248', 'Data Science UFSP', 'Hard', '1'),
	('Pedro Borges', '1972-11-03', '12500457831', 'pedro.borges@resilia.com', '(21) 90025-8748', 'Pedagogia UFRJ', 'Soft', '2'),
	('Marcos Marx','1990-10-02','43812195015','vivamarx@hotmail.com','(15) 98666-5321','Bacharel em Ciências Sociais pela Unicamp','Soft','23'),
	('Roberto Nascimento','1999-12-25','85163315048','codeiontem@gmail.com','(11) 98202-8755','Bacharel em Ciência da Computação pela USP','Hard','24'), 
	('Matheus Pimentel', '1986-12-26', '53478291746','matheuspimentel@email.com','(41) 989746538', 'Psicologia UFPR', 'Soft', '85'),
	('Karina Vitti', '1992-11-03', '71264982732', 'karinavitti@email.com', '(41) 923589238', 'Analise e desenvolvimento de sistemas UFPR', 'Hard', '86');


#inserindo módulos na tabela 'Modulos'
INSERT INTO ResiliaDB.Modulos(tema, qtd_horas, descricao, id_pessoa_facilitadora_fk, id_pessoa_facilitadora2_fk)
	VALUES
	('Módulo 1 - Business Intelligence', '60', 'Como coletar, analisar e interpretar dados empresariais a fim de tomar decisões informadas e estratégicas', '1', '2'),
	('Módulo 2 - Algoritmos para Análise de Dados', '70', 'Técnicas essenciais de algoritmos e estruturas de dados para a análise de grandes volumes', '1', '2'),
	('Módulo 3 - Fundamentos de Segurança, Dados e Informação', '50', 'Princípios fundamentais relacionados à segurança da informação, proteção de dados e gerenciamento de informações sensíveis', '1', '2'),
	('Módulo 4 - Qualidade de Dados', '60', 'Métodos para garantir que os dados sejam precisos, confiáveis, consistentes e úteis para tomada de decisões', '1', '2'),
	('Módulo 5 - Estatística Aplicada', '60', 'Coleta, processamento e análise de dados', '1', '2'),
	('Módulo 1 - Introdução ao Front-End e Aprender a aprender', '84','HTML5, CSS3, JavaScript, Git, Produtividade, Gestão de tempo e aprender a aprender com os erros','3','4'),
	('Módulo 2 - Estilização Avançada, Programação Funcional e Comunicação', '84','Programação orientada a objetos, CSS avançado, JavaScript avançado, Qualidade, Comunicação clara e assertiva','3','4'),
	('Módulo 3 - React, APIs, Autonomia e Feedback', '84','React, Hooks, Consumo de APIs, Autonomia, como dar e receber Feedbacks','3','4'),
	('Módulo 4 - NodeJs, PostgreSQL, Metodologias Ágeis e Carreira', '84','NodeJs, Programação assíncrona, Banco de dados SQL, Mapeamento de competências e carreiras','3','4'),
	('Módulo 5 - MongoDB, AWS, Ambiente de trabalho e Persistência', '84','Amazon AWS, MongoDB, Migrações, Adaptação ao ambiente de trabalho e Persistência','3','4'), 
	('Módulo 1 - Lógica de programação', '100', 'Lógica de programação e orientação ao pensamento.', '5', '6'),
	('Módulo 2 - Programação Orientada a Objetos', '100', 'Conceitos, classes, objetos, herança, polimorfismo, encapsulamento.', '5','6'),
	('Módulo 3 - Segurança da Informação', '100', 'Segurança, criptografia, prevenção de ataques, proteção de dados', '5','6'),
	('Módulo 1 - Sistema Operacional Linux e Versionamento', '80', 'Git, Comandos Shell, Técnicas de Versionamento', '1', '3'),
	('Módulo 2 - Redes e Conteinerização', '80', 'Infraestrutura de Redes e Docker', '1', '3'),
	('Módulo 3 - Provisionamento como código AWS', '80', 'Provisão e gerenciamento de serviços AWS', '4', '3'),
	('Módulo 4 - Engenharia de Software e Monitoramento de Infraestrutura', '80', 'Monitoramento de software/hardware e técnicas de engenharia de software.', '4', '3');
#inserindo cursos na tabela 'Cursos'    
INSERT INTO ResiliaDB.Cursos(nome,carga_horaria, preco)
	VALUES
	('Análise de Dados', '300', '9000'),
	('Desenvolvedor Web FullStack JavaScript', '420', '12000'),
	('Analista de sistemas', '300', '16000'),
	('DevOps', '320', '9999');

#inserindo os módulos referentes aos cursos na tabela 'Curso_modulos'
INSERT INTO ResiliaDB.Curso_modulos(id_cursos_fk,id_modulos_fk, id_pessoa_facilitadora_fk, id_pessoa_facilitadora2_fk)
	VALUES
	(1, 1, 1, 2),
	(1, 2, 1, 2),
	(1, 3, 1, 2),
	(1, 4, 1, 2),
	(1, 5, 1, 2),
	(2, 6, 3, 4),
	(2, 7, 3, 4),
	(2, 8, 3, 4),
	(2, 9, 3, 4),
	(2, 10, 3, 4),
	(3, 11, 5, 6),
	(3, 12, 5, 6),
	(3, 13, 5, 6),
	(4, 14, 1, 3),
	(4, 15, 1, 3),
	(4, 16, 4, 3),
	(4, 17, 4, 3);

#inserindo turmas na tabela 'Turmas'
INSERT INTO ResiliaDB.Turmas(periodo_aulas,data_inicio,data_termino, id_curso_fk)
	VALUES
	('Noturno', '2023-01-21','2023-07-14', '1'),
	('Matutino','2023-01-20','2023-08-30', '2'),
	('Matutino','2023-05-14','2023-11-17', '3'),
	('Noturno','2023-06-01','2023-12-31', '4');

#inserindo os facilitadores referentes às turmas na tabela 'Facilitadores_turma'
INSERT INTO ResiliaDB.Facilitadores_turma(id_pessoa_facilitadora_fk, id_pessoa_facilitadora2_fk, id_turma_fk)
	VALUES   
	('1', '2', '1'),
	('3', '4', '2'),
	('5', '6', '3'),
	('1', '3', '4'), 
	('4', '3', '4');

#inserindo pagamentos dos facilitadores na tabela 'Pagamento_facilitadores'
INSERT INTO ResiliaDB.Pagamento_facilitadores(valor_pagamento_modulo, qtd_modulos, data_pagamento, id_pessoa_facilitadora_fk)
	VALUES
	('700', '5', '2023-02-08', '1'),
	('650', '5', '2023-02-08', '2'),
	('900', '5', '2023-02-08', '3'),
	('850', '5', '2023-02-08', '4'),
	('800', '3', '2023-11-19', '5'),
	('800', '3', '2023-11-19', '6');
    
#inserindo estudantes na tabela 'Estudantes'
INSERT INTO ResiliaDB.Estudantes(nome, nascimento, cpf, email, telefone, pcd, status, id_turma_fk, id_endereco_fk)
	VALUES
	('Michel Teló', '1998-08-22', '98765432109', 'ai_seeutepego@outlook.com', '(11) 98547-6789', 'não', 'Ativo', 1, 3),
	('Renato Goldfarb', '2000-05-10', '56789012345', 'reuri.pote@gmail.com', '(11) 98757-8901', 'não', 'Ativo', 1, 4),
	('Thomas Ribas', '1999-11-02', '45872290123', 'lorde_valdemar@gmail.com', '(11) 98757-8901', 'não', 'Ativo', 1, 5),
	('Helena Britto', '2002-02-18', '89012345678', 'h_tinhagaymer@hotmail.com', '(41) 95985-9012', 'não', 'Ativo', 1, 6),
	('Mariana Secco', '1997-07-09', '23456789012', 'mari_secco@outlook.com', '(11) 96789-0123', 'não', 'Ativo', 1, 7),
	('Lucas Souza', '2001-09-25', '45678901234', 'souzaluk@gmail.com', '(11) 97890-1234', 'sim', 'Ativo', 1, 8),
	('Isabela Gomes', '1996-12-12', '67890123456', 'isah.gomesss@hotmail.com', '(11) 98901-2345', 'não', 'Inativo', 1, 9),
	('Gusttavo Lima', '1995-03-15', '12345678901', 'tchetchereretchetche@gmail.com', '(41) 9529-5678', 'não', 'Ativo', 1, 10),
	('Rafaela Pissato', '1994-04-08', '89012345670', 'raffa9bp@gmail.com', '(11) 9012-3456', 'não', 'Ativo', 1, 11),
	('João Banana', '1997-01-30', '24597810760', 'jaobanana@gmail.com', '(11) 94562-4567', 'sim', 'Ativo', 1, 12),
	('Camila Baccarin', '2003-06-20', '78901234567', 'cami.bacc@hotmail.com', '(11) 99547-6789', 'não', 'Ativo', 1, 13),
	('Thiago Oliveira', '2000-09-12', '56789012345', 'thiolivv@hotmail.com', '(11) 99857-8901', 'não', 'Ativo', 1, 14),
	('Amanda Santos', '2002-11-05', '23456789012', 'mandsliv32@gmail.com', '(11) 93456-7890', 'não', 'Ativo', 1, 15),
	('Ricardo Rasquini', '1999-03-25', '45678901234', 'ricardo_eletro@hotmail.com', '(11) 94567-8901', 'não', 'Ativo', 1, 16),
	('Fernanda Mendes', '1997-07-18', '67890123456', 'fernandamendess@yahoo.com', '(11) 95678-9012', 'não', 'Ativo', 1 , 17),
	('Luciano Cordeiro', '2001-01-09', '89012345670', 'caldeir4o@gmail.com', '(11) 96789-0123', 'sim', 'Inativo', 1, 18),
	('Hugo Poncio', '1996-04-15', '12345098760', 'hugofire77@hotmail.com', '(11) 97890-1234', 'não', 'Ativo', 1 , 19),
	('Eduardo Fernandes', '1998-12-30', '34567890123', 'duh_fernd0104@gmail.com', '(11) 98901-2345', 'não', 'Ativo', 1, 20),
	('Tomáz Jobim', '1971-08-08', '98765432109', 'tomjobim@gmail.com', '(11) 95012-3456', 'não', 'Ativo', 1, 21),
	('Vinícius Nakasono', '1995-05-02', '12345678901', 'vinireidelass@outlook.com', '(11) 94562-4567', 'não', 'Inativo', 1, 22),
	('Rafael de Oliveira','1982-09-15','97873195015','rafinha015@gmail.com','(11) 98765-4321','não','Ativo', 2, 25),
	('Letícia Stalin Barbosa','1995-03-28','33331011061','redson@hotmail.com','(21) 12345-6789','não','Ativo', 2, 26),
	('Matheus Colirio Auschwitz','1988-11-10','38526961004','colirio@paraosolhos.br','(31) 55555-4444','não','Ativo', 2, 27),
	('Isabella Gonçalves','1990-07-02','09016393030','belebellinha@yahoo.br','(41) 99999-8888','Não','Ativo', 2, 28),
	('Miguel Oppenrraimer','2001-05-17','31880638061','bombaatom@gmail.com','(51) 77777-3333','Não','Ativo', 2, 29),
	('Juliana Caroline Rodrigues','1998-12-30','82645463070','tranqueiocurso@ufpr.br','(12) 88888-7777','Não','Ativo', 2, 30),
	('Luísa Fernandes','1985-04-21','35831764052','redessociais@hotmail.com','(22) 44444-5555','Não','Ativo', 2, 31),
	('Gabriel das Dores','1993-08-07','74061944045','sintodorgabe@yahoo.br','(32) 66666-2222','Não','Ativo', 2, 32),
	('Beatriz Feira Costa','1987-06-12','34356881060','biafeiraelotes@gmail.com','(42) 22222-6666','Não','Ativo', 2, 33),
	('Lucas Santos Fantin','1999-10-25','32976246041','irmaodorafafanti@gmail.com','(52) 11111-9999','Não','Ativo', 2, 34),
	('Carolina Sousa','1983-02-13','90538657057','carolzinha@samaeverde.com','(13) 66666-1111','Não','Ativo', 2, 35),
	('André Martins Queiroz','2000-09-08','86598181054','kamehamerau@gohan.br','(23) 22222-8888','Não','Inativo', 2, 36),
	('Sofia Ponchio Carvalho','1992-01-19','75405394025','ponchiodomato@gmail.com','(33) 77777-2222','Não','Ativo', 2, 37),
	('Bruno Calvo Rodrigues','1986-07-31','39869571034','tratamento@capilar.com','(43) 55555-7777','Não','Ativo', 2, 38),
	('Laura Pinto Ferreira','1997-11-22','86238227060','lauraapenas@hotmail.com','(53) 88888-3333','Sim','Ativo', 2, 39),
	('José Oliveira de Jesus','1989-05-05','69246518012','josezinho@louro.br','(14) 22222-5555','Não','Ativo', 2, 40),
	('Ana Luz Pereira','1994-10-03','91647631025','anatrevosa@yahoo.br','(24) 99999-4444','Não','Ativo', 2, 41),
	('Pedro Ribas Almeida','2002-04-14','01170751083','direitomacho@hotmail.com','(34) 11111-8888','Não','Ativo', 2, 42),
	('Maria Santos Carrey','1991-03-09','93522340060','filhadejonas@gmail.com','(44) 44444-1111','Não','Ativo', 2, 43),
	('Lais Muewller Santana','1984-12-26','47130335025','agiotadecabelo@gamer.br','(54) 77777-6666','Não','Ativo', 2, 44),
	('Ana Silva', '1998-05-15', '12345678901', 'ana.silva@email.com', '(11) 98765-4321', 'Não', 'Ativo', '3', '45'),
	('Pedro Oliveira', '1999-03-20', '98765432109', 'pedro.oliveira@email.com', '(21) 91234-5678', 'Sim', 'Ativo', '3','46'),
	('Sofia Almeida', '2000-08-10', '45678901234', 'sofia.almeida@email.com', '(31) 87654-1234', 'Não', 'Ativo', '3','47'),
	('Rafael Santos', '1997-11-25', '56789012345', 'rafael.santos@email.com', '(41) 76543-2109', 'Não', 'Ativo', '3','48'),
	('Juliana Lima', '2001-02-03', '98765432198', 'juliana.lima@email.com', '(51) 87654-3210', 'Não', 'Ativo','3','49'),
	('Lucas Souza', '2002-09-18', '32165498701', 'lucas.souza@email.com', '(22) 98765-4321', 'Sim', 'Inativo', '3','50'),
	('Mariana Fernandes', '2000-04-30', '12378945602', 'mariana.fernandes@email.com', '(12) 87654-3210', 'Não', 'Ativo','3' ,'51'),
	('Gustavo Pereira', '1999-07-11', '56723489012', 'gustavo.pereira@email.com', '(71) 76543-2109', 'Não', 'Ativo','3','52'),
	('Isabela Rodrigues', '2003-01-05', '90876543210', 'isabela.rodrigues@email.com', '(81) 87654-3210', 'Sim', 'Ativo','3','53'),
	('Fernando Carvalho', '1996-12-15', '34567890123', 'fernando.carvalho@email.com', '(61) 98765-4321', 'Não', 'Inativo','3','54'),
	('Camila Oliveira', '2004-03-28', '98701234534', 'camila.oliveira@email.com', '(31) 87654-2109', 'Não', 'Ativo','3','55'),
	('Ricardo Martins', '2002-06-09', '23456789045', 'ricardo.martins@email.com', '(91) 76543-3210', 'Sim', 'Ativo','3','56'),
	('Amanda Ferreira', '2001-09-22', '45678901256', 'amanda.ferreira@email.com', '(27) 87654-2109', 'Não', 'Ativo','3','57'),
	('André Silva', '1998-05-01', '67890123467', 'andre.silva@email.com', '(21) 76543-3210', 'Não', 'Inativo', '3', '58'),
	('Beatriz Santos', '2005-08-14', '89012345678', 'beatriz.santos@email.com', '(41) 87654-2109', 'Sim', 'Ativo','3','59'),
	('Guilherme Almeida', '2000-02-17', '23456789089', 'guilherme.almeida@email.com', '(31) 76543-3210', 'Não', 'Ativo','3','60'),
	('Carolina Pereira', '1999-11-10', '67890123490', 'carolina.pereira@email.com', '(51) 87654-2109', 'Não', 'Inativo','3','61'),
	('Thiago Rodrigues', '2003-04-23', '34567890101', 'thiago.rodrigues@email.com', '(22) 76543-3210', 'Sim', 'Ativo','3','62'),
	('Laura Carvalho', '2004-07-06', '90123456712', 'laura.carvalho@email.com', '(71) 87654-2109', 'Não', 'Ativo','3','63'),
	('Rafaela Oliveira', '1997-10-19', '34567890123', 'rafaela.oliveira@email.com', '(81) 76543-3210', 'Não', 'Ativo','3','64'),
	('João da Silva', '2000-01-15', '12345678900', 'node@js.com', '(11) 98765-4321', 'Não', 'Ativo', '4', '65'),
	('Maria Oliveira', '2001-03-25', '98765432100', 'mariaoliv@gmail.com', '(21) 99876-5432', 'Não', 'Ativo', '4', '66'),
	('Pedro Santos', '2002-07-10', '23456789000', 'pedrao@gmail.com', '(31) 98765-1234', 'Não', 'Ativo', '4', '67'),
	('Ana Pereira', '2001-11-20', '65432109800', 'perderneiras@gmail.com', '(41) 99876-5432', 'Não', 'Ativo', '4', '68'),
	('Lucas Souza', '2000-09-05', '87654321000', 'soul.zaza@gmail.com', '(51) 98765-4321', 'Não', 'Ativo', '4', '69'),
	('Mariana Fernandes', '2003-04-17', '01234567890', 'mafa@outlook.com', '(61) 99876-5432', 'Não', 'Ativo', '4', '70'),
	('Sujiro Kemimame', '2001-02-03', '45678901200', 'sujiro@niconico.com', '(71) 98765-4321',  'Não', 'Ativo', '4', '71'),
	('Amanda Côlon Trois', '2002-06-21', '89012345600', 'julia@doispontostres.com', '(81) 99876-5432', 'Sim', 'Ativo', '4', '72'),
	('Elma Maria', '2000-12-09', '23456789000', 'euNAO@outlook.com', '(91) 98765-4321',  'Não', 'Inativo', '4', '73'),
	('Larissa Manolela', '2003-03-14', '65432109800', 'cademeudinheiro@shein.com', '(11) 99876-5432',  'Não', 'Ativo', '4', '74'),
	('Samueo Putz', '2004-04-29', '87654321000', 'putz@gmail.com', '(11) 98765-4321',  'Não', 'Ativo', '4', '75'),
	('Dave Mustang', '1980-05-16', '01234567890', 'lucreia@megaDEATH.com', '(21) 99876-5432',  'Sim', 'Ativo', '4', '76'),
	('Ricardo Milos', '2000-01-15', '12345678900', 'ugot@that.com', '(11) 98765-4321', 'Não', 'Ativo', '4', '77'),
	('Amanda Nunes', '2001-03-25', '98765432100', 'naoMANDO@nunes.com', '(41) 99876-5432',  'Não', 'Ativo', '4', '78'),
	('Fernando D`Vila', '2002-07-10', '23456789000', 'melhor@professor.com', '(11) 98765-1234', 'Não', 'Ativo', '4', '79'),
	('Kiko Cabreiro', '2001-11-20', '65432109800', 'top10@baixistas.com', '(16) 99876-5432',  'Não', 'Ativo', '4', '80'),
	('Luizão', '2000-09-05', '87654321000', 'luiZAP@chama.com', '(11) 98765-4321',  'Não', 'Inativo', '4', '81'),
	('Silvio Santos', '2003-04-17', '01234567890', 'podeficarcom@otroco.com', '(11) 99876-5432',  'Não', 'Ativo', '4', '82'),
	('Thomas Turbinas', '2001-02-03', '45678901200', 'uma.maquina@.com', '(47) 98765-4321', 'Não', 'Ativo', '4', '83'),
	('Julia Felicio da Silva', '2002-06-21', '89012345600', 'raluca@granola.com', '(47) 99876-5432',  'Sim', 'Inativo', '4', '84');

-- Lembrando que os detalhes como nomes, datas de nascimento, CPFs, e-mails, telefones, informações de PCD, status,
-- IDs de turma e IDs de endereço são fictícios e podem ser ajustados de acordo com suas necessidades.


#inserindo as finanças dos estudantes (pagamentos de valores do curso) na tabela 'Financas_estudantes'
INSERT INTO Financas_estudante (valor_total, forma_pagamento, status_pagamento, id_curso_fk, id_estudante_fk)
	VALUES
	(9000, 'Cartão de Crédito', 'Pago', 1, 1),
	(9000, 'Cartão de Crédito', 'Pago', 1, 2),
	(8800, 'Pix', 'Pago', 1, 3),
	(9000, 'Cartão de Crédito', 'Pago', 1, 4),
	(9000, 'Cartão de Crédito', 'Pago', 1, 5),
	(9000, 'Cartão de Crédito', 'Pago', 1, 6),
	(8100, 'Boleto Bancário', 'Pago', 1, 7),
	(9000, 'Cartão de Crédito', 'Pago', 1, 8),
	(8100, 'Cartão de Crédito', 'Pago', 1, 9),
	(8800, 'Cartão de Crédito', 'Pago', 1, 10),
	(9000, 'Cartão de Crédito', 'Pago', 1, 11),
	(9000, 'Cartão de Crédito', 'Pago', 1, 12),
	(9000, 'Pix', 'Pago', 1, 13),
	(9000, 'Cartão de Crédito', 'Pago', 1, 14),
	(9000, 'Cartão de Crédito', 'Pago', 1, 15),
	(9000, 'Cartão de Crédito', 'Pago', 1, 16),
	(9000, 'Cartão de Crédito', 'Pago', 1, 17),
	(9000, 'Cartão de Crédito', 'Pago', 1, 18),
	(9000, 'Boleto Bancário', 'Pago', 1, 19),
	(8100, 'Cartão de Crédito', 'Pago', 1, 20),
	(12000, 'Cartão de Crédito', 'Pago', 2, 21),
	(12000, 'Cartão de Crédito', 'Pago', 2, 22),
	(12000, 'Pix', 'Pago', 2, 23),
	(12000, 'Cartão de Crédito', 'Pago', 2, 24),
	(12000, 'Cartão de Crédito', 'Pago', 2, 25),
	(12000, 'Cartão de Crédito', 'Pago', 2, 26),
	(12000, 'Boleto Bancário', 'Pago', 2, 27),
	(12000, 'Cartão de Crédito', 'Pago', 2, 28),
	(12000, 'Cartão de Crédito', 'Pago', 2, 29),
	(12000, 'Cartão de Crédito', 'Pago', 2, 30),
	(12000, 'Cartão de Crédito', 'Pago', 2, 31),
	(12000, 'Cartão de Crédito', 'Pago', 2, 32),
	(12000, 'Pix', 'Pago', 2, 33),
	(12000, 'Cartão de Crédito', 'Pago', 2, 34),
	(11000, 'Cartão de Crédito', 'Pago', 2, 35),
	(12000, 'Cartão de Crédito', 'Pago', 2, 36),
	(11000, 'Cartão de Crédito', 'Pago', 2, 37),
	(12000, 'Cartão de Crédito', 'Pago', 2, 38),
	(12000, 'Boleto Bancário', 'Pago', 2, 39),
	(12000, 'Cartão de Crédito', 'Pago', 2, 40),
	(16000, 'Cartão Crédito', 'Em andamento', 3, 41),
	(16000, 'Cartão Débito', 'Pago', 3, 42),
	(16000, 'Pix', 'Pago', 3, 43),
	(16000, 'Cartão Crédito', 'Pago', 3 , 44),
	(16000, 'Cartão Crédito', 'Pago', 3 , 45),
	(16000, 'Cartão Débito', 'Pago', 3, 46),
	(16000, 'Cartão Crédito', 'Pago', 3, 47),
	(16000, 'Pix', 'Pago', 3, 48),
	(16000, 'Cartão Crédito', 'Em andamento', 3, 49),
	(16000, 'Pix', 'Pago', 3, 50),
	(16000, 'Cartão Débito', 'Pago', 3, 51),
	(16000, 'Cartão Crédito', 'Pago', 3, 52),
	(16000, 'Boleto Bancário', 'Em andamento', 3, 53),
	(16000, 'Cartão Débito', 'Pago', 3, 54),
	(16000, 'Pix', 'Pago', 3, 55),
	(16000, 'Cartão Crédito', 'Pago', 3, 56),
	(16000, 'Boleto Bancário', 'Em andamento', 3, 57),
	(16000, 'Cartão Crédito', 'Pago', 3, 58),
	(16000, 'Cartão Crédito', 'Pago', 3, 59),
	(16000, 'Cartão Débito', 'Pago', 3, 60),
	(9999, 'Pix', 'Pago', 4, 61),
	(9999, 'Cartão Débito', 'Pago', 4, 62),
	(9999, 'Cartão Crédito', 'Pago', 4, 63),
	(9999, 'Cartão Débito', 'Pago', 4, 64),
	(9999, 'Cartão Crédito', 'Pago', 4, 65),
	(9999, 'Pix', 'Pago', 4, 66),
	(9999, 'Cartão Débito', 'Pago', 4, 67),
	(9999, 'Cartão Crédito', 'Pago', 4, 68),
	(9999, 'Boleto Bancário', 'Pago', 4, 69),
	(9999, 'Cartão Débito', 'Pago', 4, 70),
	(9999, 'Boleto Bancário', 'Pago', 4, 71),
	(9999, 'Cartão Débito', 'Pago', 4, 72),
	(9999, 'Pix', 'Pago', 4, 73),
	(9999, 'Cartão Débito', 'Pago', 4, 74),
	(9999, 'Cartão Crédito', 'Pago', 4, 75),
	(9999, 'Pix', 'Pago', 4, 76),
	(9999, 'Cartão Débito', 'Pago', 4, 77),
	(9999, 'Cartão Débito', 'Pago', 4, 78),
	(9999, 'Cartão Crédito', 'Pago', 4, 79),
	(9999, 'Cartão Débito', 'Pago', 4, 80);

#inserindo os dados dos estudantes referentes ao curso na tabela 'Estudante_curso'
INSERT INTO Estudante_curso (data_matricula, evasao, id_estudante_fk, id_curso_fk, id_turma_fk)
	VALUES
	('2022-12-01', 0, 1, 1, 1),
	('2022-12-05', 15, 2, 1, 1),
	('2022-12-10', 0, 3, 1, 1),
	('2022-12-15', 20, 4, 1, 1),
	('2022-12-20', 0, 5, 1, 1),
	('2022-12-25', 0, 6, 1, 1),
	('2022-12-08', 0, 7, 1, 1),
	('2022-12-12', 80, 8, 1, 1),
	('2022-12-17', 0, 9, 1, 1),
	('2022-12-22', 0, 10, 1, 1),
	('2022-12-27', 0, 11, 1, 1),
	('2022-12-03', 0, 12, 1, 1),
	('2022-12-06', 0, 13, 1, 1),
	('2022-12-09', 0, 14, 1, 1),
	('2022-12-13', 0, 15, 1, 1),
	('2022-12-18', 20, 16, 1, 1),
	('2022-12-23', 75, 17, 1, 1),
	('2022-12-28', 0, 18, 1, 1),
	('2022-12-31', 5, 19, 1, 1),
	('2022-12-07', 90, 20, 1, 1),
	('2022-12-03', 0, 21, 2, 2),
	('2022-12-04', 0, 22, 2, 2),
	('2022-12-11', 0, 23, 2, 2),
	('2022-12-12', 0, 24, 2, 2),
	('2022-12-23', 10, 25, 2, 2),
	('2022-12-22', 0, 26, 2, 2),
	('2022-12-12', 0, 27, 2, 2),
	('2022-12-13', 0, 28, 2, 2),
	('2022-12-14', 1, 29, 2, 2),
	('2022-12-23', 0, 30, 2, 2),
	('2022-12-21', 0, 31, 2, 2),
	('2022-12-02', 75, 32, 2, 2),
	('2022-12-03', 0, 33, 2, 2),
	('2022-12-04', 0, 34, 2, 2),
	('2022-12-16', 0, 35, 2, 2),
	('2022-12-18', 0, 36, 2, 2),
	('2022-12-20', 0, 37, 2, 2),
	('2022-12-23', 0, 38, 2, 2),
	('2022-12-30', 0, 39, 2, 2),
	('2022-12-02', 0, 40, 2, 2),
	('2023-03-13', 0, 41, 3, 3), 
	('2023-03-15', 0, 42, 3, 3), 
	('2023-03-13', 0, 43, 3, 3), 
	('2023-03-15', 0, 44, 3, 3), 
	('2023-03-17', 0, 45, 3, 3), 
	('2023-03-19', 40, 46, 3, 3), 
	('2023-03-20', 0, 47, 3, 3), 
	('2023-03-13', 10, 48, 3, 3), 
	('2023-03-17', 0, 49, 3, 3), 
	('2023-03-19', 60, 50, 3, 3), 
	('2023-03-19', 0 ,51,3, 3), 
	('2023-03-14', 0, 52, 3, 3), 
	('2023-03-11', 0, 53, 3, 3), 
	('2023-03-15', 55, 54, 3, 3), 
	('2023-03-17', 0, 55, 3, 3), 
	('2023-03-13', 0, 56, 3, 3), 
	('2023-03-18', 85, 57, 3, 3), 
	('2023-03-19', 15, 58, 3, 3), 
	('2023-03-13', 0, 59, 3, 3), 
	('2023-03-13', 0, 60, 3, 3),
	('2023-05-15', 10, 61, 4, 4),
	('2023-05-12', 0, 62, 4, 4),
	('2023-05-03', 0, 63, 4, 4),
	('2023-05-01', 0, 64, 4, 4),
	('2023-05-02', 10, 65, 4, 4),
	('2023-05-22', 0, 66, 4, 4),
    ('2023-05-19', 0, 67, 4, 4),
    ('2023-05-17', 0, 68, 4, 4),
    ('2023-05-15', 65, 69, 4, 4),
    ('2023-05-14', 0, 70, 4, 4),
	('2023-05-13', 0, 71, 4, 4),
	('2023-05-06', 0, 72, 4, 4),
	('2023-05-07', 0, 73, 4, 4),
	('2023-05-02', 0, 74, 4, 4),
	('2023-05-05', 0, 75, 4, 4),
	('2023-05-05', 0, 76, 4, 4),
	('2023-05-12', 95, 77, 4, 4),
	('2023-05-10', 0, 78, 4, 4),
	('2023-05-19', 10, 79, 4, 4),
	('2023-05-16', 75, 80, 4, 4);





