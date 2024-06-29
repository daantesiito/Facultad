public class enunciado14AG {
    
    public List<Integer> resolver(int valor, GeneralTree<Integer> arbol) {
        Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
        List<Integer> lista = new ArrayList<Integer>();
        int nivel = 0;
        cola.enqueue(arbol);
        cola.enqueue(null);
        while (!cola.isEmpty()) {
            GeneralTree<Integer> nodo = cola.dequeue();
            if (nodo != null) {
                int numero = nodo.getData();
                if (numero > valor) {
                    lista.add(numero, nivel);
                }
                if (!nodo.isLeaf()) {
                    List<GeneralTree<Integer>> children = nodo.getChildren();
                    for (GeneralTree<Integer> child: children) {
                        cola.enqueue(child);
                    }
                }
            } else {
                if (!cola.isEmpty()) {
                    cola.enqueue(null);
                    nivel += 1;
                }
            }
        }
        return lista;
    }

}
