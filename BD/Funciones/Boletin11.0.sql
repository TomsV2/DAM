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

SELECT * FROM NumeroEstaciones('2017-02-01 12:00:00:000', '2017-02-28 12:00:00:000')

--2. Crea una función inline que nos devuelva el número de veces que cada usuario ha entrado en el metro en un periodo de tiempo.
--El principio y el fin de ese periodo se pasarán como parámetros.

SELECT * FROM LM_Viajes

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

SELECT * FROM EntradasUsuario('2017-02-26 12:00:00:000', '2017-02-28 20:00:00:000')


--3. Crea una función inline a la que pasemos la matrícula de un tren y una fecha de inicio y fin y nos devuelva una tabla
--con el número de veces que ese tren ha estado en cada estación, además del ID, nombre y dirección de la estación.

SELECT * FROM LM_Trenes

CREATE FUNCTION VecesEstacion(@matricula char(7), @principio DATETIME, @fin DATETIME)
RETURNS TABLE AS
RETURN ()

SELECT *
	FROM LM_Trenes AS trenes
	INNER JOIN LM_Recorridos
	ON 

--4. Crea una función inline que nos diga el número de personas que han pasado por una estacion en un periodo de tiempo.
--Se considera que alguien ha pasado por una estación si ha entrado o salido del metro por ella.
--El principio y el fin de ese periodo se pasarán como parámetros.

--5. Crea una función inline que nos devuelva los kilómetros que ha recorrido cada tren en un periodo de tiempo.
--El principio y el fin de ese periodo se pasarán como parámetros.