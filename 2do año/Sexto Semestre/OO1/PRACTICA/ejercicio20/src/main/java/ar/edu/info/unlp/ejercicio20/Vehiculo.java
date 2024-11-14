package ar.edu.info.unlp.ejercicio20;

public class Vehiculo {
	
	private Conductor conductor;
	private String descripcion;
	private int capacidad;
	private int anioFabricacion;
	private double valorMercado;
	
	public Vehiculo(Conductor conductor, String descripcion, int capacidad, int anioFabricacion, double valorMercado) {
		this.conductor = conductor;
		this.descripcion = descripcion;
		this.capacidad = capacidad;
		this.anioFabricacion = anioFabricacion;
		this.valorMercado = valorMercado;
	}

	public Conductor getConductor() {
		return conductor;
	}

	public void setConductor(Conductor conductor) {
		this.conductor = conductor;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getCapacidad() {
		return capacidad;
	}

	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}

	public int getAnioFabricacion() {
		return anioFabricacion;
	}

	public void setAnioFabricacion(int anioFabricacion) {
		this.anioFabricacion = anioFabricacion;
	}

	public double getValorMercado() {
		return valorMercado;
	}

	public void setValorMercado(double valorMercado) {
		this.valorMercado = valorMercado;
	}
	
	
	
}
