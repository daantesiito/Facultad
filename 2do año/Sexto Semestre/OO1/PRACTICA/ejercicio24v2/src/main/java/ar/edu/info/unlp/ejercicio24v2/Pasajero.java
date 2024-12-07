package ar.edu.info.unlp.ejercicio24v2;

import java.time.LocalDate;
import java.time.Period;

public class Pasajero extends Usuario {
    
    public Pasajero(String nombre, double saldo) {
        super(nombre,saldo);
    }

    @Override
    public void descontarSaldoEquitativoViaje(double descontar) {
        this.saldo = this.saldo + this.hizoViaje() - descontar;
    }

    private double hizoViaje() {
        if (this.viajes.size() > 0)
            return 500;
        return 0;
    }

    public void cargarSaldo(double monto) {
        this.saldo = this.saldo + (monto * this.viajeUltimos30Dias());
    }

    private double viajeUltimos30Dias() {
        if (this.viajes.stream().anyMatch(v -> Period.between(v.getFechaViaje(), LocalDate.now()).getDays() < 30))
            return 0.9;
        return 1;
    }

}