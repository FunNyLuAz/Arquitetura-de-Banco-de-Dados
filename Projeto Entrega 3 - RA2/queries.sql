use livraria;

-- 1. Funcionários mais antigos na empresa
select
	fcf.data_vinculo as "Data de vínculo",
	f.id_funcionario as "Id do funcionário",
	f.nome as "Nome"
from funcionario f
inner join funcionario_cargo_funcionario fcf on fcf.id_funcionario = f.id_funcionario
inner join cargo_funcionario cf on cf.id_cargo_funcionario = fcf.id_cargo_funcionario
group by f.id_funcionario
order by fcf.data_vinculo asc;

-- 2. Filtros de produtos com maiores faturamentos
select
	fp.id_filtro_produto as "Id do filtro do produto",
	fp.nome as "Nome",
	sum(r.preco_venda * r.quantidade) as Vendido
from filtro_produto fp
left join produto_filtro_produto pfp on pfp.id_filtro_produto = fp.id_filtro_produto
left join produto p on p.id_produto = pfp.id_produto
left join registro r on r.id_produto = p.id_produto
group by fp.id_filtro_produto
order by Vendido desc;

-- 3. UF com mais compras
select
	e.uf as "UF",
    count(*) as Compras
from compra c
inner join endereco e on e.id_endereco = c.id_endereco
group by e.uf
order by Compras desc;

-- 4. Forma de pagamento mais usada
select
    count(*) as Compras,
	fp.id_forma_pagamento as "Id da forma de pagamento",
    fp.nome as "Nome"
from compra c
inner join compra_forma_pagamento cfp on cfp.id_compra = c.id_compra
inner join forma_pagamento fp on fp.id_forma_pagamento = cfp.id_forma_pagamento
group by fp.id_forma_pagamento
order by Compras desc;

-- 5. Média dos salários dos funcionários
select
	avg(salario) as "Média dos salários"
from funcionario_cargo_funcionario;

-- 6. Idade média dos usuários
select
	avg(year(from_days(to_days(current_date()) - to_days(data_nasc)))) as "Idade média"
from pessoa_fisica;

-- 7. Sexo com mais compras
select
	pf.sexo as "Sexo",
    count(c.id_compra) as Compras,
	count(distinct u.id_usuario) as "Quantidade de usuários"
from compra c
inner join endereco e on e.id_endereco = c.id_endereco
inner join usuario u on u.id_usuario = e.id_usuario
inner join pessoa_fisica pf on pf.id_usuario = u.id_usuario
group by pf.sexo
order by Compras desc;

-- 8. Transportadoras com mais entregas (considerando que para uma compra haja apenas uma entrega por transportadora)
select
	t.id_transportadora "Id da transportadora",
    t.nome as "Nome",
	count(distinct c.id_compra) as Entregas
from transportadora t
inner join registro r on r.id_transportadora = t.id_transportadora
inner join compra c on c.id_compra = r.id_compra
group by t.id_transportadora
order by Entregas desc;

-- 9. Quantidade de usuários cadastrados (e quantidade de pessoas físicas e de pessoas jurídicas)
select
	count(*) as "Quantidade de usuários",
    count(pf.id_usuario) as "Quantidade de pessoas físicas",
    count(*) - count(pf.id_usuario) as "Quantidade de pessoas jurídicas"
from usuario u
left join pessoa_fisica pf on pf.id_usuario = u.id_usuario;


-- 10. Mostrar os usuários com seus e-mails e suas senhas
select
	u.id_usuario as "Id do usuário",
	u.nome as "Nome",
    e.email as "E-mail",
    u.senha as "Senha"
from usuario u
inner join email_usuario e on u.id_usuario = e.id_usuario;

-- 11. Selecionar os usuários e os seus endereços
select
	u.id_usuario as "Id do usuário",
	u.nome as "Nome",
    e.logradouro as "Logradouro",
    e.cep as "CEP",
    e.cidade as "Cidade",
    e.uf as "UF",
    e.pais as "País",
    e.complemento as "Complemento"
from usuario u
inner join endereco e
on u.id_usuario = e.id_usuario;

-- 12. Média dos preços dos produtos
select
	avg(preco_venda) as "Média dos preços"
from produto;

-- 13. Total de compras e total de compras com status Enviado
select
	count(sc.id_status_compra) as "Qtde. de compras com status Enviado"
from compra c
inner join status_compra sc on c.id_status_compra = sc.id_status_compra 
group by sc.nome having sc.nome = "Enviado";

-- 14. Total de compras de cada produto
select
	p.id_produto as "Id do produto",
	p.nome as "Nome",
	sum(r.quantidade) as "Total de compras"
from registro r
inner join produto p on r.id_produto = p.id_produto
group by r.id_produto;

-- 15. Média do valor das compras e quantidade para cada cidade
select
	avg(c.valor_total) as "Média do valor das compras",
    count(c.id_compra) as "Quantidade de compras",
    e.cidade as "Cidade"
from compra c
inner join endereco e on c.id_endereco = e.id_endereco
group by e.cidade
order by c.valor_total desc;

-- 16. Compra com o maior valor registrado em que a forma de pagamento tenha sido com cartão
select
	cfp.id_compra as "Id da compra",
    max(cfp.pago_forma) as "Valor",
	fp.id_forma_pagamento as "Id da forma de pagamento",
	fp.nome as "Nome"
    from compra_forma_pagamento cfp
inner join forma_pagamento fp on fp.id_forma_pagamento = cfp.id_forma_pagamento
where fp.nome = "Cartão de crédito" or fp.nome = "Cartão de débito"
group by cfp.id_forma_pagamento;

-- 17. Selecionar os usuários com data de nascimento entre 14/02/1989 e 18/12/2000
select
	u.id_usuario as "Id do usuário",
    u.nome as "Nome",
    pf.data_nasc as "Data de nascimento"
from usuario u
inner join pessoa_fisica pf on pf.id_usuario = u.id_usuario
where pf.data_nasc between '1989-02-14' and '2000-12-18'
order by pf.data_nasc asc;

-- 18. Mostrar os três produtos com os menores preços
select
	p.id_produto as "Id do produto",
    p.nome as "Nome",
	p.preco_venda as "Preço de venda"
from produto p
order by preco_venda asc
limit 3;

-- 19. Selecionar as três compras com os menores valores
select
	c.id_compra as "Id da compra",
    c.valor_total as "Valor total"
from compra c
order by valor_total asc
limit 3;

-- 20. Custo médio do frete das compras
select
	avg(valor_total - valor_sem_frete) as "Custo médio do frete"
from compra;
