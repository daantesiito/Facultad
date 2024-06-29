public class parcial15junioTema1 {

    public GeneralTree<Integer> arbol;
    
    public List<Integer> camino (int num) {
        List<Integer> lista = new LinkedList<Integer>();
        if (!arbol.isEmpty()) {
            recursion(arbol,lista,num);
        }
        return lista;
    }

    private boolean recursion(GeneralTree<Integer> arbol, List<Integer> lista, int num) {
        boolean encontro = false;
        lista.add(arbol.getData());
        if (!arbol.isLeaf()) {
            List<GeneralTree<Integer>> children = arbol.getChildren();
            if (children.size() >= num) {
                Iterator<GeneralTree<Integer>> it = children.iterator();
                while (it.hasNext() && !encontro) {
                    encontro = recursion(it.next(), lista, num);
                }
            }
        } else {
            return true;
        }
        if (!encontro) {
            lista.remove(lista.size()-1);
        }
        return encontro;
    }
}
