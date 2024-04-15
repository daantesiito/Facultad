package practica2.tp2.ejercicio1;

public class Ejercicio1 {
    public static BinaryTree<DosEnt> sumAndDif(BinaryTree<Integer> arbol) {
        BinaryTree<DosEnt> nuevo = new BinaryTree<DosEnt>(null);
        if (!arbol.isEmpty())
            sumAndDif(arbol, nuevo, arbol.getData(), 0);
        return nuevo;
    }
    
    private static void sumAndDif(BinaryTree<Integer> a, BinaryTree<DosEnt> nuevo, int suma, int padre) {
        nuevo.addLeftChild(new BinaryTree<DosEnt>(new DosEnt(suma, a.getData() - padre)));
        if (a.getLeftChild() != null) {
            sumAndDif(a.getLeftChild(), nuevo.getLeftChild(), suma + a.getLeftChild().getData(), a.getData());
        }
        if (a.getRightChild() != null) {
            sumAndDif(a.getRightChild(), nuevo.getRightChild(), suma + a.getRightChild().getData(), a.getData());
        }
    }
    
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree<>(5);
        arbol.addLeftChild(new BinaryTree<>(3));
        arbol.addRightChild(new BinaryTree<>(8));
        arbol.getLeftChild().addLeftChild(new BinaryTree<>(2));
        arbol.getLeftChild().addRightChild(new BinaryTree<>(4));
        arbol.getRightChild().addLeftChild(new BinaryTree<>(7));
        arbol.getRightChild().addRightChild(new BinaryTree<>(10));

        BinaryTree<DosEnt> nuevoArbol = Ejercicio1.sumAndDif(arbol);
    }

}
