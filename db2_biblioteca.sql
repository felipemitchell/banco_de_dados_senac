CREATE DATABASE LivrariaLeituraCompanhia;

USE LivrariaLeituraCompanhia;

CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor_id INT,
    categoria_id INT,
    preco DECIMAL(10,2),
    estoque INT,
    FOREIGN KEY (autor_id) REFERENCES Autores(id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE ItensPedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    livro_id INT,
    quantidade INT,
    preco DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (livro_id) REFERENCES Livros(id)
);

INSERT INTO Autores (nome) VALUES 
('Clarice Lispector'),
('George Orwell'),
('J.K. Rowling'),
('Stephen King'),
('Monteiro Lobato');

INSERT INTO Categorias (nome) VALUES 
('Ficção'),
('Romance'),
('Fantasia'),
('Suspense'),
('Infantil');

INSERT INTO Livros (titulo, autor_id, categoria_id, preco, estoque) VALUES 
('A Hora da Estrela', 1, 2, 35.90, 50),
('1984', 2, 1, 42.50, 30),
('Harry Potter', 3, 3, 49.90, 100),
('O Iluminado', 4, 4, 55.00, 25),
('Reinações de Narizinho', 5, 5, 29.90, 80);

INSERT INTO Clientes (nome, email) VALUES 
('Maria Silva', 'maria@email.com'),
('João Santos', 'joao@email.com'),
('Ana Oliveira', 'ana@email.com');

INSERT INTO Pedidos (cliente_id, data_pedido, total) VALUES 
(1, '2024-01-15', 85.80),
(2, '2024-01-16', 42.50),
(1, '2024-01-17', 89.70);

INSERT INTO ItensPedido (pedido_id, livro_id, quantidade, preco) VALUES 
(1, 1, 1, 35.90),
(1, 3, 1, 49.90),
(2, 2, 1, 42.50),
(3, 5, 3, 29.90);

