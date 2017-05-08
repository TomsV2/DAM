/*
 * 
 */

import java.io.*;
import java.util.*;

public class ordenarFichero {
	
	public static void main (String args[]) throws IOException {
		
		FileReader lector = null;
		BufferedReader bufferLector = null;
		BufferedWriter bufferEscritor = null;
		FileWriter escritor = null;
		
		String nombre;
		
		ArrayList<String> nombres = new ArrayList<String>();
		
		try{
			
			lector = new FileReader("NombresDesordenados.txt");
			escritor = new FileWriter("NombresOrdenados.txt");
			bufferLector = new BufferedReader(lector);
			
			while((nombre = bufferLector.readLine()) != null){
				nombres.add(nombre);
			}
			
			System.out.println(nombres); //Imprime los nombres desordenados por pantalla como arraylist [hola, adios]
			Collections.sort(nombres);
			//System.out.println(nombres); //Imprime los nombres ordenados por pantalla como arraylist [hola, adios]
			
			for(int i=0; i<nombres.size(); i++){
				//System.out.println(nombres.get(i)); //Comprobar que lo escribe bien
				escritor.write(nombres.get(i) +"\n");
			}
			
		}
		
		finally{
			if(lector != null){
				lector.close();
			}
			
			if (escritor != null) 
			{ 
				escritor.close();
			}
		}
		
	}
}

