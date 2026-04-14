package Practica1EJ6;

public class EmpleadoTemporario extends Empleado{
	private double horasTrabajadas = 0;
	private int cantidadHijos = 0;
	private static final double PAGOHIJOS = 2000;
	private static final double PAGOHORA = 500;


	public double sueldo() {
		return this.sueldoBasico
				+
				(this.horasTrabajadas * PAGOHORA)
				+
				(this.cantidadHijos * PAGOHIJOS)
				-
				(this.sueldoBasico * DESCUENTO);
	}
}