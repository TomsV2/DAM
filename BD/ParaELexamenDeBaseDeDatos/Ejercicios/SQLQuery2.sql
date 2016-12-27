CREATE DATABASE hospital
GO
USE hospital
GO

CREATE TABLE medicos(
	N_colegiado Varchar (10) NOT NULL CONSTRAINT PK_N_Colegiado Primary Key,
	Nombre Varchar (50) NOT NULL,
	Apellidos Varchar (50) NOT NULL,
)
GO


CREATE TABLE usuarios(
	N_Seguridad_Social Varchar (10) Not Null CONSTRAINT PK_N_Seguridad_Social PRIMARY KEY,
	Nombre Varchar (50) Not Null,
	Apellidos Varchar (50) Not Null,
	N_colegiado Varchar (10)
		CONSTRAINT FK_N_Colegiado FOREIGN KEY
		REFERENCES medicos(N_colegiado)
		ON DELETE SET NULL ON UPDATE CASCADE
)

SELECT * FROM medicos