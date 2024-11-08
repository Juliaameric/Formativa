create database bd_formativa;

use bd_formativa;

/*---criaçao da tabela aeronave----*/
create table Aeronave(
id_nave int primary key auto_increment,
nome varchar(255) not null,
comunicador varchar(255),
destino varchar(255)
);

create table Passageiro(
id_ps int primary key auto_increment,
nome varchar(255) not null,
endereco varchar(255),
telefone varchar(255),
id_nave int,
foreign key (id_nave) references Aeronave(id_nave)
);

insert into Aeronave(nome,comunicador,destino)
values ("nave 1","1a","frança"),
		("nave 2","2b","lagoas"),
        ("nave 3","3c","espanha"),
        ("nave 4","4d","paris"),
        ("nave 5","5f","rio de janeiro");
        
insert into Passageiro(nome,endereco,telefone,id_nave)
values ("albert eisnten","123456789","1233 rua 90",1),
		("maria","987654321","44 rua 67",3),
        ("judas","1425237838","56 rua cesar",2),
        ("noah","2816354927","87 rua newton",4),
        ("julia","98752315","1 rua inicio",5);
        
/*consultar as tabelas*/
select * from Aeronave;
select * from Passageiro;

/*renomear*/
update Passageiro
set nome = "alberto roberto"
where id_ps = 1;

update Aeronave
set nome = "super nave"
where id_nave = 3;

/*deletar*/
delete from Passageiro
where id_ps = 5;

/*criando uma view/tabela*/
create view vw_passa_voa AS
/*selecionar quem viajou, a nave e o destino*/
select
	Passageiro.nome AS nome_Passageiro,
    Aeronave.nome AS nome_Aeronave,
    Aeronave.destino AS destino_Aeronave
from
	Passageiro
Inner join
	Aeronave on Passageiro.id_nave = Aeronave.id_nave;

/*mostrando a view*/
select * from vw_passa_voa;