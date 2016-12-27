
create database Ejemplo
go
use Ejemplo
go 

/*
1.	DatosRestrictivos. Columnas:
a.	ID Es un SmallInt autonumérico que se rellenará con números impares.. No admite nulos. Clave primaria
b.	Nombre: Cadena de tamaño 15. No puede empezar por "N” ni por "X” Añade una restiricción UNIQUE. No admite nulos
c.	Numpelos: Int con valores comprendidos entre 0 y 145.000
d.	TipoRopa: Carácter con uno de los siguientes valores: "C”, "F”, "E”, "P”, "B”, ”N”
e.	NumSuerte: TinyInt. Tiene que ser un número divisible por 3.
f.	Minutos: TinyInt Con valores comprendidos entre 20 y 85 o entre 120 y 185.
*/
create table EJ_DatosRestrictivos(
		  ID smallint not null identity(1,2) Constraint CK_Impares check(ID%2!=0)
		 ,Nombre char(15) Constraint UQ_Nombre unique  not null  Constraint CK_NombreCorrecto check (Nombre not like '[NX]%')
		 ,Numpelos int	 Constraint CK_Numpelos check (Numpelos between 0 and 145000)
		 ,TipoRopa char(1)	 Constraint CK_TipoRopa  check (TipoRopa IN ('C', 'F', 'E', 'P', 'B', 'N'))
		 ,NumSuerte tinyint  Constraint CK_NumSuerte check (NumSuerte%3=0)
		 ,Minutos tinyint  Constraint CK_Minutos check ((Minutos between  20 and 85) or (Minutos between  120 and 185))
		 ,constraint PK_EJ_DatosRestrictivos primary key(ID)
)

/*
2.	DatosRelacionados. Columnas:
a.	NombreRelacionado: Cadena de tamaño 15. Define una FK para relacionarla con la columna "Nombre” de la tabla DatosRestrictivos.
¿Deberíamos poner la misma restricción que en la columna correspondiente? 
No por que la restriccion ya se puso en la tabla donde fue creado el nombre
En caso de que sea una restriccion diferente a la de la foreign key si se puede poner
¿Qué ocurriría si la ponemos? 
se comprobaria dos veces 
¿Y si no la ponemos?
no pasa nada

b.	PalabraTabu: Cadena de longitud max 20. No admitirá los valores "Barcenas”, "Gurtel”, "Púnica”, "Bankia” ni "sobre”. Tampoco admitirá ninguna palabra terminada en "eo”
c.	NumRarito: TinyInt menor que 20. No admitirá números primos.
d.	NumMasgrande: SmallInt. Valores comprendidos entre NumRarito y 1000. Definirlo como clave primaria.
¿Puede tener valores menores que 20?

*/
create table EJ_DatosRelacionados(
	 NombreRelacionado char(15) not null
	,PalabraTabu char(20) not null  check (PalabraTabu not in ('Barcenas','Gurtel','Púnica','Bankia','sobre') and PalabraTabu not like ('%eo') ) 
	,NumRarito TinyInt not null  check (NumRarito<20 and (NumRarito not in (2,3,5,7,11,13,17,19)))
	,NumMasgrande smallint  check (NumMasgrande between NumRarito and 1000)
	,constraint PK_EJ_DatosRelacionados primary key (NumMasgrande)
)

/*
3.	DatosAlMogollon. Columnas:
a.	ID. SmallInt. No admitirá múltiplos de 5. Definirlo como PK
b.	LimiteSuperior. SmallInt comprendido entre 1500 y 2000.
c.	OtroNumero. Será mayor que el ID y Menor que LimiteSuperior. Poner UNIQUE
d.	NumeroQueVinoDelMasAlla: SmallInt FK relacionada con NumMasGrande de la tabla DatosRelacionados
e.	Etiqueta. Cadena de 3 caracteres. No puede tener los valores "pao”, "peo”, "pio” ni "puo”

*/
create table  EJ_DatosAlMogollon(
	ID SmallInt
)