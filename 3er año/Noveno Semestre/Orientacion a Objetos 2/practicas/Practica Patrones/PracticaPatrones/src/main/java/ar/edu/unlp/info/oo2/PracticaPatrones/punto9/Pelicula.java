package ar.edu.unlp.info.oo2.PracticaPatrones.punto9;

import java.util.ArrayList;
import java.util.List;

public class Pelicula {

	private String titulo;
	private int anoEstreno;
	private List<Pelicula> peliculasSimilares;
	private double puntaje;
	
	public Pelicula(String titulo, int anoEstreno, double puntaje) {
		this.titulo = titulo;
		this.anoEstreno = anoEstreno;
		this.puntaje = puntaje;
		this.peliculasSimilares = new ArrayList<Pelicula>();
	}
	
	public String getTitulo() {
		return this.titulo;
	}
	
	public int getAnoEstreno() {
		return this.anoEstreno;
	}
	
	public List<Pelicula> getPelisSimilares() {
		return this.peliculasSimilares;
	}
	
	public double getPuntaje() {
		return this.puntaje;
	}
	
	public void addPeliSimilar(Pelicula peli) {
		this.peliculasSimilares.add(peli);
		if (!peli.getPelisSimilares().contains(this)) {
			peli.addPeliSimilar(this);
		}
	}
}
