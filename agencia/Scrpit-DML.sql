-- Comandos SQL: DML - Update

update cliente 
	set pontuacao = 1200
		where CPF = "111.222.333-44";
        
update cliente
	set pontuacao = 2000
		where sexo = 'F';

update cliente
	set pontuacao = 1000
		where sexo = 'M';

update cliente
	set idade = year(now()) - year(dataNasc);

update cliente
	set idade = year(now()) - year(dataNasc);

update cliente
	set pontuacao = pontuacao + 1000
		where nome like "%Silva%";

update funcionario
	set comissao =  200.00
		where sexo = 'F';

update funcionario
	set comissao = comissao + 500.00
		where id_funcionario in (select id_Funcionario from enderecoFunc
	where cidade = "Recife" or cidade = "Olinda");

update cliente
	set pontuacao = pontuacao * 1.40
		where sexo = 'M';

update funcionario
	set salario = salario + 750
		where id_funcionario = '1';

-- Comandos SQL: DML - Delete

delete from enderecocli 
	where Cliente_idCliente = "1";

delete from cliente 
	where idCliente= "2";

truncate cliente;

delete from cliente;

delete from funcionario;

delete from funcionario
	where sexo = 'M';

delete from funcionario
	where comissao = 1000;

delete from projeto
	where idProjeto = '1';

delete from funcionario
    where id_Funcionario in (select id_Funcionario from enderecoFunc
	where cidade = "Recife" or cidade = "Olinda");

delete from ferias;

drop database agenciamidia;


SET SQL_SAFE_UPDATES = 0;