package Practica1Ej3TEST;

import org.junit.jupiter.api.Test;

import ar.edu.unlp.info.oo1.practicasoo2.EJERCICIO3.CharRing;

import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

class IntRingTest {

	private CharRing charring;
	
	@BeforeEach
	void setUp() {
		Character[] cadena = {'a','v','i','o','n'}; 
		charring = new CharRing(cadena);
	}
	
	@Test
	void testNext() {
		assertEquals('a', charring.next());
	}
	@Test
	void testNextSeguido() {
		assertEquals('a', charring.next());
		assertEquals('v', charring.next());
		assertEquals('i', charring.next());
	}
	
	@Test
	void testNextInicio() {
		charring.next();
		charring.next();
		charring.next();
		charring.next();
		charring.next();
		
		assertEquals('a', charring.next());
	}
	
}
