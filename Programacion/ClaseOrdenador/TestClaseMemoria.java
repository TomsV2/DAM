public class TestClaseMemoria {
	
	public static void main (String args[]) {
		
		System.out.println("------------Constructor por defecto------------");
		System.out.println(" ");
		
		ClaseMemoria memoria0 = new ClaseMemoria();
		System.out.print(memoria0.toString());
		
		System.out.println(" ");
		System.out.println("\n------------Constructor con parametros------------");
		System.out.println(" ");
		
		ClaseMemoria memoria1 = new ClaseMemoria(50,50,"MemoriaMieo");
		System.out.println(memoria1.toString());
		
		System.out.println(" ");
		System.out.println("\n------------Cloneable------------");
		System.out.println(" ");
		
		ClaseMemoria memoriaCopia = null;
		
		memoriaCopia = memoria1.clone();
		
		System.out.println(memoriaCopia.toString());
		
		System.out.println(" ");
		System.out.println("\n------------Equals------------");
		System.out.println(" ");
		
		System.out.println(memoria0.equals(memoria1));
		System.out.println(memoria1.equals(memoriaCopia));
		
		System.out.println(" ");
		System.out.println("\n------------CompareTo------------");
		System.out.println(" ");
		
		System.out.println(memoria0.compareTo(memoria1));
		System.out.println(memoria1.compareTo(memoriaCopia));
		System.out.println(memoria1.compareTo(memoria1));
		
		System.out.println(" ");
		System.out.println("\n------------hashCode------------");
		System.out.println(" ");
		
		System.out.println(memoria0.hashCode());
		System.out.println(memoria1.hashCode());
		System.out.println(memoria1.hashCode());
		
		ClaseMemoria memoria2 = new ClaseMemoria(100,100,"PruebaArrayObjetos");
		
		System.out.println(" ");
		System.out.println("\n------------Array------------");
		System.out.println(" ");
		
		ClaseMemoria [] arrayMemoria = new ClaseMemoria [2];
		int i;
		
		
												//Leo memoria por teclado
		arrayMemoria [0] = memoria1.clone();
												//Leo memoria por teclado
		arrayMemoria [1] = memoria2.clone();
		
		System.out.println(arrayMemoria [0].toString());
		System.out.println(" ");
		System.out.println(arrayMemoria [1].toString());
		
		/*for(i=0;i<arrayMemoria.length;i++){
			arrayMemoria [i] = new ClaseMemoria();
			System.out.println(arrayMemoria[i]);
			System.out.println(" ");
		}*/
	}
}

