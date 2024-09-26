package ar.edu.info.unlp.ejercicio9;

public class CuentaCorriente extends Cuenta {
	
	private double saldoNegativo;

	public CuentaCorriente() {
		super();
		this.saldoNegativo = 0;
	}
	
	public void setSaldoNegativo(double monto) {
		this.saldoNegativo = monto;
	}
	
	public double getSaldoNegativo() {
		return this.saldoNegativo;
	}
	
	public boolean puedeExtraer(double monto) {
		if (this.getSaldo() - monto < this.saldoNegativo) {
			return false;
		}
		return true;
	}
	
}
