 
 USE Northwind
 go

 /*primer ejercicio :
	-Nombre de la compañía y dirección completa (dirección, cuidad, país) de todos los
	 clientes que no sean de los Estados Unidos. */
 SELECT COMPANYNAME, ADDRESS, CITY, POSTALCODE, Country FROM Customers WHERE Country != 'USA'
 /*segundo ejercicio :
	-La consulta anterior ordenada por país y ciudad.
 */
 SELECT COMPANYNAME, ADDRESS, CITY, POSTALCODE, COUNTRY FROM Customers WHERE Country != 'USA' ORDER BY Country, CITY
 /*tercer ejercicio :
	-Nombre, Apellidos, Ciudad y Edad de todos los empleados, ordenados por antigüedad en
	 la empresa. 
 */
 SELECT LASTNAME, FIRSTNAME,CITY, (YEAR(CURRENT_TIMESTAMP-BIRTHDATE)-1900) AS AGE FROM Employees ORDER BY HIREDATE

 /*cuarto ejercicio :
	-Nombre y precio de cada producto, ordenado de mayor a menor precio
 */
 SELECT PRODUCTNAME,UNITPRICE FROM Products ORDER BY UnitPrice DESC

 /*quinto ejercicio :
	-Nombre de la compañía y dirección completa de cada proveedor de algún país de
	 América del Norte.
 */

 SELECT COMPANYNAME,  ADDRESS, CITY, POSTALCODE FROM Suppliers WHERE Country='USA'
 
 /*sexto ejercicio :
	-Nombre del producto, número de unidades en stock y valor total del stock, de los
	 productos que no sean de la categoría 4
 */
 SELECT PRODUCTNAME, UNITSINSTOCK, (UNITPRICE*UNITSINSTOCK) AS TOTALSTOCK FROM Products WHERE CategoryID != 4
 /*septimo ejercicio :
	-Clientes (Nombre de la Compañía, dirección completa, persona de contacto) que no
	 residan en un país de América del Norte y que la persona de contacto no sea el
	 propietario de la compañía 
*/
SELECT COMPANYNAME,  ADDRESS, CITY, POSTALCODE, CONTACTNAME FROM DBO.Customers WHERE COUNTRY!='USA' AND ContactTitle!='OWNER'

/*octavo ejercicio :
	-ID del cliente y número de pedidos realizados por cada cliente, ordenado de mayor a
	 menor número de pedidos. 
*/
SELECT  CUSTOMERID, COUNT(*) AS NUM_PEDIDOS FROM ORDERS  GROUP BY CustomerID ORDER BY NUM_PEDIDOS DESC

/*noveno ejercicio :
	-Número de pedidos enviados a cada ciudad, incluyendo el nombre de la ciudad.
*/
SELECT   ShipCity, COUNT(Quantity) AS NUMERO_PEDIDOS FROM Orders,[Order Details] GROUP BY SHIPCITY  ORDER BY ShipCity 
/*decimo ejercicio :
	-Número de productos de cada categoría. 
*/
SELECT CategoryID, COUNT (*) AS NUMERO_PRODUCTOS FROM Products
	GROUP BY CategoryID
	ORDER BY CategoryID