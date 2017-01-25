--1. Nombre del país y número de clientes de cada país, ordenados alfabéticamente por el nombre del país.
SELECT * FROM Customers

SELECT Country, COUNT (CustomerID) AS NumeroClientes
	FROM Customers
	GROUP BY Country
	ORDER BY Country


--2. ID de producto y número de unidades vendidas de cada producto. 
SELECT * FROM [Order Details]

SELECT ProductID, SUM (Quantity) AS UnidadesVendidas 
	FROM [Order Details]
	GROUP BY ProductID

--3. ID del cliente y número de pedidos que nos ha hecho.
SELECT * FROM Orders

SELECT CustomerID, COUNT(OrderID) AS NumeroPedidos
	FROM Orders
	GROUP BY CustomerID