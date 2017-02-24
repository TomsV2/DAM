public class ClasePelicula {
	
	//Atributos básicos
	private String nombrePelicula = new String();
	private int anioEstreno;
	
	//Constructor por defecto
	public ClasePelicula(){
		nombrePelicula = "Nombre de la pelicula PorDefecto";
		anioEstreno = 0000;
	}
	
	//Constructor con parámetros (sobrecargado)
	public ClasePelicula(String nNombrePelicula, int nAnioEstreno){
		nombrePelicula = nNombrePelicula;
		anioEstreno = nAnioEstreno;
	}
	
	//Gets
	public String getNombrePelicula(){
		return nombrePelicula;
	}
	
	public int getAnioEstreno(){
		return anioEstreno;
	}
	
	//Sets
	public void setNombrePelicula(String nNombrePelicula){
		nombrePelicula = nNombrePelicula;
	}
	
	public void setAnioEstreno(int nAnioEstreno){
		anioEstreno = nAnioEstreno;
	}
	
	//Métodos sobrescritos
	
	@Override //toString
	public String toString(){
		String s = "La pelicula " +getNombrePelicula() +" se estreno en el anio " +getAnioEstreno();
		return s;
	}
	
	@Override //hashCode
	public int hashCode(){
		return ((int)(getAnioEstreno() * 77) * (int)(getNombrePelicula().hashCode()));
	}
	
	@Override //Cloneable
	public ClasePelicula clone(){
		
		ClasePelicula copia = null;
		
		try{
			copia = (ClasePelicula) super.clone();
		}
		
		catch(CloneNotSupportedException error){
			System.out.println("Objeto no clonado");
		}
		return copia;
	}
	
	@Override //equals
	public boolean equals(Object o){
		
		boolean igual = false;
		
		if(o != null && o instanceof ClasePelicula){
			
			ClasePelicula p = (ClasePelicula) o;
			
			if(nombrePelicula == p.nombrePelicula && anioEstreno == p.anioEstreno){
				igual = true;
			}
		}
		return igual;
	}
		
	//Método para crear un array de peliculas (5 peliculas en concreto)
	
	ClasePelicula [] array5MejoresPeliculas = new ClasePelicula [5];	
		
	
}

