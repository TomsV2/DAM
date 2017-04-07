//CopyCharacters.java
//Ejemplo de uso de FileReader y FileWriter

import java.io.*;
import java.util.*;

public  class  CopyCharacters  
{
	public static void main(String[] args) throws IOException 
	{ 
		FileReader inputS = null;
		FileWriter outputS = null; 
		try 
		{
			inputS = new FileReader("prueba.txt"); 
			outputS = new FileWriter("characteroutput.txt"); 
			int c;
			c = inputS.read();
			while (c!= -1) 
			{ 
				outputS.write(c);
				c = inputS.read();
			}
		}  
		finally  
		{ 
			if (inputS != null) 
			{
				inputS.close(); 
			} 
			if (outputS != null) 
			{ 
				outputS.close();
			}
		}
	}
}
