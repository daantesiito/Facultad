package ar.edu.info.unlp.ejercicio25v2;

import java.time.LocalDate;

public class Medico {
	
	private String nombre;
	private LocalDate fechaIngreso;
	private double honorarios;
	
	public Medico(String nombre, LocalDate fechaIngreso, double honorarios) {
		this.nombre = nombre;
		this.fechaIngreso = fechaIngreso;
		this.honorarios = honorarios;
	}
	
	public double getHonorarios() {
		return this.honorarios;
	}
	
	public double antiguedad() {
		return Math.abs(LocalDate.now().getYear() - this.fechaIngreso.getYear());
	}

}
