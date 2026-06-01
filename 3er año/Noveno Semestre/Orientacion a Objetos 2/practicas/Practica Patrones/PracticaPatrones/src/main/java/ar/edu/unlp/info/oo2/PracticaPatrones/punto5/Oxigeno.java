package ar.edu.unlp.info.oo2.PracticaPatrones.punto5;

public class Oxigeno extends ElementoQuimico {

	public double pesoMolecular() {
		return 16.0;
	}
	
	public double carga() {
		return -2.0;
	}
	
	public boolean esMetal() {
		return false;
	}
	
	public String formula() {
		return "O";
	}
	
	public boolean esValida() {
		return true;
	}
	
}
