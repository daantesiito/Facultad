package ar.edu.info.unlp.ejercicio20v2;

import java.time.LocalDate;

public class ReciboDeSueldo {

	private String nombre;
	private String apellido;
	private String CUIL;
	private int antiguedad;
	private LocalDate fecha;
	private double montoTotal;
	
	public ReciboDeSueldo(String nombre, String apellido, String CUIL, int antiguedad, double montoTotal) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.CUIL = CUIL;
		this.antiguedad = antiguedad;
		this.fecha = LocalDate.now();
		this.montoTotal = montoTotal;
	}	
}
