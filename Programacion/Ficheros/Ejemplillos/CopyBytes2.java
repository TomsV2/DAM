//CopyBytes2.java
//Ejemplo de uso de FileInputStream y FileOutputStream

import java.io.*;
import java.util.*;

public  class  CopyBytes2  
{
	public static void main(String[] args) throws IOException 
	{ 
		FileInputStream in = null;
		FileOutputStream out = null; 
		try 
		{
			//El in no me sirve de nada, estaba del otro ejemplo
			in  =  new  FileInputStream("prueba.txt");
			out = new FileOutputStream("byteprueba.dat"); 
			int c;
			c = 125458;
			while (c != -1) 
			{ 
				out.write(c);
				c = -1;
			}
		}  
		finally  
		{ 
			if (in != null) 
			{ 
				in.close(); 
			} 
			if (out != null) 
			{ 
				out.close();
			}
		}
		
	}
}
