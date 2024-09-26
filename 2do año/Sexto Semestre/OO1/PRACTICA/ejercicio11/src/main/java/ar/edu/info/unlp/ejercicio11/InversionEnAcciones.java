package ar.edu.info.unlp.ejercicio11;

public class InversionEnAcciones extends Inversion {
	
	private String nombre;
	private int cantidad;
	private double valorUnitario;
	
	public InversionEnAcciones(String nombre, int cantidad, double valorUnitario) {
		super();
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.valorUnitario = valorUnitario;
	}

	public double valorActual() {
		return this.cantidad * this.valorUnitario;
	}
}
