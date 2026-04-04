CREATE DATABASE conecta;
USE conecta;
CREATE TABLE usuarios(
	id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_nascimento DATE
) ;

INSERT INTO usuarios (id, nome, email, data_nascimento)
VALUES 
(1, 'Gabriel Barbosa', 'gabriel.barbosa@gmail.com', '2004-03-27'),
(2, 'Vitoria Brito', 'vitoria.brito@gmail.com', '2006-10-18'),
(3, 'Asafe Santos', 'asafe.santos@gmail.com', '2014-12-24');

SELECT *
FROM usuarios
WHERE data_nascimento > '2006-01-01';

UPDATE usuarios
SET email = 'gabriel.barbosa.dos.santos@gmail.com'
WHERE id = 1;

DELETE FROM usuarios
WHERE id = 3;
