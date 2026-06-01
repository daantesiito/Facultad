package ar.edu.unlp.info.oo2.PracticaPatrones.punto5;

public class Calcio extends ElementoQuimico{

	public double pesoMolecular() {
		return 40.0;
	}
	
	public double carga() {
		return 2.0;
	}
	
	public boolean esMetal() {
		return true;
	}
	
	public String formula() {
		return "Ca";
	}
	
	public boolean esValida() {
		return true;
	}
	
}
