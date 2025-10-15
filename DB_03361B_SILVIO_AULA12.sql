USE DB_03361B_SILVIO_AULA06;

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT
);

INSERT INTO Produtos (nome, preco, estoque) VALUES
('Pão Francês', 5.50, 150),
('Bolo de Chocolate', 35.00, 10),
('Sonho', 7.00, 45),
('Baguete', 8.50, 60);

SELECT * FROM Produtos;

UPDATE Produtos
SET preco = 6.00, estoque = 160
WHERE id_produtos = 1;

SELECT * FROM Produtos;

DELETE FROM Produtos
WHERE id_produtos = 3;

SELECT * FROM Produtos;