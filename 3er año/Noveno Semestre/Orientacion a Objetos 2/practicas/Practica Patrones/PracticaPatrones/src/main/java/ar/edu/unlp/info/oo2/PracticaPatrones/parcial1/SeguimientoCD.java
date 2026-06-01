package ar.edu.unlp.info.oo2.PracticaPatrones.parcial1;

public class SeguimientoCD extends Servicio {

	public SeguimientoCD(IPaquete wrapper) {
		super(wrapper);
	}
	
	public double getCostoEnvio() {
		return super.getCostoEnvio() + 2000;
	}
	
}
