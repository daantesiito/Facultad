package Practica1EJ6;

public class EmpleadoPlanta extends Empleado{
	private int cantidadHijos = 0;
	private static final double PAGOHIJOS = 2000;

	public double sueldo() {
		return this.sueldoBasico
				+ (this.cantidadHijos * PAGOHIJOS)
				- (this.sueldoBasico * DESCUENTO);
	}
}