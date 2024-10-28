# Exercício 01: Crie um visão (view) para apresentar nome do livro, ano de publicação e preço.
create view Livros_infos as 
select titulo, ano_publicacao, preco
from livros;

select titulo, ano_publicacao, preco from Livros_infos;

# Exercício 02: Crie uma visão (view) para os funcionários que retorne quais livros estão disponíveis para empréstimo.
create view livros_disponiveis as
select titulo
from livros
where CPF_usuarioReservar is null
and CPF_usuarioRetirar is null;

select titulo from livros_disponiveis;
select*from livros;

# Exercício 03: Crie uma visão (view) para os funcionários que retorne quais livros não estão disponíveis para empréstimo.
create view livros_indisponiveis as
select titulo
from livros
where CPF_usuarioReservar is not null
or CPF_usuarioRetirar is not null;

select titulo from livros_indisponiveis;

# Exercício 04: Crie uma visão (view) para os funcionários que retorne os livros sua editora e seu autor
create view info_livros as
select l.titulo as "Livro", e.nome_editora as "Editora", a.nome as "Nome do autor"
from livros l
inner join editoras e on l.codigo_editora = e.codigo_editora
inner join livros_autores la on l.numero = la.numero_livro
inner join autores a on la.codigo_autor = a.codigo;

select * from info_livros;

# Exercício 05: Crie uma visão (view) para administrador que apresente nome do livro, seu autor, a editora, funcionário que cadastrou e o usuários que retirou.
create view vw_adm as
select l.titulo as "Livro", e.nome_editora as "Editora", a.nome as "Nome do autor",  f.nome as "Nome funcionário", u.nome as "Nome usuário"
from livros l
left join editoras e on l.codigo_editora = e.codigo_editora
left join livros_autores la on l.numero = la.numero_livro
left join autores a on la.codigo_autor = a.codigo
left join funcionarios f on f.CPF = l.CPF_funcionario
left join usuarios u on u.CPF_usuario = l.CPF_usuarioRetirar;

select * from vw_adm;

# Exercício 06: Qual é o comando para alterar uma visão (view).
create or replace view livros_indisponiveis as
select titulo, genero
from livros
where CPF_usuarioReservar is not null;

select * from livros_indisponiveis;

# Exercício 07: Qual é o comando para excluir uma visão (view).
drop view livros_indisponiveis;

# Exercício 08: O que são Views?
-- As views são uma consulta que mostram os dados de acordo com oque você estipulou,
-- views são como tabelas virtuais mas não são tabelas e sim consultas salvas.
 
# Exercício 09: Para que server as views
-- Para retornar consultas de forma perfomática, sem a necessidade de se escrever grandes códigos
-- facilitando assim o serviço economizando tempo, e garante mais segurança evitando certos dados serem vizualizados.