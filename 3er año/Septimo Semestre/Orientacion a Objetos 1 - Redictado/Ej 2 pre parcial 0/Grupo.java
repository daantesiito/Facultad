import java.util.ArrayList;

public class Grupo {

    private ArrayList<Participante> alumnos;
    private ArrayList<Participante> docentes;
    private String nombreColegio;
    private double ID;

    public Grupo(String nombreColegio, double ID){
        this.nombreColegio = nombreColegio;
        this.ID = ID;
        this.alumnos = new ArrayList<>();
        this.docentes = new ArrayList<>();
    }

    public double cantAlumnos(){
        return this.alumnos.stream().count();
    }

    public double cantDocentes(){
        return this.docentes.stream().count();
    }
}