USE ecommerce_db;

-- UPDATES =========================


-- Atualizar preço de um produto específico (WHERE por nome)
UPDATE produto
SET preco = preco + 10.00
WHERE nome = 'mouse_optico' AND ativo = 1;

-- Marcar pagamento como aprovado e registrar data (WHERE por status)
UPDATE pagamento
SET status = 'aprovado',
    data_pagamento = NOW()
WHERE id_pedido = 2 AND status = 'pendente';

-- Atualizar status do pedido para 'pago' se pagamento aprovado
UPDATE pedido pe
JOIN pagamento pa ON pa.id_pedido = pe.id_pedido
SET pe.status = 'pago'
WHERE pa.status = 'aprovado'
  AND pe.status <> 'pago';

-- Atualizar telefone do cliente por email
UPDATE cliente
SET telefone = '11988880000'
WHERE email = 'maria.silva@example.com';


-- DELETES =========================

-- Remover todos os itens do pedido 2
-- (mantém regra UNIQUE, mas serve de exemplo prático)
DELETE FROM item_pedido
WHERE id_pedido = 2
 
-- Apagar pagamento recusado de pedido cancelado (exemplo condicional)
-- primeiro simulamos um cancelamento:
UPDATE pedido SET status = 'cancelado' WHERE id_pedido = 2 AND status <> 'cancelado';

DELETE pa FROM pagamento pa
JOIN pedido pe ON pe.id_pedido = pa.id_pedido
WHERE pe.status = 'cancelado'
  AND pa.status = 'recusado';

-- D3) Excluir cliente “teste” sem pedidos (condição garante integridade)
DELETE FROM cliente
WHERE email = 'teste@example.com'
  AND id_cliente NOT IN (SELECT id_cliente FROM pedido);


