import java.util.*;

public class ClaseMemoria implements Cloneable, Comparable <ClaseMemoria> {
		
		//Atributos básicos
		private double tamanio;
		private double velocidad;
		private String tipo = new String();
		
		//Constructor por defecto
		public ClaseMemoria(){
			tamanio = 0;
			velocidad = 0;
			tipo = "PorDefecto";
		}
		
		//Constructor sobrecargado
		public ClaseMemoria(double nTamanio, double nVelocidad, String nTipo){
			tamanio = nTamanio;
			velocidad = nVelocidad;
			tipo = nTipo;
		}
		
		//GETS 
		public double getTamanio(){
			return tamanio;
		}
		
		public String getTipo(){
			return tipo;
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
		
		public void setTipo(String nTipo){
			tipo = nTipo;
		}
		
		//Métodos sobrescritos
		
		@Override //toString
		public String toString(){
			String s = "Tamanio de la memoria: " +getTamanio() + "\nVelocidad de la memoria: " +getVelocidad() + "\nTipo de memoria: " +getTipo();
			return s;
		}
		
		@Override //hashCode
		public int hashCode(){
			return ((int) (getTamanio() * getVelocidad() * 918 * 7));
		}
		
		@Override //clone
		public ClaseMemoria clone(){
			
			ClaseMemoria copia = null;
			
			try{
				copia = (ClaseMemoria) super.clone();
			}
			
			catch (CloneNotSupportedException error){
				System.out.println("Objeto no clonado");
			}
			return copia;
		}
		
		@Override //compareTo
		public int compareTo(ClaseMemoria m){
			int compara = 0;
			
			if(getTamanio() > m.getTamanio()){
				compara = 1;
			}
			else{
				if(getTamanio() < m.getTamanio()){
					compara = -1;
				}
			}
			return compara;
		}
		
		@Override //equals
		public boolean equals(Object o){
			
			boolean igual = false;
			
			if(o != null && o instanceof ClaseMemoria){
				
				ClaseMemoria m = (ClaseMemoria) o;
				
				if(tamanio == m.tamanio && velocidad == m.velocidad && tipo == m.tipo){
					igual = true;
				}
			}
			return igual;
		}
		
}

