alter authorization on database ::LeoMetroBeta to sa

--select * from LM_Estaciones--7--
--select * from LM_Itinerarios--Los que contenga cada Linea
--select * from LM_Lineas--4--
--select * from LM_Pasajeros--8--
--select * from LM_Recorridos--Ida--Vuelta x linea y 1 vuelta completa circular
--select * from LM_Trenes--4--Uno x linea
--select * from LM_Viajes--7--Uno x viajero

--Estaciones--**
insert into LM_Estaciones (ID,Denominacion,Direccion)
					values
						(1,'Central','Centro'),
						(2,'Norteña','Norte'),
						(3,'Sureña','Sur'),
						(4,'Westeros','Oeste'),
						(5,'Esteña','Este'),
						(6,'NorEsteña','NorEste'),
						(7,'Entre','CentroNorte')
GO

--Lineas--**
--select * from LM_Lineas
insert into LM_Lineas (ID,Denominacion,Color)
				values
					('L-1','Sureña-Norteña','rojo'),
					('L-2','Westeros-Esteña','azul'), 
					('L-3','Westeros-NorEsteña','verde'), 
					('L-C','Circular','Naranja') 
GO

--Itinerarios--
--select * from LM_Itinerarios
	--Linea 1
	insert into LM_Itinerarios (estacionIni,estacionFin,NumOrden,Linea,TiempoEstimado,Distancia)
							values
							(3,1,1,'L-1','00:05:00',2),
							(1,7,2,'L-1','00:04:00',3),
							(7,2,3,'L-1','00:04:00',3)
GO
	--Linea 2
	insert into LM_Itinerarios (estacionIni,estacionFin,NumOrden,Linea,TiempoEstimado,Distancia)
							values
							(4,1,4,'L-2','00:08:00',9),
							(1,5,5,'L-2','00:07:30',8)
GO
	--Linea 3
	insert into LM_Itinerarios (estacionIni,estacionFin,NumOrden,Linea,TiempoEstimado,Distancia)
							values(1,6,6,'L-3','00:04:00',3)

GO
	--Circular
	insert into LM_Itinerarios (estacionIni,estacionFin,NumOrden,Linea,TiempoEstimado,Distancia)
							values
							(2,6,7,'L-C','00:05:40',4),
							(6,5,8,'L-C','00:05:00',4),
							(5,3,9,'L-C','00:05:00',3),
							(3,4,10,'L-C','00:10:00',11),
							(4,2,11,'L-C','00:11:20',12)
GO

--Trenes--**
--select * from LM_Trenes
insert into LM_Trenes (ID,Matricula,Tipo,Capacidad,FechaEntraServicio)
				values
				(1,'A1',1,250,'2015-05-20'),
				(2,'A2',1,250,'2016-10-06'),
				(3,'B3',2,200,'2014-12-09'),
				(4,'C1',3,250,'2017-1-15')
GO

--Recorridos--**
	--L1
		--IDA
	insert into LM_Recorridos (Tren,Linea,estacion,Momento)
						values
						(1,'L-1',3,'2017-03-01 08:00:00'),
						(1,'L-1',1,'2017-03-01 08:05:01'),
						(1,'L-1',7,'2017-03-01 08:10:00'),
						(1,'L-1',2,'2017-03-01 08:14:35'),--Vuelta
						(1,'L-1',7,'2017-03-01 08:19:00'),
						(1,'L-1',1,'2017-03-01 08:23:10'),
						(1,'L-1',3,'2017-03-01 08:29:16')
GO
	--L2
		--IDA
	insert into LM_Recorridos (Tren,Linea,estacion,Momento)
						values
						(2,'L-2',4,'2017-03-01 08:00:00'),
						(2,'L-2',1,'2017-03-01 08:07:45'),
						(2,'L-2',5,'2017-03-01 08:15:20'),--Vuelta
						(2,'L-2',1,'2017-03-01 08:22:53'),
						(2,'L-2',4,'2017-03-01 08:30:05')

	--L3
		--IDA
	insert into LM_Recorridos (Tren,Linea,estacion,Momento)
					values
					(3,'L-3',1,'2017-03-01 08:00:00'),
					(3,'L-3',6,'2017-03-01 08:03:35'),
					(3,'L-3',1,'2017-03-01 08:07:19')
