/*
 *
 * 
 */


public class Punto {
	
	private double x;
	private double y;
	
	private static Punto origen = new Punto(); //*********PREGUNTAR**********//
	
	//Constructor del valor por defecto
	public Punto (){
		x = 0;
		y = 0;
	}
	
	//Constructor para cuando se introduzcan los valores tanto de "x" como de "y"
	public Punto (double nx, double ny){
		x = nx;
		y = ny;
	}
	
	//GET
	public double getX(){
		return x;
	}
	public double getY(){
		return y;	
	}
	public Punto getOrigen(){
		return origen;
	}
	
	//SET
	public void setX (double nx){
		x = nx;
	}
	public void setY (double ny){
		y = ny;
	}
	
}

