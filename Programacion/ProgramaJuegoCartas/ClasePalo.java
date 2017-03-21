

public class ClasePalo implements Cloneable, Comparable <ClasePalo>{
	
	/* Atributos básicos
	 * 
	 * 		+numero
	 * 			-Tipo: int
	 * 			-Consult: Sí	---> Get ---> int getNumero
	 * 			-Modif: Sí		---> Set ---> void setNumero(int nNumero);
	 * 
	 */
	 
	//Atributos básicos
	private int numero;
	
	//Constructor por defecto
	public ClasePalo(){
		numero = 0;
	}
	
	//Constructor sobrecargado
	public ClasePalo(int nNumero){
		numero = nNumero;
	}
	
	//Gets
	public int getNumero(){
		return numero;
	}
	
	//Sets
	public void setNumero(int nNumero){
		numero = nNumero;
	}
	
	//Métodos sobrescritos
	
	@Override //toString
	public String toString(){
		String s = ("Numero de la carta: " +getNumero());
		return s;
	}
	
	@Override //hashCode
	public int hashCode(){
		return ((int)(getNumero() * 7 * 684875));
	}
	
	@Override //clone
	public ClasePalo clone(){
		
		ClasePalo copia = null;
		
		try{
			copia = (ClasePalo) super.clone();
		}
		
		catch (CloneNotSupportedException error){
			System.out.println("Objeto no clonado");
		}
		return copia;
	}
	
	@Override //compareTo
	public int compareTo(ClasePalo p){
			int compara = 0;
			
			if(getNumero() > p.getNumero()){
				compara = 1;
			}
			else{
				if(getNumero() < p.getNumero()){
					compara = -1;
				}
			}
			return compara;
		}	
	
}

