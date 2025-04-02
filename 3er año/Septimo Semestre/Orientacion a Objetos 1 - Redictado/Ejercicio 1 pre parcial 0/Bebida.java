public class Bebida extends Producto {

    boolean esFrio;

    public Bebida(boolean esFrio, double precio) {
        super(precio);
        this.esFrio = esFrio;
    }
} 