package ar.edu.unlp.info.oo2.PracticaPatrones.punto5;

public class Sodio extends ElementoQuimico {

	public double pesoMolecular() {
		return 23.0;
	}
	
	public double carga() {
		return 1.0;
	}
	
	public boolean esMetal() {
		return true;
	}
	
	public String formula() {
		return "Na";
	}
	
	public boolean esValida() {
		return true;
	}
	
}
