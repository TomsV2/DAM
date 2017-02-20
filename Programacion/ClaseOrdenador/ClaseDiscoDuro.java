import java.util.*;

public class ClaseDiscoDuro implements Cloneable, Comparable <ClaseDiscoDuro> {
		
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
	
	@Override //hashCode
	public int hashCode(){
		return ( (int) ( (getVelocidad() * getTamanio() * 7) * 43) );
	}
	
	@Override //Clone
	public ClaseDiscoDuro clone(){
		
		ClaseDiscoDuro copia = null;
		
		try{
			copia = (ClaseDiscoDuro) super.clone();
		}
		catch(CloneNotSupportedException error){
			System.out.println("Objeto no clonado");
		}
		return copia;
	}
	
	@Override //compareTo
	public int compareTo(ClaseDiscoDuro dd){
		
		int compara = 0;
		
		if(getTamanio() > dd.getTamanio()){
			compara = 1;
		}
		else{
			if(getTamanio() < dd.getTamanio()){
				compara = -1;
			}
		}
		return compara;
	}
	
	@Override //equals
	public boolean equals(Object o){
		
		boolean igual = false;
		
		if(o != null && o instanceof ClaseDiscoDuro){
			
			ClaseDiscoDuro dd = (ClaseDiscoDuro) o;
			
			if(tamanio == dd.tamanio && velocidad == dd.velocidad){
				igual = true;
			}
		}
		return igual;
	}
}

