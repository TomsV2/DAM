--Ejercicio 1
--Escribe un procedimiento que cancele un pasaje y las tarjetas de embarque asociadas.
--Recibirá como parámetros el ID del pasaje.

CREATE PROCEDURE Cancelacion (@IDPasaje Int) AS
BEGIN
	BEGIN TRANSACTION

		DELETE FROM AL_Tarjetas
			WHERE Numero_Pasaje = @IDPasaje

		DELETE FROM AL_Vuelos_Pasajes
			WHERE Numero_Pasaje = @IDPasaje

		DELETE FROM AL_Pasajes
			WHERE Numero = @IDPasaje

	COMMIT TRANSACTION
END
GO

EXECUTE Cancelacion 0
GO

SELECT * FROM AL_Pasajes
GO

--Ejercicio 2
--Escribe un procedimiento almacenado que reciba como parámetro el ID de un pasajero y
--devuelva en un parámetro de salida el número de vuelos diferentes que ha tomado ese pasajero.

SELECT * FROM AL_Vuelos_Pasajes
GO

ALTER PROCEDURE ContarVuelos (@IDPasajero char(9), @NumeroVuelos int OUTPUT) AS
	BEGIN

		SET @NumeroVuelos = (SELECT COUNT(Codigo_Vuelo) AS [Número de vuelos]
								FROM AL_Pasajes as P
								INNER JOIN AL_Vuelos_Pasajes AS vp
								ON Numero = Numero_Pasaje
								WHERE P.ID_Pasajero = @IDPasajero)

	END
GO

--Declarar variables
declare @NumeroVuelos int
declare @IDPasajero char(9) = 'A003'

--Ejecutar 
EXECUTE ContarVuelos @IDPasajero, @NumeroVuelos OUTPUT

--Imprimir resultado
PRINT 'Número de vuelos: ' + CAST(@NumeroVuelos as varchar)

--Ejercicio 3
--Escribe un procedimiento almacenado que reciba como parámetro el ID de un pasajero y dos fechas y
--nos devuelva en otro parámetro (de salida) el número de horas que ese pasajero ha volado durante ese intervalo de fechas.

SELECT * FROM AL_Pasajeros
SELECT * FROM AL_Vuelos
GO

SET DATEFORMAT ymd
GO

ALTER PROCEDURE HorasDeVuelo @IDPasajero char(9), @FechaSalida smalldatetime, @FechaLlegada smalldatetime, @HorasVolando int OUTPUT AS
	BEGIN
			SET @HorasVolando = (SELECT (SUM(DATEDIFF(MINUTE,v.Salida,v.Llegada))/60) AS [Horas]
									FROM AL_Pasajes AS p
									INNER JOIN AL_Vuelos_Pasajes AS vp
									ON p.Numero = vp.Numero_Pasaje
									INNER JOIN AL_Vuelos AS v
									ON vp.Codigo_Vuelo = v.Codigo
									WHERE p.ID_Pasajero = @IDPasajero AND v.Salida >= @FechaSalida AND v.Llegada <= @FechaLlegada)
	END
GO

--Declarar las variables
DECLARE @HorasVolando int
DECLARE @IDPasajero char(9) = 'A007'
DECLARE @FechaSalida smalldatetime = '2012-01-14 14:05:00'
DECLARE @FechaLlegada smalldatetime = '2013-01-14 14:05:00'

--Ejecutar
EXECUTE HorasDeVuelo @IDPasajero, @FechaSalida, @FechaLlegada, @HorasVolando OUTPUT

--Imprimir resultados
PRINT 'Número de horas volando: ' + CAST(@HorasVolando AS varchar)


--Ejercicio 4
--Escribe un procedimiento que reciba como parámetro todos los datos de un pasajero y un número de vuelo y realice el siguiente proceso:
--En primer lugar, comprobará si existe el pasajero.
--Si no es así, lo dará de alta.
--A continuación comprobará si el vuelo tiene plazas disponibles (hay que consultar la capacidad del avión) y
--en caso afirmativo creará un nuevo pasaje para ese vuelo.

SELECT * FROM AL_Pasajeros
SELECT * FROM AL_Pasajes
SELECT * FROM AL_Vuelos
SELECT * FROM AL_Aviones
GO

ALTER PROCEDURE ProcedureMieo
	@ID char (9),
	@Nombre varchar (20),
	@Apellidos varchar (50),
	@Direccion varchar (60),
	@FechaNacimiento date,
	@Nacinalidad varchar (30),
	@Codigo int
	AS

BEGIN
	IF NOT EXISTS (SELECT ID
					FROM AL_Pasajeros
					WHERE ID = @ID)
		BEGIN
			INSERT INTO AL_Pasajeros
			(ID, Nombre, Apellidos, Direccion, Fecha_Nacimiento, Nacionalidad)
			VALUES
			(@ID, @Nombre, @Apellidos, @Direccion, @FechaNacimiento, @Nacinalidad)

			PRINT 'Usuario ' +@Nombre +' ' +@Apellidos +' creado correctamente'
		END

	ELSE PRINT 'El pasajero ' +@nombre +' ' +@Apellidos +' ya existe'

	BEGIN
		/*IF
		--Para ver cuantos asientos hay por avión (Asientos del vuelo = Asientos del avión)
		SELECT (Filas*Asientos_x_Fila) AS [Asientos]
			FROM AL_Aviones AS a
			INNER JOIN AL_Vuelos AS v
			ON a.Matricula = v.Matricula_Avion
			WHERE Codigo = @Codigo

		--Para ver cuantos sitios hay ocupados
		SELECT COUNT(Numero) AS [Número de vuelos], ID_Pasajero
			FROM AL_Pasajes
			GROUP BY ID_Pasajero*/
	END
END
GO

--Declarar
DECLARE @ID char (9) = 'A003'
DECLARE @Nombre varchar (20) = 'Adela'
DECLARE @Apellidos varchar (50) = 'Benítez'
DECLARE @Direccion varchar (60) = 'Calle estrecha, 7'
DECLARE @FechaNacimiento date = '1985-04-01'
DECLARE @Nacinalidad varchar (30) = 'España'
DECLARE @Codigo int ='1'
GO

--Ejecutar
EXECUTE ProcedureMieo 'L999', 'Leo', 'Maestro', 'No se donde vive', '0001-01-01', 'España', '1'

--Ejercicio 5
/*Escribe un procedimiento almacenado que cancele un vuelo y reubique a sus pasajeros en otro.
Se ocuparán los asientos libres en el vuelo sustituto. Se comprobará que ambos vuelos realicen el mismo recorrido.
Se borrarán todos los pasajes y las tarjetas de embarque y se generarán nuevos pasajes.
No se generarán nuevas tarjetas de embarque.
El vuelo a cancelar y el sustituto se pasarán como parámetros.
Si no se pasa el vuelo sustituto, se buscará el primer vuelo inmediatamente posterior al cancelado que realice el mismo recorrido.*/

--Ejercicio 6
/*Escribe un procedimiento al que se pase como parámetros un código de un avión y un momento (dato fecha-hora) y nos escriba un mensaje que indique dónde se encontraba ese avión en ese momento.
El mensaje puede ser "En vuelo entre los aeropuertos de NombreAeropuertoSalida y NombreaeropuertoLlegada” si el avión estaba volando en ese momento, o "En tierra en el aeropuerto NombreAeropuerto” si no está volando.
Para saber en qué aeropuerto se encuentra el avión debemos consultar el último vuelo que realizó antes del momento indicado.
Si se omite el segundo parámetro, se tomará el momento actual.*/