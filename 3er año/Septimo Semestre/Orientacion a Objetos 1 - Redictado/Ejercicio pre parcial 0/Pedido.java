public abstract class Pedido {

    ArrayList<Producto> productos;

    public Pedido() {
        this.productos = new ArrayList<>();
    }

    public static void addProducto(Producto p) {
        this.productos.add(p);
    }

    public double calcularCostoTotal() {
        return this.productos.stream().mapToDouble(p -> p.getPrecioProducto()).sum();
    }

}