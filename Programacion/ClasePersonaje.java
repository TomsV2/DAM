public class ClasePersonaje {
	
	//Atributos básicos
	private String nombre = new String();
	private int ataque;
	private int vida;
	private int agilidad;
	private int nivel;
	private boolean tipo;
	
	//Constructor vacío
	public ClasePersonaje(){
		nombre = "Vacio";
		ataque = 0;
		vida = 0;
		agilidad = 0;
		nivel = 0;
		tipo = true;
	}
	
	//Constructor
	public ClasePersonaje(String nNombre, int nAtaque, int nVida, int nAgilidad, int nNivel, boolean nTipo){
		nombre = nNombre;
		ataque = nAtaque;
		vida = nVida;
		agilidad = nAgilidad;
		nivel = nNivel;
		tipo = nTipo;
	}
	
	//Constructor copia
	public ClasePersonaje(ClasePersonaje personaje){
		nombre = personaje.getNombre();
		ataque = personaje.getAtaque();
		vida = personaje.getVida();
		agilidad = personaje.getAgilidad();
		nivel = personaje.getNivel();
		tipo = personaje.getTipo();
	}
	
	
	//GETS
	public String getNombre(){
		return nombre;
	}
	
	public int getAtaque(){
		return ataque;
	}
	
	public int getVida(){
		return vida;
	}
	
	public int getAgilidad(){
		return agilidad;
	}
	
	public int getNivel(){
		return nivel;
	}
	
	public boolean getTipo(){
		return tipo;
	}
	
	//SETS
	public void setNombre(String nNombre){
		nombre = nNombre;
	}
	
	public void setAtaque(int nAtaque){
		ataque = nAtaque;
	}
	
	public void setVida(int nVida){
		vida = nVida;
	}
	
	public void setAgilidad(int nAgilidad){
		agilidad = nAgilidad;
	}
	
	public void setNivel(int nNivel){
		nivel = nNivel;
	}
	
	public void setTipo(boolean nTipo){
		tipo = nTipo;
	}
	
	//Métodos sobrescritos
	
	@Override
	public String toString(){
		String s = "\nNombre del personaje: " +getNombre() + "\nAtaque: " +getAtaque() + "\nVida: " +getVida() + "\nAgilidad: " +getAgilidad() + "\nNivel del personaje: " +getNivel() + "\nTipo del personaje: " +getTipo();
		return s;
	}
}

