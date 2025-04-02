package ejecicio2;

import java.time.LocalDate;
import java.util.ArrayList;

public class Recreativa extends Visita {

    private ArrayList<Participante> participantes;

    public Recreativa(LocalDate fecha, double duracion) {
        super(fecha,duracion);
        this.participantes = new ArrayList<>();
    }

    public void añadirParticipante(Participante participante) {
        this.participantes.add(participante);
    }

    public double calcularImpacto() {
        return this.participantes.stream().count() * this.duracion;
    }
}