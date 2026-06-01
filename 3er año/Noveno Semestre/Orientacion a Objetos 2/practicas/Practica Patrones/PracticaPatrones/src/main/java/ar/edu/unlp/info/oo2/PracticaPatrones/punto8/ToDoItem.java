package ar.edu.unlp.info.oo2.PracticaPatrones.punto8;

import java.util.ArrayList;
import java.util.List;

public class ToDoItem {
	
	private ToDoItemState state;
	private String name;
	private List<String> comments; 

	public ToDoItem(String name) {
		this.name = name;
		this.state = new Pending();
		this.comments = new ArrayList<String>();
	}
	
	public void start() {
		this.state.start(this);
	}

	public void togglePause() {
		this.state.togglePause(this);
	}

	public void finish() {
		this.state.finish(this);
	}

	public Duration workedTime() {
		return this.state.workedTime(this);
	}
	
	public void addComment(String comment) {
		this.state.addComent(comment, this);
	}
	
	public void setState(ToDoItemState newState) {
		this.state = newState;
	}
	
	public void setComment(String comment) {
		this.comments.add(comment);
	}

	
}
