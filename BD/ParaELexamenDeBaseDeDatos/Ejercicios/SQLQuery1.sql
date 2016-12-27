use Liga
drop database Jorge_Restricciones
create database Jorge_Restricciones
go
use Jorge_Restricciones
go


/*
DatosRestrictivos.
ID: Es un SmallInt autonumérico que se rellenará con números impares.. No admite nulos. Clave primaria
Nombre: Cadena de tamaño 15. No puede empezar por "N” ni por "X” Añade una restiricción UNIQUE. No admite nulos
Numpelos: Int con valores comprendidos entre 0 y 145.000
TipoRopa: Carácter con uno de los siguientes valores: "C”, "F”, "E”, "P”, "B”, ”N”
NumSuerte: TinyInt. Tiene que ser un número divisible por 3.
Minutos: TinyInt Con valores comprendidos entre 20 y 85 o entre 120 y 185.
*/

--drop table DatosRestrictivos

create table DatosRestrictivos (
ID SmallInt Not null Identity (1,2) 
	Constraint PK_ID Primary Key,
Nombre VarChar (15) Not null 
	Constraint UQ_Nombre Unique 
	Constraint CK_Nombre Check (Nombre Not like '[NX]%'),
Numpelos Int Null 
	Constraint CK_Numpelos Check (Numpelos Between 0 and 145000),
TipoRopa Char Null
	Constraint CK_TipoRopa Check (TipoRopa like '[CFEPBN]'),
NumSuerte TinyInt Null
	Constraint CK_NumSuerte Check (NumSuerte%3=0),
Minutos TinyInt Null
	Constraint CK_Minutos Check ((Minutos Between 20 and 85)or(Minutos Between 120 and 185))
)

/*
DatosRelacionados.
NombreRelacionado: Cadena de tamaño 15. 
	Define una FK para relacionarla con la columna "Nombre” de la tabla DatosRestrictivos.
	¿Deberíamos poner la misma restricción que en la columna correspondiente?
	¿Qué ocurriría si la ponemos?
	¿Y si no la ponemos?
PalabraTabu: Cadena de longitud max 20. 
	No admitirá los valores "Barcenas”, "Gurtel”, "Púnica”, "Bankia” ni "sobre”. 
	Tampoco admitirá ninguna palabra terminada en "eo”
NumRarito: TinyInt menor que 20. No admitirá números primos.
NumMasgrande: SmallInt. Valores comprendidos entre NumRarito y 1000. Definirlo como clave primaria.
	¿Puede tener valores menores que 20?
*/

--drop table DatosRelacionados

create table DatosRelacionados(
NombreRelacionado VarChar (15) Not null
	Constraint FK_Nombre_DatosRestrictivos Foreign key
	References DatosRestrictivos(Nombre)
	ON DELETE NO ACTION ON UPDATE CASCADE,
PalabraTabu VarChar (20)
	Constraint CK_PalabraTabu Check (PalabraTabu Not in ('Barcenas','Gurtel','Púnica','Bankia','Sobre')and(PalabraTabu Not like '%eo')),
NumRarito TinyInt Not null
	Constraint CK_NumRarito Check ((NumRarito<20)and(NumRarito Not in (1,2,3,5,7,13))),
NumMasGrande SmallInt Not null
	Constraint PK_NumMasGrande Primary Key,
	Constraint CK_NumMasGrande Check (NumMasGrande Between NumRarito and 1000)		
)

/*
DatosAlMogollon.
ID: SmallInt. No admitirá múltiplos de 5. Definirlo como PK
LimiteSuperior: SmallInt comprendido entre 1500 y 2000.
OtroNumero: Será mayor que el ID y Menor que LimiteSuperior. Poner UNIQUE
NumeroQueVinoDelMasAlla: SmallInt FK relacionada con NumMasGrande de la tabla DatosRelacionados
Etiqueta: Cadena de 3 caracteres. No puede tener los valores "pao”, "peo”, "pio” ni "puo”
*/

create table DatosAlMogollon(
ID SmallInt Not null
	Constraint PK_ID_DatosAlMogollon Primary Key
	Constraint CK_ID Check (Not(ID%5=0)),
LimiteSuperior SmallInt Not null
	Constraint CK_LimiteSuperior Check (LimiteSuperior Between 1500 and 2000),
OtroNumero SmallInt Not null
	Constraint UQ_OtroNumero Unique,
		Constraint CK_OtroNumero Check ((OtroNumero>ID)and(OtroNumero<LimiteSuperior)),
NumeroQueVinoDelMasAlla SmallInt Not null
	Constraint FK_NumeroQueVinoDelMasAlla_NumMasGrande Foreign Key
	References DatosRelacionados(NumMasGrande)
	ON DELETE NO ACTION ON UPDATE CASCADE,
Etiqueta Char (3)
	Constraint CK_Etiqueta Check (Etiqueta Not in('pao','peo','pio','puo'))
)

