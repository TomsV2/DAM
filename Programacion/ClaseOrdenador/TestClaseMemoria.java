public class TestClaseMemoria {
	
	public static void main (String args[]) {
		
		System.out.println("------------Constructor por defecto------------");
		System.out.println(" ");
		
		ClaseMemoria memoria1 = new ClaseMemoria();
		System.out.print(memoria1.toString());
		
		System.out.println(" ");
		System.out.println("\n------------Constructor con parametros------------");
		System.out.println(" ");
		
		ClaseMemoria memoria2 = new ClaseMemoria(50,50,"MemoriaMieo");
		System.out.println(memoria2.toString());
		
		System.out.println(" ");
		System.out.println("\n------------Cloneable------------");
		System.out.println(" ");
		
		ClaseMemoria memoriaCopia = null;
		
		memoriaCopia = memoria2.clone();
		
		System.out.println(memoriaCopia.toString());
		
		System.out.println(" ");
		System.out.println("\n------------Equals------------");
		System.out.println(" ");
		
		System.out.println(memoria1.equals(memoria2));
		System.out.println(memoria2.equals(memoriaCopia));
		
		System.out.println(" ");
		System.out.println("\n------------CompareTo------------");
		System.out.println(" ");
		
		System.out.println(memoria1.compareTo(memoria2));
		System.out.println(memoria2.compareTo(memoriaCopia));
		System.out.println(memoria2.compareTo(memoria1));
		
		System.out.println(" ");
		System.out.println("\n------------hashCode------------");
		System.out.println(" ");
		
		System.out.println(memoria1.hashCode());
		System.out.println(memoria2.hashCode());
		System.out.println(memoria2.hashCode());
		
	}
}

