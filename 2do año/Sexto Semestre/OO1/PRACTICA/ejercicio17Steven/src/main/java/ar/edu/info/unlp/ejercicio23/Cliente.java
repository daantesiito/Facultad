package ar.edu.info.unlp.ejercicio23;

import java.util.ArrayList;

public class Cliente extends Persona {

	private ArrayList<Pedido> pedidos;
	
	public Cliente(String nombre, String direccion) {
		super(nombre,direccion);
		this.pedidos = new ArrayList<>();
	}
	
	public Pedido crearPedido(FormaDePago formaDePago, FormaDeEnvio formaDeEnvio, Producto producto, double cantSolicitada) {
		if (producto.getCantUnidades() >= cantSolicitada) {
			Pedido pedido = new Pedido(formaDePago,formaDeEnvio,producto,cantSolicitada);
			this.pedidos.add(pedido);
			producto.descontarUnidades(cantSolicitada);
			return pedido;
		}
		else
			return null;
	}
	
	public double prodPorCategoria() {
		this.pedidos.stream().mapToDouble(pedido -> pedido.getProducto().getCategoria()).sum();
	}
}
