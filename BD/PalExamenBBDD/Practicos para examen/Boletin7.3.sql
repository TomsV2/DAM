/*Consultas sobre una sola Tabla sin agregados*/
use AdventureWorks2012
go
/*1
Nombre, numero de producto, precio y color de los productos de color rojo 
o amarillo cuyo precio esté comprendido entre 50 y 500
*/
SELECT NAME,ProductNumber,ListPrice,Color FROM Production.Product
	WHERE (COLOR IN ('RED','YELLOW') AND (ListPrice>50 AND ListPrice<500 ))
/*2
Nombre, número de producto, precio de coste,  precio de venta, 
margen de beneficios total y margen de beneficios en % del 
precio de venta de los productos de categorías inferiores a 16
*/
select name as nombre,ProductNumber as numero_de_producto, StandardCost as precio_coste, ListPrice as precio,(ListPrice-StandardCost) as margen_beneficio,
((ListPrice-StandardCost)/StandardCost*100) as Margen
	
from Production.Product
where ProductSubcategoryID < 16

/*3
Empleados cuyo nombre o apellidos contenga la letra "r".
 Los empleados son los que tienen el valor "EM" en la columna PersonType de la tabla Person
*/

select FirstName, MiddleName, LastName
from Person.Person
where (FirstName like ('%r%') or LastName like ('%r%')) and PersonType in ('EM')

/*4
LoginID, nationalIDNumber, edad y puesto de trabajo (jobTitle) de 
los empleados (tabla Employees) de sexo femenino que tengan más de cinco años de antigüedad
*/

select LoginID, NationalIDNumber, dateDiff(yy,BirthDate,CURRENT_TIMESTAMP) as edad, JobTitle
from HumanResources.Employee 
where Gender = 'F' and dateDiff(yy,HireDate,CURRENT_TIMESTAMP) > 5

/*5
Ciudades correspondientes a los estados 11, 14, 35 o 70, sin repetir.
 Usar la tabla Person.Address
*/
select distinct City
from Person.Address
where StateProvinceID = 11 or StateProvinceID = 14 or StateProvinceID = 35 or StateProvinceID = 70


