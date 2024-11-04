-- Estudando INNER JOIN, LEFT JOIN

create table users (
user_id int, 
user_name text
);

insert into users(user_id, user_name) 
values(1, 'Sergio'),
(2, 'Maria'),
(3, 'Douglas'),
(4, 'Laura'),
(5, 'Alexa');

select*from users;

create table orders (
order_id int, 
order_date date, 
user_id int
);

insert into orders (order_id, order_date, user_id)
values (1, '2023-01-15', 1),
(2, '2022-12-10', 2),
(3, '2022-11-14', null),
(4, '2022-10-26', null),
(5, '2022-09-01', 5);

select*from orders;

-- Consultando todos os usuários que tenham pedidos:
select *from users as u
				inner join orders as o 
						   on o.user_id = u.user_id;
                           
-- Consultando os pedidos com todos os dados do usuário:                           
select * from orders o 
				left join users u
							on o.user_id = u.user_id;
