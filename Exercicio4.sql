--- FRANCIELE DE ALMEIDA SEVILHA
--- JONATHAS PEREIRA GONÇALVES
--- MIRIÃ ALVES DOS SANTOS


CREATE TABLE ESPECIALIDADE (
  id_especialidade INT NOT NULL,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (id_especialidade)
);




CREATE TABLE TEMPO (
  id_tempo INT NOT NULL,
  dia VARCHAR(45) NULL,
  mes VARCHAR(45) NULL,
  ano VARCHAR(45) NULL,
  PRIMARY KEY (id_tempo)
);



CREATE TABLE CLINICA (
  id_clinica INT NOT NULL,
  nome VARCHAR(45) NULL,
  consultorio VARCHAR(45) NULL,
  PRIMARY KEY (id_clinica)
);



CREATE TABLE LOCAL (
  id_local INT NOT NULL,
  cidade VARCHAR(45) NULL,
  estado VARCHAR(45) NULL,
  pais VARCHAR(45) NULL,
  PRIMARY KEY (id_local)
);



CREATE TABLE CONSULTA (
  id_consulta INT NOT NULL,
  horario VARCHAR(45) NULL,
  valor_consulta VARCHAR(45) NULL,
  sexo VARCHAR(45) NULL,
  faixa_etaria VARCHAR(45) NULL,
  ESPECIALIDADE_id_especialidade INT NOT NULL,
  TEMPO_id_tempo INT NOT NULL,
  CLINICA_id_clinica INT NOT NULL,
  LOCAL_id_local INT NOT NULL,
  CONSTRAINT fk_CONSULTA_ESPECIALIDADE FOREIGN KEY (ESPECIALIDADE_id_especialidade) REFERENCES (id_especialidade),
  CONSTRAINT fk_CONSULTA_TEMPO FOREIGN KEY (TEMPO_id_tempo) REFERENCES  (id_tempo),
  CONSTRAINT fk_CONSULTA_CLINICA FOREIGN KEY (CLINICA_id_clinica) REFERENCES  (id_clinica),
  CONSTRAINT fk_CONSULTA_LOCAL FOREIGN KEY (LOCAL_id_local) REFERENCES (id_local)
);


CREATE TABLE REMEDIO (
  id_remedio INT NOT NULL,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (id_remedio)
);


CREATE TABLE RECEITUARIO (
  id_receituario INT NOT NULL,
  ESPECIALIDADE_id_especialidade INT NOT NULL,
  TEMPO_id_tempo INT NOT NULL,
  REMEDIO_id_remedio INT NOT NULL,
  CLINICA_id_clinica INT NOT NULL,
  CONSTRAINT fk_RECEITUARIO_ESPECIALIDADE FOREIGN KEY (ESPECIALIDADE_id_especialidade) REFERENCES (id_especialidade),
  CONSTRAINT fk_RECEITUARIO_TEMPO FOREIGN KEY (TEMPO_id_tempo) REFERENCES (id_tempo),
  CONSTRAINT fk_RECEITUARIO_REMEDIO FOREIGN KEY (REMEDIO_id_remedio) REFERENCES (id_remedio),
  CONSTRAINT fk_RECEITUARIO_CLINICA FOREIGN KEY (CLINICA_id_clinica) REFERENCES (id_clinica)
);



----------------------------------------------------------------------

SELECT 
    LOCAL.cidade,
    ESPECIALIDADE.nome AS especialidade_medica,
    CLINICA.nome AS nome_clinica,
    CONSULTA.sexo,
    CONSULTA.faixa_etaria,
    SUM(CONSULTA.valor_consulta) AS total_faturado
FROM CONSULTA
JOIN ESPECIALIDADE ON CONSULTA.ESPECIALIDADE_id_especialidade = ESPECIALIDADE.id_especialidade
JOIN CLINICA ON CONSULTA.CLINICA_id_clinica = CLINICA.id_clinica
JOIN LOCAL ON CONSULTA.LOCAL_id_local = LOCAL.id_local
GROUP BY CUBE(LOCAL.cidade, ESPECIALIDADE.nome, CLINICA.nome, CONSULTA.sexo, CONSULTA.faixa_etaria);



----------------------------------------------------------------------
SELECT 
    YEAR(TEMPO.ano) AS ano,
    QUARTER(TEMPO.mes) AS trimestre,
    MONTH(TEMPO.mes) AS mes,
    SUM(CONSULTA.valor_consulta) AS total_faturado
FROM CONSULTA
JOIN TEMPO ON CONSULTA.TEMPO_id_tempo = TEMPO.id_tempo
GROUP BY CUBE(YEAR(TEMPO.ano), QUARTER(TEMPO.mes), MONTH(TEMPO.mes));

----------------------------------------------------------------------
SELECT 
    RECEITUARIO.CLINICA_id_clinica,
    RECEITUARIO.REMEDIO_id_remedio,
    RECEITUARIO.TEMPO_id_tempo,
    COUNT(*) AS quantidade_prescrita
FROM RECEITUARIO
GROUP BY CUBE(RECEITUARIO.CLINICA_id_clinica, RECEITUARIO.REMEDIO_id_remedio, RECEITUARIO.TEMPO_id_tempo);

----------------------------------------------------------------------
SELECT 
    CLINICA.nome AS nome_clinica,
    CONSULTA.sexo,
    CONSULTA.faixa_etaria,
    LOCAL.cidade,
    COUNT(*) AS quantidade_prescrita
FROM RECEITUARIO
JOIN CLINICA ON RECEITUARIO.CLINICA_id_clinica = CLINICA.id_clinica
JOIN CONSULTA ON RECEITUARIO.CLINICA_id_clinica = CONSULTA.CLINICA_id_clinica
JOIN LOCAL ON RECEITUARIO.LOCAL_id_local = LOCAL.id_local
GROUP BY CUBE(CLINICA.nome, CONSULTA.sexo, CONSULTA.faixa_etaria, LOCAL.cidade);

----------------------------------------------------------------------

SELECT 
    YEAR(RECEITUARIO.TEMPO_id_tempo) AS ano,
    MONTH(RECEITUARIO.TEMPO_id_tempo) AS mes,
    COUNT(*) AS quantidade_prescrita
FROM RECEITUARIO
GROUP BY CUBE(YEAR(RECEITUARIO.TEMPO_id_tempo), MONTH(RECEITUARIO.TEMPO_id_tempo));
