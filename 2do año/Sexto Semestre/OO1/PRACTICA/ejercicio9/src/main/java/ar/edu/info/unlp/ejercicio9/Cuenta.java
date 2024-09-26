package ar.edu.info.unlp.ejercicio9;

public abstract class Cuenta {

	private double saldo;
	
	public Cuenta() {
		this.saldo = 0;
	}
	
	public double getSaldo() {
		return this.saldo;
	}
	
	public void depositar(double monto) {
		this.saldo += monto;
	}
	
	public void extraerSinControlar(double monto) {
		this.saldo -= monto;
	}
	
	public boolean extraer(double monto) {
		if (this.puedeExtraer(monto)){
			this.extraerSinControlar(monto);
			return true;
		}
		return false;
	}
	
	public boolean transferirACuenta(double monto, Cuenta cuentaDestino) {
		if (this.puedeExtraer(monto)) {
			this.extraerSinControlar(monto);
			cuentaDestino.depositar(monto);
			return true;
		}
		return false;
	}
	
	// PREGUNTAR PUEDEEXTRAER DONDE PONERLO O PONERLO VACIO O QUE
	
	public boolean puedeExtraer(double monto) {
		if (this.saldo > monto) {
			return true;
		}
		return false;
	}
	
}
