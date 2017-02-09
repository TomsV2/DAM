/*
 * 	Inicio
 * 		LeerNombre
 * 		MostrarMenu1*
 * 		LeerValidarOpcionMenu1*
 * 		Según opcionMenu1
 * 			caso 1: arena*
 * 			caso 2: entrenamiento*
 * 		Fin_Según
 * 	Fin
 * 
 * 
 */

import java.util.*;

public class alfa {
	
	public static void main (String args[]) {
		
	ClasePersonaje pj1 = new ClasePersonaje();
	
	Scanner teclado = new Scanner(System.in);
	String s = new String();
	
	
	//Inicio
		//LeerNombre
		System.out.print("Mi nombre es: ");
		s = teclado.nextLine();
		pj1.setNombre(s);
		
		System.out.println("Te llamas " +pj1.getNombre() + "?");
		System.out.println("Bonito nombre...");
		
		//MostrarMenu1*
		//LeerValidarOpcionMenu1*
		//Según opcionMenu1
			//caso 1: arena*
			//caso 2: entrenamiento*
		//Fin_Según
	//Fin
		
	}
}

