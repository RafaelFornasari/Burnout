USE Burnout;

CREATE TABLE generos (
generoId INT IDENTITY(1,1) PRIMARY KEY,
descricao varchar (30) NOT NULL,
createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
updatedAt DATETIME
);

CREATE TABLE faixasEtarias (
faixaEtariaId INT IDENTITY(1,1) PRIMARY KEY,
descricao varchar (30) NOT NULL,
createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
updatedAt DATETIME
);

CREATE TABLE temposDeServico (
tempoDeServicoId INT IDENTITY(1,1) PRIMARY KEY,
descricao varchar (30) NOT NULL,
createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
updatedAt DATETIME
);

CREATE TABLE categoriasProfissionais (
categoriaProfissionalId INT IDENTITY(1,1) PRIMARY KEY,
descricao varchar (30) NOT NULL,
createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
updatedAt DATETIME
);

CREATE TABLE departamentos (
departamentoId INT IDENTITY(1,1) PRIMARY KEY,
descricao varchar (30) NOT NULL,
createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
updatedAt DATETIME
);

CREATE TABLE comorbidades (
comorbidadeId INT IDENTITY(1,1) PRIMARY KEY,
descricao varchar (30) NOT NULL,
createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
updatedAt DATETIME
);

CREATE TABLE profissionais (
profissionalId INT IDENTITY(1,1) PRIMARY KEY,
generoId INT NOT NULL,
faixaEtariaId INT NOT NULL,
categoriaProfissionalId INT NOT NULL,
departamentoId INT NOT NULL,
tempoDeServicoId INT NOT NULL,
suportePsicologico BIT DEFAULT 0,
tratamentoIntensivo BIT DEFAULT 0,
covidPositivo BIT DEFAULT 0,
sintomaExaustao BIT DEFAULT 0,
protecaoNoTrabalho BIT DEFAULT 0,
createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
updatedAt DATETIME DEFAULT NULL,
CONSTRAINT fk_generos FOREIGN KEY (generoId) REFERENCES generos (generoId),
CONSTRAINT fk_faixasEtarias FOREIGN KEY (faixaEtariaId) REFERENCES faixasEtarias (faixaEtariaId),
CONSTRAINT fk_categoriasProfissionais FOREIGN KEY (categoriaProfissionalId) REFERENCES categoriasProfissionais (categoriaProfissionalId),
CONSTRAINT fk_departamentos FOREIGN KEY (departamentoId) REFERENCES departamentos (departamentoId),
CONSTRAINT fk_temposDeServico FOREIGN KEY (tempoDeServicoId) REFERENCES temposDeServico (tempoDeServicoId)
);

CREATE TABLE comorbidadesProfissionais(
profissionalId INT NOT NULL,
comorbidadeId INT NOT NULL,
CONSTRAINT fk_profissional FOREIGN KEY (profissionalId) REFERENCES profissionais (profissionalId),
CONSTRAINT fk_comorbidade FOREIGN KEY (comorbidadeId) REFERENCES comorbidades (comorbidadeId),
PRIMARY KEY (profissionalId, comorbidadeId)
);