GO
	--LC
	insert into LM_Recorridos (Tren,Linea,estacion,Momento)
					values
					(4,'L-C',2,'2017-03-01 08:00:00'),--inicio
					(4,'L-C',6,'2017-03-01 08:05:02'),
					(4,'L-C',5,'2017-03-01 08:09:35'),
					(4,'L-C',3,'2017-03-01 08:14:00'),
					(4,'L-C',4,'2017-03-01 08:20:21'),
					(4,'L-C',2,'2017-03-01 08:26:49')--vuelta
GO


--Pasajeros--**
--select * from LM_Pasajeros
insert into LM_Pasajeros (ID,Nombre,Apellidos,Direccion,Ciudad,Telefono1)
				values
						(1,'Manuel','Perez','Bda.San Juan','Sevilla','645123785'),
						(2,'Pepe','Ramos','Av. Yeah','Madrid','689159741'),
						(3,'Sandra','Gutierrez','C/ Larga','Sevilla','654987321'),
						(4,'Luis','Ibarra','C/ Del Mar','Cadiz','564123954'),
						(5,'Ana','Garcia','Av. Ancha','Sevilla','645123785'),
						(6,'Clara','Muñoz','C/ Preciosa','Madrid','123489123'),
						(7,'David','Coronado','Bda. Los Naranjos','Sevilla','645123785'),
						(8,'Yeah','My God','El mundo','Vivo en todas partes','000000000')
GO

--Viajes--**
--select * from LM_Viajes
insert into LM_Viajes (IDPasajero,IDEstacionEntrada,IDEstacionSalida,MomentoEntrada,MomentoSalida)--id autoincrementable
		values
					(1,3,7,'2017-03-01 07:56:45','2017-03-01 08:10:00'),
					(2,3,2,'2017-03-01 07:56:45','2017-03-01 08:29:16'),
					(3,6,2,'2017-03-01 07:55:00','2017-03-01 08:10:20'),
					(4,5,4,'2017-03-01 08:14:00','2017-03-01 08:30:05'),
					(5,5,4,'2017-03-01 08:14:00','2017-03-01 08:29:50'),
					(6,6,3,'2017-03-01 08:14:00','2017-03-01 08:40:00'),
					(7,2,4,'2017-03-01 07:57:10','2017-03-01 08:21:18')



--CONSULTAS--

--1. Numero de itinerarios que tiene cada linea, indicando el nombre de las estaciones de origen y destino.
select I.linea,count(I.linea)as [Nº Itinerarios],E1.Denominacion as Estacion_Origen,E2.Denominacion as Estacion_Destino from LM_Itinerarios as I inner join
LM_Estaciones as E1 on I.estacionIni=E1.ID inner join
LM_Estaciones as E2 on I.estacionFin=E2.ID
group by I.Linea,E1.Denominacion,E2.Denominacion order by I.Linea

--2. Numero de viajes que a hecho cada pasajero +Nombre de pasajero incluyendo los que no han viajado nunca, indicando el nombre de la estacion en la que se subió y en la que se bajó.
create view ViajesPasajeros as
select V.IDPasajero,count(V.IDPasajero)as [Nº Viajes],E1.Denominacion as Entrada,E2.Denominacion as Salida from LM_Viajes as V inner join
LM_Estaciones as E1 on V.IDEstacionEntrada=E1.ID inner join
LM_Estaciones as E2 on V.IDEstacionSalida=E2.ID 
group by V.IDPasajero,E1.Denominacion,E2.Denominacion

select P.Nombre,P.Apellidos,VP.[Nº Viajes],VP.Entrada,VP.Salida from LM_Pasajeros as P left join
ViajesPasajeros as VP on VP.IDPasajero=P.ID

--3. Numero de trenes que pasan por cada estacion indicando el nombre de la estacion por la que pasan.


--4. Tiempo total que tarda en hacerse el recorrido completo de la Linea Circular.
select cast(datediff(MINUTE,min(momento),max(momento))as varchar)+' minutos' as Tiempo_Total from LM_Recorridos where Linea='L-C'


--6. Tiempo medio entre Itinerario e Itinerario de la Linea Circular.


