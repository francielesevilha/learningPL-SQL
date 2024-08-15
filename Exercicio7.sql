
CREATE TABLE ARTISTA (
  id_artista NUMBER,
  nome VARCHAR(45),
  PRIMARY KEY (id_artista)
);


CREATE TABLE LOCAL (
  id_local NUMBER,
  pais VARCHAR(45),
  PRIMARY KEY (id_local)
);


CREATE TABLE TEMPO (
  id_tempo NUMBER,
  dia NUMBER,
  mes NUMBER,
  ano NUMBER,
  PRIMARY KEY (id_tempo)
);


CREATE TABLE GENERO (
  id_genero NUMBER,
  nome VARCHAR(45),
  PRIMARY KEY (id_genero)
);


CREATE TABLE PLAYERS (
  num_ouvNUMBERes NUMBER,
  ARTISTA_id_artista NUMBER,
  TEMPO_id_tempo NUMBER,
  LOCAL_id_local NUMBER,
  GENERO_id_genero NUMBER
  CONSTRANUMBER fk_PLAYERS_ARTISTA FOREIGN KEY (ARTISTA_id_artista) REFERENCES ARTISTA (id_artista),
  CONSTRANUMBER fk_PLAYERS_TEMPO FOREIGN KEY (TEMPO_id_tempo) REFERENCES TEMPO (id_tempo),
  CONSTRANUMBER fk_PLAYERS_LOCAL FOREIGN KEY (LOCAL_id_local) REFERENCES LOCAL (id_local),
  CONSTRANUMBER fk_PLAYERS_GENERO FOREIGN KEY (GENERO_id_genero) REFERENCES GENERO (id_genero);



