public class ClasePelicula implements Cloneable, Comparable<ClasePelicula>{
	
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
		String s = "La pel\u00edcula " +'"' +getNombrePelicula() +'"' +" se estren\u00f3 en el a\u00f1o " +getAnioEstreno();
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
	
	@Override //compareTo
	public int compareTo(ClasePelicula p){
		int compara = 0;
		
		if(getAnioEstreno() > p.getAnioEstreno()){
			compara = 1;
		}
		else{
			if(getAnioEstreno() < p.getAnioEstreno()){
				compara = -1;
			}
		}
		return compara;
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
}

