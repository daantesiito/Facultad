package ar.edu.unlp.info.oo2.PracticaPatrones.punto6;

public interface SandwichBuilder {
	
	public void pan();
	
	public void aderezo();
	
	public void principal();
	
	public void adicional();
	
	public Sandwich getResult();
	
}
