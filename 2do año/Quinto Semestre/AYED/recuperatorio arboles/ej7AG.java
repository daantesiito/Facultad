import java.util.ArrayList;
import java.util.List;

public class ej7AG {

    public GeneralTree<Integer> arbol;

    public List<Integer> caminoAHojaMasLejana() {
        List<Integer> caminoAct = new ArrayList<>();
        List<Integer> caminoMax = new ArrayList<>();
        encontrarCamino(arbol, caminoAct, caminoMax);
        return caminoMax;
    }

    public static void encontrarCamino(GeneralTree<Integer> arbol, List<Integer> caminoAct, List<Integer> caminoMax) {
        caminoAct.add(arbol.getData());
        if (caminoAct.size() > caminoMax.size()) {
            caminoMax.clear();
            caminoMax.addAll(caminoAct);
        }
        if (!arbol.isLeaf()) {
            List<GeneralTree<Integer>> children = arbol.getChildren();
            for (GeneralTree<Integer> child : children) {
                encontrarCamino(child, caminoAct, caminoMax);
            }
        } 
        caminoAct.remove(caminoAct.size() - 1);
    }

    public static void main(String[] args) {
        // Crear el árbol y agregar nodos
        GeneralTree<Integer> tree = new GeneralTree<>(12);
        GeneralTree<Integer> node17 = tree.addChild(17);
        GeneralTree<Integer> node9 = tree.addChild(9);
        GeneralTree<Integer> node15 = tree.addChild(15);
        node17.addChild(10);
        GeneralTree<Integer> node6 = node17.addChild(6);
        node6.addChild(1);
        node9.addChild(8);
        GeneralTree<Integer> node14 = node15.addChild(14);
        node15.addChild(18);
        node14.addChild(16);
        node14.addChild(7);

        ej7AG ej7 = new ej7AG();
        ej7.arbol = tree;
        List<Integer> camino = ej7.caminoAHojaMasLejana();
        System.out.println(camino); // Imprimir el camino más largo
    }
}

class GeneralTree<T> {
    private T data;
    private List<GeneralTree<T>> children;

    public GeneralTree(T data) {
        this.data = data;
        this.children = new ArrayList<>();
    }

    public T getData() {
        return data;
    }

    public List<GeneralTree<T>> getChildren() {
        return children;
    }

    public GeneralTree<T> addChild(T childData) {
        GeneralTree<T> child = new GeneralTree<>(childData);
        this.children.add(child);
        return child;
    }

    public boolean isLeaf() {
        return children.isEmpty();
    }
}
