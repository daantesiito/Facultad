package ar.edu.info.unlp.ejercicio17;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


class PropiedadTest {
	
	private Propiedad propiedad1;
	
	@BeforeEach
	void setUp() {
		propiedad1 = new Propiedad("calle2","depto2",100);
		propiedad1.crearReserva(LocalDate.of(2024, 11, 13), LocalDate.of(2024, 11, 15));
	}

	@Test
	void consultarDisponibilidadTest() {
		assertFalse(propiedad1.consultarDisponibilidad(LocalDate.of(2024, 11, 12), LocalDate.of(2024, 11, 14)));
		assertTrue(propiedad1.consultarDisponibilidad(LocalDate.of(2024, 11, 16), LocalDate.of(2024, 11, 17)));
	}
	
	@Test
	void calcularPrecioTest() {
		assertEquals(200,propiedad1.calcularPrecio(new Reserva(LocalDate.of(2024, 11, 13), LocalDate.of(2024, 11, 15))));
	}
	
	@Test
	void cancelarReservaTest() {
		Reserva reserva1 = propiedad1.crearReserva(LocalDate.of(2024, 11, 16), LocalDate.of(2024, 11, 18));
		assertEquals(reserva1,propiedad1.cancelarReserva(reserva1));	
	}

}
