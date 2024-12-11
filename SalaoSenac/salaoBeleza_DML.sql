INSERT INTO Feedbacks (comentario, data_Feedback, nota) VALUES 
('Excelente atendimento!', '2024-12-01', '10'),
('Muito bom, recomendo.', '2024-11-25', '9'),
('Ótimo serviço.', '2024-11-20', '9'),
('Atendimento rápido e eficiente.', '2024-11-15', '8'),
('Satisfeito com o corte.', '2024-11-10', '8'),
('Bom, mas pode melhorar.', '2024-11-05', '7'),
('Atrasou um pouco.', '2024-11-01', '6'),
('Equipe muito simpática.', '2024-10-25', '10'),
('Gostei bastante do serviço.', '2024-10-20', '9'),
('Serviço mediano.', '2024-10-15', '5');


INSERT INTO Clientes (nome, CPF, email, sexo, data_Nasc, Feedbacks_id) VALUES 
('Ana Silva', '123.456.789-00', 'ana@email.com', 'F', '1990-05-10', 1),
('Carlos Souza', '987.654.321-11', 'carlos@email.com', 'M', '1985-08-25', 2),
('Maria Oliveira', '123.123.123-22', 'maria@email.com', 'F', '1995-12-15', 3),
('João Lima', '456.456.456-33', 'joao@email.com', 'M', '1988-07-30', 4),
('Beatriz Costa', '789.789.789-44', 'beatriz@email.com', 'F', '2000-03-20', 5),
('Pedro Mendes', '321.321.321-55', 'pedro@email.com', 'M', '1992-10-10', 6),
('Julia Santos', '654.654.654-66', 'julia@email.com', 'F', '1999-11-05', 7),
('Lucas Ferreira', '987.987.987-77', 'lucas@email.com', 'M', '1987-06-15', 8),
('Gabriela Rocha', '741.852.963-88', 'gabi@email.com', 'F', '1994-02-28', 9),
('Mateus Almeida', '852.741.963-99', 'mateus@email.com', 'M', '1986-01-05', 10);


INSERT INTO TelefoneCli (id_Telefone, numero, Clientes_id) VALUES 
(1, 81999999999, 1),
(2, 81988888888, 2),
(3, 81977777777, 3),
(4, 81966666666, 4),
(5, 81955555555, 5),
(6, 81944444444, 6),
(7, 81933333333, 7),
(8, 81922222222, 8),
(9, 81911111111, 9),
(10, 81900000000, 10);


INSERT INTO EnderecoCli (Clientes_id, UF, cidade, bairro, rua, numero, comp, cep) VALUES 
(1, 'PE', 'Recife', 'Boa Viagem', 'Rua A', 100, 'Apto 1', 50000000),
(2, 'PE', 'Olinda', 'Carmo', 'Rua B', 200, NULL, 50000001),
(3, 'PE', 'Jaboatão', 'Piedade', 'Rua C', 300, NULL, 50000002),
(4, 'PE', 'Paulista', 'Centro', 'Rua D', 400, 'Casa', 50000003),
(5, 'PE', 'Recife', 'Casa Forte', 'Rua E', 500, NULL, 50000004),
(6, 'PE', 'Olinda', 'Bairro Novo', 'Rua F', 600, 'Apto 2', 50000005),
(7, 'PE', 'Cabo', 'Centro', 'Rua G', 700, NULL, 50000006),
(8, 'PE', 'Recife', 'Boa Vista', 'Rua H', 800, NULL, 50000007),
(9, 'PE', 'Olinda', 'Rio Doce', 'Rua I', 900, 'Casa', 50000008),
(10, 'PE', 'Ipojuca', 'Porto', 'Rua J', 1000, NULL, 50000009);


INSERT INTO Pagamentos (metedo_Pagamento, data_Pagamento, status_Pagamento, desconto, valor) VALUES 
('Cartão', '2024-12-01', 'Pago', 10.00, 100.00),
('Dinheiro', '2024-12-02', 'Pago', 5.00, 80.00),
('PIX', '2024-12-03', 'Pendente', 0.00, 50.00),
('Cartão', '2024-12-04', 'Pago', 0.00, 150.00),
('Dinheiro', '2024-12-05', 'Pago', 20.00, 200.00),
('Cartão', '2024-12-06', 'Pago', 15.00, 300.00),
('PIX', '2024-12-07', 'Pendente', 5.00, 120.00),
('Dinheiro', '2024-12-08', 'Pago', 0.00, 100.00),
('Cartão', '2024-12-09', 'Pago', 10.00, 250.00),
('PIX', '2024-12-10', 'Pendente', 0.00, 180.00);


