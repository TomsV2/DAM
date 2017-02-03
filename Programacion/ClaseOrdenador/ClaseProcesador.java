import java.util.*;

public class ClaseProcesador {
		
	//Atributos básicos
	private double velocidad;
	private String modelo = new String();
	
	//Constructor vacío
	public ClaseProcesador(){
		velocidad = 0;
		modelo = "Vacio";
	}
	
	//Constructor Sobrecargado
	public ClaseProcesador(double nVelocidad, String nModelo){
		velocidad = nVelocidad;
		modelo = nModelo;
	}
	
	//GETS
	public double getVelocidad(){
		return velocidad;
	}
	
	public String getModelo(){
		return modelo;
	}
	
	//SETS
	public void setVelocidad(double nVelocidad){
		velocidad = nVelocidad;
	}
	
	public void setModelo(String nModelo){
		modelo = nModelo;
	}
	
	//Métodos sobrescritos
	
	@Override
	public String toString(){
		String s = "La velocidad del procesador es: " +getVelocidad() + "\nEl modelo del procesador es: " +getModelo();
		return s;
	}
	
}

