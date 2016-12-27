/** Nombre del programa: InvAbs
*Analicis: Calcular el inverso y el valor absoluto del dato introducido
*Suposicion: El cero no tiene signo por lo cual tendra un mensaje de error al introducirlo
*Entrada: Numero para calcular el inverso y el valor absoluto
*Salida: El inverso y el valor absoluto del numero
* 
*Pseudocodigo generalizado:
*	Inicio
* 		Preguntar para continuar, leer respuesta y mostrar error
* 		Mientras continuar sea sí
* 			Leer y validar número
* 			Calcular Inv, Abs y mostrar resultados
* 			Preguntar para repetir programa
* 		Fin Mientras
*	Fin
* 
* Leer y validar numero
* 		Pedir y leer el número
* 		Mientras numero sea 0
* 			Pedir y leer el número
* 		Fin Mientras
* FinLV
**/

//Importo las librerías que voy a utilizar
import java.util.Scanner;
import java.lang.Math;

public class InvAbs2 {
	
	public static void main (String args[]){

	Scanner teclado=new Scanner (System.in);
		
	//Declaro variables
	double numero=0;
	double inv=0;
	double abs=0;
	char respuesta=0;
	
	System.out.println("CALCULAR INVERSO Y ABSOLUTO");//Nombre del programa
	
	//Preguntar para continuar
	System.out.print("Desea ejecutar el programa? (s/n): ");
	respuesta=Character.toLowerCase(teclado.next().charAt(0));
	//Fin Preguntar para continuar
	
	//Mientras la respuesta sea s
	while (respuesta=='s'){
		//Leer y validar número
			//Pedir y leer el número
			System.out.print("Introduzca un numero: ");
			numero=teclado.nextDouble();
			//Fin Pedir y leer el número
			
			//Mientras el número sea 0
			while (numero==0){
				//Pedir y leer el número
				System.out.println("-----------------------------------------------------------------------");
				System.out.println(" ");
				System.out.println("El cero no es un valor correcto, por favor, introduzca otro valor.");
				System.out.println(" ");
				System.out.println("-----------------------------------------------------------------------");
				System.out.print("Introduzca otro numero: ");
				numero=teclado.nextDouble();
				//Fin Pedir y leer el número
			}
			//Fin Mientras
		//Fin Leer y Validar
		
		//Calcular el Abs, Inv y mostrar los resultados
		if (numero!=0){
			abs=Math.abs(numero);
			inv=(1/numero);
			System.out.println("--------------------------------------");
			System.out.println(" ");
			System.out.println("El absoluto es: "+abs);
			System.out.println("El inverso  es: "+inv);
			System.out.println(" ");
			System.out.println("--------------------------------------");
		}
		//Fin calcular Abs, Inv y mostrar los resultados
		
		//Preguntar si volver a repetir el programa
		System.out.print("Quiere repetir? (s/n): ");
		respuesta=Character.toLowerCase(teclado.next().charAt(0));
		//Fin Preguntar si volver a repetir el programa
	}
	//Fin Mientras
	
	}
}
