public class TestClasePersonaje {
	
	public static void main (String args[]) {
	
		ClasePersonaje personaje1 = new ClasePersonaje();
		
		System.out.println("El nombre por defecto es: " +personaje1.getNombre());
		System.out.println(" ");
		System.out.println("Probando el toString" +personaje1.toString());
		
		personaje1.setNombre("SrMieo");
		
		System.out.println(" ");
		System.out.println("Probando el toString" +personaje1.toString());
		
		ClasePersonaje personaje2 = new ClasePersonaje("Tom_s", 5, 100, 0, 0, true);
		
		System.out.println(" ");
		System.out.println("Probando el toString" +personaje2.toString());
	}
}

