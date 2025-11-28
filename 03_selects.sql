USE ecommerce_db;

-- 1) Listar produtos com categoria (JOIN) e ordenar por preço desc
SELECT p.id_produto, p.nome AS produto, c.nome AS categoria, p.preco
FROM produto p
JOIN categoria c ON c.id_categoria = p.id_categoria
ORDER BY p.preco DESC;

-- 2) Pedidos com total calculado (JOIN + GROUP BY)
SELECT
  pe.id_pedido,
  cl.nome AS cliente,
  SUM(ip.quantidade * ip.preco_unitario_venda) AS total_itens,
  pa.valor AS valor_pagamento,
  pa.status AS status_pagamento
FROM pedido pe
JOIN cliente cl ON cl.id_cliente = pe.id_cliente
LEFT JOIN item_pedido ip ON ip.id_pedido = pe.id_pedido
LEFT JOIN pagamento pa ON pa.id_pedido = pe.id_pedido
GROUP BY pe.id_pedido, cl.nome, pa.valor, pa.status
ORDER BY pe.id_pedido;

-- 3) Itens de um pedido específico (WHERE + JOIN)
SELECT pe.id_pedido, p.nome AS produto, ip.quantidade, ip.preco_unitario_venda
FROM item_pedido ip
JOIN produto p ON p.id_produto = ip.id_produto
JOIN pedido pe ON pe.id_pedido = ip.id_pedido
WHERE pe.id_pedido = 1
ORDER BY p.nome;

-- 4) Top 3 produtos mais vendidos (GROUP BY + ORDER BY + LIMIT)
SELECT
  p.id_produto,
  p.nome,
  SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
JOIN produto p ON p.id_produto = ip.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY total_vendido DESC
LIMIT 3;

-- 5) Pedidos com pagamento pendente (WHERE)
SELECT pe.id_pedido, cl.nome AS cliente, pa.valor, pa.status
FROM pedido pe
JOIN cliente cl ON cl.id_cliente = pe.id_cliente
JOIN pagamento pa ON pa.id_pedido = pe.id_pedido
WHERE pa.status = 'pendente'
ORDER BY pe.id_pedido;
