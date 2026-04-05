-- ex1
CREATE DATABASE MegaStore;
USE MegaStore;

-- ex2
CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco INT,
    estoque INT,
    data_cadastro DATE
);

-- ex3
INSERT INTO produtos (produto, categoria, preco, estoque, data_cadastro)
VALUES 
('Smartphone X', 'Eletrônicos', 2500, 15, '2023-05-10'),
('Cadeira Gamer', 'Móveis', 1200, 20, '2023-08-15'),
('Fone Bluetooth', 'Acessórios', 300, 50, '2023-01-20'),
('Monitor 4K', 'Eletrônicos', 1800, 10, '2024-02-05'),
('Mochila para Notebook', 'Acessórios', 250, 40, '2023-03-12');

-- ex4
SELECT
	produto,
    preco
FROM produtos
WHERE preco > 1000;

-- ex5
UPDATE produtos
SET preco = 1350
WHERE id = 2;

-- ex6
DELETE FROM produtos
WHERE id = 5;

-- ex7
SELECT
	COUNT(*) as qtde_produtos,
    AVG(preco) as media_precos
FROM produtos;

-- ex8

SELECT
	categoria,
    MAX(preco) as produto_mais_caro,
    MIN(preco) as produto_mais_barato
FROM produtos
GROUP BY categoria;

-- ex9
SELECT
	categoria,
    SUM(estoque) as estoque_total
FROM produtos
GROUP BY categoria
HAVING estoque_total > 30;

-- ex10
SELECT
	categoria,
    SUM(estoque) as estoque_total
FROM produtos
GROUP BY categoria;

-- regra 1
SELECT
	categoria,
    SUM(estoque) as estoque_total
FROM produtos
WHERE data_cadastro < '2023-12-31'
GROUP BY categoria
HAVING estoque_total < 60;
