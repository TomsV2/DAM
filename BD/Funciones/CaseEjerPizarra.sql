CREATE FUNCTION ProductosPorEstacion(@producto nvarchar(40))
RETURNS TABLE AS
RETURN (
SELECT p.ProductName, SUM(od.Quantity) AS [Cantidad],
	CASE
		WHEN ((DAY(o.OrderDate) >= 22) AND (MONTH(o.OrderDate) = 12)) OR (MONTH(o.OrderDate) = 1) OR (MONTH(o.OrderDate) = 2) OR ((MONTH(o.OrderDate) = 3) AND (DAY(o.OrderDate) <= 21)) THEN 'Invierno'
		WHEN ((MONTH(o.OrderDate) = 3 AND DAY(o.OrderDate) >= 22) OR (MONTH(o.OrderDate) = 4) OR (MONTH(o.OrderDate) = 5) OR (MONTH(o.OrderDate) = 6 AND DAY(o.OrderDate) <= 21)) THEN 'Primavera'
		WHEN ((MONTH(o.OrderDate) = 6 AND DAY(o.OrderDate) >= 22) OR (MONTH(o.OrderDate) = 7) OR (MONTH(o.OrderDate) = 8) OR (MONTH(o.OrderDate) = 9 AND DAY(o.OrderDate) <= 21)) THEN 'Verano'
		WHEN ((MONTH(o.OrderDate) = 9 AND DAY(o.OrderDate) >= 22) OR (MONTH(o.OrderDate) = 10) OR (MONTH(o.OrderDate) = 11) OR (MONTH(o.OrderDate) = 12 AND DAY(o.OrderDate) <= 21)) THEN 'Otoño'
	END AS [Estación]
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	WHERE p.ProductName = @producto
	GROUP BY p.ProductName,
		CASE
			WHEN ((DAY(o.OrderDate) >= 22) AND (MONTH(o.OrderDate) = 12)) OR (MONTH(o.OrderDate) = 1) OR (MONTH(o.OrderDate) = 2) OR ((MONTH(o.OrderDate) = 3) AND (DAY(o.OrderDate) <= 21)) THEN 'Invierno'
			WHEN ((MONTH(o.OrderDate) = 3 AND DAY(o.OrderDate) >= 22) OR (MONTH(o.OrderDate) = 4) OR (MONTH(o.OrderDate) = 5) OR (MONTH(o.OrderDate) = 6 AND DAY(o.OrderDate) <= 21)) THEN 'Primavera'
			WHEN ((MONTH(o.OrderDate) = 6 AND DAY(o.OrderDate) >= 22) OR (MONTH(o.OrderDate) = 7) OR (MONTH(o.OrderDate) = 8) OR (MONTH(o.OrderDate) = 9 AND DAY(o.OrderDate) <= 21)) THEN 'Verano'
			WHEN ((MONTH(o.OrderDate) = 9 AND DAY(o.OrderDate) >= 22) OR (MONTH(o.OrderDate) = 10) OR (MONTH(o.OrderDate) = 11) OR (MONTH(o.OrderDate) = 12 AND DAY(o.OrderDate) <= 21)) THEN 'Otoño'
		END)

GO

DECLARE @producto nvarchar (40)

SET @producto = 'Chai'

SELECT * FROM ProductosPorEstacion(@producto)




/*SELECT p.ProductName, od.Quantity, o.OrderDate
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	ORDER BY p.ProductName*/