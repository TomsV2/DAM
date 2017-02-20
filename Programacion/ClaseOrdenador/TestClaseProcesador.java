public class TestClaseProcesador {
	
	public static void main (String args[]) {
		
		System.out.println(" ");
		System.out.println("\n------------Constructor por defecto------------");
		System.out.println(" ");
		
		ClaseProcesador procesador1 = new ClaseProcesador();
		System.out.println(procesador1.toString());
		
		
		System.out.println(" ");
		System.out.println("\n------------Constructor con parametros------------");
		System.out.println(" ");
		
		ClaseProcesador procesador2 = new ClaseProcesador(50.5,"Procesador2Mieo");
		System.out.println(procesador2.toString());
		
		
		System.out.println(" ");
		System.out.println("\n------------Cloneable------------");
		System.out.println(" ");
		
		ClaseProcesador copiaProcesador2 = null;
		
		copiaProcesador2 = procesador2.clone();
		
		System.out.println(copiaProcesador2.toString());
		
		
		System.out.println(" ");
		System.out.println("\n------------CompareTo------------");
		System.out.println(" ");
		
		System.out.println(procesador1.compareTo(procesador1));
		System.out.println(procesador1.compareTo(procesador2));
		System.out.println(procesador2.compareTo(procesador1));
		System.out.println(procesador2.compareTo(procesador2));
		
		System.out.println(procesador2.compareTo(copiaProcesador2));
		
		
		System.out.println(" ");
		System.out.println("\n------------Equals------------");
		System.out.println(" ");
		
		System.out.println(procesador1.equals(procesador1));
		System.out.println(procesador2.equals(procesador2));
		System.out.println(procesador1.equals(procesador2));
		
		System.out.println(procesador2.equals(copiaProcesador2));
		
		
		System.out.println(" ");
		System.out.println("\n------------HashCode------------");
		System.out.println(" ");
		
		System.out.println(procesador1.hashCode());
		System.out.println(procesador2.hashCode());
		System.out.println(copiaProcesador2.hashCode());
		
	}
}

