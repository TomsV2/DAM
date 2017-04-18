CREATE DATABASE EJEMPLOS2
GO
USE EJEMPLOS2 

GO
/*
*DatosRestrictivos. Columnas:
ID Es un SmallInt autonumérico que se rellenará con números impares.. No admite nulos. Clave primaria
Nombre: Cadena de tamaño 15. No puede empezar por "N” ni por "X” Añade una restiricción UNIQUE. No admite nulos
Numpelos: Int con valores comprendidos entre 0 y 145.000
TipoRopa: Carácter con uno de los siguientes valores: "C”, "F”, "E”, "P”, "B”, ”N”
NumSuerte: TinyInt. Tiene que ser un número divisible por 3.
Minutos: TinyInt Con valores comprendidos entre 20 y 85 o entre 120 y 185.
*/
CREATE TABLE DATOS_RESTRICTIVOS(
	ID SMALLINT NOT NULL IDENTITY(1,2) CONSTRAINT PK_DATOS_RESTRICTIVOS PRIMARY KEY ,
	NOMBRE NVARCHAR(15) NOT NULL CONSTRAINT UQ_Nombre UNIQUE CONSTRAINT CK_NOMBRE  CHECK(NOMBRE LIKE '[^NX]%'),
	NUM_PELOS INT CONSTRAINT CK_NUM_PELOS CHECK(NUM_PELOS BETWEEN 0 AND 145000),
	TIPO_ROPA NCHAR(1) CONSTRAINT CK_TIP_ROPA CHECK (TIPO_ROPA IN ('C', 'F', 'E', 'P', 'B', 'N')/*LIKE '[CFEPBN]'*/),
	NUM_SUERTE TINYINT CONSTRAINT CK_NUM_SUERTE CHECK (NUM_SUERTE%3=0),
	MINUTOS TINYINT CONSTRAINT CK_MINUTOS CHECK ((MINUTOS BETWEEN 20 AND 80)OR(MINUTOS BETWEEN 120 AND 185)) 
)
/**
DatosRelacionados. Columnas:
NombreRelacionado: Cadena de tamaño 15. Define una FK para relacionarla con la columna "Nombre” de la tabla DatosRestrictivos.
¿Deberíamos poner la misma restricción que en la columna correspondiente?

¿Qué ocurriría si la ponemos?

¿Y si no la ponemos?

PalabraTabu: Cadena de longitud max 20. No admitirá los valores "Barcenas”, "Gurtel”, "Púnica”, "Bankia” ni "sobre”. Tampoco admitirá ninguna palabra terminada en "eo”
NumRarito: TinyInt menor que 20. No admitirá números primos.
NumMasgrande: SmallInt. Valores comprendidos entre NumRarito y 1000. Definirlo como clave primaria.
¿Puede tener valores menores que 20?
-SI HASTA 0.
*/

CREATE TABLE DATOS_RELACIONADOS(
	NOMBRE_RELACIONADO NVARCHAR(15) NOT NULL 
	CONSTRAINT FK_RELACIONADOS_RESTRICTIVOS FOREIGN KEY (NOMBRE_RELACIONADO) REFERENCES DATOS_RESTRICTIVOS(NOMBRE),
	CONSTRAINT CK_NOMBRE_RELACIONADO CHECK(NOMBRE_RELACIONADO LIKE '[^NX]%'),
	PALABRA_TABU NVARCHAR(20) 
	CONSTRAINT CK_PALABRA_TABU CHECK(NOT (PALABRA_TABU  IN ('Barcenas', 'Gurtel', 'Púnica', 'Bankia','sobre') OR PALABRA_TABU LIKE '%EO')),
	NUM_RARITO TINYINT
	CONSTRAINT CK_NUM_RARITO CHECK ((NUM_RARITO <= 20) AND NUM_RARITO NOT IN (2,3,5,7,11,13,17,19)),
	NUM_MAS_GRANDE SMALLINT 
	CONSTRAINT PK_NUM_MAS_GRANDE PRIMARY KEY 
	,CONSTRAINT CK_NUM_MAS_GRANDE CHECK(NUM_MAS_GRANDE BETWEEN NUM_RARITO AND 1000),
)
/**
DatosAlMogollon. Columnas:
ID. SmallInt. No admitirá múltiplos de 5. Definirlo como PK
LimiteSuperior. SmallInt comprendido entre 1500 y 2000.
OtroNumero. Será mayor que el ID y Menor que LimiteSuperior. Poner UNIQUE
NumeroQueVinoDelMasAlla: SmallInt FK relacionada con NumMasGrande de la tabla DatosRelacionados
Etiqueta. Cadena de 3 caracteres. No puede tener los valores "pao”, "peo”, "pio” ni "puo”
*/
CREATE TABLE DATOS_AL_MOGOLLON(
	ID SMALLINT NOT NULL 
	CONSTRAINT PK_ID_DATOS_AL_MOGOLLON PRIMARY KEY
	CONSTRAINT CK_ID_DATOS_AL_MOGOLLON CHECK (ID%5!=0),
	LIMITE_SUPERIOR SMALLINT CONSTRAINT CK_LIMITE_SUPERIOR CHECK (LIMITE_SUPERIOR BETWEEN 1500 AND 2000),
	OTRO_NUMERO SMALLINT CONSTRAINT UQ_OtroNumero UNIQUE 
	,CONSTRAINT CK_OTRO_NUMERO CHECK(OTRO_NUMERO>ID AND OTRO_NUMERO<LIMITE_SUPERIOR), 
	NUMERO_QUE_VIENE_DEL_MAS_ALLA SMALLINT CONSTRAINT FK_NUMERO_QUE_VIENE_DEL_MAS_ALLA FOREIGN KEY (NUMERO_QUE_VIENE_DEL_MAS_ALLA) REFERENCES DATOS_RELACIONADOS(NUM_MAS_GRANDE),
	ETIQUETA NCHAR(3) CONSTRAINT CK_ETIQUETA CHECK(ETIQUETA NOT LIKE 'P[AEIU]O'),
)







