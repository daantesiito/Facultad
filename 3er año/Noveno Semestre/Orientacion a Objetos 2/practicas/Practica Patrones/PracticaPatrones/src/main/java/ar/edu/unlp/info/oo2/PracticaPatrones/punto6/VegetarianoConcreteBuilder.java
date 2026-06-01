package ar.edu.unlp.info.oo2.PracticaPatrones.punto6;

public class VegetarianoConcreteBuilder implements SandwichBuilder{

	private Sandwich s = new Sandwich();
	
	public void pan() {
		s.addComponente(120);
	}
	
	public void aderezo() {
		s.addComponente(0);
	}
	
	public void principal() {
		s.addComponente(200);
	}
	
	public void adicional() {
		s.addComponente(100);
	}
	
	public Sandwich getResult() {
		return this.s;
	}
}
