/*1.- Queremos que cada vez que se actualice la tabla Palabras aparezca un mensaje diciendo si
se han añadido, borrado o actualizado filas.
Pista: Crea tres triggers diferentes*/

SELECT * FROM Palabras

INSERT INTO Palabras (Palabra)
VALUES ('Jorge la ReturboMamaGuapo')
go

UPDATE Palabras
SET	()
GO

ALTER TRIGGER aniadir ON Palabras
AFTER UPDATE AS 
PRINT 'se ha aniadido mieo'

/*2.- Haz un trigger que cada vez que se aumente o disminuya el número de filas de la tabla
Palabras nos diga cuántas filas hay.*/


