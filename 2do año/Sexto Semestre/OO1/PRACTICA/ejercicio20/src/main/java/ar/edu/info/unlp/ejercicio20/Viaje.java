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
		this.pasajeros.add(this.vehiculo.getConductor());
	}
	
	public void registrarPasajero(Pasajero pasajero) {
	    if (this.vehiculo.getCapacidad() > this.getCantPasajerosActual() 
	    		&& (LocalDate.now().isBefore(this.fechaViaje.minusDays(2)) || LocalDate.now().isEqual(this.fechaViaje.minusDays(2)))
	            && pasajero.getSaldo() > 0) {
	        this.pasajeros.add(pasajero);
	        pasajero.agregarViaje(this);
	    }
	}
	
	public int getCantPasajerosActual() {
		return this.pasajeros.size();
	}
	
	public boolean hace30Dias() {
		if (this.fechaViaje.isAfter(LocalDate.now().minusMonths(1)))
			return true;
		else
			return false;
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
