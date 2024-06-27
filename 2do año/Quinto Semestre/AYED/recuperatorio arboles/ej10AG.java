import java.util.List;

public class ej10AG {
    
    public static List<Integer> resolver(GeneralTree<Integer> arbol) {
        List<Integer> caminoAct = new LinkedList<Integer>();
        List<Integer> caminoMax = new LinkedList<Integer>();
        int puntajeAct = 0;
        int puntajeMax = 0;
        int nivel = 0;
        recursion(arbol,caminoAct,caminoMax,nivel);
        return caminoMax;
    }

    private static void recursion(GeneralTree<Integer> arbol, List<Integer> caminoAct, List<Integer> caminoMax, int nivel, int puntajeAct, int puntajeMax) {
        if (arbol.getData() == 1) {
            puntajeAct += arbol.getData() * nivel;
            caminoAct.add(arbol.getData());
        }
        if (arbol.isLeaf()) {
            if (puntajeAct > puntajeMax) {
                caminoMax.removeAll(caminoMax);
                caminoMax.addAll(caminoAct);
                puntajeMax = puntajeAct;
            }
        }
        if (arbol.hasChildren()) {
            List<GeneralTree<Integer>> children = arbol.getChildren();
            for (GeneralTree<Integer> child: children) {
                recursion(child, caminoAct, caminoMax, nivel + 1);
            }
        }
        if (arbol.getData() == 1) {
            puntajeAct -= arbol.getData() * nivel;
            caminoAct.remove(caminoAct.size()-1);
        }
    }
}
