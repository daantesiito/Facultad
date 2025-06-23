package parcialtrenes2024;

import java.time.LocalDate;

public class Viaje {
    
    private LocalDate fechaRealizacion;
    private double km;

    public Viaje(LocalDate fechaRealizacion, double km) {
        this.fechaRealizacion = fechaRealizacion;
        this.km = km;
    }

    public double getKm() {
        return this.km;
    }
}