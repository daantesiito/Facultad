package ar.edu.info.unlp.ejercicio19;

public class Corporativo extends Cliente {

	private Integer CUIT;
	
	public Corporativo(String direccion, String nombre, Integer CUIT) {
		super(direccion,nombre);
		this.CUIT = CUIT;
	}
	
	public double descuento() {
		return 1;
	}
}
