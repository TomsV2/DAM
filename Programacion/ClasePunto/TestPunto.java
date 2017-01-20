/*
 * 
 */

import java.util.*;

public class TestPunto {
	
	public static void main (String args[]) {
		
		Punto punto1 = new Punto();
		
		System.out.println("Las coordenadas son: " + "(" + punto1.getX() + "," + punto1.getY() + ")" );
		System.out.println(" ");
		
		punto1.setX(2);
		
		System.out.println("Las coordenadas son: " + "(" + punto1.getX() + "," + punto1.getY() + ")" );
		System.out.println(" ");
		
		System.out.println("El punto origen es: " +punto1.getOrigen()); //********PREGUNTAR********//
	}
}

