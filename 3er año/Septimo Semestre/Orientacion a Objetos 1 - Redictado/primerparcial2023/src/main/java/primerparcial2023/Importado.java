package primerparcial2023;

public class Importado extends Producto {

    private String paisOrigen;

    public Importado(String nombre, String descripcion, double costo, String paisOrigen) {
        super(nombre,descripcion,costo);
        this.paisOrigen = paisOrigen;
    }
}