public class TestClaseDiscoDuro {
	
	public static void main (String args[]) {
		
		System.out.println("----- Constructor por defecto -----");
		
		ClaseDiscoDuro discoDuro1 = new ClaseDiscoDuro();
		
		System.out.println(discoDuro1.toString());
		System.out.println(" ");
		
		
		System.out.println("----- Constructor con parametros (o sobrecargado) -----");
		
		ClaseDiscoDuro discoDuro2 = new ClaseDiscoDuro(50.5,60);
		
		System.out.println(discoDuro2.toString());
		System.out.println(" ");
		
		
		System.out.println("----- Clone -----");
		
		ClaseDiscoDuro copiaDiscoDuro2 = null;
		
		copiaDiscoDuro2 = discoDuro2.clone();
		
		System.out.println(copiaDiscoDuro2.toString());
		System.out.println(" ");
		
		
		System.out.println("----- Comparable -----");
		
		System.out.println(discoDuro1.compareTo(discoDuro1));
		System.out.println(discoDuro2.compareTo(discoDuro2));
		
		System.out.println(discoDuro1.compareTo(discoDuro2));
		System.out.println(discoDuro2.compareTo(discoDuro1));
		
		System.out.println(discoDuro2.compareTo(copiaDiscoDuro2));
		System.out.println(discoDuro1.compareTo(copiaDiscoDuro2));
		System.out.println(" ");
		
		
		System.out.println("----- Equals -----");
		
		System.out.println(discoDuro1.equals(discoDuro1));
		System.out.println(discoDuro2.equals(discoDuro2));
		
		System.out.println(discoDuro1.equals(discoDuro2));
		System.out.println(discoDuro2.equals(discoDuro1));
		
		System.out.println(discoDuro2.equals(copiaDiscoDuro2));
		System.out.println(discoDuro1.equals(copiaDiscoDuro2));
		System.out.println(" ");
		
		
		System.out.println("----- HashCode -----");
		
		System.out.println(discoDuro1.hashCode());
		System.out.println(discoDuro2.hashCode());
		System.out.println(copiaDiscoDuro2.hashCode());
		
	}
}

