-- 1. Tabela Cliente (Geral)
CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    tipo_cliente VARCHAR(2) NOT NULL CHECK (tipo_cliente IN ('PF', 'PJ'))
);

-- 2. Especialização Pessoa Física (CPF)
CREATE TABLE Pessoa_Fisica (
    id_cliente INT PRIMARY KEY REFERENCES Cliente(id_cliente) ON DELETE CASCADE,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE
);

-- 3. Especialização Pessoa Jurídica (CNPJ)
CREATE TABLE Pessoa_Juridica (
    id_cliente INT PRIMARY KEY REFERENCES Cliente(id_cliente) ON DELETE CASCADE,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(100)
);

-- 4. Tabela de Pagamentos (Múltiplos pagamentos por cliente)
CREATE TABLE Pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL REFERENCES Cliente(id_cliente) ON DELETE CASCADE,
    tipo_pagamento VARCHAR(30) NOT NULL, -- 'Cartao', 'PIX', 'Boleto'
    detalhes VARCHAR(255)
);

-- 5. Tabela de Pedidos
CREATE TABLE Pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL REFERENCES Cliente(id_cliente),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pedido VARCHAR(30) DEFAULT 'Pendente',
    valor_total DECIMAL(10, 2) NOT NULL
);

-- 6. Tabela de Entrega (Status e Rastreio)
CREATE TABLE Entrega (
    id_entrega SERIAL PRIMARY KEY,
    id_pedido INT UNIQUE NOT NULL REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
    codigo_rastreio VARCHAR(50) UNIQUE NOT NULL,
    status_entrega VARCHAR(30) NOT NULL DEFAULT 'Em Processamento',
    data_envio TIMESTAMP
);
