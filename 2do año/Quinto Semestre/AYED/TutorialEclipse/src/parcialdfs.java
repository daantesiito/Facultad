public class parcialdfs {

    public List<List<String>> resolver(Grafo<String> ciudades, String origen, String destino, int maxKilometros) {
        List<List<String>> listaCaminos = new LinkedList<List<String>>();
        List<String> listaAct = new LinkedList<String>();
        if (!ciudades.isEmpty()) {
            Vertex<String> or = ciudades.search(origen);
            Vertex<String> des = ciudades.search(des);
            if (or != null || des != null) {
                dfs(ciudades,or,des,listaCaminos,listaAct,maxKilometros, new boolean[ciudades.getSize()]);
            }
            else {
                listaCaminos = null;
            }
        }
        return listaCaminos;
    }

    private void dfs(Graph<String> ciudades, Vertex<String> origen, Vertex<String> destino, List<List<String>> listaCaminos, List<String> listaAct, int maxKilometros, boolean[] marcas) {
        marcas[origen.getPosition()] = true;
        listaAct.add(origen.getData());
        if (origen == destino) {
            listaCaminos.add(new LinkedList(listaAct));
        }
        else {
            List<Edges<String>> adyacentes = ciudades.getEdges(origen);
            for (Edge<String> ady: adyacentes) {
                Vertex<String> v = ady.getTarget();
                int peso = maxKilometros - ady.getWeight();
                if (v != null && peso > 0) {
                    dfs(ciudades,v,destino,listaCaminos,listaAct,peso,marcas);
                }
            }
        }
        marcas[origen.getPosition()] = false;
        listaAct.remove(listaAct.getSize() - 1);
    }
}
