package ar.edu.info.unlp.ejercicio2;

public class Producto {
	
	private double peso;
	private double precioPorKilo;
	private String descripcion;
	
	public Producto() {

	}
	
	public Producto(double peso, double precioPorKilo, String descripcion) {
		this.peso = peso;
		this.precioPorKilo = precioPorKilo;
		this.descripcion = descripcion;
	}

	public double getPeso() {
		return peso;
	}
	
	public void setPeso(double peso) {
		this.peso = peso;
	}
	
	public double getPrecioPorKilo() {
		return precioPorKilo;
	}
	
	public void setPrecioPorKilo(double precioPorKilo) {
		this.precioPorKilo = precioPorKilo;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public double getPrecio() {
		return this.precioPorKilo * this.peso;
	}
}