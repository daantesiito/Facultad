package parcialtrenes2024;

import java.time.LocalDate;

public class Realizada extends Tarea {

    private LocalDate fecha;
    private String descripcion;

    public Realizada(String ID, double tiempo, double costoBase, LocalDate fecha, String descripcion, Tren tren) {
        super(ID,tiempo,costoBase,tren);
        this.fecha = fecha;
        this.descripcion = descripcion;
    }

    public double calcularMonto() {
        return 0;
    }

}