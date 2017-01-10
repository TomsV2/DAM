USE MASTER
GO

DROP DATABASE ExamenBD
GO

CREATE DATABASE ExamenBD
GO

USE ExamenBD
GO

CREATE TABLE Dones(
	ID int identity(1,1)
		CONSTRAINT PK_Dones PRIMARY KEY,
	Nombre nvarchar (10) NULL,
	Apellidos nvarchar (20) NULL,
	Apodo nvarchar (10) NULL,
	FechaNacimiento Date,
	Procedencia nvarchar (10) NULL,
)
GO

CREATE TABLE Consiglieres(
	ID int identity(1,1)
		CONSTRAINT PK_Consiglieres PRIMARY KEY,
	Nombre nvarchar (10) NULL,
	Apellidos nvarchar (20) NULL,
	Apodo nvarchar (10) NULL,
	FechaNacimiento Date,
	Procedencia nvarchar (10) NULL,
	Titulacion nvarchar (30) NULL,
	Dones_ID int NOT NULL 
		CONSTRAINT FK_Consiglieres_Dones FOREIGN KEY 
		REFERENCES Dones(ID) ON UPDATE CASCADE ON DELETE NO ACTION
)
GO

CREATE TABLE Famiglias(
	ID int identity(1,1)
		CONSTRAINT PK_Famiglias PRIMARY KEY,
	Nombre nvarchar (10) NULL,
	Procedencia nvarchar (10) NULL,
	Dones_ID int NOT NULL 
		CONSTRAINT FK_Famiglias_Dones FOREIGN KEY 
		REFERENCES Dones(ID) ON UPDATE CASCADE ON DELETE NO ACTION
)
GO

CREATE TABLE Negocios(
	ID int identity(1,1)
		CONSTRAINT PK_Negocios PRIMARY KEY,
	Denominacion nvarchar (20) NULL,
	LegalSN int NULL, --Si es legal será 1, si es ilegal será 2--
	Famiglias_ID int NOT NULL 
		CONSTRAINT FK_Negocios_Famiglias FOREIGN KEY 
		REFERENCES Famiglias(ID) ON UPDATE CASCADE ON DELETE NO ACTION
)
GO

CREATE TABLE Territorios(
	ID int identity(1,1)
		CONSTRAINT PK_Territorios PRIMARY KEY,
	Ciudad nvarchar (20) NULL,
	Barrio nvarchar (20) NULL,
	Famiglias_ID int NOT NULL 
		CONSTRAINT FK_Territorios_Famiglias FOREIGN KEY 
		REFERENCES Famiglias(ID) ON UPDATE CASCADE ON DELETE NO ACTION
)
GO

CREATE TABLE Capos_Caporegimes_Capodecimes(
	ID int identity(1,1)
		CONSTRAINT PK_Capos PRIMARY KEY,
	Nombre nvarchar (10) NULL,
	Apellidos nvarchar (20) NULL,
	Apodo nvarchar (10) NULL,
	FechaNacimiento Date,
	Procedencia nvarchar (10) NULL,
	PorcentajeComision int NULL,
	Sueldo int NULL,
	FechaContratacion date NULL,
	Famiglias_ID int NOT NULL 
		CONSTRAINT FK_Capos_Famiglias FOREIGN KEY 
		REFERENCES Famiglias(ID) ON UPDATE CASCADE ON DELETE NO ACTION
)
GO

CREATE TABLE Soldados(
	ID int identity(1,1)
		CONSTRAINT PK_Soldados PRIMARY KEY,
	Nombre nvarchar (10) NULL,
	Apellidos nvarchar (20) NULL,
	Apodo nvarchar (10) NULL,
	FechaNacimiento Date,
	Procedencia nvarchar (10) NULL,
	TatuajePrincipal nvarchar (20) NULL,
	Capos_Caporegimes_Capodecimes_ID int NOT NULL 
		CONSTRAINT FK_Soldados_Capos_Caporegimes_Capodecimes FOREIGN KEY 
		REFERENCES Capos_Caporegimes_Capodecimes(ID) ON UPDATE CASCADE ON DELETE NO ACTION
)
GO

CREATE TABLE LugarTenientes(
	ID int identity(1,1)
		CONSTRAINT PK_LugarTenientes PRIMARY KEY,
	Nombre nvarchar (10) NULL,
	Apellidos nvarchar (20) NULL,
	Apodo nvarchar (10) NULL,
	Capos_Caporegimes_Capodecimes_ID int NOT NULL 
		CONSTRAINT FK_LugarTenientes_Capos_Caporegimes_Capodecimes FOREIGN KEY 
		REFERENCES Capos_Caporegimes_Capodecimes(ID) ON UPDATE CASCADE ON DELETE NO ACTION
)
GO

CREATE TABLE TecnicasPersuasion(
	ID int identity(1,1)
		CONSTRAINT PK_TecnicasPersuasion PRIMARY KEY,
	Denominacion nvarchar (10) NULL,
)
GO

CREATE TABLE Armas(
	ID int identity(1,1)
		CONSTRAINT PK_Armas PRIMARY KEY,
	LegalSN int NULL, --Si es legal será 1, si es ilegal será 2--
	LicenciaSN int NULL, --Si tiene licencia será 1, si no será 2--
)
GO

CREATE TABLE ArmasBlancas(
	LongitudHoja int NULL,
	TipoFilo nvarchar (10) NULL,
	RetractilSN int NULL, --Si es retractil será 1, si no será 2--
	Armas_ID int NOT NULL
		CONSTRAINT FK_Armas_ArmasBlancas foreign key
		REFERENCES Armas(ID)
)
GO

CREATE TABLE ArmasFuego(
	Marca nvarchar (10) NULL,
	Modelo nvarchar (20) NULL,
	Calibre int NULL,
	CapacidadProyectiles int NULL,
	Armas_ID int NOT NULL
		CONSTRAINT FK_Armas_ArmasFuego foreign key
		REFERENCES Armas(ID)
)
GO

CREATE TABLE Armas_Soldados(
	ID_Arma int NOT NULL,
	ID_Soldado int NOT NULL,
	Destreza int NULL,

	CONSTRAINT PK_Armas_Soldados PRIMARY KEY (ID_Arma, ID_Soldado),

	Constraint FK_Armas_SoldadosArma Foreign Key (ID_Arma) 
	REFERENCES Armas (ID) ON UPDATE CASCADE ON DELETE NO ACTION,

	Constraint FK_Armas_SoldadosSoldados Foreign Key (ID_Soldado) 
	REFERENCES Soldados (ID) ON UPDATE CASCADE ON DELETE NO ACTION,
)
GO


alter table Soldados Add
	Constraint CK_EdadSoldado Check ((Year (Current_Timestamp - Cast(FechaNacimiento as SmallDatetime))- 1900) between 15 and 55)

--ALTER TABLE Armas with nocheck ADD 
	--Constraint CK_ArmaIlegal CHECK ()

ALTER TABLE Capos_Caporegimes_Capodecimes with nocheck ADD 
	Constraint CK_MismoNick CHECK (Apodo!=Apodo)

ALTER TABLE ArmasBlancas with nocheck ADD 
	Constraint CK_TipoFilo Check (TipoFilo  IN ('recto','convexo','scandi','serrado','mixto'))