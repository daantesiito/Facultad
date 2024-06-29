public class enunciado4AB {
    
    public BinaryTree<Integer> arbol;

    public BinaryTree<Integer> minEnNivelAB(int n) {
        Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();
        int nivel = 0;
        BinaryTree<Integer> minimo = null;
        cola.enqueue(arbol);
        cola.enqueue(null);
        while (!cola.isEmpty()) {
            BinaryTree<Integer> nodo = cola.dequeue();
            if (nodo != null) {
                if (nodo.isLeaf() && nivel == n) {
                    if (minimo == null || minimo.getData() > nodo.getData()) {
                        minimo = nodo;
                    }
                } else {
                    if (nodo.hasLeftChild()) {
                        cola.enqueue(nodo.getLeftChild());
                    }
                    if (nodo.hasRightChild()) {
                        cola.enqueue(nodo.getRightChild());
                    }
                }
            } else {
                if (!cola.isEmpty()) {
                    cola.enqueue(null);
                    nivel += 1;
                }
            }
        }
        return minimo;
    }

}
