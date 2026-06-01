package ar.edu.unlp.info.oo2.PracticaPatrones.punto12;

import java.time.LocalDate;

public interface PoliticaCancelacion {

	public double montoAReembolsar(ReservaStrategy reserva, LocalDate Fecha);
	
}
