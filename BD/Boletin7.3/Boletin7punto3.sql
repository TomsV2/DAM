SELECT * FROM Production.Product

--1. Nombre, numero de producto, precio y color de los productos de color rojo o amarillo cuyo precio esté comprendido entre 50 y 500.
SELECT Name, ProductNumber, ListPrice, Color FROM Production.Product WHERE (Color in ('Red', 'Yellow')) AND (ListPrice BETWEEN 50 AND 500)

--2. Nombre, número de producto, precio de coste,  precio de venta, margen de beneficios total y margen de beneficios en % del precio de venta de los productos de categorías inferiores a 16.
SELECT Name, ProductNumber, StandardCost, ListPrice, (ListPrice - StandardCost) AS Beneficios, (ListPrice - StandardCost*100)  FROM Production.Product WHERE 