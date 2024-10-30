select upper(s.nome) "Sinfonia", c.nome "Compositor"
	from Sinfonia s
		inner join Compositor c on s.Compositor_id = c.id_Compositor
			order by c.nome desc;

select upper(m.nome) "Musico", i.nome "Instrumento"
	from Musico m
		left join funcao f on m.id_Musico = f.Musico_id
		left join Instrumento i on f.Instrumento_id = i.id_Instrumento
			order by m.nome desc;

select upper(nome) "Compositor", concat(substring(cpf, 1, 3), '.', 
		substring(cpf, 4, 3), '.', 
		substring(cpf, 7, 3), '-', 
		substring(cpf, 10, 2)) "CPF do Compositor", nacionalidade "Nacionalidade", periodo "Período", 
		date_format(data_Nasc, "%d/%m/%Y")  "Data de Nascimento", 
		date_format(data_Falecimento, "%d/%m/%Y")  "Data de Falecimento", principal_Instrumento "Principal Instrumento"
		from Compositor
			where data_Nasc = (select max(data_Nasc) from Compositor);

select upper(m.nome) "Músico", o.nome "Orquestra"
	from Musico_Orquestra mo
		inner join Musico m on mo.Musico_id = m.id_Musico
		inner join Orquestra o on mo.Orquestra_id = o.id_Orquestra
			order by m.nome desc;


select s.nome "Sinfonia", 
       (select c.nome from Compositor c where c.id_Compositor = s.Compositor_id) "Compositor"
			from Sinfonia s
				order by s.nome;

select upper(m.nome) "Músico", s.nome "Sinfonia", date_format(f.data_Inicio, "%d/%m/%Y") "Data de Início"
	from funcao f
		inner join Musico m on f.Musico_id = m.id_Musico
		inner join Sinfonia s on f.Sinfonia_id = s.id_Sinfonia
			order by s.nome;

select upper(o.nome) "Orquestra", coalesce(t.numero, "Não informado") "Número de Telefone"
		from Orquestra o
			left join Telefone t on o.id_Orquestra = t.Orquestra_id
				order by o.nome;

select id_Sinfonia "ID da Sinfonia", upper(nome) "Sinfonia", movimentos "Movimento",
		descricao "Descrição", concat(duracao, 'Min') "Duração", date_format(data_Criacao, "%d/%m/%Y") "Data da Criação"
		from Sinfonia
			where duracao = (select max(duracao) from Sinfonia);

select a.local "Local de Apresentação", o.nome "Orquestra"
		from Apresentacao a
			inner join Orquestra o on a.Orquestra_id = o.id_Orquestra
				order by o.nome;

select m.nome "Músico", m.formacao "Formação", date_format(mo.data_entrada, "%d/%m/%Y") "Data de Entrada",
		concat(m.anos_Experiencia, ' Anos') "Anos de Experiencias"
		from Musico m
			left join Musico_Orquestra mo on m.id_Musico = mo.Musico_id
				order by m.anos_Experiencia desc;

select upper(nome) "Instrumento", familia "Família do Instrumento"
		from Instrumento
			where id_Instrumento = (select Instrumento_id from funcao group by Instrumento_id order by count(*) desc limit 1);

select a.local "Local de Apresentação", s.nome "Sinfonia"
	from Apresentacao_Sinfonia ap
		inner join Apresentacao a on ap.Apresentacao_id = a.id_Apresentacao
		inner join Sinfonia s on ap.Sinfonia_id = s.id_Sinfonia
			order by s.nome;


select c.id_Compositor "ID do Compositor", c.nome "Compositor", 
		count(s.nome)  "Quantidade de Sinfonias"
		from Compositor c
			left join Sinfonia s on c.id_Compositor = s.Compositor_id
				group by c.id_Compositor
					order by  count(s.nome) desc;

select upper(nome) "Nome do Músico", concat(anos_Experiencia, ' Anos') "Anos de Experiencias"
		from Musico
			where anos_Experiencia > (select avg(anos_Experiencia) from Musico)
				order by anos_Experiencia desc;

select upper(s.nome) "Sinfonia", concat(duracao, 'Min') "Duração", 
		a.local  "Local de Apresentação"
		from Apresentacao_Sinfonia ap
			inner join Sinfonia s on ap.Sinfonia_id = s.id_Sinfonia
			inner join Apresentacao a on ap.Apresentacao_id = a.id_Apresentacao
				order by concat(duracao, 'Min') desc;

select o.nome "Orquestra", upper(coalesce(m.nome, "Não Informado")) "Músico"
		from Orquestra o
			left join Musico_Orquestra mo ON o.id_Orquestra = mo.Orquestra_id
			left join Musico m ON mo.Musico_id = m.id_Musico
				order by o.nome desc;

select id_Musico "ID do Músico", upper(nome), cpf "CPF do Músico", identidade "Identidade do Músico",
		sexo "Gênero", nacionalidade "Nacionalidade", date_format(data_Nasc, "%d/%m/%Y")  "Data de Nascimento", 
        formacao "Formação do Músico", coalesce(email, "Não Informado") "E-mail", concat(anos_Experiencia, ' Anos') "Anos de Experiencias"
		from Musico
			where data_Nasc = (select max(data_Nasc) from Musico);

select m.nome "Nome do Músico", i.nome "Nome do Instrumento", s.nome  "Sinfonia Apresentadas"
	from funcao f
	inner join Musico m on f.Musico_id = m.id_Musico
	inner join Instrumento i on f.Instrumento_id = i.id_Instrumento
	inner join Sinfonia s on f.Sinfonia_id = s.id_Sinfonia
		order by s.nome;

select i.nome "Nome do Instrumento", coalesce(m.nome, 'Não Possui') "Nome do Músico"
		from Instrumento i
		left join funcao f on i.id_Instrumento = f.Instrumento_id
		left join Musico m on f.Musico_id = m.id_Musico
			order by i.nome;

select nome "Nome da Sinfonia", concat(duracao, 'Min') "Duração"
		from Sinfonia
			where duracao > (select avg(duracao) from Sinfonia)
				order by duracao desc;












