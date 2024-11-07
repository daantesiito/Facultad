package ar.edu.info.unlp.ejercicio19;

import java.time.LocalDate;

public class Interurbano extends Envio {

	private double distanciaEnKm;

	public Interurbano(LocalDate fecha, String direccionOrigen, String direccionDestino, double peso, double distanciaEnKm) {
		super(fecha, direccionOrigen, direccionDestino, peso);
		this.distanciaEnKm = distanciaEnKm;
	}
	
	public double calcularMonto() {
		if (distanciaEnKm < 100)
			return 20 * this.getPeso();
		else if (distanciaEnKm > 100 && distanciaEnKm < 500)
			return 25 * this.getPeso();
		else
			return 30 * this.getPeso();
	}
}
