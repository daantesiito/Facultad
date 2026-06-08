package ar.edu.unlp.info.oo2.PracticaPatrones.parcial2;

public class PlanIntegral extends PlanMedico {

	protected double calcularSeguroInternacion() {
		return 22000 * 0.05;
	}

	protected double calcularCoberturaViajera(double salario, Coseguro coseguro) {
		return salario * 0.03 - (10000 * coseguro.getAntiguedad());
	}

	protected double calcularCargoFamiliar(int familiaresACargo, Coseguro coseguro, double salario) {
		return familiaresACargo * 3000 + salario * 0.01;
	}

	protected double calcularMontoFijo(Coseguro coseguro) {
		return 22000;
	}
	
}