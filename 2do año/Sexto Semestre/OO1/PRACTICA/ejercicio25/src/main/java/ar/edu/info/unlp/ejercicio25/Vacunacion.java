package ar.edu.info.unlp.ejercicio25;

import java.time.LocalDate;

public class Vacunacion extends NecesitaMedico {

	private String nombreVacuna;
	private double costoVacuna;
	
	public Vacunacion(Medico medico, Mascota mascota, String nombreVacuna, double costoVacuna) {
		super(medico,mascota);
		this.costoVacuna = costoVacuna;
		this.nombreVacuna = nombreVacuna;
	}
	
	public double calcularCosto() {
		return this.getMedico().getHonorarios()+500+this.costoVacuna+this.esDomingo();
	}
}
