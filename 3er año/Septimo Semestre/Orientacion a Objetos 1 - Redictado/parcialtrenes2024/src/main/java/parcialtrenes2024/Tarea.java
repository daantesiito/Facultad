package parcialtrenes2024;

import java.util.ArrayList;

public abstract class Tarea {

    protected String ID;
    protected double tiempo;
    protected double costoBase;
    protected ArrayList<Repuesto> repuestos; 
    protected Tren tren;

    public Tarea(String ID, double tiempo, double costoBase, Tren tren) {
        this.ID = ID;
        this.tiempo = tiempo;
        this.costoBase = costoBase;
        this.repuestos = new ArrayList<>();
        this.tren = tren;
    }

    public double calcularCosto() {
        return this.costoBase + this.costoRepuestos() + this.calcularMonto();
    }

    private double costoRepuestos() {
        return this.repuestos.stream().mapToDouble(r -> r.getCosto()).sum();
    }

    public abstract double calcularMonto();

    public String getID() {
        return this.ID;
    }

    public double getTiempo() {
        return this.tiempo;
    }

    public double getCostoBase() {
        return this.costoBase;
    }
}