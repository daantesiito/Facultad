public class enunciado5AB {

    public Integer sumaImparesMayorA(BinaryTree<Integer> arbol, int num) {
        if (!arbol.isEmpty()) {
            return sumaImparesMayorARec(arbol,num);
        }
        return 0;
    }

    private Integer sumaImparesMayorARec(BinaryTree<Integer> arbol, int num) {
        int suma = 0;
        int num_nodo = arbol.getData();
        if (num_nodo % 2 != 0 && num_nodo > num) {
            suma += num_nodo;
        }
        if (arbol.hasLeftChild()) {
            suma += sumaImparesMayorARec(arbol.getLeftChild(), num);
        }
        if (arbol.hasRightChild()) {
            suma += sumaImparesMayorARec(arbol.getRightChild(), num);
        }
        return suma;
    }
}
