--NorthWind

--1. Número de clientes de cada país.
select country,count(country)as [Clientes de este pais] from Customers group by country
select * from Employees

--2. Número de clientes diferentes que compran cada producto.
select  count(distinct O.customerID)as [Clientes diferentes],OD.ProductID from Orders as O 
inner join [Order Details] as OD on O.OrderID=OD.OrderID group by ProductID order by ProductID

--3. Número de países diferentes en los que se vende cada producto.
select  count(distinct O.ShipCountry)as [Paises diferentes],OD.ProductID from Orders as O 
inner join [Order Details] as OD on O.OrderID=OD.OrderID group by ProductID order by ProductID


--4. Empleados que han vendido alguna vez “Gudbrandsdalsost”, “Lakkalikööri”,“Tourtière” o “Boston Crab Meat”.
--orders, order Details, product
select * from Products
select distinct O.EmployeeID,P.ProductName from Orders as O inner join 
[Order Details] as OD on O.OrderID=OD.OrderID inner join
Products as P on OD.ProductID=P.ProductID where P.ProductName in('Gudbrandsdalsost', 'Lakkalikööri', 'Tourtière', 'Boston Crab Meat')-- group by O.EmployeeID

select count(distinct O.EmployeeID)as [empleados que han vendido este producto], O.EmployeeID from Orders as O inner join 
[Order Details] as OD on O.OrderID=OD.OrderID inner join
Products as P on OD.ProductID=P.ProductID where P.ProductName in('Gudbrandsdalsost', 'Lakkalikööri', 'Tourtière', 'Boston Crab Meat') group by P.ProductName



--5. Empleados que no han vendido nunca “Chartreuse verte” ni “Ravioli Angelo”.
select distinct O.EmployeeID from Orders as O inner join 
[Order Details] as OD on O.OrderID=OD.OrderID inner join
Products as P on OD.ProductID=P.ProductID
except
select distinct O.EmployeeID from Orders as O inner join 
[Order Details] as OD on O.OrderID=OD.OrderID inner join
Products as P on OD.ProductID=P.ProductID where P.ProductName in('Chartreuse verte', 'Ravioli Angelo') group by O.EmployeeID order by O.EmployeeID


--6. Número de unidades de cada categoría de producto que ha vendido cada empleado.
--orders, order Details, product
select P.CategoryID, sum(OD.Quantity)as [Unidades vendidas], O.EmployeeID from Products as P inner join
[Order Details] as OD on P.ProductID=OD.ProductID inner join 
Orders as O on O.OrderID=OD.OrderID group by P.CategoryID,O.EmployeeID order by P.CategoryID,O.EmployeeID


--7. Total de ventas (US$) de cada categoría en el año 97.
select sum(round((OD.Unitprice-(((OD.Unitprice)*((OD.discount*100)/1))/100))*OD.Quantity,2)) as [Total $] from Products as P inner join
[Order Details] as OD on OD.ProductID=P.ProductID inner join
Orders as O on OD.OrderID=O.OrderID where year(OrderDate) in ('1997') group by P.CategoryID


