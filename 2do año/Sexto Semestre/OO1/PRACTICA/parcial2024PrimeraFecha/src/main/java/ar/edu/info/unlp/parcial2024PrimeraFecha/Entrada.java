package ar.edu.info.unlp.parcial2024PrimeraFecha;

import java.time.LocalDate;
import java.time.Period;

public class Entrada {
	
	private boolean seguro;
	private Evento evento;
	private LocalDate fechaCompra;
	
	public Entrada(Evento evento,boolean seguro) {
		this.evento = evento;
		this.seguro = seguro;
		this.fechaCompra = LocalDate.now();
	}
	
	public double calcularMontoRecuperar(LocalDate fecha) {
		double recuperar = 0;
		if (this.calcularDias(fecha) >= 30)
			recuperar = 0.5;
		return this.asistencia(fecha) * (recuperar + this.porcentajeSeguro());
	}
	
	public int calcularDias(LocalDate fecha) {
		return Period.between(this.evento.getFecha(), fecha).getDays();
	}
	
	public double porcentajeSeguro() {
		if (this.seguro)
			return 0.15;
		return 0;
	}
	
	public Evento getEvento() {
		return this.evento;
	}
	
	public double asistencia(LocalDate fecha) {
		return this.evento.calcularPrecio(fecha);
	}

}
