create view Relatorio1 as
	select nome as "Funcionário", sexo "Gênero", concat(ch, "h") "Carga-horária", email "E-mail", habilidade "Habilidades", 
				date_format(dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
				concat("R$ ",format(salario, 2,"de_DE")) "Salário", cpf "CPF", date_format(dataNasc, "%d/%m/%Y") "Data de Nascimento", 
                coalesce(concat("R$ ",format(comissao, 2,"de_DE")), 'Não Informado')"Comissao"
					from funcionario
						where id_Funcionario in (select Funcionarios_id from enderecoFunc
							where cidade like "Olinda")
								order by nome;

create view Relatorio2 as
	select nome as "Funcionário", sexo "Gênero", concat(ch, "h") "Carga-horária", email "E-mail", habilidade "Habilidades", 
		date_format(dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(salario, 2,"de_DE")) "Salário", cpf "CPF", date_format(dataNasc, "%d/%m/%Y") "Data de Nascimento", 
       coalesce(concat("R$ ",format(comissao, 2,"de_DE")), 'Não Informado')"Comissao"
			from funcionario
				where id_Funcionario in (select Funcionarios_id from enderecoFunc
					where cidade like "Recife")
						order by nome;

create view Relatorio3 as
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
                    
                    
create view Relatorio4 as
	select nome as "Funcionário", sexo "Gênero", concat(ch, "h") "Carga-horária", email "E-mail", habilidade "Habilidades", 
		date_format(dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(salario, 2,"de_DE")) "Salário", cpf "CPF", 
        date_format(dataNasc, "%d/%m/%Y") "Data de Nascimento", 
		coalesce(concat("R$ ",format(comissao, 2,"de_DE")), 'Não Informado')"Comissao"
			from funcionario
				inner join enderecoFunc on id_Funcionario = enderecoFunc.Funcionarios_id
					where enderecoFunc.cidade like "Olinda"
						order by nome;

create view Relatorio5 as
	select nome as "Funcionário", sexo "Gênero", concat(ch, "h") "Carga-horária", email "E-mail", habilidade "Habilidades", 
		date_format(dataAdmissao, "%H:%i %d/%m/%Y") "Data de Admissão", 
		concat("R$ ",format(salario, 2,"de_DE")) "Salário", cpf "CPF", 
        date_format(dataNasc, "%d/%m/%Y") "Data de Nascimento", 
        coalesce(concat("R$ ",format(comissao, 2,"de_DE")), 'Não Informado')"Comissao"
			from funcionario
				inner join enderecoFunc on id_Funcionario = enderecoFunc.Funcionarios_id
					where enderecoFunc.cidade like "Recife" or "Paulista"
						order by nome;
                        
create view Relatorio6 as
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

create view Relatorio7 as
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
                    
                    
create view Relatorio8 as
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
                    
                    
create view Relatorio9 as
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
                        
                        
create view Relatorio10 as
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