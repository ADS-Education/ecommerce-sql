# ecommerce-sql

## Arquivos

- `00_create_database.sql` → cria o database `ecommerce_db` (utf8mb4)
- `01_create_table.sql` → tabelas (categoria, produto, cliente, pedido, item_pedido, pagamento)
- `02_inserts.sql` → dados de exemplo (INSERT)
- `03_selects.sql` → 5 consultas com WHERE, ORDER BY, LIMIT, JOIN, GROUP BY
- `04_updates_deletes.sql` → pelo menos 3 UPDATEs e 3 DELETEs com condições


## Requisitos

- MySQL
- Usuário com permissão para criar database

## Executar
mysql -u root -p

# 1) Crie o banco
00_create_database.sql

# 2) Crie as tabelas
01_create_table.sql

# 3) Popule com dados
02_inserts.sql

# 4) Rode as consultas de exemplo
03_selects.sql

# 5) Teste os UPDATE/DELETE
04_updates_deletes.sql
