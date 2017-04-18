use Northwind
go
/*
1. Nombre del país y número de clientes de cada país, ordenados alfabéticamente por el nombre del país.
*/
select Country,count (*) as Numero_Clientes
from Customers
group by Country
order by Country
/*
2. ID de producto y número de unidades vendidas de cada producto. 
*/
select ProductID, SUM(Quantity) as Unidades_Vendidas
from [Order Details]
group by ProductID
order by ProductID


/*
3. ID del cliente y número de pedidos que nos ha hecho.
*/

select CustomerID, count(Orderid) as Numero_de_Pedidos
from Orders
group by CustomerID
order by CustomerID
/*
4. ID del cliente, año y número de pedidos que nos ha hecho cada año.
*/
select CustomerID, YEAR(OrderDate) as año,  count(Orderid) as Numero_de_Pedidos
from Orders
group by YEAR(OrderDate), CustomerID
order by CustomerID
/*
5. ID del producto, precio unitario y total facturado de ese producto, 
ordenado por cantidad facturada de mayor a menor.
 Si hay varios precios unitarios para el mismo producto tomaremos el mayor.
*/
select ProductID, max(UnitPrice)as precio_unitario, sum(quantity*UnitPrice) as TotalFacturado
from [Order Details] 
Group by ProductID
order by TotalFacturado DESC 

/*
6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.
*/
select SupplierID, SUM( UnitPrice* UnitsInStock) as Importe_total
from Products
group by SupplierID

/*
7. Número de pedidos registrados mes a mes de cada año.
*/
select YEAR (OrderDate) as año,MONTH(OrderDate) as Mes,COUNT(*) as PedidosRegistrados
from Orders
group by YEAR (OrderDate), MONTH(OrderDate)
order by YEAR (OrderDate), MONTH(OrderDate)
/*
8. Año y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha 
en la que lo hemos enviado (ShipDate), en días para cada año.
*/
select Year (OrderDate) as año, AVG(DATEDIFF (DAY, OrderDate, ShippedDate)) as Tiempo_medio_transcurrido
from Orders
Group by Year (OrderDate)
order by Year (OrderDate)

/*
9. ID del distribuidor y número de pedidos enviados a través de ese distribuidor.
*/
select ShipVia, COUNT (OrderID) as Numero_Pedidos
from Orders
Group by ShipVia

/*
10. ID de cada proveedor y número de productos distintos que nos suministra.
*/
select SupplierID as Proveedor, count(ProductID) as numero_de_productos
from Products
Group by SupplierID

