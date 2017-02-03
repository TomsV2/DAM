import java.util.*;

public class ClaseDiscoDuro {
		
	//Atributos básicos
	private double tamanio;
	private double velocidad;
	
	//Constructor vacío
	public ClaseDiscoDuro(){
		tamanio = 0;
		velocidad = 0;
	}

	//Constructor sobrecargado
	public ClaseDiscoDuro(double nTamanio, double nVelocidad){
		tamanio = nTamanio;
		velocidad = nVelocidad;
	}
	
	//GETS
	public double getTamanio(){
		return tamanio;
	}
	
	public double getVelocidad(){
		return velocidad;
	}
	
	//SETS 
	public void setTamanio(double nTamanio){
		tamanio = nTamanio;
	}
	
	public void setVelocidad(double nVelocidad){
		velocidad = nVelocidad;
	}
	
	//Método sobrescrito
	
	@Override
	public String toString(){
		String s = "El tamanio del disco duro es: " +getTamanio() + "\nLa velocidad del disco duro es: " +getVelocidad();
		return s;
	}
}

