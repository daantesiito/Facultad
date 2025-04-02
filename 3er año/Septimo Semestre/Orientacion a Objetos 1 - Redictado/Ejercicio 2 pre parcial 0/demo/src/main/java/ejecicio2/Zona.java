package ejecicio2;

public abstract class Zona {

    private String nombre;
    private String descripcion;

    public Zona(String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public abstract boolean getRestringido();
}