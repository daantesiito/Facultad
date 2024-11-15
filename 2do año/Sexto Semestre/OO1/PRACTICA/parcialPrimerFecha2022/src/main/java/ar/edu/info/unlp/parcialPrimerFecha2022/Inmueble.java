package ar.edu.info.unlp.parcialPrimerFecha2022;

public class Inmueble implements Bien {
	
	private int numPartida;
	private double valorLote;
	private double valorEdificacion;

	public Inmueble(int numPartida, double valorLote, double valorEdificacion) {
		this.numPartida = numPartida;
		this.valorEdificacion = valorEdificacion;
		this.valorLote = valorLote;
	}
	
	public double calcularValor() {
		return (this.valorEdificacion + this.valorLote) * 0.01;
	}
}


