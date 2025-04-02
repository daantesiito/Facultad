import java.time.LocalDate;
import java.util.ArrayList;

public class Educativa extends Visita {

    private ArrayList<Grupo> grupos;

    public Educativa(double impactoAmb, LocalDate fecha, double duracion) {
        super(impactoAmb,fecha,duracion);
        this.grupos = new ArrayList<>();
    }

    public void anadirGrupo(Grupo grupo) {
        this.grupos.add(grupo);
    }

    public double calcularImpacto(){
        double impMinimo = this.grupos.stream().count() * (2 * this.duracion);
        double impAlumnos = this.grupos.stream().mapToDouble(g -> g.cantAlumnos()).sum();
        double impDocentes = this.grupos.stream().mapToDouble(g -> g.cantDocentes()).sum();
        return impMinimo + impAlumnos - impDocentes;
    }
}