package ar.edu.unlp.info.oo2.PracticaPatrones.punto6;

public class SandwichDirector {

	public Sandwich construir(SandwichBuilder builder) {
		builder.pan();
		builder.aderezo();
		builder.principal();
		builder.adicional();
		return builder.getResult();
	}
}