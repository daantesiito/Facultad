package ar.edu.info.unlp.ejercicio20;

import java.time.LocalDate;

public class Conductor extends Persona{

	private Vehiculo vehiculo;
	
	public Conductor(String nombre) {
		super(nombre);
		this.vehiculo = new Vehiculo(this,"F150 Raptor",5,2024,100000);
	}
	
	public void cargarSaldo(double montoCargar) {
		if (LocalDate.now().getYear() - this.vehiculo.getAnioFabricacion() < 5) {
			this.saldo += montoCargar * 0.99;
		}
		else
			this.saldo += montoCargar * 0.9;
	}	
	
	public double calcularBonificacion() {
		return this.vehiculo.getValorMercado() * 0.01;
	}

}