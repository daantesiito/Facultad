package ar.edu.info.unlp.ejercicio24v2;

import java.util.ArrayList;

public abstract class Usuario {

    protected ArrayList<Viaje> viajes;
    protected String nombre;
    protected double saldo;

    @SuppressWarnings("Convert2Diamond")
    public Usuario(String nombre, double saldo) {
        this.nombre = nombre;
        this.saldo = saldo;
        this.viajes = new ArrayList<Viaje>();
    }

    public double getSaldo() {
        return this.saldo;
    }

    public abstract void descontarSaldoEquitativoViaje(double descontar);

    public abstract void cargarSaldo(double monto);

}