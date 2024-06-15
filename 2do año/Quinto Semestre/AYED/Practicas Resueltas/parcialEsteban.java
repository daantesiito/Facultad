public class parcialEsteban {
    
    public List<List<String>> resolver(Graph<String> ciudades,String origen, String destino, int maxKilometros) {
        List<String> caminoAct = new LinkedList<String>();
        List<List<String>> caminos = new LinkedList<List<String>>();
        if (!ciudades.isEmpty()) {
            Vertex<String> or = ciudades.search(origen);
            Vertex<String> des = ciudades.search(destino);
            if (or != null && des != null) {
                dfs(ciudades,or,des,caminoAct,caminos,new boolean[ciudades.getSize()], maxKilometros);
            }
        }
        return caminos;
    }

    /* este buscar no es de este ejercicio.
    private Vertex<String> buscar(Graph<Ciudad> grafo, String origen) {
        List<Vertex<String>> vertices = grafo.getVertices();
        Iterator<Vertex<String>> it = vertices.iterator();
        Vertex<String> ciu = null;
        boolean sigo = true;
        while (it.hasNext() && sigo) {
            Vertex<String> aux = it.next();
            if (aux.getData().getCiudad().equals(ciu)) {
                ciu = aux;
                sigo = true;
            }
        }
        return ciu;
    }
    */

    private void dfs(Graph<String> ciudades,Vertex<String> origen, Vertex<String> destino, List<String> caminoAct, List<List<String>> caminos, boolean[] marcas, int maxKilometros) {
        marcas[origen.getPosition()] = true;
        caminoAct.add(origen);
        if (origen == destino) {
            caminos.add(new LinkedList(caminoAct));
        }
        else {
            List<Edge<String>> adyacentes = ciudades.getEdges(origen);
            for (Edge<String> s: adyacentes) {
                Vertex<String> vertice = s.getTarget();
                int peso = maxKilometros - s.getWeight();
                if (vertice != null && peso > 0) {
                    dfs(ciudades,vertice,destino,caminoAct,caminos,marcas,peso);
                }
            }
        }
        marcas[origen.getPosition()] = false;
        caminoAct.remove(caminoAct.getSize()-1);
    }
}
