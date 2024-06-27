import java.util.LinkedList;
import java.util.List;

// NO TERMINADO, ME GANÓ EL EJERCICIO.

public class ej7AB {

    public BinaryTree<Integer> arbol;

    public boolean isLeftTree(int num) {
        boolean encontro = false;
        BinaryTree<Integer> raiz = buscarNum(arbol,num,encontro);
        if (raiz != null) {
            int izq = 0;
            int der = 0;
            isLeftTreeRecursivo(raiz,lista,der,izq);
            if (izq > der) {
                return true;
            }
        }
        return false;
    }

    private BinaryTree<Integer> buscarNum(BinaryTree<Integer> arbol, int num, boolean encontro) {
        if (arbol.getData() == num) {
            encontro = true;
            return arbol;
        }
        else {
            if (!encontro) {
                if (arbol.hasLeftChild()) {
                    return buscarNum(arbol.getLeftChild(), num, encontro);
                }
                if (arbol.hasRightChild()) {
                    return buscarNum(arbol.getRightChild(), num, encontro);
                }
            }
        }
    }


    private static void isLeftTreeRecursivo(BinaryTree<Integer> raiz) {
        if (!raiz.isLeaf()) {
            if (raiz.hasLeftChild() && !raiz.hasRightChild() || !raiz.hasLeftChild() && raiz.hasRightChild()) {
                izq++;
                isLeftTreeRecursivo(raiz.getLeftChild(), lista, der, izq);
            }
        }
    }
}