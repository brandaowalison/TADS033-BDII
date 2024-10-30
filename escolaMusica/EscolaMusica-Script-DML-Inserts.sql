insert into EscolaMusica.Compositor (nome, CPF, data_Nasc, data_Falec, nacionalidade, periodo, principal_Estrumento) 
	values 	('Ludwig van Beethoven', '12345678901', '1770-12-17', NULL, 'Alemão', 'Clássico', 'Piano'),
			('Johann Sebastian Bach', '12345678902', '1685-03-31', '1750-07-28', 'Alemão', 'Barroco', 'Órgão'),
			('Wolfgang Amadeus Mozart', '12345678903', '1756-01-27', '1791-12-05', 'Alemão', 'Clássico', 'Piano'),
			('Frédéric Chopin', '12345678904', '1810-03-01', '1849-10-17', 'Polonês', 'Romântico', 'Piano'),
			('Pyotr Ilyich Tchaikovsky', '12345678905', '1840-05-07', '1893-11-06', 'Russo', 'Romântico', 'Orquestra'),
			('Johannes Brahms', '12345678906', '1833-05-07', '1897-04-03', 'Alemão', 'Romântico', 'Piano'),
			('Claude Debussy', '12345678907', '1862-08-22', '1918-03-25', 'Francês', 'Impressionismo', 'Piano'),
			('Gustav Mahler', '12345678908', '1860-07-07', '1911-05-18', 'Alemão', 'Romântico', 'Orquestra'),
			('Antonín Dvořák', '12345678909', '1841-09-08', '1904-05-01', 'Tcheco', 'Romântico', 'Orquestra'),
			('Richard Wagner', '12345678910', '1813-05-22', '1883-02-13', 'Alemão', 'Romântico', 'Ópera');


insert into EscolaMusica.Sinfonia (nome, movimentos, descricao, duracao, data_Criacao, Compositor_id) 
	values	('Sinfonia Nº 5', 'Allegro con brio', 'Uma das mais famosas sinfonias.', 1800, '1808-12-22', 1),
			('Sinfonia Nº 40', 'Molto Allegro', 'Sinfonia de tonalidade menor.', 30, '1788-07-25', 3),
			('Sinfonia Nº 9', 'Ode à Alegria', 'Sinfonia coro final.', 70, '1824-05-07', 1),
			('Sinfonia Patética', 'Adagio - Allegro', 'Última sinfonia de Tchaikovsky.', 48, '1893-10-28', 5),
			('Sinfonia Nº 6', 'Pastoral', 'Representa a natureza.', 46, '1808-04-05', 1),
			('Sinfonia Nº 1', 'Allegro', 'Estreia de Brahms.', 35, '1876-11-04', 6),
			('Sinfonia Nº 2', 'Allegro', 'Uma sinfonia otimista.', 35, '1883-12-30', 8),
			('Sinfonia Nº 7', 'Allegro con brio', 'Uma celebração da vida.', 60, '1883-02-27', 5),
			('Sinfonia Nº 8', 'Allegro', 'Uma sinfonia de luz e cor.', 40, '1906-01-01', 8),
			('Sinfonia Nº 3', 'Poco Allegretto', 'A sinfonia mais famosa de Brahms.', 40, '1883-12-02', 6);


insert into EscolaMusica.Instrumento (nome, pais_Origem, periodo_Historico, familia)
	values  ('Piano', 'Itália', 'Clássico', 'Cordas'),
			('Violino', 'Itália', 'Clássico', 'Cordas'),
			('Flauta', 'Alemanha', 'Clássico', 'Madeira'),
			('Trompete', 'Alemanha', 'Clássico', 'Metal'),
			('Trombone', 'Alemanha', 'Clássico', 'Metal'),
			('Violoncelo', 'Itália', 'Clássico', 'Cordas'),
			('Contrabaixo', 'Itália', 'Clássico', 'Cordas'),
			('Clarinete', 'Alemanha', 'Clássico', 'Madeira'),
			('Saxofone', 'Bélgica', 'Romântico', 'Metal'),
			('Ocarina', 'China', 'Antigo', 'Cerâmica');
			 
