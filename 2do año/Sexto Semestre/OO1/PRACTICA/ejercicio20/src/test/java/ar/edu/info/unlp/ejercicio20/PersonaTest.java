package ar.edu.info.unlp.ejercicio20;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class PersonaTest {
	
	Conductor conductor1;
	Vehiculo vehiculo1;
	Viaje viaje1;

	@BeforeEach
	public void setUp() {
		conductor1 = new Conductor("juan");
		vehiculo1 = conductor1.getVehiculo();
	    viaje1 = new Viaje("la plata", "guernica", 50000, vehiculo1, LocalDate.of(2024, 12, 30));
	    
	}
	
	@Test
	void altaDeViajeTest() {
		assertEquals(viaje1,conductor1.altaDeViaje("la plata", "guernica", 50000, vehiculo1, LocalDate.of(2024, 12, 30)));
	}

}
