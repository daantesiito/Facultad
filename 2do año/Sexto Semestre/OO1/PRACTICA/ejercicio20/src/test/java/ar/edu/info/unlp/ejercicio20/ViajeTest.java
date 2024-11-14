package ar.edu.info.unlp.ejercicio20;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ViajeTest {
	
	Viaje viaje1;
	Vehiculo vehiculo1;
	Viaje viaje2;
	Vehiculo vehiculo2;
	Viaje viaje3;
	Vehiculo vehiculo3;
	Pasajero pasajero1;
	Pasajero pasajero2;
	Conductor conductor1;
	
	@BeforeEach
	public void setUp() {
	    conductor1 = new Conductor("juan");
	    vehiculo1 = conductor1.getVehiculo();
	    viaje1 = new Viaje("la plata", "guernica", 50000, vehiculo1, LocalDate.of(2024, 12, 30));
	    viaje2 = new Viaje("la plata", "guernica", 70000, vehiculo1, LocalDate.of(2024, 7, 29));
	    viaje3 = new Viaje("la plata", "guernica", 80000, vehiculo1, LocalDate.of(2024, 11, 1));
	    pasajero1 = new Pasajero("Pasajero1");
	    pasajero2 = new Pasajero("Pasajero2");
	}

	@Test
	void registrarPasajeroTest() {
		pasajero1.cargarSaldo(200000);
		assertEquals(pasajero1,viaje1.registrarPasajero(pasajero1));
	}
	
	@Test
	void procesarUnViajeTest() {
		pasajero1.cargarSaldo(200000);
		pasajero2.cargarSaldo(200000);
		conductor1.cargarSaldo(200000);
		viaje1.registrarPasajero(pasajero1);
		viaje1.registrarPasajero(pasajero2);
		assertTrue(viaje1.procesarUnViaje());
	}

}
