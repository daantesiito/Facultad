package ar.edu.unlp.info.oo2.PracticaPatrones.parcial2;

public class PlanPremium extends PlanMedico {

	protected double calcularSeguroInternacion() {
		return 33000 *  0.05;
	}

	protected double calcularCoberturaViajera(double salario, Coseguro coseguro) {
		return salario * 0.01 * ((100 - coseguro.getDescuento()) / 100);
	}

	protected double calcularCargoFamiliar(int familiaresACargo, Coseguro coseguro, double salario) {
		if (familiaresACargo < 4) {
			return 0;
		} else {
			return familiaresACargo * 2800;
		}
	}

	protected double calcularMontoFijo(Coseguro coseguro) {
		if (coseguro != null) {
			return 33000 * ((100 - coseguro.getDescuento()) / 100);
		} else {
			return 33000;
		}
	}
	
}