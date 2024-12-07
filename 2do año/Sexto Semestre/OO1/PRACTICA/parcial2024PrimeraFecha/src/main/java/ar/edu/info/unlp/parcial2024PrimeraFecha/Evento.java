package ar.edu.info.unlp.parcial2024PrimeraFecha;

import java.time.LocalDate;

public abstract class Evento {

	protected String nombre;
	protected LocalDate fecha;
	protected String tema;
	protected double precio;
	protected double precioRemera;
	
	public Evento(String nombre, LocalDate fecha, String tema, double precio, double precioRemera) {
		this.nombre = nombre;
		this.fecha = fecha;
		this.tema = tema;
		this.precio = precio;
		this.precioRemera = precioRemera;
	}
	
	public double calcularPrecio(LocalDate fecha) {
		double total = this.precio + this.precioRemera + this.calcularExtras();
		if (this.esHoy())
			return total * 1.2;
		return total;
	}
	
	public abstract double calcularExtras();
	
	private boolean esHoy() { // es necesario??
		if (this.fecha.equals(LocalDate.now())) 
			return true;
		return false;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
}
