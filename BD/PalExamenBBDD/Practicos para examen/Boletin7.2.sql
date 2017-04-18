USE PUBS
GO
/*CONSULTAS*/
/*	1
Título, precio y notas de los libros (titles) que tratan de cocina,
 ordenados de mayor a menor precio.
*/
SELECT TITLE, PRICE, NOTES FROM titles WHERE type LIKE '%COOK' ORDER BY PRICE DESC

/*	2
ID, descripción y nivel máximo y mínimo de los puestos de trabajo (jobs)
 que pueden tener un nivel 110.
*/
SELECT * FROM DBO.jobs WHERE (min_lvl<110) AND (max_lvl>110)

/*	3
Título, ID y tema de los libros que contengan la palabra "and” en las notas
*/

SELECT TITLE, TITLE_ID, TYPE FROM titles WHERE notes LIKE '%AND%'
/*	4
Nombre y ciudad de las editoriales (publishers) de los Estados 
Unidos que no estén en California ni en Texas
*/

SELECT PUB_NAME, CITY FROM publishers WHERE COUNTRY != 'USA' AND STATE != 'TX' OR STATE !='CA'
/*	5
Título, precio, ID de los libros que traten sobre 
psicología o negocios y cuesten entre diez y 20 dólares.
*/
SELECT TITLE, PRICE, TITLE_ID FROM titles WHERE (TYPE = 'psychology' OR TYPE = 'business') AND (PRICE >=10 AND PRICE<=20)
/*	6
Nombre completo (nombre y apellido) y dirección completa de todos
los autores que no viven en California ni en Oregón.
*/
SELECT AU_LNAME, AU_FNAME, ADDRESS, CITY, STATE, ZIP FROM authors WHERE STATE!='CA' AND STATE !='OR'

/*	7
Nombre completo y dirección completa de todos los autores cuyo apellido empieza por D, G o S.
*/
SELECT AU_LNAME, AU_FNAME, ADDRESS, CITY, STATE, ZIP FROM authors WHERE AU_LNAME LIKE '[D G S]%'

/*	8
ID, nivel y nombre completo de todos los empleados con un nivel inferior a 100, ordenado alfabéticamente
*/

SELECT EMP_ID, JOB_LVL, FNAME, LNAME FROM employee WHERE job_lvl<100 ORDER BY FNAME 


/*INSERTS*/
/*1
Inserta un nuevo autor.
*/
INSERT INTO DBO.AUTHORS(au_id,au_lname,au_fname,phone,address,city,state,zip,contract) 
	VALUES ('124-92-0611', 'ELLOCO','PEPITO','123-544-874', 'ANCBUELA', 'SEVILLA','SV', '41000',1 )

/*2
Inserta dos libros, escritos por el autor que has insertado antes y 
publicados por la editorial "Ramona publishers”.
*/
INSERT INTO [dbo].[titles]
           ([title_id]
           ,[title]
           ,[type]
           ,[pub_id]
           ,[price]
           ,[advance]
           ,[royalty]
           ,[ytd_sales]
           ,[notes]
           ,[pubdate])
     VALUES
           ('BU4506'
           ,'LA MUERTE DEL CORDERO'
           ,'psychology'  
           ,'1756'
           ,15
           ,4000
           ,12
           ,1567
           ,'EL CORDERO MURIO '
           ,2016/01/13)

		   INSERT INTO [dbo].[titles]
           ([title_id]
           ,[title]
           ,[type]
           ,[pub_id]
           ,[price]
           ,[advance]
           ,[royalty]
           ,[ytd_sales]
           ,[notes]
           ,[pubdate])
     VALUES
           ('BU4507'
           ,'LA MUERTE DEL CORDERO 2'
           ,'psychology'  
           ,'1756'
           ,15
           ,4000
           ,12
           ,1567
           ,'EL CORDERO MURIO 2'
           ,2016/01/13)



INSERT INTO [dbo].[titleauthor]
           ([au_id]
           ,[title_id]
           ,[au_ord]
           ,[royaltyper])
     VALUES
           ('124-92-0611'
           ,'BU4506'
           ,2
           ,50)

		   INSERT INTO [dbo].[titleauthor]
           ([au_id]
           ,[title_id]
           ,[au_ord]
           ,[royaltyper])
     VALUES
           ('124-92-0611'
           ,'BU4507'
           ,2
           ,51)



/*3
Modifica la tabla jobs para que el nivel mínimo sea 90.
*/
BEGIN TRANSACTION

UPDATE DBO.JOBS SET min_lvl = 90

ROLLBACK
COMMIT TRANSACTION
/*4
Crea una nueva editorial (publihers) con ID 3408, nombre Mostachon Books y sede en Utrera.
*/


INSERT INTO [dbo].[publishers]
           ([pub_id]
           ,[pub_name]
           ,[city]
           ,[state]
           ,[country])
     VALUES
           ('3408'
           ,'Mostachon Books'
           ,'UTRERA'
           ,'SV'
           ,'ESPAÑA')




/*5
Cambia el nombre de la editorial con sede en Alemania para que se llame "Machen Wücher" y traslasde su sede a Stuttgart
*/
BEGIN TRANSACTION

UPDATE DBO.publishers SET pub_name = 'Machen Wücher', city = 'Stuttgart' WHERE country = 'Germany'

ROLLBACK
COMMIT TRANSACTION