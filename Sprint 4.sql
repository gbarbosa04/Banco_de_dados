-- passo 1
CREATE DATABASE techforge;
USE techforge;

-- passo 2
CREATE TABLE projetos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_projeto VARCHAR(100),
    linguagem VARCHAR(50),
    orcamento DECIMAL(10, 2),
    data_inicio DATE
);

-- passo 3
INSERT INTO projetos (nome_projeto, linguagem, orcamento, data_inicio)
VALUES 
('Motor de Física', 'C++', 15000.00, '2023-10-01'),
('App Mobile Store', 'Python', 12000.50, '2023-11-15'),
('Otimização de Consultas', 'SQL', 8000.00, '2024-01-10'),
('IA Preditiva', 'Python', 25000.00, '2024-02-20'),
('Sistema Embarcado', 'C++', 9500.00, '2023-09-05');

-- passo 4
SELECT
	nome_projeto,
    orcamento
FROM projetos
WHERE linguagem = 'C++';

-- passo 5
UPDATE projetos
SET orcamento = 18000
WHERE id = 1;

-- passo 6
DELETE FROM projetos
WHERE id = 3;
SELECT * FROM projetos;

-- passo 7
SELECT
	COUNT(*) as qtde_projetos,
    AVG(orcamento) as orcamento_medio
FROM projetos;

-- passo 8
SELECT
	linguagem,
    count(*) as qtde_projetos
FROM projetos
GROUP BY linguagem;

-- passo 9
SELECT
	linguagem,
    SUM(orcamento) as total_orcamento
FROM projetos
GROUP BY linguagem
HAVING total_orcamento > 20000;

-- passo 10
SELECT
	nome_projeto,
    orcamento
FROM projetos
ORDER BY orcamento DESC;
