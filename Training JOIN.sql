select first_name, last_name, address
from customer c
join address a on c.address_id = a.address_id;
-- Usar o JOIN sem nenhuma classificação antes automáticamente é atribuído a inner join.

-- Exercício 1: faça uma consulta onde pegue o título do filme e seu idioma

# Resposta:
select f.title, l.name
from film f
inner join language l on f.language_id = l.language_id;

-- Exercício 2: Além do que ja foi feito, Adcione o idioma do filme na query
-- Questão: 
select f.title, c.name
from film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id;

# Resposta:
select f.title, c.name, l.name
from film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
inner join language l on f.language_id = l.language_id;

-- OBS - Quando a FK e a PK tiverem o mesmo nome para substituir o ON e reduzir o codigo ultilize USING(id)
select f.title, c.name, l.name
from film f
inner join film_category fc using(film_id)
inner join category c using(category_id)
inner join language l using(language_id);

-- Exercício 3: Faça uma consulta e busque o nome e sobrenome dos atores, filtre por 'CRUISE' o operador LIKE
select f.title, c.name, l.name, a.first_name, a.last_name
from film f
inner join film_category fc using(film_id)
inner join category c using(category_id)
inner join language l using(language_id)
inner join film_actor fa using(film_id)
inner join actor a using(actor_id)
where a.last_name like("%CRUISE%");

-- Exercício 4: Faça uma busca por quantidade de cidades por país
select c.country, count(city)
from city
join country c using(country_id)
group by(c.country);

-- FULL OUTER JOIN(UNION)

select c.country, ct.city
from city ct
left join country c using(country_id)
union
select c.country, ct.city
from city ct
right join  country c using(country_id);