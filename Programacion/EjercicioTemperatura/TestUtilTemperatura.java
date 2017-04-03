public class TestUtilTemperatura {
	
	public static void main (String args[]) {
		
		//UtilTemperatura utilTemperatura = new UtilTemperatura();
		
		System.out.println("------------ Constructor por defecto + pintarCalendario ------------");
		
		ClaseCalendario calendario0 = new ClaseCalendario();
		calendario0.UtilTemperatura.pintarCalendario();
		
		
		System.out.println(" ");
		System.out.println("------------ Constructor con parametros aleatorios + pintarCalendario ------------");
		
		ClaseCalendario calendarioR = new ClaseCalendario(1);
		utilTemperatura.pintarCalendario();
		
		/*System.out.println(" ");
		System.out.println("------------ Calcular la media de un mes ------------");
		System.out.println(" ");
		
		System.out.println("Media del mes de Enero del primer calendario");
		System.out.println(calendario0.mediaMes(0));
		
		System.out.println(" ");
		System.out.println("Media del mes de Enero del segundo calendario");
		System.out.println(calendarioR.mediaMes(0));
		
		System.out.println(" ");
		System.out.println("Media del mes de Abril del segundo calendario");
		System.out.println(calendarioR.mediaMes(3));*/
		
	}
}

