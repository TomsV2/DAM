--1. Crea una función inline que nos devuelva el número de estaciones que ha recorrido cada tren en un determinado periodo de tiempo.
--El principio y el fin de ese periodo se pasarán como parámetros.

SELECT * FROM LM_Recorridos

SET DATEFORMAT ymd
GO

CREATE FUNCTION NumeroEstaciones(@principio datetime, @fin datetime)
RETURNS TABLE AS
RETURN (SELECT COUNT(estacion) AS [Número de estaciones], Tren 
			FROM LM_Recorridos
			WHERE Momento BETWEEN @principio AND @fin
			GROUP BY Tren
		)
GO

--Declarar variables
DECLARE @principio datetime
DECLARE @fin datetime

--Dar valores
SET @principio = '2017-02-25'
SET @fin = '2017-02-27'

SELECT * FROM NumeroEstaciones(@principio, @fin)

--2. Crea una función inline que nos devuelva el número de veces que cada usuario ha entrado en el metro en un periodo de tiempo.
--El principio y el fin de ese periodo se pasarán como parámetros.

--SELECT * FROM LM_Viajes

SET DATEFORMAT ymd
GO

CREATE FUNCTION EntradasUsuario(@momentoEntrada DATETIME, @momentoSalida DATETIME)
RETURNS TABLE AS
RETURN (SELECT COUNT(MomentoEntrada) AS [Veces que entra], IDPasajero
			FROM LM_Viajes
			WHERE MomentoEntrada >= @momentoEntrada AND MomentoSalida <= @momentoSalida
			GROUP BY IDPasajero
		)
GO

--Declaro las variables
DECLARE @momentoEntrada DATETIME
DECLARE @momentoSalida DATETIME

--Damos valores a las variables
SET @momentoEntrada = '2017-02-26' 
SET @momentoSalida = '2017-02-28'

SELECT * FROM EntradasUsuario(@momentoEntrada, @momentoSalida)


--3. Crea una función inline a la que pasemos la matrícula de un tren y una fecha de inicio y fin y nos devuelva una tabla
--con el número de veces que ese tren ha estado en cada estación, además del ID, nombre y dirección de la estación.

SELECT * FROM LM_Trenes
SELECT * FROM LM_Recorridos
SELECT * FROM LM_Estaciones

CREATE FUNCTION VecesEstacion(@matricula char(7), @principio DATETIME, @fin DATETIME)
RETURNS TABLE AS
RETURN (SELECT COUNT(recorridos.estacion) AS [Veces que a pasado], estaciones.ID, estaciones.Denominacion, estaciones.Direccion
			FROM LM_Trenes AS trenes
			INNER JOIN LM_Recorridos AS recorridos
			ON trenes.ID = recorridos.Tren
			INNER JOIN LM_Estaciones AS estaciones
			ON recorridos.estacion = estaciones.ID
			WHERE trenes.Matricula = @matricula AND recorridos.Momento BETWEEN @principio AND @fin
			GROUP BY estaciones.ID, estaciones.Denominacion, estaciones.Direccion
		)
GO

--Declaro las variables
DECLARE @matricula char(7)
DECLARE @principio DATETIME
DECLARE @fin DATETIME

--Damos valores a las variables
SET @matricula = '0100FLZ'
SET @principio = '2017-02-26' 
SET @fin = '2017-03-1'

SELECT * FROM VecesEstacion(@matricula, @principio, @fin)

--4. Crea una función inline que nos diga el número de personas que han pasado por una estacion en un periodo de tiempo.
--Se considera que alguien ha pasado por una estación si ha entrado o salido del metro por ella.
--El principio y el fin de ese periodo se pasarán como parámetros.

--5. Crea una función inline que nos devuelva los kilómetros que ha recorrido cada tren en un periodo de tiempo.
--El principio y el fin de ese periodo se pasarán como parámetros.

--6. Crea una función inline que nos devuelva el número de trenes que ha circulado por cada línea en un periodo de tiempo.
--El principio y el fin de ese periodo se pasarán como parámetros. 
--Se devolverá el ID, denominación y color de la línea.

--7. Crea una función inline que nos devuelva el tiempo total que cada usuario ha pasado en el metro en un periodo de tiempo.
--El principio y el fin de ese periodo se pasarán como parámetros.
--Se devolverá ID, nombre y apellidos del pasajero.
--El tiempo se expresará en horas y minutos.