package ar.edu.unlp.info.oo1.practicasoo2.EJERCICIO3;

public abstract class Ring<T> {
	
	protected T[] source;
	protected int idx;
	
	public Ring(T[] source) {
		this.source = source;
		this.idx = 0;
	}
	
	public T next() {
		if (idx >= source.length)
			idx = 0;
		return source[idx++];
	}
	
}
