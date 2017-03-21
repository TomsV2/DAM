/**
Datos(IDTren,matricula,anigüedad(meses),) de los trenes que hayan pasado por la estacion E por el dia D
los parametros son la estacion y el dia 
*/
select * from LM_Recorridos
select * from LM_Estaciones

set dateformat ymd

go
create function DatosTrenes(@estacion varchar(30), @dia date )
returns table as
return
	(
		select distinct tr.ID,tr.Matricula,datediff(month,tr.FechaEntraServicio,getdate()) as Antiguedad 
			from LM_Trenes as tr
		    inner join LM_Recorridos as re
			on tr.ID=re.Tren
			inner join LM_Estaciones as es
			on re.estacion=es.ID
			where es.Denominacion=@estacion  and cast((re.Momento) as date )=@dia
   )
 go



 select * from DatosTrenes('Calle Torneo',DATEFROMPARTS(2017,02,26))

 select * from DatosTrenes(5,'2017-02-27')
