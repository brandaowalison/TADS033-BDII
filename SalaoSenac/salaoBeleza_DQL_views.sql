create view relatorio1 as
	select upper(c.nome) "Clientes", f.comentario "Comentario", f.nota "Nota do Serviço"
		from Clientes c
			join Feedbacks f ON c.Feedbacks_id = f.id_Feedback
				order by f.nota desc;

create view relatorio2 as
	select date_format(a.data, '%d/%m/%Y') "Data do Agendamento" , date_format(a.horario, '%H:%i') "Horário do Agendamento",
			upper(c.nome ) "Clientes", s.nome "Serviço", asv.quantidade "Quantidade"
			from Agendamentos a
				join Clientes c on a.Clientes_id = c.id_Cliente
				join Agendamentos_Servicos asv on a.id_Agendamentos = asv.Agendamentos_id
				join Servicos s on asv.Servicos_id = s.id_Servico
					order by asv.quantidade;
			
create view relatorio3 as
	select upper(p.nome) "Profissional", e.nome "Especialidades"
		from Profissionais p
			join Profissionais_Especialidades pe on p.id_Profissional = pe.Profissionais_id
			join Especialidades e on pe.Especialidades_id = e.id_Especialidade
				order by p.nome;

create view relatorio4 as
	select upper(c.nome) "Clientes", count(a.id_Agendamentos) "Total de Agendamentos"
		from Clientes c
			left join Agendamentos a on c.id_Cliente = a.Clientes_id
				group by c.id_Cliente;

create view relatorio5 as
	select upper(p.metedo_Pagamento) "Método de Pagamento", sum(p.valor) "Valor Total"
		from Pagamentos p
			group by p.metedo_Pagamento;

create view relatorio6 as
	select upper(c.nome) "Clientes"
		from Clientes c
			left join Agendamentos a on c.id_Cliente = a.Clientes_id
				where a.id_Agendamentos is null
					order by c.nome;

create view relatorio7 as
	select upper(nome) "Serviços", concat('R$ ', format(preco, 2, 'de_DE')) Preços
		from Servicos
			where preco > 100
				order by preco desc;

create view relatorio8 as
	select upper(c.nome) "Clientes", f.comentario "Comentários", f.nota "Nota do Serviço"
		from Feedbacks f
			join Clientes c on f.id_Feedback = c.Feedbacks_id
				where f.nota = '10';

create view relatorio9 as
	select date_format(a.data, '%d/%m/%Y') "Data dos Agendamentos", date_format(a.horario, '%H:%i') "Horário dos Agendamentos", 
			upper(c.nome) "Clientes", s.nome "Serviços"
		from Agendamentos a
			join Clientes c on a.Clientes_id = c.id_Cliente
			join Agendamentos_Servicos asv on a.id_Agendamentos = asv.Agendamentos_id
			join Servicos s on asv.Servicos_id = s.id_Servico
				where a.status_Agendamento = 'Confirmado';

create view relatorio10 as
	select upper(p.nome) "Profissionais", t.numero "Número de Telefone"
		from Profissionais p
			join Telefone_Pro t on p.id_Profissional = t.Profissionais_id;

