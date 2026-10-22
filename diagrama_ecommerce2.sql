-- Teste 1: Cliente PF
INSERT INTO Cliente (email, telefone, tipo_cliente) VALUES ('joao@email.com', '11999999999', 'PF') RETURNING id_cliente;
INSERT INTO Pessoa_Fisica (id_cliente, cpf, nome, data_nascimento) VALUES (1, '123.456.789-00', 'João Silva', '1990-05-15');

-- Cadastrando dois pagamentos para o João (Múltiplas Formas)
INSERT INTO Pagamento (id_cliente, tipo_pagamento, detalhes) VALUES (1, 'Cartão de Crédito', 'Cartão Final 1234');
INSERT INTO Pagamento (id_cliente, tipo_pagamento, detalhes) VALUES (1, 'PIX', 'Chave CPF');

-- Teste 2: Cliente PJ
INSERT INTO Cliente (email, telefone, tipo_cliente) VALUES ('contato@empresa.com', '1133334444', 'PJ') RETURNING id_cliente;
INSERT INTO Pessoa_Juridica (id_cliente, cnpj, razao_social, nome_fantasia) VALUES (2, '12.345.678/0001-99', 'Empresa X LTDA', 'Tech X');

-- Teste 3: Pedido e Entrega
INSERT INTO Pedido (id_cliente, status_pedido, valor_total) VALUES (1, 'Pago', 250.00);
INSERT INTO Entrega (id_pedido, codigo_rastreio, status_entrega) VALUES (1, 'BR123456789BR', 'Em Trânsito');
