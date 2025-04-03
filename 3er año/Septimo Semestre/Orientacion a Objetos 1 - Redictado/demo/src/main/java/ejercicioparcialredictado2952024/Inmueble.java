package ejercicioparcialredictado2952024;

public class Inmueble implements Bien {

    private double numPartida;
    private double valorLote;
    private double valorEdificacion;
    private Contribuyente propietario;

    public Inmueble(double numPartida, double valorLote, double valorEdificacion, Contribuyente propietario) {
        this.numPartida = numPartida;
        this.valorLote = valorLote;
        this.valorEdificacion = valorEdificacion;
        this.propietario = propietario;
    }

}