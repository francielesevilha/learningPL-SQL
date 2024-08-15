CREATE TABLE CLIENTE (
  id_cliente INT NOT NULL,
  nome VARCHAR(120) NULL,
  sexo VARCHAR(45) NULL,
  cpf VARCHAR(11) NULL,
  PRIMARY KEY (id_cliente)
);


CREATE TABLE BANCO (
  id_banco INT NOT NULL,
  nome VARCHAR(45) NULL,
  agencia INT NULL,
  local VARCHAR(45) NULL,
  PRIMARY KEY (id_banco)
);


CREATE TABLE CONTA (
  id_conta INT NOT NULL,
  num_conta INT NULL,
  data_abertura DATE NULL,
  CLIENTE_id_cliente INT NOT NULL,
  BANCO_id_banco INT NOT NULL,
  PRIMARY KEY (id_conta),
  CONSTRAINT fk_CONTA_CLIENTE FOREIGN KEY (CLIENTE_id_cliente) REFERENCES (id_cliente),
  CONSTRAINT fk_CONTA_BANCO FOREIGN KEY (BANCO_id_banco) REFERENCES  (id_banco)
);


CREATE TABLE TRANSACAO (
  id_transacao INT NOT NULL,
  data_hora DATETIME NULL,
  descricao VARCHAR(120) NULL,
  valor FLOAT NULL,
  CLIENTE_id_cliente INT NOT NULL,
  BANCO_id_banco INT NOT NULL,
  CONTA_id_conta INT NOT NULL,
  PRIMARY KEY (id_transacao),
  CONSTRAINT fk_TRANSACAO_CLIENTE FOREIGN KEY (CLIENTE_id_cliente) REFERENCES (id_cliente),
  CONSTRAINT fk_TRANSACAO_BANCO1 FOREIGN KEY (BANCO_id_banco) REFERENCES (id_banco),
  CONSTRAINT fk_TRANSACAO_CONTA1 FOREIGN KEY (CONTA_id_conta) REFERENCES (id_conta)
);
  

