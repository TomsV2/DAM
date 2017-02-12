public class TestClaseOrdenador {
	
	public static void main (String args[]) {
		
		ClaseOrdenador ordenador1 = new ClaseOrdenador();
		
		ordenador1.setPrecioBase(10);
		
		System.out.println("El valor del IVA es: " +ordenador1.getIVA());
		
		System.out.println("La antigua velocidad de la memoria era de: " +ordenador1.getMemoria().getVelocidad());
		
		ordenador1.getMemoria().setVelocidad(50.5);
		
		System.out.println("La nueva velocidad de la memoria es: " +ordenador1.getMemoria().getVelocidad());
		/*System.out.println("El tamanio de la memoria es de: " +ordenador1.getTamanioMemoria());
		
		ordenador1.setTamanioMemoria(10);
		
		System.out.println("El nuevo tamanio de la memoria es de: " +ordenador1.getTamanioMemoria());*/
		
	}
}

