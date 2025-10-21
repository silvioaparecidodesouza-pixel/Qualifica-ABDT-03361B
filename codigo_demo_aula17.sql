USE DB_03361B_SILVIO_AULA06;

CREATE TABLE A17_Produto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    CHECK(preco > 0.0)
);

CREATE TABLE A17_Venda(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT fk_a17_venda_produto
    FOREIGN KEY (id_produto) REFERENCES A17_Produto(id),
    CHECK(quantidade > 0)
);

CREATE TABLE A17_Desconto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_faixa VARCHAR(50),
    qtd_min INT NOT NULL,
    qtd_max INT NOT NULL,
    desconto DECIMAL(3, 2),
    CHECK(desconto >= 0.0 AND desconto <= 1.0)
);

INSERT INTO A17_Produto (nome, preco) VALUES
('Pão Francês', 0.80),
('Pão de Queijo', 2.50),
('Croissant', 4.20),
('Bolo de Cenoura com Cobertura de Chocolate', 25.00),
('Sonho de Creme', 5.50),
('Torta de Frango', 38.00),
('Coxinha de Frango', 4.00),
('Empada de Palmito', 4.50),
('Biscoito Caseiro', 3.80),
('Café Expresso', 6.00);

INSERT INTO A17_Venda (id_produto, quantidade) VALUES
(1, 5),
(3, 2),
(5, 4),
(7, 6),
(2, 3),
(6, 8),
(8, 2),
(9, 5),
(1, 4),
(2, 1),
(3, 3),
(7, 7),
(8, 1),
(9, 2),
(5, 6),
(6, 3),
(1, 2),
(2, 5),
(3, 4),
(5, 7),
(6, 1),
(7, 3),
(8, 4),
(9, 6),
(1, 8),
(2, 2),
(3, 1),
(5, 5),
(6, 4),
(7, 6),
(8, 3),
(9, 1),
(1, 7),
(2, 4),
(3, 5),
(5, 2),
(6, 7),
(7, 1),
(8, 5),
(9, 8),
(1, 3),
(2, 6),
(3, 7),
(5, 8),
(6, 5),
(7, 2),
(8, 6),
(9, 3),
(1, 1),
(2, 8);

INSERT INTO A17_Desconto (nome_faixa, qtd_min, qtd_max, desconto) VALUES
("FAIXA C", 1, 5, 0.0),
("FAIXA B", 6, 10, 0.05),
("FAIXA A", 11, 999, 0.1);

SELECT
    P.nome AS Produto,
    COUNT(V.id) AS Total_Vendas
FROM
    A17_Produto AS P
LEFT JOIN
    A17_Venda AS V ON P.id = V.id_produto
GROUP BY
    P.nome
ORDER BY
    Total_Vendas DESC, P.nome;
    
    SELECT
    V.id AS ID_Venda,
    P.nome AS Produto,
    V.quantidade AS Quantidade_Vendida,
    P.preco AS Preco_Unitario,
    D.nome_faixa AS Faixa_Desconto,
    D.desconto AS Porcentagem_Desconto,
    (V.quantidade * P.preco) AS Valor_Bruto,
    (V.quantidade * P.preco * D.desconto) AS Valor_Desconto,
    (V.quantidade * P.preco) - (V.quantidade * P.preco * D.desconto) AS Valor_Liquido
FROM
    A17_Venda AS V
JOIN
    A17_Produto AS P ON V.id_produto = P.id
JOIN
    A17_Desconto AS D ON V.quantidade BETWEEN D.qtd_min AND D.qtd_max
ORDER BY
    ID_Venda;