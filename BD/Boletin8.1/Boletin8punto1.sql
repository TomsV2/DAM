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

--4. ID del cliente, año y número de pedidos que nos ha hecho cada año.
SELECT * FROM Orders

SELECT CustomerID, COUNT (CustomerID) AS [Número de pedidos], YEAR(OrderDate) AS [Año de pedido]
	FROM Orders
	GROUP BY CustomerID, YEAR(OrderDate)
	ORDER BY CustomerID

--*******PREGUNTAR*******--
--5. ID del producto, precio unitario y total facturado de ese producto, ordenado por cantidad facturada de mayor a menor. Si hay varios precios unitarios para el mismo producto tomaremos el mayor.
SELECT * FROM [Order Details]

SELECT DISTINCT ProductID, MAX (UnitPrice) [mÁXIMO PRECIO UNITARIO], (Quantity * UnitPrice) AS [Total facturado]
	FROM [Order Details]
	GROUP BY ProductID, Quantity, UnitPrice
	ORDER BY (Quantity * UnitPrice) DESC

--6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.
SELECT (SupplierID), UnitPrice, UnitsInStock FROM Products

SELECT (SupplierID), SUM (UnitPrice*UnitsInStock) AS [Importe total del stock acumulado]
	FROM Products
	GROUP BY SupplierID

--7. Número de pedidos registrados mes a mes de cada año.
SELECT * FROM Orders

SELECT YEAR(OrderDate) AS [Año del pedido], MONTH(OrderDate) AS [Mes del pedido], COUNT (OrderID) AS [Número de pedidos]
	FROM Orders
	GROUP BY MONTH(OrderDate), YEAR(OrderDate)
	ORDER BY YEAR(OrderDate) ASC

--8. Año y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha en la que lo hemos enviado (ShippedDate), en días para cada año.
SELECT * FROM Orders

SELECT YEAR(OrderDate) AS [Año del pedido], AVG(DAY(OrderDate - ShippedDate)) AS [Tiempo medio transcurrido (en días)]
	FROM Orders
	GROUP BY YEAR(OrderDate)
	ORDER BY YEAR(OrderDate) ASC

--9. ID del distribuidor y número de pedidos enviados a través de ese distribuidor.
SELECT * FROM Products

SELECT SupplierID, SUM (UnitsOnOrder) AS [Número de pedidos]
	FROM Products
	GROUP BY SupplierID

--10. ID de cada proveedor y número de productos distintos que nos suministra.
SELECT * FROM Products
	ORDER BY SupplierID

SELECT SupplierID, COUNT (ProductID) AS [Número de productos distintos]
	FROM Products
	GROUP BY SupplierID