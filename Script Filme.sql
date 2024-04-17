CREATE TABLE LOCAL (
    id_local INT NOT NULL,
    cidade VARCHAR(45) NULL,
    estado VARCHAR(45) NULL,
    pais VARCHAR(45) NULL,
    PRIMARY KEY (id_local)
  );

CREATE TABLE TEMPO (
    id_tempo INT NOT NULL,
    PRIMARY KEY (id_tempo)
    dia INT,
    mes INT,
    ano INT
  );

CREATE TABLE CINEMA (
    id_cinema INT NOT NULL,
    nome VARCHAR(120) NULL,
    numero_salas INT NULL,
    PRIMARY KEY (id_cinema)
  );

CREATE TABLE ATOR (
    id_ator INT NOT NULL,
    nome VARCHAR(120) NULL,
    PRIMARY KEY (id_ator)
  );

CREATE TABLE DIRETOR (
    id_diretor INT NOT NULL,
    nome VARCHAR(120) NULL,
    PRIMARY KEY (id_diretor)
  );

CREATE TABLE GENERO (
    id_genero INT NOT NULL,
    nome VARCHAR(120) NULL,
    PRIMARY KEY (id_genero)
  );

CREATE TABLE EXIBICAO (
    LOCAL_id_local INT NOT NULL,
    TEMPO_id_tempo INT NOT NULL,
    CINEMA_id_cinema INT NOT NULL,
    FILME_id_filme INT NOT NULL,
    DIRETOR_id_diretor INT NOT NULL,
    GENERO_id_genero INT NOT NULL, 
    publico INT NULL,
    valor_vendas FLOAT NULL,
    CONSTRAINT fk_EXIBICAO_LOCAL FOREIGN KEY (LOCAL_id_local) REFERENCES LOCAL (id_local),
    CONSTRAINT fk_EXIBICAO_TEMPO1 FOREIGN KEY (TEMPO_id_tempo) REFERENCES TEMPO (id_tempo),
    CONSTRAINT fk_EXIBICAO_CINEMA1 FOREIGN KEY (CINEMA_id_cinema) REFERENCES CINEMA (id_cinema),
    CONSTRAINT fk_EXIBICAO_FILME1 FOREIGN KEY (FILME_id_filme) REFERENCES ATOR (id_ator),
    CONSTRAINT fk_EXIBICAO_DIRETOR1 FOREIGN KEY (DIRETOR_id_diretor) REFERENCES DIRETOR (id_diretor),
    CONSTRAINT fk_EXIBICAO_GENERO1 FOREIGN KEY (GENERO_id_genero) REFERENCES GENERO (id_genero)
  );
