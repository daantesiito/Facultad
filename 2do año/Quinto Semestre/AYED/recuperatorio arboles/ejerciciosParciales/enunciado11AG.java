import java.util.ArrayList;
import java.util.List;

public class enunciado11AG {
    
    public List<GeneralTree<Integer>> resolver(GeneralTree<Integer> arbol) {
        List<GeneralTree<Integer>> lista = new ArrayList<>();
        resolver(arbol, lista);
        return lista;
    }

    private static void resolver(GeneralTree<Integer> arbol, List<GeneralTree<Integer>> lista) {
        if (arbol.hasChildren()) {
            List<GeneralTree<Integer>> children = arbol.getChildren();
            if (children.size() % 2 == 0) {
                lista.add(arbol);
            }
            for (GeneralTree<Integer> child : children) {
                resolver(child, lista);
            }
        }
    }
}
