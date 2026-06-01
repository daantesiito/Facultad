package ar.edu.unlp.info.oo2.PracticaPatrones.punto8;

public abstract class ToDoItemState {

	public void start(ToDoItem item) {
		// No hace nada
	}
	
	public void togglePause(ToDoItem item) {
        throw new RuntimeException("El objeto ToDoItem no se encuentra en pause o in-progress");
    }
	
	public void finish(ToDoItem item) {
		// No hace nada
	}
	
	public Duration workedTime(ToDoItem item) {
		return tiempoInicioHastaAhora;
	}
	
	public void addComment(String comment, ToDoItem item) {
		item.setComment(comment);
	}
	
}
