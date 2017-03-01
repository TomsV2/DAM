import java.util.*;

public class ClaseDirector {
	
	ClasePelicula [] array5MejoresPeliculas = new ClasePelicula [5];
	
	//Atributos básicos
	private String nombreDirector = new String();
	
	
	//Constructor por defecto
	public ClaseDirector(){
		nombreDirector = "Nombre del director PorDefecto";
		ClasePelicula [] array5MejoresPeliculas = new ClasePelicula [5];

	}
	
	//Constructor con parámetros (sobrecargado)
	public ClaseDirector(String nNombreDirector, ClasePelicula nArray5MejoresPeliculas){
		
		nombreDirector = nNombreDirector;
		
		ClasePelicula [] array5MejoresPeliculas = new ClasePelicula [5];
		
		//~ for(int i=0; i<5; i++){
			//~ 
			//~ System.out.print("Introduzca el nombre de la pelicula numero " +(i+1) +" :");
			//~ String nombrePelicula = teclado.nextLine();
			//~ 
			//~ System.out.print("Introduzca el anio de estreno de la pelicula :");
			//~ int anioEstreno = teclado.nextInt();
			//~ 
			//~ array5MejoresPeliculas [i+1] = new ClasePelicula(nombrePelicula, anioEstreno);
		//~ }
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
		String s =  "Estas son las 5 mejores peliculas del director " +getNombreDirector() +" :"
				   +"\n";
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

