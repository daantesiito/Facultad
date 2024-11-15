package ar.edu.info.unlp.ejercicio23;

public class Pedido {
	
	private FormaDePago formaDePago;
	private FormaDeEnvio formaDeEnvio;
	private Producto producto;
	private double cantSolicitada;
	
	public Pedido(FormaDePago formaDePago, FormaDeEnvio formaDeEnvio, Producto producto, double cantSolicitada) {
		this.formaDePago = formaDePago;
		this.formaDeEnvio = formaDeEnvio;
		this.producto = producto;
		this.cantSolicitada = cantSolicitada;
	}

	public Producto getProducto() {
		return this.producto;
	}
	
}
