package parcialtrenes2024;

public class Tiempo extends Tarea {

    private String periocidad;

    public Tiempo(String ID, double tiempo, double costoBase, String periocidad, Tren tren) {
        super(ID,tiempo,costoBase,tren);
        this.periocidad = periocidad;
    }

    public double calcularMonto() {
        return 0;
    }

}