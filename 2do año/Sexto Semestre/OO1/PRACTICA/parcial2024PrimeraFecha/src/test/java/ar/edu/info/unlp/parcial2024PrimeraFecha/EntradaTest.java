package ar.edu.info.unlp.parcial2024PrimeraFecha;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class EntradaTest {
	
	Evento evento;
	Entrada entrada;

	@BeforeEach
	public void setUp() {
		evento = new Presencial("Evento", LocalDate.now().plusDays(60),"Rock",34000, 6000);
		entrada = new Entrada(evento,true);
	}

	@Test
	public void testCalcularMontoRecuperar() {
		LocalDate fecha = LocalDate.now().plusDays(90);
		//System.out.print(entrada.calcularMontoRecuperar(fecha));
	}
	
	@Test
	public void testCalcularDias() {
		LocalDate fecha = LocalDate.now().plusDays(20);
		System.out.print(entrada.calcularDias(fecha));
	}
		
}
