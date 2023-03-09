drop database if exists livraria;

create database if not exists livraria;

use livraria;

create table if not exists usuario(
	id_usuario int not null auto_increment,
    nome varchar(100) not null,
    senha varchar(32) not null,
    
    primary key(id_usuario)
);

create table if not exists email_usuario(
	id_email_usuario int not null auto_increment,
    email varchar(100) not null,
    id_usuario int not null,
    
    primary key(id_email_usuario),
    foreign key(id_usuario) references usuario(id_usuario)
);

create table if not exists telefone_usuario(
	id_telefone_usuario int not null auto_increment,
    telefone varchar(20) not null,
    id_usuario int not null,
    
    primary key(id_telefone_usuario),
    foreign key(id_usuario) references usuario(id_usuario)
);

create table if not exists pessoa_fisica(
	id_usuario int not null,
    cpf varchar(11) not null,
    data_nasc date not null,
    sexo char(1) not null,
    
    primary key(id_usuario),
    foreign key(id_usuario) references usuario(id_usuario)
);

create table if not exists pessoa_juridica(
	id_usuario int not null,
    cnpj varchar(14) not null,
    razao_social varchar(100) not null,
    data_abertura date not null,
    
    primary key(id_usuario),
    foreign key(id_usuario) references usuario(id_usuario)
);

create table if not exists endereco(
	id_endereco int not null auto_increment,
    logradouro varchar(100) not null,
    complemento varchar(100) not null,
    cep varchar(8) not null,
    cidade varchar(100) not null,
    uf varchar(100) not null,
    pais varchar(100) not null,
    id_usuario int not null,
    
    primary key(id_endereco),
    foreign key(id_usuario) references usuario(id_usuario)
);

create table if not exists forma_pagamento(
	id_forma_pagamento int not null auto_increment,
    nome varchar(100) not null,
    
    primary key(id_forma_pagamento)
);

create table if not exists status_compra(
	id_status_compra int not null auto_increment,
    nome varchar(100) not null,
    
    primary key(id_status_compra)
);

create table if not exists compra(
	id_compra int not null auto_increment,
    valor_total double not null,
    valor_sem_frete double not null,
    data_compra datetime not null,
    nfe varchar(44),
    id_endereco int not null,
    id_status_compra int not null,
    
    primary key(id_compra),
    foreign key(id_endereco) references endereco(id_endereco),
    foreign key(id_status_compra) references status_compra(id_status_compra)
);

create table if not exists compra_forma_pagamento(
	id_compra int not null,
    id_forma_pagamento int not null,
    pago_forma double not null,
    
    primary key(id_compra, id_forma_pagamento),
    foreign key(id_compra) references compra(id_compra),
    foreign key(id_forma_pagamento) references forma_pagamento(id_forma_pagamento)
);

create table if not exists transportadora(
	id_transportadora int not null auto_increment,
    nome varchar(100) not null,
    cnpj varchar(14) not null,
    data_cadastro date not null,
    razao_social varchar(100) not null,
    taxa_km double not null,
    taxa_fixa double not null,
    
    primary key(id_transportadora)
);

create table if not exists tipo_produto(
	id_tipo_produto int not null auto_increment,
    nome varchar(100) not null,
    
    primary key(id_tipo_produto)
);

create table if not exists filtro_produto(
	id_filtro_produto int not null auto_increment,
    nome varchar(100) not null,
    
    primary key(id_filtro_produto)
);

create table if not exists produto(
	id_produto int not null auto_increment,
    nome varchar(100) not null,
    descricao text not null,
    preco_venda double not null,
    quantidade int not null,
    ano year,
    marca varchar(100),
    id_tipo_produto int not null,
    
    primary key(id_produto),
    foreign key(id_tipo_produto) references tipo_produto(id_tipo_produto)
);

create table if not exists produto_filtro_produto(
	id_produto int not null,
    id_filtro_produto int not null,
    
    primary key(id_produto, id_filtro_produto),
    foreign key(id_produto) references produto(id_produto),
    foreign key(id_filtro_produto) references filtro_produto(id_filtro_produto)
);

create table if not exists registro(
    id_compra int not null,
    id_produto int not null,
    preco_venda double not null,
    quantidade int not null,
    custo_frete double not null,
	id_transportadora int not null,
    
    primary key(id_compra, id_produto),
    foreign key(id_compra) references compra(id_compra),
    foreign key(id_produto) references produto(id_produto),
    foreign key(id_transportadora) references transportadora(id_transportadora)
);

create table if not exists funcionario(
	id_funcionario int not null auto_increment,
    nome varchar(100) not null,
    data_nasc date not null,
    cpf varchar(11) not null,
    sexo char(1) not null,
    email varchar(100) not null,
    telefone varchar(20) not null,
    end_logradouro varchar(100) not null,
    end_complemento varchar(100) not null,
    end_cep varchar(8) not null,
    end_cidade varchar(100) not null,
    end_uf varchar(100) not null,
    end_pais varchar(100) not null,
    
    primary key(id_funcionario)
);

create table if not exists cargo_funcionario(
	id_cargo_funcionario int not null auto_increment,
    nome varchar(100) not null,
    
    primary key(id_cargo_funcionario)
);

create table if not exists funcionario_cargo_funcionario(
	id_funcionario int not null,
	id_cargo_funcionario int not null,
    salario double not null,
    data_vinculo date not null,
    data_desvinculo date,
    
    primary key(id_funcionario, id_cargo_funcionario),
    foreign key(id_funcionario) references funcionario(id_funcionario),
    foreign key(id_cargo_funcionario) references cargo_funcionario(id_cargo_funcionario)
);
