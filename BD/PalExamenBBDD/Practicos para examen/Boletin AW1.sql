use AdventureWorks2012
go

begin transaction
go
/*Nombre y dirección completas de todos los clientes que tengan alguna sede en Canada.*/
CREATE VIEW V_CLIENTES_CON_SEDE_EN_CANADA AS
	select p.FirstName as Nombre,
	p.MiddleName as letra,
	p.LastName as Apellido,
	a.AddressLine1 as Direccion
	from Person.Person as p
		join Person.BusinessEntity as be
			on p.BusinessEntityID=be.BusinessEntityID
		join Person.BusinessEntityAddress as bea
			on be.BusinessEntityID=bea.BusinessEntityID
		join Person.Address as a
			on bea.AddressID=a.AddressID
		join Sales.Customer as c
			on p.BusinessEntityID=c.CustomerID
		join Sales.SalesTerritory as st
			on c.TerritoryID=st.TerritoryID
	where st.Name = ('Canada')
	go

/*Nombre de cada categoría y producto más caro y más barato de la misma, incluyendo los precios.*/

select distinct ProductoMaximo.[nombre de categoria]
,ProductoMaximo.Name as [Producto mas caro]
,ProductoMaximo.Precio as PrecioMax,
ProductoMinimo.Name as [Producto mas barato],
ProductoMinimo.Precio as PrecioMin


	FROM
	/*SACAMOS EL MAXIMO*/
	(SELECT maximo.Precio, maximo.[nombre de categoria],p.Name from Production.ProductCategory as pc
	join Production.ProductSubcategory as psc
		on pc.ProductCategoryID=psc.ProductCategoryID
	join Production.Product as p
		on psc.ProductSubcategoryID=p.ProductSubcategoryID
		JOIN
	(select max(Listprice) as Precio,pc.Name as [nombre de categoria]
			from Production.ProductCategory as pc
				join Production.ProductSubcategory as psc
					on pc.ProductCategoryID=psc.ProductCategoryID
				join Production.Product as p
					on psc.ProductSubcategoryID=p.ProductSubcategoryID
			group by pc.Name
			)as maximo
		on pc.Name=maximo.[nombre de categoria] AND P.ListPrice = maximo.Precio
	) AS ProductoMaximo
		
		/*SACAMOS EL MINIMO*/
	join (SELECT minimo.Precio, minimo.[nombre de categoria],p.Name from Production.ProductCategory as pc
	join Production.ProductSubcategory as psc
		on pc.ProductCategoryID=psc.ProductCategoryID
	join Production.Product as p
		on psc.ProductSubcategoryID=p.ProductSubcategoryID
		JOIN
	(select min(Listprice) as Precio, pc.Name as [nombre de categoria]
			from Production.ProductCategory as pc
				join Production.ProductSubcategory as psc
					on pc.ProductCategoryID=psc.ProductCategoryID
				join Production.Product as p
					on psc.ProductSubcategoryID=p.ProductSubcategoryID
			group by pc.Name
			)as minimo
		on pc.Name=minimo.[nombre de categoria] and P.ListPrice = minimo.Precio
	) AS ProductoMinimo
	ON ProductoMaximo.[nombre de categoria] = ProductoMinimo.[nombre de categoria]

/*Total de Ventas en cada país en dinero (Ya hecha en el boletín 9.3).*/
GO
CREATE VIEW TOTALVENTASCON AS
select st.Name as [Nombre del país],max(sumaVentas.Suma) as [Total de ventas]
from  Sales.SalesOrderDetail as sop
	join Sales.SalesOrderHeader as soh
		on sop.SalesOrderID=soh.SalesOrderID
	join Sales.SalesTerritory as st
		on soh.TerritoryID=st.TerritoryID
	join (
		select st.Name as [Nombre del país],SUM(sop.UnitPrice*sop.OrderQty) as Suma
			from  Sales.SalesOrderDetail as sop
			join Sales.SalesOrderHeader as soh
				on sop.SalesOrderID=soh.SalesOrderID
			join Sales.SalesTerritory as st
				on soh.TerritoryID=st.TerritoryID
			group by st.Name	
				) as sumaVentas
		on st.Name=sumaVentas.[Nombre del país]
group by st.Name
order by [Total de ventas]

go

/*Número de clientes que tenemos en cada país. Contaremos cada dirección como si fuera un cliente distinto.*/
select cr.Name as [Nombre del pais],COUNT(a.AddressID) as [Numero de clientes]
from Sales.Customer as c
	join Person.Person as p
		on c.PersonID=p.BusinessEntityID
	join Person.BusinessEntityAddress as bea
		on p.BusinessEntityID=bea.BusinessEntityID
	join Person.Address as a
		on bea.AddressID=a.AddressID
	join Person.StateProvince as sp
		on a.StateProvinceID=sp.StateProvinceID
	join Person.CountryRegion as cr
		on sp.CountryRegionCode=cr.CountryRegionCode
group by cr.Name

/*Repite la consulta anterior pero contando cada cliente una sola vez.
 Si el cliente tiene varias direcciones,
 sólo consideraremos aquella en la que nos haya comprado la última vez.*/

/*Repite la consulta anterior pero en este caso si el cliente tiene varias direcciones, 
sólo consideraremos aquella en la que nos haya comprado más.*/

/*Los tres países en los que más hemos vendido, incluyendo la cifra total de ventas y la fecha de la última venta.*/
go
CREATE VIEW TOP3 AS 
select top 3 st.Name as [Nombre del país],max(sumaVentas.Suma) as [Total de ventas]
from  Sales.SalesOrderDetail as sop
	join Sales.SalesOrderHeader as soh
		on sop.SalesOrderID=soh.SalesOrderID
	join Sales.SalesTerritory as st
		on soh.TerritoryID=st.TerritoryID
	/*SACAMOS LA SUMA*/
	join (select st.Name as [Nombre del país],SUM(sop.UnitPrice*sop.OrderQty) as Suma
			from  Sales.SalesOrderDetail as sop
			join Sales.SalesOrderHeader as soh
				on sop.SalesOrderID=soh.SalesOrderID
			join Sales.SalesTerritory as st
				on soh.TerritoryID=st.TerritoryID
			group by st.Name	
				) as sumaVentas
		on st.Name=sumaVentas.[Nombre del país]
	
group by st.Name
order by [Total de ventas] desc
go
/*Sobre la consulta tres de ventas por país, calcula el valor medio y repite la consulta tres pero incluyendo solamente 
los países cuyas ventas estén por encima de la media.*/

select [Total de ventas]
from dbo.

/*Nombre de la categoría y número de clientes diferentes que han comprado productos de cada una.*/
/*Clientes que nunca han comprado ninguna bicicleta (discriminarlas por categorías)*/
/*A la consulta anterior, añádele el total de compras (en dinero) efectuadas por cada cliente.*/