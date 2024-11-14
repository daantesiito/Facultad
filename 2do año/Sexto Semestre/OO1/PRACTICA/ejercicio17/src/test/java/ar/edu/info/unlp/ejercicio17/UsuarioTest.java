package ar.edu.info.unlp.ejercicio17;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
class UsuarioTest {
	
	private Usuario tomi;
	private Propiedad propiedad1;
	private Propiedad propiedad2;
	
	@BeforeEach
	void setUp() throws Exception {
		tomi = new Usuario("tomas","culo",333);
		propiedad1 = new Propiedad("calle2","depto2",100);
		propiedad2 = new Propiedad("calle1","depto",100);

	}

	@Test
	void calcularIngresosTest() {
		propiedad1.crearReserva(LocalDate.now(), LocalDate.now().plusDays(1));
		propiedad2.crearReserva(LocalDate.now(), LocalDate.now().plusDays(1));
		tomi.agregarPropiedad(propiedad1);
		tomi.agregarPropiedad(propiedad2);
		
		assertEquals(150,tomi.calcularIngresos());
	}

}
