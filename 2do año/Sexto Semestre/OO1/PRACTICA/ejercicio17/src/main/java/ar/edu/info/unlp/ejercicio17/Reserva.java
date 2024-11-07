package ar.edu.info.unlp.ejercicio17;

import java.time.LocalDate;

public class Reserva {

	private DateLapse periodo;
	
	public Reserva(LocalDate fechaInicio, LocalDate fechaFin) {
		this.periodo = new DateLapse(fechaInicio, fechaFin);
	}

	public boolean verificarDisponibilidad(DateLapse otroPeriodo) {
		return this.periodo.overlaps(otroPeriodo);
	}

	public DateLapse getPeriodo() {
		return periodo;
	}

	public void setPeriodo(DateLapse periodo) {
		this.periodo = periodo;
	}
	
	public int getPeriodoDias() {
		return periodo.sizeInDays();
	}
	
	public boolean esCancelable(LocalDate now) {
		return this.periodo.includesDate(now);
	}
}
