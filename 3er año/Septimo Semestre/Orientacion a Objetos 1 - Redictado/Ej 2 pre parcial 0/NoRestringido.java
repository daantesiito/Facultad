public class NoRestringido extends Zona {

    public NoRestringido(String nombre, String descripcion) {
        super(nombre,descripcion);
    }

    public boolean getRestringido() {
        return false;
    }
}