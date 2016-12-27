/*
 * Análisis: El programa simulará una carrera de tres caballos, el ganador será aleatorio
 *		-Entradas: Respuesta para ejecutar programa
 * 		-Salidas:  Caballo ganador
 * 
 * Pseudocódigo:
 * 
 * 		Inicio
 * 			Preguntar para ejecutar, leer y validar respuesta
 * 			Mientras respuesta sea s
 * 				Generar número aleatorio
 * 				Según número aleatorio y mostrar el caballo ganador
 * 				Preguntar para volver a ejecutar, leer y validar respuesta
 * 			Fin_Mientras
 * 		Fin
 *
 */

import java.util.*; 

public class CarreraCaballos {
	
	public static void main (String[] args) {
		
		char respuesta='0';
		int aleatorio=0;
		
		Scanner chino = new Scanner (System.in);
		Random random = new Random ();
		
		//Inicio
		
			//Preguntar para ejecutar, leer y validar respuesta
			System.out.println("Quieres ejecutar el programa? (s/n): ");
			respuesta = Character.toLowerCase(chino.next().charAt(0));
			while (respuesta !='s' && respuesta='n'){
				System.out.println("Quieres ejecutar el programa? (s/n): ");
				respuesta = Character.toLowerCase(chino.next().charAt(0));
			}
			
			//Mientras respuesta sea s
			while (respuesta=='s'){
				//Generar número aleatorio
				aleatorio = random.nextInt(3)+1;
				
				//Según número aleatorio y mostrar el caballo ganador
				switch (aleatorio){
					
					case 1: System.out.println("EL CASO 1 FUNCIONA :D");
					break;
					
					case 2: System.out.println("EL CASO 2 FUNCIONA :D");
					break;
					
					case 3: System.out.println("EL CASO 3 FUNCIONA :D");
					break;
				}
				//Preguntar para volver a ejecutar, leer y validar respuesta
			}
			//Fin_Mientras
 		//Fin
	}
}

