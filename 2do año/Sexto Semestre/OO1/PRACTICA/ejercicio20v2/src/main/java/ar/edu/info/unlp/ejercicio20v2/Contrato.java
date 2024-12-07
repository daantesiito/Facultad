package ar.edu.info.unlp.ejercicio20v2;

import java.time.LocalDate;

public abstract class Contrato {

	protected LocalDate fechaInicio;
	protected LocalDate fechaFin;
	
	public Contrato(LocalDate fechaInicio, LocalDate  fechaFin) {
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
	}
	
	public Contrato(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	
	public LocalDate getFechaInicio() {
		return this.fechaInicio;
	}
	
	public abstract double calcularMonto();
	
	public int calcularAntiguedad() {
		return this.fechaInicio.getYear() - LocalDate.now().getYear();
	}
	
}
