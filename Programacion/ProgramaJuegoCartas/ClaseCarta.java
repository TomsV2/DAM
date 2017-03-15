

public class ClaseCarta implements Comparable <ClaseCarta>{
	
	/* Atributos básicos
	 * 
	 * 		+palo
	 * 			-Tipo: char
	 * 			-Consult: Sí	---> Get ---> char getPalo();
	 * 			-Modif: Sí		---> Set ---> void setPalo(char nPalo);
	 * 
	 * 		+numero
	 * 			-Tipo: int
	 * 			-Consult: Sí	---> Get ---> int getNumero
	 * 			-Modif: Sí		---> Set ---> void setNumero(int nNumero);
	 * 
	 */
	 
	//Atributos básicos
	private char palo;
	private int numero;
	
	//Constructor por defecto
	public ClaseCarta(){
		palo = 'x';
		numero = 0;
	}
	
	//Constructor sobrecargado
	public ClaseCarta(char nPalo, int nNumero){
		palo = nPalo;
		numero = nNumero;
	}
	
	//Gets
	public char getPalo(){
		return palo;
	}
	
	public int getNumero(){
		return numero;
	}
	
	//Sets
	public void setPalo(char nPalo){
		palo = nPalo;
	}
	
	public void setNumero(int nNumero){
		numero = nNumero;
	}
	
	//Métodos sobrescritos
	
	@Override //toString
	public String toString(){
		String s = (+getNumero() +" de " +getPalo());
		return s;
	}
	
	@Override //hashCode
	public int hashCode(){
		return ((int)(getNumero() * 7 * 684875));
	}
	
	@Override //clone
	public ClaseCarta clone(){
		
		ClaseCarta copia = null;
		
		try{
			copia = (ClaseCarta) super.clone();
		}
		
		catch (CloneNotSupportedException error){
			System.out.println("Objeto no clonado");
		}
		return copia;
	}
	
	@Override //compareTo
	public int compareTo(ClaseCarta c){
			int compara = 0;
			
			if(getNumero() > c.getNumero()){
				compara = 1;
			}
			else{
				if(getNumero() < c.getNumero()){
					compara = -1;
				}
			}
			return compara;
		}
	
}

