USE [LeoMetroBeta]
GO

---insert TRENES
BEGIN TRANSACTION
GO
INSERT INTO LM_Trenes(ID,Matricula,Tipo,Capacidad,FechaEntraServicio)
			   VALUES(001,'TER101',1,100,'12/02/2010')
					,(002,'TER102',1,100,'10/04/2010')
					,(003,'TER103',2,90,'20/02/2012')
					,(004,'TER104',1,100,'16/09/2013')
					,(005,'TER105',2,100,'19/02/2013')
					,(006,'TER106',1,60,'10/04/2010')
					,(007,'TER107',3,100,'23/02/2012')
					,(008,'TER108',1,70,'11/07/2012')
					,(009,'TER109',3,100,'14/03/2013')

ROLLBACK
COMMIT TRANSACTION


SELECT * FROM LM_Trenes

---INSERT LINEA 
begin transaction 
go
INSERT INTO LM_Lineas(ID,Denominacion,Color)
			   values('L001','Pinar Chamartin - Valdecarros','azul')
					,('L002','Las Rosas - Cuatro Caminos','roja')
					,('L003','Villaverde Alto - Moncloa','amarillo')
					,('L004','Argüelles - Pinar Chamartin','marron')
					,('L005','Alameda de Osuna - Casa Campo','verde')
					
rollback
commit transaction

select * from LM_Lineas

--INSERT LM_Estaciones
BEGIN TRANSACTION 
GO
 INSERT INTO LM_Estaciones(ID,Denominacion,Direccion)
					values(1011,'Pinar Chamartin','Calle Los Pinos N.20')
						 ,(1012,'Quintana','Avenida Q N.1')
						 ,(1013,'Gran Via','Avenida GB N.15')
						 ,(1014,'Chueca','Avenida CH N.17')
						 ,(1015,'Acacias','Avenida AC N.11')
				         ,(1016,'Valdecarros','Avenida car N.31')

						 ,(1021,'Las Rosas','Calle Flores N.99')
						 ,(1022,'Estrecho','Avenida ES N.41')
						 ,(1023,'Alsacia','Avenida VL N.74')
						 ,(1024,'Goya','Avenida TR N.51')
						 ,(1025,'Retiro','Avenida RT N.51')
						 ,(1026,'Cuatro Caminos','Calle El Serro N.36')

						 ,(1031,'Villaverde Alto','Ave. LosPijos N.02')
						 ,(1032,'Almendrales','Calle ALM N.78')
						 ,(1033,'Delicias','Calle DL N.79')
						 ,(1034,'Argüelles','Calle Flores N.32')
						 ,(1035,'Cuatro Caminos','Calle El Serro N.36')
						 ,(1036,'Moncloa','Calle MasRata N.10')

						 ,(1041,'Argüelles','Calle Esparrago N.07')
						 ,(1042,'Lista','Calle UJM N.10')
						 ,(1043,'Canillas','Calle DF N.88')
						 ,(1044,'Esperanza','Calle EZX N.02')
						 ,(1045,'Manoteras','Calle MAN N.3')

						 ,(1051,'Alameda de Osuna','Calle N.15')
						 ,(1052,'Canillejas','Calle N.5')
						 ,(1053,'Ventas','Calle N.102')
						 ,(1054,'Chueca','Calle N.96')
						 ,(1055,'Callao','Calle N.452')
						 ,(1056,'Casa Campo','Calle MedioBosque N.06')
						 
ROLLBACK
COMMIT TRANSACTION

-- DELETE  LM_Estaciones

SELECT * FROM LM_Estaciones

---INSERT RECORRIDOS 
begin transaction
go
INSERT INTO LM_Recorridos(Tren,Linea,estacion,Momento)
				   values(001,'L001',1011,'01-03-2017 9:00:00') -- Pinar Chamartin
					    ,(001,'L001',1012,'01-03-2017 9:05:00') -- Quintana
						,(001,'L001',1023,'01-03-2017 9:10:00') -- Alsacia 
						,(001,'L001',1013,'01-03-2017 9:15:00') -- gran via
						,(001,'L001',1014,'01-03-2017 9:20:00') -- Chueca
						,(001,'L001',1033,'01-03-2017 9:25:00') --
						,(001,'L001',1015,'01-03-2017 9:30:00') --
						,(001,'L001',1045 ,'01-03-2017 9:35:00') -- Manoteras
						,(001,'L001',1016,'01-03-2017 9:40:00') --
						

						,(002,'L002',1021,'01-03-2017 9:32:00')
						,(002,'L002',1022,'01-03-2017 9:46:00') 
						,(002,'L002',1023,'01-03-2017 9:50:00') -- Alsacia
						,(002,'L002',1024,'01-03-2017 10:01:00')
						,(002,'L002',1045,'01-03-2017 10:12:00') -- Manoteras
						,(002,'L002',1025,'01-03-2017 10:19:00')
						,(002,'L002',1013,'01-03-2017 10:24:00') -- gran via
						,(002,'L002',1026,'01-03-2017 10:30:00')

						,(003,'L003',1031,'01-03-2017 9:26:00')
						,(003,'L003',1023,'01-03-2017 9:39:00') -- Alsacia
						,(003,'L003',1032,'01-03-2017 9:48:00')
						,(003,'L003',1033,'01-03-2017 9:59:00')
						,(003,'L003',1013,'01-03-2017 10:07:00') -- gran via
						,(003,'L003',1034,'01-03-2017 10:16:00')
						,(003,'L003',1045,'01-03-2017 10:24:00') -- Manoteras
						,(003,'L003',1035,'01-03-2017 10:37:00')
						,(003,'L003',1036,'01-03-2017 10:58:00') --Moncloa

						,(004,'L004',1041,'01-03-2017 11:00:00')
						,(004,'L004',1042,'01-03-2017 11:05:00')
						,(004,'L004',1043,'01-03-2017 11:10:00')--Canillas
						,(004,'L004',1044,'01-03-2017 11:15:00')
						,(004,'L004',1023,'01-03-2017 11:20:00') -- Alsacia
						,(004,'L004',1045,'01-03-2017 11:25:00') -- Manoteras
						,(004,'L004',1013,'01-03-2017 11:35:00') -- gran via

						,(005,'L005',1051,'01-03-2017 10:02:00')
						,(005,'L005',1052,'01-03-2017 10:12:00')
						,(005,'L005',1036,'01-03-2017 10:22:00') --Moncloa
						,(005,'L005',1053,'01-03-2017 10:32:00')
						,(005,'L005',1054,'01-03-2017 10:42:00')
						,(005,'L005',1045,'01-03-2017 10:52:00') -- Manoteras
						,(005,'L005',1043,'01-03-2017 11:02:00')-- Canillas
						,(005,'L005',1013,'01-03-2017 11:12:00')
						,(005,'L005',1023,'01-03-2017 11:22:00') -- Alsacia
						,(005,'L005',1055,'01-03-2017 11:32:00')


