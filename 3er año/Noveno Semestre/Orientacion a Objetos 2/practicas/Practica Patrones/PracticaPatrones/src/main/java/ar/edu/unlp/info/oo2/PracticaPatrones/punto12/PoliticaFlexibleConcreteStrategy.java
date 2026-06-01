package ar.edu.unlp.info.oo2.PracticaPatrones.punto12;

import java.time.LocalDate;

public class PoliticaFlexibleConcreteStrategy implements PoliticaCancelacion {

	public double montoAReembolsar(ReservaStrategy reserva, LocalDate fechaCancelacion) {
		if (fechaCancelacion.isBefore(reserva.getFecha())) {
			return reserva.montoAPagar();
		} else {
			return 0;
		}
	}
s
}
