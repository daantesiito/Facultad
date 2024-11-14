package ar.edu.info.unlp.ejercicio25;

import java.time.LocalDate;

public abstract class ServicioMedico {
	
	private Mascota mascota;
	private LocalDate fecha;
	
	public ServicioMedico(Mascota mascota) {
		this.mascota = mascota;
		this.fecha = LocalDate.now();
	}
	
	public abstract double calcularCosto();
	
	public Mascota getMascota() {
		return this.mascota;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public void setMascota(Mascota mascota) {
		this.mascota = mascota;
	}
	
	
}
