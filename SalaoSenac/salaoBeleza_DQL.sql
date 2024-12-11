select upper(c.nome) "Clientes", f.comentario "Comentario", f.nota "Nota do Serviço"
	from Clientes c
		join Feedbacks f ON c.Feedbacks_id = f.id_Feedback
			order by f.nota desc;

select date_format(a.data, '%d/%m/%Y') "Data do Agendamento" , date_format(a.horario, '%H:%i') "Horário do Agendamento",
		upper(c.nome ) "Clientes", s.nome "Serviço", asv.quantidade "Quantidade"
		from Agendamentos a
			join Clientes c on a.Clientes_id = c.id_Cliente
			join Agendamentos_Servicos asv on a.id_Agendamentos = asv.Agendamentos_id
			join Servicos s on asv.Servicos_id = s.id_Servico
				order by asv.quantidade;
                
select upper(p.nome) "Profissional", e.nome "Especialidades"
	from Profissionais p
		join Profissionais_Especialidades pe on p.id_Profissional = pe.Profissionais_id
		join Especialidades e on pe.Especialidades_id = e.id_Especialidade
			order by p.nome;


select upper(c.nome) "Clientes", count(a.id_Agendamentos) "Total de Agendamentos"
	from Clientes c
		left join Agendamentos a on c.id_Cliente = a.Clientes_id
			group by c.id_Cliente;


select upper(p.metedo_Pagamento) "Método de Pagamento", sum(p.valor) "Valor Total"
	from Pagamentos p
		group by p.metedo_Pagamento;


select upper(c.nome) "Clientes"
	from Clientes c
		left join Agendamentos a on c.id_Cliente = a.Clientes_id
			where a.id_Agendamentos is null
				order by c.nome;


select upper(nome) "Serviços", concat('R$ ', format(preco, 2, 'de_DE')) Preços
	from Servicos
		where preco > 100
			order by preco desc;

select upper(c.nome) "Clientes", f.comentario "Comentários", f.nota "Nota do Serviço"
	from Feedbacks f
		join Clientes c on f.id_Feedback = c.Feedbacks_id
			where f.nota = '10';

select date_format(a.data, '%d/%m/%Y') "Data dos Agendamentos", date_format(a.horario, '%H:%i') "Horário dos Agendamentos", 
		upper(c.nome) "Clientes", s.nome "Serviços"
	from Agendamentos a
		join Clientes c on a.Clientes_id = c.id_Cliente
		join Agendamentos_Servicos asv on a.id_Agendamentos = asv.Agendamentos_id
		join Servicos s on asv.Servicos_id = s.id_Servico
			where a.status_Agendamento = 'Confirmado';


select upper(p.nome) "Profissionais", t.numero "Número de Telefone"
	from Profissionais p
		join Telefone_Pro t on p.id_Profissional = t.Profissionais_id;

select upper(c.nome) "Clientes", e.uf "Estado", e.cidade "Cidade", e.bairro "Bairro", e.rua "Rua"
	from Clientes c
		join EnderecoCli e on c.id_Cliente = e.Clientes_id;


select upper(p.nome) "Profissionais", count(asv.Servicos_id) "Total de Serviços"
	from Profissionais p
		join Profissionais_Especialidades pe on p.id_Profissional = pe.Profissionais_id
		join Profissionais_Feedbacks pf on p.id_Profissional = pf.Profissionais_id
		join Feedbacks f on pf.Feedbacks_id = f.id_Feedback
		join Agendamentos_Servicos asv on f.id_Feedback = asv.Agendamentos_id
			group by p.id_Profissional;

select a.id_Agendamentos "Agendamentos", count(asv.Servicos_id) "Total de Serviços"
	from Agendamentos a
		join Agendamentos_Servicos asv on a.id_Agendamentos = asv.Agendamentos_id
			group by a.id_Agendamentos;


select upper(p.nome) "Profissionais", concat(timestampdiff(year, p.data_Nasc, CURDATE()), ' anos') " Anos de Experiências"
	from Profissionais p
		where timestampdiff(YEAR, p.data_Nasc, CURDATE()) > 5
         order by timestampdiff(YEAR, p.data_Nasc, CURDATE()) desc;


select upper(p.status_Pagamento) "Status de Pagamentos", concat("R$ ", format(avg(p.valor), 2, "de_DE")) "Média dos Pagamentos" 
	from Pagamentos p
		group by p.status_Pagamento;


select upper(c.nome) "Clientes", date_format(a.data, '%d/%m/%Y') "Data do Agendamento", p.metedo_Pagamento "Método de Pagamento"
	from Clientes c
		join Agendamentos a ON c.id_Cliente = a.Clientes_id
		join Pagamentos p ON a.Pagamentos_id = p.id_Pagamento
			where p.status_Pagamento = 'Pago';


select upper(nome) "Serviços", concat("R$ ", format(preco, 2, 'de_DE')) "Preço do Serviço"
	from Servicos
		order by preco desc
			limit 5;


select upper(p.nome) "Profissionais", f.comentario "Feedbacks"
	from Profissionais p
		join Profissionais_Feedbacks pf on p.id_Profissional = pf.Profissionais_id
		join Feedbacks f on pf.Feedbacks_id = f.id_Feedback
			where f.nota = '10';


select date_format(a.data, '%d/%m/%Y') "Data do Agendamento", date_format(a.horario, '%H:%i') "Horário dos Agendamentos", s.nome "Serviço"
	from Agendamentos a
		join Agendamentos_Servicos asv on a.id_Agendamentos = asv.Agendamentos_id
		join Servicos s on asv.Servicos_id = s.id_Servico
			where a.Clientes_id = 1;


select upper(p.nome) "Profissionais", count(pe.Especialidades_id) "Especialidades"
	from Profissionais p
		join Profissionais_Especialidades pe on p.id_Profissional = pe.Profissionais_id
		group by p.id_Profissional
			having count(pe.Especialidades_id) > 2;

