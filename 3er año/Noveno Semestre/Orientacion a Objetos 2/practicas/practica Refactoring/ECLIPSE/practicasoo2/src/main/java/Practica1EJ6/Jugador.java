package Practica1EJ6;

public class Jugador {
	private String nombre;
	private String apellido;
	private int puntuacion = 0;
	
	private static final int INCREMENTO_PUNTUACION = 100;
	private static final int DECREMENTO_PUNTUACION = 50;
	
	public void incrementar() {
		puntuacion = puntuacion + INCREMENTO_PUNTUACION;
	}
	
	public void decrementar() {
		puntuacion = puntuacion - DECREMENTO_PUNTUACION;
	}
	
}
