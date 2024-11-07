package ar.edu.info.unlp.ejercicio19;

import java.time.LocalDate;

public class Local extends Envio {
	
	private boolean entregaRapida;

	public Local(LocalDate fecha, String direccionOrigen, String direccionDestino, double peso, boolean entregaRapida) {
		super(fecha, direccionOrigen, direccionDestino, peso);
		this.entregaRapida = entregaRapida;
	}
	
	public double calcularMonto() {
		if (this.entregaRapida = false) 
			return 1000;
		else
			return 1500;
	}
	
}
