/*
 * 
 */

import java.io.*;
import java.util.*;

public class ordenarFichero {
	
	public static void main (String args[]) throws IOException {
		
		FileReader lector = null;
		BufferedReader buffer = null;
		FileWriter escritor = null;
		
		String nombre;
		
		ArrayList<String> nombres = new ArrayList<String>();
		
		try{
			
			lector = new FileReader("NombresDesordenados.txt");
			escritor = new FileWriter("NombresOrdenados.txt");
			buffer = new BufferedReader(lector);
			
			while((nombre = buffer.readLine()) != null){
				nombres.add(nombre);
			}
			
			//System.out.println(nombres);
			Collections.sort(nombres);
			//System.out.println(nombres);
			
			for(){
				
			}
			
		}
		
		finally{
			if(lector != null){
				lector.close();
			}
		}
		
	}
}

