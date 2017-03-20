CREATE FUNCTION ProductosPorEstacion(@producto nvarchar(40))
RETURNS TABLE AS
RETURN 

SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT p.ProductName, od.Quantity,
	CASE
		WHEN MONTH(o.OrderDate) = 12 THEN 'Invierno'
		WHEN MONTH(o.OrderDate) BETWEEN 1 AND 3 THEN 'Invierno'
		WHEN MONTH(o.OrderDate) BETWEEN 3 AND 6 THEN 'Primavera'
		WHEN MONTH(o.OrderDate) BETWEEN 6 AND 9 THEN 'Verano'
		WHEN MONTH(o.OrderDate) BETWEEN 9 AND 12 THEN 'Otoño'
	END AS [Estación]
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	ORDER BY p.ProductName

SELECT p.ProductName, od.Quantity, o.OrderDate
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	ORDER BY p.ProductName