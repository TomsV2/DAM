create table t4(Yr INT,Mon VARCHAR(50),Dy VARCHAR(50),Dyno INT)
go
use RETO1
go
INSERT INTO t4(Yr, Mon, Dy, Dyno)

SELECT 2010,'Ene','Dom',2 UNION ALL
SELECT 2005,'Ene','Lun',3 UNION ALL
SELECT 1995,'Feb','Dom',1 UNION ALL
SELECT 2000,'Feb','Mie',4 UNION ALL
SELECT 1982,'Mar','Mar',2 UNION ALL
SELECT 2010,'Mar','Mar',8

go
create table t5 (dy tinyint)
insert into t5 (dy) values (1),(2),(3),(4),(5),(6),(7),(8),(9),
(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31)
					





SELECT Yr,Mon,t4.Dy,t4.Dyno,DateADD(day, T5.dy-1, CAST(cast(yr as varchar)+Mon AS DATE)) AS Date 
FROM t4 
cross join t5
where DatePart(WeekDay,DateADD(day,T5.dy-1,CAST(cast(yr as varchar)+ Mon AS DATE))) = Dyno -- Que el dia de la semana sea el apropiado



SELECT CAST(cast(2010 as varchar)+Mon AS DATE)