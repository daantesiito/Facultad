package ar.edu.unlp.info.oo2.PracticaPatrones.parcial1;

public abstract class Servicio implements IPaquete {

	private IPaquete wrapper;
	
	public Servicio(IPaquete wrapper) {
		this.wrapper = wrapper;
	}
	
	public String getDescripcion() {
		return wrapper.getDescripcion();
	}

	public String getDestinatario() {
		return wrapper.getDestinatario();
	}

	public String getDireccionDestino() {
		return wrapper.getDireccionDestino();
	}

	public double getValorDeclarado() {
		return wrapper.getValorDeclarado();
	}

	public double getCostoEnvio() {
		return wrapper.getCostoEnvio();
	}
	
}
