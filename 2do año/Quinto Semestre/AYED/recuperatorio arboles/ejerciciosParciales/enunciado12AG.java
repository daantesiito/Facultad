public class enunciado12AG {
    
    public Integer resolver(GeneralTree<Integer> arbol) {
        Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
        int total_nivel = 1;
        cola.enqueue(arbol);
        cola.enqueue(null);
        while (!cola.isEmpty()) {
            GeneralTree<Integer> nodo = cola.dequeue();
            if (nodo != null) {
                int num = nodo.getData();
                if (nodo.isLeaf()) {
                    total_nivel *= num;
                }
                if (nodo.hasChildren) {
                    List<GeneralTree<Integer>> children = nodo.getChildren();
                    for (GeneralTree<Integer> child : children) {
                        cola.enqueue(child);
                    }
                }
            } else {
                if (!cola.isEmpty()) {
                    cola.enqueue(null);
                    total_nivel = 1;
                }
            }
        }
        return total_nivel;
    }
}
