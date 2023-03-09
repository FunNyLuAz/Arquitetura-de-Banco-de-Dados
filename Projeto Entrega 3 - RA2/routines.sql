use livraria;

-- Procedure 1 - Insere um novo usuário pessoa física
delimiter $$
create procedure cadastrar_pessoa_fisica(
	in _nome varchar(100),
    in _senha varchar(100),
    in _email varchar(100),
    in _telefone varchar(20),
    in _cpf varchar(11),
    in _data_nasc date,
    in _sexo char(1)
)
	begin
		declare _id_usuario int;
        
		declare error_sql tinyint default false;
        declare  continue  handler for sqlexception set error_sql = true;
    
        set autocommit = off;
        
        start transaction;
        
		insert into usuario values
		(null, _nome, _senha);
		
		select last_insert_id() into _id_usuario;
		
		-- Obriga a passar um e-mail para o cadastro
		insert into email_usuario values
		(null, _email, _id_usuario);
        
		-- Deixa como opcional o telefone no cadastro
		if _telefone is not null then
			insert into telefone_usuario values
			(null, _telefone, _id_usuario);
		end if;
		
		insert into pessoa_fisica values
		(_id_usuario, _cpf, _data_nasc, _sexo);
		
        if error_sql is false then
			-- Retorna true e dá um commit se não haver erros
			commit;
            select true as "Response";
		else
			-- Retorna false e dá um rollback se haver erros
			rollback;
            select false as "Response";
		end if;
    end $$
delimiter ;

-- Procedure 2 - Registra um produto na compra (faz INSERT se não havia ele e UPDATE se já)
delimiter $$
create procedure registrar_produto_em_compra(
	in _id_compra int,
    in _id_produto int,
    in _quantidade int,
    in _custo_frete double,
    in _id_transportadora int
)
	begin
		if not exists(select * from registro where id_compra = _id_compra and id_produto = _id_produto) then
			insert into registro values
            (_id_compra, _id_produto, 0, _quantidade, _custo_frete, _id_transportadora);
		else
			update registro set
				quantidade = quantidade + coalesce(_quantidade, 0), -- Quantidade é incrementada pelo passado se não for nulo
                custo_frete = coalesce(_custo_frete, 0), -- Custo do frete é substituído pelo passado se não for nulo (pressupõe que houve um recálculo dele)
                id_transportadora = coalesce(_id_transportadora, 0) -- Id da transportadora  é substituído pelo passado se não for nulo
				where id_compra = _id_compra and id_produto = _id_produto;
        end if;
    end $$
delimiter ;

-- Function 1 - Calcular o faturamento de um ano
delimiter $$
create function faturamento_anual(_ano year)
returns double deterministic
	begin
		declare faturamento double;
        
		select
			sum(valor_total)
		into faturamento
		from compra
		where year(data_compra) = _ano;
        
        return faturamento;
    end $$
delimiter ;

-- Function 2 - Calcular o faturamento mensal
delimiter $$
create function faturamento_mensal(_mes tinyint unsigned, _ano year)
returns double deterministic
	begin
		declare faturamento double;
        
		select
			sum(valor_total)
		into faturamento
		from compra
		where month(data_compra) = _mes and year(data_compra) = _ano;
        
        return faturamento;
    end $$
delimiter ;

-- Function 3 (Extra) - Calcular o mês com o maior faturamento no ano
delimiter $$
create function mes_maior_faturamento_ano(_ano year)
returns tinyint unsigned deterministic
	begin
		declare mes double;
        
        select
			month(data_compra)
		into mes
		from compra
		where year(data_compra) = _ano
		group by month(data_compra)
		order by sum(valor_total) DESC
		limit 1;
        
        return mes;
	end $$
delimiter ;

-- Trigger 1 - Trigger responsável por atualizar a quantidade no estoque (e gerar erro se não haver suficiente)
-- 			   e por garantir o valor correto para o atributo preco_venda
delimiter $$
create trigger before_insert_registro
	before insert on registro
	for each row
	begin
		declare _quantidade int default 0;
		set @_quantidade = (select quantidade from produto where id_produto = new.id_produto);
        
		if @_quantidade - new.quantidade >= 0 then
			update produto set
				quantidade = @_quantidade - new.quantidade
				where id_produto = new.id_produto;
		else
			signal sqlstate '45000'
			set message_text = "Não há estoque suficiente";
		end if;
        
		-- preco_venda em registro recebe o preço atual do produto necessariamente
		set new.preco_venda := (select preco_venda from produto where id_produto = new.id_produto);
    end $$
delimiter ;

-- Trigger 2 - Trigger que garante a integridade do atributo sexo na inserção de uma nova pessoa física
delimiter $$
create trigger before_insert_pessoa_fisica
	before insert on pessoa_fisica
    for each row
    begin
		if new.sexo <> 'm' and new.sexo <> 'f' and new.sexo <> 'o' then
			set new.sexo := 'o'; -- Recebe OUTROS caso não seja nenhuma opção válida
        end if;
    end $$
delimiter ;
