package ar.edu.info.unlp.ejercicio20;

import java.time.LocalDate;

public class Conductor extends Persona{

	private Vehiculo vehiculo;
	
	public Conductor(String nombre) {
		super(nombre);
		this.vehiculo = new Vehiculo(this,"F150 Raptor",5,2024,100000);
	}
	
	public double cargarSaldo(double montoCargar) {
		if (LocalDate.now().getYear() - this.vehiculo.getAnioFabricacion() < 5) {
			this.saldo += montoCargar * 0.99;
		}
		else
			this.saldo += montoCargar * 0.9;
		return this.saldo;
	}	
	
	public double calcularBonificacion() {
		return this.vehiculo.getValorMercado() * 0.01;
	}
	
	public Vehiculo getVehiculo() {
		return this.vehiculo;
	}
}