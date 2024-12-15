
drop database apollo_bd
create database apollo_bd

use apollo_bd

create table Lingua (
    nome_lingua varchar(255) PRIMARY KEY
);

CREATE TABLE Genero (
    nome_genero varchar(255),
    id_genero int AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Usuario (
    data_nasc date,
    email varchar(255),
    id_usuario int AUTO_INCREMENT PRIMARY KEY,
    senha varchar(255),
    nome varchar(255),
    fk_Lingua_nome_lingua varchar(255)
);


CREATE TABLE Historia (
    Id_historia int AUTO_INCREMENT  PRIMARY KEY,
    descricao blob,
    texto blob,
    data_criacao date,
    status varchar(255),
    titulo varchar(255)
);

CREATE TABLE Comentario (
    id_comentario int PRIMARY KEY,
    status boolean,
    data_comentario date,
    texto varchar(255),
    fk_Usuario_id_usuario int
);

CREATE TABLE Bloqueia (
    fk_Usuario_id_usuario int,
    fk_Usuario_id_usuario_ int
);

CREATE TABLE Segue (
    fk_Usuario_id_usuario int,
    fk_Usuario_id_usuario_ int
);

CREATE TABLE Coautoria (
    fk_Usuario_id_usuario int,
    fk_Historia_Id_historia int,
    percentual_colaboracao int
);

CREATE TABLE Pertence (
    fk_Genero_id_genero int,
    fk_Historia_Id_historia int
);

CREATE TABLE Cria (
    fk_Usuario_id_usuario int,
    fk_Historia_Id_historia int
);

CREATE TABLE Recebe (
    fk_Historia_Id_historia int,
    fk_Comentario_id_comentario int
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Lingua_nome_lingua)
    REFERENCES Lingua (nome_lingua)
    ON DELETE CASCADE;
 
ALTER TABLE Comentario ADD CONSTRAINT FK_Comentario_2
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Bloqueia ADD CONSTRAINT FK_Bloqueia_1
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Bloqueia ADD CONSTRAINT FK_Bloqueia_2
    FOREIGN KEY (fk_Usuario_id_usuario_)
    REFERENCES Usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Segue ADD CONSTRAINT FK_Segue_1
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Segue ADD CONSTRAINT FK_Segue_2
    FOREIGN KEY (fk_Usuario_id_usuario_)
    REFERENCES Usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Coautoria ADD CONSTRAINT FK_Coautoria_1
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE SET NULL;
 
ALTER TABLE Coautoria ADD CONSTRAINT FK_Coautoria_2
    FOREIGN KEY (fk_Historia_Id_historia)
    REFERENCES Historia (Id_historia)
    ON DELETE SET NULL;
 
ALTER TABLE Pertence ADD CONSTRAINT FK_Pertence_1
    FOREIGN KEY (fk_Genero_id_genero)
    REFERENCES Genero (id_genero)
    ON DELETE RESTRICT;
 
ALTER TABLE Pertence ADD CONSTRAINT FK_Pertence_2
    FOREIGN KEY (fk_Historia_Id_historia)
    REFERENCES Historia (Id_historia)
    ON DELETE SET NULL;
 
ALTER TABLE Cria ADD CONSTRAINT FK_Cria_1
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE SET NULL;
 
ALTER TABLE Cria ADD CONSTRAINT FK_Cria_2
    FOREIGN KEY (fk_Historia_Id_historia)
    REFERENCES Historia (Id_historia)
    ON DELETE SET NULL;
 
ALTER TABLE Recebe ADD CONSTRAINT FK_Recebe_1
    FOREIGN KEY (fk_Historia_Id_historia)
    REFERENCES Historia (Id_historia)
    ON DELETE RESTRICT;
 
ALTER TABLE Recebe ADD CONSTRAINT FK_Recebe_2
    FOREIGN KEY (fk_Comentario_id_comentario)
    REFERENCES Comentario (id_comentario)
    ON DELETE SET NULL;

INSERT INTO Lingua (nome_lingua) 
VALUES 
    ('portugues'),
    ('ingles'),
    ('espanhol');

INSERT INTO usuario (data_nasc, email, id_usuario, senha, nome, fk_Lingua_nome_lingua) 
VALUES 
('2022-06-01', 'jack@gmail.com', '2', '0987', 'Jackes', 'ingles'),
('2006-08-05', 'gabrielebatista@gmail.com', '1', '1234', 'Gabriele', 'portugues');
