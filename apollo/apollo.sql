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
    Id_historia int PRIMARY KEY,
    descricao blob,
    texto blob,
    data_criacao date,
    status boolean,
    titulo varchar(255)
);

CREATE TABLE Comentario (
    id_comentario int PRIMARY KEY,
    status boolean,
    data_comentario date,
    texto varchar(255),
    fk_Usuário_id_usuario int
);

CREATE TABLE Bloqueia (
    fk_Usuário_id_usuario int,
    fk_Usuário_id_usuario_ int
);

CREATE TABLE Segue (
    fk_Usuário_id_usuario int,
    fk_Usuário_id_usuario_ int
);

CREATE TABLE Coautoria (
    fk_Usuário_id_usuario int,
    fk_História_Id_historia int,
    percentual_colaboracao int
);

CREATE TABLE Pertence (
    fk_Gênero_id_genero int,
    fk_História_Id_historia int
);

CREATE TABLE Cria (
    fk_Usuário_id_usuario int,
    fk_História_Id_historia int
);

CREATE TABLE Recebe (
    fk_História_Id_historia int,
    fk_Comentário_id_comentario int
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuário_2
    FOREIGN KEY (fk_Lingua_nome_lingua)
    REFERENCES Lingua (nome_lingua)
    ON DELETE CASCADE;
 
ALTER TABLE Comentário ADD CONSTRAINT FK_Comentário_2
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
    FOREIGN KEY (fk_Usuário_id_usuario_)
    REFERENCES Usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Coautoria ADD CONSTRAINT FK_Coautoria_1
    FOREIGN KEY (fk_Usuário_id_usuario)
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
