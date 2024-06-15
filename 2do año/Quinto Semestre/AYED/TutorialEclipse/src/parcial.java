public class parcial {

    

    public boolean istwotree(int num) {
        boolean es = false;
        boolean corta = false;
        BinaryTree<Integer> ab = new BinaryTree<Integer>();
        BinaryTree<Integer> nodo = buscarNum(ab,num,corta);
        if (nodo != null) {
            es = recursion(nodo);
        }
        return es;
    }

    private BinaryTree<Integer> buscarNum(BinaryTree<Integer> ab, int num, boolean corta) {
        if (ab.getData() == num) {
            corta = true;
        }
        if (!ab.isEmpty() && !corta) {
            if (ab.hasLeftChild()) {
                buscarNum(ab.getLeftChild(),num,corta);
            if (ab.hasRightChild()) {
                buscarNum(ab.getRightChild(),num,corta);
        }
        if (corta == true) {
            return ab;
        }
        else {
            return null;
        }
    }

    private boolean recursion(BinaryTree<Integer> raiz) {
        if raiz.hasLeftChild() {
            recursion(raiz.getLeftChild());
        }
    }

}
