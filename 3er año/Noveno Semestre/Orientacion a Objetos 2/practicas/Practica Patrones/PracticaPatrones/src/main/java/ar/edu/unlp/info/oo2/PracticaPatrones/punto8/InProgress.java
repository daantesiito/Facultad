package ar.edu.unlp.info.oo2.PracticaPatrones.punto8;

public class InProgress extends ToDoItemState {
	
	public void togglePause(ToDoItem item) {
		item.setState(new Paused());
	}

	public void finish(ToDoItem item) {
		item.setState(new Finished());
	}
	
}
