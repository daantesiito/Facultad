package ar.edu.info.unlp.ejercicio5;

public class Cuadrado extends Figura {
	
	private double lado;
	
	public Cuadrado() {
		
	}
	
	public double getLado() {
		return this.lado;
	}
	
	public void setLado(double lado) {
		this.lado = lado;
	}
	
	public double getPerimetro() {
		return getLado() * 4;
	}
	
	public double getArea() {
		return getLado() * getLado();
	}

}
