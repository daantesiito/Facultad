package ar.edu.unlp.info.oo2.PracticaPatrones.punto9;

import java.util.List;

public abstract class SugerenciaStrategy {

	public abstract List<Pelicula> obtenerSugerencias(ContextDecodificador deco);
	
}
