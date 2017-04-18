import java.io.*;
/**
 *	Este programa lee el contenido de un archivo denominado cancion.txt y luego
 *	lo copia en un nuevo archivo llamado salida.txt
 **/
class CPrueba
{
	public static void main (String args[]) throws IOException
	
	{
		File inputFile = new File ("cancion.txt");// declaro el archivo de entrada
		File outputFile = new File ("salida1.txt");// declaro el archivo de salida
		
		FileReader in = new FileReader (inputFile);// declaro la variable que lee
		FileWriter out = new FileWriter (outputFile);// declaro la variable que escribe
		
		int c;// variable para obtener los caracteres
		
		while ((c = in.read()) != -1){// mientras no sea fin de archivo
			System.out.print((char)c);
			out.write(c);}// Escribo caracter pro caracter en el archivo de salida
		
		in.close();// cierro los archivos
		out.close();
	}
}