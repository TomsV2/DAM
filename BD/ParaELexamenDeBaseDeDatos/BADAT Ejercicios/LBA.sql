CREATE DATABASE LBA
GO
USE LBA
GO
CREATE TABLE LBA_PAISES(
	ID CHAR(3) NOT NULL
	,Denominacion VARCHAR(25) NOT NULL
	,UE BIT NOT NULL
	,CONSTRAINT PK_LBA_PAISES PRIMARY KEY (ID)
)
GO
CREATE TABLE LBA_JUGADORES(
	Licencia CHAR(10) NOT NULL
	,Nombre VARCHAR(20) NOT NULL
	,Apellidos VARCHAR(30) NOT NULL
	,FechaNac DATE NULL
	,Dorsal TINYINT NOT NULL
	,Posicion CHAR(1) NULL
	,Nacionalidad CHAR(3) NULL
	,CONSTRAINT PK_LBA_JUGADORES PRIMARY KEY (Licencia)
	,CONSTRAINT FK_LBA_JUGADORES_PAISES FOREIGN KEY (Nacionalidad) REFERENCES LBA_PAISES(ID) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO
CREATE TABLE LBA_CANCHAS(
	ID TINYINT IDENTITY(1,1) NOT NULL
	,Denominacion VARCHAR(30) NOT NULL
	,Direccion VARCHAR(30) NULL
	,Localidad VARCHAR(25) NOT NULL
	,CONSTRAINT PK_LBA_CANCHAS PRIMARY KEY (ID)
)
GO
CREATE TABLE LBA_EQUIPOS(
	Codigo CHAR (3) NOT NULL
	,Nombre VARCHAR(30) NOT NULL
	,Fecha_Fundacion DATE NULL
	,Localidad VARCHAR(25) NOT NULL
	,ID_CANCHA TINYINT NOT NULL
	,CONSTRAINT PK_LBA_EQUIPOS PRIMARY KEY(Codigo)
	,CONSTRAINT FK_LBA_EQUIPOS_CANCHAS FOREIGN KEY(ID_CANCHA) REFERENCES LBA_CANCHAS(ID) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO
CREATE TABLE LBA_PARTIDOS(
	ID SMALLINT IDENTITY (1,1) NOT NULL
	,Fecha_Hora SMALLDATETIME NOT NULL
	,ID_Local CHAR(3) NOT NULL
	,ID_Visitante CHAR(3) NOT NULL
	,Puntos_Local TINYINT NULL
	,Puntos_Visitante TINYINT NULL
	,CONSTRAINT PK_LBA_PARTIDOS PRIMARY KEY (ID)
	,CONSTRAINT FK_LBA_PARTIDOS_EQUIPOS1 FOREIGN KEY (ID_Local) REFERENCES LBA_EQUIPOS(Codigo) ON DELETE NO ACTION ON UPDATE CASCADE
	,CONSTRAINT FK_LBA_PARTIDOS_EQUIPOS2 FOREIGN KEY (ID_Visitante) REFERENCES LBA_EQUIPOS(Codigo) ON DELETE NO ACTION ON UPDATE NO ACTION --CASCADE DA ERROR
)
GO
CREATE TABLE LBA_JUEGA(
	Licencia CHAR(10) NOT NULL
	,ID_Partido SMALLINT NOT NULL
	,Minutos INT NULL
	,Tiros1 TINYINT NULL
	,Tiros2 TINYINT NULL
	,Tiros3 TINYINT NULL
	,Puntos1 TINYINT NULL
	,Puntos2 TINYINT NULL
	,Puntos3 TINYINT NULL
	,Personales TINYINT NULL
	,CONSTRAINT PK_LBA_JUEGA PRIMARY KEY(Licencia,ID_Partido)
	,CONSTRAINT FK_LBA_JUEGA_JUGADORES FOREIGN KEY(Licencia) REFERENCES LBA_JUGADORES(Licencia) ON DELETE NO ACTION ON UPDATE CASCADE
	,CONSTRAINT FK_LBA_JUEGA_PARTIDOS FOREIGN KEY(ID_Partido) REFERENCES LBA_PARTIDOS(ID) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO
--Ahora aplicaremos las siguientes restricciones:
--1. La edad de un jugador no puede ser inferior a quince años ni superior a cincuenta.
ALTER TABLE LBA_JUGADORES ADD CONSTRAINT CK_JUGADORES_EDAD CHECK ((YEAR(CURRENT_TIMESTAMP-CAST(FechaNac AS DATETIME))-1900) BETWEEN 15 AND 50)
GO
/*2. Crea una restricción en la tabla LBA_Jugadores para asegurarte que el dorsal está
comprendido entre 0 y 99 y otra para asegurarte que el valor de la posición es válido. Los
valores válidos son B, A, P, E y L.*/
ALTER TABLE LBA_JUGADORES ADD CONSTRAINT CK_JUGADORES_DORSAL_VALIDO CHECK (DORSAL BETWEEN 0 AND 99)
ALTER TABLE LBA_JUGADORES ADD CONSTRAINT CK_JUGADORES_POSICION_VALIDA CHECK(POSICION IN('B','A','P','E','L'))
GO
--3. La fecha de fundación del equipo ha de ser anterior a la actual.
ALTER TABLE LBA_EQUIPOS ADD CONSTRAINT CK_FECHA_FUNDACION_VALIDA CHECK (Fecha_Fundacion<CURRENT_TIMESTAMP)
GO
/*4. Crea una restricción en la tabla LBA_Juega para asegurar que el número de minutos, si
no es nulo, es positivo y menor que 40*/
SET ANSI_NULLS OFF --Pongo esto para que si comparo un NULL me devuelva TRUE o FALSE, no UNKNOWN
ALTER TABLE LBA_JUEGA ADD CONSTRAINT CK_NUMERO_MINUTOS_VALIDO CHECK (Minutos BETWEEN 0 AND 40) --No compruebo el NULL porque los NULL no se comprueban en los check.
GO
/*5. Crea una restricción en la tabla LBA_Juega para asegurar que el número de tiros de un
jugador es mayor o igual que los aciertos que les corresponden. Recuerda que las
columnas Puntos1, 2 y 3 contiene el número de puntos, y para hallar los aciertos hay que
dividir por su valor.*/
ALTER TABLE LBA_JUEGA ADD CONSTRAINT CK_NUMERO_TIROS_JUGADOR CHECK ((Tiros1>=Puntos1) AND ((Tiros2*2)>=Puntos2) AND ((Tiros3*3)>=Puntos3))--Las tablas puntos tienen el valor de los puntos, no el número de canastas
/*6. Las columnas Puntos_Local y Puntos_Visitante de la tabla LBA_Partidos deben estar a
NULL hasta que se celebre el partido.*/ 
ALTER TABLE LBA_PARTIDOS ADD CONSTRAINT CK_PUNTOS_PARTIDO_NULOS CHECK ((Puntos_Local IS NULL AND Puntos_Visitante IS NULL AND Fecha_Hora IS NULL) OR (Fecha_Hora<=CURRENT_TIMESTAMP AND Puntos_Local IS NOT NULL AND Puntos_Visitante IS NOT NULL))