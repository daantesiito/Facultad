public class Restringida extends Zona {

    public Restringida(String nombre, String descripcion) {
        super(nombre,descripcion);
    }

    public boolean getRestringido() {
        return true;
    }

}