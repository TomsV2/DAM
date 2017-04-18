import java.io.*;

	/* 	dado un archivo de texto notas.txt, con carnet nombre apellido y 3 notas parciales
	 *	escribiremos un archivo promedios.txt, 
	*	donde solo aparecerán los datos de aquellos estudiantes cuyo promedio
	*	es mayor a catorce puntos
	*/

class CNotas1
{
	
	public static void main (String args[]) throws IOException
	{	
		// Declaracion de Arrays y variables auxiliares
		String nuevo[];
		String datos[][];
		int limite = 0,j=6,i=0;
		datos = new String [15][j];//Array para guardar los datos del archivo
		// marco el ultimo elemento del archivo
		i=llenarArray(datos);
		mostrarArray(datos,i,j);// muestro el contenido del Array
		nuevo=new String[i];// creo un nuevo vector para guardar los datos de las personas con ced par
		limite=nuevoArray(datos,nuevo,i);// proceso el nuevo Array
		escribirDatos(nuevo,limite);
	}
	/**
	 *	Metodo para abrir el archivo, llenar el Array y cerrar el archivo
	 **/
	 static int llenarArray(String d[][]) throws IOException
	 {
	 	File inputFile = new File ("notas.txt");
	 	FileReader in = new FileReader (inputFile);//lee
	 	int c,i,j;// variables auxiliares
	 	i=0;j=0;
		while ((c = in.read())  != -1) //Mientras no sea fin de archivo
		{
			String st="";
			j=0;
			while ((char)c!='\n')// Mientras no sea fin de linea
			{	
				
				if (c == ' ')// Si encuentro un espacio en blanco
				{
					d[i][j]=st;// coloco el primer dato en el Array
					j++;
					st="";// blanqueo el string
				}
				else
				{
					st=st+(char)c;// Voy construyendo el string
				}
				c= in.read();// leo otro caracter del archivo
				System.out.println("El caracter leido es ="+(char)c);
			}
			System.out.println("Encontre el fin de linea");
			d[i][j]=st.substring(0,st.length()-1);// guardo el ultimo elemento de la fila en el Array
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
	 	File outputFile = new File ("promedios.txt");
		FileWriter out = new FileWriter (outputFile);//escribe
		for(int k=0;k<lim;k++)
		{
			out.write(n[k]+"\r\n");// escribo en el archivo el contenido del nuevo Array
		}
	
		out.close();// cieroo archivo de salida
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
				System.out.println("dato["+k+","+r+"]= "+d[k][r]);
			}
			System.out.println();
		}
	}
	/**
	 *	Metodo que crea un nuevo Array con los datos de aquellos estudiantes
	 *	cuyo promedio es mayor de 14
	 **/
	static int nuevoArray(String d[][],String nv[],int i)
	{
		int num,suma;
		float prom;
		String ced;
	
		int k=0,r=0;
		while ((k<i)&&(!(d[k][0].equals("0"))))
		{
			suma=0;
			for (int s=3;s<6;s++)
			{
				num=Integer.parseInt(d[k][s]);// convierto de string a numero
				suma+=num;
			}
			prom=suma/3;
			if (prom>14)
			{
				nv[r]=d[k][0]+" "+d[k][1]+" "+d[k][2];// introduzco los datos al vector
				r++;
			}
			k++;
		}
		return r;// devuevo el numero de elementos del nuevo vector
	}
	

		

}
		
