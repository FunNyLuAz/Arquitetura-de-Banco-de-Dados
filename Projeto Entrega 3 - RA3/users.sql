use livraria;

drop user if exists adm;
drop user if exists lgomes;
drop user if exists mfreitas;
drop user if exists tscott;
drop user if exists rsalles;

-- Criação de usuários
create user if not exists adm@"%" identified by "adm123";
create user if not exists lgomes@"livraria.com.br" identified by "lgomes123";
create user if not exists mfreitas@"livraria.com.br" identified by "mfreitas123";
create user if not exists tscott@"livraria.com.br" identified by "tscott3";
create user if not exists rsalles@"livraria.com.br" identified by "rsales3";

-- Criação de roles
create role if not exists administrador;
create role if not exists funcionario;
create role if not exists cliente;

-- Conceder privilégios aos roles
grant all on *.* to administrador@"%" with grant option;
grant all on livraria.* to funcionario@"livraria.com.br";
grant select on livraria.produto to cliente@"livraria.com.br";

-- Conceder papéis aos usuários
grant administrador to adm;
grant funcionario to lgomes;
grant funcionario to mfreitas;
grant cliente to tscott;
grant cliente to rsalles;
