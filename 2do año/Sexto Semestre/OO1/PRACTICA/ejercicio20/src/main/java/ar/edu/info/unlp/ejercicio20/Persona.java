package ar.edu.info.unlp.ejercicio20;

import java.time.LocalDate;

public abstract class Persona {
	
	private String nombre;
	protected double saldo;
	
	public Persona(String nombre) {
		this.nombre = nombre;
		this.saldo = 0;
	}
	
	public double getSaldo() {
		return this.saldo;
	}
	
	public abstract void cargarSaldo(double montoCargar);
	
	public Viaje altaDeViaje(String origen, String destino,  double costoTotal, Vehiculo vehiculo,  LocalDate fechaViaje) {
		Viaje viaje =  new Viaje(origen,destino,costoTotal,vehiculo,fechaViaje);
		return viaje;
	}

	public void procesarUnViaje(Viaje viaje) {
		double montoPorCabeza = viaje.getCostoTotal() / viaje.getCantPasajerosActual();
		this.descontarSaldo(montoPorCabeza - this.calcularBonificacion());
	}

	public abstract double calcularBonificacion();

	public void descontarSaldo(double monto) {
		this.saldo -= monto;
	}
}
