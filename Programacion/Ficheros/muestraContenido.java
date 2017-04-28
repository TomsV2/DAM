/*
 * Crea el método muestraContenido que recibe una ruta
 * y muestra por pantalla un listado con los ficheros
 * y carpetas contenidos en ella, ordenados alfabéticamente.
 * 
 */

import java.io.*;

public class muestraContenido {
	
	public static void main (String args[]) throws IOException {
		
		FileReader lector = null;
		BufferedReader buffer = null;
		String c;
		
		try{
			lector = new FileReader ("EntradaTexto.txt"); //No se poner una ruta para leer los archivos y carpetas que tiene
			buffer = new BufferedReader(lector);
			
			while ((c = buffer.readLine()) != null){
				System.out.println(c);
			}
		}
		
		finally{
			if (lector != null) 
			{
				lector.close(); 
			}
		}
		
	}
}

