import java.util.*;

public class ClaseMemoria {
		
		//Atributos básicos
		private double tamanio;
		private double velocidad;
		private String tipo = new String();
		
		//Constructor vacío
		public ClaseMemoria(){
			tamanio = 0;
			velocidad = 0;
			tipo = "Vacio";
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
}

