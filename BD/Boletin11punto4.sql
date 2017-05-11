--Ejercicio 1
/*Crea un procedimiento RecargarTarjeta que reciba como parámetros el ID de una tarjeta y un importe y 
actualice el saldo de la tarjeta sumándole dicho importe, además de grabar la correspondiente recarga*/

SELECT * FROM LM_Recargas
SELECT * FROM LM_Tarjetas
GO

CREATE PROCEDURE RecargarTarjeta (@IdTarjeta INT, @Importe MONEY) AS
	BEGIN
		BEGIN TRANSACTION
		COMMIT TRANSACTION
	END

--Ejercicio 0
/*La dimisión de Esperanza Aguirre ha causado tal conmoción entre los directivos de LeoMetro que han decidido 
conceder una amnistía a todos los pasajeros que tengan un saldo negativo en sus tarjetas.

Crea un procedimiento que racargue la cantidad necesaria para dejar a 0 el saldo de las tarjetas que 
tengan un saldo negativo y hayan sido recargadas al menos una vez en los últimos dos meses.

Ejercicio elaborado en colaboración con Sefran.*/

--Ejercicio 2
/*Crea un procedimiento almacenado llamado PasajeroSale que reciba como parámetros el ID de una tarjeta, el ID de una estación y una fecha/hora (opcional).

El procedimiento se llamará cuando un pasajero pasa su tarjeta por uno de los tornos de salida del metro. Su misión es grabar la salida en la tabla LM_Viajes.

Para ello deberá localizar la entrada que corresponda, que será la última entrada correspondiente al mismo pasajero y hará un update de columnas que corresponda.

Si no existe la entrada, grabaremos una nueva fila en LM_Viajes dejando a NULL la estación y el momento de entrada.

Si se omite el parámetro de la fecha/hora, se tomará la actual*/

--Ejercicio 3
/*A veces, un pasajero reclama que le hemos cobrado un viaje de forma indebida.

Escribe un procedimiento que reciba como parámetro el ID de un pasajero y la fecha y hora de la entrada
en el metro y anule ese viaje, actualizando además el saldo de la tarjeta que utilizó*/

--Ejercicio 4
/*La empresa de Metro realiza una campaña de promoción para pasajeros fieles.

Crea un procedimiento almacenado que recargue saldo a los pasajeros que cumplan determinados requisitos. 

Se recargarán N1 euros a los pasajeros que hayan consumido más de 30 euros en el mes anterior (considerar mes completo, del día 1 al fin)
y N2 euros a los que hayan utilizado más de 10 veces alguna estación de las zonas 3 o 4. 

Los valores de N1 y N2 se pasarán como parámetros. Si se omiten, se tomará el valor 5.

Ambos premios son excluyentes. Si algún pasajero cumple ambas condiciones se le aplicará la que suponga mayor bonificación de las dos*/

--Ejercicio 5
/*Crea una función que nos devuelva verdadero si es posible que un pasajero haya subido a un tren en un determinado viaje.
Se pasará como parámetro el código del viaje y la matrícula del tren*/

--Ejercicio 6
/*Crea un procedimiento SustituirTarjeta que Cree una nueva tarjeta y la asigne al mismo usuario y con el mismo saldo que otra tarjeta existente.
El código de la tarjeta a sustituir se pasará como parámetro*/

--Ejercicio 7
/*Las estaciones de la zona 3 tienen ciertas deficiencias, lo que nos ha obligado a introducir
una serie de modificaciones en los trenes  para cumplir las medidas de seguridad.

A consecuencia de estas modificaciones, la capacidad de los trenes se ha visto
reducida en 6 plazas para los trenes de tipo 1 y 4 plazas para los trenes de tipo 2.

Realiza un procedimiento al que se pase un intervalo de tiempo y modifique la capacidad de todos
los trenes que hayan circulado más de una vez por alguna estación de la zona 3 en ese intervalo*/