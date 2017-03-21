public class TestClasePalo {
	
	public static void main (String args[]) {
		
		//System.out.println("");
		System.out.println("--------------Constructor por defecto--------------");
		System.out.println(" ");
		
		ClasePalo palo0 = new ClasePalo();
		
		System.out.println(palo0.toString());
		
		System.out.println(" ");
		System.out.println("--------------Constructor sobrecargado--------------");
		System.out.println(" ");
		
		ClasePalo espada1 = new ClasePalo(1);
		ClasePalo copa1 = new ClasePalo(8);
		ClasePalo basto1 = new ClasePalo(12);
		ClasePalo oro1 = new ClasePalo(6);
		
		System.out.println(espada1.toString());
		System.out.println(copa1.toString());
		System.out.println(basto1.toString());
		System.out.println(oro1.toString());
		
		System.out.println(" ");
		System.out.println("--------------Gets--------------");
		System.out.println(" ");
		
		System.out.println("---Carta 1---");
		System.out.println(espada1.getNumero());
		
		System.out.println("---Carta 2---");
		System.out.println(copa1.getNumero());
		
		System.out.println(" ");
		System.out.println("--------------Sets--------------");
		System.out.println(" ");
		
		espada1.setNumero(9);
		
		copa1.setNumero(10);
		
		System.out.println("---Carta 1---");
		System.out.println(espada1.getNumero());
		
		System.out.println("---Carta 2---");
		System.out.println(copa1.getNumero());
		
		System.out.println(" ");
		System.out.println("--------------Hash code--------------");
		System.out.println(" ");
		
		System.out.println("Hash code de la carta 1: " +espada1.hashCode());
		System.out.println("Hash code de la carta 2: " +copa1.hashCode());
		System.out.println("Hash code de la carta 3: " +basto1.hashCode());
		System.out.println("Hash code de la carta 4: " +oro1.hashCode());
		
		System.out.println(" ");
		System.out.println("--------------Clone--------------");
		System.out.println(" ");
		
		ClasePalo copiaBasto1 = null;
		
		copiaBasto1 = basto1.clone();
		
		System.out.println(copiaBasto1.toString());
		
		System.out.println(" ");
		System.out.println("--------------Compare to--------------");
		System.out.println(" ");
		
		System.out.println("Carta 1 con Carta 1: " +espada1.compareTo(espada1));
		System.out.println("Carta 3 con Carta 4: " +basto1.compareTo(oro1));
		System.out.println("Carta 3 con su copia: " +basto1.compareTo(copiaBasto1));
		System.out.println("Carta 2 con la copia de Carta 3: " +copa1.compareTo(basto1));
		
	}
}

