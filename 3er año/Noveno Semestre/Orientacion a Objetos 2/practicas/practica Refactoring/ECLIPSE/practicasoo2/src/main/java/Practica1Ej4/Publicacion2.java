package Practica1Ej4;

public class Publicacion2 {
	private String texto;
	private int likes;
	
	public Publicacion2(String texto) {
		this.texto = texto;
		this.likes = 0;
	}
	
	public void darLike() { likes++; }
	
	public void darDislike() { likes--; }
	
	private int impacto() {
		return likes * 3;
	}
	
	public int alcance() {
		return impacto() * 10;
	}
}