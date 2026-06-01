package ar.edu.unlp.info.oo2.PracticaPatrones.punto12;

import java.time.LocalDate;

public class AutoEnAlquilerContext {

	private double precioPorDia;
	private int cantidadPlazas;
	private String marca;
	private PoliticaCancelacion politica;
	
	public AutoEnAlquilerContext(double precioPorDia, int cantidadPlazas, String marca) {
		this.precioPorDia = precioPorDia;
		this.cantidadPlazas = cantidadPlazas;
		this.marca = marca;
	}

	public double getPrecioPorDia() {
		return this.precioPorDia;
	}
	
	public void setPolitica(PoliticaCancelacion politicaNew) {
		this.politica = politicaNew;
	}
	
	public PoliticaCancelacion getPolitica() {
		return this.politica;
	}

	public double montoAReembolsar(ReservaStrategy reserva, LocalDate now) {
		return this.politica.montoAReembolsar(reserva, now);
	}
	
}
