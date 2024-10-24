package ar.edu.unlp.info.oo1.ejercicio9v2;

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
