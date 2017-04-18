use Northwind
go
/*
1. Número de clientes de cada país.
*/
select * from Customers
select Country,
	   count(CustomerID) as NumeroDeClientes
 from Customers
 group by Country

/*
2. Número de clientes diferentes que compran cada producto.
*/
select p.ProductName as NombreProducto,
		count( distinct o.CustomerID) as NumeroDeClientes		

from Products as p
join [Order Details] as od
on p.ProductID=od.ProductID
join Orders as o
on od.OrderID=o.OrderID

Group by p.ProductName
/*
3. Número de países diferentes en los que se vende cada producto.
*/
select p.ProductName as NombreProducto,
		count (distinct o.ShipCountry) as NumerosDePaisesDiferentes
		
from [Order Details] as od
join Products as p
on od.ProductID=p.ProductID
join orders as o
on od.OrderID=o.OrderID

group by p.ProductName
/*
4. Empleados que han vendido alguna vez “Gudbrandsdalsost”, “Lakkalikööri”,
“Tourtière” o “Boston Crab Meat”.
*/

select distinct e.LastName,e.FirstName
		
 from Employees as e
 join Orders as o
 on e.EmployeeID=o.EmployeeID
 join [Order Details] as od
 on o.OrderID=od.OrderID
 join Products as p
 on od.ProductID=p.ProductID
 where p.ProductName in ('Gudbrandsdalsost','Lakkalikööri','Tourtière','Boston Crab Meat')
/*
5. Empleados que no han vendido nunca “Chartreuse verte” ni “Ravioli Angelo”.
*/	
select distinct e.LastName,e.FirstName	
 from Employees as e
 EXCEPT
 
select distinct e.LastName,e.FirstName
 from Employees as e
 join Orders as o
 on e.EmployeeID=o.EmployeeID
 join [Order Details] as od
 on o.OrderID=od.OrderID
 join Products as p
 on od.ProductID=p.ProductID
where p.ProductName in ('Ravioli Angelo')

 order by e.LastName
/*
6. Número de unidades de cada categoría de producto que ha vendido cada
empleado.
*/
select e.FirstName , e.LastName ,c.CategoryName, sum(od.Quantity) as Cantidad
from Categories as c
join Products as p
on c.CategoryID = p.CategoryID
join [Order Details] as od
on p.ProductID=od.ProductID
join Orders as o
on od.OrderID=o.OrderID
join Employees as e
on o.EmployeeID=e.EmployeeID

group by e.FirstName, e.LastName, c.CategoryName
order by e.FirstName

/*
7. Total de ventas (US$) de cada categoría en el año 97.
*/
select c.CategoryName, SUM(od.UnitPrice*od.Quantity) as TotalVenta
from Categories as c
join Products as p
on c.CategoryID = p.CategoryID
join [Order Details] as od
on p.ProductID=od.ProductID
join Orders as o
on od.OrderID=o.OrderID
where YEAR(o.OrderDate)=1997
group by c.CategoryName

/*
8. Productos que han comprado más de un cliente del mismo país, indicando el
nombre del producto, el país y el número de clientes distintos de ese país que
lo han comprado.
*/

 
/*
9. Total de ventas (US$) en cada país cada año.
*/
select o.ShipCountry,YEAR(o.OrderDate) as Año,SUM(od.UnitPrice*od.Quantity) as TotalVenta

from Orders as o
join [Order Details] as od
on o.OrderID=od.OrderID
group by o.ShipCountry,YEAR(o.OrderDate)
order by o.ShipCountry

/*
10. Producto superventas de cada año, indicando año, nombre del producto,
categoría y cifra total de ventas.
*/
select  YEAR(o.OrderDate) as Año,p.ProductName , c.CategoryName,maximo.TotalVenta from Products as p
		join [Order Details] as od
			on p.ProductID=od.ProductID
		join Orders as o
			on od.OrderID=o.OrderID
		join Categories as c
			on p.CategoryID=c.CategoryID
			cross join
(select  totalventa.Año as Año, MAX(totalventa.TotalVenta) as TotalVenta
	from  (select YEAR(o.OrderDate) as Año,p.ProductName ,  SUM(od.Quantity) as TotalVenta
					from Products as p
						join [Order Details] as od
							on p.ProductID=od.ProductID
						join Orders as o
							on od.OrderID=o.OrderID

					group by YEAR(o.OrderDate),p.ProductName
					) as totalventa
	group by totalventa.Año) as maximo

	
group by  YEAR(o.OrderDate),p.ProductName , c.CategoryName, maximo.TotalVenta
having sum(od.Quantity)=maximo.TotalVenta --O hacer una subconsulta con la primera consulta
order by Año

/*
11. Cifra de ventas de cada producto en el año 97 y su aumento o disminución
respecto al año anterior en US $ y en %.
*/
select anio97.[Nombre del producto],SUM(anio97.[Total de Ventas]) as [Total de Ventas año97],
(anio97.[Total de Ventas]-añoanterior.[Total de Ventas]) as [Aumento o disminucion año anterior €],
(((anio97.[Total de Ventas]/añoanterior.[Total de Ventas])-1)* 100) as [Aumento o disminucion año anterior %]

from(select  p.ProductName as [Nombre del producto],SUM(od.UnitPrice*od.Quantity) as [Total de Ventas]
	from Orders as o
		join [Order Details] as od
			on o.OrderID=od.OrderID
		join Products as p
			on od.ProductID=p.ProductID
	where Year(o.OrderDate)=1997
	group by p.ProductName) as anio97

	join(select p.ProductName as [Nombre del producto],SUM(od.UnitPrice*od.Quantity) as [Total de Ventas]
		from Orders as o
			join [Order Details] as od
				on o.OrderID=od.OrderID
			join Products as p
				on od.ProductID=p.ProductID
		where Year(o.OrderDate)=1996
		group by p.ProductName
				) as añoanterior
	on anio97.[Nombre del producto]=añoanterior.[Nombre del producto]
	group by anio97.[Nombre del producto], anio97.[Total de Ventas], añoanterior.[Total de Ventas]
/*
12. Mejor cliente (el que más nos compra) de cada país.
*/

select c.CompanyName,YEAR(o.OrderDate) as [Año]
	from Orders as o
			join [Order Details] as od
				on o.OrderID=od.OrderID
			join Customers as c
				on o.CustomerID=c.CustomerID
			cross join
			(select sumadeventas.año ,sumadeventas.CompanyName,MAX(sumadeventas.sumacantidad) as [Maxima Cantidad]
				from(select c.CompanyName, sum(od.Quantity) as sumacantidad,YEAR(o.OrderDate) as año
						from Orders as o
							join [Order Details] as od
								on o.OrderID=od.OrderID
							join Customers as c
								on o.CustomerID=c.CustomerID
						group by c.CompanyName,YEAR(o.OrderDate)
								) as sumadeventas
				group by sumadeventas.año,sumadeventas.CompanyName
			) as total
group by YEAR(o.OrderDate),c.CompanyName,total.[Maxima Cantidad]
having sum(od.Quantity)=total.[Maxima Cantidad]
order by Año
/*
13. Número de productos diferentes que nos compra cada cliente.
*/

/*
14. Clientes que nos compran más de cinco productos diferentes.
*/

/*
15. Vendedores que han vendido una mayor cantidad que la media en US $ en el
año 97.
*/

/*
16. Empleados que hayan aumentado su cifra de ventas más de un 10% entre dos
años consecutivos, indicando el año en que se produjo el aumento.
*/
