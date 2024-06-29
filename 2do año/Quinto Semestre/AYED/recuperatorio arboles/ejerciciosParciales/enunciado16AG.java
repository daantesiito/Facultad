import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class enunciado16AG {
    
    public GeneralTree<Integer> arbol;

    public List<Integer> resolver() {
        Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
        List<Integer> numeros = new LinkedList<Integer>();
        cola.enqueue(arbol);
        cola.enqueue(null);
        while (!cola.isEmpty()) {
            GeneralTree<Integer> nodo = cola.dequeue();
            if (nodo != null) {
                int num = nodo.getData();
                if (nodo.isLeaf() && num % 2 == 0) {
                    numeros.add(num);
                }
                if (nodo.hasChildren()) {
                    List<GeneralTree<Integer>> children = nodo.getChildren();
                    for (GeneralTree<Integer> child: children) {
                        cola.enqueue(child);
                    }
                }
            } else {
                if (!cola.isEmpty()) {
                    cola.enqueue(null);
                }
            }
        }
        return numeros;
    }
}