public class ClaseCerrojo {
	
	private String combinacion;
	
	/*-----------------------------------------------------------------------------*/
	
	//Constructor para el valor por defecto
	public ClaseCerrojo() {
		combinacion = "000";
	}
	
	//Constructor sobrecargado
	public ClaseCerrojo(String nCombinacion){
		combinacion = nCombinacion;
	}
	
	/*-----------------------------------------------------------------------------*/
	
	//GET
	public String getCombinacion(){
		return combinacion;
	}
	
	//SET
	public void setCombinacion(String nCombinacion){
		combinacion = nCombinacion;
	}
	
	/*-----------------------------------------------------------------------------*/
	
	//Funcionalidades
	
	public boolean compararCombinacion (String intentoCombinacion){
		
		boolean compararCombinacion = true;
		
		if(intentoCombinacion == combinacion){
			
			System.out.println("Ha acertado la contraseña");
			compararCombinacion = true;
		}
		
		return compararCombinacion;
	}

}

