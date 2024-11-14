package ar.edu.info.unlp.ejercicio20;

import java.time.LocalDate;
import java.util.ArrayList;

public class Viaje {
	
	private String origen;
	private String destino;
	private double costoTotal;
	private Vehiculo vehiculo;
	private LocalDate fechaViaje;
	private ArrayList<Persona> pasajeros;
	
	public Viaje(String origen, String destino,  double costoTotal, Vehiculo vehiculo,  LocalDate fechaViaje) {
		this.origen = origen;
		this.destino = destino;
		this.costoTotal = costoTotal;
		this.vehiculo = vehiculo;
		this.fechaViaje = fechaViaje;
		this.pasajeros = new ArrayList<Persona>();
		Persona conductor1 = this.vehiculo.getConductor();
		this.pasajeros.add(conductor1);
	}
	
	public Pasajero registrarPasajero(Pasajero pasajero) {
	    boolean hayEspacio = this.vehiculo.getCapacidad() > this.getCantPasajerosActual();
	    boolean enFecha = LocalDate.now().isBefore(this.fechaViaje.minusDays(2));
	    boolean tieneSaldo = pasajero.getSaldo() >= 0;

	    System.out.println("Hay espacio: " + hayEspacio);
	    System.out.println("En fecha: " + enFecha);
	    System.out.println("Tiene saldo: " + tieneSaldo);

	    if (hayEspacio && enFecha && tieneSaldo) {
	        this.pasajeros.add(pasajero);
	        pasajero.agregarViaje(this);
	        return pasajero;
	    }
	    return null;
	}

	public boolean procesarUnViaje() {
		double montoPorCabeza = this.getCostoTotal() / this.getCantPasajerosActual();
		boolean ok = false;
		for (Persona persona: this.pasajeros)
			persona.descontarSaldo(montoPorCabeza - persona.calcularBonificacion());
			ok = true;
		return ok;
	}
	
	public int getCantPasajerosActual() {
		return this.pasajeros.size();
	}
	
	public boolean hace30Dias() {
	    return this.fechaViaje.isAfter(LocalDate.now().minusMonths(1));
	}


	public String getOrigen() {
		return origen;
	}

	public void setOrigen(String origen) {
		this.origen = origen;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public double getCostoTotal() {
		return costoTotal;
	}

	public void setCostoTotal(double costoTotal) {
		this.costoTotal = costoTotal;
	}

	public Vehiculo getVehiculo() {
		return vehiculo;
	}

	public void setVehiculo(Vehiculo vehiculo) {
		this.vehiculo = vehiculo;
	}

	public LocalDate getFechaViaje() {
		return fechaViaje;
	}

	public void setFechaViaje(LocalDate fechaViaje) {
		this.fechaViaje = fechaViaje;
	}	

}
