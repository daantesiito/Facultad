import java.time.LocalDate;
import java.util.ArrayList;

public class Cientifica extends Visita {
    
    private ArrayList<Participante> cientificos;
    private ArrayList<Zona> zonas;

    public Cientifica(double impactoAmb, LocalDate fecha, double duracion) {
        super(impactoAmb,fecha,duracion);
        this.cientificos = new ArrayList<>();
        this.zonas = new ArrayList<>();
    }

    public void anadirCientifico(Participante cientifico) {
        this.cientificos.add(cientifico);
    }

    public double calcularImpacto() {
        double impBase = 50;
        double impMinimo = (this.duracion - 1) * 5;
        double impZonas = this.zonas.stream().filter(z -> z.getRestringido()).count() * 100;
        return impBase + impMinimo + impZonas;
    }
}