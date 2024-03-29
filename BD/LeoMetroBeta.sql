USE [master]
GO
/****** Object:  Database [LeoMetro]    Script Date: 01/03/2017 10:48:23 ******/
CREATE DATABASE [LeoMetroBeta]
GO
USE [LeoMetroBeta]
GO
/****** Object:  StoredProcedure [dbo].[CorreMetro]    Script Date: 01/03/2017 10:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Pone a un tren a recorrer una línea durante N horas hasta el momento que se indica como parámetro
*/
CREATE Procedure [dbo].[CorreMetro] (@Metro Int, @Linea Char(4), @Tiempo DateTime, @Horas TinyInt) AS
Begin
	SET NOCOUNT ON
	DECLARE @Momento DateTime
	DECLARE @estacion SmallInt
	DECLARE @NumOrden TinyInt = 1
	DECLARE @Intervalo TIME
	DECLARE @IntervaloMin TinyInt, @IntervaloSec SmallInt
	SET @Momento = DateAdd(hour,-@Horas,@Tiempo)
	SELECT @estacion = estacionIni FROM LM_Itinerarios Where Linea = @Linea AND NumOrden =  @NumOrden
	While @Momento < @Tiempo
	BEGIN
		--Insertar Stop
		INSERT INTO LM_Recorridos (Tren, Linea, estacion, Momento) VALUES (@Metro, @Linea, @estacion, @Momento)
		--Actualizar momento
		SELECT @Intervalo = TiempoEstimado FROM LM_Itinerarios Where Linea = @Linea AND NumOrden = @NumOrden
		SET @IntervaloMin = Datepart(minute,@Intervalo)
		SET @IntervaloSec = Datepart(second,@Intervalo)+ RAND()*60-30
		SET @Momento = DATEADD(minute,@IntervaloMin,@Momento)
		SET @Momento = DATEADD(second,@IntervaloSec,@Momento)
		--Obtener siguiente estacion
		SET @NumOrden += 1
		SET @estacion = (SELECT estacionIni FROM LM_Itinerarios Where Linea = @Linea AND NumOrden =  @NumOrden)
		IF @estacion IS NULL
		BEGIN
			SET @NumOrden = 1
			SET @estacion = (SELECT estacionIni FROM LM_Itinerarios Where Linea = @Linea AND NumOrden =  @NumOrden)
		END -- IF
	END -- While
End -- CorreMetro

GO
/****** Object:  UserDefinedFunction [dbo].[FN_TiempoEstimado]    Script Date: 01/03/2017 10:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Ejercicio 2
/*
Crea una función a la que se pase el código de una línea y dos estaciones de esa línea circular 
(dos cifras) y nos diga cuánto es el tiempo estimado que tarda un tren en llegar de una a otra.

La función devolverá un NULL si hay algún error en los datos de entrada (línea inexistente, 
la línea no pasa por alguna de las estaciones, estación inexistente)
*/

CREATE FUNCTION [dbo].[FN_TiempoEstimado] (@Linea CHAR(4), @EstacionOrigen SmallInt, @EstacionFin SmallInt)
	RETURNS TIME AS
	BEGIN
	DECLARE @TiempoTotal TIME
	DECLARE @ProximaEstacion SmallInt
	DECLARE @NumOrden TinyInt = 1
	DECLARE @Intervalo TIME

	SET @TiempoTotal = '00:00:00'
	SET @ProximaEstacion = -1	-- Para empezar el recorrido. No tenemos bucle con condición al final
	-- Tomamos el número de tramo donde empieza el recorrido que vamos a calcular
	SELECT @NumOrden = NumOrden FROM LM_Itinerarios Where Linea = @Linea AND EstacionIni =  @EstacionOrigen
	While @ProximaEstacion <> @EstacionFin 
	BEGIN
		--Obtener tiempo y próxima estacion
		SELECT @Intervalo = TiempoEstimado, @ProximaEstacion = EstacionFin FROM LM_Itinerarios Where Linea = @Linea AND NumOrden = @NumOrden
		--Acumular tiempo
		SET @TiempoTotal = DATEADD(second,Datepart(minute,@Intervalo)*60+Datepart(second,@Intervalo),@TiempoTotal)
		--Obtener siguiente estacion
		SET @NumOrden += 1
		-- Si hemos llegado al último tramo de la línea volvemos al principio
		IF NOT EXISTS (SELECT * FROM LM_Itinerarios Where Linea = @Linea AND NumOrden =  @NumOrden)
		BEGIN
			SET @NumOrden = 1
		END -- IF
	END -- While
	RETURN @TiempoTotal
	END -- Function
