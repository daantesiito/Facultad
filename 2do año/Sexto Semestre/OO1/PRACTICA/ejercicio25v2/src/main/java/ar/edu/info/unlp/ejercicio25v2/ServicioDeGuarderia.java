package ar.edu.info.unlp.ejercicio25v2;

import java.time.LocalDate;

public class ServicioDeGuarderia extends Servicio{

	private int cantDias;
	
	public ServicioDeGuarderia(Mascota mascota, int cantDias, LocalDate fechaInicio) {
		super(mascota, fechaInicio);
		this.cantDias = cantDias;
	}
	
	public double costoDeServicio() {
		return (500 * this.cantDias) * this.mascota.aplicaDescuento();
	}
	
}
