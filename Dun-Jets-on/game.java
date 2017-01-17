/****************************
 * 
 * Comentario: Imprime una habitación aleatoriamente
 * 
 * Pre: Nada
 * Entradas: Nada
 * Salidas: Nada
 * Post: Nada
 * 
 * Cabecera: public static void RoomGenerator()
 * 
 ***************************/

import java.util.*;

public class game {
	
	public static int roomGenerator () {
		
		Random random = new Random ();
		
		int aleatorio = 0;
		
		//Inicio
			//generarNumeroAleatorio
			aleatorio = random.nextInt(4)+1;
			
			
			//Según aleatorio
			switch (aleatorio){
				case 1: //derechaArriba
					System.out.println("\t                               ");
					System.out.println("\t           |       |           ");
					System.out.println("\t   ---------       ---------   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |___");
					System.out.println("\t   |                           ");
					System.out.println("\t   |           1               ");
					System.out.println("\t   |                        ___");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   ---------   ^   ---------   ");
					System.out.println("\t           |   ^   |           ");
					System.out.println("\t               ^               ");
					System.out.println("\t                               ");
				break;
				
				case 2: //izquierdaArriba
					System.out.println("\t                               ");
					System.out.println("\t           |       |           ");
					System.out.println("\t   ---------       ---------   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t___|                       |   ");
					System.out.println("\t                           |   ");
					System.out.println("\t               2           |   ");
					System.out.println("\t___                        |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   ---------   ^   ---------   ");
					System.out.println("\t           |   ^   |           ");
					System.out.println("\t               ^               ");
					System.out.println("\t ");
				break;
				
				case 3: //derechaIzquierda
					System.out.println("\t                               ");
					System.out.println("\t   -------------------------   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t___|                       |___");
					System.out.println("\t                               ");
					System.out.println("\t               3               ");
					System.out.println("\t___                         ___");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   ---------   ^   ---------   ");
					System.out.println("\t           |   ^   |           ");
					System.out.println("\t               ^               ");
					System.out.println("\t ");
				break;
				
				case 4: //derechaIzquierdaArriba
					System.out.println("\t                               ");
					System.out.println("\t           |       |           ");
					System.out.println("\t   ---------       ---------   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t___|                       |___");
					System.out.println("\t                               ");
					System.out.println("\t               4               ");
					System.out.println("\t___                         ___");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   |                       |   ");
					System.out.println("\t   ---------   ^   ---------   ");
					System.out.println("\t           |   ^   |           ");
					System.out.println("\t               ^               ");
					System.out.println("\t ");
				break;
			}
			//Fin_Según
			
			//Devolver el número de la sala
			return aleatorio;
			
		//Fin
		
		
	}
	
	public static 
}

