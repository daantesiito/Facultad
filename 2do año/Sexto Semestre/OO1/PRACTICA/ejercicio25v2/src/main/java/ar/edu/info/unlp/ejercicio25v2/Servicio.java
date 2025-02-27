package ar.edu.info.unlp.ejercicio25v2;

import java.time.LocalDate;

public abstract class Servicio {
	
	protected Mascota mascota;
	protected LocalDate fecha;
	
	public Servicio(Mascota mascota, LocalDate fecha) {
		this.mascota = mascota;
		this.fecha = fecha;
	}
	
	public abstract double costoDeServicio();
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public int esDomingo() {
		if (this.fecha.getDayOfWeek().getValue() == 7)
			return 200;
		return 0;
	}

}
