import java.util.*;

public class ClaseCalendario {
	
	Random random = new Random();
	int aleatorio = 0;
	
	/* 
	 * Atributos básicos:
	 * 		+Array bidimensional
	 * 			-consultable: Sí --->  get	--->  int[][] getCalendario();
	 * 			-modificable: No
	 * 
	 */
	
	//Atributos básicos
	private int [][] calendario = new int [12][31];
	
	//Constructor por defecto
	public ClaseCalendario(){
        for(int i=0; i<calendario.length; i++){
            for(int j=0; j<calendario[i].length; j++){
                calendario[i][j] = 2;
            }
        }
    }
	
	//Constructor con parámetros
	public ClaseCalendario(int aleatorio){
		for(int i=0; i<calendario.length; i++){
			for(int j=0; j<calendario[i].length; j++){
				
				//Sería de 0 a 45 grados
				aleatorio = random.nextInt(46);
				calendario[i][j] = aleatorio;
			}
		}
	}
	
	//Gets
	public int[][] getCalendario(){		
		return calendario;
	}
	
}

