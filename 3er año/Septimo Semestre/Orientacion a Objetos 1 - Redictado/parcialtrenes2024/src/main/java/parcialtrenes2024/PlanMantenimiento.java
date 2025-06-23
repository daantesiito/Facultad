package parcialtrenes2024;

import java.util.ArrayList;

public class PlanMantenimiento {

    private double version;
    private ArrayList<Modelo> modelosAplica;
    private ArrayList<Tarea> tareas;

    public PlanMantenimiento(double version) {
        this.version = version;
        this.modelosAplica = new ArrayList<>();
        this.tareas = new ArrayList<>();
    }

    public Tiempo altaTareaPeriodica(String ID, double tiempo, double costoBase, String periocidad, Tren tren) {
        Tiempo tareaTiempo = new Tiempo(ID, tiempo, costoBase, periocidad, tren);
        this.tareas.add(tareaTiempo);
        return tareaTiempo;
    }

    public Rodadura altaTareRodadura(String ID, double tiempo, double costoBase, String serviceCada, Tren tren) {
        Rodadura tareaRodadura = new Rodadura(ID, tiempo, costoBase, serviceCada, tren);
        return tareaRodadura;
    }

    public void altaModelo(String nombre) {
        Modelo modelo = new Modelo(nombre, this);
        this.modelosAplica.add(modelo);
    }

    public void bajaTarea(Tarea tarea) {
        this.tareas.remove(tarea);
    }
}