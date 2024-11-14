package ar.edu.info.unlp.ejercicio25;

import java.time.LocalDate;

public abstract class NecesitaMedico extends ServicioMedico{
	
	private Medico medico;
	
	public NecesitaMedico(Medico medico, Mascota mascota) {
		super(mascota);
		this.medico = medico;
	}
	
	public Medico getMedico() {
		return this.medico;
	}
	
	protected double esDomingo() {
		if (LocalDate.now().getDayOfWeek().getValue() == 7) {
			return 200;
		}
		return 0;
	}

	public abstract double calcularCosto();
}
