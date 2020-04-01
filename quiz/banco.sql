CREATE TABLE usuario(
	nome_usuario varchar(10) not null,  
    senha varchar(8) not null,  
    primeiro_nome varchar(15) not null,  
    sobrenome varchar(15) not null,  
    sexo char(1) not null,  
    primary key (nome_usuario)
);

CREATE TABLE perguntas(  
	id integer not null,  
    pergunta varchar(100) not null,  
    primary key (id)
);

CREATE TABLE alternativas(  
	id_pergunta integer not null,  
    id_alternativa smallint not null,  
    alternativa varchar(100) not null,  
    alternativa_correta boolean not null,  
    primary key (id_pergunta, id_alternativa),  
    foreign key (id_pergunta) references perguntas (id)
);

INSERT INTO perguntas VALUES (1, 'O rapaz osculou a linda rosa vermelha. Isso significa que:');
INSERT INTO perguntas VALUES (2, 'Em que país foi sediada a Copa do Mundo de 1994, quando o Brasil conquistou o tetracampeonato?');

INSERT INTO alternativas VALUES (1, 1, 'Ele beijou a rosa', true);
INSERT INTO alternativas VALUES (1, 2, 'Ele bateu o óculos na rosa', false);
INSERT INTO alternativas VALUES (1, 3, 'Ele apanhou a rosa', false);
INSERT INTO alternativas VALUES (1, 4, 'Ele jogou a rosa', false);
INSERT INTO alternativas VALUES (2, 1, 'Itália', false);
INSERT INTO alternativas VALUES (2, 2, 'China', false);
INSERT INTO alternativas VALUES (2, 3, 'Estados Unidos', true);
INSERT INTO alternativas VALUES (2, 4, 'Honduras', false);

select * from usuario