rollback
commit transaction

SELECT * FROM LM_Recorridos

--INSERT DE LOS ITINERARIOS
begin transaction
go
insert LM_Itinerarios(estacionIni,estacionFin,NumOrden,Linea,TiempoEstimado,Distancia)
			   values(1011,1012,01,'L001','00:15:00',6)
					,(1012,1023,02,'L001','00:15:00',6)
					,(1023,1013,03,'L001','00:15:00',6)
					,(1013,1014,04,'L001','00:15:00',6)
					,(1014,1033,05,'L001','00:15:00',6)
					,(1033,1015,06,'L001','00:15:00',6)
					,(1015,1045,07,'L001','00:15:00',6)
					,(1045,1016,08,'L001','00:15:00',6)

					,(1021,1022,09,'L002','00:15:00',6)
					,(1022,1023,10,'L002','00:15:00',6)
					,(1023,1024,11,'L002','00:15:00',6)
					,(1024,1045,12,'L002','00:15:00',6)
					,(1045,1025,13,'L002','00:15:00',6)
					,(1025,1013,14,'L002','00:15:00',6)
					,(1013,1026,15,'L002','00:15:00',6)

					,(1031,1023,16,'L003','00:15:00',6)
					,(1023,1032,17,'L003','00:15:00',6)
					,(1032,1033,18,'L003','00:15:00',6)
					,(1033,1013,19,'L003','00:15:00',6)
					,(1013,1034,20,'L003','00:15:00',6)
					,(1034,1045,21,'L003','00:15:00',6)
					,(1045,1035,22,'L003','00:15:00',6)
					,(1035,1036,23,'L003','00:15:00',6)

					,(1041,1042,24,'L004','00:15:00',6)
					,(1042,1043,25,'L004','00:15:00',6)
					,(1043,1044,26,'L004','00:15:00',6)
					,(1044,1023,27,'L004','00:15:00',6)
					,(1023,1045,28,'L004','00:15:00',6)
					,(1045,1013,29,'L004','00:15:00',6)
					

 rollback
 commit transaction

 select * from LM_Itinerarios

 
 --INSERT DE LOS PASAJEROS
 BEGIN TRANSACTION
 GO
 INSERT INTO LM_Pasajeros(ID,Nombre,Apellidos,Direccion,Ciudad,Telefono1,Telefono2)
				   values(1,'Carmina','DeLAo','El juncal HUerta Seca4','Madrid',985478962,null)
						,(2,'Berta','Caroteno','Calle 45','Madrid',96251478,null)
						,(3,'Ernest','Elmarino','Calle Seca 84','Madrid',983273252,null)
						,(4,'Perucho','Maltrecho','Ave 9','Madrid',933214578,null)
						,(5,'Carlota','DelaOz','CAlle arroyo 9','Madrid',963256321,null)
						,(6,'Amparo','Diogenes','El juncal 8','Madrid',988745210,null)
						
 ROLLBACK
 COMMIT TRANSACTION


 --INSERT DE LOS VIAJES
 BEGIN TRANSACTION
 GO
 INSERT INTO LM_Viajes(IDPasajero,IDEstacionEntrada,IDEstacionSalida,MomentoEntrada,MomentoSalida)
				values(1,1011,1033,'01-03-2017 9:00:00','01-03-2017 9:25:00')
				     ,(1,1021,1045,'01-03-2017 9:32:00','01-03-2017 10:12:00')
					 ,(2,1031,1033,'01-03-2017 9:26:00','01-03-2017 9:59:00')
					 ,(3,1041,1044,'01-03-2017 11:00:00','01-03-2017 11:15:00')
					 ,(2,1043,1045,'01-03-2017 11:10:00','01-03-2017 11:25:00')
					 ,(4,1051,1043,'01-03-2017 10:02:00','01-03-2017 10:52:00')
 ROLLBACK
 COMMIT TRANSACTION

/*
todos los trenes que hayan pasado por la estacion 'Gran Via'
hay cuatro trenes que han pasado por gran via
*/

/**
Todos los trenes que tienen en su recorrido Gran Via y Alsacia
hay cuatro trenes ue pasan por las dos 
*/

/*
Los trenes que nunca han pasado por  Manoteras
todos pasan por Manoteras
*/


/*
pasajeros que han salido de la estacion 'Las Rosas' y hayan salido por la estacion 
*/



/*
los trenes que  hayan pasado por una estacion y que no hayan pasado por otra
*/