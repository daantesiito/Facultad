package ar.edu.unlp.info.oo2.PracticaPatrones.parcial1;

public class FragilCD extends Servicio {

	public FragilCD(IPaquete wrapper) {
		super(wrapper);
	}
	
	public String getDescripcion() {
		return super.getDescripcion() + "fragil";
	}
}
