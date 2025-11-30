USE ecommerce_db;

CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255)
);

CREATE TABLE produto (
  id_produto INT AUTO_INCREMENT PRIMARY KEY,
  id_categoria INT NOT NULL,
  nome VARCHAR(120) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10,2) NOT NULL,
  ativo TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  email VARCHAR(150) NOT NULL,
  telefone VARCHAR(20),
  cpf VARCHAR(14),
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedido (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20),
  observacoes VARCHAR(255),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
  id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario_venda DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE pagamento (
  id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  metodo VARCHAR(20),
  status VARCHAR(20),
  data_pagamento DATETIME,
  FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);
