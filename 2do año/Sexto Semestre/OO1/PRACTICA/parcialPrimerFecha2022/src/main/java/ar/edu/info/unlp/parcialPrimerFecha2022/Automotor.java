package ar.edu.info.unlp.parcialPrimerFecha2022;

import java.time.LocalDate;

public class Automotor extends Vehiculo{
	
	private String marca;
	private String modelo;
	
	public Automotor(String patente, LocalDate fechaFabricacion, double valor, String marca, String modelo) {
		super(patente, fechaFabricacion, valor);
		this.marca = marca;
		this.modelo = modelo;
	}
	
	public double calcularPorcentaje() {
		return 0.05;
	}

}
