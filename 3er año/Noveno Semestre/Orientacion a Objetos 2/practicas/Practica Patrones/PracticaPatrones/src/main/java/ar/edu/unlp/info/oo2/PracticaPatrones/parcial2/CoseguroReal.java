package ar.edu.unlp.info.oo2.PracticaPatrones.parcial2;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class CoseguroReal implements Coseguro {

    // Los atributos solo existen donde realmente hacen falta
	private String nombre;
	private int descuento;
	private LocalDate fechaIngreso;
	private double montoCoberturaViajes;
	
    // Agregamos el constructor
	public CoseguroReal(String nombre, int descuento, LocalDate fechaIngreso, double montoCoberturaViajes) {
		this.nombre = nombre;
		this.descuento = descuento;
		this.fechaIngreso = fechaIngreso;
		this.montoCoberturaViajes = montoCoberturaViajes;
	}

	public double getDescuento() {
		return this.descuento;
	}
	
	public int getAntiguedad() {
		return (int) ChronoUnit.YEARS.between(this.fechaIngreso, LocalDate.now());
	}
	
	public double getMontonCoberturaViajes() {
		return this.montoCoberturaViajes;
	}
}
