package ar.edu.info.unlp.ejercicio19;

import java.time.LocalDate;

public abstract class Envio {

	private LocalDate fecha;
	private String direccionOrigen;
	private String direccionDestino;
	private double peso;
	
	public Envio(LocalDate fecha, String direccionOrigen, String direccionDestino, double peso) {
		this.fecha = fecha;
		this.direccionOrigen = direccionOrigen;
		this.direccionDestino = direccionDestino;
		this.peso = peso;
	}
	
	public LocalDate getFecha() {
		return fecha;
	}
	
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	
	public String getDireccionOrigen() {
		return direccionOrigen;
	}
	
	public void setDireccionOrigen(String direccionOrigen) {
		this.direccionOrigen = direccionOrigen;
	}
	
	public String getDireccionDestino() {
		return direccionDestino;
	}
	
	public void setDireccionDestino(String direccionDestino) {
		this.direccionDestino = direccionDestino;
	}
	
	public double getPeso() {
		return peso;
	}
	
	public void setPeso(double peso) {
		this.peso = peso;
	}
	
	public abstract double calcularMonto();
	
}