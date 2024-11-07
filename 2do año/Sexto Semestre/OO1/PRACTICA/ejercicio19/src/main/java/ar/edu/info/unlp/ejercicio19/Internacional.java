package ar.edu.info.unlp.ejercicio19;

import java.time.LocalDate;

public class Internacional extends Envio{

	public Internacional(LocalDate fecha, String direccionOrigen, String direccionDestino, double peso) {
		super(fecha, direccionOrigen, direccionDestino, peso);
	}
	
	public double calcularMonto() {
		Integer start = 5000;
		double peso = this.getPeso();
		if (peso <= 1000)
			return start + peso * 10;
		else
			return start + peso * 12;
	}

}
