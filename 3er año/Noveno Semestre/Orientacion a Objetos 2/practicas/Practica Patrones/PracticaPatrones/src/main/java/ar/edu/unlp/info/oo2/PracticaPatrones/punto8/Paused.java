package ar.edu.unlp.info.oo2.PracticaPatrones.punto8;

public class Paused extends ToDoItemState {
	
	public void togglePause(ToDoItem item) {
		item.setState(new InProgress());
	}

	public void finish(ToDoItem item) {
		item.setState(new Finished());
	}
	
}
