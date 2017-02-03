public class TestClaseProcesador {
	
	public static void main (String args[]) {
		
		ClaseProcesador procesador1 = new ClaseProcesador();
		
		System.out.println(procesador1.toString());
		System.out.println("");
		
		ClaseProcesador procesador2 = new ClaseProcesador(10,"MieoCompany");
		
		System.out.println(procesador2.toString());
		System.out.println("");
		
		procesador2.setVelocidad(1004.874);
		procesador2.setModelo("FasiCompany");
		
		System.out.println(procesador2.toString());
		System.out.println("");
		
	}
}

