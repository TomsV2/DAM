use LeoBikes
go

CREATE TABLE LB_Avisos
(
	ID Char(5) CONSTRAINT PK_Avisos PRIMARY KEY,
	Fecha date default current_timestamp,
	Stock_min TinyInt,
	Stock_actual SmallInt,
	CONSTRAINT FK_Productos_Avisos foreign key (ID) references LB_Productos(Codigo)
	--CONSTRAINT FK_Productos_StockActual FOREIGN KEY (Stock_actual) REFERENCES LB_Productos (Stock_Actual),
	--CONSTRAINT FK_Productos_StockMinimo FOREIGN KEY (Stock_min) REFERENCES LB_Productos (Stock_Minimo)
)

ALTER TABLE LB_Productos ADD CONSTRAINT DF_StockActual DEFAULT  0 FOR Stock_Actual
ALTER TABLE LB_Productos ADD CONSTRAINT DF_StockMinimo DEFAULT  0 FOR Stock_Minimo

ALTER TABLE LB_Clientes ADD CONSTRAINT DF_SaldoPuntosxDefecto DEFAULT 0 FOR SaldoPuntos
ALTER TABLE LB_Clientes WITH NOCHECK ADD CONSTRAINT CK_SaldoPuntosPositivo CHECK (SaldoPuntos >=0)

ALTER TABLE LB_Avisos ADD FechaCrea date 
ALTER TABLE LB_Avisos ADD FechaActual date null DEFAULT CURRENT_TIMESTAMP
ALTER TABLE LB_Avisos ADD CONSTRAINT DF_FechaActual DEFAULT CURRENT_TIMESTAMP FOR FechaCrea

ALTER TABLE LB_Avisos DROP FK_Productos_Avisos
ALTER TABLE LB_Avisos ADD CONSTRAINT FK_Productos_Avisos FOREIGN KEY (ID) REFERENCES LB_Productos (Codigo) 
ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE LB_Avisos ADD CONSTRAINT CK_FechaMayor CHECK (FechaActual>FechaCrea)

ALTER TABLE LB_Clientes ADD CONSTRAINT CK_Descuento50x100 CHECK (Descuento>=0 and Descuento <=50)
ALTER TABLE LB_Productos ADD Margen AS Stock_Actual-Stock_Minimo

