12:01 07/11/2025CREATE DATABASE mod_fisico;
USE mod_fisico;

CREATE TABLE tbl_endereco (
    id_endereco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL);

CREATE TABLE tbl_telefone (
    id_telefone INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    telefone_pessoal VARCHAR(45),
    telefone_trabalho VARCHAR(45));

CREATE TABLE tbl_categorias (
    id_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(45) NOT NULL);

CREATE TABLE tbl_clientes (
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    cpf_cliente VARCHAR(15) NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    data_cadastro DATE NOT NULL,
    fk_telefone INT,
    fk_endereco INT,
    FOREIGN KEY (fk_telefone) REFERENCES tbl_telefone(id_telefone),
    FOREIGN KEY (fk_endereco) REFERENCES tbl_endereco(id_endereco));

CREATE TABLE tbl_vendas (
    id_venda INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valor_total FLOAT NOT NULL,
    data_hora DATETIME NOT NULL,
    forma_pagamento VARCHAR(45) NOT NULL,
    fk_cliente INT NOT NULL,
    fk_colaborador INT,
    FOREIGN KEY (fk_cliente) REFERENCES tbl_clientes(id_cliente),
    FOREIGN KEY (fk_colaborador) REFERENCES tbl_colaboradores(id_colaborador));

CREATE TABLE tbl_produtos (
    id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_validade DATE NOT NULL,
    custo FLOAT NOT NULL,
    qtd INT NOT NULL,
    nome_produto VARCHAR(180) NOT NULL,
    preco_venda FLOAT NOT NULL,
    fk_categoria INT NOT NULL,
    fk_cliente INT NOT NULL,
    FOREIGN KEY (fk_categoria) REFERENCES tbl_categorias(id_categoria),
    FOREIGN KEY (fk_cliente) REFERENCES tbl_clientes(id_cliente));

CREATE TABLE tbl_itens_venda (
    id_item INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    preco_unitario FLOAT NOT NULL,
    fk_venda INT NOT NULL,
    fk_produto INT NOT NULL,
    FOREIGN KEY (fk_venda) REFERENCES tbl_vendas(id_venda),
    FOREIGN KEY (fk_produto) REFERENCES tbl_produtos(id_produto));

CREATE TABLE tbl_colaboradores (
    id_colaborador INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_colaborador VARCHAR(100) NOT NULL,
    cpf_colaborador VARCHAR(15) NOT NULL,
    cargo VARCHAR(45) NOT NULL,
    salario FLOAT NOT NULL,
    fk_telefone INT,
    fk_endereco INT,
    FOREIGN KEY (fk_telefone) REFERENCES tbl_telefone(id_telefone),
    FOREIGN KEY (fk_endereco) REFERENCES tbl_endereco(id_endereco));
