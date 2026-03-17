CREATE DATABASE biblioteca_municipal;

USE biblioteca_municipal;

CREATE TABLE livros(
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150),
    autor VARCHAR(100),
    data_aquisicao DATE
);

INSERT INTO livros(titulo, autor, data_aquisicao)
VALUES('Dom Casmurro', 'Machado de Assis', '2023-05-10');

SELECT *
FROM livros
WHERE data_aquisicao > '2023-01-01';

UPDATE livros
SET autor = 'Machado de Assis (Edição Revisada)'
WHERE id = 1;

DELETE FROM livros
WHERE id = 1;
