package ar.edu.info.unlp.parcialPrimerFecha2022;

import java.time.LocalDate;

public abstract class Vehiculo implements Bien{

	protected String patente;
	protected LocalDate fechaFabricacion;
	protected double valor;
	
	public Vehiculo(String patente, LocalDate fechaFabricacion, double valor) {
		this.patente = patente;
		this.fechaFabricacion = fechaFabricacion;
		this.valor = valor;
	}
	
	public double calcularValor() {
		if (this.supera10Anios())
			return 0;
		else
			return this.valor * calcularPorcentaje();
	}
	
	public boolean supera10Anios() {
		return LocalDate.now().getYear() - this.fechaFabricacion.getYear() >= 10;
	}
	
	public abstract double calcularPorcentaje();
}
