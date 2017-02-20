import java.util.*;

public class ClaseProcesador implements Cloneable, Comparable<ClaseProcesador> {
		
	//Atributos básicos
	private double velocidad;
	private String modelo = new String();
	
	//Constructor vacío
	public ClaseProcesador(){
		velocidad = 0;
		modelo = "PorDefecto";
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
	
	@Override //toString
	public String toString(){
		String s = "La velocidad del procesador es: " +getVelocidad() + "\nEl modelo del procesador es: " +getModelo();
		return s;
	}
	
	@Override //hashCode
	public int hashCode(){
		return ((int) (getVelocidad() * 7) + (int) getModelo().hashCode());
	}
	
	@Override //Cloneable
	public ClaseProcesador clone(){
		
		ClaseProcesador copia = null;
		
		try{
			copia = (ClaseProcesador) super.clone();
		}
		catch(CloneNotSupportedException error){
			System.out.println("Objeto no clonado");
		}
		
		return copia;
	}
	
	@Override //compareTo
	public int compareTo(ClaseProcesador p){
		
		int compara=0;
		
		if(getVelocidad() > p.getVelocidad()){
			compara = 1;
		}
		else{
			if(getVelocidad() < p.getVelocidad()){
				compara = -1;
			}
		}
		return compara;
	}
	
	@Override //equals
	public boolean equals(Object o){
		
		boolean igual = false;
		
		if(o != null && o instanceof ClaseProcesador){
			
			ClaseProcesador p = (ClaseProcesador) o;
			
			if(velocidad == p.velocidad && modelo == p.modelo){
				igual = true;
			}
		}
		return igual;
	}
	
}

