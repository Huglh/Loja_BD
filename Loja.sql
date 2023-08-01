create database lojas_2b2;
use lojas_2b2;
create table empresa
(
codigo int unsigned auto_increment not null,
nome varchar(60) not null,
endereco varchar(45) not null,
telefone varchar(45) not null,
email varchar(80) not null,
primary key(codigo) 
)engine=innodb;
create table clientes
(
codigo int unsigned auto_increment not null,
nome varchar(45) not null,
endereco varchar(45) not null,
telefone varchar(45) not null,
cidade varchar(45) not null,
estado char(2) not null,
email varchar(80) not null,
primary key(codigo)
)engine=innodb;
create table lojas
(
codigo int unsigned auto_increment not null,
nome varchar(80) not null,
endereco varchar(50) not null,
cidade varchar(50) not null,
tipo_loja varchar(50) not null,
empresa_codigo int unsigned not null,
primary key(codigo),
foreign key(empresa_codigo) references empresa(codigo)
)engine=innodb;
create table produtos
(
id int unsigned auto_increment not null,
descricao varchar(100) not null,
valor double(9,2) not null,
quantidade int unsigned not null,
observacao varchar(100) not null,
lojas_codigo int unsigned not null,
primary key(id),
foreign key(lojas_codigo) references lojas(codigo)
)engine=innodb;
create table empregados
(
codigo int unsigned auto_increment not null,
nome varchar(45) not null,
endereço varchar(45) not null,
telefone varchar(45) not null,
cidade  varchar(45) not null,
estado char(2) not null,
email varchar(80) not null,
lojas_codigo int unsigned not null,
primary key(codigo),
foreign key(lojas_codigo) references lojas(codigo)
)engine=innodb;
create table vendas
(
idVendas int unsigned auto_increment not null,
data date not null,
total double(9,2) not null,
hora time not null,
observacoes varchar(60) not null,
lojas_codigo int unsigned not null,
Clientes_codigo int unsigned not null,
primary key(idVendas),
foreign key(lojas_codigo) references lojas(codigo),
foreign key(Clientes_codigo) references clientes(codigo)
)engine=innodb;
create table itens_Venda
(
numero int unsigned auto_increment not null,
valor_unitario double(9,2) not null,
quantidade int unsigned not null,
Vendas_idVendas int unsigned not null,
Produtos_id int unsigned not null,
primary key(numero),
foreign key(Vendas_idVendas) references vendas(idVendas),
foreign key(Produtos_id) references produtos(id)
)engine=innodb;

