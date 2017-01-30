public class TestClaseCerrojo {
	
	public static void main (String args[]) {
		
		ClaseCerrojo cerrojo1 = new ClaseCerrojo();
		
		System.out.println("Combinacion por defecto del cerrojo: " +cerrojo1.getCombinacion());
		
		System.out.println(" ");
		
		cerrojo1.setCombinacion("584");
		System.out.println("La nueva combinacion del cerrojo es: " +cerrojo1.getCombinacion());
		
		System.out.println(" ");
		
		
		
	}
}

