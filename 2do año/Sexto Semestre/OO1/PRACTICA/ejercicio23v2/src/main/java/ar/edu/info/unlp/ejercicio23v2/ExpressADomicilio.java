package ar.edu.info.unlp.ejercicio23v2;

public class ExpressADomicilio implements FormaDeEnvio{

    private String direccionOrigen;
    private String direccionDestino;

    public double calcularPrecioTotal(double total) {
        return total + calculadoraDeDistancia.distanciaEntre(this.direccionOrigen,this.direccionDestino) * 0.5;
    }

}
