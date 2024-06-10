import java.util.*;

public class VisitaOslo {

    public List<String> paseoEnBici(Graph<String> lugares, String destino, int maxTiempo, List<String> lugaresRestringidos) {
        
        List<String> camino = new LinkedList<>();
        
        // Inicializa el tiempo acumulado y otras variables
        int tiempoAct = 0;
        
        if (!lugares.isEmpty()) {
            
            Vertex<String> origen = lugares.search("Ayuntamiento");
            
            Vertex<String> verticeDestino = lugares.search(destino);
            
            if (origen != null && verticeDestino != null) {
                
                boolean[] marcas = new boolean[lugares.getSize()];
                
                marcarRestringidos(lugaresRestringidos, marcas, lugares);
                
                List<String> caminoAct = new LinkedList<>();
                
                if (dfs(origen, verticeDestino, marcas, caminoAct, camino, lugares, maxTiempo, tiempoAct)) {
                    return camino;
                }
            }
        }
        
        return new LinkedList<>();  // Retorna una lista vacía si no se encuentra un camino válido
    }
    
    private void marcarRestringidos(List<String> lugaresRestringidos, boolean[] marcas, Graph<String> lugares) {
        
        for (String s : lugaresRestringidos) {
            
            Vertex<String> lugar = lugares.search(s);
            
            if (lugar != null) {
                marcas[lugar.getPosition()] = true;
            }
        }
    }
    
    private boolean dfs(Vertex<String> origen, Vertex<String> destino, boolean[] marcas, List<String> caminoAct, List<String> camino, Graph<String> lugares, int maxTiempo, int tiempoAct) {
        
        marcas[origen.getPosition()] = true;
        caminoAct.add(origen.getData());
        
        if (origen.equals(destino)) {
            camino.add(new LinkedList<String>(caminoAct));
            return true; // Camino encontrado
        }
        
        List<Edge<String>> adyacentes = lugares.getEdges(origen);
        
        for (Edge<String> a : adyacentes) {
            Vertex<String> vecino = a.getTarget();
            int peso = a.getWeight();
            
            if (!marcas[vecino.getPosition()] && (tiempoAct + peso) <= maxTiempo) {
                if (dfs(vecino, destino, marcas, caminoAct, camino, lugares, maxTiempo, tiempoAct + peso)) {
                    return true; // Camino encontrado
                }
            }
        }
        
        // Retroceder en la recursión (backtracking)
        caminoAct.remove(caminoAct.size() - 1);
        marcas[origen.getPosition()] = false;
        
        return false; // No se encontró un camino en esta ruta
    }
}
