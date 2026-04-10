package Practica1Ej4;

import java.util.ArrayList;

public class Perfil {
	private boolean verificado;
	private ArrayList<Publicacion> publicaciones;

	public Perfil(boolean verificado) {
		this.verificado = verificado;
		this.publicaciones = new ArrayList<>();
	}

	public void agregarPublicacion(Publicacion p) { publicaciones.add(p); }

	private int bonus() { return verificado ? 2 : 1; }

	private int alcanceDePublicaciones() {
		return publicaciones.stream().mapToInt(p -> p.calcular()).sum();
	}

	public int calcular() {
		return alcanceDePublicaciones() * bonus();
	}
}
