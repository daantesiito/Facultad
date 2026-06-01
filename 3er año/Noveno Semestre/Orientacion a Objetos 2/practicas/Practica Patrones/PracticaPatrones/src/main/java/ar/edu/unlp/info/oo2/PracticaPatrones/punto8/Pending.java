package ar.edu.unlp.info.oo2.PracticaPatrones.punto8;

public class Pending extends ToDoItemState {

	public void start(ToDoItem item) {
		item.setState(new InProgress());
	}
	
}
