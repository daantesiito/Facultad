package ar.edu.unlp.info.oo2.PracticaPatrones.punto6;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class SandwichTest {
	
	private SandwichDirector director;

	@BeforeEach
	void setUp() {
		director = new SandwichDirector();
	}
	
	@Test
	public void armarClasicoTest() {
		SandwichBuilder clasico = new ClasicoConcreteBuilder();
		
		Sandwich sandwich = director.construir(clasico);
		
		assertEquals(500, sandwich.getPrecio());
	}
	
}
