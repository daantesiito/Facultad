public class parcial15junioTema1 {

    public GeneralTree<Integer> arbol;
    
    public List<Integer> camino (int num) {
        List<Integer> lista = new LinkedList<Integer>();
        if (!arbol.isEmpty()) {
            if (camino(arbol,lista,num)) 
                return lista;
            else 
                return null;
        } else {
            return lista;
        }
        
        
    }

    private boolean camino(GeneralTree<Integer> arbol, List<Integer> lista, int num) {
        lista.add(arbol.getData());
        if (!arbol.isLeaf()) {
            if (arbol.hasChildren()) {
                List<GeneralTree<Integer>> children = arbol.getChildren();
                if (children.size() >= num) {
                    for (GeneralTree<Integer> child: children) {
                        if (camino(child,lista,num)) {
                            return true;
                        }
                    }
                }
            }
            else {
                lista.remove(lista.size()-1);
                return false;
            }
        }
    }
}
