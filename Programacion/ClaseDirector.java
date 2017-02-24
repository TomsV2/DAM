public class ClaseDirector {
	
	//Atributos básicos
	private String nombreDirector = new String();
	
	
	//Constructor por defecto
	public ClaseDirector(){
		nombreDirector = "Nombre del director PorDefecto";
		array5MejoresPeliculas[0] = ClasePelicula();
		//array5MejoresPeliculas[2] = "Mejor pelicula 2";
		//array5MejoresPeliculas[3] = "Mejor pelicula 3";
		//array5MejoresPeliculas[4] = "Mejor pelicula 4";
		//array5MejoresPeliculas[5] = "Mejor pelicula 5";
	}
	
	//Constructor con parámetros (sobrecargado)
	public ClaseDirector(String nNombreDirector, String nPelicula){
		nombrePelicula = nNombrePelicula;
		
		for(int i=0; i<5; i++){
			array5MejoresPeliculas [i+1] = nPelicula;
		}
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

