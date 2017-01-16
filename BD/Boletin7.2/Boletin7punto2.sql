USE Bichos
GO

DROP DATABASE Boletin7punto2
GO

CREATE DATABASE Boletin7punto2
GO

USE Boletin7punto2
GO

--6. Nombre completo (nombre y apellido) y dirección completa de todos los autores que no viven en California ni en Oregón.
SELECT au_fname, au_lname, state, city, address FROM authors WHERE state NOT IN ('CA', 'OR')

--7. Nombre completo y dirección completa de todos los autores cuyo apellido empieza por D, G o S.
SELECT au_fname, au_lname, state, city, address FROM authors WHERE au_lname LIKE '[DGS]%'

--8. ID, nivel y nombre completo de todos los empleados con un nivel inferior a 100, ordenado alfabéticamente.
SELECT emp_id, fname, lname, job_lvl FROM employee WHERE job_lvl<100 ORDER BY fname ASC



--MODIFICACIÓN DE DATOS--

--1. Inserta un nuevo autor.
SELECT * FROM authors

INSERT INTO authors 
	(au_id, au_lname, au_fname, phone, address,city, state, zip, contract)
	VALUES ('574-98-2315', 'Moore', 'Alan', 696969696, NULL, 'Northampton', NULL, 99999, 1)

--2. Inserta dos libros, escritos por el autor que has insertado antes y publicados por la editorial "Ramona publishers”.
SELECT * FROM titles
SELECT * FROM publishers

INSERT INTO titles
	(title_id, title, type, pub_id, price, advance, royalty, ytd_sales, notes, pubdate)
	VALUES ('FX1111', 'V de Vendetta', 'FX', 1756, 19.99, 5000, NULL, NULL, 'Un comic MIEO', DEFAULT)

INSERT INTO titles
	(title_id, title, type, pub_id, price, advance, royalty, ytd_sales, notes, pubdate)
	VALUES ('FX1112', 'La liga de los hombres extraordinarios', 'FX', 1756, 14.99, 5000, NULL, NULL, 'Otro comic MIEO', DEFAULT)

--3. Modifica la tabla jobs para que el nivel mínimo sea 90.
SELECT * FROM jobs

UPDATE jobs
	SET min_lvl = 90
	WHERE min_lvl <= 90

--4. Crea una nueva editorial (publishers) con ID 9908, nombre Mostachon Books y sede en Utrera.
SELECT * FROM publishers

INSERT INTO publishers
	(pub_id, pub_name, city, state, country)
	VALUES ('9969', 'Mostachon Books', 'Utrera', NULL, 'Espania')

--5. Cambia el nombre de la editorial con sede en Alemania para que se llame "Machen Wücher" y traslasde su sede a Stuttgart.
SELECT * FROM publishers

UPDATE publishers
	SET pub_name = 'Machen Wücher', city = 'Stuttgart'
	WHERE country = 'Germany'