USE ecommerce_db;

-- Categorias
INSERT INTO categoria (nome, descricao) VALUES
('eletronicos', 'Aparelhos e acessórios'),
('livros', 'Livros em geral'),
('informatica', 'Periféricos e TI');

-- Produtos
INSERT INTO produto (id_categoria, nome, descricao, preco, ativo) VALUES
(1, 'fone_bluetooth', 'Fone sem fio básico', 99.90, 1),
(1, 'webcam_hd', 'Webcam 720p', 129.90, 1),
(3, 'mouse_optico', 'Mouse óptico USB', 49.90, 1),
(2, 'livro_sql', 'Livro: SQL do zero', 79.90, 1);

-- Clientes
INSERT INTO cliente (nome, email, telefone, cpf) VALUES
('Maria Silva', 'maria.silva@example.com', '11999990000', '123.456.789-00'),
('João Souza', 'joao.souza@example.com', '21988887777', '987.654.321-00');

-- Pedido da Maria (id_cliente = 1)
INSERT INTO pedido (id_cliente, status, observacoes)
VALUES (1, 'aberto', 'Entrega padrão');

-- Descobrir id_pedido gerado para a Maria:
-- (em execução manual, veja o ID gerado pelo AUTO_INCREMENT; aqui assumimos id_pedido = 1)

-- Itens do pedido 1
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario_venda) VALUES
(1, 1, 1, 99.90),   -- 1x fone_bluetooth
(1, 4, 2, 79.90);   -- 2x livro_sql

-- Pagamento do pedido 1 (total = 99.90 + 2*79.90 = 259.70)
INSERT INTO pagamento (id_pedido, valor, metodo, status, data_pagamento) VALUES
(1, 259.70, 'pix', 'aprovado', NOW());

-- Pedido do João (id_cliente = 2)
INSERT INTO pedido (id_cliente, status, observacoes)
VALUES (2, 'aberto', 'Retirar na loja');

-- Itens do pedido 2 (assumindo id_pedido = 2)
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario_venda) VALUES
(2, 2, 1, 129.90),  -- 1x webcam_hd
(2, 3, 1, 49.90);   -- 1x mouse_optico

-- Pagamento (pendente) do pedido 2 (total = 179.80)
INSERT INTO pagamento (id_pedido, valor, metodo, status, data_pagamento) VALUES
(2, 179.80, 'cartao', 'pendente', NULL);
