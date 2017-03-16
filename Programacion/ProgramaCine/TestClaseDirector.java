

public class TestClaseDirector {
	
	public static void main (String args[]) {
		
		System.out.println("----------------------Constructor por defecto (mas toString)----------------------");
		System.out.println(" ");
		
		ClaseDirector director0 = new ClaseDirector();
		
		System.out.println(director0.toString());
		
		System.out.println(" ");
		System.out.println("----------------------Constructor con parametros----------------------");
		System.out.println(" ");
		
		ClaseDirector director1 = new ClaseDirector("Baz Luhrmann");
		
		ClaseDirector director2 = new ClaseDirector("Steven Spielberg");
		
		System.out.println(director1.toString());
		System.out.println(director2.toString());
		
		System.out.println(" ");
		System.out.println("----------------------Gets y Sets----------------------");
		System.out.println(" ");
		
		System.out.println(director0.getNombreDirector());
		System.out.println(director1.getNombreDirector());
		System.out.println(director2.getNombreDirector());
		
		System.out.println(" ");
		System.out.println("Cambiamos el nombre de Baz Luhrmann a George Lucas");
		System.out.println(" ");
		
		director1.setNombreDirecto("George Lucas");
		System.out.println(director1.getNombreDirector());
		
		System.out.println(" ");
		System.out.println("----------------------hashCode----------------------");
		System.out.println(" ");
		
		System.out.println("Hash code de " +director1.getNombreDirector() +" : " +director1.hashCode());
		System.out.println("Hash code de " +director2.getNombreDirector() +" : " +director2.hashCode());
		
		System.out.println(" ");
		System.out.println("----------------------Clone----------------------");
		System.out.println(" ");
		
		System.out.println("Copiamos a George Lucas");
		ClaseDirector copiaDirector1 = null;
		copiaDirector1 = director1.clone();
		System.out.println(copiaDirector1.toString());
		
		System.out.println(" ");
		
		System.out.println("Copiamos a Steven Spielberg");
		ClaseDirector copiaDirector2 = null;
		copiaDirector2 = director2.clone();
		System.out.println(copiaDirector2.toString());
		
		
	}
}

