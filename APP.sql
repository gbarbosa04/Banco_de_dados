CREATE DATABASE banco_de_dados;

USE banco_de_dados;

CREATE TABLE usuarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_nascimento DATE
);

INSERT INTO usuarios(nome, email, data_nascimento)
VALUES('Gabriel','gabrielbarbosa@gmail.com','2004-03-27');

UPDATE usuarios
SET email = 'gabriel.barb.dos.santos@gmail.com'
WHERE id = 1;

SELECT *
FROM usuarios;
