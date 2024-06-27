import java.util.List;

public class parcial15juniotema2 {

    public GeneralTree<Integer> arbol;

    public List<Integer> nivel(int num) {
        List<Integer> lista = new LinkedList<Integer>();
        Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
        cola.enqueue(arbol);
        cola.enqueue(null);
        boolean encontro = false;
        while (!cola.isEmpty() && !encontro) {
            GeneralTree<Integer> nodo = cola.dequeue();
            if (nodo != null) {
                if (nodo.hasChildren()) {
                    List<GeneralTree<Integer>> childs = nodo.getChildren();
                    if (childs.size() >= num) {
                        lista.add(nodo.getData());
                    }
                    for (GeneralTree<Integer> child: childs) {
                        cola.enqueue(child);
                    }
                }
            }
            else {
                if (lista.size() > 0) {
                    encontro = true;
                }
                if (!cola.isEmpty()) {
                    cola.enqueue(null);
                }
            }
        }
        return lista;
    }

}