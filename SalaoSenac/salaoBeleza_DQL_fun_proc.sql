use SalaoBeleza;

-- Procedure 1: Inserir um novo cliente
delimiter $$
create procedure InserirCliente(
    in pnome varchar(45),
    in pCPF varchar(14),
    in pemail varchar(45),
    in psexo char(1),
    in pdata_Nasc date,
    in pfeedback int,
    in puf char(2), 
	in pcidade varchar(60), 
	in pbairro varchar(60), 
	in prua varchar(70), 
	in pnumero int, 
	in pcomp varchar(45), 
	in pcep varchar(9),
    in numTel1 varchar(15),
	in numTel2 varchar(15),
	in numTel3 varchar(15)
)
begin
    insert into clientes (nome, CPF, email, sexo, data_Nasc, Feedbacks_id)
		value (pnome, pCPF, pemail, psexo, pdata_Nasc, null);
	
    set @p_Clientes_id = last_insert_id();
    
    insert into enderecocli
		value (@p_Clientes_id, puf, pcidade, pbairro, prua, pnumero, pcomp, pcep);
        
	insert into telefonecli (numero, Clientes_id)
		value (numTel1, @p_Clientes_id);
	if numTel2 is not null 
		then insert into telefonecli (numero, Clientes_id)
					value (numTel2, @p_Clientes_id);
	end if;
	if numTel3 is not null 
		then insert into telefonecli (numero, Clientes_id)
					value (numTel3, @p_Clientes_id);
	end if;
end$$
delimiter ;

call InserirCliente('Maria Silva', '123.456.789-01', 'maria.silva@email.com', 'F', '1990-06-15', null, 'PE', 'Recife', 'Boa Viagem', 'Rua das Flores', 123, 
					'Apto 201', 51020330,'81999990000', null, null);
call InserirCliente('Walison Brandao', '123.246.333-01', 'walison.brandao@gmail.com', 'M', '2004-06-20', null, 'PE', 'Olinda', 'Bairro Novo', 'Rua doutor',
					1250, 'Casa', 53030034, 81999930000, null, null);


-- Procedure 2: Inserir agendamento com base no cliente e pagamento
delimiter $$
create procedure InserirAgendamento(
    in pclientes_id int,
    in ppagamentos_id int,
    in phorario time,
    in pdata date
)
begin
    insert into Agendamentos (Clientes_id, Pagamentos_id, horario, data, status_Agendamento)
        values (pclientes_id, ppagamentos_id, phorario, pdata, 'Pendente');
end$$
delimiter ;

call InserirAgendamento(28, 11, '11:00:00', '2024-12-15');
call InserirAgendamento(29, 12, '11:40:00', '2024-12-20');


-- Function 3: Calcular o total arrecadado de todos os pagamentos
delimiter $$
create function TotalArrecadado()
	returns decimal(10,2) deterministic
	begin 
		return (select sum(valor - desconto) from Pagamentos);
	end$$
delimiter ;

select concat("R$ ", format(TotalArrecadado(), 2, "de_DE")) "Total Arrecadado";


-- Function 4: Retornar o número total de clientes
delimiter $$
create function TotalClientes()
	returns int deterministic
begin
    return (select count(*) from Clientes);
end$$
delimiter ;

select TotalClientes() "Total de Clientes";


-- Procedure 5: Listar clientes que nunca fizeram agendamento
delimiter $$
create procedure ClientesSemAgendamento()
begin
    select c.nome 
    from Clientes c
		left join Agendamentos a on c.id_Cliente = a.Clientes_id
			where a.id_Agendamentos is null
				order by c.nome;
end$$
delimiter ;

call ClientesSemAgendamento();


-- Function 6: Verificar se um profissional está ativo
delimiter $$
create function VerificarProfissional(p_id int)
returns boolean deterministic
begin
    return exists (
        select 1 
        from Profissionais 
        where id_Profissional = p_id
    );
end$$
delimiter ;

select VerificarProfissional(1) "Profissional Ativo";

-- Procedure 7: Atualizar status de pagamento
delimiter $$
create procedure AtualizarStatusPagamento(
    in pid_pagamento int,
    in novo_status varchar(45)
)
begin
    update Pagamentos 
    set status_Pagamento = p_novo_status 
    where id_Pagamento = p_id_pagamento;
end$$
delimiter ;

call AtualizarStatusPagamento(1, 'Pago');


-- Procedure 8: Listar serviços mais caros
delimiter $$
create procedure ServicoMaisCaros()
begin
    select 
        upper(nome) as "Serviço", 
        concat('R$ ', format(preco, 2)) as "Preço do Serviço"
    from 
        servicos
    order by 
        preco desc
    limit 3;
end$$
delimiter ;

call ServicoMaisCaros();

-- Function 9: Calcular a média de feedbacks de um profissional
delimiter $$
create function MediaFeedbackProfissional(p_id_profissional int)
returns decimal(4,2) deterministic
begin
    declare media decimal(4,2);
	select avg(nota) "Média de notas"
	from Feedbacks f
	join Profissionais_Feedbacks pf on f.id_Feedback = pf.Feedbacks_id
	where pf.Profissionais_id = p_id_profissional;
	return media;
end$$
delimiter ;

select MediaFeedbackProfissional(10) "Média de nota do Profissional";

-- Procedure 10: Listar agendamentos de um cliente
delimiter $$
create procedure AgendamentosPorCliente(in p_cliente_id int)
begin
    select 
        a.id_Agendamentos "ID do Agendamento", date_format(a.data, '%d/%m/%Y') "Data dos Agendamentos", 
        date_format(a.horario, '%H:%i') "Horário dos Agendamentos", upper(p.status_Pagamento)  "Status de Pagamentos"
			from Agendamentos a
				join Pagamentos p on a.id_Agendamentos = p.id_Pagamento
					where a.Clientes_id = p_cliente_id
						order by a.data, a.horario;
end$$
delimiter ;

call AgendamentosPorCliente(2);
