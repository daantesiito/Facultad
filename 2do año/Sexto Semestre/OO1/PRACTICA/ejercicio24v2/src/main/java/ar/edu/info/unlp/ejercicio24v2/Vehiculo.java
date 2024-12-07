package ar.edu.info.unlp.ejercicio24v2;

public class Vehiculo {

    private Conductor conductor;
    private String descripcion;
    private int capacidad;
    private int anioFabricacion;
    private double valorMercado;

    public Vehiculo(Conductor conductor, String descripcion, int capacidad, int anioFabricacion, double valorMercado) {
        this.conductor = conductor;
        this.descripcion = descripcion;
        this.capacidad = capacidad;
        this.anioFabricacion = anioFabricacion;
        this.valorMercado = valorMercado;
    }

    public Conductor getConductor() {
        return this.conductor;
    }

    public void setConductor(Conductor conductor) {
        this.conductor = conductor;
    }

    public int getCapacidad() {
        return this.capacidad;
    }

    public double getValorMercado() {
        return this.valorMercado;
    }

    public int getAnioFabricacion() {
        return this.anioFabricacion;
    }
}