package ar.edu.info.unlp.ejercicio25;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class MascotaTest {
	
	Mascota mascota1;
	Medico medico1;
	ConsultaMedica consulta1;
	ConsultaMedica consulta2;
	
	@BeforeEach
	public void setUp() {
		mascota1 = new Mascota("tomi",LocalDate.of(2023, 3, 13),"perroNegro");
		medico1 = new Medico("tomi",LocalDate.of(2021, 4, 17),1000);
		
	}

	@Test
	void altaConsultaMedicaTest() {
		ConsultaMedica consulta1 = new ConsultaMedica(medico1,mascota1);
		ConsultaMedica consulta2 = mascota1.altaConsultaMedica(medico1);
		assertEquals(consulta1.getMascota(),consulta2.getMascota());
		assertEquals(consulta1.getMedico(),consulta2.getMedico());
	}
	
	@Test
	void altaVacunacionTest() {
		Vacunacion vacuna1 = new Vacunacion(medico1, mascota1, "hola", 1000);
		Vacunacion vacuna2 = mascota1.altaVacunacion(medico1, "hola", 1000);
		assertEquals(vacuna1.getMascota(),vacuna2.getMascota());
		assertEquals(vacuna1.getMedico(),vacuna2.getMedico());
	}
	
	@Test
	void altaServicioDeGuarderiaTest() {
		ServicioDeGuarderia guarderia1 = new ServicioDeGuarderia(mascota1, 3);
		ServicioDeGuarderia guarderia2 = mascota1.altaServicioDeGuarderia(3);
		assertEquals(guarderia1.getMascota(),guarderia2.getMascota());
		assertEquals(guarderia1.getCantDias(),guarderia2.getCantDias());
	}
	
	@Test
	void tieneDescuentoTest() {
		Vacunacion vacuna1 = mascota1.altaVacunacion(medico1, "hola", 1000);
		Vacunacion vacuna2 = mascota1.altaVacunacion(medico1, "chau", 12000);
		ServicioDeGuarderia guarderia1 = mascota1.altaServicioDeGuarderia(5);
		ServicioDeGuarderia guarderia2 = mascota1.altaServicioDeGuarderia(3);
		ConsultaMedica consulta1 = mascota1.altaConsultaMedica(medico1);
		ConsultaMedica consulta2 = mascota1.altaConsultaMedica(medico1);
		assertTrue(mascota1.tieneDescuento());
	}
	
	@Test
	void recaudacionGeneradaTest() {
		Vacunacion vacuna1 = mascota1.altaVacunacion(medico1, "hola", 1000);
		Vacunacion vacuna2 = mascota1.altaVacunacion(medico1, "chau", 12000);
		ServicioDeGuarderia guarderia1 = mascota1.altaServicioDeGuarderia(5);
		ServicioDeGuarderia guarderia2 = mascota1.altaServicioDeGuarderia(3);
		ConsultaMedica consulta1 = mascota1.altaConsultaMedica(medico1);
		assertEquals(21600,mascota1.recaudacionGenerada());
	}
}
