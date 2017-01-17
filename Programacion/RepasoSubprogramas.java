/*
 * 	Inicio
 * 		Hacer
 * 			Hacer
 * 			MostrarMenu *
 * 			LeerValidarOpcion
 * 			Mientras opcion no esté entre 1 y 12
 * 			Según opcion
 * 				caso 1:
 * 				break;
 * 			Fin_Según
 * 			PreguntaRepetir
 * 		Mientras repetir == 's'
 * 	Fin
 * 
 * 				
 * 			
 * 
 * 
 * 
 */

import java.util.*;

public class RepasoSubprogramas {
	
	public static void main (String args[]) {
		
		int opcion = 0;
		char repetir = 's';
		
		Scanner teclado = new Scanner (System.in);
		
		
		//Inicio
		
			//Hacer
			do{
				//Hacer
				do{
					//MostrarMenu *
					MetodosRepasoSubprogramas.menu();
					
					//Leer opcion
					System.out.print("Su opcion es: ");
					opcion = teclado.nextInt();
					
				//Mientras opcion no esté entre 1 y 12
				}while (opcion<1 || opcion>12);
			
				//Según opcion
				switch (opcion){
					
					case 1:
						System.out.println("Ejercicio 1");
					break;
					
					case 2:
						System.out.println("Ejercicio 2");
					break;
					
					case 3:
						System.out.println("Ejercicio 3");
					break;
					
					case 4:
						System.out.println("Ejercicio 4");
					break;
					
					case 5:
						System.out.println("Ejercicio 5");
					break;
					
					case 6:
						System.out.println("Ejercicio 6");
					break;
					
					case 7:
						System.out.println("Ejercicio 7");
					break;
					
					case 8:
						System.out.println("Ejercicio 8");
					break;
					
					case 9:
						System.out.println("Ejercicio 9");
					break;
					
					case 10:
						System.out.println("Ejercicio 10");
					break;
					
					case 11:
						System.out.println("Ejercicio 11");
					break;
					
					case 12:
						System.out.println("Ejercicio 12");
					break;
				//Fin_Según
				}
				
				//PreguntaRepetir
				System.out.println("Quiere repetir el programa?");
				repetir = Character.toLowerCase(teclado.next().charAt(0));
				
			//Mientras repetir == 's'
			}while (repetir == 's');
		//Fin
		
	}
}

