package ar.edu.unlp.info.oo2.PracticaPatrones.punto5;

public class Cloro extends ElementoQuimico {

	public double pesoMolecular() {
		return 35.0;
	}
	
	public double carga() {
		return -1.0;
	}
	
	public boolean esMetal() {
		return false;
	}
	
	public String formula() {
		return "Cl";
	}
	
	public boolean esValida() {
		return true;
	}
	
}