--8. Productos que han comprado más de un cliente del mismo país, indicando el nombre del producto, el país y el número de clientes distintos de ese país que lo han comprado.
--contar clientes. agrupar por pais. Nombre de: producto, pais
--select [Nº Clientes Diferentes],M.Country,M.ProductName from(
select count(distinct C.CustomerID)as [Nº Clientes Diferentes],C.Country,P.ProductName from Customers as C inner join
Orders as O on C.CustomerID=O.CustomerID inner join
[Order Details] as OD on O.OrderID=OD.OrderID inner join
Products as P on OD.ProductID=P.ProductID
 group by C.Country,P.ProductName having count(distinct C.CustomerID)>1 order by P.ProductName


--9. Total de ventas (US$) en cada país cada año.
select sum(round((OD.Unitprice-(((OD.Unitprice)*((OD.discount*100)/1))/100))*OD.Quantity,2)) as [Total $],year(O.OrderDate),O.ShipCountry from Products as P inner join
[Order Details] as OD on OD.ProductID=P.ProductID inner join
Orders as O on OD.OrderID=O.OrderID group by year(O.OrderDate),O.ShipCountry order by year(O.OrderDate)


--10. Producto superventas de cada año, indicando año, nombre del producto, categoría y cifra total de ventas.
go
--create 
alter view Vista as 
select  sum(OD.Quantity)as Cantidad, P.ProductName,year(O.orderdate) as Año,P.CategoryID from Orders as O inner join--creamos una vista  sobre una consulta
[Order Details] AS OD on O.OrderID=OD.OrderID inner join 
Products as P on OD.ProductID=P.ProductID group by P.ProductName, year(O.orderdate), P.CategoryID
go

SELECT Consulta1.Año, Consulta1.ProductName, Consulta1.Cantidad, consulta1.categoryID FROM--hacemos una subsonsulta de la vista creada
(select max(Cantidad)as [Más vendido],Año from Vista group by Año) as Maximo
inner join Vista as Consulta1 on Consulta1.Año=Maximo.Año and Consulta1.Cantidad=Maximo.[Más vendido]


--11. Cifra de ventas de cada producto en el año 97 y su aumento o disminución respecto al año anterior en US $ y en %.
---cast(() as varchar)
create view ventas1997 as
select ProductID,year(OrderDate)as Año,((sum(Quantity)*(UnitPrice-Discount))) as Ventas97 from [Order Details] as OD inner join
Orders as O on OD.OrderID=O.OrderID where year(OrderDate) in ('1997') group by ProductID,UnitPrice, Discount, year(OrderDate)  --de esta vista sacamos el precio total de cada categoria
																															   --pero tambien agrupa por el descuento y precio unitario asi 
																															   --que haremos otra en la que sumemos los resultados de las
																															   --ventas solo agrupando por producto y año
create view VentasTotales97 as
select ProductID,sum(round(Ventas97,2)) as TotalVentas97,Año from ventas1997 group by ProductID,Año--ventas solo agrupando por producto y año



create view ventas1996 as
select ProductID,year(OrderDate)as Año,((sum(Quantity)*(UnitPrice-Discount))) as Ventas96 from [Order Details] as OD inner join
Orders as O on OD.OrderID=O.OrderID where year(OrderDate) in ('1996') group by ProductID,UnitPrice, Discount, year(OrderDate)  

create view VentasTotales96 as
select ProductID,sum(round(Ventas96,2)) as TotalVentas96,Año from ventas1996 group by ProductID,Año



create
alter
 view Aumento as
select VT97.ProductID,VT97.TotalVentas97,VT96.TotalVentas96,(totalventas97-totalventas96)as Aumento from VentasTotales97 as VT97 inner join--Aumento
VentasTotales96 as VT96 on VT97.ProductID=VT96.ProductID where (totalventas97-totalventas96)>0
select * from Aumento

create
alter view Disminucion as
select VT97.ProductID,VT97.TotalVentas97,VT96.TotalVentas96,(totalventas96-totalventas97)as Disminucion from VentasTotales97 as VT97 inner join--Disminucion
VentasTotales96 as VT96 on VT97.ProductID=VT96.ProductID where (totalventas96-totalventas97)>0
select * from Disminucion



--select A.ProductID,D.Disminucion,A.Aumento from Disminucion as D right join
--Aumento as A on D.ProductID=A.ProductID where A.Aumento>0 or D.Disminucion>0

select ProductID,Disminucion as diferencia, 'Disminucion' AS sentido from Disminucion  union select ProductID,Aumento as diferencia, 'Aumento' AS sentido from Aumento



select VT97.ProductID,(totalventas97-totalventas96)as Diferencia, CASE WHEN totalventas97-totalventas96>0 THEN 'Aumento'
																											ELSE 'Disminucion'
																									END AS Sentido
from VentasTotales97 VT97 inner join--Aumento
VentasTotales96 VT96 on VT97.ProductID=VT96.ProductID --where (totalventas97-totalventas96)>0
select * from Aumento

--12. Mejor cliente (el que más nos compra) de cada país.


--13. Número de productos diferentes que nos compra cada cliente.


--14. Clientes que nos compran más de cinco productos diferentes.


--15. Vendedores que han vendido una mayor cantidad que la media en US $ en el año 97.


--16. Empleados que hayan aumentado su cifra de ventas más de un 10% entre dos años consecutivos, indicando el año en que se produjo el aumento.