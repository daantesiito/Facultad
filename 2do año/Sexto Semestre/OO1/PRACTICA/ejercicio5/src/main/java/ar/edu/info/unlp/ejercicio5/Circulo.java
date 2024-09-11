package ar.edu.info.unlp.ejercicio5;

public class Circulo extends Figura{
	
	private double diametro;
	private double radio;
	
	public Circulo() {
		
	}
	
	public double getRadio() {
		return this.radio;
	}
	
	public void setRadio(double num) {
		this.radio = num;
		setDiametro(this.radio);
	}
	
	public double getDiametro() {
		return this.diametro;
	}
	
	private void setDiametro(double num) { // preguntar private o public
		this.diametro = num * 2;
	}
	
	public double getPerimetro() {
		return Math.PI * this.getDiametro();
	}
	
	public double getArea() {
		return Math.PI * (getRadio() * getRadio());
				
	}
}
