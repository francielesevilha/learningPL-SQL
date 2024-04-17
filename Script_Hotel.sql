--- FRANCIELE DE ALMEIDA SEVILHA
--- JONATHAS PEREIRA GONÇALVES
--- MIRIÃ ALVES DOS SANTOS 

CREATE TABLE
  PROFISSAO (
    id_profissao INT NOT NULL,
    nome VARCHAR(45) NULL,
    PRIMARY KEY (id_profissao)
  );

CREATE TABLE
  TEMPO (
    id_tempo INT NOT NULL,
    dia INT NULL,
    mes INT NULL,
    ano INT NULL,
    local INT NULL,
    PRIMARY KEY (id_tempo)
  );

CREATE TABLE
  APARTAMENTOS (
    id_apartamentos INT NOT NULL,
    tipo VARCHAR(45) NULL,
    PRIMARY KEY (id_apartamentos)
  );

CREATE TABLE
  agencia (
    id_agencia INT NOT NULL,
    nome VARCHAR(45) NULL,
    PRIMARY KEY (id_agencia)
  );

CREATE TABLE
  LOCAL (
    id_local INT NOT NULL,
    cidade VARCHAR(45) NULL,
    estado VARCHAR(45) NULL,
    pais VARCHAR(45) NULL,
    PRIMARY KEY (id_local)
  );

CREATE TABLE
  HOSPEDAGEM (
    id_reserva INT NOT NULL,
    data_entrada DATETIME NULL,
    data_prevista DATE NULL,
    periodo_hospedagem DATE NULL,
    feito_por VARCHAR(45) NULL,
    PROFISSAO_id_profissao INT NOT NULL,
    APARTAMENTOS_id_apartamentos INT NOT NULL,
    TEMPO_id_tempo INT NOT NULL,
    valor FLOAT NULL,
    agencia_id_agencia INT NOT NULL,
    transporte VARCHAR(45) NULL,
    LOCAL_id_local INT NOT NULL,
    PRIMARY KEY (id_reserva),
    CONSTRAINT fk_HOSPEDAGEM_PROFISSAO FOREIGN KEY (PROFISSAO_id_profissao) REFERENCES PROFISSAO (id_profissao),
    CONSTRAINT fk_HOSPEDAGEM_APARTAMENTOS FOREIGN KEY (APARTAMENTOS_id_apartamentos) REFERENCES APARTAMENTOS (id_apartamentos),
    CONSTRAINT fk_HOSPEDAGEM_TEMPO FOREIGN KEY (TEMPO_id_tempo) REFERENCES TEMPO (id_tempo),
    CONSTRAINT fk_HOSPEDAGEM_agencia FOREIGN KEY (agencia_id_agencia) REFERENCES agencia (id_agencia),
    CONSTRAINT fk_HOSPEDAGEM_LOCAL FOREIGN KEY (LOCAL_id_local) REFERENCES LOCAL (id_local)
  );

CREATE TABLE
  SERVICOS (
    id_servicos INT NOT NULL,
    tipo VARCHAR(45) NULL,
    nome_serviço VARCHAR(120) NULL,
    gastos VARCHAR(45) NULL,
    PRIMARY KEY (id_servicos)
  );

CREATE TABLE
  PRODUTO (
    id_produto INT NOT NULL,
    nome VARCHAR(120) NULL,
    PRIMARY KEY (id_produto)
  );

CREATE TABLE
  CONSUMO (
    id_consumo INT NOT NULL,
    NOTA_ESTADIA_id_nota INT NOT NULL,
    NOTA_SERVICO_id_nota INT NOT NULL,
    PROFISSAO_id_profissao INT NOT NULL,
    APARTAMENTOS_id_apartamentos INT NOT NULL,
    TEMPO_id_tempo INT NOT NULL,
    PRODUTO_id_produto INT NOT NULL,
    SERVICOS_id_servicos INT NOT NULL,
    PRIMARY KEY (id_consumo),
    CONSTRAINT fk_CONSUMO_PROFISSAO1 FOREIGN KEY (PROFISSAO_id_profissao) REFERENCES PROFISSAO (id_profissao),
    CONSTRAINT fk_CONSUMO_APARTAMENTOS1 FOREIGN KEY (APARTAMENTOS_id_apartamentos) REFERENCES APARTAMENTOS (id_apartamentos),
    CONSTRAINT fk_CONSUMO_TEMPO1 FOREIGN KEY (TEMPO_id_tempo) REFERENCES TEMPO (id_tempo),
    CONSTRAINT fk_CONSUMO_PRODUTO1 FOREIGN KEY (PRODUTO_id_produto) REFERENCES PRODUTO (id_produto),
    CONSTRAINT fk_CONSUMO_SERVICOS1 FOREIGN KEY (SERVICOS_id_servicos) REFERENCES SERVICOS (id_servicos)
  );