use livraria;

-- 1. Transação com commit
set autocommit = off;
start transaction;

insert into registro values
(10, 3, 0, 2, 13.0, 2),
(10, 4, 0, 5, 15.9, 2);

commit;

-- 2. Transação com rollback
set autocommit = off;
start transaction;

set sql_safe_updates = false;

delete from registro;

update compra set
	valor_total = 999;
    
set sql_safe_updates = true;

rollback;

-- 3. Transação com rollback to savepoint
set autocommit = off;
start transaction;

update registro set
	quantidade = 10
    where id_compra = 10 and id_produto = 3;
    
savepoint savepoint1;

set sql_safe_updates = false;

delete from registro;

set sql_safe_updates = true;

rollback to savepoint savepoint1;
