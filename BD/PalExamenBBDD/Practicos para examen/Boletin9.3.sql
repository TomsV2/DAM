use pubs
go
/*
Título y tipo de todos los libros en los que alguno de los autores vive en California (CA).
*/


select distinct title as titulo, [type] as tipo
from titles as t
	join titleauthor as ta
		on t.title_id=ta.title_id
	join authors as a
		on ta.au_id=a.au_id
	
	where a.state = 'CA'  		
	
	group by title, type

	--(select * from authors
			--where [state] = 'CA')
/*
Título y tipo de todos los libros en los que ninguno de los autores vive en California (CA).
*/

	select title as titulo, [type] as tipo
	from titles as t
		join titleauthor as ta
			on t.title_id=ta.title_id
		join authors as a
			on ta.au_id=a.au_id

	except

	select title as titulo, [type] as tipo
	from titles as t
		join titleauthor as ta
			on t.title_id=ta.title_id
		join authors as a
			on ta.au_id=a.au_id
	where a.state = 'CA'  		
	
	group by title, type
/*
Número de libros en los que ha participado cada autor, incluidos los que no han publicado nada.
*/
select a.au_fname as Nombre, a.au_lname as apellido, count(title_id) as NumerodeLibros
from authors as a
	left join titleauthor as ta
		on a.au_id=ta.au_id
group by a.au_fname, a.au_lname



/*
Número de libros que ha publicado cada editorial, incluidas las que no han publicado ninguno.
*/
select p.pub_name, count(t.title_id) as NumeroDeLibros
from publishers as p
	left join titles as t
		on p.pub_id=t.pub_id
group by p.pub_name


/*
Número de empleados de cada editorial.
*/

select p.pub_name as [Nombre Editorial], count(e.pub_id) as [Numero de Empleados]
from publishers as p
	join employee as e
		on p.pub_id=e.pub_id
group by p.pub_name
	
/*
Calcular la relación entre número de ejemplares publicados y número de empleados de cada editorial, incluyendo el nombre de la misma.
*/
select ContarEmpleados.[Nombre Editorial],(NumEjemplares.NumeroDeLibros/ContarEmpleados.[Numero de Empleados]) as Relacion
from (select p.pub_name as [Nombre Editorial], count(e.pub_id) as [Numero de Empleados]
	  from publishers as p
		join employee as e
			on p.pub_id=e.pub_id
	group by p.pub_name
		) as ContarEmpleados
	join (select p.pub_name as [Nombre Editorial],  count(t.title_id) as NumeroDeLibros
			from publishers as p
				left join titles as t
					on p.pub_id=t.pub_id
			group by p.pub_name
		) as NumEjemplares
 on ContarEmpleados.[Nombre Editorial]=NumEjemplares.[Nombre Editorial]


/*
Nombre, Apellidos y ciudad de todos los autores que han trabajado para la editorial "Binnet & Hardley” o "Five Lakes Publishing”
*/
select a.au_fname, a.au_lname, a.city
from authors as a
	join titleauthor as ta
		on a.au_id=ta.au_id
	join titles as t
		on ta.title_id=t.title_id
	join publishers as p
		on t.pub_id=p.pub_id
where p.pub_name in ('Binnet & Hardley','Five Lakes Publishing')
	

/*
Empleados que hayan trabajado en alguna editorial que haya publicado algún libro en el 
que alguno de los autores fuera Marjorie Green o Michael O'Leary.
*/
select e.fname as Nombre, e.lname as Apellido
from employee as e
	join publishers as p
		on e.pub_id=p.pub_id

where p.pub_id in (select p.pub_id from publishers as p
							join titles as t
								on p.pub_id=t.pub_id
							join titleauthor as ta
								on t.title_id=ta.title_id
							join authors as a
								on ta.au_id=a.au_id 
						where a.au_fname in ('Marjoire') and a.au_lname in ('Green')
						or	a.au_fname in ('Michael') and a.au_lname in ('O''Leary')
								)


/*
Número de ejemplares vendidos de cada libro, especificando el título y el tipo.
*/

select t.title as Libro,t.[type] as tipo,sum(qty) as Cantidad
from sales as s
	join titles as t
		on s.title_id=t.title_id
group by t.title,t.[type]
/*
10.  Número de ejemplares de todos sus libros que ha vendido cada autor.
*/

select a.au_fname as Nombre,a.au_lname as Apellido,sum (qty) as Cantidad
from sales as s
	join titles as t
		on s.title_id=t.title_id
	join titleauthor as ta
		on t.title_id=ta.title_id
	join authors as a
		on ta.au_id=a.au_id
group by a.au_fname,a.au_lname
order by a.au_fname
/*
11.  Número de empleados de cada categoría (jobs).
*/
select j.job_desc as Trabajo, count (e.emp_id) as [Número de empleados]
from employee as e
	join jobs as j
		on e.job_id=j.job_id
group by j.job_desc

/*
12.  Número de empleados de cada categoría (jobs) que tiene cada editorial, incluyendo aquellas categorías en las que no haya ningún empleado.
*/
select p.pub_name as editorial,j.job_desc as Trabajo, count (e.emp_id) as [Número de empleados]
from employee as e
	full join jobs as j
		on e.job_id=j.job_id
	full join publishers as p
		on e.pub_id=p.pub_id
group by p.pub_name,j.job_desc
/*
13.  Autores que han escrito libros de dos o más tipos diferentes
*/

select distinct a.au_fname as Nombre, a.au_lname as Apellidos
from titles as t
	join titleauthor as ta
		on t.title_id=ta.title_id
	join authors as a
		on ta.au_id=a.au_id
		join (
				select a.au_id ,count(t.[type]) as [mas tipos diferentes]
					from titles as t
						join titleauthor as ta
						on t.title_id=ta.title_id
						join authors as a
						on ta.au_id=a.au_id
				group by a.au_id
				 ) as tiposdif
			on a.au_id=tiposdif.au_id
where tiposdif.[mas tipos diferentes]>=2

/*
14.  Empleados que no trabajan en editoriales que han publicado libros cuya columna notes contenga la palabra "and”
*/

select e.fname as Nombre, e.lname as Apellidos, p.pub_name as [Nombre Editorial]
from employee as e
	join publishers as p
		on e.pub_id=p.pub_id
		except
		select e.fname as Nombre, e.lname as Apellidos, p.pub_name as [Nombre Editorial]
		from employee as e
			join publishers as p
				on e.pub_id=p.pub_id
			join titles as t
				on p.pub_id=t.pub_id
		where t.notes in ('%and%')
