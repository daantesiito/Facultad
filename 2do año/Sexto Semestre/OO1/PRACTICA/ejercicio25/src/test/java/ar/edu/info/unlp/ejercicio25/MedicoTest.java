package ar.edu.info.unlp.ejercicio25;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class MedicoTest {
	
	Medico medico1;
	
	@BeforeEach
	public void setUp() {
		medico1 = new Medico("tomi",LocalDate.of(2021, 4, 17),1000);
	}

	@Test
	void calcularAntiguedadTest() {
		assertEquals(3,medico1.calcularAntiguedad());
	}

}
