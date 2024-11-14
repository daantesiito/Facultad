package ar.edu.info.unlp.ejercicio25;

import java.time.LocalDate;

public class ConsultaMedica extends NecesitaMedico {
		
	public ConsultaMedica(Medico medico,Mascota mascota) {
		super(medico,mascota);
	}
	
	public double calcularCosto() {
		return this.getMedico().getHonorarios() + 300 + this.esDomingo() + this.getMedico().calcularAntiguedad() * 100;
	}
	
}
