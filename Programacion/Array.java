import java.util.*;

public class Array {
	
	public static void main (String args[]) {
		
		Scanner teclado = new Scanner(System.in);
		
		int [] array1 = new int [5];	
		
		//~ array1 = new int[5];
		
		for(int i=0;i<5;i++){
			System.out.print("Introduzca un numero para la posicion " +(i+1) +" del array: ");
			array1 [i] = teclado.nextInt();
			
			System.out.println("La posicion " +(i+1) +" del array tiene el valor: " +array1 [i]);
			System.out.println(" ");
		}
		
		System.out.println("El array tiene los siguientes valores: ");
		for(int i=0; i<array1.length; i++){
			System.out.print(", "+array1 [i]);
		}
		
	}
}

