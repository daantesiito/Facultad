package ar.edu.unlp.info.oo2.PracticaPatrones.punto6;

public class Sandwich {

	private double precioTotal = 0;
	
	public void addComponente(double precioComponente) {
		this.precioTotal += precioComponente;
	}
	
	public double getPrecio() {
		return this.precioTotal;
	}
	
}
