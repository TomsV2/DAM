import java.util.*;

public class EjercicioTemperatura {
	
	Random random = new Random();
	int aleatorio = 0;
	
	/* Atributos básicos:
	 * 		+Array bidimensional
	 * 			-consultable: Sí	---> Get ---> int [][] getCalendario();
	 * 			-modificable: No
	 */
	
	//Atributos básicos
	private int [][] calendario = new int [12][31];
	
	//Constructor por defecto
	public EjercicioTemperatura(){
        for(int i=0; i<calendario.length; i++){
            for(int j=0; j<calendario[i].length; j++){
                calendario[i][j] = 2;
            }
        }
    }
	
	//Constructor con parámetros
	public EjercicioTemperatura(int aleatorio){
		for(int i=0; i<calendario.length; i++){
			for(int j=0; j<calendario[i].length; j++){
				
				//Sería de 0 a 45 grados
				aleatorio = random.nextInt(46);
				calendario[i][j] = aleatorio;
			}
		}
	}
	
	//GETS
	public void pintarCalendario(){
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

	/* Nombre: mediaMes
	 * Comentario: Calculará la temperatura media de un mes
	 * Cabezera/Prototipo: double mediaMes(int [][] calendario)
	 * 
	 * Precondiciones: un número entero
	 * Entradas: número entero
	 * Salidas: la media de los días
	 * E/S:
	 * Postcondiciones: el número será un double
	 * Restricciones: el número estará entre 1 y 12
	 */
	 
	public double mediaMes(int mes){
		
		double media = 0;
		double suma = 0;
		 
		for(int j=0; j<calendario[mes].length; j++){
			suma = suma + calendario[mes][j];
		}
		media = suma/31;
		return media;
	}
	
}

