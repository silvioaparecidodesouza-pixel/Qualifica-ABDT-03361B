USE DB_03361B_SILVIO_AULA06;


CREATE TABLE Fornecedor (
 id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
 nome_fornecedor VARCHAR(100) NOT NULL,
 telefone VARCHAR(15),
 email VARCHAR(100) UNIQUE
);

CREATE TABLE Produto (
 id_produto INT PRIMARY KEY AUTO_INCREMENT,
 nome_produto VARCHAR(250) NOT NULL,
 valor_produto DECIMAL(10, 2),
 id_fornecedor INT,
 FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);


CREATE TABLE Vendas (
 id_venda INT PRIMARY KEY AUTO_INCREMENT,
 id_cliente INT,
 id_produto INT,
 quantidade INT NOT NULL,
 data_venda DATE,
 FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);


INSERT INTO Fornecedor (nome_fornecedor, telefone, email) 
VALUES 
('Faber-Castell Brasil', '(11) 9876-5432', 'contato@fabercastell.com'),
('Tilibra Indústria', '(19) 1234-5678', 'vendas@tilibra.com.br');

INSERT INTO Produto (nome_produto, valor_produto, id_fornecedor) 
VALUES 
('Lápis de Cor 12 Cores', 18.99, 1),
('Caneta Hidrográfica', 12.50, 1),
('Caderno Universitário 10 Matérias', 35.00, 2),
('Agenda 2025', 22.90, 2);

INSERT INTO Vendas (id_cliente, id_produto, quantidade, data_venda) 
VALUES 
(101, 3, 2, '2025-10-07'),
(102, 1, 1, '2025-10-07'),
(101, 4, 1, '2025-10-06');

SELECT * FROM Fornecedor;

SELECT * FROM Produto;

SELECT 
 V.data_venda, 
 V.id_cliente, 
 P.nome_produto, 
 V.quantidade, 
 F.nome_fornecedor
FROM 
 Vendas V
INNER JOIN 
 Produto P ON V.id_produto = P.id_produto
INNER JOIN 
 Fornecedor F ON P.id_fornecedor = F.id_fornecedor
ORDER BY 
 V.data_venda DESC;