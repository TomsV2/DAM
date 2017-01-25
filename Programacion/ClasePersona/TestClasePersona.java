public class TestClasePersona {
	
	public static void main (String args[]) {
		
		ClasePersona persona1 = new ClasePersona();
		
		System.out.println("Nombre por defecto: " +persona1.getNombre());
		System.out.println("Edad por defecto: " +persona1.getEdad());
		System.out.println("DNI por defecto: " +persona1.getDNI());
		System.out.println("Sexo por defecto: " +persona1.getSexo());
		System.out.println("Peso por defecto: " +persona1.getPeso());
		System.out.println("Altura por defecto: " +persona1.getAltura());
		System.out.println("IMC por defecto: " +persona1.getValorIMC());
		System.out.println(" ");
		
		
		
		persona1.setNombre("Tomas Mateo");
		System.out.println("Nuevo nombre: " +persona1.getNombre());
		
		persona1.setEdad(18);
		System.out.println("Nueva edad: " +persona1.getEdad());
		
		persona1.setDNI("77859350A");
		System.out.println("Nuevo DNI: " +persona1.getDNI());
		
		persona1.setSexo('M');
		System.out.println("Nuevo sexo: " +persona1.getSexo());
		
		persona1.setPeso(70);
		System.out.println("Nuevo peso: " +persona1.getPeso());
		
		persona1.setAltura(1.72);
		System.out.println("Nueva altura: " +persona1.getAltura());
		
		System.out.println("El nuevo IMC es " +persona1.getValorIMC() +" y su tipo es " +persona1.getTipoIMC());
	}
}

