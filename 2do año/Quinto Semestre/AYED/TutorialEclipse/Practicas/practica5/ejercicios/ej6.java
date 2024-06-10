import java.util.LinkedList;

public class BuscadorDeCaminos {
	
	private Graph<String> bosque;
    
    public BuscadorDeCaminos(Graph<String> bosque) {
        this.setBosque(bosque);
    }

    public Graph<String> getBosque() {
        return bosque;
    }

    public void setBosque(Graph<String> bosque) {
        this.bosque = bosque;
    }
	
	public List<List<String>> recorridosMasSeguro() {
		
		/* boolean[] marca = new boolean[this.bosque.getSize()]; */
		
		/* List<String> camAct = new LinkedList<String>(); */
		
		List<List<String>> recorridos = new LinkedList<List<String>>(); // HAGO LA LISTA DE LISTAS DE RECORRIDOS
		
		if (this.bosque.isEmpty()) { // SI NO ES VACIO
			
			Vertex<String> vOrigen = this.bosque.search("Casa Caperucita"); // BUSCO ORIGEN
			
			Vertex<String> vDestino = this.bosque.search("Casa Abuelita"); // BUSCO DESTINO
			
			if (vOrigen != null && vDestino != null) { // SI SE ENCUENTRA LLAMA A DFS.
				
				dfs(vOrigen, recorridos, new LinkedList<String>, new boolean[this.bosque.getSize()]); // DFS CON EL VERTEX ORIGEN, LISTA DE RECORRIDOS, CAMACTUAL Y BOOLEAN DE MARCAS.
				
			}
			
			
		}
		
		
	}
	
	private void dfs(Vertex<String> origen, List<List<String>> recorridos, LinkedList<String> camAct, boolean[] marca) {
		
		marca[origen.getPosition()] = true; // MARCA LA POSICION COMO PASADA
			
		camAct.add(origen.getData()); // AGREGA AL CAMINO ACTUAL EL DATO
			
		if (origen.getData().equals("Casa Abuelita")) { // SI ES EL DESTINO QUE AGREGUE EL CAMINO COMO RESULTADO
				
			recorridos.add(new LinkedList<String>(camAct)); 
				
		}
			
		else { // SI NO ES EL DESTINO
				
			List<Edge<String>> adyacentes = this.bosque.getEdges(origen); // AGARRO LOS ADYACENTES
				
			for (Edge<String> a: adyacentes) { // PARA CADA ADYACENTE
					
				Vertex<String> destino = a.getTarget(); // AGARRA EL VERTICE QUE ES PROXIMO DESTINO
					
				if (!marca[destino.getPosition()] && a.getWeight() < 5) {  // SI NO PASO POR LA POSICION Y CUMPLE LA CONDICION DE PASO LLAMA A DFS CON EL DESTINO
						
					dfs(destino,recorridos,camAct,marca);
						
				}
					
			}
				
		}
		
		// CUANDO VUELVE DE LA RECURSION, VUELVE EN EL CAMINO QUE RECORRIO.
		
		marca[origen.getPosition()] = false; // DESMARCA LA POSICION YA QUE TIENE QUE CHEQUEAR VARIOS CAMINOS EN ESTE CASO
		
		camAct.remove(camAct.size()-1); // RESTA EL CAMINO ACTUAL PARA SUMAR EL NUEVO CAMINO
			
	}

	
}