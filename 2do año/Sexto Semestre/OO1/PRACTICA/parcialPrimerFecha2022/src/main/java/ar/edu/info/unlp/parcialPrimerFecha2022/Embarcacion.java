package ar.edu.info.unlp.parcialPrimerFecha2022;

import java.time.LocalDate;

public class Embarcacion extends Vehiculo {

	private String nombre;
	
	public Embarcacion(String patente, LocalDate fechaFabricacion, double valor, String nombre) {
		super(patente, fechaFabricacion, valor);
		this.nombre = nombre;
	}
	
	public double calcularPorcentaje() {
		if (this.valor < 1000000)
			return 0.10;
		else
			return 0.15;
	}
}