INSERT INTO Servicos (nome, preco, duracao, descricao) VALUES 
('Corte de cabelo', 30.00, '00:30:00','Corte masculino simples'),
('Pintura', 120.00, '01:30:00', 'Coloração completa'),
('Manicure', 50.00, '00:45:00', 'Manicure com esmaltação'),
('Pedicure', 60.00, '00:50:00', 'Cuidado completo dos pés'),
('Hidratação capilar', 80.00, '01:00:00', 'Hidratação profunda'),
('Depilação', 100.00, '01:15:00', 'Depilação completa'),
('Escova', 40.00, '00:45:00', 'Modelagem com escova'),
('Maquiagem', 150.00, '01:00:00', 'Maquiagem para festas'),
('Corte infantil', 25.00, '00:20:00', 'Corte para crianças'),
('Progressiva', 250.00, '02:30:00', 'Alisamento capilar progressivo');


INSERT INTO agendamentos (horario, status_Agendamento, data, Clientes_id, Pagamentos_id) VALUES
('09:00:00', 'Confirmado', '2024-12-06', 1, 1),
('10:30:00', 'Pendente', '2024-12-06', 2, 2),
('11:00:00', 'Confirmado', '2024-12-06', 3, 3),
('14:00:00', 'Cancelado', '2024-12-06', 4, 4),
('15:00:00', 'Confirmado', '2024-12-06', 5, 5),
('16:00:00', 'Pendente', '2024-12-06', 6, 6),
('17:00:00', 'Confirmado', '2024-12-06', 7, 7),
('18:00:00', 'Pendente', '2024-12-06', 8, 8),
('19:00:00', 'Confirmado', '2024-12-06', 9, 9),
('20:00:00', 'Cancelado', '2024-12-06', 10, 10);



INSERT INTO agendamentos_servicos (Servicos_id, Agendamentos_id, quantidade) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 1),
(5, 5, 2),
(6, 6, 1),
(7, 7, 4),
(8, 8, 2),
(9, 9, 3),
(10, 10, 1);


INSERT INTO profissionais (nome, CPF, email, sexo, salario, data_Nasc) VALUES
('João Silva', '123.456.789-00', 'joao.silva@email.com', 'M', 2500.00, '1985-06-15'),
('Maria Oliveira', '234.567.890-11', 'maria.oliveira@email.com', 'F', 3200.00, '1990-07-22'),
('Carlos Santos', '345.678.901-22', 'carlos.santos@email.com', 'M', 2800.00, '1987-03-30'),
('Ana Souza', '456.789.012-33', 'ana.souza@email.com', 'F', 3100.00, '1992-01-11'),
('Roberto Lima', '567.890.123-44', 'roberto.lima@email.com', 'M', 3500.00, '1980-09-25'),
('Fernanda Costa', '678.901.234-55', 'fernanda.costa@email.com', 'F', 2900.00, '1988-11-03'),
('Lucas Pereira', '789.012.345-66', 'lucas.pereira@email.com', 'M', 3300.00, '1991-05-18'),
('Juliana Almeida', '890.123.456-77', 'juliana.almeida@email.com', 'F', 2700.00, '1993-12-09'),
('Felipe Rocha', '901.234.567-88', 'felipe.rocha@email.com', 'M', 3200.00, '1986-04-02'),
('Patrícia Martins', '012.345.678-99', 'patricia.martins@email.com', 'F', 2600.00, '1995-08-21');


INSERT INTO Endereco_Pro (Profissionais_id, UF, cidade, bairro, rua, numero, comp, cep) VALUES
(1, 'PE', 'Recife', 'Boa Viagem', 'Rua A', 100, 'Apto 1', 50000000),
(2, 'PE', 'Olinda', 'Carmo', 'Rua B', 200, NULL, 50000001),
(3, 'PE', 'Jaboatão', 'Piedade', 'Rua C', 300, NULL, 50000002),
(4, 'PE', 'Paulista', 'Centro', 'Rua D', 400, 'Casa', 50000003),
(5, 'PE', 'Recife', 'Casa Forte', 'Rua E', 500, NULL, 50000004),
(6, 'PE', 'Olinda', 'Bairro Novo', 'Rua F', 600, 'Apto 2', 50000005),
(7, 'PE', 'Cabo', 'Centro', 'Rua G', 700, NULL, 50000006),
(8, 'PE', 'Recife', 'Boa Vista', 'Rua H', 800, NULL, 50000007),
(9, 'PE', 'Olinda', 'Rio Doce', 'Rua I', 900, 'Casa', 50000008),
(10, 'PE', 'Ipojuca', 'Porto', 'Rua J', 1000, NULL, 50000009);


INSERT INTO Telefone_Pro (id_Telefone_Pro, numero, Profissionais_id) VALUES
(1, '81912345678', 1),
(2, '81913456789', 2),
(3, '81914567890', 3),
(4, '81915678901', 4),
(5, '81916789012', 5),
(6, '81917890123', 6),
(7, '81918901234', 7),
(8, '81919012345', 8),
(9, '81920123456', 9),
(10, '81921234567', 10);


