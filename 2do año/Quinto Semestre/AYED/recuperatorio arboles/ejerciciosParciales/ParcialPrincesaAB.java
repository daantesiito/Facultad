public class Personaje {

    private String tipo;
    private String nombre;

    public Personaje(String tipo, String nombre) {
        this.tipo = tipo;
        this.nombre = nombre;
    }

    // getters y setters.

    public boolean esDragon() {
        return this.tipo.equals("Dragon");
    }

    public boolean esPrincesa() {
        return this.tipo.equals("Princesa");
    }
}

public class ParcialPrincesaAB {

    public Personaje princesaAccesible(BinaryTree<Personaje> arbol) {
        if (!arbol.isEmpty()) {
            return princesaAccesibleRec(arbol);
        }
        return null;
    }

    private Personaje princesaAccesibleRec(BinaryTree<Personaje> arbol) {
        if (arbol.getData().esDragon()) {
            return null;
        }
        if (arbol.getData().esPrincesa()) {
            return arbol.getData();
        }

        Personaje per = null;

        if (arbol.hasLeftChild()) {
            per = princesaAccesibleRec(arbol.getLeftChild());
        }
        if (per == null && arbol.hasRightChild()) {
            per = princesaAccesibleRec(arbol.getRightChild());
        }

        return per;
    }
}
