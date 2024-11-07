package ar.edu.info.unlp.ejercicio17;

import java.time.LocalDate;
import java.util.ArrayList;

public class Propiedad {

	private String direccion;
	private String nombreDescriptivo;
	private double precioPorNoche;
	private ArrayList<Reserva> reservas;
	
	
	public Propiedad(String direccion, String nombreDescriptivo, double precioPorNoche) {
		this.direccion = direccion;
		this.nombreDescriptivo = nombreDescriptivo;
		this.precioPorNoche = precioPorNoche;
		this.reservas = new ArrayList<>();
	}
	
	public boolean consultarDisponibilidad(LocalDate inicio, LocalDate fin) {
		return this.reservas.stream().noneMatch(reserva->reserva.getPeriodo().overlaps(new DateLapse(inicio,fin)));
	}
}
