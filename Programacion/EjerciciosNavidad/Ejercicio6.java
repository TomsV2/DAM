/*
 * PG:
 * 		Inicio
 * 			Hacer
 * 				leerValidarOpcion
 * 				MostrarRimas
 * 				Preguntar para repetir
 * 			Mientras repetir == 's'
 * 		Fin
 * 
 * 
 * 
 * 
 * 
 */

import java.util.*;

public class Ejercicio6 {
	
	public static void main (String args[]) {
		
		int opcion = 0;
		char respuesta = ' ';
		boolean entre0y9 = false;
		
		Scanner teclado = new Scanner (System.in);
		
		//Inicio
			//Hacer
			do{
				
				//leerValidarOpcion
				do{
					
					System.out.print("Introduzca un numero del 0 al 9: ");
					opcion = teclado.nextInt();
					
				}
				while (MetodosEjercicio6.validarOpcion(opcion) == false);
				
				//MostrarRima
				MetodosEjercicio6.rimas(opcion);
				
				//LeerValidarRespuesta
				do{
					System.out.print("Quiere probar con otro numero? (s/n): ");
					respuesta = Character.toLowerCase(teclado.next().charAt(0));
				}
				while(MetodosEjercicio6.validarRespuesta(respuesta));
				
				
			}
			//Mientras
			while (respuesta == 's');
			System.out.println("Hasta luego :D");
			
		//Fin
		
	}
}

