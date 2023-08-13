#Inserção de dados

-- passando os argumentos
INSERT INTO ResiliaDB.Enderecos(cep,cidade,bairro,rua,numero,complemento,estado,pais)
-- inserindo os dados
	VALUES
        ('01234-567','Cidade Nova', 'Jardim Primavera', 'Rua das Flores', '123', 'casa','São Paulo', 'Brasil'),
        ('34567-890', 'Vila Antiga', 'Centro Histórico', 'Avenida Principal', '456', 'ap245', 'Minas Gerais', 'Brasil'),
        ('23456-789', 'Colorido', 'Arco-Íris', 'Avenida das Cores', '888', 'Goiás', 'ap36','Brasil')
        ('34567-890', 'Amigo', 'Companhia', 'Rua da Amizade', '999', 'Tocantins', 'n/a','Brasil')
        ('45678-901', 'Aurora', 'Brilhante', 'Praça do Sol Nascente', '111', 'casa', 'Mato Grosso', 'Brasil')
        ('56789-012', 'Calmo', 'Serenata', 'Avenida da Tranquilidade', '222', 'n/a', 'Piauí', 'Brasil')
        ('67890-123', 'Oceânico', 'Marítima', 'Rua das Ondas', '333', 'Ceará', 'ap85', 'Brasil')
        ('78901-234', 'Aventureiro', 'Desafio', 'Praça da Aventura', '444', 'casa', 'Amapá', 'Brasil')
        ('89012-345', 'Sábio', 'Inteligência', 'Avenida da Sabedoria', '555', 'ap154', 'Rio Grande do Norte', 'Brasil')
        ('90123-456', 'Energético', 'Vitalidade', 'Rua da Energia', '666','ap78', 'Maranhão', 'Brasil')
        ('01234-567', 'Florido', 'Jardim Floral', 'Praça das Flores', '777','casa','Alagoas', 'Brasil')
        ('23456-789', 'Feliz', 'Alegre', 'Avenida da Felicidade', '888','casa', 'Roraima', 'Brasil'),
        ('45678-901', 'Praia Bela', 'Litoralville', 'Rua do Sol', '789', 'casa', 'Rio de Janeiro', 'Brasil')
        ('12345-678', 'Centro Urbano', 'Metrópole', 'Praça Central', '101','fundos' ,'São Paulo', 'Brasil')
        ('56789-012', 'Vista Verde', 'Planalto', 'Rua das Montanhas', '222','ap300', 'Paraná', 'Brasil')
        ('67890-123', 'Parque Feliz', 'Alegria', 'Avenida do Parque', '333','ap265' 'Bahia', 'Brasil')
        ('78901-234', 'Céu Azul', 'Esperança', 'Rua dos Sonhos', '444','casa', 'Rio Grande do Sul', 'Brasil')
        ('89012-345', 'Liberdade', 'Libertária', 'Praça da Liberdade', '555', 'n/a', 'Espírito Santo', 'Brasil')
        ('90123-456', 'Estrelado', 'Celesteville', 'Avenida das Estrelas', '666','casa', 'Santa Catarina', 'Brasil')
        ('01234-567', 'Harmonioso', 'Serenidade', 'Rua da Harmonia', '777', 'n/a', 'Amazonas', 'Brasil');
select * from Enderecos;
-- mostra a tabela populada

INSERT INTO ResiliaDB.Estudantes(nome, nascimento, cpf, email, telefone, pcd, status, id_turma_fk, id_endereco_fk, id_financas_aluno)
	VALUES
    ('Ana Silva', '1998-05-15', '12345678901', 'ana.silva@email.com', '(11) 98765-4321', 'Não', 'Ativo', '1', '1','1'),
    ('Pedro Oliveira', '1999-03-20', '98765432109', 'pedro.oliveira@email.com', '(21) 91234-5678', 'Sim, auditiva', 'Ativo', '2','2','2'),
    ('Sofia Almeida', '2000-08-10', '45678901234', 'sofia.almeida@email.com', '(31) 87654-1234', 'Não', 'Ativo', '3','3','3'),
    ('Rafael Santos', '1997-11-25', '56789012345', 'rafael.santos@email.com', '(41) 76543-2109', 'Não', 'Ativo', '4','4','4'),
    ('Juliana Lima', '2001-02-03', '98765432198', 'juliana.lima@email.com', '(51) 87654-3210', 'Não', 'Ativo','5','5','5'),
    ('Lucas Souza', '2002-09-18', '32165498701', 'lucas.souza@email.com', '(22) 98765-4321', 'Sim, física', 'Inativo', '6','6','6'),
    ('Mariana Fernandes', '2000-04-30', '12378945602', 'mariana.fernandes@email.com', '(12) 87654-3210', 'Não', 'Ativo','7','7','7'),
    ('Gustavo Pereira', '1999-07-11', '56723489012', 'gustavo.pereira@email.com', '(71) 76543-2109', 'Não', 'Ativo','8','8','8'),
    ('Isabela Rodrigues', '2003-01-05', '90876543210', 'isabela.rodrigues@email.com', '(81) 87654-3210', 'Sim, visual', 'Ativo','9','9','9'),
    ('Fernando Carvalho', '1996-12-15', '34567890123', 'fernando.carvalho@email.com', '(61) 98765-4321', 'Não', 'Inativo','10','10','10'),
    ('Camila Oliveira', '2004-03-28', '98701234534', 'camila.oliveira@email.com', '(31) 87654-2109', 'Não', 'Ativo','11','11','11'),
    ('Ricardo Martins', '2002-06-09', '23456789045', 'ricardo.martins@email.com', '(91) 76543-3210', 'Sim, auditiva', 'Ativo','12','12','12'),
    ('Amanda Ferreira', '2001-09-22', '45678901256', 'amanda.ferreira@email.com', '(27) 87654-2109', 'Não', 'Ativo','13','13','13'),
    ('André Silva', '1998-05-01', '67890123467', 'andre.silva@email.com', '(21) 76543-3210', 'Não', 'Inativo','14','14','14'),
    ('Beatriz Santos', '2005-08-14', '89012345678', 'beatriz.santos@email.com', '(41) 87654-2109', 'Sim, física', 'Ativo','15','15','15'),
    ('Guilherme Almeida', '2000-02-17', '23456789089', 'guilherme.almeida@email.com', '(31) 76543-3210', 'Não', 'Ativo','16','16','16'),
    ('Carolina Pereira', '1999-11-10', '67890123490', 'carolina.pereira@email.com', '(51) 87654-2109', 'Não', 'Inativo','17','17','17'),
    ('Thiago Rodrigues', '2003-04-23', '34567890101', 'thiago.rodrigues@email.com', '(22) 76543-3210', 'Sim, visual', 'Ativo','18','18','18'),
    ('Laura Carvalho', '2004-07-06', '90123456712', 'laura.carvalho@email.com', '(71) 87654-2109', 'Não', 'Ativo','19','19','19'),
    ('Rafaela Oliveira', '1997-10-19', '34567890123', 'rafaela.oliveira@email.com', '(81) 76543-3210', 'Não', 'Ativo','20','20','20');
select * from Estudantes;



