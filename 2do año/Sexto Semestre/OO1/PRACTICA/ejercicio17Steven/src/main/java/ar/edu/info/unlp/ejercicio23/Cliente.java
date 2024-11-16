package ar.edu.info.unlp.ejercicio23;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	
	public Bag<String> prodPorCategoria() {
		Bag<String> productosPorCategoria = new BagImpl<String>();
		this.pedidos.stream().forEach(pedido -> pedido.agregarALaBag(productosPorCategoria));
		return productosPorCategoria;
	}
}
