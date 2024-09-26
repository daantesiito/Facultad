package ar.edu.info.unlp.ejercicio9;

public class CajaDeAhorro extends Cuenta {
	
	public CajaDeAhorro() {
		super();
	}
	
	public boolean puedeExtraer(double monto) {
		if (this.getSaldo() * 1.02 >= monto) {
			return true;
		}
		return false;
	}
	
}
