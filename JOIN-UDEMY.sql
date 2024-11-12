-- Unindo tabelas employees e salary através de inner join
select e.first_name, e.last_name, s.salary
from employees e
inner join salaries s
on e.emp_no = s.emp_no
where s.salary >= 120000
order by s.salary desc;

# Exe 01 - Ultilize o inner join, para selecionar  o primeiro nome, genero e cargo do empregado. E a relação entre as tabelas employees e titles.

select e.first_name, e.gender, t.title
from employees e
inner join titles t 
on t.emp_no = e.emp_no;
