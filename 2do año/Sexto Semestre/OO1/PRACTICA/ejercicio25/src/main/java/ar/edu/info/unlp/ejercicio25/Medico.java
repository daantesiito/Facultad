package ar.edu.info.unlp.ejercicio25;

import java.time.LocalDate;
import java.util.ArrayList;

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
	
	public int calcularAntiguedad() {
		return LocalDate.now().getYear() - this.fechaIngreso.getYear();
	}

}
