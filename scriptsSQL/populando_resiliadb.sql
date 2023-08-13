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
select * from enderecos;
-- mostra a tabela populada
