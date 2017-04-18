/*
 * 
 * 
 */

import java.io.*;

public class Fichero1 {
	
	public static void main (String args[]) throws IOException {
		
		FileReader entrada = null;
		FileWriter salida = null;
		int c;
		
		try{
			entrada = new FileReader ("EntradaTexto.txt");
			salida = new FileWriter ("SalidaTexto.txt");
			
			c = entrada.read();
			
			while (c!= -1) 
			{ 
				//salida.write(Character.toUpperCase(c));
				salida.write(c);
				c = entrada.read();
			}
		}
		
		finally{
			if (entrada != null) 
			{
				entrada.close(); 
			} 
			if (salida != null) 
			{ 
				salida.close();
			}
		}
		
	}
}

