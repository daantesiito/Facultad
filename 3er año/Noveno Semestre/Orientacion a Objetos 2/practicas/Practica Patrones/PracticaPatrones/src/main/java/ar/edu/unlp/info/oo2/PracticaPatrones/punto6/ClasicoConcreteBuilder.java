package ar.edu.unlp.info.oo2.PracticaPatrones.punto6;

public class ClasicoConcreteBuilder implements SandwichBuilder {

	private Sandwich s = new Sandwich();
	
	public void pan() {
		s.addComponente(100);
	}
	
	public void aderezo() {
		s.addComponente(20);
	}
	
	public void principal() {
		s.addComponente(300);
	}
	
	public void adicional() {
		s.addComponente(80);
	}
	
	public Sandwich getResult() {
		return this.s;
	}
	
}
