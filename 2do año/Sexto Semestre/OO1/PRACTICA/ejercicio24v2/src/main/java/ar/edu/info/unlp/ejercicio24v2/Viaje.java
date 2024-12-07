package ar.edu.info.unlp.ejercicio24v2;

import java.time.LocalDate;
import java.util.ArrayList;

public class Viaje {

    private String origen;
    private String destino;
    private double costoTotal;
    private Vehiculo vehiculo;
    private LocalDate fechaViaje;
    private ArrayList<Usuario> pasajeros;

    public Viaje(String origen, String destino, double costoTotal, Vehiculo vehiculo, LocalDate fechaViaje) {
        this.origen = origen;
        this.destino = destino;
        this.costoTotal = costoTotal;
        this.vehiculo = vehiculo;
        this.fechaViaje = fechaViaje;
        this.pasajeros = new ArrayList<Usuario>();
        Conductor conductor = vehiculo.getConductor();
        this.pasajeros.add(conductor);
        conductor.viajes.add(this); 
    }

    public Pasajero aniadirPasajero(Pasajero pasajero) {
        if (this.hayCapacidad() && this.fechaATiempo() && pasajero.getSaldo() >= 0) {
            this.pasajeros.add(pasajero);
            pasajero.viajes.add(this);
            return pasajero;
        }
        return null;
    }

    private boolean hayCapacidad() {
        if (this.pasajeros.size() < this.vehiculo.getCapacidad())
            return true;
        return false;
    }

    private boolean fechaATiempo() {
        if (LocalDate.now().equals(this.fechaViaje))
            return true;
        return false;
    }

    public void procesarViaje() {
        double descontar = this.costoTotal / this.pasajeros.size();
        this.pasajeros.stream().forEach(p -> p.descontarSaldoEquitativoViaje(descontar));
    }

    public LocalDate getFechaViaje() {
        return this.fechaViaje;
    }

}