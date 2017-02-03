public class TestClaseDiscoDuro {
	
	public static void main (String args[]) {
		
		ClaseDiscoDuro discoDuro1 = new ClaseDiscoDuro();
		
		System.out.println(discoDuro1.toString());
		System.out.println("");
		
		ClaseDiscoDuro discoDuro2 = new ClaseDiscoDuro(10,5);
		
		System.out.println(discoDuro2.toString());
		System.out.println("");
		
		discoDuro2.setTamanio(1000.75);
		discoDuro2.setVelocidad(2);
		
		System.out.println(discoDuro2.toString());
		System.out.println("");
		
	}
}

