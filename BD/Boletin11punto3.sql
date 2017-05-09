/*La empresa de logística (transportes y algo más) TransLeo tiene una base de datos con la
información de los envíos que realiza. Hay una tabla llamada TL_PaquetesNormales en la que se
guardan los datos de los paquetes que pueden meterse en una caja normal. Las cajas normales
son paralelepípedos de base rectangular. Las columnas alto, ancho y largo, de tipo entero,
contienen las dimensiones de cada paquete en centímetros.*/

-- COLUMNA				TIPO				COMENTARIO							NULOS
---------------------------------------------------------------------------------------
-- codigo				int					Es la clave							No
-- alto					int														No
-- ancho				int														No
-- largo				int														No
-- codigoFregoneta		int					FK del vehiculo que lo entrega		Sí
-- fechaEntrega			smalldatetime		Eso									Sí


--1. Crea un función fn_VolumenPaquete que reciba el código de un paquete y nos devuelva su volumen.
--El volumen se expresa en litros (dm3) y será de tipo decimal(6,2).

SELECT * FROM TL_PaquetesNormales

ALTER FUNCTION fn_VolumenPaquete (@codigo int)
RETURNS DECIMAL (6,2) AS
BEGIN
	RETURN (SELECT ROUND((Alto*Ancho*Largo)*0.001, 1)
				FROM TL_PaquetesNormales
				WHERE Codigo = @codigo
			)
END
GO

--Declarar
DECLARE @codigo int

--Dar valores
SET @codigo = '600'

SELECT DBO.fn_VolumenPaquete (@codigo) AS [Volumen Paquete]


--2. Los paquetes normales han de envolverse. Se calcula que la cantidad de papel necesaria
--   para envolver el paquete es 1,8 veces su superficie. Crea una función fn_PapelEnvolver
--   que reciba un código de paquete y nos devuelva la cantidad de papel necesaria para
--   envolverlo, en metros cuadrados.

SELECT * FROM TL_PaquetesNormales

ALTER FUNCTION fn_PapelEnvolver (@codigo int)
RETURNS TABLE AS
RETURN (SELECT ((2*(Ancho*Alto) + 2*(Ancho*Largo) + 2*(Largo*Alto)) * 1.8) * 0.0001 AS [Superficie]
			FROM TL_PaquetesNormales
			WHERE Codigo = @codigo
		)
GO

--Declarar
DECLARE @codigo int

--Dar valores
SET @codigo = '600'

SELECT * FROM fn_PapelEnvolver (@codigo)


--3. Crea una función fn_OcupacionFregoneta a la que se pase el código de un vehículo y una fecha
--	 y nos indique cuál es el volumen total que ocupan los paquetes que ese vehículo entregó en el día en cuestión.
--	 Usa las funciones de fecha y hora para comparar sólo el día, independientemente de la hora.

SELECT * FROM TL_PaquetesNormales

SET DATEFORMAT ymd
GO

ALTER FUNCTION fn_OcupacionFregoneta (@codigoFregoneta int, @fechaEntrega DATE)
RETURNS TABLE AS
RETURN (SELECT (Alto*Ancho*Largo) AS [Volumen total]
		  FROM TL_PaquetesNormales
		  WHERE @codigoFregoneta = codigoFregoneta AND DAY(@fechaEntrega) = DAY(fechaEntrega))
GO

--Declarar
DECLARE @codigoFregoneta int
DECLARE @fechaEntrega DATE

--Dar valores
SET @codigoFregoneta = '1'
SET @fechaEntrega = '2012-01-20'

--Ejecutar
SELECT * FROM fn_OcupacionFregoneta (@codigoFregoneta, @fechaEntrega)
GO



--4. Crea una función fn_CuantoPapel a la que se pase una fecha y nos diga la cantidad total
--   de papel de envolver que se gastó para los paquetes entregados ese día. Trata la fecha
--   igual que en el anterior.SELECT * FROM TL_PaquetesNormalesGOALTER FUNCTION fn_CuantoPapel (@fechaEntrega DATE)RETURNS TABLE ASRETURN (SELECT SUM(((2*(Ancho*Alto) + 2*(Ancho*Largo) + 2*(Largo*Alto)) * 1.8) * 0.0001) AS [Cuanto de Papel]			FROM TL_PaquetesNormales			WHERE DAY(@fechaEntrega) = DAY(fechaEntrega))

--Declarar
DECLARE @fechaEntrega DATE

--Dar valores
SET @fechaEntrega = '2015-04-01'

--Ejecutar
SELECT * FROM fn_CuantoPapel (@fechaEntrega)
GO
--5. Modifica la función anterior para que en lugar de aceptar una fecha, acepte un rango de
--   fechas (inicio y fin). Si el inicio y fin son iguales, calculará la cantidad gastada ese día. Si
--   el fin es anterior al inicio devolverá 0.

SELECT * FROM TL_PaquetesNormalesGOCREATE FUNCTION fn_CantidadPapel (@fechaInicio DATE, @fechaFin DATE) RETURNS DECIMAL(6,2) ASBEGIN	DECLARE @cantidadPapel AS DECIMAL(6,2)	IF(@fechaInicio = @fechaFin)	BEGIN		SET @cantidadPapel = (SELECT SUM(((2*(Ancho*Alto) + 2*(Ancho*Largo) + 2*(Largo*Alto)) * 1.8) * 0.0001)							     FROM TL_PaquetesNormales						         WHERE DAY(@fechaInicio) >= DAY(fechaEntrega) AND DAY(@fechaFin) <= DAY(fechaEntrega))	END	IF(@fechaFin > @fechaInicio)	BEGIN		SET @cantidadPapel = 0	END	RETURN @cantidadPapelENDGO
	
--Declarar
DECLARE @fechaInicio DATE
DECLARE @fechaFin DATE

--Dar valores
SET @fechaInicio = '2012-01-20'
SET @fechaFin = '2013-03-14'

--Ejecutar
SELECT * FROM dbo.fn_CantidadPapel (@fechaInicio, @fechaFin)
GO


--6. Crea una función fn_Entregas a la que se pase un rango de fechas y nos devuelva una
--   tabla con los códigos de los paquetes entregados y los vehículos que los entregaron entre
--   esas fechas.

SELECT * FROM TL_PaquetesNormalesGOCREATE FUNCTION fn_Entregas (@fechaInicio DATE, @fechaFin DATE) RETURNS TABLE ASRETURN SELECT * FROM TL_PaquetesNormales