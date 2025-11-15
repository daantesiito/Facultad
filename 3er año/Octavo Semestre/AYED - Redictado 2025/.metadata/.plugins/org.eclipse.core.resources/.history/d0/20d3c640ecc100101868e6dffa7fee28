package tp5;

import java.util.LinkedList;
import java.util.List;

public class ejercicioBancoParcial {

	public List<Persona> recorrer(Graph<Persona> grafo, Empleado emp, int distancia) {
		LinkedList<Persona> resultado = new LinkedList<Persona>();
		boolean[] marca = new boolean[grafo.getSize()];
		Vertex<Persona> origen = grafo.search(emp);
		if (origen != null) {
			Queue<Vertex<Persona>> cola = new Queue<Vertex<Persona>>();
			int distanciaRecorrida = 0;
			marca[origen.getPosition()] = true;
			cola.enqueue(origen);
			cola.enqueue(null);
			while (!cola.isEmpty() && distanciaRecorrida <= distancia && resultado.size() < 40) {
				Vertex<Persona> persona = cola.dequeue();
			}
		}
	}
	
}
