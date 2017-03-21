import java.util.*;

public class EjercicioTemperatura {
	
	
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
                calendario[i][j] = 1;
            }
        }
    }
	
	/*---waeilufhawiefbhpwehgpawi ufgpqweuihfpawiuefhpqiwuefhpehpiawuefbpiwufgpawiurfvbpweriagpiaebgvpiajebejifgbfjjfjfjfjahsiñdufghapWEUFHPwuefh*/
	/*//Constructor con parámetros
	public EjercicioTemperatura(){
		
	}*/
	
	//GETS
	public int [][] getCalendario(){
		return calendario;
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
		 
		for(int i=0; i==mes-1; i++){
			for(int j=0; j<calendario[i].length; j++){
				suma = suma + calendario[i][j];
			}
			media = suma/31;
		}
		return media;
	}
	
}

