package ar.edu.unlp.info.oo1.ejercicio9v2;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Aca escribiremos los test de unidad para cada clase 
 * 
 */
public class CuentaTest {
	
	private CajaDeAhorro james;
	private CuentaCorriente guido;
	private CajaDeAhorro mayu;
	private CuentaCorriente tomi;
	
	@BeforeEach
	void setUp() throws Exception {
		james = new CajaDeAhorro();
		guido = new CuentaCorriente();
		mayu = new CajaDeAhorro();
		tomi = new CuentaCorriente();
		james.depositar(100);
		guido.depositar(500);
		mayu.depositar(250);
		tomi.depositar(1000);
	}
	
    @Test
    public void testGetSaldo() {
        assertEquals(100.0, james.getSaldo());
        assertEquals(250.0, mayu.getSaldo());
    }
    
    @Test
    public void testExtraerSinControl() {
    	guido.extraerSinControlar(400);
    	assertEquals(100.0, guido.getSaldo());
    }
    
    @Test
    public void testExtraer() {
    	assertEquals(true, mayu.extraer(100));
    	assertEquals(150.0, mayu.getSaldo()); // chequeando si se extrajo correctamente.
    	assertEquals(false, mayu.extraer(500));
    	assertEquals(true, guido.extraer(100));
    	assertEquals(400.0, guido.getSaldo());
    	assertEquals(false, guido.extraer(5555));
    	guido.setSaldoNegativo(-100);
    	assertEquals(true, guido.extraer(450));
    }
    
    @Test
    public void testTransferirACuenta() {
    	assertEquals(true, mayu.transferirACuenta(100, james));
    	assertEquals(200.0, james.getSaldo());
    	assertEquals(false, mayu.transferirACuenta(1000, james));
    	assertEquals(true, guido.transferirACuenta(150, tomi));
    	assertEquals(1150.0, tomi.getSaldo());
    	assertEquals(false, guido.transferirACuenta(5555, tomi));

    }
}
