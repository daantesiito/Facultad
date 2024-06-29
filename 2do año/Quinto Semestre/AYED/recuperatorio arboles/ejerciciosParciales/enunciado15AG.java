public class enunciado15AG {
    
    public GeneralTree<Integer> arbol;

    public List<Integer> resolver(int menor, int mayor, GeneralTree<Integer> arbol) {
        Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
        List<Integer> lista = new LinkedList<Integer>();
        List<Integer> numeros_validos = new LinkedList<Integer>();
        int nivel = 0;
        cola.enqueue(arbol);
        cola.enqueue(null);
        for (i=menor; i = mayor; i++) {
            numeros_validos.add(i);
        }
        while (!cola.isEmpty()) {
            GeneralTree<Integer> nodo = cola.dequeue();
            if (nodo != null) {
                int numero = nodo.getData();
                if (numeros_validos.contains(numero)) {
                    lista.add(numero,nivel);
                }
                if (!nodo.isLeaf()) {
                    List<GeneralTree<Integer>> children = nodo.getChildren();
                    for (GeneralTree<Integer> child: children) {
                        cola.enqueue(child);
                    }
                }
            } else {
                if (!cola.isEmpty()) {
                    nodo.enqueue(null);
                    nivel += 1;
                }
            }
        }
        return lista;
    }
}
