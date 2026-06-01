package ar.edu.unlp.info.oo2.PracticaPatrones.parcial1;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import ar.edu.unlp.info.oo2.PracticaPatrones.Persona;


public class PaqueteTest {

	private IPaquete paquete;
	
	@BeforeEach
	public void setUp() {
		paquete = new Paquete("Caja de libros", "Juan Perez", "Calle Falsa 123", 20000.0);
	}
	
	@Test
	public void testPaqueteConSeguroYEntregaExpress() {
		paquete = new SeguroCD(paquete);
		paquete = new EntregaExpressCD(paquete);
		
		assertEquals(15000, paquete.getCostoEnvio());
	}
	
}
