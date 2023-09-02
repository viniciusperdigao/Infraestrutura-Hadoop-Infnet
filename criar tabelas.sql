-- CRIANDO DATABASE
CREATE DATABASE IF NOT EXISTS biblioteca;
-- TABELA AUTOR
CREATE TABLE autor (ID_Autor INT, Nome_Autor STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA AUTOR 
LOAD DATA INPATH '/user/vinicius_perdigao/base/autor_origem.csv' overwrite into table autor;
-- TABELA CARGO
CREATE TABLE cargo (ID_Cargo INT, Nome_Cargo STRING, Salario DOUBLE) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA CARGO 
LOAD DATA INPATH '/user/vinicius_perdigao/base/cargo_origem.csv' overwrite into table cargo;
-- TABELA DEPARTAMENTO
CREATE TABLE departamento (
    ID_Departamento INT,
    ID_Cargo INT,
    Nome_Departamento DOUBLE
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA DEPARTAMENTO 
LOAD DATA INPATH '/user/vinicius_perdigao/base/departamento_origem.csv' overwrite into table departamento;
-- TABELA DEVOLUCAO
CREATE TABLE devolucao (
    ID_Devolucao INT,
    ID_Funcionario INT,
    ID_Emprestimo INT,
    ID_Usuario INT,
    ID_Estoque INT,
    ID_Obra INT,
    Data_Devolucao DATE,
    Hora_Devolucao STRING,
    Multa_Atraso DOUBLE
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA DEVOLUCAO 
LOAD DATA INPATH '/user/vinicius_perdigao/base/devolucao_origem.CSV' overwrite into table devolucao;
-- TABELA  EDITORA
CREATE TABLE editora (
    ID_Editora INT,
    Nome_Editora STRING,
    Logradouro STRING,
    Cidade STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA EDITORA 
LOAD DATA INPATH '/user/vinicius_perdigao/base/editora_origem.CSV' overwrite into table editora;
-- TABELA EMPRESTIMO
CREATE TABLE emprestimo (
    ID_Emprestimo INT,
    ID_Funcionario INT,
    ID_Usuario INT,
    ID_Estoque INT,
    ID_Obra INT,
    Data_Emprestimo DATE,
    Hora_Emprestimo STRING,
    Data_Entrega STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA EMPRESTIMO 
LOAD DATA INPATH '/user/vinicius_perdigao/base/emprestimo_origem.CSV' overwrite into table emprestimo;
-- TABELA ESTOQUE
CREATE TABLE estoque (
    ID_Estoque INT,
    ID_Obra INT,
    Quantidade_Livro INT,
    Valor_Unitario DOUBLE
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA ESTOQUE 
LOAD DATA INPATH '/user/vinicius_perdigao/base/estoque_origem.CSV' overwrite into table estoque;
-- TABELA FUNCIONARIO
CREATE TABLE funcionario (
    ID_Funcionario INT,
    ID_Cargo INT,
    ID_Departamento INT,
    Nome_Funcionario STRING,
    DATA_ADMISSAO DATE,
    DATA_DEMISSAO DATE
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA FUNCIONARIO 
LOAD DATA INPATH '/user/vinicius_perdigao/base/funcionario_origem.CSV' overwrite into table funcionario;
-- TABELA OBRA
CREATE TABLE obra (
    ID_Obra INT,
    ID_Editora INT,
    ID_Autor INT,
    Titulo_Obra STRING,
    Numero_Publicacao INT,
    Genero STRING,
    Data_Publicacao DATE
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA OBRA 
LOAD DATA INPATH '/user/vinicius_perdigao/base/obra_origem.CSV' overwrite into table obra;
-- TABELA RESERVA
CREATE TABLE reserva (
    ID_Reserva INT,
    ID_Emprestimo INT,
    ID_Funcionario INT,
    ID_Usuario INT,
    ID_Estoque INT,
    ID_Obra INT,
    Status_Livro STRING,
    Data_Reserva DATE,
    Hora_Reserva STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA RESERVA 
LOAD DATA INPATH '/user/vinicius_perdigao/base/reserva_origem.CSV' overwrite into table reserva;
-- TABELA USUARIO
CREATE TABLE usuario (
    ID_USUARIO INT,
    NOME_USUARIO STRING,
    LOGRADOURO STRING,
    BAIRRO STRING,
    TELEFONE STRING,
    CEP STRING,
    CPF STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE;
-- INGESTÃO DADOS NA TABELA USUARIO 
LOAD DATA INPATH '/user/vinicius_perdigao/base/usuario_origem.CSV' overwrite into table usuario;