INSERT INTO profissionais_feedbacks(Profissionais_id, feedbacks_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


INSERT INTO especialidades (nome, preco_Base, descricao) VALUES
('Corte de Cabelos', 50.00, 'Corte de cabelo masculino, feminino e infantil, de acordo com o estilo desejado.'),
('Penteados', 80.00, 'Penteados para eventos, festas e casamentos, com técnicas especiais.'),
('Coloração de Cabelos', 120.00, 'Coloração completa, mechas, reflexos e tinturas personalizadas.'),
('Tratamentos Capilares', 70.00, 'Tratamentos de hidratação, reconstrução e nutrição para diversos tipos de cabelo.'),
('Maquiagem', 100.00, 'Maquiagem para festas, casamentos e outras ocasiões especiais.'),
('Design de Sobrancelhas', 40.00, 'Modelagem, henna, micropigmentação e design de sobrancelhas.'),
('Manicure e Pedicure', 30.00, 'Cuidados com as unhas, esmaltação, gel e alongamento de unhas.'),
('Depilação', 50.00, 'Depilação com cera, linha ou laser para diversas regiões do corpo.'),
('Alongamento de Cílios', 90.00, 'Extensão de cílios fio a fio ou volume russo, com material de alta qualidade.'),
('Micropigmentação', 150.00, 'Micropigmentação de sobrancelhas, lábios e contorno ocular.');



INSERT INTO profissionais_especialidades (Profissionais_id, Especialidades_id, certificado, nivel_Experiencia) VALUES
(1, 1, 'Certificado de Corte de Cabelos Profissional', 3),
(2, 2, 'Certificado de Penteados Avançados', 2),
(3, 3, 'Certificado de Colorimetria Capilar', 1),
(4, 4, 'Certificado de Tratamentos Capilares Avançados', 3),
(5, 5, 'Certificado de Maquiagem Profissional', 2),
(6, 6, 'Certificado de Design de Sobrancelhas', 3),
(7, 7, 'Certificado de Manicure e Pedicure Profissional', 1),
(8, 8, 'Certificado de Depilação com Cera e Laser', 2),
(9, 9, 'Certificado de Alongamento de Cílios', 3),
(10, 10, 'Certificado de Micropigmentação Avançada', 2);


INSERT INTO Profissionais_Especialidades (Profissionais_id, Especialidades_id) VALUES 
(1, 2),
(1, 3);

INSERT INTO Profissionais_Especialidades (Profissionais_id, Especialidades_id) VALUES 
(2, 4);

INSERT INTO Profissionais_Especialidades (Profissionais_id, Especialidades_id) VALUES 
(3, 5),
(3, 6),
(3, 7);

INSERT INTO Profissionais_Especialidades (Profissionais_id, Especialidades_id) VALUES 
(5, 8),
(5, 9);

INSERT INTO Clientes (id_Cliente, nome, CPF, email, sexo, data_Nasc, Feedbacks_id) VALUES
(11, 'Ana Silva', '123.456.789-01', 'ana.silva@email.com', 'F', '1990-05-15', 1),
(12, 'Carlos Oliveira', '987.654.321-02', 'carlos.oliveira@email.com', 'M', '1985-10-20', 2),
(13, 'Beatriz Santos', '456.789.123-03', 'beatriz.santos@email.com', 'F', '1993-02-11', 3),
(14, 'Eduardo Lima', '321.654.987-04', 'eduardo.lima@email.com', 'M', '1980-08-05', 4),
(15, 'Fernanda Costa', '654.321.987-05', 'fernanda.costa@email.com', 'F', '1995-07-22', 5);

INSERT INTO Agendamentos (id_Agendamentos, horario, status_Agendamento, data, Clientes_id, Pagamentos_id) VALUES
(11, '09:00:00', 'Confirmado', '2024-12-12', 1, 1),
(12, '14:00:00', 'Pendente', '2024-12-13', 3, 2),
(13, '16:00:00', 'Confirmado', '2024-12-14', 5, 3);

insert into Feedbacks (comentario, data_Feedback, nota)
	values('Satisfeito com o corte.', '2024-11-09', '10'),
		('Bom, mas pode melhorar.', '2024-11-01', '5'),
		('Serviço excelente.', '2024-11-04', '9');
	

insert into Feedbacks (comentario, data_Feedback, nota)
	values('Serviço maravilhoso.', '2024-11-04', '10'),
		('Simplesmente não gostei.', '2024-11-04', '3');


insert into pagamentos(metedo_Pagamento, data_Pagamento, status_Pagamento, desconto, valor)
	values('Cartão', '2024-12-01', 'Pendente', 10.00, 100.00),
			('Cartão', '2024-12-01', 'Pendente', 10.00, 200.00);

