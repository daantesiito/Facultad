package ar.edu.unlp.info.oo2.PracticaPatrones.punto8;

public class Finished extends ToDoItemState {
	
	public void addComment(String comment, ToDoItem item) {
		// Nada
	}

	public Duration workedTime(ToDoItem item) {
		return tiempoInicioHastaFinal;
	}
	
}
