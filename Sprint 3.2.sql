-- ativ1
CREATE DATABASE TechMinds;
USE TechMinds;

-- ativ2
CREATE TABLE colaboradores(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_func VARCHAR(100),
    email VARCHAR(100),
    departamento VARCHAR(50),
    salario INT,
    data_admissao DATE
);

-- ativ3
INSERT INTO colaboradores (nome_func, email, departamento, salario, data_admissao)
VALUES 
('Roberto Dias', 'roberto.dias@gmail.com', 'Desenvolvimento', 5500, '2022-03-10'),
('Mariana Souza', 'mariana.s@gmail.com', 'Marketing', 4500, '2023-01-15'),
('Carlos Lima', 'carlos.l@gmail.com', 'Vendas', 3800, '2023-05-20'),
('Ana Paula', 'ana.paula@gmail.com', 'Desenvolvimento', 7200, '2021-11-05'),
('Beatriz Silva', 'beatriz.s@gmail.com', 'Marketing', 6500, '2022-08-12'),
('Ricardo Melo', 'ricardo.m@gmail.com', 'Vendas', 4200, '2023-02-28');

-- ativ4
SELECT
	nome_func,
    email
FROM colaboradores
WHERE salario > 6000;

-- ativ5
UPDATE colaboradores
SET salario = 6000
WHERE id = 1;



-- ativ6
SELECT * FROM colaboradores;
DELETE FROM colaboradores
WHERE id = 2;

-- ativ7
SELECT
	count(*),
    AVG(salario) as media_salarial
FROM colaboradores;

-- ativ8
SELECT
	departamento,
	count(*)
FROM colaboradores
GROUP BY departamento;

-- ativ9
SELECT
	departamento,
    MAX(salario) AS maior_salario,
    MIN(salario) AS menor_salario
FROM colaboradores
GROUP BY departamento;

-- ativ10
SELECT
	departamento,
    SUM(salario) as salario_total
FROM colaboradores
WHERE data_admissao < '2023-12-31'
GROUP BY departamento
HAVING salario_total > 10000;
