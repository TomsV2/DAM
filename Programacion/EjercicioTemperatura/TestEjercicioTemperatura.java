import java.util.*;

public class TestEjercicioTemperatura{
	
	public static void main (String args[]) {
		
		System.out.println("------------ Constructor por defecto + pintarCalendario ------------");
		
		EjercicioTemperatura calendario0 = new EjercicioTemperatura();
		calendario0.pintarCalendario();
		
		
		System.out.println(" ");
		System.out.println("------------ Constructor con parametros aleatorios + pintarCalendario ------------");
		
		EjercicioTemperatura calendarioR = new EjercicioTemperatura(1);
		calendarioR.pintarCalendario();
		
		System.out.println(" ");
		System.out.println("------------ Calcular la media de un mes ------------");
		System.out.println(" ");
		
		System.out.println("Media del mes de Enero del primer calendario");
		System.out.println(calendario0.mediaMes(0));
		
		System.out.println(" ");
		System.out.println("Media del mes de Enero del segundo calendario");
		System.out.println(calendarioR.mediaMes(0));
		
		System.out.println(" ");
		System.out.println("Media del mes de Abril del segundo calendario");
		System.out.println(calendarioR.mediaMes(3));
		
		System.out.println(" ");
		System.out.println("------------ Minima y Maxima de un mes ------------");
		System.out.println(" ");
		
		System.out.println("Minima de Enero del calendario por defecto: " +calendario0.minimaMes(0));
		System.out.println("Maxima de Enero del calendario por defecto: " +calendario0.maximaMes(0));
		System.out.println(" ");
		System.out.println("Minima de Enero del calendario aleatorio: " +calendarioR.minimaMes(0));
		System.out.println("Maxima de Enero del calendario aleatorio: " +calendarioR.maximaMes(0));
		
		System.out.println(calendarioR.diaMasFrioMes(0));
		System.out.println(calendarioR.diaMasCalurosoMes(0));
		
		System.out.println(" ");
		System.out.println("------------ Minima y Maxima de un calendario ------------");
		System.out.println(" ");
		
		System.out.println("Minima del calendario por defecto: " +calendario0.minimaAnio());
		System.out.println("Maxima del calendario por defecto: " +calendario0.maximaAnio());
		System.out.println(" ");
		System.out.println("Minima del calendario aleatorio: " +calendarioR.minimaAnio());
		System.out.println("Maxima del calendario aleatorio: " +calendarioR.maximaAnio());
		
		
	}
}

