package primerparcial2023;

public class ItemPedido {

    private double cantidad;
    private Producto producto;

    public ItemPedido(double cantidad, Producto producto) {
        this.cantidad = cantidad;
        this.producto = producto;
    }

    public double getCantProducto(Producto producto) {
        if (producto.getNombre().equals(this.producto.getNombre()))
            return this.cantidad;
        else
            return 0;
    }

}