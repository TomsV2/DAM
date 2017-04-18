use pubs
go

/*1. Numero de libros que tratan de cada tema*/
select type as tema,COUNT (title_id) as Numero_de_libros
from titles
--where
group by type
--having
--order by

/*2. Número de autores diferentes en cada ciudad y estado*/
select state as estado, city as ciudad, Count (au_id) as Numero_de_autores
from authors
group by city,state
--having
--order by

/*3. Nombre, apellidos, nivel y antigüedad en la empresa de los empleados con un nivel entre 100 y 150.*/
select fname as nombre, lname as apellidos, job_lvl as nivel, YEAR(CURRENT_TIMESTAMP-hire_date)-1900 as Antiguedad
from employee
where job_lvl between 100 and 150
--group by
--having
--order by

/*4. Número de editoriales en cada país. Incluye el país.*/
select country as Pais, count (pub_id) as Numero_de_editoriales
from publishers
--where
group by country
--having
--order by

/*5. Número de unidades vendidas de cada libro en cada año (title_id, unidades y año).*/
select t.title_id, t.title,YEAR(ord_date) as año, SUM (Qty) as unidades
from sales as s
join titles as t
on s.title_id=t.title_id
--where
group by YEAR(ord_date),t.title_id, t.title
--having
--order by año desc

/*6. Número de autores que han escrito cada libro (title_id y numero de autores).*/
select title_id as libro_id, count(au_id) as Numero_de_autores
from titleauthor
--where
group by title_id
--having
--order by

/*7. ID, Titulo, tipo y precio de los libros cuyo adelanto inicial (advance) 
tenga un valor superior a $7.000, ordenado por tipo y título*/
select title_id as id_libro, title as titulo, type as tipo, price as precio
from titles
where advance > 7000
--group by
--having
order by tipo,titulo
