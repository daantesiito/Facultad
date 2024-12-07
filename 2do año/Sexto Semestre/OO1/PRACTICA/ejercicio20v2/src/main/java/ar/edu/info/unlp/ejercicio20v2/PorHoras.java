package ar.edu.info.unlp.ejercicio20v2;

import java.time.LocalDate;

public class PorHoras extends Contrato{
	
	private double valorHora;
	private int horas;
	
	public PorHoras(double valorHora, int horas, LocalDate fechaFin, LocalDate fechaInicio) {
		super(fechaInicio,fechaFin);
		this.valorHora = valorHora;
		this.horas = horas;
	}
	
	public double calcularMonto() {
		return this.valorHora * horas;
	}

}
