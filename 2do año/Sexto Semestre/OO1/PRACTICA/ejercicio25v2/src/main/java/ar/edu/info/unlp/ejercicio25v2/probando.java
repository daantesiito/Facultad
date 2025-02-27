package ar.edu.info.unlp.ejercicio25v2;

import java.time.LocalDate;

public class probando {
	
	public void main() {
		Medico medico = new Medico("capo", LocalDate.now(), 10.5);
		Mascota mascota = new Mascota("chad", LocalDate.now(), "caballo");
		Vacunacion vacuna = mascota.altaVacunacion(medico,"conchita",900);
		vacuna.costoDeServicio();
	}
	
}
