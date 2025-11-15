package tp5;

import java.util.*;

public class ej4 {
	public List<String> paseoEnBici(Graph<String> lugares, String destino, int maxTiempo, List<String> lugaresRestringidos) {
		List<String> resultado = new ArrayList<String>();
		
		if (lugares != null && !lugares.isEmpty()) {
			
			Vertex<String> origen = lugares.search("Ayuntamiento");
			if (origen != null) {
				
				Vertex<String> desti = lugares.search(destino);
				
				if (desti != null) {

					boolean [] marcas = new boolean[lugares.getSize()];
					
					marcarRestricciones(lugares, lugaresRestringidos, marcas);
					List<String> temporal = new ArrayList<String>();
					int total = 0;
					dfs(lugares, origen, maxTiempo, marcas, destino, resultado, temporal, total);
					
					}
				}
			}
		
		return resultado;
	}
	
	private void marcarRestricciones(Graph<String> lugares, List<String> lugaresRestringidos, boolean[] marcas) {
		for (String lugar : lugaresRestringidos) {
			Vertex<String> x = lugares.search(lugar);
			
			if ( x != null) {
				marcas[x.getPosition()] = true;
			}
		}
	}
	
	private void dfs (Graph<String> lugares, Vertex<String> v, int maxTiempo, boolean[] marcas, String destino, List<String> resultado ,List<String> temporal, int total) {
		marcas [v.getPosition()] = true;
		
		temporal.add(v.getData());
		
		if (v.getData().equals(destino)) {
			resultado.addAll(temporal);
		}
		else {
			List<Edge<String>> adyacentes = lugares.getEdges(v);
			Iterator<Edge<String>> it = adyacentes.iterator();
			while (it.hasNext() && resultado.isEmpty()) {
				Edge<String> e = it.next();
				int j = e.getTarget().getPosition();
				if (!marcas[j]) {
					int parcial = e.getWeight();
					if (total + parcial <= maxTiempo) {
						dfs(lugares, e.getTarget(), maxTiempo, marcas, destino, resultado, temporal, total + parcial);
					}
				}
			}
		
		}
		temporal.remove(resultado.size() - 1);
		marcas[v.getPosition()] = false;
		
	}
	
}
