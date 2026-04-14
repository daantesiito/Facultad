package Practica1EJ6;

public abstract class Empleado {
	protected String nombre;
	protected String apellido;
	protected double sueldoBasico = 0;
	protected static final double DESCUENTO = 0.13;
	
	public abstract double sueldo();
}
