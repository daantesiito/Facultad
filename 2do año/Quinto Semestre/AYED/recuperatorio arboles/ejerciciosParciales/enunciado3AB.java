public class enunciado3AB {
    
    public List<List<Integer>> caminosPares(BinaryTree<Integer> arbol) {
        List<List<Integer>> lista_caminos = new ArrayList<List<Integer>>();
        List<Integer> camino = new ArrayList<Integer>();
        if (!arbol.isEmpty()) {
            caminosPares(arbol,camino,lista_caminos);
        }
        return lista_caminos;
    }

    private void caminosPares(BinaryTree<Integer> arbol, List<Integer> camino, List<List<Integer>> lista_caminos) {
        camino.add(arbol.getData());
        if (arbol.isLeaf()) {
            if (camino.size() % 2 == 0) {
                lista_caminos.add(new ArrayList<Integer>(camino));
            }
        } else {
            if (arbol.hasLeftChild()) {
                caminosPares(arbol.getLeftChild(), camino, lista_caminos);
            }
            if (arbol.hasRightChild()) {
                caminosPares(arbol.getRightChild(), camino, lista_caminos);
            }
        }
        camino.remove(camino.size() - 1);
    }
}
