package tp5;

import java.util.LinkedList;
import java.util.List;

public class parcialMapaTurismo {
	
	public List<String> resolver(Graph<CiudadParcial> mapa, String ciudad, int cantDiasVacas) {
		LinkedList<String> camino = new LinkedList<String>();
		LinkedList<String> caminoMax = new LinkedList<String>();
		boolean[] marca = new boolean[mapa.getSize()];
		Vertex<CiudadParcial> Vciudad = mapa.search(ciudad);
	}
}
