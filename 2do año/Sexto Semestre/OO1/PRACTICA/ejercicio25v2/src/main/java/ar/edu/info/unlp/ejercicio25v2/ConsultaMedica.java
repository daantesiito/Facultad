package ar.edu.info.unlp.ejercicio25v2;

import java.time.LocalDate;

public class ConsultaMedica extends Servicio {
	
	private Medico medico;
	
	public ConsultaMedica(Mascota mascota, Medico medico, LocalDate fechaAtencion) {
		super(mascota, fechaAtencion);
		this.medico = medico;
	}
	
	public double costoDeServicio() {
		return this.medico.getHonorarios() + 300 + this.esDomingo() + (100 * this.medico.antiguedad());
	}

}