GO
/****** Object:  Table [dbo].[LM_Estaciones]    Script Date: 01/03/2017 10:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LM_Estaciones](
	[ID] [smallint] NOT NULL,
	[Denominacion] [varchar](30) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estacion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LM_Itinerarios]    Script Date: 01/03/2017 10:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LM_Itinerarios](
	[estacionIni] [smallint] NOT NULL,
	[estacionFin] [smallint] NOT NULL,
	[NumOrden] [tinyint] NOT NULL,
	[Linea] [char](4) NOT NULL,
	[TiempoEstimado] [time](7) NULL,
	[Distancia] [decimal](4, 2) NULL,
 CONSTRAINT [PK_Itinerario] PRIMARY KEY CLUSTERED 
(
	[Linea] ASC,
	[NumOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LM_Lineas]    Script Date: 01/03/2017 10:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LM_Lineas](
	[ID] [char](4) NOT NULL,
	[Denominacion] [varchar](30) NOT NULL,
	[Color] [varchar](12) NULL,
 CONSTRAINT [PK_Linea] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LM_Pasajeros]    Script Date: 01/03/2017 10:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LM_Pasajeros](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellidos] [varchar](30) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Ciudad] [varchar](20) NOT NULL,
	[Telefono1] [char](9) NOT NULL,
	[Telefono2] [char](9) NULL,
 CONSTRAINT [PKPasajeros] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LM_Recorridos]    Script Date: 01/03/2017 10:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LM_Recorridos](
	[Tren] [int] NOT NULL,
	[Linea] [char](4) NOT NULL,
	[estacion] [smallint] NOT NULL,
	[Momento] [datetime] NOT NULL DEFAULT (getdate()),
 CONSTRAINT [PK_Recorridos] PRIMARY KEY CLUSTERED 
(
	[Tren] ASC,
	[Momento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LM_Trenes]    Script Date: 01/03/2017 10:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LM_Trenes](
	[ID] [int] NOT NULL,
	[Matricula] [char](7) NOT NULL,
	[Tipo] [tinyint] NOT NULL,
	[Capacidad] [tinyint] NOT NULL,
	[FechaEntraServicio] [date] NOT NULL,
 CONSTRAINT [PK_Metro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Matricula] UNIQUE NONCLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LM_Viajes]    Script Date: 01/03/2017 10:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LM_Viajes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPasajero] [int] NOT NULL,
	[IDEstacionEntrada] [smallint] NULL,
	[IDEstacionSalida] [smallint] NULL,
	[MomentoEntrada] [smalldatetime] NULL,
	[MomentoSalida] [smalldatetime] NULL,
 CONSTRAINT [PKViajes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[LM_Itinerarios]  WITH CHECK ADD  CONSTRAINT [FK_ItinerarioestacionFinal] FOREIGN KEY([estacionFin])
REFERENCES [dbo].[LM_Estaciones] ([ID])
GO
ALTER TABLE [dbo].[LM_Itinerarios] CHECK CONSTRAINT [FK_ItinerarioestacionFinal]
GO
ALTER TABLE [dbo].[LM_Itinerarios]  WITH CHECK ADD  CONSTRAINT [FK_ItinerarioestacionInicial] FOREIGN KEY([estacionIni])
REFERENCES [dbo].[LM_Estaciones] ([ID])
GO
ALTER TABLE [dbo].[LM_Itinerarios] CHECK CONSTRAINT [FK_ItinerarioestacionInicial]
GO
ALTER TABLE [dbo].[LM_Itinerarios]  WITH CHECK ADD  CONSTRAINT [FK_ItinerarioLinea] FOREIGN KEY([Linea])
REFERENCES [dbo].[LM_Lineas] ([ID])
GO
ALTER TABLE [dbo].[LM_Itinerarios] CHECK CONSTRAINT [FK_ItinerarioLinea]
GO
ALTER TABLE [dbo].[LM_Recorridos]  WITH CHECK ADD  CONSTRAINT [FK_Recorridoestacion] FOREIGN KEY([estacion])
REFERENCES [dbo].[LM_Estaciones] ([ID])
GO
ALTER TABLE [dbo].[LM_Recorridos] CHECK CONSTRAINT [FK_Recorridoestacion]
GO
ALTER TABLE [dbo].[LM_Recorridos]  WITH CHECK ADD  CONSTRAINT [FK_RecorridoLinea] FOREIGN KEY([Linea])
REFERENCES [dbo].[LM_Lineas] ([ID])
GO
ALTER TABLE [dbo].[LM_Recorridos] CHECK CONSTRAINT [FK_RecorridoLinea]
GO
ALTER TABLE [dbo].[LM_Recorridos]  WITH CHECK ADD  CONSTRAINT [FK_RecorridoMetro] FOREIGN KEY([Tren])
REFERENCES [dbo].[LM_Trenes] ([ID])
GO
ALTER TABLE [dbo].[LM_Recorridos] CHECK CONSTRAINT [FK_RecorridoMetro]
GO
ALTER TABLE [dbo].[LM_Viajes]  WITH CHECK ADD  CONSTRAINT [FKViajeEstacionEntrada] FOREIGN KEY([IDEstacionEntrada])
REFERENCES [dbo].[LM_Estaciones] ([ID])
GO
ALTER TABLE [dbo].[LM_Viajes] CHECK CONSTRAINT [FKViajeEstacionEntrada]
GO
ALTER TABLE [dbo].[LM_Viajes]  WITH CHECK ADD  CONSTRAINT [FKViajeEstacionSalida] FOREIGN KEY([IDEstacionSalida])
REFERENCES [dbo].[LM_Estaciones] ([ID])
GO
ALTER TABLE [dbo].[LM_Viajes] CHECK CONSTRAINT [FKViajeEstacionSalida]
GO
ALTER TABLE [dbo].[LM_Viajes]  WITH CHECK ADD  CONSTRAINT [FKViajePasajero] FOREIGN KEY([IDPasajero])
REFERENCES [dbo].[LM_Pasajeros] ([ID])
GO
ALTER TABLE [dbo].[LM_Viajes] CHECK CONSTRAINT [FKViajePasajero]
GO
ALTER TABLE [dbo].[LM_Viajes]  WITH CHECK ADD  CONSTRAINT [CKEntrarAntesDeSalir] CHECK  (([MomentoEntrada]<[MomentoSalida]))
GO
ALTER TABLE [dbo].[LM_Viajes] CHECK CONSTRAINT [CKEntrarAntesDeSalir]