-- 3) Inserir 3 Empresa;
desc empresa;
select*from empresa;
insert into empresa(codigo,nome,endereco,telefone,email) values (null,"Mimicando","Rua Palmeiras","(31) 97364-3098","mimicando@gmail.com.br");
insert into empresa(codigo,nome,endereco,telefone,email) values (null,"Firstline","Rua Olivara","(31) 97364-9830","firstline@gmail.com.br");
insert into empresa(codigo,nome,endereco,telefone,email) values (null,"Asus","Rua Gustavo","(31) 96473-3098","asusu@gmail.com.br");
-- 4) Inserir 3 Lojas
desc lojas;
select*from lojas;
insert into lojas(codigo,nome ,endereco,cidade,tipo_loja,empresa_codigo) values(null,"Mimicando BH","Av Contorno 209","Belo Horizonte","Brinquedo",1);
insert into lojas(codigo,nome ,endereco,cidade,tipo_loja,empresa_codigo) values(null,"Mimicando RJ","Av Vargem Pequena 210","Rio de Janeiro","Brinquedo",1);
insert into lojas(codigo,nome ,endereco,cidade,tipo_loja,empresa_codigo) values(null,"Mimicando SP","Av Principal 29","Sao Paulo","Brinquedo",1);
-- 5) Inserir 3 Empregados
desc empregados;
select*from empregados;
insert into empregados(codigo,nome,endereço,telefone,cidade,estado,email,lojas_codigo) values(null,"Peppa Pig","Rua cinco 209","(31) 9432-3420","Belo Horizonte","MG","peppapig@gmail.com",1);
insert into empregados(codigo,nome,endereço,telefone,cidade,estado,email,lojas_codigo) values(null,"Jorge Pig","Rua quatro 29","(31) 9432-2034","Belo Horizonte","MG","jorgepig@gmail.com",1);
insert into empregados(codigo,nome,endereço,telefone,cidade,estado,email,lojas_codigo) values(null,"indio Pig","Rua treze 20","(31) 3294-3420","Belo Horizonte","MG","indiopig@gmail.com",1);
-- 6) Inserir 3 Clientes.
desc clientes;
select*from clientes;
insert into clientes(codigo,nome,endereco,telefone,cidade,estado,email) values(null,"Zed","Inferno 666","(666) 3124-6661","Ouro preto","MG","zedzinho24@gmail.com");
insert into clientes(codigo,nome,endereco,telefone,cidade,estado,email) values(null,"Lux","Ceu 999","(999) 3124-6661","Lagoa Santa","MG","luxzinha24@gmail.com");
insert into clientes(codigo,nome,endereco,telefone,cidade,estado,email) values(null,"Garen","Terra 888","(888) 3124-6661","Uberlandia","MG","garenzinho24@gmail.com");
-- 7) Inserir 3 Produtos
desc produtos;
select*from produtos;
insert into produtos(id,descricao,valor,quantidade,observacao,lojas_codigo) values(null,"Submarino Remoto","150","2000","Profundidade Maxima de 5 metros",1);
insert into produtos(id,descricao,valor,quantidade,observacao,lojas_codigo) values(null,"carro Remoto","100","2000","Cuidado com Terrenos irregulares",1);
insert into produtos(id,descricao,valor,quantidade,observacao,lojas_codigo) values(null,"drone","1500","20","Altura Maxima de 50 metros",1);
-- 8) Inserir 3 Vendas
desc vendas;
select*from vendas;
insert into vendas(idVendas,data,total,hora,observacoes,lojas_codigo,Clientes_codigo) values(null,"20210610",250,"11:25","Submarino Remoto é Carro Remoto",1,1);
insert into vendas(idVendas,data,total,hora,observacoes,lojas_codigo,Clientes_codigo) values(null,"20210510",250,"11:25","Submarino Remoto é Carro Remoto",1,2);
insert into vendas(idVendas,data,total,hora,observacoes,lojas_codigo,Clientes_codigo) values(null,"20210510",1750,"11:25","Submarino Remoto,Drone  é Carro Remoto",1,3);
-- 9) Inserir 3 Itens_Vendas
desc itens_venda;
select*from itens_venda;
insert into itens_venda(numero,valor_unitario,quantidade,Vendas_idVendas,Produtos_id) values(null,"150",1,1,1);
insert into itens_venda(numero,valor_unitario,quantidade,Vendas_idVendas,Produtos_id) values(null,"10",1,1,2);
insert into itens_venda(numero,valor_unitario,quantidade,Vendas_idVendas,Produtos_id) values(null,"1500",1,3,3);
-- 10) Apagar todas vendas com valor maior que 100
delete vendas from lojas_2b2 where total > 100;
-- 11) Selecionar todas lojas do tipo ‘Supermercado’
select*from lojas where tipo_loja = "Supermercado";
-- 13) Selecionar todas as vendas com valor entre 50,00 a 250,00
select*from vendas where total between 50 and 250;
-- 14) Selecionar os clientes que moram no estado de SP
select*from clientes where estado = "SP";
-- 15) Quantos produtos estão cadastrados com valor maior que 200,00
select sum(id) from produtos where valor > 200;
-- 16) Qual o nome e valor do produto com quantidade menor que 20
select descricao,valor from produtos where quantidade < 20;
-- 17) Qual a média de valor as vendas realizadas entre janeiro e fevereiro de 2012.
select avg(total) from vendas where data between 20120101 and 20120231;
-- 18) Quantas lojas possuem a empresa de codigo 2
select sum(codigo) from lojas where empresa_codigo= 1;
-- 19) Qual a média de vendas realizadas entre o horário de 19:00 às 22:00
select avg(total) from vendas where hora between "19:00" and "22:00";
-- 20) Selecionar nome e endereco de todos os clientes que moram em mg e sp ordenados por nome
select nome from clientes where estado ="MG" or "SP" order by nome;
-- 21) Quantos itens_vendas possuem quantidade maior que 10.
select sum(quantidade) from itens_venda where quantidade > 10;
-- 22) Selecionar todas os itens_venda com quantidade entre 2 e 5
select*from itens_venda where quantidade between 2 and 5;
-- 23) Qual a média de valor unitário dos itens de venda com quantidade maior que 3
select avg(quantidade) from itens_venda where quantidade > 3;
-- 24) Selecionar descrição, valor e quantidade dos produtos com id entre 15 e 30
select descricao,valor,quantidade from produtos where id between 15 and 30;
-- 25) Apagar todos os produtos com valor inferior a 1,00.
delete produtos from lojas_2b2 where valor < 1;
