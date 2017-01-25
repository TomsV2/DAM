public class TestClaseCerrojo {
	
	public static void main (String args[]) {
		
		ClaseCerrojo Cerrojo1 = new ClaseCerrojo();
		
		//Probando el GET del valor por defecto
		System.out.println("Sus numeros para el ClaseCerrojo son: " + Cerrojo1.getNum1() + " " + Cerrojo1.getNum2() + " " + Cerrojo1.getNum3() );
		System.out.println(" ");
		
		//Probamos el SET
		Cerrojo1.setNum1(0);
		Cerrojo1.setNum2(8);
		Cerrojo1.setNum3(4);
		
		System.out.println("Sus numeros para el Cerrojo son: " + Cerrojo1.getNum1() + " " + Cerrojo1.getNum2() + " " + Cerrojo1.getNum3() );
		System.out.println(" ");
		
		//Probamos el GET de "combinacion"
		System.out.println("Sus numeros para el Cerrojo son: " + Cerrojo1.getCombinacion() );
		System.out.println(" ");
		
		
		
		
	}
}

