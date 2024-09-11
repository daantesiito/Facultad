package ar.edu.info.unlp.ejercicio4;

import java.util.ArrayList;
import java.util.List;

public class Balanza {
	
	private double precioTotal;
	private double pesoTotal;
	private List<Producto> lista;

	public Balanza() {
		this.precioTotal = 0;
		this.pesoTotal = 0;
		this.lista = new ArrayList<Producto>();
	}
	
	public int getCantidadDeProductos() {
		return this.lista.size();
	}

	public double getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	}

	public double getPesoTotal() {
		return pesoTotal;
	}

	public void setPesoTotal(double pesoTotal) {
		this.pesoTotal = pesoTotal;
	}

	public void ponerEnCero() {
		this.pesoTotal = 0;
		this.precioTotal = 0;
		this.lista.clear(); // preguntar si sirve el clear.
	}

	public void agregarProducto(Producto producto) {
		this.precioTotal += producto.getPrecio();
		this.pesoTotal += producto.getPeso();
		this.lista.add(producto);
	}
	
	public Ticket emitirTicket() {
		Ticket t = new Ticket(this.lista, this.lista.size(),this.pesoTotal,this.precioTotal);
		t.impuesto();
		return t;
	}
	
	public List<Producto> getProductos() {
		return this.lista;
	}
	
}
