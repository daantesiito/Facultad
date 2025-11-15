/**
 * 
 */
package tp5;

import java.util.LinkedList;
import java.util.List;

/**
 * 
 */
public class parcial14junio2025 {

	public List<String> rutaOptimaDistribucion(Graph<String> reino, String castillo, String aldea, int maxPociones) {
		LinkedList<String> camino = new LinkedList<String>();
		LinkedList<String> caminoActual = new LinkedList<String>();
		boolean[] marca = new boolean[reino.getSize()];
		int cantPociones = 0;
		Vertex<String> Vcastillo = reino.search(castillo);
		if (Vcastillo != null) {
			Vertex<String> Valdea = reino.search(aldea);
			if (Valdea != null) {
				dfs(reino, Vcastillo, Valdea, camino, caminoActual, marca, maxPociones, cantPociones);
			}
		}
		return camino;
	}
	
	private void dfs(Graph<String> reino, Vertex<String> vertice, Vertex<String> Valdea, LinkedList<String> camino, LinkedList<String> caminoActual, boolean[] marca, int maxPociones, int cantPociones) {
		marca[vertice.getPosition()] = true;
		caminoActual.add(vertice.getData());
		if (vertice.equals(Valdea) && caminoActual.size() > camino.size()) {
			camino.clear();
			camino.addAll(caminoActual);
		}
		else {
			List<Edge<String>> ady = reino.getEdges(vertice);
			for (Edge<String> a: ady) {
				if (cantPociones + a.getWeight() <= maxPociones && !marca[a.getTarget().getPosition()]) {
					dfs(reino, a.getTarget(), Valdea, camino, caminoActual, marca, maxPociones, cantPociones + a.getWeight());
				}
			}
		}
		marca[vertice.getPosition()] = false;
		caminoActual.remove(caminoActual.size() - 1);
	}
}
