package parcialtrenes2024;

public class Rodadura extends Tarea {

    private String serviceCada;

    public Rodadura(String ID, double tiempo, double costoBase, String serviceCada, Tren tren) {
        super(ID,tiempo,costoBase,tren);
        this.serviceCada = serviceCada;
    }

    public double calcularMonto() {
        double kmRecorridos = this.tren.getViajes().stream().mapToDouble(v -> v.getKm()).sum();
        return kmRecorridos * 0.05;
    }

}