package ar.edu.info.unlp.ejercicio25;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class VacunacionTest {
	
	private Mascota mascota1;
	private Medico medico1;
	
	@BeforeEach
	public void setUp() {
		mascota1 = new Mascota("tomi",LocalDate.of(2023, 3, 13),"perroNegro");
		medico1 = new Medico("tomi",LocalDate.of(2021, 4, 17),1000);
	}

	@Test
	void calcularCostoTest() {
		Vacunacion vacuna1 = mascota1.altaVacunacion(medico1, "OSU", 1000);
		assertEquals(2500,vacuna1.calcularCosto());
		vacuna1.setFecha(LocalDate.of(2024, 11, 10));
		assertEquals(2700,vacuna1.calcularCosto());
	}

}
