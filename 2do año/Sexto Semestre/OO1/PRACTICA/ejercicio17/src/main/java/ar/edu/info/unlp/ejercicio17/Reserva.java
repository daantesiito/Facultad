package ar.edu.info.unlp.ejercicio17;

public class Reserva {

	private DateLapse periodo;

	public boolean verificarDisponibilidad(DateLapse otroPeriodo) {
		return this.periodo.overlaps(otroPeriodo);
	}

	public DateLapse getPeriodo() {
		return periodo;
	}

	public void setPeriodo(DateLapse periodo) {
		this.periodo = periodo;
	}
	
	
}
