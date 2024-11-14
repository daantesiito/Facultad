package ar.edu.info.unlp.ejercicio17;

import java.util.ArrayList;

public class Usuario {
	
	private String nombre;
	private String direccion;
	private Integer DNI;
	private ArrayList<Propiedad> propiedades;

	public Usuario(String nombre, String direccion, Integer DNI) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.DNI = DNI;
		this.propiedades = new ArrayList<Propiedad>();
	}
	
	public Propiedad agregarPropiedad(Propiedad propiedad) {
		this.propiedades.add(propiedad);
		return propiedad;
	}
	
	public double calcularIngresos() {
		return this.propiedades.stream().mapToDouble(propiedad->propiedad.calcularPrecioTodasReservas()).sum() * 0.75;
	}
}
