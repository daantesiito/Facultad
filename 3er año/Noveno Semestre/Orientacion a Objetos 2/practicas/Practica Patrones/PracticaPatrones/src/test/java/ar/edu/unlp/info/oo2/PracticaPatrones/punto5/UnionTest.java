package ar.edu.unlp.info.oo2.PracticaPatrones.punto5;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import ar.edu.unlp.info.oo2.PracticaPatrones.Persona;

public class UnionTest {

	ElementoQuimico calcio, cloro, hidrogeno, oxigeno, sodio;
	Union union;
	
	@BeforeEach
	void setUp(){
		calcio = new Calcio();
		cloro = new Cloro();
		hidrogeno = new Hidrogeno();
		oxigeno = new Oxigeno();
		sodio = new Sodio();
		union = new Union(calcio, cloro);
	}
	
    @Test
    public void testAddElemento() {
        union.addElemento(oxigeno);
        
        assertEquals("CaClO", union.formula());
        assertEquals(91.0, union.pesoMolecular());
    }
    
    @Test
    public void testPesoMolecular() {
    	assertEquals(75.0, union.pesoMolecular());
    }
    
    @Test
    public void testCarga() {
    	assertEquals(1.0, union.carga());
    }
    
    @Test
    public void testFormula() {
    	assertEquals("CaCl", union.formula());
    }
    
    @Test
    public void testEsValida() {
    	assertEquals(true, union.esValida());
    }
    
    @Test
    public void testUnionesCompuestas_NaOH() {
        Union hidroxilo = new Union(oxigeno, hidrogeno); // OH
        Union naoh = new Union(sodio, hidroxilo); // Na + (OH)
        
        assertEquals("NaOH", naoh.formula());
        assertEquals(40.0, naoh.pesoMolecular()); // Na(23) + O(16) + H(1)
        assertEquals(0.0, naoh.carga()); // Na(+1) + O(-2) + H(+1) = 0 (Es una molécula)
        assertEquals(true, naoh.esValida());
    }
}
