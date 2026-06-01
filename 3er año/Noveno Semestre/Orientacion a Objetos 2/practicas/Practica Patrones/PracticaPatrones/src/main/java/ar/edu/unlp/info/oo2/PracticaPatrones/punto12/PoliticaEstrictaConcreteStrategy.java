package ar.edu.unlp.info.oo2.PracticaPatrones.punto12;

import java.time.LocalDate;

public class PoliticaEstrictaConcreteStrategy implements PoliticaCancelacion {

	public double montoAReembolsar(ReservaStrategy reserva, LocalDate fecha) {
		return 0;
	}

}
