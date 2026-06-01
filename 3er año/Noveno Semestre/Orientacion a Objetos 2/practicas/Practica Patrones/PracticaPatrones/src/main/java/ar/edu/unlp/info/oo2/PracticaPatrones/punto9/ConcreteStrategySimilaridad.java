package ar.edu.unlp.info.oo2.PracticaPatrones.punto9;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class ConcreteStrategySimilaridad extends SugerenciaStrategy {

	public List<Pelicula> obtenerSugerencias(ContextDecodificador deco) {
		return deco.getGrilla().stream()
				.filter(p -> !deco.getReproducidas().contains(p))
				.filter(p -> deco.getReproducidas().stream()
						.anyMatch(reproducida -> reproducida.getPelisSimilares().contains(p)))
				.sorted(Comparator.comparing(Pelicula::getAnoEstreno).reversed())
				.limit(3)
				.collect(Collectors.toList());
	}

}