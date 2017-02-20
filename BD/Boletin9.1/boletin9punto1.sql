--1. Nombre de los proveedores y número de productos que nos vende cada uno
SELECT * FROM Suppliers
SELECT * FROM Products
/*SELECT COUNT (ProductID) AS [Número de productos que vende cada uno]
	FROM Products
	GROUP BY SupplierID*/

SELECT s.ContactName, COUNT (ProductID) AS [Número de productos que vende cada uno]
	FROM Suppliers AS s
	INNER JOIN Products AS p
	ON s.SupplierID = p.SupplierID
	GROUP BY ContactName



--2. Nombre completo y telefono de los vendedores que trabajen en New York, Seattle, Vermont, Columbia, Los Angeles, Redmond o Atlanta.
SELECT * FROM Employees
SELECT * FROM EmployeeTerritories
SELECT * FROM Territories
	WHERE TerritoryDescription IN ('New York', 'Seattle', 'Vermont', 'Columbia', 'Los Angeles', 'Redmond', 'Atlanta')

SELECT e.FirstName, e.LastName, e.HomePhone, t.TerritoryDescription
	FROM Employees AS e
	INNER JOIN EmployeeTerritories AS et
	ON e.EmployeeID = et.EmployeeID
	INNER JOIN Territories AS t
	ON et.TerritoryID = t.TerritoryID
		WHERE TerritoryDescription IN ('New York', 'Seattle', 'Vermont', 'Columbia', 'Los Angeles', 'Redmond', 'Atlanta')


--3. Número de productos de cada categoría y nombre de la categoría.
SELECT * FROM Products

SELECT COUNT (p.CategoryID) AS [Cantidad por categoría], c.CategoryName AS [Nombre de la categoría]
	FROM Products AS p
	INNER JOIN Categories AS c
	ON p.CategoryID = c.CategoryID
		GROUP BY c.CategoryName


--4. Nombre de la compañía de todos los clientes que hayan comprado queso de cabrales o tofu.
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Products
--SELECT ProductName FROM Products WHERE ProductName IN ('Queso Cabrales', 'Tofu')

SELECT c.CompanyName--, p.ProductName
	FROM Customers AS c
	INNER JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
	INNER JOIN [Order Details] AS od
	ON o.OrderID = od.OrderID
	INNER JOIN Products AS p
	ON od.ProductID = p.ProductID
		WHERE p.ProductName IN ('Queso Cabrales', 'Tofu')


--5. Empleados (ID, nombre, apellidos y teléfono) que han vendido algo a Bon app' o Meter Franken.
SELECT * FROM Employees
SELECT * FROM Orders
SELECT * FROM Customers
--SELECT * FROM Customers WHERE CompanyName IN ('Bon app''')

SELECT e.EmployeeID, e.FirstName, e.LastName, e.HomePhone--, c.CompanyName
	FROM Employees AS e
	INNER JOIN Orders AS o
	ON e.EmployeeID = o.EmployeeID
	INNER JOIN Customers AS c
	ON o.CustomerID = c.CustomerID
		WHERE c.CompanyName IN ('Bon app''')


--6. Empleados (ID, nombre, apellidos, mes y día de su cumpleaños) que no han vendido nunca nada a ningún cliente de Francia. *
SELECT * FROM Employees
SELECT * FROM Orders
--SELECT DISTINCT ShipCountry FROM Orders WHERE ShipCountry NOT IN ('France')

SELECT e.EmployeeID, e.FirstName, e.LastName, MONTH(e.BirthDate) AS [Mes de nacimiento], DAY(e.BirthDate) AS [Día de nacimiento], o.ShipCountry
	FROM Employees AS e
	INNER JOIN Orders AS o
	ON e.EmployeeID = o.EmployeeID
		WHERE ShipCountry NOT IN ('France')

--7. Total de ventas en US$ de productos de cada categoría (nombre de la categoría).
SELECT * FROM Products
SELECT * FROM [Order Details]

--SELECT (UnitPrice*Quantity)-(UnitPrice*Quantity*Discount) AS [Total en US$] FROM [Order Details]

SELECT ROUND(SUM((od.UnitPrice*Quantity)-(od.UnitPrice*Quantity*Discount)),2) AS [Total en US$], CategoryID
	FROM [Order Details] AS od
	INNER JOIN Products AS p
	ON od.ProductID = p.ProductID
	GROUP BY CategoryID
	ORDER BY CategoryID

--8. Total de ventas en US$ de cada empleado cada año (nombre, apellidos, dirección).
SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders
SELECT * FROM Employees

--SELECT (UnitPrice*Quantity)-(UnitPrice*Quantity*Discount) AS [Total en US$] FROM [Order Details]

SELECT e.FirstName, e.LastName, e.[Address], YEAR(o.OrderDate) AS [Año], ROUND(SUM((od.UnitPrice*Quantity)-(od.UnitPrice*Quantity*Discount)),2) AS [Total en US$]
	FROM Employees AS e
	INNER JOIN Orders AS o
	ON e.EmployeeID = o.EmployeeID
	INNER JOIN [Order Details] AS od
	ON o.OrderID = od.OrderID
	INNER JOIN Products AS p
	ON od.ProductID = p.ProductID
	GROUP BY e.FirstName, e.LastName, e.[Address], YEAR(o.OrderDate)
	ORDER BY FirstName

--9. Ventas de cada producto en el año 97. Nombre del producto y unidades.
SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT YEAR(OrderDate) AS [Año] FROM Orders
	WHERE YEAR(OrderDate) = 1997

SELECT ProductName FROM Products

SELECT SUM(Quantity) FROM [Order Details] AS [Cantidad total]

SELECT p.ProductName, SUM(Quantity) AS [Cantidad total de productos], YEAR(OrderDate) AS [Año], ROUND(SUM((od.UnitPrice*Quantity)-(od.UnitPrice*Quantity*Discount)),2) AS [Total en US$]
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	WHERE YEAR(OrderDate) = 1997
	GROUP BY ProductName, YEAR(OrderDate)
	ORDER BY ProductName

--10. Cuál es el producto del que hemos vendido más unidades en cada país. *
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Products

SELECT ProductName, SUM(Quantity) AS [Cantidad total]
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	GROUP BY ProductName
	ORDER BY ProductName

SELECT ShipCountry, (SELECT ProductName, SUM(Quantity) AS [Cantidad total]
						FROM Products AS p
						INNER JOIN [Order Details] AS od
						ON p.ProductID = od.ProductID
						GROUP BY ProductName
						ORDER BY ProductName)
	FROM Orders


