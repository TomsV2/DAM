import java.io.*;

/* dado un archivo de texto, escribiremos un archivo salida.txt, donde en cada linea
del archivo diga la ínea y la cantidad de palabras de cada línea del archivo inicial*/
/* Observa que en el archivo de salida dice que en la fila 4 de canción hay tres palabras 
 * y que en la fila 9 hay 1. Esto es porque en la fila 4 hay un espacio en blanco tras maíz 
 * y la tras la última fila de canción hay una fila con espacio en blanco también.
 * 
 * */

class CPruebaLineas
{
	public static void main (String args[]) throws IOException
	
	{
		File inputFile = new File ("cancion.txt");
		File outputFile = new File ("salida.txt");
		
		FileReader in = new FileReader (inputFile);//lee
		FileWriter out = new FileWriter (outputFile);//escribe
		int p,c,i;
		
		i=1;
		c = in.read();
		while (c != -1)
		{
			p=1;
			String st;
			while ((char)c!='\n')
			{	if (c == ' ')
					p++;
				c= in.read();
			}
			System.out.println("En la linea "+ i+ " hay "+p+ " palabras");
			i++;
			st = String.valueOf(p) + " palabras"+"\r\n";
			out.write(st);
			c = in.read();

		}
		in.close();
		out.close();
		
	}
}
