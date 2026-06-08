package ar.edu.unlp.info.oo2.PracticaPatrones.parcial2;

import java.time.LocalDate;

public abstract class PlanMedico {

	private LocalDate fechaContratacion;
	
	public LocalDate getFechaContratacion() {
		return this.fechaContratacion;
	}
	
	public final double calcularMonto(int familiaresACargo, Coseguro coseguro, double salario) {
		return this.calcularMontoFijo(coseguro) + this.calcularCargoFamiliar(familiaresACargo, coseguro, salario) + this.calcularCoberturaViajera(salario, coseguro) + this.calcularSeguroInternacion();
	}

	protected abstract double calcularSeguroInternacion();

	protected abstract double calcularCoberturaViajera(double salario, Coseguro coseguro);

	protected abstract double calcularCargoFamiliar(int familiaresACargo, Coseguro coseguro, double salario);

	protected abstract double calcularMontoFijo(Coseguro coseguro);
	
}
