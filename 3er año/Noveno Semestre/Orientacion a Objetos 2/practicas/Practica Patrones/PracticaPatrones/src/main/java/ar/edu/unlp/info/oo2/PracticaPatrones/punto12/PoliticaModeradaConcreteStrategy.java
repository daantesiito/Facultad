package ar.edu.unlp.info.oo2.PracticaPatrones.punto12;

import java.time.LocalDate;

public class PoliticaModeradaConcreteStrategy implements PoliticaCancelacion {

	public double montoAReembolsar(ReservaStrategy reserva, LocalDate fechaCancelacion) {
		double montoTotal = reserva.montoAPagar();
		if (reserva.getFecha().minusWeeks(1).isAfter(fechaCancelacion)) {
			return montoTotal;
		} else if (reserva.getFecha().minusDays(2).isAfter(fechaCancelacion)){
			return montoTotal / 2;
		} else {
			return 0;
		}
	}
	
}
