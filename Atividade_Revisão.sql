--Franciele 
--Jonathas
--Miriã

CREATE TABLE livraria (
    id_livraria NUMBER (20) PRIMARY KEY,
    nome VARCHAR2 (50)
);

    INSERT INTO livraria VALUES (1, 'Fenty');
    INSERT INTO livraria VALUES (2, 'Rihanna');
    INSERT INTO livraria VALUES (3, 'Katy Perry');

CREATE TABLE local (
    id_local NUMBER (20) PRIMARY KEY,
    cidade VARCHAR2 (50),
    estado VARCHAR2 (50),
    pais VARCHAR2 (50)
);

    INSERT INTO local VALUES (1, 'New York', 'New York','EUA');
    INSERT INTO local VALUES (2, 'São Paulo', 'São Paulo','BR');
    INSERT INTO local VALUES (3, 'Hong Kong', 'Hong Kong', 'China');

CREATE TABLE faixa_idade (
    id_faixa NUMBER (20) PRIMARY KEY,
    descricao VARCHAR2 (50)
);

    INSERT INTO faixa_idade VALUES (1, 'Infantil');
    INSERT INTO faixa_idade VALUES (2, 'Juvenil');
    INSERT INTO faixa_idade VALUES (3, 'Adulto');

CREATE TABLE tempo (
    id_tempo NUMBER (20) PRIMARY KEY,
    mes VARCHAR2 (50),
    ano VARCHAR2 (50)
);

    INSERT INTO tempo VALUES (1, 'Novembro', '1997');
    INSERT INTO tempo VALUES (2, 'Julho', '1996');
    INSERT INTO tempo VALUES (3, 'Abril', '2004');

CREATE TABLE autor (
    id_autor NUMBER (20) PRIMARY KEY,
    nome VARCHAR2 (50)
);

    INSERT INTO autor VALUES (1, 'Edgar Robert');
    INSERT INTO autor VALUES (2, 'Withney House');
    INSERT INTO autor VALUES (3, 'Jones Willians');

CREATE TABLE editora (
    id_editora NUMBER (20) PRIMARY KEY,
    nome VARCHAR2 (50)
    
);

    INSERT INTO editora VALUES (1, 'Astral');
    INSERT INTO editora VALUES (2, 'Rocco');
    INSERT INTO editora VALUES (3, 'Panini');

CREATE TABLE assunto (
    id_assunto NUMBER (20) PRIMARY KEY,
    nome VARCHAR2 (50)
);

    INSERT INTO assunto VALUES (1, 'Ficção');
    INSERT INTO assunto VALUES (2, 'Ação');
    INSERT INTO assunto VALUES (3, 'Romance');

CREATE TABLE vendas (
    id_vendas NUMBER (20) PRIMARY KEY,
    id_livraria NUMBER (20),
    id_local NUMBER (20),
    id_tempo NUMBER (20),
    id_autor NUMBER (20),
    id_editora NUMBER (20),
    id_assunto NUMBER (20),
    id_faixa NUMBER (20),
    genero VARCHAR2 (120),
    quantidade NUMBER (20),
    valor NUMBER (20),

    CONSTRAINT fk_id_livraria FOREIGN KEY (id_livraria) REFERENCES livraria (id_livraria),
    CONSTRAINT fk_id_local FOREIGN KEY (id_local) REFERENCES local (id_local),
    CONSTRAINT fk_id_tempo FOREIGN KEY (id_tempo) REFERENCES tempo (id_tempo),
    CONSTRAINT fk_id_autor FOREIGN KEY (id_autor) REFERENCES autor (id_autor),
    CONSTRAINT fk_id_editora FOREIGN KEY (id_editora) REFERENCES editora (id_editora),
    CONSTRAINT fk_id_assunto FOREIGN KEY (id_assunto) REFERENCES assunto (id_assunto),
    CONSTRAINT fk_id_faixa FOREIGN KEY (id_faixa) REFERENCES faixa_idade (id_faixa)

);


    INSERT INTO assunto VALUES (1, 1, 3, 2, 1, 2, 3, 3, 'Ficção', 5, 8000);
    INSERT INTO assunto VALUES (2, 3, 2, 3, 2, 3, 1, 2, 'Aventura', 5, 18000);
    INSERT INTO assunto VALUES (3, 2, 2, 1, 1, 1, 2, 2, 'Romance', 5, 3000);
