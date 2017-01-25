public class ClaseCerrojo {
	
	private int num1;
	private int num2;
	private int num3;
	
	private int combinacion;
	
	private int cerrojo;
	
	//Constructor para el valor por defecto
	public ClaseCerrojo() {
		num1 = 0;
		num2 = 0;
		num3 = 0;
	}
	
	//Constructor para cuando introducimos 3 números
	public ClaseCerrojo(int nNum1, int nNum2, int nNum3){
		num1 = nNum1;
		num2 = nNum2;
		num3 = nNum3;
	}
	
	//GET
	public int getNum1(){
		return num1;
	}
	
	public int getNum2(){
		return num2;
	}
	
	public int getNum3(){
		return num3;
	}
	
	public int getCombinacion(){
		num1 = num1 * 100;
		num2 = num2 * 10;
		num3 = num3 * 1;
		
		combinacion = num1 + num2 + num3;
		
		return combinacion;
	}
	
	
	//SET
	public void setNum1(int nNum1){
		num1 = nNum1;
	}
	
	public void setNum2(int nNum2){
		num2 = nNum2;
	}
	
	public void setNum3(int nNum3){
		num3 = nNum3;
	}
}

