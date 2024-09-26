package ar.edu.info.unlp.ejercicio11;

import java.time.LocalDate;
import java.time.Period;

public class InversionEnPlazoFijo extends Inversion {

	private LocalDate fechaDeConstitucion;
	private double montoDepositado;
	private double porcentajeDeInteresDiario;
	
	public InversionEnPlazoFijo(LocalDate fechaDeConstitucion, double montoDepositado,
			double porcentajeDeInteresDiario) {
		super();
		this.fechaDeConstitucion = fechaDeConstitucion;
		this.montoDepositado = montoDepositado;
		this.porcentajeDeInteresDiario = porcentajeDeInteresDiario;
	}

	public double valorActual() {
		int cantDias = LocalDate.now().until(this.fechaDeConstitucion).getDays();
		double total = this.montoDepositado;
		for (int i = 1; i < cantDias; i++) {
			total = this.montoDepositado * this.porcentajeDeInteresDiario;
		}
		return total;
	}
}
