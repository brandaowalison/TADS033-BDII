-- Comandos SQL: DML - Update

update Compositor 
	set nome = 'Carlos Gomes da Silva' 
		where id_Compositor = 1;

update Musico 
	set nacionalidade = 'Argentino' 
		where id_Musico = 2;

update Sinfonia 
	set duracao = 45 
		where id_Sinfonia = 1;

update Musico_Orquestra 
	set posicao = 'Concertino' 
		where id_Musico_Orquestra = 1;

update funcao 
	set comentarios = 'Importante para a orquestra' 
		where Instrumento_id = 1 and Musico_id = 1 and Sinfonia_id = 1;

update Musico_Orquestra 
	set data_entrada = '2021-06-01' 
		where id_Musico_Orquestra = 2;

update Orquestra 
	set website = 'www.orquestrasimples.com' 
		where id_Orquestra = 1;

update Sinfonia 
	set data_Criacao = '2020-05-15' 
		where id_Sinfonia = 2;
        
update Musico 
	set formacao = 'Mestre em Música' 
		where id_Musico = 3;
        
update Orquestra 
	set numero_Musicos = 50 
		where id_Orquestra = 2;

-- Comandos SQL: DML - Delete

delete from Compositor 
	where id_Compositor = 3;

delete from Musico 
	where id_Musico = 2;

delete from Sinfonia 
WHERE id_Sinfonia = 1;

delete from Historico 
	where Musico_id = 1;

delete from funcao 
	where Instrumento_id = 1 and Musico_id = 1 and Sinfonia_id = 1;

delete from Musico_Orquestra 
	where id_Musico_Orquestra = 2;

delete from EscolaMusica.Orquestra 
	where id_Orquestra = 1;

delete from Telefone 
	where Musico_id = 1;

delete from Apresentacao 
	where id_Apresentacao = 1;

delete from Apresentacao_Sinfonia 
	where Apresentacao_id = 1 and Sinfonia_id = 1;

































SET SQL_SAFE_UPDATES = 0;