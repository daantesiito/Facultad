// SE RECORRE RECURSIVAMENTE
// PRIMERA FORMA DE HACERLO (A MI GUSTO LA MEJOR)

    public BinaryTree<Nodo> sumAndDif(BinaryTree<Integer> arbol) {
        BinaryTree<Nodo> nuevoArbol = new BinaryTree<Nodo>(); // el arbol se declara aca ya que si esta dentro del if, habria que hacer mas cosas para devolverlo si llega a ser null
        if (arbol != null && !arbol.isEmpty())
            sumAndDifHelper(BinaryTree<Integer> arbol, BinaryTree<Nodo> nuevoArbol, int suma, int padre) // el arbol se crea aca y al modificarse retorna con el return de abajo el nuevo arbol.
        return (nuevoArbol);
    }

    private void sumAndDifHelper(BinaryTree<Integer> arbol, BinaryTree<Nodo> nuevoArbol, int suma, int padre) {
        Integer numActual = arbol.getData(); // agarro el numero que estoy parado
        nodoNuevoArbol = new Nodo(numActual + suma, numActual - padre); // el arbol.getdata me da el numero el cual estoy parado y creo el nodo + la variable suma que viene de arriba
        arbolNuevo.setData(nodoNuevoArbol); // pongo el dato del arbol en el nuevo arbol
        if (arbol.hasLeftChild()) {
            arbolNuevo.addLeftChild(BinaryTree<Nodo>()); // añado un hijo
            sumAndDifHelper(arbol.getLeftChild(), nuevoArbol.getLeftChild(), suma + numActual, numActual); // llamo a la recursion
        }
            if (arbol.hasRightChild()) {
            arbolNuevo.addRightChild(BinaryTree<Nodo>());
            sumAndDifHelper(arbol.getRightChild(), nuevoArbol.getRightChild(), suma + numActual, numActual);
        }
    }

// SEGUNDA FORMA DE HACERLO, MAS "ELEGANTE"

    public BinaryTree<Nodo> sumAndDif(BinaryTree<Integer> arbol) {
        if (arbol != null && !arbol.isEmpty())
            return sumAndDifHelper(BinaryTree<Integer> arbol, BinaryTree<Nodo> nuevoArbol, 0, 0); // el arbol se crea aca y al modificarse retorna con el return de abajo el nuevo arbol.
        return new BinaryTree<Nodo>();
        }

        private BinaryTree<Nodo> sumAndDifHelper(BinaryTree<Integer> arbol, BinaryTree<Nodo> nuevoArbol, int suma, int padre) {
            Integer numActual = arbol.getData();
            BinaryTree<Nodo> nuevoArbol = new BinaryTree<Nodo>(new Nodo(numActual + suma, numActual - padre));
            if (arbol.hasLeftChild())
                nuevoArbol.addLeftChild(arbol.getLeftChild(), suma + numActual, numActual);
            if (arbol.hasRightChild())
                nuevoArbol.addRightChild(arbol.getRightChild(), suma + numActual, numActual);
            return nuevoArbol;
        }