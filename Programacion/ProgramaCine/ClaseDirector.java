import java.util.*;

public class ClaseDirector implements Cloneable{
	
	//Atributos básicos
	private String nombreDirector = new String();
	
	
	//Constructor por defecto
	public ClaseDirector(){
		nombreDirector = "Director Por Defecto";
	}
	
	//Constructor con parámetros (sobrecargado)
	public ClaseDirector(String nNombreDirector){
		
		nombreDirector = nNombreDirector;
		
		/*ClasePelicula [] array5MejoresPeliculas = new ClasePelicula [5];
		
		array5MejoresPeliculas [0] = null;
		array5MejoresPeliculas [1] = null;
		array5MejoresPeliculas [2] = null;
		array5MejoresPeliculas [3] = null;
		array5MejoresPeliculas [4] = null;*/
		
	}
	
	//Gets
	public String getNombreDirector(){
		return nombreDirector;
	}
	
	//Sets
	public void setNombreDirecto(String nNombreDirector){
		nombreDirector = nNombreDirector;
	}
	
	
	//Métodos sobrescritos
	
	@Override //toString
	public String toString(){
		String s = "Nombre del director: " +getNombreDirector();
		return s;
	}
	
	@Override //hashCode
	public int hashCode(){
		return ((int)(getNombreDirector().hashCode()) * 77 + 7 +56849651 * 2);
	}
	
	@Override //Cloneable
	public ClaseDirector clone(){
		
		ClaseDirector copia = null;
		
		try{
			copia = (ClaseDirector) super.clone();
		}
		
		catch(CloneNotSupportedException error){
			System.out.println("Objeto no clonado");
		}
		return copia;
	}
	
	@Override //equals
	public boolean equals(Object o){
		
		boolean igual = false;
		
		if(o != null && o instanceof ClaseDirector){
			
			ClaseDirector p = (ClaseDirector) o;
			
			if(nombreDirector == p.nombreDirector){
				igual = true;
			}
		}
		return igual;
	}
	
}

