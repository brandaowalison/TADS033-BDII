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


select upper(c.nome) "Clientes", COUNT(a.id_Agendamentos) "Total de Agendamentos"
	from Clientes c
		left join Agendamentos a on c.id_Cliente = a.Clientes_id
			group by c.id_Cliente;


select upper(p.metedo_Pagamento) "Método de Pagamento", sum(p.valor) "Valor Total"
	from Pagamentos p
		group by p.metedo_Pagamento;


SELECT upper(c.nome) "Clientes"
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

select date_format(a.data, '%d/%m/%Y') "Data dos Agendamentos", date_format(a.horario, '%H:%i') "Horário dos Agendamentos", upper(c.nome) "Clientes", s.nome "Serviços"
	from Agendamentos a
		join Clientes c on a.Clientes_id = c.id_Cliente
		join Agendamentos_Servicos asv on a.id_Agendamentos = asv.Agendamentos_id
		join Servicos s on asv.Servicos_id = s.id_Servico
			where a.status_Agendamento = 'Confirmado';


SELECT p.nome, t.numero
FROM Profissionais p
JOIN Telefone_Pro t ON p.id_Profissional = t.Profissionais_id;

SELECT c.nome, e.uf, e.cidade, e.bairro, e.rua
FROM Clientes c
JOIN EnderecoCli e ON c.id_Cliente = e.Clientes_id;


SELECT p.nome, COUNT(asv.Servicos_id) AS total_servicos
FROM Profissionais p
JOIN Profissionais_Especialidades pe ON p.id_Profissional = pe.Profissionais_id
JOIN Profissionais_Feedbacks pf ON p.id_Profissional = pf.Profissionais_id
JOIN Feedbacks f ON pf.Feedbacks_id = f.id_Feedback
JOIN Agendamentos_Servicos asv ON f.id_Feedback = asv.Agendamentos_id
GROUP BY p.id_Profissional;

SELECT a.id_Agendamentos, COUNT(asv.Servicos_id) AS total_servicos
FROM Agendamentos a
JOIN Agendamentos_Servicos asv ON a.id_Agendamentos = asv.Agendamentos_id
GROUP BY a.id_Agendamentos;


SELECT p.nome, TIMESTAMPDIFF(YEAR, p.data_Nasc, CURDATE()) AS anos_experiencia
FROM Profissionais p
WHERE TIMESTAMPDIFF(YEAR, p.data_Nasc, CURDATE()) > 5;


SELECT p.status_Pagamento, AVG(p.valor) AS media_valor
FROM Pagamentos p
GROUP BY p.status_Pagamento;


SELECT c.nome, a.data, p.metedo_Pagamento
FROM Clientes c
JOIN Agendamentos a ON c.id_Cliente = a.Clientes_id
JOIN Pagamentos p ON a.Pagamentos_id = p.id_Pagamento
WHERE p.status_Pagamento = 'Pago';


SELECT nome, preco
FROM Servicos
ORDER BY preco DESC
LIMIT 5;


SELECT p.nome, f.comentario
FROM Profissionais p
JOIN Profissionais_Feedbacks pf ON p.id_Profissional = pf.Profissionais_id
JOIN Feedbacks f ON pf.Feedbacks_id = f.id_Feedback
WHERE f.nota = '10';


SELECT a.data, a.horario, s.nome AS servico
FROM Agendamentos a
JOIN Agendamentos_Servicos asv ON a.id_Agendamentos = asv.Agendamentos_id
JOIN Servicos s ON asv.Servicos_id = s.id_Servico
WHERE a.Clientes_id = 1; -- Supondo que o ID do cliente seja 1


SELECT p.nome, COUNT(pe.Especialidades_id) AS total_especialidades
FROM Profissionais p
JOIN Profissionais_Especialidades pe ON p.id_Profissional = pe.Profissionais_id
GROUP BY p.id_Profissional
HAVING COUNT(pe.Especialidades_id) > 2;

