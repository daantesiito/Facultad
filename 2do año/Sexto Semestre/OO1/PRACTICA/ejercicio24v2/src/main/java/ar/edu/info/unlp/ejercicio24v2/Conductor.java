package ar.edu.info.unlp.ejercicio24v2;

import java.time.LocalDate;

public class Conductor extends Usuario {

    private Vehiculo vehiculo;

    public Conductor(String nombre, double saldo, Vehiculo vehiculo) {
        super(nombre,saldo);
        this.vehiculo = vehiculo;
    }

    @Override
    public void descontarSaldoEquitativoViaje(double descontar) {
        this.saldo = this.saldo + (this.vehiculo.getValorMercado() * 0.01) - descontar;
    }

    public void cargarSaldo(double monto) {
        this.saldo = this.saldo + (monto * this.autoMenor5Anios());
    }

    private double autoMenor5Anios() {
        if (LocalDate.now().getYear() - this.vehiculo.getAnioFabricacion() < 5)
            return 0.99;
        return 0.90;
    }

}