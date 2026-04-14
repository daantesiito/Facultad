package Practica1EJ6;

public class EmpleadoPasante extends Empleado{

	public double sueldo() {
		return this.sueldoBasico - (this.sueldoBasico * DESCUENTO);
	}
}