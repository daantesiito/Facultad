public abstract class Producto {

    ArrayList<Promocion> promocion;
    double precio;

    public Producto(double precio) {
        this.promocion = new ArrayList<>();
        this.precio = precio;
    }

    public double getPrecioProducto() {
        double precioFinal;
        if (!promocion.isEmpty()) {
            precioFinal = this.precio / this.promocion.stream().mapToDouble(prom -> prom.getDescuento()).sum();
        } else {
            precioFinal = this.precio;
        }
            return precioFinal;
    }

}