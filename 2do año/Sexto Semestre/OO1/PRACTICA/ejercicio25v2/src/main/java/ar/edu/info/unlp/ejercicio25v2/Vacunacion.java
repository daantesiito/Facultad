package ar.edu.info.unlp.ejercicio25v2;

import java.time.LocalDate;

public class Vacunacion extends Servicio{

	private Medico medico;
	private String vacuna;
	private double costo;
	
	public Vacunacion(Mascota mascota, Medico medico, String vacuna, double costo, LocalDate fechaVacunacion) {
		super(mascota, fechaVacunacion);
		this.medico = medico;
		this.vacuna = vacuna;
		this.costo = costo;
	}
	
	public double costoDeServicio() {
		return this.medico.getHonorarios() + 500 + this.esDomingo() + this.costo;
	}
	
}
