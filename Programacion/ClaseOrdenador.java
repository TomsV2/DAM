import java.util.*;

public class ClaseOrdenador {
	
	
	
	//Atributos básicos
	private double tamanioMemoria;
	private String tipoMemoria = new String();
	private double velocidadMemoria;
	
	private double tamanioDiscoDuro;
	private double velocidadDiscoDuro;
	
	private String modeloProcesador = new String();
	private double velocidadProcesador;

	//Atributos derivados
	private double precioBase;
	private double IVA;
	private double precioMercado;
	
	//Constructor por defecto
	public ClaseOrdenador(){
		tamanioMemoria = 0;
		tipoMemoria = "Vacio";
		velocidadMemoria = 0;
		tamanioDiscoDuro = 0;
		velocidadDiscoDuro = 0;
		modeloProcesador = "Vacio";
		velocidadProcesador = 0;
	}
	
	//GETS
	public double getTamanioMemoria(){
			return tamanioMemoria;
	}
}

