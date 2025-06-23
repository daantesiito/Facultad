package parcialtrenes2024;

public class Repuesto {

    private String nombre;
    private double costo;

    public Repuesto(String nombre, double costo) {
        this.costo = costo;
        this.nombre = nombre;
    }

    public double getCosto() {
        return this.costo;
    }
}