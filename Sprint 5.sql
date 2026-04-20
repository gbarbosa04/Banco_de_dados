CREATE TABLE IF NOT EXISTS projetos (
id_projeto INT PRIMARY KEY AUTO_INCREMENT,
nome_projeto VARCHAR(100),
orcamento DECIMAL(15,2),
linguagem VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS desenvolvedores (
id_dev INT PRIMARY KEY AUTO_INCREMENT,
nome_dev VARCHAR(100),
senioridade VARCHAR(30),
id_projeto INT,
FOREIGN KEY (id_projeto) REFERENCES projetos(id_projeto)
);

INSERT INTO projetos (nome_projeto, orcamento, linguagem) VALUES
('Sistema de Vendas', 20000.00, 'Python'),
('Portal Interno', 12000.00, 'PHP'),
('App Mobile', 50000.00, 'Javascript');

INSERT INTO desenvolvedores (nome_dev, senioridade, id_projeto) VALUES
('Alice', 'Sênior', 1), ('Bob', 'Pleno', 1),
('Charlie', 'Júnior', 2), ('Davi', 'Sênior', 3);

-- Passo 2
CREATE VIEW v_equipes_projetos AS
SELECT 
    d.nome_dev, 
    p.nome_projeto
FROM desenvolvedores AS d
JOIN projetos AS p
	ON d.id_projeto = p.id_projeto;

-- Passo 3
CREATE VIEW v_contagem_devs AS
SELECT 
    p.nome_projeto, 
    COUNT(d.id_dev) AS total_desenvolvedores
FROM projetos AS p
LEFT JOIN desenvolvedores AS d
	ON p.id_projeto = d.id_projeto
GROUP BY p.nome_projeto;

-- Passo 4
CREATE VIEW v_projetos_premium AS
SELECT 
    nome_projeto, 
    orcamento
FROM projetos
WHERE orcamento > (SELECT AVG(orcamento) FROM projetos);

-- Passo 5
DROP VIEW v_rascunho_financeiro;
