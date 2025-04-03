package ejercicioparcialredictado2952024;

public class Automotor implements Bien {

    private String patente;
    private String marca;
    private String modelo;
    private String fechaFabricacion;
    private double valor;
    private Contribuyente propietario;

    public Automotor(String patente, String marca, String modelo, String fechaFabricacion, double valor, Contribuyente propietario) {
        this.patente = patente;
        this.marca = marca;
        this.modelo = modelo;
        this.fechaFabricacion = fechaFabricacion;
        this.valor = valor;
        this.propietario = propietario;
    }
}