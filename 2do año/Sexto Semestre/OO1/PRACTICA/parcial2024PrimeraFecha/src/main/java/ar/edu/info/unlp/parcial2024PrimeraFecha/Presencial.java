package ar.edu.info.unlp.parcial2024PrimeraFecha;

import java.time.LocalDate;
import java.util.ArrayList;

public class Presencial extends Evento {

	private ArrayList<Sede> sedes;
	
	public Presencial(String nombre, LocalDate fecha, String tema, double precio, double precioRemera) {
		super(nombre, fecha, tema, precio, precioRemera);
		this.sedes = new ArrayList<Sede>();
	}
	
	public double calcularExtras() {
		return this.calcularPrecioEstadia();
	}
	
	private double calcularPrecioEstadia() {
		return this.sedes.stream().mapToDouble(sede -> sede.calcularEstadia()).sum();
	}
	
	
}
