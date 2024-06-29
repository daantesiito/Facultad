import java.util.ArrayList;
import java.util.List;

// Clase del árbol binario
class BinaryTree<T> {
    private T data;
    private BinaryTree<T> leftChild;
    private BinaryTree<T> rightChild;

    // Constructor y métodos necesarios para el árbol binario
    public BinaryTree(T data) {
        this.data = data;
        this.leftChild = null;
        this.rightChild = null;
    }

    public T getData() {
        return data;
    }

    public BinaryTree<T> getLeftChild() {
        return leftChild;
    }

    public void setLeftChild(BinaryTree<T> leftChild) {
        this.leftChild = leftChild;
    }

    public BinaryTree<T> getRightChild() {
        return rightChild;
    }

    public void setRightChild(BinaryTree<T> rightChild) {
        this.rightChild = rightChild;
    }

    public boolean hasLeftChild() {
        return leftChild != null;
    }

    public boolean hasRightChild() {
        return rightChild != null;
    }

    public boolean isEmpty() {
        return data == null;
    }
}

// Clase principal para resolver el ejercicio
public class enunciado7AB {

    public BinaryTree<Integer> arbol;

    public List<Integer> resolver(BinaryTree<Integer> arbol) {
        List<Integer> lista = new ArrayList<>();
        if (!arbol.isEmpty()) {
            recursivo(arbol, lista);
        }
        return lista;
    }

    private int recursivo(BinaryTree<Integer> arbol, List<Integer> lista) {
        int cantIzq = 0;
        int cantDer = 0;

        if (arbol.hasLeftChild()) {
            cantIzq = recursivo(arbol.getLeftChild(), lista);
        }

        if (arbol.hasRightChild()) {
            cantDer = recursivo(arbol.getRightChild(), lista);
        }

        if (cantIzq == cantDer) {
            lista.add(arbol.getData());
        }

        return cantIzq + cantDer + 1;
    }

    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree<>(2);
        arbol.setLeftChild(new BinaryTree<>(1));
        arbol.setRightChild(new BinaryTree<>(5));
        arbol.getLeftChild().setLeftChild(new BinaryTree<>(16));
        arbol.getLeftChild().setRightChild(new BinaryTree<>(6));
        arbol.getRightChild().setRightChild(new BinaryTree<>(8));
        arbol.getRightChild().getRightChild().setLeftChild(new BinaryTree<>(22));

        enunciado7AB instancia = new enunciado7AB();
        List<Integer> resultado = instancia.resolver(arbol);
        System.out.println(resultado); // Debería imprimir [2, 1, 16, 6, 22]
    }
}
