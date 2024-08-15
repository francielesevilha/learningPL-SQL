--criar banco de dados PROJETO
CREATE DATABASE PROJETO;

--criar tabela BAIRRO
CREATE TABLE BAIRRO(
    ID NUMBER(3) PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR2 (120) NOT NULL 
)

--inserir dados na tabela BAIRRO
INSERT INTO BAIRRO (NOME) VALUES 
('Bela Vista'), 
('Pinheiros'),
('Moema'),
('Vila Olímpia'),
('Vila Madalena'),
('Vila Mariana'),
('Itaim Bibi'),
('Butantã'),
('Perdizes'),
('Perdizes'),
('Lago Sul'),
('Jardim Paulista'),
('Oscar Freire'),
('Jardim Olimpia'),
('Higienópolis'),
('Vila Nova Conceição'),
('Vila Guilherme'),
('Barra Funda'),
('Luz'),
('Sé'),
('Mairinque'),
('Morumbi');
