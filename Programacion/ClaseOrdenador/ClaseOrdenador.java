import java.util.*;

public class ClaseOrdenador {
	
	
	//Atributos básicos
	private double precioBase;
	
	//Atributos Agregados
	private ClaseMemoria Memoria;
	private ClaseDiscoDuro DiscoDuro;
	private ClaseProcesador Procesador;

	//Atributos derivados
	private double IVA;
	private double precioMercado;
	
	//Constructor por defecto
	public ClaseOrdenador(){
		Memoria = new ClaseMemoria();
		DiscoDuro = new ClaseDiscoDuro();
		Procesador = new ClaseProcesador();
	}
	
	//GETS
	public double getPrecioBase(){
		return precioBase;
	}
	
	public double getIVA(){
		
		IVA = precioBase * 0.21;
		
		return IVA;
	}
	
	/*public double getPrecioMercado(){
		
	}*/
	
	//SETS
	public void setPrecioBase(double nPrecioBase){
		precioBase = nPrecioBase;
	}
}

