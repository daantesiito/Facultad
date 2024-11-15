package ar.edu.info.unlp.parcialPrimerFecha2022;

import java.time.LocalDate;
import java.util.ArrayList;

public class Contribuyente {
	
	private String nombre;
	private String DNI;
	private String email;
	private String localidad;
	private ArrayList<Bien> bienes;

	public Contribuyente(String nombre, String dni, String email, String localidad) {
		this.nombre = nombre;
		this.DNI = dni;
		this.email = email;
		this.localidad = localidad;
		this.bienes = new ArrayList<Bien>();
	}
	
	public Inmueble altaInmueble(int numPartida, double valorLote, double valorEdificacion) {
		Inmueble inmueble = new Inmueble(numPartida,valorLote,valorEdificacion);
		this.bienes.add(inmueble);
		return inmueble;
	}
	
	public Automotor altaAutomotor(String patente, LocalDate fechaFabricacion, double valor, String marca, String modelo) {
		Automotor automotor = new Automotor(patente, fechaFabricacion, valor, marca, modelo);
		this.bienes.add(automotor);
		return automotor;
	}
	
	public Embarcacion altaEmbarcacion(String patente, LocalDate fechaFabricacion, double valor, String nombre) {
		Embarcacion embarcacion = new Embarcacion(patente, fechaFabricacion, valor, nombre);
		this.bienes.add(embarcacion);
		return embarcacion;
	}

	public double calcular() {
		return this.bienes.stream().mapToDouble(bien -> bien.calcularValor()).sum();
	}
	
}
