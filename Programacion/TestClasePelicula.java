import java.util.*;

public class TestClasePelicula {
	
	public static void main (String args[]) {
		
		Scanner teclado = new Scanner(System.in);
		
		System.out.println("-------------Constructor por defecto----------------");
		System.out.println(" ");
		
		ClasePelicula pelicula0 = new ClasePelicula();
		System.out.println(pelicula0.toString());
		
		System.out.println(" ");
		System.out.println("-------------Constructor con parametros----------------");
		System.out.println(" ");
		
		ClasePelicula pelicula1 = new ClasePelicula("Pelicula Mieo", 1998);
		System.out.println(pelicula1.toString());
		System.out.println(" ");
		
		ClasePelicula vDeVendetta = new ClasePelicula("V de vendetta", 2005);
		System.out.println(vDeVendetta.toString());
		
		System.out.println(" ");
		System.out.println("-------------Array----------------");
		System.out.println(" ");
		
		ClasePelicula [] array5Peliculas = new ClasePelicula [5];
		
		for(int i=0; i<5; i++){
			
			ClasePelicula pelicula = new ClasePelicula();
			
			System.out.print("Introduzca el nombre de la pelicula numero " +(i+1) +": ");
			pelicula.setNombrePelicula(teclado.nextLine());
			
			System.out.println(" ");
			
			System.out.print("Introduzca el a\u00f1o de su estreno: ");
			pelicula.setAnioEstreno(teclado.nextInt());
			
			teclado.nextLine();
			
			array5Peliculas [i] = pelicula;
		}
		
		System.out.println(" ");
		System.out.println("----------------Array de 5 peliculas----------------");
		for(int i=0; i<array5Peliculas.length; i++){
			System.out.println(array5Peliculas[i]);
			System.out.println(" ");
		}
				
	}
}

