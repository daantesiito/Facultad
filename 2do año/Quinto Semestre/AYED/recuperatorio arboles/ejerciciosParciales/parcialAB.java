public class parcialAB {
    
    public List<Integer> resolver(BinaryTree<Integer> arbol, int min) {
        List<Integer> lista = new ArrayList<Integer>();
        boolean encontro = false;
        if (!arbol.isEmpty()) {
            resolverRecursivo(arbol,lista,min,encontro);
        }
        return lista;
    }

    private boolean resolverRecursivo(BinaryTree<Integer> arbol, List<Integer> lista, int min) {
        int num = arbol.getData();
        camino.add(num);
        if (num % 2 == 0) {
            cantPares += 1;
        }
        if (arbol.isLeaf()) {
            if (cantPares >= min) {
                lista.addAll(camino);
                return true;
            }
        } else {
            if (arbol.hasLeftChild()) {
                return resolverRecursivo(arbol.getLeftChild(), lista, min, encontro);
            }
            if (arbol.hasRightChild()) {
                return resolverRecursivo(arbol.getRightChild(), lista, min, encontro);
            }
        }    
        if (lista.size() > 0) {
            camino.remove(camino.size() - 1);
            if (num % 2 == 0) {
                cantPares -= 1;
            }
        }
        return false;
    }
}
