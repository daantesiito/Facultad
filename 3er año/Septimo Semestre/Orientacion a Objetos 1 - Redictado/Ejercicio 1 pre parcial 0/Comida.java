public class Comida extends Producto {

    boolean vegano;
    boolean celiaco;

    public Comida(boolean vegano, boolean celiaco, double precio) {
        super(precio);
        this.vegano = vegano;
        this.celiaco = celiaco;
    }

}