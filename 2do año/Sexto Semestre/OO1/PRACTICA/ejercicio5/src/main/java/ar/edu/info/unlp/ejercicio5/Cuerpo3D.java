package ar.edu.info.unlp.ejercicio5;

public class Cuerpo3D {
	
	private Figura caraBasal;
	private double altura;
	
	public Cuerpo3D() {
		
	}
	
	public void setAltura(double valor) {
		this.altura = valor;
	}
	
	public double getAltura() {
		return this.altura;
	}
	
	public void setCaraBasal(Figura figura) {
		this.caraBasal = figura;
	}
	
	public double getVolumen() {
		return caraBasal.getArea() * getAltura();
	}
	
	public double getSuperficieExterior() {
		return 2 * caraBasal.getArea() + caraBasal.getPerimetro() * getAltura();
	}
	
}
