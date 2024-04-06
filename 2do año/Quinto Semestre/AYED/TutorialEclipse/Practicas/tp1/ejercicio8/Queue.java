package tp1.ejercicio8;

import java.util.LinkedList;

public class Queue<T> {
	protected LinkedList<T> queue;
	
	public Queue() {
		queue = new LinkedList<T>();
	}
	
	public void enqueue(T dato) {
		queue.addLast(dato);
	}
	
	public T dequeue() {
		if (isEmpty()) {
			String error = new String();
			error = "Error.";
			return (T) error;
		}
		return queue.removeFirst();
	}
	
	public T head() {
		if (isEmpty()) {
			String error = new String();
			error = "Error.";
			return (T) error;
		}
		return queue.getFirst();
	}
	
	public boolean isEmpty() {
		return queue.isEmpty();
	}
	
	public int size() {
		return queue.size();
	}
	
	public String toString() {
		return queue.toString();
	}
	
	
}