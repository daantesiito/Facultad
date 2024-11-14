package ar.edu.info.unlp.ejercicio25;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ConsultaMedicaTest {
	
	private Mascota mascota1;
	private Medico medico1;
	
	@BeforeEach
	public void setUp() {
		mascota1 = new Mascota("tomi",LocalDate.of(2023, 3, 13),"perroNegro");
		medico1 = new Medico("tomi",LocalDate.of(2021, 4, 17),1000);
	}

	@Test
	void calcularCostotest() {
		ConsultaMedica consulta1 = mascota1.altaConsultaMedica(medico1);
		assertEquals(1600,consulta1.calcularCosto());
	}

}
