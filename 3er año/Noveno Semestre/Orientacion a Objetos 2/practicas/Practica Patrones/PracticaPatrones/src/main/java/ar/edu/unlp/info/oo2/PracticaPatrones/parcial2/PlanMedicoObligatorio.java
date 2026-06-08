package ar.edu.unlp.info.oo2.PracticaPatrones.parcial2;

public class PlanMedicoObligatorio extends PlanMedico {

	protected double calcularSeguroInternacion() {
		return 0.0;
	}

	protected double calcularCoberturaViajera(double salario, Coseguro coseguro) {
		return salario * 0.01 - coseguro.getMontonCoberturaViajes();
	}

	protected double calcularCargoFamiliar(int familiaresACargo, Coseguro coseguro, double salario) {
		double descuento = ((100 - coseguro.getDescuento()) / 100);
		return familiaresACargo * (3500 * descuento);
	}

	protected double calcularMontoFijo(Coseguro coseguro) {
		return 15000;
	}
	
}
