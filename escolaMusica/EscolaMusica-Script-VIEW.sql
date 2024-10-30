create view Relatorio1 as
	select upper(s.nome) "Sinfonia", c.nome "Compositor"
		from Sinfonia s
			inner join Compositor c on s.Compositor_id = c.id_Compositor
				order by c.nome desc;


create view Relatorio2 as
	select upper(m.nome) "Musico", i.nome "Instrumento"
		from Musico m
			left join funcao f on m.id_Musico = f.Musico_id
			left join Instrumento i on f.Instrumento_id = i.id_Instrumento
				order by m.nome desc;


create view Relatorio3 as
	select upper(nome) "Compositor", concat(substring(cpf, 1, 3), '.', 
			substring(cpf, 4, 3), '.', 
			substring(cpf, 7, 3), '-', 
			substring(cpf, 10, 2)) "CPF do Compositor", nacionalidade "Nacionalidade", periodo "Período", 
			date_format(data_Nasc, "%d/%m/%Y")  "Data de Nascimento", 
			date_format(data_Falecimento, "%d/%m/%Y")  "Data de Falecimento", principal_Instrumento "Principal Instrumento"
			from Compositor
				where data_Nasc = (select max(data_Nasc) from Compositor);


create view Relatorio4 as
	select upper(m.nome) "Músico", o.nome "Orquestra"
		from Musico_Orquestra mo
			inner join Musico m on mo.Musico_id = m.id_Musico
			inner join Orquestra o on mo.Orquestra_id = o.id_Orquestra
				order by m.nome desc;

create view Relatorio5 as
	select s.nome "Sinfonia", 
		   (select c.nome from Compositor c where c.id_Compositor = s.Compositor_id) "Compositor"
				from Sinfonia s
					order by s.nome;
                    
                    
create view Relatorio6 as
	select upper(m.nome) "Músico", s.nome "Sinfonia", date_format(f.data_Inicio, "%d/%m/%Y") "Data de Início"
		from funcao f
			inner join Musico m on f.Musico_id = m.id_Musico
			inner join Sinfonia s on f.Sinfonia_id = s.id_Sinfonia
				order by s.nome;


create view Relatorio7 as
	select upper(o.nome) "Orquestra", coalesce(t.numero, "Não informado") "Número de Telefone"
			from Orquestra o
				left join Telefone t on o.id_Orquestra = t.Orquestra_id
					order by o.nome;


create view Relatorio8 as
	select id_Sinfonia "ID da Sinfonia", upper(nome) "Sinfonia", movimentos "Movimento",
			descricao "Descrição", concat(duracao, 'Min') "Duração", date_format(data_Criacao, "%d/%m/%Y") "Data da Criação"
			from Sinfonia
				where duracao = (select max(duracao) from Sinfonia);


create view Relatorio9 as
	select a.local "Local de Apresentação", o.nome "Orquestra"
			from Apresentacao a
				inner join Orquestra o on a.Orquestra_id = o.id_Orquestra
					order by o.nome;


create view Relatorio10 as
	select m.nome "Músico", m.formacao "Formação", date_format(mo.data_entrada, "%d/%m/%Y") "Data de Entrada",
			concat(m.anos_Experiencia, ' Anos') "Anos de Experiencias"
			from Musico m
				left join Musico_Orquestra mo on m.id_Musico = mo.Musico_id
					order by m.anos_Experiencia desc;