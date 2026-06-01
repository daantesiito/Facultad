package ar.edu.unlp.info.oo2.PracticaPatrones.punto4;

public abstract class Topografia {

	public abstract double proporcionAgua();
	
	public double proporcionTierra() { 
		return 1.0 - this.proporcionAgua(); // Proporcion agua - tierra, si da 0 es solo agua y si da 1 es solo tierra.
	}
	
	public boolean igual(Topografia otra) {
		if (otra.equals(this)) {
			return true;
		} else {
			return false;
		}
	}
}