CREATE TABLE ALUNOS (
  id_alunos INTEGER NOT NULL,
  sexo VARCHAR2(45) NULL,
  idade INTEGER NULL,
  qtde_graduacao INTEGER NULL,
  PRIMARY KEY (id_alunos)
);


CREATE TABLE CURSO (
  id_curso INTEGER NOT NULL,
  nome VARCHAR2(120) NULL,
  mensalidade FLOAT NULL,
  status_pagamento VARCHAR2(45) NULL,
  PRIMARY KEY (id_curso)
);

CREATE TABLE TEMPO (
  id_tempo INTEGER NOT NULL,
  dia VARCHAR2(45) NULL,
  mes VARCHAR2(45) NULL,
  ano VARCHAR2(45) NULL,
  PRIMARY KEY (id_tempo)
);


CREATE TABLE INSTITUICAO (
  id_instituicao INTEGER NOT NULL,
  nome VARCHAR2(120) NULL,
  PRIMARY KEY (id_instituicao)
);

CREATE TABLE MATRICULA (
  tipo_matricula VARCHAR2(45) NULL,
  tipo_mensalidade VARCHAR2(45) NULL,
  percentual_mensalidade FLOAT NULL,
  ALUNOS_id_alunos INTEGER NOT NULL,
  CURSO_id_curso INTEGER NOT NULL,
  TEMPO_id_tempo INTEGER NOT NULL,
  INSTITUICAO_id_instituicao INTEGER NOT NULL,
  CONSTRAINTEGER fk_MATRICULA_ALUNOS FOREIGN KEY (ALUNOS_id_alunos) REFERENCES ALUNOS (id_alunos),
  CONSTRAINTEGER fk_MATRICULA_CURSO FOREIGN KEY (CURSO_id_curso) REFERENCES CURSO (id_curso),
  CONSTRAINTEGER fk_MATRICULA_TEMPO FOREIGN KEY (TEMPO_id_tempo) REFERENCES TEMPO (id_tempo),
  CONSTRAINTEGER fk_MATRICULA_INSTITUICAO FOREIGN KEY (INSTITUICAO_id_instituicao) REFERENCES INSTITUICAO (id_instituicao)
);

CREATE TABLE DESISTENCIA (
  ALUNOS_id_alunos INTEGER NOT NULL,
  CURSO_id_curso INTEGER NOT NULL,
  TEMPO_id_tempo INTEGER NOT NULL,
  INSTITUICAO_id_instituicao INTEGER NOT NULL,
  CONSTRAINTEGER fk_DESISTENCIA_ALUNOS FOREIGN KEY (ALUNOS_id_alunos) REFERENCES ALUNOS (id_alunos),
  CONSTRAINTEGER fk_DESISTENCIA_CURSO FOREIGN KEY (CURSO_id_curso) REFERENCES CURSO (id_curso),
  CONSTRAINTEGER fk_DESISTENCIA_TEMPO FOREIGN KEY (TEMPO_id_tempo) REFERENCES TEMPO (id_tempo),
  CONSTRAINTEGER fk_DESISTENCIA_INSTITUICAO FOREIGN KEY (INSTITUICAO_id_instituicao) REFERENCES INSTITUICAO (id_instituicao)
);


----- Faturamento por tipo de aluno (integral ou bolsista):
SELECT 
    CASE WHEN m.tipo_mensalidade = 'integral' THEN 'Integral' ELSE 'Bolsista' END AS tipo_aluno,
    i.nome AS instituicao,
    SUM(c.mensalidade) AS faturamento,
    COUNT(DISTINCT m.ALUNOS_id_alunos) AS quantidade_alunos,
    ROUND(SUM(c.mensalidade) / (SELECT SUM(mensalidade) FROM MATRICULA) * 100, 2) AS percentual_faturamento
FROM MATRICULA m
JOIN CURSO c ON m.CURSO_id_curso = c.id_curso
JOIN INSTITUICAO i ON m.INSTITUICAO_id_instituicao = i.id_instituicao
GROUP BY CUBE(m.tipo_mensalidade, i.nome);



----- Faturamento por tipo de aluno, instituição e curso:
SELECT 
    CASE WHEN m.tipo_mensalidade = 'integral' THEN 'Integral' ELSE 'Bolsista' END AS tipo_aluno,
    i.nome AS instituicao,
    c.nome AS curso,
    SUM(c.mensalidade) AS faturamento,
    COUNT(DISTINCT m.ALUNOS_id_alunos) AS quantidade_alunos,
    ROUND(SUM(c.mensalidade) / (SELECT SUM(mensalidade) FROM MATRICULA) * 100, 2) AS percentual_faturamento
FROM MATRICULA m
JOIN CURSO c ON m.CURSO_id_curso = c.id_curso
JOIN INSTITUICAO i ON m.INSTITUICAO_id_instituicao = i.id_instituicao
GROUP BY CUBE(m.tipo_mensalidade, i.nome, c.nome);


------ Perfil do aluno desistente:
SELECT 
    CASE WHEN m.tipo_mensalidade = 'integral' THEN 'Integral' ELSE 'Bolsista' END AS tipo_aluno,
    t.mes AS periodo,
    CASE WHEN a.sexo = 'M' THEN 'Masculino' ELSE 'Feminino' END AS sexo,
    FLOOR(a.idade / 10) * 10 AS faixa_etaria,
    c.nome AS curso,
    COUNT(*) AS quantidade_desistentes,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM DESISTENCIA) * 100, 2) AS percentual_desistentes
FROM DESISTENCIA d
JOIN MATRICULA m ON d.ALUNOS_id_alunos = m.ALUNOS_id_alunos AND d.CURSO_id_curso = m.CURSO_id_curso AND d.TEMPO_id_tempo = m.TEMPO_id_tempo AND d.INSTITUICAO_id_instituicao = m.INSTITUICAO_id_instituicao
JOIN ALUNOS a ON m.ALUNOS_id_alunos = a.id_alunos
JOIN CURSO c ON m.CURSO_id_curso = c.id_curso
JOIN TEMPO t ON m.TEMPO_id_tempo = t.id_tempo
GROUP BY CUBE(m.tipo_mensalidade, t.mes, a.sexo, FLOOR(a.idade / 10) * 10, c.nome);


----- Perfil do aluno desistente em relação à entrada na instituição:

SELECT 
    CASE WHEN m.tipo_mensalidade = 'integral' THEN 'Integral' ELSE 'Bolsista' END AS tipo_aluno,
    CASE WHEN a.tipo_entrada = 'vestibular' THEN 'Vestibular' ELSE 'Outro' END AS tipo_entrada,
    CASE WHEN a.qtde_graduacao = 0 THEN 'Primeira Graduação' ELSE 'Outra Graduação' END AS tipo_graduacao,
    COUNT(*) AS quantidade_desistentes,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM DESISTENCIA) * 100, 2) AS percentual_desistentes
FROM DESISTENCIA d
JOIN MATRICULA m ON d.ALUNOS_id_alunos = m.ALUNOS_id_alunos AND d.CURSO_id_curso = m.CURSO_id_curso AND d.TEMPO_id_tempo = m.TEMPO_id_tempo AND d.INSTITUICAO_id_instituicao = m.INSTITUICAO_id_instituicao
JOIN ALUNOS a ON m.ALUNOS_id_alunos = a.id_alunos
GROUP BY CUBE(m.tipo_mensalidade, a.tipo_entrada, a.qtde_graduacao);
