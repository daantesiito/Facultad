//Dada una clase Caminos que contiene una variable de instancia de tipo GeneralTree de números
//enteros, implemente un método que retorne el camino a la hoja más lejana. En el caso de haber
//más de un camino máximo retorne el primero que encuentre.
//El método debe tener la siguiente firma: public List<Integer> caminoAHojaMasLejana ()

public class Caminos { // ejercicio7AG

    private GeneralTree<Integer> arbol;

    public Caminos(GeneralTree<Integer> arbol) {
        this.arbol = arbol;
    }

    public List<Integer> caminoAHojaMasLejana() {
        List<Integer> camino_actual = new LinkedList<Integer>();
        List<Integer> camino_maximo = new LinkedList<Integer>();
        if (!arbol.isEmpty()) {
            caminoAHojaMasLejana(arbol,camino_actual,camino_maximo);
        }
        return camino_maximo;
    }

    private static void caminoAHojaMasLejana(GeneralTree<Integer> arbol, List<Integer> camino_actual,List<Integer> camino_maximo) {
        camino_actual.add(arbol.getData());
        if (arbol.isLeaf()) {
            if (camino_actual.size() > camino_maximo.size()) {
                camino_maximo.removeAll(camino_maximo);
                camino_maximo.addAll(camino_actual);
            }
        } else {
            List<GeneralTree<Integer>> children = arbol.getChildren();
            for (GeneralTree<Integer> child: children) {
                caminoAHojaMasLejana(child, camino_actual, camino_maximo);
            }
            camino_actual.remove(camino_actual.size() - 1);
        }
    }

}