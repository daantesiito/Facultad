package ar.edu.info.unlp.ejercicio23;

public class Domicilio implements FormaDeEnvio {
	
	private String direccionCliente;
	private String direccionVendedor;

	public double costoTotal() {
		return CalculadoraDeDistancia.distanciaEntre(this.direccionCliente, this.direccionVendedor) * 0.5;
	}
	
}