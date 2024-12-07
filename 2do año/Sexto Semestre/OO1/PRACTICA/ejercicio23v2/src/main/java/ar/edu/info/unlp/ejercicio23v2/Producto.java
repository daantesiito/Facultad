package ar.edu.info.unlp.ejercicio23v2;

public class Producto {

    private String nombre;
    private String categoria;
    private double precio;
    private int cantUnidadesDisp;

    public Producto(String nombre, String categoria, double precio, int cantUnidadesDisp) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.precio = precio;
        this.cantUnidadesDisp = cantUnidadesDisp;
    }

    public int getCantUnidadesDisp() {
        return this.cantUnidadesDisp;
    }

    public void descontarStock(int cantSolicitada) {
        this.cantUnidadesDisp -= cantSolicitada;
    }

    public void sumarCategoria(Bag<String> bag) {
        bag.add(this.categoria);
    }

    public double getPrecio() {
        return this.precio;
    }

}
