---CRIAÇÃO DA TABELA ALUNO
CREATE TABLE ALUNO (
  RA INT PRIMARY KEY,
  nome VARCHAR2(240) NULL,
);

---CRIAÇÃO DA TABELA PROFESSOR
CREATE TABLE PROFESSOR (
  id_professor INT PRIMARY KEY,
  nome VARCHAR2(240) NULL,
);

---CRIAÇÃO DA TABELA BANCA
CREATE TABLE BANCA (
  id_banca INT PRIMARY KEY,
  nota FLOAT,
  PROFESSOR_id_professor INT NOT NULL,
  CONSTRAINT fk_BANCA_PROFESSOR FOREIGN KEY (PROFESSOR_id_professor) REFERENCES PROFESSOR (id_professor)
);

---CRIAÇÃO DA TABELA TCC
CREATE TABLE TCC (
  id_tcc INT PRIMARY KEY,
  titulo VARCHAR2(45) NULL,
  resumo VARCHAR2(45) NULL,
  palavras_chaves VARCHAR2(240) NULL,
  qnt_paginas INT NULL,
  nome_arquivo VARCHAR2(120) NULL,
  PROFESSOR_id_professor INT NOT NULL,
  BANCA_id_banca INT NOT NULL,
  CONSTRAINT fk_TCC_PROFESSOR FOREIGN KEY (PROFESSOR_id_professor) REFERENCES PROFESSOR (id_professor),
  CONSTRAINT fk_TCC_BANCA FOREIGN KEY (BANCA_id_banca) REFERENCES BANCA (id_banca)
);

---CRIAÇÃO DA TABELA ALUNO_TCC
CREATE TABLE ALUNO_TCC (
  id_alunotcc INT PRIMARY KEY,
  aluno VARCHAR2(240) NOT NULL,
  aluno2 VARCHAR2(240) NULL,
  ALUNO_RA INT NOT NULL,
  TCC_id_tcc INT NOT NULL,
  CONSTRAINT fk_ALUNO_TCC_ALUNO FOREIGN KEY (ALUNO_RA) REFERENCES ALUNO (RA),
  CONSTRAINT fk_ALUNO_TCC_TCC FOREIGN KEY (TCC_id_tcc) REFERENCES TCC (id_tcc)
);

---CRIAÇÃO DA TABELA CURSO
CREATE TABLE CURSO (
  id_curso INT PRIMARY KEY,
  nome VARCHAR2(240) NULL,
);

---CRIAÇÃO DA TABELA MATRICULA
CREATE TABLE MATRICULA (
  id_matricula INT PRIMARY KEY,
  semestre INT NULL,
  ano_inicio DATE NULL,
  ano_fim DATE NULL,
  status VARCHAR2(120) NULL,
  CURSO_id_curso INT NOT NULL,
  ALUNO_RA INT NOT NULL,
  CONSTRAINT fk_MATRICULA_CURSO FOREIGN KEY (CURSO_id_curso) REFERENCES CURSO (id_curso),
  CONSTRAINT fk_MATRICULA_ALUNO FOREIGN KEY (ALUNO_RA) REFERENCES ALUNO (RA)
);