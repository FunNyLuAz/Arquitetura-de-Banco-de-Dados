use livraria;

insert into usuario values
	(null, "Travis Scott", "travis123"),
	(null, "Ricarda Salles", "salles567"),
	(null, "Fernanda Gomes", "123456789"),
	(null, "Gustavo Lorenzo", "lorenz1234"),
    (null, "Loja do Matheus", "matheus456"),
    (null, "Loja do Bruno", "burnobruno4467"),
    (null, "Loja do Tomas", "tomasss458"),
    (null, "Loja do Fernando", "fernando345");

insert into email_usuario values
	(null, "travis@gmail.com", 1),
	(null, "scott@gmail.com", 1),
	(null, "salles@gmail.com", 2),
	(null, "gomes@gmail.com", 3),
	(null, "guslorenz@gmail.com", 4),
	(null, "lorenz@gmail.com", 4),
    (null, "lojamatheus@gmail.com", 5),
    (null, "lojabruno@gmail.com", 6),
    (null, "lojatomas@gmail.com", 7),
    (null, "lojafernando@gmail.com", 8);

insert into telefone_usuario values
	(null, "41998546767", 1),
	(null, "42987432444", 1),
	(null, "44967539747", 2),
	(null, "41945894925", 3),
	(null, "42976934576", 3),
	(null, "44877458753", 4),
	(null, "4334527895", 5),
	(null, "4174843857", 6),
	(null, "4234568459", 7),
	(null, "4234625867", 8);

insert into pessoa_fisica values
	(1, "99988877700", '2000-10-10', 'm'),
	(2, "55566644422", '2001-08-15', 'f'),
	(3, "33322211144", '1990-11-12', 'f'),
	(4, "88877755522", '1980-12-20', 'm');

insert into pessoa_juridica values
	(5, "11222333000100", "Loja Matheus Ltda.", '2000-01-01'),
	(6, "66555222000144", "Loja Bruno Ltda.", '2000-01-01'),
	(7, "22333444000188", "Loja Tomas Ltda.", '2000-01-01'),
	(8, "99555444000177", "Loja Fernando Ltda.", '2000-01-01');
    
insert into endereco values
	(null, "Rua Jonas, 123", "Apto. 506", "80342222", "Primavera", "Roraima", "Brasil", 1),
	(null, "Av. Feliciano JK, 456", "", "65423555", "Primavera", "Roraima", "Brasil", 2),
	(null, "Rua Jóquei, 8364B", "Apto. 201", "45563555", "Vila Rica", "Rondônia", "Brasil", 3),
	(null, "Rua Imaculada, 5893", "Apto. 213", "56423556", "Purunã", "Rondônia", "Brasil", 4),
	(null, "Av. Brasil, 564", "Apto. 908", "12543666", "Guadalupe", "Ceará", "Brasil", 5),
	(null, "Rua Roraima, 23", "", "98554333", "Ji-Paraná", "Pernambuco", "Brasil", 6),
	(null, "Av. Pernambuco, 845", "", "86256222", "São Miguel", "São Paulo", "Brasil", 7),
	(null, "Rua Ceará, 113", "Apto. 312", "84125000", "São Miguel", "São Paulo", "Brasil", 8);

insert into forma_pagamento values
	(null, "Boleto"),
	(null, "Pix"),
	(null, "Cartão de crédito"),
	(null, "Cartão de débito");

insert into status_compra values
	(null, "Cancelada"),
	(null, "Aguardanto pagamento"),
	(null, "Gerando NF-e"),
	(null, "Enviado"),
	(null, "Entregue");

insert into compra values
	(null, 0, 0, '2022-10-10 08:10:10', "", 1, 2),
	(null, 0, 0, '2022-09-21 13:04:45', "", 2, 2),
	(null, 0, 0, '2022-09-23 14:08:34', "45533689752315549563562532532163563262532563", 2, 4),
	(null, 0, 0, '2022-09-21 16:15:54', "16641354136165413153465456514636468174364163", 3, 5),
	(null, 0, 0, '2022-10-09 20:20:42', "97613755676525686676547656875685686567856686", 4, 4),
	(null, 0, 0, '2022-10-06 19:30:24', "14676464546456722167259864167325675467256755", 5, 5),
	(null, 0, 0, '2021-09-10 06:37:21', "46221254511000335211233654555522222266666666", 6, 5),
	(null, 0, 0, '2022-10-08 10:53:27', "78797191776771619716917976711996891911769718", 7, 4),
	(null, 0, 0, '2021-08-19 11:45:57', "16618481891111144644141434413541365416165144", 7, 5),
	(null, 0, 0, '2021-08-20 12:01:47', "11436486174197164814638719718767816719364634", 8, 5);
    
