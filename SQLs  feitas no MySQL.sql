CREATE TABLE Cliente (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Cidade VARCHAR(50),
    UF CHAR(2)
);

CREATE TABLE Produto (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(100) NOT NULL,
    PrecoVenda DECIMAL(10, 2) NOT NULL
);

CREATE TABLE PedidoDadosGerais (
    NumeroPedido INT PRIMARY KEY AUTO_INCREMENT,
    DataEmissao DATE NOT NULL,
    CodigoCliente INT,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CodigoCliente) REFERENCES Cliente(Codigo)
);

CREATE TABLE ProdutosDoPedido (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NumeroPedido INT,
    CodigoProduto INT,
    Quantidade INT NOT NULL,
    PrecoVendaUnitario DECIMAL(10, 2) NOT NULL,
    ValorTotal DECIMAL(10, 2) AS (Quantidade * PrecoVendaUnitario) STORED,
    FOREIGN KEY (NumeroPedido) REFERENCES PedidoDadosGerais(NumeroPedido),
    FOREIGN KEY (CodigoProduto) REFERENCES Produto(Codigo)
);

INSERT INTO Cliente (Nome, Cidade, UF) VALUES 
('João Silva', 'São Paulo', 'SP'),
('Maria Oliveira', 'Rio de Janeiro', 'RJ'),
('Carlos Pereira', 'Belo Horizonte', 'MG'),
('Ana Souza', 'Curitiba', 'PR'),
('Marcos Lima', 'Fortaleza', 'CE'),
('Beatriz Mendes', 'Recife', 'PE'),
('José Santos', 'Salvador', 'BA'),
('Fernanda Costa', 'Porto Alegre', 'RS'),
('Pedro Rocha', 'Brasília', 'DF'),
('Lucas Albuquerque', 'Manaus', 'AM'),
('Paula Fernandes', 'Belém', 'PA'),
('Vinicius Gomes', 'Florianópolis', 'SC'),
('Camila Teixeira', 'Goiânia', 'GO'),
('André Alves', 'Natal', 'RN'),
('Letícia Moura', 'Maceió', 'AL'),
('Ricardo Ramos', 'São Luís', 'MA'),
('Larissa Lopes', 'Campo Grande', 'MS'),
('Juliana Duarte', 'Vitória', 'ES'),
('Bruno Souza', 'João Pessoa', 'PB'),
('Tatiane Nunes', 'Aracaju', 'SE');

INSERT INTO Produto (Descricao, PrecoVenda) VALUES 
('Caderno A4', 15.90),
('Lápis de Cor', 12.50),
('Caneta Esferográfica', 2.00),
('Borracha Escolar', 1.50),
('Mochila Escolar', 89.90),
('Livro Didático', 59.90),
('Calculadora Científica', 120.00),
('Regua 30cm', 4.50),
('Apontador', 1.20),
('Giz de Cera', 5.80),
('Estojo Escolar', 18.00),
('Agenda 2024', 25.00),
('Cola Branca', 3.30),
('Papel Sulfite A4 - 500 folhas', 25.90),
('Tinta Guache', 6.50),
('Marcador de Texto', 3.50),
('Lápis Preto', 1.00),
('Corretivo Líquido', 3.90),
('Pasta Sanfonada', 9.80),
('Canetinha Hidrográfica', 14.20);





