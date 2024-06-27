//Implemente en la clase ParcialArboles el método:
//public static boolean esDeSeleccion (GeneralTree<Integer> arbol)
//que devuelve true si el árbol recibido por parámetro es de selección, falso sino lo es.
//Un árbol general es de selección si cada nodo tiene en su raíz el valor del menor de sus hijos.Por


public class ej9AG {
    
    public static boolean esDeSeleccion (GeneralTree<Integer> arbol) {
        List<Integer> lista = new LinkedList<Integer>();
        Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
        Integer num_raiz = arbol.getData();
        cola.enqueue(arbol);
        cola.enqueue(null);
        while (!cola.isEmpty()) {
            GeneralTree<Integer> nodo = cola.dequeue;
            if (nodo != null) {
                Integer num = nodo.getData();
                if (nodo.isLeaf() && num == num_raiz) {
                    return true;
                }
                List<GeneralTree<Integer>> childs = new LinkedList<GeneralTree<Integer>>();
                for (GeneralTree<Integer> child: childs) {
                    cola.enqueue(child);
                }
            }
            else {
                if (!cola.isEmpty()) {
                    cola.enqueue(null);
                }
        }
        return false;
    }
}
