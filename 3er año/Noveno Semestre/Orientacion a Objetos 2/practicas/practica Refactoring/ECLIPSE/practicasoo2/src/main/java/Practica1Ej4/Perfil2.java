package Practica1Ej4;

import java.util.ArrayList;

public class Perfil2 {
	private boolean verificado;
	private ArrayList<Publicacion2> publicaciones;

	public Perfil2(boolean verificado) {
		this.verificado = verificado;
		this.publicaciones = new ArrayList<>();
	}

	public void agregarPublicacion(Publicacion2 publicacion) { publicaciones.add(publicacion); }

	private int bonus() { return verificado ? 2 : 1; }

	private int alcanceDePublicaciones() {
		return publicaciones.stream().mapToInt(p -> p.alcance()).sum();
	}

	public int alcance() {
		return alcanceDePublicaciones() * bonus();
	}
}
