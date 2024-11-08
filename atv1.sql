create database bd_formativa1;

use bd_formativa1;

/*---criaçao da tabela----*/
create table Universidade(
id_uni int primary key auto_increment,
nome varchar(255) not null,
telefone varchar(255),
bairro varchar(255),
rua varchar(255),
numero varchar(255),
cep varchar(255),
cidade varchar(255)
);

create table Estudante(
id_est int primary key auto_increment,
nome_est varchar(255) not null,
telefone varchar(255),
bairro varchar(255),
rua varchar(255),
numero varchar(255),
cep varchar(255),
cidade varchar(255),
id_uni int,
foreign key (id_uni) references Universidade(id_uni)
);

insert into Universidade(nome,telefone,bairro,rua,numero,cep,cidade)
values ("hogwarts","123456789","abracadabra","rua da bruxa","5972","1","boston"),
		("unisp","866453432","hugahuga","rua do nardo","12","2","sao paulo"),
        ("inss","987665421","aqui e la","rua dos narizes","34","3","guarei"),
        ("usp","85765889","judas","rua abixo da sua","56","4","italia"),
        ("cmsp","66666666","das cabeças","rua acima da sua","78","5","onde");
        
insert into Estudante(nome_est,telefone,bairro,rua,numero,cep,cidade,id_uni)
values ("albert eisnten","123456789","onde caiu","rua alicazan",55,"22","tatui",1),
		("maria","987654321","onde subiu","rua alicate","77",65,"guarei",3),
        ("judas","1425237838","abre","rua luamondes","99",876,"guarei",2),
        ("noah","2816354927","fecha","rua nao sei","42",106,"salvador",4),
        ("julia","98752315","laguna","rua i dont no","98",132,"unicua",5);
        
select * from Universidade;
select * from Estudante;

update Estudante
set nome_est = "Draco Malfoy"
where id_est = 1;

update Universidade
set nome = "haverd"
where id_uni = 3;

delete from Estudante
where id_est = 5;

create view vw_uni_est AS
select
	Estudante.nome_est AS nome_Estudante,
    Universidade.nome AS nome_Universidade
    
from
	Estudante
Inner join
	Universidade on Estudante.id_est = Universidade.id_uni;

select * from vw_uni_est;