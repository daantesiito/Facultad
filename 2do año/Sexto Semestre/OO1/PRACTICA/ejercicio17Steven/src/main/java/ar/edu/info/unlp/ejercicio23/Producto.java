package ar.edu.info.unlp.ejercicio23;

public class Producto {
	
	private String nombre;
	private String categoria;
	private double precio;
	private double cantUnidades;
	
	public Producto(String nombre, String categoria, double precio, double cantUnidades) {
		this.nombre = nombre;
		this.categoria = categoria;
		this.precio = precio;
		this.cantUnidades = cantUnidades;
	}
	
	public double getCantUnidades() {
		return this.cantUnidades;
	}
	
	public void descontarUnidades(double cant) {
		this.cantUnidades -= cant;
	}
	
	public String getCategoria() {
		return this.categoria;
	}
	
	public double getPrecio() {
		return this.precio;
	}
}
