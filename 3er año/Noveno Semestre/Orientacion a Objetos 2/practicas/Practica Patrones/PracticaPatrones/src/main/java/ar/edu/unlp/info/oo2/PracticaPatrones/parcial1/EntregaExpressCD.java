package ar.edu.unlp.info.oo2.PracticaPatrones.parcial1;

public class EntregaExpressCD extends Servicio {

	public EntregaExpressCD(IPaquete wrapper) {
		super(wrapper);
	}
	
	public double getCostoEnvio() {
		return super.getCostoEnvio() + (this.getValorDeclarado() * 0.5);
	}
	
	public String getDescripcion() {
		return super.getDescripcion() + "entrega express";
	}
	
}
