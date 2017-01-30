import java.util.*;

public class Cerrojo {
	
	public static void main (String args[]) {
		
		ClaseCerrojo cerrojo = new ClaseCerrojo();
		
		Scanner teclado = new Scanner(System.in);
		
		
		
		String intentoCombinacion;
		
		System.out.println(cerrojo.getCombinacion());
		
		
		do{
			
			System.out.print("Introduzca la contrasenia correcta: ");
			intentoCombinacion = teclado.nextLine();
			
		}while (cerrojo.compararCombinacion(intentoCombinacion));
		
		
		
	}
}

