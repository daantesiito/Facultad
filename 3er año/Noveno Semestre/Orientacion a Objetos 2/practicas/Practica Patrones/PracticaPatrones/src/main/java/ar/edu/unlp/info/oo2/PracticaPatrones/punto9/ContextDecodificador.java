package ar.edu.unlp.info.oo2.PracticaPatrones.punto9;

import java.util.ArrayList;
import java.util.List;

public class ContextDecodificador {

	private List<Pelicula> peliculas;
	private List<Pelicula> peliculasReproducidas;
	private SugerenciaStrategy criterio;
	
	public ContextDecodificador() {
	    this.peliculas = new ArrayList<>();
	    this.peliculasReproducidas = new ArrayList<>();
	    this.criterio = null;
	}
	
	public void addPelicula(Pelicula peli) {
		this.peliculas.add(peli);
	}
	
	public void addPeliculaReproducida(Pelicula peli) {
		this.peliculasReproducidas.add(peli);
	}
	
	public List<Pelicula> getGrilla() {
		return this.peliculas;
	}
	
	public List<Pelicula> getReproducidas() {
		return this.peliculasReproducidas;
	}
	
	public void setCriterio(SugerenciaStrategy criterio) {
		this.criterio = criterio;
	}
	
	
}
