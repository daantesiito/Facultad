import java.time.LocalDate;

public abstract class Visita {

    protected double impactoAmb;
    protected LocalDate fecha;
    protected double duracion;

    public Visita(double impactoAmb, LocalDate fecha, double duracion) {
        this.impactoAmb = impactoAmb;
        this.fecha = fecha;
        this.duracion = duracion;
    }

    public abstract double calcularImpacto();
}