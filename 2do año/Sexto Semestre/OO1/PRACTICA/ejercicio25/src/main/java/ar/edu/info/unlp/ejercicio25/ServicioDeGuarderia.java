package ar.edu.info.unlp.ejercicio25;

import java.time.LocalDate;

public class ServicioDeGuarderia extends ServicioMedico {

	private int cantDias;
	
	public ServicioDeGuarderia(Mascota mascota, int cantDias) {
		super(mascota);
		this.cantDias = cantDias;
	}
		
	public double calcularCosto() {
		if (this.getMascota().tieneDescuento()) {
			return this.cantDias * 500 * 0.9;
		}
		return this.cantDias * 500;
	}
	
	public int getCantDias() {
		return this.cantDias;
	}
}
