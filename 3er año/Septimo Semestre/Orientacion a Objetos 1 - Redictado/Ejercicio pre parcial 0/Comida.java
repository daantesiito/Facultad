public class Comida extends Producto {

    boolean vegano;
    boolean celiaco;

    public Comida(boolean vegano, boolean celiaco) {
        this.vegano = vegano;
        this.celiaco = celiaco;
    }

}