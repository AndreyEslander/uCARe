create database Eslander;
/* 1 */
use Eslander;
CREATE TABLE cliente (
senha_cliente VARCHAR(20) NOT NULL,
email_cliente VARCHAR(50) UNIQUE NOT NULL,
numero_contato_cliente VARCHAR(18) NOT NULL ,
cpf_cliente VARCHAR(11) UNIQUE,
nome_cliente VARCHAR(80) NOT NULL,
id_cliente BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
endereco VARCHAR(100)
);

CREATE TABLE carro (
cor VARCHAR(20),
placa VARCHAR(12) NOT NULL,
ano BIGINT(4),
modelo VARCHAR(14),
km_percorrido BIGINT(8),
estado VARCHAR(20) NOT NULL,
valvula BIGINT(2),
id_carro BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
id_cliente BIGINT ,
FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE funcionario (
tipo_funcionario varchar(20),
numero_contato_funcionario VARCHAR(18),
senha_funcionario VARCHAR(80) NOT NULL,
login VARCHAR(10) UNIQUE NOT NULL,
salario BIGINT(10),
cpf_funcionario BIGINT(11),
email_funcionario VARCHAR(50) NOT NULL,
id_funcionario BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
nome_funcionario VARCHAR(80) NOT NULL
);

CREATE TABLE ordem (
preco_total BIGINT(10),
data BIGINT(8),
id_ordem BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
id_funcionario BIGINT ,
id_carro BIGINT ,
FOREIGN KEY(id_carro) REFERENCES carro (id_carro),
FOREIGN KEY(id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE servico (
preco_servico BIGINT(10),
tipo_servico VARCHAR(20),
id_servico BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT
);

CREATE TABLE peca (
nome_peca VARCHAR(35),
id_peca BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
preco_peca BIGINT(10)
);

CREATE TABLE ordem_servico (
id_servico BIGINT ,
id_ordem BIGINT ,
id_ordem_servico BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
FOREIGN KEY(id_servico) REFERENCES servico (id_servico) ON DELETE CASCADE,
FOREIGN KEY(id_ordem) REFERENCES ordem (id_ordem) ON DELETE CASCADE
);

CREATE TABLE ordem_peca (
id_peca BIGINT ,
id_ordem BIGINT ,
id_ordem_peca BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
FOREIGN KEY(id_peca) REFERENCES peca (id_peca) ON DELETE CASCADE,
FOREIGN KEY(id_ordem) REFERENCES ordem (id_ordem) ON DELETE CASCADE
);


