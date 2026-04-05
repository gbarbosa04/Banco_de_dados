CREATE DATABASE biblioteca_municipal;

USE biblioteca_municipal;

CREATE TABLE livros (
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    autor VARCHAR(100),
    data_aquisicao DATE
);

INSERT INTO livros (titulo, autor, data_aquisicao)
VALUES
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', '2026-03-30'),
('1984', 'George Orwel', '2026-03-30');

SELECT * FROM livros;

UPDATE livros
SET autor = "George Orwell"
WHERE id = 3;

DELETE FROM livros
WHERE id = 2;

SELECT * FROM livros;
