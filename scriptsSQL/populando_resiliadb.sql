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
        ('11234457', 'São José dos Campos', 'Vila Ipiranga', 'Rua Sete de Setembro', '137', 'n/a', 'SP', 'Brasil');
        
 #inserindo pessoas facilitadoras na tabela 'Pessoas_facilitadoras'       
 INSERT INTO ResiliaDB.Pessoas_facilitadoras(nome,nascimento,cpf,email,telefone,formacao,frente,id_endereco_fk)
	VALUES
       ('Fernanda Bossatto', '1975-01-24', '45211478563','fer.bossatto@resilia.com','(11) 98458-5248', 'Data Science UFSP', 'Hard', '1'),
       ('Pedro Borges', '1972-11-03', '12500457831', 'pedro.borges@resilia.com', '(21) 90025-8748', 'Pedagogia UFRJ', 'Soft', '2');

#inserindo módulos na tabela 'Modulos'
INSERT INTO ResiliaDB.Modulos(tema, qtd_horas, descricao, id_pessoa_facilitadora_fk, id_pessoa_facilitadora2_fk)
	VALUES
    ('Business Intelligence', '60', 'Como coletar, analisar e interpretar dados empresariais a fim de tomar decisões informadas e estratégicas', '1', '2'),
    ('Algoritmos para Análise de Dados', '70', 'Técnicas essenciais de algoritmos e estruturas de dados para a análise de grandes volumes', '1', '2'),
    ('Fundamentos de Segurança, Dados e Informação', '50', 'Princípios fundamentais relacionados à segurança da informação, proteção de dados e gerenciamento de informações sensíveis', '1', '2'),
    ('Qualidade de Dados', '60', 'Métodos para garantir que os dados sejam precisos, confiáveis, consistentes e úteis para tomada de decisões', '1', '2'),
	('Estatística Aplicada', '60', 'Coleta, processamento e análise de dados', '1', '2');
       
#inserindo cursos na tabela 'Cursos'    
INSERT INTO ResiliaDB.Cursos(nome,carga_horaria, preco)
	VALUES
    ('Análise de Dados', '300', '9000');

#inserindo os módulos referentes aos cursos na tabela 'Curso_modulos'
INSERT INTO ResiliaDB.Curso_modulos(id_cursos_fk,id_modulos_fk, id_pessoa_facilitadora_fk, id_pessoa_facilitadora2_fk)
    VALUES
    (1, 1, 1, 2),
    (1, 2, 1, 2),
    (1, 3, 1, 2),
    (1, 4, 1, 2),
    (1, 5, 1, 2);

#inserindo turmas na tabela 'Turmas'
INSERT INTO ResiliaDB.Turmas(periodo_aulas,data_inicio,data_termino, id_curso_fk)
	VALUES
	('noturno', '2024-01-21','2024-07-14', '1');

#inserindo os facilitadores referentes às turmas na tabela 'Facilitadores_turma'
INSERT INTO ResiliaDB.Facilitadores_turma(id_pessoa_facilitadora_fk, id_pessoa_facilitadora2_fk, id_turma_fk)
	VALUES   
    ('1', '2', '1');

#inserindo pagamentos dos facilitadores na tabela 'Pagamento_facilitadores'
INSERT INTO ResiliaDB.Pagamento_facilitadores(valor_pagamento_modulo, qtd_modulos, data_pagamento, id_pessoa_facilitadora_fk)
	VALUES
    ('700', '1', '2023-02-08', '1'),
    ('650', '1', '2023-02-08', '2');
    
#inserindo estudantes na tabela 'Estudantes'
INSERT INTO ResiliaDB.Estudantes(nome, nascimento, cpf, email, telefone, pcd, status, id_turma_fk, id_endereco_fk)
	VALUES
  ('Michel Teló', '1998-08-22', '98765432109', 'ai_seeutepego@outlook.com', '(11) 98547-6789', 'não', 'Ativo', '1','3' ),
  ('Renato Goldfarb', '2000-05-10', '56789012345', 'reuri.pote@gmail.com', '(11) 98757-8901', 'não', 'Ativo', '1', '4' ),
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
  ('Vinícius Nakasono', '1995-05-02', '12345678901', 'vinireidelass@outlook.com', '(11) 94562-4567', 'não', 'Inativo', 1, 22);

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
  (8100, 'Cartão de Crédito', 'Pago', 1, 20);

#inserindo os dados dos estudantes referentes ao curso na tabela 'Estudante_curso'
  INSERT INTO Estudante_curso (data_matricula, evasao, id_estudante_fk, id_curso_fk, id_turma_fk)
VALUES
  ('2023-12-01', 0, 1, 1, 1),
  ('2023-12-05', 1, 2, 1, 1),
  ('2023-12-10', 0, 3, 1, 1),
  ('2023-12-15', 0, 4, 1, 1),
  ('2023-12-20', 1, 5, 1, 1),
  ('2023-12-25', 0, 6, 1, 1),
  ('2023-12-08', 0, 7, 1, 1),
  ('2023-12-12', 0, 8, 1, 1),
  ('2023-12-17', 1, 9, 1, 1),
  ('2023-12-22', 0, 10, 1, 1),
  ('2023-12-27', 0, 11, 1, 1),
  ('2023-12-03', 1, 12, 1, 1),
  ('2023-12-06', 0, 13, 1, 1),
  ('2023-12-09', 0, 14, 1, 1),
  ('2023-12-13', 0, 15, 1, 1),
  ('2023-12-18', 1, 16, 1, 1),
  ('2023-12-23', 0, 17, 1, 1),
  ('2023-12-28', 0, 18, 1, 1),
  ('2023-12-31', 1, 19, 1, 1),
  ('2023-12-07', 0, 20, 1, 1);





