drop database if exists TITAN;
create database TITAN;
use TITAN;

/*TABELAS*/
create table Loja (
loj_prod	Integer (8)  primary key,
desc_loj	Char (40)
);

create table Estoque(
cod_prod        integer (8)   primary key,

loj_prod        integer (8),
/*foreign key (loj_prod) references Estoque(loj_prod),*/

qtd_prod	decimal(15,3)
);

create table Produtos(
cod_prod        integer (8)   primary key,

loj_prod        integer (8),
/*foreign key (loj_prod) references Loja(loj_prod),*/


desc_prod	    Char (40),
dt_inclu_prod	date ,
preco_prod	    decimal (8,3)
);
/*TABELAS*/


/*INSERÇÕES*/
insert into Produtos 
values(170, 2, 'LEITE CONDESADO MOCOCA','2010-12-30' , 45.40);

insert into Produtos 
values(180, 3, 'x','2011-12-30' , 95.40);

insert into Produtos 
values(190, 4, 'y','2012-12-30' , 300.40);
/*INSERÇÕES*/


/*Alterando o preço do produto 170 para*/
update Produtos set preco_prod = 95.40 where cod_prod = 170;

/*Com base na tabela de “produtos” monte um select trazendo todos os registros da loja 1 e 2*/
create or replace view TodosRegistros as 
select
cod_prod	  'Código do Produto',
loj_prod      'Loja do Produto',
desc_prod     'Descrição do Produto',
dt_inclu_prod 'Data de inclusão do Produto',
preco_prod    'Preço do produto'
from Produtos

order by cod_prod;
select*from TodosRegistros;

/*Com base na tabela de “produtos” monte um select para trazer a maior e a menor data  
de inclusão do produto “dt_inclu_prod”*/
create or replace view DataInclusaoProduto as 
select
cod_prod	  'Código do Produto',
loj_prod      'Loja do Produto',
desc_prod     'Descrição do Produto',
dt_inclu_prod 'Data de inclusão do Produto',
preco_prod    'Preço do produto'
from Produtos

order by dt_inclu_prod;
select*from DataInclusaoProduto;

/*Com base na tabela de “produtos” monte um select para trazer a quantidade 
total de registros existentes na tabela de “produtos”*/
select count(cod_prod) as TotalDeProdutos
from Produtos;

/*Com base na tabela de “produtos” monte um select para trazer todos os produtos
 que comecem com a letra “L” na tabela de “produtos”*/
 create or replace view ProdutosComInicial_L as
 select
 cod_prod	  'Código do Produto',
 loj_prod      'Loja do Produto',
 desc_prod     'Descrição do Produto',
 dt_inclu_prod 'Data de inclusão do Produto',
 preco_prod    'Preço do produto'
 from     Produtos

 where    locate( 'L', desc_prod ) > 0;
 select*from ProdutosComInicial_L;
 
 /*Com base na tabela de “produtos” monte um select para trazer 
 a soma de todos os preços dos produtos totalizado por loja*/
select sum(preco_prod) as TotalPrecos 
from Produtos;

/*Com base na tabela de “produtos” monte um select para trazer a soma de todos os 
preços dos produtos totalizados por loja que seja maior que R$100.000*/
select sum(preco_prod) as ProdutosAcimaDe_100000 
from Produtos where preco_prod>100000;


/*A)Montar um unico select para trazer os seguintes campos: o código da loja do produto, 
a descrição da loja, código do produto, a descrição do produto, o preço do produto, 
a quantidade em estoque do produto. Considere  que o código da loja para esta 
consulta seja igual a 1.*/

/*
create or replace view Loja_Produto as
select 
loj_prod 'código da loja do produto',
desc_loj 'descrição da loja',
cod_prod 'código do produto',
desc_prod 'descrição do produto',
preco_prod 'preço do produto'

from
Produtos left join Loja
on Produtos.loj_prod = Loja.loj_prod
order by loj_prod;

select*from Loja_Produto;
*/





 
 




 



