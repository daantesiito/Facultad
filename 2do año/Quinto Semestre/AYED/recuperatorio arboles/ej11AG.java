public class ej11AG {
    
    public static boolean resolver(GeneralTree<Integer> arbol) {
        Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
        int nodosNivel = 0;
        int nodosNivelAnt = 0;
        boolean sigue = true;
        cola.enqueue(arbol);
        cola.enqueue(null);
        while (!cola.isEmpty() && sigue) {
            GeneralTree<Integer> nodo = cola.dequeue();
            if (nodo != null) {
                nodosNivel += 1;
                List<GeneralTree<Integer>> children = nodo.getChildren();
                for (GeneralTree<Integer> child: children) {
                    cola.enqueue(child);
                }
            } else {
                if (!cola.isEmpty()) {
                    if (nodoNivel == nodosNivelAnt + 1) {
                        cola.enqueue(null);
                        nodosNivelAnt = nodosNivel;
                        nodosNivel = 0;
                    } else {
                        sigue = false;
                    }
                }
            }
        }
        return sigue; // Si desencolamos un null y la cola esta vacia, retornamos sigue = true;
        // Si en algun momento la cantidad de nodos del nivel, es diferente a la anterior + 1, se devuelve sigue = false;
    }

}
