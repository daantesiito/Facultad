package parcialtrenes2024;

import java.time.LocalDate;
import java.util.ArrayList;

public class Tren {
    
    private double numSerie;
    private String marca;
    private LocalDate fechaIncorporacion;
    private double kmInicial;
    private ArrayList<Viaje> viajes;
    private Modelo modelo; 
    private ArrayList<Realizada> tareasRealizadas;

    public Tren(double numSerie, String marca, LocalDate fechaIncorporacion, double kmInicial, Modelo modelo) {
        this.numSerie = numSerie;
        this.marca = marca;
        this.fechaIncorporacion = fechaIncorporacion;
        this.kmInicial = kmInicial;
        this.modelo = modelo;
        this.viajes = new ArrayList<>();
        this.tareasRealizadas = new ArrayList<>();
    }

    public Viaje altaViaje(LocalDate fecha, double km) {
        Viaje viaje = new Viaje(fecha, km);
        this.viajes.add(viaje);
        return viaje;
    }

    public Realizada altaTareaRealizada(LocalDate fecha, String descripcion, Tarea tareaR) {
        Realizada tarea = new Realizada(tareaR.getID(), tareaR.getTiempo(), tareaR.getCostoBase(), fecha, descripcion, this);
        this.tareasRealizadas.add(tarea);
        return tarea;
    }

    public ArrayList<Viaje> getViajes() {
        return this.viajes;
    }

}