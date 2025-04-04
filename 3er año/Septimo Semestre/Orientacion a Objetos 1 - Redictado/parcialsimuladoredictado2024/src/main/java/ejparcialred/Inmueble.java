package ejparcialred;

public class Inmueble implements Bien {

    private double numPartida;
    private double valorLote;
    private double valorEdificacion;

    public Inmueble(double numPartida, double valorLote, double valorEdificacion) {
        this.numPartida = numPartida;
        this.valorLote = valorLote;
        this.valorEdificacion = valorEdificacion;
    }

    public double calcularImpuesto() {
        return this.valorEdificacion + this.valorLote;
    }

}