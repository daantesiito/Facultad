package ar.edu.info.unlp.parcial2024PrimeraFecha;

import java.time.LocalDate;

public class Virtual extends Evento{

	private double montoEnvio;
	
	public Virtual(String nombre, LocalDate fecha, String tema, double precio, double precioRemera,double montoEnvio) {
		super(nombre, fecha, tema, precio, precioRemera);
		this.montoEnvio = montoEnvio;
	}
	
	public double calcularExtras() {
		return this.montoEnvio;
	}
}
