package tp5;

import java.util.LinkedList;
import java.util.List;

public class ObtenerVerticeDeClase {

	@SuppressWarnings("unused")
	private List<Vertex<UsuarioParcialBFS>> Obtener(Graph<UsuarioParcialBFS> grafo) {
		List<Vertex<UsuarioParcialBFS>> vertices = grafo.getVertices();
		List<Vertex<UsuarioParcialBFS>> resultado = new LinkedList<Vertex<UsuarioParcialBFS>>();
		for (Vertex<UsuarioParcialBFS> v : vertices) {
			if (v.getData().getNombre() == "Prueba") {
				resultado.add(v);
			}
		}
		return resultado;
	}
	
	@SuppressWarnings("unused")
	private void marcarRestringidos(List<String> lugaresRestringidos, Graph<String> lugares, boolean[] marcas) {
        for (String l: lugaresRestringidos) {
            Vertex<String> lugar = lugares.search(l);
            if (lugar != null)
                marcas[lugar.getPosition()] = true;
        }
    }
	
}
