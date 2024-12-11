-- Trigger 1: Validar o status do pagamento
delimiter $$
create trigger ValidaStatusPagamento
before insert on Pagamentos
for each row
begin
    if new.status_Pagamento not in ('Pendente', 'Concluído', 'Cancelado') then
        signal sqlstate '45000'
        set message_text = 'O status do pagamento deve ser Pendente, Concluído ou Cancelado.';
    end if ;
end$$
delimiter ;

insert into Pagamentos (metedo_Pagamento, data_Pagamento, status_Pagamento, desconto, valor) 
	values ('Cartão', '2024-12-01', 'Cancelado', 10.00, 100.00);


-- Trigger 2: Impedir exclusão de serviços utilizados
delimiter $$
create trigger ImpedeExclusaoServicos
before delete on Servicos
for each row
begin
    if exists (select 1 from Agendamentos_Servicos where Servicos_id = old.id_Servico) then
        signal sqlstate '45000'
        set message_text = 'Não é permitido excluir serviços que estão associados a agendamentos.';
    end if;
end$$
delimiter ;

select * from Agendamentos_Servicos where Servicos_id = 1;
delete from Servicos where id_Servico = 10;


-- Trigger 3: Impedir Exclusão de Cliente com Agendamento
delimiter $$
create trigger ImpedirExclusaoClienteComAgendamento
before delete on Clientes
for each row
begin
   if exists (select 1 from Agendamentos where Clientes_id = old.id_Cliente) then
      signal sqlstate '45000'
      set message_text = 'Erro: Não é possível excluir o cliente, pois ele tem agendamentos associados.';
   end if;
end $$
delimiter ;

delete from clientes 
	where id_Cliente = 1;


-- Trigger 4: Garante que nenhum cliente tenha o mesmo CPF
delimiter $$
create trigger VerificaCpfUnico
before insert on Clientes
for each row
begin
    if exists (select 1 from Clientes where CPF = new.CPF) then
        signal sqlstate '45000'
        set message_text = 'O CPF informado já está cadastrado.';
    end if;
end$$
delimiter ;

insert into Clientes (nome, CPF, email, sexo, data_Nasc)
	values ('João Silva', '123.456.789-01', 'joao@email.com', 'M', '1995-10-15');


-- Trigger 5: Verificar se a quantidade de serviços inseridos em Agendamentos_Servicos é maior que zero
delimiter $$
create trigger VerificaQuantidadeServico
before insert on Agendamentos_Servicos
for each row
begin
    if new.quantidade <= 1 then
        signal sqlstate '45000'
        set message_text = 'A quantidade de serviços deve ser maior que zero.';
    end if;
end$$
delimiter ;

insert into agendamentos_servicos (Servicos_id, Agendamentos_id, quantidade)
	values (10, 15, 2);
insert into Agendamentos_Servicos (Servicos_id, Agendamentos_id, quantidade)
	values (1, 10, 0);
            

