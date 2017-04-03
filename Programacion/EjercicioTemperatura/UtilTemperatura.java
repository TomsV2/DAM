public class UtilTemperatura {
	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: pintarCalendario
	 * Comentario: Imprimirá el calendario por pantalla
	 * Cabezera/Prototipo: void pintarCalendario()
	 * 
	 * Precondiciones: Nada
	 * Entradas: Ninguna
	 * Salidas: Calendario
	 * E/S: Ninguna
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: Nada
	 */
	
	public void pintarCalendario(){
		
		int [][] calendario = new int [12][31];
		
		for(int i=0; i<calendario.length; i++){
			System.out.println("");
			System.out.println("Fila " +(i+1) +": ");
			
			for(int j=0; j<calendario[i].length; j++){
				System.out.print("|");
				System.out.print(calendario [i][j] +"|");
			}
			System.out.println("");
		}
	}
	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: mediaMes
	 * Comentario: Calculará la temperatura media de un mes
	 * Cabezera/Prototipo: double mediaMes(int [][] calendario)
	 * 
	 * Precondiciones: un número entero
	 * Entradas: número entero
	 * Salidas: la media de los días
	 * E/S:
	 * Postcondiciones: el número será un double
	 * 
	 * Restricciones: el número estará entre 1 y 12
	 */
	 
	public double mediaMes(int mes){
		
		int [][] calendario = new int [12][31];
		double media = 0;
		double suma = 0;
		 
		for(int j=0; j<calendario[mes].length; j++){
			suma = suma + calendario[mes][j];
		}
		media = suma/31;
		return media;
	}
	
//-------------------------------------------------------------------------------
	
	/* 
	 * Nombre: minimaMes
	 * Comentario: Encuentra cual es la temperatura más baja del mes indicado
	 * Cabezera/Prototipo: int minimaMes(int mes)
	 * 
	 * Precondiciones: un número entero (que indicará el mes)
	 * Entradas: un int
	 * Salidas: un int
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: El mes tiene que estar entre 1 y 12
	 */
	
	public int minimaMes(int mes){
		
		int [][] calendario = new int [12][31];
		int minima = Integer.MAX_VALUE;   //Integer.MAX_VALUE; Valor máximo de int
		
		for(int j=0; j<calendario[mes].length; j++){
			
			if(calendario[mes][j] < minima){
				minima = calendario[mes][j];
			}
		}
		return minima;
	}
	
//-------------------------------------------------------------------------------
	
	/* 
	 * Nombre: maximaMes
	 * Comentario: Encuentra cual es la temperatura más alta del mes indicado
	 * Cabezera/Prototipo: int maximaMes(int mes)
	 * 
	 * Precondiciones: un número entero (que indicará el mes)
	 * Entradas: un int
	 * Salidas: un int
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: El mes tiene que estar entre 1 y 12
	 */
	
	public int maximaMes(int mes){
		
		int [][] calendario = new int [12][31];
		int maxima = Integer.MIN_VALUE;		//Integer.MIN_VALUE; Valor mínimo de int
		
		for(int j=0; j<calendario[mes].length; j++){
			
			if(calendario[mes][j] > maxima){
				maxima = calendario[mes][j];
			}
		}
		return maxima;
	}
	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: minimaAnio
	 * Comentario: Encuentra la temperatura más pequeña del año
	 * Cabezera/Prototipo: int minimaAnio()
	 * 
	 * Precondiciones: Nada
	 * Entradas: Nada
	 * Salidas: valor mínimo del array (calendario)
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: Nada
	 */
	 
	public int minimaAnio(){
		
		int [][] calendario = new int [12][31];
		int minima = Integer.MAX_VALUE;
		
		for(int i=0; i<calendario.length; i++){
			for(int j=0; j<calendario[i].length; j++){
				if(calendario[i][j] < minima){
					minima = calendario[i][j];
				}
			}
		}
		return minima;
	}
	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: maximaAnio
	 * Comentario: Encuentra la temperatura más elevada del año
	 * Cabezera/Prototipo: int maximaAnio()
	 * 
	 * Precondiciones: Nada
	 * Entradas: Nada
	 * Salidas: valor maximo del array (calendario)
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: Nada
	 */
	 
	public int maximaAnio(){
		
		int [][] calendario = new int [12][31];
		int maxima = Integer.MIN_VALUE;
		
		for(int i=0; i<calendario.length; i++){
			
			for(int j=0; j<calendario[i].length; j++){
				
				if(calendario[i][j] > maxima){
					maxima = calendario[i][j];
					
				}
			}
		}
		return maxima;
	}

	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: diaMasFrioMes
	 * Comentario: Encuentra el primer dia con la temperatura más baja del mes indicado
	 * Cabezera/Prototipo: int diaMasFrioMes(int mes)
	 * 
	 * Precondiciones: un número entero
	 * Entradas: un int
	 * Salidas: un int
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: Nada
	 */
	
	public int diaMasFrioMes(int mes){
	
	int [][] calendario = new int [12][31];
	int minima = Integer.MAX_VALUE;
	int dia = 0;
		
		for(int j=0; j<calendario[mes].length; j++){
			
			if(calendario[mes][j] < minima){
				minima = calendario[mes][j];
				dia = j+1;
			}
		}
		return dia;
	}
	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: diaMasCalurosoMes
	 * Comentario: Encuentra el primer dia con la temperatura más elevada del mes indicado
	 * Cabezera/Prototipo: int diaMasCalurosoMes(int mes)
	 * 
	 * Precondiciones: un número entero
	 * Entradas: un int
	 * Salidas: un int
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: Nada
	 */
	
	public int diaMasCalurosoMes(int mes){
	
	int [][] calendario = new int [12][31];
	int maxima = Integer.MIN_VALUE;
	int dia = 0;
		
		for(int j=0; j<calendario[mes].length; j++){
			
			if(calendario[mes][j] > maxima){
				maxima = calendario[mes][j];
				dia = j+1;
			}
		}
		return dia;
	}
	
//-------------------------------------------------------------------------------

	/* 
	 * Nombre: diaMasFrioAnio
	 * Comentario: Encuentra el primer dia con la temperatura más baja del año
	 * Cabezera/Prototipo: int diaMasFrioAnio()
	 * 
	 * Precondiciones:
	 * Entradas:
	 * Salidas: un int
	 * E/S: Nada
	 * Postcondiciones: Nada
	 * 
	 * Restricciones: Nada
	 */
	
	public int[] diaMasFrioAnio(){
	
	int [][] calendario = new int [12][31];
	int [] fecha = new int [2];
	int minima = Integer.MAX_VALUE;
		
		for(int i=0; i<calendario.length; i++){
			
			for(int j=0; j<calendario[i].length; j++){
				
				if(calendario[i][j] < minima){
					fecha[0] = i+1;
					fecha[1] = j+1;
				}
			}
		}
		return fecha;
	}
	
}

