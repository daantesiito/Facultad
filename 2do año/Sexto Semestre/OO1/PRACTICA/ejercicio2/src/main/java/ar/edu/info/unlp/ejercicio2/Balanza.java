package ar.edu.info.unlp.ejercicio2;

public class Balanza {
	
	private int cantidadDeProductos;
	private double precioTotal;
	private double pesoTotal;

	public Balanza() {
		this.cantidadDeProductos = 0;
		this.precioTotal = 0;
		this.pesoTotal = 0;
	}
	
	public int getCantidadDeProductos() {
		return cantidadDeProductos;
	}

	public void setCantidadDeProductos(int cantidadDeProductos) {
		this.cantidadDeProductos = cantidadDeProductos;
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
		this.cantidadDeProductos = 0;
	}

	public void agregarProducto(Producto producto) {
		this.cantidadDeProductos += 1;
		this.precioTotal += producto.getPrecio();
		this.pesoTotal += producto.getPeso();
	}
	
	public Ticket emitirTicket() {
		Ticket t = new Ticket(this.cantidadDeProductos,this.pesoTotal,this.precioTotal);
		return t;
	}
	
}
