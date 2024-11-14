package ar.edu.info.unlp.ejercicio20;

import java.util.ArrayList;

public class Pasajero extends Persona {
	
	private ArrayList<Viaje> viajes;
	
	public Pasajero(String nombre) {
		super(nombre);
	}
	
	public void cargarSaldo(double montoCargar) {
		if (this.ningunViaje30Dias())
			this.saldo += montoCargar * 0.9;
		else
			this.saldo += montoCargar;
	}
	
	public boolean ningunViaje30Dias() {
		return this.viajes.stream().noneMatch(viaje-> viaje.hace30Dias());
	}
	
	public void agregarViaje(Viaje viaje) {
		this.viajes.add(viaje);
	}
	
	public double calcularBonificacion() {
		if (this.viajes.size() > 0)
			return 500;
		else
			return 0;
	}

}
