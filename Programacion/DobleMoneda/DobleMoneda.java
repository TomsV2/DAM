/* DobleMoneda
 * 
 * Análisis: Lanzar dos monedas al aire y llevar una cuenta de las caras y las cruces
 * 		-Entradas: Respueta para ejecutar el programa
 * 		-Salidas: Lado de cada moneda y contador
 * 
 * Pseudocódigo generalizado:
 *
 *		Inicio
 * 			Preguntar para ejecutar, leer y validar respuesta
 * 			Mientras respuesta sea s
 * 				Generar un número aleatorio
 * 				Según número aleatorio mostrar los lados de las monedas y el contador
 * 				Preguntar para ejecutar otra vez
 * 			Fin_Mientras
 * 		Fin
 * 				
 *
 *
 */

import java.util.*;

public class DobleMoneda {
	
	public static void main (String[] args) {
		
		char respuesta='0';
		int aleatorio=0;
		int contadorcara=0;
		int contadorcruz=0;
		
		Scanner chino = new Scanner (System.in);
		Random random = new Random ();
		
		//Inicio
		
			//Preguntar para ejecutar, leer y validar respuesta
			System.out.print("Desea ejecutar el programa? (s/n): ");
			respuesta = Character.toLowerCase(chino.next().charAt(0));
			
			while (respuesta !='s' && respuesta !='n'){
				System.out.print("Desea ejecutar el programa? (s/n): ");
				respuesta = Character.toLowerCase(chino.next().charAt(0));
			}
			
			//Mientras respuesta sea s
			while (respuesta=='s'){
				//Generar un número aleatorio
				aleatorio = random.nextInt(4);
				
				//Según número aleatorio mostrar los lados de las monedas y el contador
				switch (aleatorio){
					
					//Cara y cara
					case 0: System.out.println("CARA         CARA");
							contadorcara = contadorcara +2 ;
							System.out.println("Cara: " +contadorcara+ "     Cruz: " +contadorcruz);
					break;
					
					//Cruz y Cruz
					case 1: System.out.println("CRUZ         CRUZ");
							contadorcruz = contadorcruz +2 ;
							System.out.println("Cara: " +contadorcara+ "     Cruz: " +contadorcruz);
					break;
					
					//Cara y cruz
					case 2: System.out.println("CARA         CRUZ");
							contadorcara = contadorcara +1 ;
							contadorcruz = contadorcruz +1 ;
							System.out.println("Cara: " +contadorcara+ "     Cruz: " +contadorcruz);
					break;
					
					//Cruz y cara
					case 3: System.out.println("CRUZ         CARA");
							contadorcara = contadorcara +1 ;
							contadorcruz = contadorcruz +1 ;
							System.out.println("Cara: " +contadorcara+ "     Cruz: " +contadorcruz);
					break;
				}
				
				//Preguntar para ejecutar otra vez
				System.out.print("Otra tirada? (s/n): ");
				respuesta = Character.toLowerCase(chino.next().charAt(0));
			}
			//Fin_Mientras
		//Fin
	}
}

