package ejparcialred;

import java.time.LocalDate;
import java.util.ArrayList;

public class Contribuyente {

    private String nombre;
    private double DNI;
    private String email;
    private String localidad;
    private ArrayList<Bien> bienes;

    public Contribuyente(String nombre, double DNI, String email, String localidad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.email = email;
        this.localidad = localidad;
        this.bienes = new ArrayList<>();
    }

    public Inmueble altaInmueble(double numPartida, double valorLote, double valorEdificacion) {
        Inmueble inmueble = new Inmueble(numPartida, valorLote, valorEdificacion);
        this.bienes.add(inmueble);
        return inmueble;
    }

    public Automotor altaAutomotor(String patente, String marca, String modelo, LocalDate fechaFabricacion, double valor) {
        Automotor automotor = new Automotor(patente, marca, modelo, fechaFabricacion, valor);
        this.bienes.add(automotor);
        return automotor;
    }

    public double calcularImpuesto() {
        return this.bienes.stream().mapToDouble(b -> b.calcularImpuesto()).sum();
    }

}
