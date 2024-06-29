import java.util.List;

public class enunciado13AG {

    public Integer resolver(GeneralTree<Integer> arbol, int min, int max) {
        Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
        List<Integer> lista_numeros = new LinkedList<Integer>();
        if (!arbol.isEmpty()) {
            cola.enqueue(arbol);
            cola.enqueue(null);
            while (!cola.isEmpty()) {
                GeneralTree<Integer> nodo = cola.dequeue();
                if (nodo != null) {
                    int num = nodo.getData();
                    if (num >= min && num <= max) {
                        lista_numeros.add(num);
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
            if (lista_numeros.size() == 0) {
                return 0;
            }
            int suma = 0;
            for (int num: lista_numeros) {
                suma += num;
            }
            return (suma / lista_numeros.size());
        } else {
            return 0;
        }
    }
}
