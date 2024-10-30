alter table Musico_Orquestra
	modify column data_Saida date null;
    
alter table Musico 
	add email varchar(100) null;

alter table funcao 
	modify column comentarios text;

alter table Orquestra 
	add column nacionalidade varchar(45) null;
    
alter table funcao 
	change column data_Fim data_fim date;

alter table Musica.Orquestra 
	add column numero_Musicos int null;

alter table Sinfonia 
	modify column descricao varchar(255) null;

alter table Sinfonia 
	add column genero varchar(45) null;

alter table Instrumento 
	drop column periodo_Historico;

alter table compositor 
	change column data_Falec data_Falecimento date;
