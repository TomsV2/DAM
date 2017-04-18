import java.io.*;

	/* 	dado un archivo de texto datos.txt, que contiene DNI nombre y apellido de personas
	 *	escribiremos un archivo nuevo.txt, 
	*	donde solo aparecerán los nombres de aquellas personas con DNI terminado 
	*	en numero par
	*/

class CArciArr2
{
	
	public static void main (String args[]) throws IOException
	{	
		// Declaracion de Arrays y variables auxiliares
		String nuevo[];
		String datos[][];
		int limite = 0,j=3,i=0;
		datos = new String [15][j];//Array para guardar los datos del archivo
		// marco el ultimo elemento del archivo
		i=llenarArray(datos);
		mostrarArray(datos,i,j);// muestro el contenido del Array
		nuevo=new String[i];// creo un nuevo vector para guardar los datos de las personas con dni par
		limite=nuevoArray(datos,nuevo,i,j);// proceso el nuevo Array
		escribirDatos(nuevo,limite);
	}
	/**
	 *	Metodo para abrir el archivo, llenar el Array y cerrar el archivo
	 **/
	 static int llenarArray(String d[][]) throws IOException
	 {
	 	File inputFile = new File ("datos.txt");
	 	FileReader in = new FileReader (inputFile);//para leer
	 	int c,i,j;// variables auxiliares
	 	i=0;j=0;
		while ((c = in.read())  != -1) //Mientras no sea fin de archivo
		{
			String st="";
			j=0;
			while ((char)c!='\n')// Mientras no sea fin de linea
			{	
				st=st+(char)c;// Voy construyendo el string
				if (c == ' ')// Si encuentro un espacio en blanco
				{
					System.out.println("j= "+j);
					d[i][j]=st;// coloco el primer dato en el Array
					System.out.println("d[="+i+","+j+"]= "+d[i][j]);
					j++;
					st="";// blanqueo el string
				}
				c= in.read();// leo otro caracter del archivo
			}
			d[i][j]=st;// guardo el ultimo elemento de la fila en el Array
			System.out.println("d[="+i+","+j+"]= "+d[i][j]);
			System.out.println("Ya procese la persona No. "+ i);
			i++;

		}
		d[i][0]="0";
		in.close();// cierro archivo de entrada
		return i;
	}
	/**
	 *	METODO para escribir en el archivo
	 **/
	 static void escribirDatos(String n[],int lim) throws IOException
	 {
	 	File outputFile = new File ("nuevo.txt");
		FileWriter out = new FileWriter (outputFile);//escribe
		for(int k=0;k<lim;k++)
		{
			out.write(n[k]+"\n");// escribo en el archivo el contenido del nuevo Array
		}
	
		out.close();// cierro archivo de salida
	}
	/**
	*	Metodo para mostrar el Array
	**/
	static void mostrarArray(String d[][],int i,int j)
	{
		for(int k=0;k<i;k++)
		{
			for(int r=0;r<j;r++)
			{
				System.out.print("dato["+k+","+r+"]= "+d[k][r]);
			}
			System.out.println();
		}
	}
	static int nuevoArray(String d[][],String nv[],int i, int j)
	{
		int n,ult;
		String ced;
	
		int k=0,r=0;
		while ((k<i)&&(!(d[k][0].equals("0"))))
		{
			ced = d[k][0];
			n=ced.length();
			ced=ced.substring(n-2,n-1);
			ult=Integer.parseInt(ced);
			if ((ult%2)==0)
			{
				System.out.println("Ultimo digito par");
				nv[r]=d[k][1]+d[k][2];
				r++;
			}
			k++;
			
		}

		return r;
	}
	

		

}
		
