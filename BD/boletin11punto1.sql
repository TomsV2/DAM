--1. Deseamos incluir un producto en la tabla Products llamado "Cruzcampo lata” pero no estamos seguros si se ha insertado o no.
--El precio son 4,40, el proveedor es el 16, la categoría 1 y la cantidad por unidad es "Pack 6 latas” "Discontinued” toma el valor 0 y el resto de columnas se dejarán a NULL.
--Escribe un script que compruebe si existe un producto con ese nombre.
--En caso afirmativo, actualizará el precio y en caso negativo insertarlo.

SELECT * FROM Products

IF EXISTS (SELECT * FROM Products WHERE ProductName='Cruzcampo lata')
	BEGIN
		UPDATE Products SET UnitPrice = 4.40 WHERE ProductName='Cruzcampo lata'
	END
ELSE
	BEGIN
		INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
			VALUES ('Cruzcampo lata', 16, 1, 'Pack 6 latas', 4.40, Null, null, null, 0)
	END

--DELETE FROM Products WHERE ProductName='Cruzcampo lata'



--2. Comprueba si existe una tabla llamada ProductSales.
--Esta tabla ha de tener de cada producto el ID, el Nombre, el Precio unitario, el número total de unidades vendidas y el total de dinero facturado con ese producto.
--Si no existe, créala.

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE type = 'U' AND name = 'ProductSales')
	BEGIN
		PRINT 'Ya existe la tabla ProductSales'
	END
ELSE
	BEGIN
		CREATE TABLE ProductSales (
			ProductID int not null
				constraint pk_productID primary key,
			nombre nvarchar(30) null,
			precioUnitario money null,
			numeroTotalUnidadesVendidas int null, 
			totalDineroFacturado money null,		
		)
	END


--3. Comprueba si existe una tabla llamada ShipShip.
--Esta tabla ha de tener de cada Transportista el ID, el Nombre de la compañía, el número total de envíos que ha efectuado y el número de países diferentes a los que ha llevado cosas.
--Si no existe, créala.

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE type = 'U' AND name = 'ShipShip')
	BEGIN
		PRINT 'Ya existe la tabla ShipShip'
	END
ELSE
	BEGIN
		CREATE TABLE ShipShip (
			TransportistaID int not null
				constraint pk_transportistaID primary key,
			nombreCompaia nvarchar(30) null,
			totalEnvios int null,
			paisesCompradores nvarchar(40) null,		
		)
		Print 'Tabla ShipShip creada'
	END

--4. Comprueba si existe una tabla llamada EmployeeSales.
--Esta tabla ha de tener de cada empleado su ID, el Nombre completo, el número de ventas totales que ha realizado, el número de clientes diferentes a los que ha vendido y el total de dinero facturado.
--Si no existe, créala

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE type = 'U' AND name = 'EmployeeSales')
	BEGIN
		PRINT 'Ya existe la tabla EmployeeSales'
	END
ELSE
	BEGIN
		CREATE TABLE EmployeeSales (
			empleadoID int not null
				constraint pk_empleadoID primary key,
			nombreempleado nvarchar(30) null,
			apellido1empleado nvarchar(30) null,
			apellido2empleado nvarchar(30) null,
			ventasTotales int null,
			numeroClientes nvarchar(40) null,
			totalDineroFacturado money null,
		)
		Print 'Tabla EmployeeSales creada'
	END

--5. Entre los años 96 y 97 hay productos que han aumentado sus ventas y otros que las han disminuido.
--Queremos cambiar el precio unitario según la siguiente tabla:

/*Incremento de ventas		Incremento de precio

	Negativo					-10%

	Entre 0 y 10%				No varía

	Entre 10% y 50%				+5%

	Mayor del 50%				10% con un máximo de 2,25*/

SELECT COUNT(OrderDate) AS [Cantidad vendida 96], ProductName, --YEAR(OrderDate)
	FROM Products AS [productos]
	INNER JOIN [Order Details] AS od
	ON productos.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	WHERE YEAR(OrderDate) = 1996
	GROUP BY ProductName--, YEAR(OrderDate)