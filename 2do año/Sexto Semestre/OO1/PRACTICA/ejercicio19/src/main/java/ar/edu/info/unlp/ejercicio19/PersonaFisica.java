package ar.edu.info.unlp.ejercicio19;

public class PersonaFisica extends Cliente{

	private Integer DNI;

	public PersonaFisica(Integer DNI, String direccion, String nombre) {
		super(direccion, nombre);
		this.DNI = DNI;
	}
	
	public double descuento() {
		return 0.9;
	}
}
