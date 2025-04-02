package ejecicio2;

import java.time.LocalDate;

public abstract class Visita {

    protected double impactoAmb;
    protected LocalDate fecha;
    protected double duracion;

    public Visita(LocalDate fecha, double duracion) {
        this.impactoAmb = 0;
        this.fecha = fecha;
        this.duracion = duracion;
    }

    public abstract double calcularImpacto();
}