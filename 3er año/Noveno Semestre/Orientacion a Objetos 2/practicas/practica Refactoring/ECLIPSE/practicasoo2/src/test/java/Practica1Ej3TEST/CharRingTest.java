package Practica1Ej3TEST;

import org.junit.jupiter.api.Test;

import ar.edu.unlp.info.oo1.practicasoo2.EJERCICIO3.IntRing;

import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

class CharRingTest {

	private IntRing intring;
	
	@BeforeEach
	void setUp() {
		Integer[] cadena = {1,2,3,4,5};
		intring = new IntRing(cadena);
	}
	
	@Test
	void testNext() {
		assertEquals(1, intring.next());
	}
	@Test
	void testNextSeguido() {
		assertEquals(1, intring.next());
		assertEquals(2, intring.next());
		assertEquals(3, intring.next());
	}
	
	@Test
	void testNextInicio() {
		intring.next();
		intring.next();
		intring.next();
		intring.next();
		intring.next();
		
		assertEquals(1, intring.next());
	}
	
}
