import java.util.List;

public class Recorridos<T> {
	
	public List<T> dfs(Graph<T> grafo) {
		
		boolean[] marca = new boolean[grafo.getSize()]; // BOOLEAN DEL TAMANO DEL GRAFO PARA SABER SI PASE O NO POR EL VERTICE.
		
		List<T> lis = new LinkedList<T>(); // LISTA PARA RETORNAR LOS DATOS DEL GRAFO
		
		for (int i = 0; i < grafo.getSize(); i++) { // RECORRE EL GRAFO
			
			if (!marca[i]) { // SI NO ESTA MARCADA LA POSICION, LLAMO A LA RECURSION EN DFS
				
				dfs(i,grafo,lis,marca);
			}	
		}
		
		return lis;
	}
	
	private void dfs(int i, Graph<T> grafo, List<T> lis, boolean[] marca) {
		
		marca[i] = true; // MARCA COMO TRUE PARA AVISAR QUE PASÓ
		
		Vertex<T> v = grafo.getVertex(i); // AGARRO EL VERTICE
		
		lis.add(v.getData()); // AGREGO EL DATO A LA LISTA
		
		List<Edge<T>> adyacentes = grafo.getEdges(v); // AGARRO LOS ADYACENTES
		
		for (Edge<T> e: adyacentes) { // PARA CADA ADYACENTE
			
			int j = e.getTarget().getPosition(); // AGARRO LA POSICION DEL ADYACENTE
			
			if (!marca[j]) { // SI NO ESTA MARCADO, LLAMO A RECURSION CON DFS. SI ESTA MARCADO PASA AL SIGUIENTE ADYACENTE.
				
				dfs(j,grafo,lis,marca);
				
			}
			
		}
		
	}
	
	public List<T> bfs(Graph<T> grafo) {
		
		boolean[] marca = new boolean[grafo.getSize()];
		
		List<T> lis = new LinkedList<T>();
		
		for (int i = 0; i < grafo.getSize(); i++) {
			
			if (!marca[i]) {
				
				bfs(i,grafo,lis,marca);
				
			}
			
		}
		
		return lis;
		
	}
	
	private void bfs(int i, Graph<T> grafo, List<T> lis, boolean[] marca) {
		
		Queue<Vertex<T>> q = new Queue<Vertex<T>>(); // SE ARMA LA COLA DE VERTICES
		
		q.enqueue(grafo.getVertex(i)); // ENCOLAMOS EL PRIMER ELEMENTO
		
		marca[i] = true; // LO MARCAMOS EN TRUE, QUE LO RECORRIO
		
		while (!q.isEmpty()) { // MIENTRAS LA COLA ESTE VACIA
			
			Vertex<T> w = q.dequeue(); // DESENCOLAMOS PARA RECORRER EL VERTICE
			
			lis.add(w.getData()); // AGREGAMOS A LA LISTA LOS DATOS
			
			List<Edge<T>> adyacentes = grafo.getEdges(w); // AGARRO LO ADYACENTES DEL QUE DESENCOLE
			
			for (Edge<T> e: adyacentes) { // PARA CADA ADYACENTE
				
				int j = e.getTarget().getPosition(); // AGARRO LA POSICION
				
				if (!marca[j]) { // SI LA POSICION NO ESTA MARCADA, LA MARCA Y ENCOLA EL VERTICE
					
					marca[j] = true;
					
					q.enqueue(e.getTarget());
					
				}
				
			}
			
		}
		
		
	}
	
}