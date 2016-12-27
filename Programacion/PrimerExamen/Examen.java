import java.util.*;

public class Examen {
	
	public static void main (String[] args) {
		
		char respuesta = ' ';
		int opcion = 0;
		int opcionCuadrado = 0;
		int ladoCuadrado = 0;
		int opcionusuario = 0;
		int aleatorio = 0;
		
		int jugadas = 0;
		int jugadashechas = 0;
		
		int contempate = 0;
		int contganar = 0;
		int contganarpc = 0;
		
		Scanner chino = new Scanner (System.in);
		Random random = new Random ();
		
		//Inicio
			//Repetir
			do{
				//Repetir
				do{
					//Mostrar menú y leer
					System.out.println(" ");
					System.out.println("Elija una opcion: ");
					System.out.println("	1 ---> Pintar un cuadrado");
					System.out.println("	2 ---> Numero vampiro");
					System.out.println("	3 ---> Fuego, barco o agua");
					System.out.println("	0 ---> Salir del menu");
					System.out.print("Su opcion es: ");
					
					opcion = chino.nextInt();
				}
				//Mientras
				while (opcion !=0 && opcion !=1 && opcion !=2 && opcion !=3);
				
				//Según opcion mostrar Pintar cuadrado, Número vampiro, Fuego barco agua o Salir
				switch (opcion){
					
					case 0: //Para salir del menu
					break;
					
					case 1: System.out.println(" ");
							System.out.println("Bienvenido a Pintar un cuadrado");
							System.out.println(" ");
							
							System.out.print("Por favor, introduzca la cantidad de caracteres para los lados (solo entre 5 y 30): ");
							ladoCuadrado = chino.nextInt();
							
							while (ladoCuadrado<5 || ladoCuadrado>30){
							
							System.out.print("Por favor, introduzca la cantidad de caracteres para los lados (solo entre 5 y 30): ");
							ladoCuadrado = chino.nextInt();
							}
							
							System.out.println(" ");
							System.out.println("Ahora por favor, elija el caracter que desea usar: ");
							System.out.println("	1 ---> *");
							System.out.println("	2 ---> +");
							System.out.println("	3 ---> a");
							System.out.print("Su opcion es: ");
							
							opcionCuadrado = chino.nextInt();
							
							while (opcionCuadrado !=1 && opcionCuadrado !=2 && opcionCuadrado !=3){
								
								System.out.println(" ");
								System.out.println("Ahora por favor, elija el caracter que desea usar: ");
								System.out.println("	1 ---> *");
								System.out.println("	2 ---> +");
								System.out.println("	3 ---> a");
								System.out.print("Su opcion es: ");
								
								opcionCuadrado = chino.nextInt();
							}
							
							System.out.println(" ");
							System.out.println("Lo sentimos pero ahora mismo estamos en construccion, disculpen por las molestias");
					break;
					
					case 2: System.out.println(" ");
							System.out.println("Numero vampiro en construccion, sentimos las molestias");
					break;
					
					case 3: System.out.println(" ");
							System.out.println("Bienvenido a Fuego, barco o agua");
							System.out.println(" ");
							
							//Inicio
								
								//Introducir número de tiradas que quiero jugar y validar que sean positivas
								System.out.print("Introduzca la cantidad de jugadas que quiera jugar: ");
								jugadas = chino.nextInt();
								
								while (jugadas<=0){
									System.out.print("Introduzca la cantidad de jugadas que quiera jugar: ");
									jugadas = chino.nextInt();
								}
								
								//Repetir mientras jugadashechas sea menor o igual que jugadas
								do{
									
									//Mostrar el menú, leer y validar la opción del usuario
									System.out.println("Elija una opcion: ");
									System.out.println("	1 ---> Fuego");
									System.out.println("	2 ---> Barco");
									System.out.println("	3 ---> Agua");
									System.out.print("Su opcion es: ");
									opcionusuario = chino.nextInt();
									
									while (opcionusuario !=1 && opcionusuario !=2 && opcionusuario !=3){
										
										System.out.println(" ");
										System.out.println("Lo sentimos pero Leer la cantidad de partidas está en construccion");
										System.out.println(" ");
										System.out.println("Elija una opcion: ");
										System.out.println("	1 ---> Fuego");
										System.out.println("	2 ---> Barco");
										System.out.println("	3 ---> Agua");
										System.out.print("Su opcion es: ");
										opcionusuario = chino.nextInt();
									}
									
									//Generar número aleatorio
									aleatorio = random.nextInt(3)+1;

									//Según el número aleatorio y la opción del usuario mostrar mensaje ganador, perdedor o de empate
									switch (opcionusuario){
								
										case 1: switch (aleatorio){
											
												case 1: System.out.println(" --------------- ");
														System.out.println(" |    EMPATE   | ");
														System.out.println(" --------------- ");
														contempate = contempate +1;
														jugadashechas = jugadashechas +1;
												break;
												case 2: System.out.println(" --------------- ");
														System.out.println(" |   GANASTE!  | ");
														System.out.println(" --------------- ");
														contganar = contganar +1;
														jugadashechas = jugadashechas +1;
												break;
												case 3: System.out.println(" --------------- ");
														System.out.println(" | PERDISTE... | ");
														System.out.println(" --------------- ");
														contganarpc = contganarpc +1;
														jugadashechas = jugadashechas +1;
												break;
										}
										break;
								
										case 2: switch (aleatorio){
											
												case 1: System.out.println(" --------------- ");
														System.out.println(" | PERDISTE... | ");
														System.out.println(" --------------- ");
														contganarpc = contganarpc +1;
														jugadashechas = jugadashechas +1;
												break;
												case 2: System.out.println(" --------------- ");
														System.out.println(" |    EMPATE   | ");
														System.out.println(" --------------- ");
														contempate = contempate +1;
														jugadashechas = jugadashechas +1;
												break;
												case 3: System.out.println(" --------------- ");
														System.out.println(" |   GANASTE!  | ");
														System.out.println(" --------------- ");
														contganar = contganar +1;
														jugadashechas = jugadashechas +1;
												break;
										}
										break;
								
										case 3: switch (aleatorio){
											
												case 1: System.out.println(" --------------- ");
														System.out.println(" |   GANASTE!  | ");
														System.out.println(" --------------- ");
														contganar = contganar +1;
														jugadashechas = jugadashechas +1;
												break;
												case 2: System.out.println(" --------------- ");
														System.out.println(" | PERDISTE... | ");
														System.out.println(" --------------- ");
														contganarpc = contganarpc +1;
														jugadashechas = jugadashechas +1;
												break;
												case 3: System.out.println(" --------------- ");
														System.out.println(" |    EMPATE   | ");
														System.out.println(" --------------- ");
														contempate = contempate +1;
														jugadashechas = jugadashechas +1;
												break;
										}
										break;
									}
								}
								
								while(jugadashechas<jugadas);
								System.out.println(" ");
								System.out.println("Empates: " +contempate);
								System.out.println("Ganadas por usted: " +contganar);
								System.out.println("Ganadas por el Pc: " +contganarpc);
								System.out.println(" ");
								
								//Mostrar ganador total de las partidas o empate
								
								//Si el usuario tiene más partidas ganadas
								if (contganar>contganarpc){
									System.out.println("ENHORABUENA HA GANADO USTED");
								}
								
								//Si el Pc tiene más partidas ganadas
								if (contganar<contganarpc){
									System.out.println("LO SIENTO, HA GANADO EL PC");
								}
								
								//Si las partidas ganadas son iguales
								if (contganar==contganarpc){
									System.out.println("Vaya, hay empate");
								}
				}
				
				//Preguntar para ejecutar otra vez el programa
				System.out.println(" ");
				System.out.print("Quiere ver el menu de nuevo? (s/n): ");
				respuesta = Character.toLowerCase(chino.next().charAt(0));
				
				while (respuesta !='s' && respuesta != 'n'){
					
					System.out.println(" ");
					System.out.print("Quiere ver el menu de nuevo? (s/n): ");
					respuesta = Character.toLowerCase(chino.next().charAt(0));
				}
			}
			//Mientras
			while (respuesta == 's');
	}
}

