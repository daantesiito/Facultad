package ar.edu.unlp.info.oo2.PracticaPatrones.parcial1;

public class SeguroCD extends Servicio {

	public SeguroCD(IPaquete wrapper) {
		super(wrapper);
	}
	
	public double getCostoEnvio() {
		return super.getCostoEnvio() + (this.getValorDeclarado() * 0.2);
	}
	
	public String getDescripcion() {
		return super.getDescripcion() + "Con seguro";
	}

}
