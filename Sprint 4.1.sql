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

-- Passo 11
ALTER TABLE projetos
ADD status VARCHAR(20);

-- Passo 12
UPDATE projetos 
SET status = 'Em andamento';

-- Passo 13
CREATE TABLE desenvolvedores (
    id_dev INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    senioridade VARCHAR(30),
    id_projeto INT,
    FOREIGN KEY (id_projeto) REFERENCES projetos(id)
);

-- Passo 14
INSERT INTO desenvolvedores (nome, senioridade, id_projeto) VALUES 
('Lucas Souza', 'Sênior', 1),
('Mariana Lima', 'Pleno', 2),
('João Pedro', 'Júnior', 4),
('Beatriz Silva', 'Pleno', 5);

-- Passo 15
SELECT 
	nome_projeto,
    orcamento
FROM projetos
WHERE linguagem = 'Python' OR orcamento > 15000.00;

-- Passo 16
SELECT * FROM projetos 
WHERE nome_projeto LIKE 'Sistema%';

-- Passo 17
SELECT 
    d.nome AS nome_desenvolvedor, 
    d.senioridade, 
    p.nome_projeto
FROM desenvolvedores AS d
JOIN projetos AS p
	ON d.id_projeto = p.id;

-- Passo 18
SELECT
	nome_projeto,
    orcamento 
FROM projetos 
WHERE orcamento = (SELECT MAX(orcamento) FROM projetos);

-- Passo 19
DROP TABLE IF EXISTS teste_tabelas;

-- Passo 20
SELECT 
    p.nome_projeto, 
    COUNT(d.id_dev) AS total_desenvolvedores
FROM projetos AS p
LEFT JOIN desenvolvedores AS d 
	ON p.id = d.id_projeto
GROUP BY p.nome_projeto;
