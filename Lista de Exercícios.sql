CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;
-- DDL: Criando as tabelas (A Estrutura)
CREATE TABLE Medicos (
id_medico INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
especialidade VARCHAR(50)
);
CREATE TABLE Pacientes (
id_paciente INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
data_nascimento DATE
);
-- Entidade Associativa para resolver o relacionamento n:n
CREATE TABLE Consultas (
id_consulta INT PRIMARY KEY AUTO_INCREMENT,
id_medico INT,
id_paciente INT,
data_hora DATETIME,
valor_consulta DECIMAL(10,2),
CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico),
CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente)
);
-- DML: Populando dados para os exercícios
INSERT INTO Medicos VALUES (1, 'Dr. Arnaldo', 'Cardiologia'), (2, 'Dra. Beatriz', 'Pediatria'), (3, 'Dr. Carlos',
'Cardiologia');
INSERT INTO Pacientes VALUES (101, 'Ana Silva', '1990-05-15'), (102, 'Bruno Costa', '2012-10-20'), (103,
'Carla Souza', '1985-12-01');
INSERT INTO Consultas (id_medico, id_paciente, data_hora, valor_consulta) VALUES
(1, 101, '2026-04-10 10:00:00', 300.00),
(1, 103, '2026-04-11 14:00:00', 250.00),
(2, 102, '2026-04-12 09:00:00', 200.00),
(3, 101, '2026-04-13 11:00:00', 350.00);

SELECT * FROM medicos;
SELECT * FROM pacientes;
SELECT * FROM consultas;

-- Exercício 1
ALTER TABLE Medicos
ADD crm VARCHAR(20);

-- Exercício 2
UPDATE Pacientes
SET nome = "Bruno Ferreira"
WHERE id_paciente = 102;

-- Exercício 3
SELECT
	nome,
    especialidade
FROM medicos
WHERE especialidade <> "Pediatria";

-- Exercício 4
SELECT * FROM pacientes
ORDER BY nome ASC;

-- Exercício 5
SELECT
	m.nome as NOME_MEDICO,
    p.nome as NOME_PACIENTE,
    c.data_hora as DATA_HORA
FROM consultas as c
JOIN medicos as m
	ON c.id_medico = m.id_medico
JOIN pacientes as p
	ON c.id_paciente = p.id_paciente;
	
-- Exercício 6
SELECT 
	m.nome as NOME_MEDICO,
    c.data_hora as DATA_HORA
FROM medicos AS m
LEFT JOIN consultas AS c
	ON m.id_medico = c.id_medico;
    
-- Exercício 7
SELECT
	SUM(valor_consulta) AS FATURAMENTO,
    COUNT(*) AS QTDE_CONSULTAS
FROM consultas;

-- Exercício 8
SELECT
	m.especialidade AS ESPECIALIDADE,
    SUM(c.valor_consulta) AS FATURAMENTO
FROM medicos AS m
LEFT JOIN consultas AS c
	ON m.id_medico = c.id_medico
GROUP BY m.especialidade
HAVING FATURAMENTO > 400;

-- Exercício 9
SELECT
	*
FROM consultas
WHERE valor_consulta > (SELECT 
			AVG(valor_consulta) FROM consultas);
            
-- Exercício 10
CREATE VIEW v_resumo_atendimento AS
SELECT
	m.nome AS NOME_MEDICO,
    COUNT(DISTINCT id_paciente) AS TOTAL_PACIENTES_UNICOS
FROM medicos AS m
LEFT JOIN consultas as C
	ON m.id_medico = c.id_medico
GROUP BY
	NOME_MEDICO;
