package ar.edu.info.unlp.ejercicio19;

import java.time.LocalDate;
import java.util.ArrayList;

public abstract class Cliente {
	
	private String direccion;
	private String nombre;
	private ArrayList<Envio> envios;
	
	public Cliente(String direccion, String nombre) {
		this.direccion = direccion;
		this.nombre = nombre;
		this.envios = new ArrayList<>();
	}
	
	public String getDireccion() {
		return this.direccion;
	}
	
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public void agregarEnvio(Envio envio) {
		envios.add(envio);
	}
	
	public abstract double descuento(); // Se pone metodo abstracto para poder ir a la clases y si es persona fisica devuelve 0.9 que se multiplica con el preico total, simulando un 10% de descuento.
	
	public double calcularEnvio(LocalDate fechaInicio, LocalDate fechaFin) {
		return calcularEnvioPriv(fechaInicio,fechaFin) * this.descuento();
	}
	
	private double calcularEnvioPriv(LocalDate fechaInicio, LocalDate fechaFin) {
		return this.envios.stream().filter(envio->envio.getFecha().isAfter(fechaInicio) && envio.getFecha().isBefore(fechaFin)) // se fija si la fecha de envio esta despues que la fecha inicio pasada por parametro y antes de la fecha fin pasada por parametro
				                   .mapToDouble(envio->envio.calcularMonto()) // calcula el monto de envios cada cliente
				                   .sum(); // suma todos montos y con el return retorna 1 numero solo total.
	}

}
