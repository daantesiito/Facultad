package tp1.ejercicio8;

public class CircularQueue<T> extends Queue<T> {
	
	public T shift() {
		
		T firstElement = dequeue();
		
		enqueue(firstElement);
		
		return firstElement;		
	}
	
}