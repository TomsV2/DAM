public class TestClaseMemoria {
	
	public static void main (String args[]) {
		
		ClaseMemoria memoria1 = new ClaseMemoria();
		
		System.out.println(memoria1.toString());
		
		
		ClaseMemoria memoria2 = new ClaseMemoria(10.0,5.0,"OP");
		
		System.out.println("");
		System.out.println(memoria2.toString());
		
		memoria2.setTipo("Mieo");
		
		System.out.println("");
		System.out.println(memoria2.toString());
		
		
	}
}

