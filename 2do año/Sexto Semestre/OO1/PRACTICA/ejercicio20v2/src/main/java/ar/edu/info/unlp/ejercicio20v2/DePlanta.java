package ar.edu.info.unlp.ejercicio20v2;

import java.time.LocalDate;

public class DePlanta extends Contrato {
	
	private double sueldo;
	private double montoConyuge;
	private double montoHijos;
	
	public DePlanta(double sueldo, double montoConyuge, double montoHijos, LocalDate fechaInicio) {
		super(fechaInicio);
		this.sueldo = sueldo;
		this.montoConyuge = montoConyuge;
		this.montoHijos = montoHijos;
	}

	public double calcularMonto() {
		return this.sueldo + this.montoHijos + this.montoConyuge;
	}
	
}
