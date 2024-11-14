package ar.edu.info.unlp.ejercicio25;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ServicioDeGuarderiaTest {
	
	private Mascota mascota1;
	
	@BeforeEach
	public void setUp() {
		mascota1 = new Mascota("tomi",LocalDate.of(2023, 3, 13),"perroNegro");
		
	}

	@Test
	void calcularCostoTest() {
		ServicioDeGuarderia guarderia1 = mascota1.altaServicioDeGuarderia(3);
		assertEquals(1500.0, guarderia1.calcularCosto());
	}

}
