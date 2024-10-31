-- Comandos SQL: DQL

select * from funcionario; -- CHAMA TODOS OS DADOS DA TABELA

select nome as "Funcionário", sexo "Gênero", concat(ch, "h") "Carga-horária", email "E-mail", habilidade "Habilidades", 
				date_format(dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
				concat("R$ ",format(salario, 2,"de_DE")) "Salário", cpf "CPF", date_format(dataNasc, "%d/%m/%Y") "Data de Nascimento", 
                coalesce(concat("R$ ",format(comissao, 2,"de_DE")), 'Não Informado')"Comissao"
					from funcionario
						where id_Funcionario in (select Funcionarios_id from enderecoFunc
							where cidade like "Olinda")
								order by nome;

select nome as "Funcionário", sexo "Gênero", concat(ch, "h") "Carga-horária", email "E-mail", habilidade "Habilidades", 
		date_format(dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(salario, 2,"de_DE")) "Salário", cpf "CPF", date_format(dataNasc, "%d/%m/%Y") "Data de Nascimento", 
       coalesce(concat("R$ ",format(comissao, 2,"de_DE")), 'Não Informado')"Comissao"
			from funcionario
				where id_Funcionario in (select Funcionarios_id from enderecoFunc
					where cidade like "Recife")
						order by nome;


select upper(func.nome) as "Funcionário", func.sexo "Gênero", concat(func.ch, "h") "Carga-horária", func.email "E-mail", func.habilidade "Habilidades", 
		date_format(func.dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(func.salario, 2,"de_DE")) "Salário", func.cpf "CPF", 
        date_format(func.dataNasc, "%d/%m/%Y") "Data de Nascimento",
        timestampdiff(year, dataNasc, now()) "Idade",
        coalesce(concat("R$ ",format(func.comissao, 2,"de_DE")), 'Não Informado')"Comissao",
		coalesce(concat("R$ ",(format(salario + comissao, 2, 'de_DE'))), 'Não Informado') "Salário Final"
			from funcionario func
				where id_Funcionario in (select Funcionarios_id from dependente)
					order by nome;
    
select nome as "Funcionário", sexo "Gênero", concat(ch, "h") "Carga-horária", email "E-mail", habilidade "Habilidades", 
		date_format(dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(salario, 2,"de_DE")) "Salário", cpf "CPF", 
        date_format(dataNasc, "%d/%m/%Y") "Data de Nascimento", 
		coalesce(concat("R$ ",format(comissao, 2,"de_DE")), 'Não Informado')"Comissao"
			from funcionario
				inner join enderecoFunc on id_Funcionario = enderecoFunc.Funcionarios_id
					where enderecoFunc.cidade like "Olinda"
						order by nome;


select nome as "Funcionário", sexo "Gênero", concat(ch, "h") "Carga-horária", email "E-mail", habilidade "Habilidades", 
		date_format(dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(salario, 2,"de_DE")) "Salário", cpf "CPF", 
        date_format(dataNasc, "%d/%m/%Y") "Data de Nascimento", 
        coalesce(concat("R$ ",format(comissao, 2,"de_DE")), 'Não Informado')"Comissao"
			from funcionario
				inner join enderecoFunc on id_Funcionario = enderecoFunc.Funcionarios_id
					where enderecoFunc.cidade like "Recife" or "Paulista"
						order by nome; 

select upper(func.nome) as "Funcionário", func.sexo "Gênero", concat(func.ch, "h") "Carga-horária", func.email "E-mail", func.habilidade "Habilidades", 
		date_format(func.dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(func.salario, 2,"de_DE")) "Salário", func.cpf "CPF", 
        date_format(func.dataNasc, "%d/%m/%Y") "Data de Nascimento",
        timestampdiff(year, dataNasc, now()) "Idade",
        concat("R$ ",format(func.comissao, 2,"de_DE"))"Comissao",
		concat("R$ ",(format(salario + comissao, 2, 'de_DE'))) "Salário Final"
			 from funcionario func
				where salario = (select min(salario) from funcionario)
					order by nome;


select upper(func.nome) as "Funcionário", func.sexo "Gênero", concat(func.ch, "h") "Carga-horária", func.email "E-mail", func.habilidade "Habilidades", 
		date_format(func.dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(func.salario, 2,"de_DE")) "Salário", func.cpf "CPF", 
        date_format(func.dataNasc, "%d/%m/%Y") "Data de Nascimento",
        timestampdiff(year, dataNasc, now()) "Idade",
        coalesce(concat("R$ ",format(func.comissao, 2,"de_DE")), 'Não Informado')"Comissao",
		coalesce(concat("R$ ",(format(salario + comissao, 2, 'de_DE'))), 'Não Informado') "Salário Final"
			 from funcionario func
				where salario = (select max(salario) from funcionario)
					order by nome;

select upper(func.nome) as "Funcionário", func.sexo "Gênero", concat(func.ch, "h") "Carga-horária", func.email "E-mail", func.habilidade "Habilidades", 
		date_format(func.dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(func.salario, 2,"de_DE")) "Salário", func.cpf "CPF", 
        date_format(func.dataNasc, "%d/%m/%Y") "Data de Nascimento",
        timestampdiff(year, dataNasc, now()) "Idade",
        coalesce(concat("R$ ",format(func.comissao, 2,"de_DE")), 'Não Informado')"Comissao",
		coalesce(concat("R$ ",(format(salario + comissao, 2, 'de_DE'))), 'Não Informado') "Salário Final"
			from funcionario func
				where dataNasc = (select max(dataNasc) from funcionario)
					order by nome;

select upper(func.nome) as "Funcionário", func.sexo "Gênero", concat(func.ch, "h") "Carga-horária", func.email "E-mail", func.habilidade "Habilidades", 
		date_format(func.dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(func.salario, 2,"de_DE")) "Salário", func.cpf "CPF", 
        date_format(func.dataNasc, "%d/%m/%Y") "Data de Nascimento",
        timestampdiff(year, dataNasc, now()) "Idade",
        coalesce(concat("R$ ",format(func.comissao, 2,"de_DE")), 'Não Informado')"Comissao",
		coalesce(concat("R$ ",(format(salario + comissao, 2, 'de_DE'))), 'Não Informado') "Salário Final",
		bairro "Bairro", cidade "Cidade"
             from funcionario func
				join enderecoFunc on id_Funcionario = Funcionarios_id
					order by nome;

select upper(func.nome) as "Funcionário", func.sexo "Gênero", concat(func.ch, "h") "Carga-horária", func.email "E-mail", func.habilidade "Habilidades", 
		date_format(func.dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(func.salario, 2,"de_DE")) "Salário", func.cpf "CPF", 
        date_format(func.dataNasc, "%d/%m/%Y") "Data de Nascimento",
        timestampdiff(year, dataNasc, now()) "Idade",
        coalesce(concat("R$ ",format(func.comissao, 2,"de_DE")), 'Não Informado')"Comissao",
		coalesce(concat("R$ ",(format(salario + comissao, 2, 'de_DE'))), 'Não Informado') "Salário Final",
		bairro "Bairro", cidade "Cidade"
             from funcionario func
				join enderecoFunc on id_Funcionario = Funcionarios_id
					where enderecoFunc.cidade like "Recife"
						order by nome;

select upper(func.nome) as "Funcionário", func.sexo "Gênero", concat(func.ch, "h") "Carga-horária", func.email "E-mail", func.habilidade "Habilidades", 
		date_format(func.dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(func.salario, 2,"de_DE")) "Salário", func.cpf "CPF", 
        date_format(func.dataNasc, "%d/%m/%Y") "Data de Nascimento",
        timestampdiff(year, dataNasc, now()) "Idade",
        concat("R$ ",format(func.comissao, 2,"de_DE"))"Comissao",
		concat("R$ ",(format(salario + comissao, 2, 'de_DE'))) "Salário Final",
		bairro "Bairro", cidade "Cidade"
             from funcionario func
				join enderecoFunc on id_Funcionario = Funcionarios_id
					where enderecoFunc.cidade like "Olinda"
						order by nome;
                        
select upper(func.nome) as "Funcionário", func.sexo "Gênero", concat(func.ch, "h") "Carga-horária", func.email "E-mail", func.habilidade "Habilidades", 
		date_format(func.dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(func.salario, 2,"de_DE")) "Salário", func.cpf "CPF", 
        date_format(func.dataNasc, "%d/%m/%Y") "Data de Nascimento",
        timestampdiff(year, dataNasc, now()) "Idade",
        concat("R$ ",format(func.comissao, 2,"de_DE"))"Comissao",
		concat("R$ ",(format(salario + comissao, 2, 'de_DE'))) "Salário Final",
		bairro "Bairro", cidade "Cidade"
             from funcionario func
				join enderecoFunc on id_Funcionario = Funcionarios_id
					where salario >= 4000
						order by nome;


select dep.cpf "CPF do Dependente", dep.nome "Dependente", 
	timestampdiff(year, dep.dataNasc, now()) "Idade do Dependente",
    dep.parentesco "Parentesco", func.nome "Responsável"
		from dependente dep
			inner join funcionario func on func.id_Funcionario = dep.Funcionarios_id
				order by func.nome;


select func.cpf "CPF", func.nome "Funcionario", 
	count(dep.cpf) "Quantidade de Dependentes"
    from funcionario func
		inner join dependente dep on dep.Funcionarios_id = func.id_Funcionario
			group by func.id_Funcionario
				order by func.nome;


select upper(func.nome) as "Funcionário", func.sexo "Gênero", concat(func.ch, "h") "Carga-horária", func.email "E-mail", func.habilidade "Habilidades", 
		date_format(func.dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(func.salario, 2,"de_DE")) "Salário", func.cpf "CPF", 
        date_format(func.dataNasc, "%d/%m/%Y") "Data de Nascimento",
        timestampdiff(year, dataNasc, now()) "Idade",
        coalesce(concat("R$ ",format(func.comissao, 2,"de_DE")), "Não informado") "Comissao",
		coalesce(concat("R$ ",(format(salario + comissao, 2, 'de_DE'))),"Não informado") "Salário Final",
        coalesce(tel.numero, "Não informado") "Número de Telefone", 
        coalesce(crg.nome, "Não informado") "Cargo"
			from funcionario func
				left join cargo crg on crg.idCargo = func.id_Funcionario
                left join telefone tel on tel.Funcionarios_idFuncionarios = func.id_Funcionario
					order by func.nome;
	
    
select upper(func.nome) as "Funcionário", 
        coalesce(camp.nome, "Não informado") "Nome da Campanha", coalesce(camp.objetivo, "Não informado") "Objetivo", 
        coalesce(concat("R$ ",format(camp.orcamento, 2, "de_DE")), "Não informado") "Orçamento", 
        coalesce(date_format(camp.dataInicio, "%d/%m/%Y"), "Não informado")"Data de Ínicio", 
        coalesce(date_format(camp.dataFim, "%d/%m/%Y"),"Não informado") "Data do Fim"
			from funcionario func
				left join campanha camp on camp.Funcionarios_id = func.id_Funcionario
					order by func.nome;

select func.cpf "CPF", func.nome "Funcionario", 
	count(dep.cpf) "Quantidade de Dependentes"
    from funcionario func
		left join dependente dep on dep.Funcionarios_id = func.id_Funcionario
			group by func.id_Funcionario
				order by func.nome;



select cont.tipo "Tpo da conteúdo", coalesce(agen.plataforma, 'Não Possui' )"Plataforma", coalesce(agen.statusPost, 'Não Possui') "Status da Postagem", 
		coalesce(date_format(agen.dataPost, "%d/%m/%Y"), 'Não Possui') "Data da Postagem"
		from conteudo cont
			left join agendamentopost agen on agen.Conteudo_id = cont.idConteudo
				order by cont.tipo;


select forn.nome "Fornecedor", forn.cnpj "CNPJ", forn.email "E-mail",
		coalesce(date_format(tran.data, "%H:%i %d/%m/%Y"), "Não possui")"Data da Transação", 
        coalesce(concat("R$ ",format(tran.valor, 2, "de_DE")), "Não possui") "Valor da Transação",
        coalesce(tran.descricao, "Não possui") "Descrição"
	from fornecedor forn
		left join transacao tran on tran.Fornecedor_id = forn.idFornecedor
			order by forn.nome;
            
select * from Relatorio1;