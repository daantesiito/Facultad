package ar.edu.unlp.info.oo2.PracticaPatrones.punto6;

public class SinTACCConcreteBuilder implements SandwichBuilder {

	private Sandwich s = new Sandwich();
	
	public void pan() {
		s.addComponente(150);
	}
	
	public void aderezo() {
		s.addComponente(18);
	}
	
	public void principal() {
		s.addComponente(250);
	}
	
	public void adicional() {
		s.addComponente(200);
	}
	
	public Sandwich getResult() {
		return this.s;
	}
	
}
