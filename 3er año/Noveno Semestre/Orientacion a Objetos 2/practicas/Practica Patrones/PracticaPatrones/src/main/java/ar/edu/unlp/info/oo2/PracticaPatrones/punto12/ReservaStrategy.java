package ar.edu.unlp.info.oo2.PracticaPatrones.punto12;

import java.time.LocalDate;

public class ReservaStrategy {
	
	protected int cantidadDias;
	protected LocalDate fecha;
	protected AutoEnAlquilerContext auto;
	
	public ReservaStrategy(int cantidadDias, AutoEnAlquilerContext auto) {
		this.cantidadDias = cantidadDias;
		this.fecha = LocalDate.now();
		this.auto = auto;
	}
	
	public double montoAPagar() {
		return this.auto.getPrecioPorDia() * this.cantidadDias;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public double montoAReembolsar() {
		return this.auto.montoAReembolsar(this, LocalDate.now());
	}
}
