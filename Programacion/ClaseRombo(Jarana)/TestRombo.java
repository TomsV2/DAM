/*
 * TEST ROMBO
 * 
 * 
 */


public class TestRombo {
	
	public static void main (String[] args) {
	
		Rombo rombo1=null;
		Rombo x=null;
		try
		{
		
			rombo1=new Rombo(0.0,2.0);
			x=new Rombo(1.0,4.0);
		}catch(ExcepcionRombo mensaje)
		{
			System.out.println(mensaje);
		}
		System.out.println("Diagonal 1: "+rombo1.getDiagonal1());
		rombo1.setDiagonal1(2.0);
		System.out.println("Nueva Diagonal 1: "+rombo1.getDiagonal1());
		System.out.println("Diagonal 2: "+rombo1.getDiagonal2());
		rombo1.setDiagonal2(5.0);
		System.out.println("Nueva Diagonal 2: "+rombo1.getDiagonal2());
		System.out.println("Lado: "+rombo1.getLado());
		System.out.println("Perimetro: "+rombo1.getPerimetro());
		System.out.println("Area: "+rombo1.getArea());
		System.out.println("toString: "+rombo1.toString());
		System.out.println("HashCode: "+rombo1.hashCode());
		System.out.println("compare To:"+rombo1.compareTo(x));
		System.out.println("Equals: "+rombo1.equals(x));
		System.out.println("Clone: "+rombo1.clone());
	
		
	}
}

