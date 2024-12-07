package ar.edu.info.unlp.ejercicio24v2;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


class ViajeTest {

    Viaje viaje;
    Conductor conductor;
    Pasajero pasajero1;
    Pasajero pasajero2;
    Vehiculo vehiculo;

    @BeforeEach
    public void setUp() {
        vehiculo = new Vehiculo(null, "Auto", 4, 2020, 20000);
        conductor = new Conductor("Dante", 1000, vehiculo);
        vehiculo.setConductor(conductor);
        pasajero1 = new Pasajero("Pasajero 1", 500);
        pasajero2 = new Pasajero("Pasajero 2", 600);
        viaje = new Viaje("Origen", "Destino", 1000, vehiculo, LocalDate.now().plusDays(10));
    }

    @Test
    public void testAniadirPasajero() {
        assertNull(viaje.aniadirPasajero(pasajero1));
        assertNull(viaje.aniadirPasajero(pasajero2));
    }

    @Test
    public void testAniadirPasajeroSinSaldo() {
        Pasajero pasajeroSinSaldo = new Pasajero("Pasajero Sin Saldo", -100);
        assertNull(viaje.aniadirPasajero(pasajeroSinSaldo));
    }

    @Test
    public void testAniadirPasajeroConFechaIncorrecta() {
        Viaje viajeConFechaIncorrecta = new Viaje("Origen", "Destino", 1000, vehiculo, LocalDate.now().minusDays(1));
        assertNull(viajeConFechaIncorrecta.aniadirPasajero(pasajero1));
    }

    @Test
    public void testProcesarViaje() {
        viaje.aniadirPasajero(pasajero1);
        viaje.aniadirPasajero(pasajero2);
        viaje.procesarViaje();
        assertEquals(0, conductor.getSaldo());
        assertEquals(0, pasajero1.getSaldo());
        assertEquals(100, pasajero2.getSaldo());
    }

    @Test
    public void testHayCapacidad() {
        assertTrue(viaje.aniadirPasajero(pasajero1) != null);
        assertTrue(viaje.aniadirPasajero(pasajero2) != null);
        Pasajero pasajero3 = new Pasajero("Pasajero 3", 700);
        Pasajero pasajero4 = new Pasajero("Pasajero 4", 800);
        assertTrue(viaje.aniadirPasajero(pasajero3) != null);
        assertTrue(viaje.aniadirPasajero(pasajero4) != null);
        Pasajero pasajero5 = new Pasajero("Pasajero 5", 900);
        assertNull(viaje.aniadirPasajero(pasajero5));
    }
}
