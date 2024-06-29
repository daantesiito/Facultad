public class enunciado6AG {
    
    public List<Integer> camino_a_hoja_mas_lejana(GeneralTree<Integer> arbol) {
        List<Integer> caminoAct = new ArrayList<Integer>();
        List<Integer> caminoMax = new ArrayList<Integer>();
        if (!arbol.isEmpty()) {
            recursion(arbol,caminoAct,caminoMax);
        }
        return caminoMax;
    }

    private void recursion(GeneralTree<Integer> arbol, List<Integer> caminoAct, List<Integer> caminoMax) {
        caminoAct.add(arbol.getData());
        if (arbol.isLeaf()) {
            if (caminoAct.size() > caminoMax.size()) {
                caminoMax.removeAll();
                caminoMax.addAll(caminoAct);
            }
        } else {
            List<GeneralTree<Integer>> children = arbol.getChildren();
            for (GeneralTree<Integer> child : children) {
                recursion(child,caminoAct,caminoMax);
            }
        }
        caminoAct.remove(caminoAct.size() - 1);
    }

}
