import java.util.*;

public class ClasePersona {
	
	//Atributos
	private String nombre = new String();
	private int edad;
	private String DNI = new String();
	private char sexo;
	private double peso;
	private double altura;
	
	
	//Constructor por defecto
	public ClasePersona (){
		nombre = "Sr Mieo";
		edad = 0;
		DNI = "00000000[A-Z]";
		sexo = 'X';
		peso = 0;
		altura = 0;
	}
	
	//Constructor para todos los atributos
	public ClasePersona (String nNombre, int nEdad, String nDNI, char nSexo, double nPeso, double nAltura){
		nombre = nNombre;
		edad = nEdad;
		DNI = nDNI;
		sexo = nSexo;
		peso = nPeso;
		altura = nAltura;
	}
	
	//GETS
	public String getNombre(){
		return nombre;
	}
	
	public int getEdad(){
		return edad;
	}
	
	public String getDNI(){
		return DNI;
	}
	
	public char getSexo(){
		return sexo;
	}
	
	public double getPeso(){
		return peso;
	}
	
	public double getAltura(){
		return altura;
	}
	
	
	//SETS
	public void setNombre (String nNombre){
		nombre = nNombre;
	}
	
	public void setEdad (int nEdad){
		edad = nEdad;
	}
	
	public void setDNI (String nDNI){
		DNI = nDNI;
	}
	
	public void setSexo (char nSexo){
		sexo = nSexo;
	}
	
	public void setPeso (double nPeso){
		peso = nPeso;
	}
	
	public void setAltura (double nAltura){
		altura = nAltura;
	}
	
	//Métodos
	public double valorIMC(){
		
		double valorIMC = peso / (altura*altura);
		
		return valorIMC;
		//return peso / (altura*altura);
	}
	
	public int tipoIMC(){
		
		int tipoIMC = 0;
		double imc = peso / (altura*altura);
		
		if (imc < 18.50){
			
			tipoIMC = -1;
			
			if (imc >= 25.00){
				
				tipoIMC = 1;
				
				if (imc>18.50 && imc<24.99){
					
					tipoIMC = 0;
				}
			}
		}
		
		return tipoIMC;
	}
	
	//Métodos sobrescritos
	
	@Override //toString para datos
	public String toString(){
		String s = "Nombre: " +getNombre() + "\nEdad: " +getEdad() + "\nDNI: " +getDNI() + "\nSexo: " +getSexo() + "\nPeso: " +getPeso() + "\nAltura: " +getAltura() + "\nValor del  IMC: " +valorIMC() + " y el tipo: " +tipoIMC();
		return s;
	}
}

