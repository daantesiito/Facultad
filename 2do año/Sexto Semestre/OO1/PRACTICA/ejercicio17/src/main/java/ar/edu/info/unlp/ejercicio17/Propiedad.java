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
	
	public void crearReserva(LocalDate fechaInicio, LocalDate fechaFin) {
		if (this.consultarDisponibilidad(fechaInicio, fechaFin)) {
			Reserva reserva = new Reserva(fechaInicio, fechaFin);
			this.reservas.add(reserva);
		}
	}
	
	public double calcularPrecio(Reserva reserva) {
		return this.precioPorNoche * reserva.getPeriodoDias();
	}
	
	public void cancelarReserva(Reserva unaReserva) {
		if (this.reservas.contains(unaReserva)) {
			if (!unaReserva.esCancelable(LocalDate.now())) {
				this.reservas.remove(unaReserva);
			}
		}
	}
	
	public ArrayList<Reserva> getReservas() {
		return this.reservas;
	}
	
	public double calcularPrecioTodasReservas() {
		return this.reservas.stream().mapToInt(reserva-> reserva.getPeriodoDias()).sum() * this.precioPorNoche;
	}
}
