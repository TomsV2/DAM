SELECT * FROM Production.Product

--1. Nombre, numero de producto, precio y color de los productos de color rojo o amarillo cuyo precio esté comprendido entre 50 y 500.
SELECT Name, ProductNumber, ListPrice, Color FROM Production.Product WHERE (Color in ('Red', 'Yellow')) AND (ListPrice BETWEEN 50 AND 500)

--2. Nombre, número de producto, precio de coste,  precio de venta, margen de beneficios total y margen de beneficios en % del precio de venta de los productos de categorías inferiores a 16.
SELECT Name, ProductNumber, StandardCost, ListPrice, (ListPrice - StandardCost) AS Beneficios, ((ListPrice - StandardCost)/(StandardCost/100)) AS [Beneficios(%)]  FROM Production.Product WHERE ProductModelId < 16

--3. Empleados cuyo nombre o apellidos contenga la letra "r". Los empleados son los que tienen el valor "EM" en la columna PersonType de la tabla Person.
SELECT FirstName, LastName, PersonType FROM Person.Person WHERE LastName like '%r%' AND PersonType = 'EM'

--4. LoginID, nationalIDNumber, edad y puesto de trabajo (jobTitle) de los empleados (tabla Employees) de sexo femenino que tengan más de cinco años de antigüedad.
SELECT * FROM HumanResources.Employee

SELECT LoginID, NationalIDNumber, ((YEAR(CURRENT_TIMESTAMP-CAST(BirthDate AS DATETIME))-1900)) AS Edad, JobTitle FROM HumanResources.Employee

