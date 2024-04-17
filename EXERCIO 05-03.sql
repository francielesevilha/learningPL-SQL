CREATE TABLE Locais (
    idloc NUMBER (2) PRIMARY KEY,
    cidade VARCHAR2 (50),
    estado VARCHAR2 (50),
    pais VARCHAR2 (50)
);

INSERT INTO Locais VALUES (1,'Madison', 'WI', 'EUA');
INSERT INTO Locais VALUES (2,'Fresno', 'CA', 'EUA');

CREATE TABLE Produtos (
    idp NUMBER (2) PRIMARY KEY,
    nomep VARCHAR2 (50),
    categoria VARCHAR2 (50),
    preco NUMBER (2)
);

INSERT INTO Produtos VALUES (11,'Jeans Lee', 'Vestuario', 25);
INSERT INTO Produtos VALUES (12,'Zord', 'Brinquedos', 18);
INSERT INTO Produtos VALUES (13,'Caneta Biro', 'Artigos de Escritório', 2);

CREATE TABLE Tempo (
    idtempo NUMBER (2) PRIMARY KEY,
    ano NUMBER (5)

);

INSERT INTO Tempo VALUES (1, 1995);
INSERT INTO Tempo VALUES (2, 1996);
INSERT INTO Tempo VALUES (3, 1997);


CREATE TABLE Vendas (
    idloc NUMBER (2),
    idp NUMBER (2),
    idtempo NUMBER (2),
    vendas NUMBER (2),

    CONSTRAINT fk_idloc FOREIGN KEY (idloc) REFERENCES Locais (idloc),
    CONSTRAINT fk_idtempo FOREIGN KEY (idtempo) REFERENCES Tempo (idtempo),
    CONSTRAINT fk_idp FOREIGN KEY (idp) REFERENCES Produtos (idp)
);




INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (11, 1, 1, 25);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (11, 2, 1, 8);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (11, 3, 1, 15);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (12, 1, 1, 30);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (12, 2, 1, 20);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (12, 3, 1, 50);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (13, 1, 1, 8);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (13, 2, 1, 10);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (13, 3, 1, 10);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (11, 1, 2, 35);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (11, 2, 2, 22);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (11, 3, 2, 10);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (12, 1, 2, 26);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (12, 2, 2, 45);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (12, 3, 2, 20);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (13, 1, 2, 20);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (13, 2, 2, 40);
INSERT INTO Vendas (idp, idtempo, idloc, vendas) VALUES (13, 3, 2, 5);


SELECT T.ano, L.estado, SUM (V.vendas)
FROM Vendas V, Tempo T, Locais L
WHERE V.idtempo=T.idtempo AND V.idloc=L.idloc
GROUP BY T.ano, L.estado;

SELECT T.ano SUM (V.vendas)
FROM Vendas V, Tempo T
WHERE V.idtempo=T.idtempo
GROUP BY T.ano;

SELECT L.estado, SUM (V.vendas)
FROM Vendas V, Locais L
WHERE V.idloc=L.idloc
GROUP BY L.estado;

SELECT SUM (V.vendas)
FROM Vendas V, Locais L
WHERE V.idloc=L.idloc;


SELECT T.ano, L.estado, SUM (V.vendas)
FROM Vendas V, Tempo T, Locais L
WHERE V.idtempo=T.idtempo AND V.idloc=L.idloc
GROUP BY CUBE (T.ano, L.estado);
















