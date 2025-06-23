package primerparcial2023;

public abstract class Producto {

    protected String nombre;
    protected String descripcion;
    protected double costo;

    public Producto(String nombre, String descripcion, double costo) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.costo = costo;
    }

    public String getNombre() {
        return this.nombre;
    }
}