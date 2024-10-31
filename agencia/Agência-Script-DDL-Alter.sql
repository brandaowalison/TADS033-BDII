-- Comando SQL ALTER --  

alter table funcionario
	modify column cpf varchar(14) not null;

alter table dependente
	modify column CPF varchar(14) not null;
    
alter table cliente
	modify column CPF varchar(14) not null;

alter table agendamentopost
	drop column horarioPost;

alter table conteudo
	modify column videoURL varchar(255);

alter table conteudo
	modify column imagemURL varchar(255);

alter table telefone
	modify column Fornecedor_idFornecedor int;

alter table telefone
	modify column Funcionarios_idFuncionarios int;
    
alter table cargo
	add column descricao varchar(255);

alter table funcionario
	add column comissao decimal(7,2) not null;

alter table funcionario
	modify column comissao decimal(7,2);
 
 alter table cliente
	add column pontuacao int;

 alter table cliente
	modify column pontuacao int;
