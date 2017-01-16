public class MetodosEjercicio6 {
	
	
/***************************
 * 
 * 
 * Cabecera: public static void rimas (int opcion);
 * 
 * Comentario: Mostrar por pantalla una rima graciosa rimando con el número   ***Ser más específico***
 * 
 * Precondiciones: un número del 0 al 9
 * 
 * Entradas: Número
 * 
 * Salidas: Nada
 * 
 * Postcondiciones: El programa imprimirá una rima con el número
 * 
 * 
 ***************************/
	
	public static void rimas (int opcion){
		
		//Según opcion
		switch (opcion){
			
			case 0:
				System.out.println("Cero, yo solo me pelo");
			break;

			case 1:
				System.out.println("Uno, eres de lo mas inoportuno");
			break;
			
			case 2:
				System.out.println("Dos, mi gato es un dormilon");
			break;
			
			case 3:
				System.out.println("Tres, soplare y soplare y tu casa derribare");
			break;
			
			case 4:
				System.out.println("4");
			break;
			
			case 5:
				System.out.println("5");
			break;
			
			case 6:
				System.out.println("6");
			break;
			
			case 7:
				System.out.println("7");
			break;
			
			case 8:
				System.out.println("8");
			break;
			
			case 9:
				System.out.println("9");
			break;
			
		//Fin_Según
		}
	}
	
	
	/************************
	 * 
	 * Comentario: Si el número está entre 0 y 9 (incluidos) devolverá True, sino devolverá False
	 * 
	 * Precon: un número del 0 al 9 (incluidos)
	 * 
	 * Entradas: un número
	 * 
	 * Salidas: un número
	 * 
	 * Postcon: devolverá un boolean
	 * 
	 * 
	 ***********************/
	
	
	
	public static boolean validarOpcion (int opcion){
		
		boolean entre0y9 = true;
	
		if (opcion<0 || opcion>9){
			
			entre0y9 = false;
			
		}
		
		return entre0y9;
	
	}
	
	public static boolean validarRespuesta (char respuesta){
		
		boolean respuestaS = true;
	
		if (respuesta == 'n'){
			
			respuestaS = false;
			
		}
		
		return respuestaS;
	
	}
		
}