insert into compra_forma_pagamento values
	(3, 2, 0),
	(4, 1, 0),
	(5, 1, 0),
	(6, 3, 0),
	(7, 3, 0),
	(8, 3, 0),
	(9, 3, 0),
	(10, 4, 0);
    
insert into transportadora values
	(null, "Transportadora do Ademar", "0022233300028", '2022-01-03', "Ademar Ltda.", 1.6, 10.0),
	(null, "Transportadora do Ricardo", "5566677770009", '2022-05-24', "Ricardo Ltda.", 2.6, 1.0),
	(null, "Transportadora do Ulrich", "9988877700025", '2022-07-12', "Ulrich Ltda.", 3.0, 0.0),
	(null, "Transportadora do Otto", "8899977700023", '2022-02-16', "Otto Ltda.", 0.5, 15.0);

insert into tipo_produto values
	(null, "Livro"),
	(null, "Videogame"),
	(null, "Jogo de tabuleiro"),
	(null, "Papelaria");
    
insert into filtro_produto values
	(null, "Preto"),
	(null, "Rosa"),
	(null, "Grande"),
	(null, "Pequeno"),
    (null, "Videogame"),
    (null, "Caderno"),
    (null, "Playstation 4");

insert into produto values
	(null, "Livro Star Wars", "Incrível livro Star Wars Edição limitada exclusiva", 99.99, 30, 2022, "Panini", 1),
	(null, "Livro Anne Frank", "Livro muito legal", 199.99, 50, 2022, "Dark Stories", 1),
	(null, "Jogo Cara a Cara", "Jogo de tabuleiro mais vendido do Brasil", 599.99, 40, 2022, "Hasbro", 3),
	(null, "Jogo PS4 Assassin's Creed Unity", "Jogo muito bem projetado e extremamente bem avaliado", 399.99, 20, 2022, "Ubisoft", 2);
    
insert into produto_filtro_produto values
	(1, 1),
	(2, 1),
	(2, 2),
	(3, 2),
    (4, 5),
    (4, 7);

insert into registro values
	(1, 1, 0, 3, 56.0, 1),
	(2, 2, 0, 4, 20.0, 1),
	(3, 2, 0, 2, 23.0, 1),
	(4, 3, 0, 1, 24.0, 2),
	(5, 3, 0, 9, 25.0, 2),
	(5, 2, 0, 4, 34.0, 2),
	(6, 3, 0, 6, 31.0, 3),
	(7, 4, 0, 2, 30.0, 4),
	(8, 4, 0, 3, 29.8, 3),
	(9, 1, 0, 1, 29.0, 3),
	(10, 1, 0, 1, 30.0, 3),
	(10, 2, 0, 2, 27.0, 3);

insert into funcionario values
	(null, "Luciano Gomes", '2000-03-04', "99900011122", 'm', "luciano@livraria.com", "41999993333", "Rua Lunático, 119", "Apto. 708", "88099222", "Paraisópolis", "Goiás", "Brasil"),
	(null, "Maria Freitas", '2001-04-09', "44165416545", 'f', "maria@livraria.com", "42989894554", "Rua Futebol, 113", "Apto. 602", "84164545", "Mariana", "Minas Gerais", "Brasil"),
	(null, "Joaquina Peres", '1990-06-24', "14564154545", 'f', "joaquina@livraria.com", "43988754465", "Rua Ademar Filho, 75", "", "18861555", "Paraisópolis", "São Paulo", "Brasil"),
	(null, "Valdemar Silva", '1998-01-14', "18716815455", 'm', "valdemar@livraria.com", "44951513551", "Rua Operador, 8855", "", "25645465", "Paraisópolis", "Tocantins", "Brasil");

insert into cargo_funcionario values
	(null, "Zelador"),
	(null, "Técnico"),
	(null, "Analista"),
	(null, "Desenvolvedor");
    
insert into funcionario_cargo_funcionario values 
	(1, 1, 2000, '2022-01-03', null),
	(2, 1, 2000, '2022-01-15', null),
	(3, 1, 3000, '2021-12-14', '2022-02-14'),
	(3, 2, 4000, '2022-02-14', null),
	(4, 4, 20000, '2021-12-13', null);

set sql_safe_updates = false;

-- Faz o que a trigger before_insert_registro faria (se não foi criada ainda)
update registro set
	preco_venda = (select preco_venda from produto where id_produto = registro.id_produto);

update compra set
	valor_sem_frete = (select sum(preco_venda * quantidade) from registro group by id_compra having id_compra = compra.id_compra),
    valor_total = valor_sem_frete + (select sum(custo_frete) from registro group by id_compra having id_compra = compra.id_compra);

update compra_forma_pagamento set
	pago_forma = (select valor_total from compra where id_compra = compra_forma_pagamento.id_compra);

set sql_safe_updates = true;
