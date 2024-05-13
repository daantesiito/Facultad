public class punto9 {
	
	public static boolean esDeSeleccion(GeneralTree<Integer> arbol) {
		
		Queue<GT<I> c = new Queue<GT<I>>>

		boolean ok = true;

		if (!arbol.isEmpty()) {
			c.enqueue(arbol); // PRIMERO EN RECORRIDO POR NIVELES SE ENCOLA EL ARBOL
			c.enqueue(null); // SE ENCOLA NULL PARA SEPARAR POR NIVELES
			
			while (!c.isEmpty() && ok) { // MIENTRAS LA COLA NO ESTA VACIA Y OK ES TRUE
				
				GT<I> elemento = c.dequeue(); // DESENCOLAMOS EL PRIMER ELEMENTO
				
				if (elemento != null) {
					int min = Integer.MAX_VALUE;		
					
					for (GT<I> hijo: elemento.getChildren()) { // ITERAMOS LA LISTA DE HIJOS DEL ELEMENTO DESENCOLADO
						if (!hijo.isLeaf())		// SI EL HIJO NO ES HOJA ENCOLO EL HIJO
							c.enqueue(hijo);	
						min = math.min(min,hijo.getData()); // VEO CUAL ES EL MINIMO
					}
					if (!elemento.isLeaf() && min != elemento.getData()) { // SI EL HIJO NO ES HOJA Y EL DATO NO ES IGUAL AL MINIMO
						ok = false;		 
					}
					else if (!c.isEmpty()) { // SI EL ARBOL NO ESTA VACIO ENCOLO NULL PARA EL 
						c.enqueue(null);
					}	
				}		
			}
			
		}
	}
}


public class punto10 {
	
	public static List<Integer> resolver(GT<Integer> arbol) {
		
		List<Integer> caminoActual = new LinkedList<Integer>(); // CREAMOS LAS DOS LISTAS
		List<Integer> caminoFiltradoMaximo = new LinkedList<Integer>();
		
		if (!arbol.isEmpty()) {
			BuscarCaminoFiltradoMax(arbol,caminoActual,CaminoFiltradoMaximo,nivel,costoActual,costoFM) // funcion que devuelve el costo del camino. 0: nivel, costoact, costofiltradomax
																															//		 1		  2          3
		}
		
		return caminoFiltradoMax;
		
	}
	
	public static int BuscarCaminoFiltradoMax(GT<I> arbol, ) {
		if (arbol.getData() == 1) {
			caminoActual.add(1);
			costoActual = 1 * nivel; 
		}
		
		if (arbol.isLeaf()) {
			if (costoActual > costoFM); {
				costoFM = costoActual;
				caminoFiltradoMaximo.clear() // limpiamos el camino ya que hay uno mayor
				for (Integer elemento: caminoActual) {
					caminoFiltradoMaximo.add(elemento); // llenamos el camino max con el actual ya que el costo es mayor al anterior max
				}
				
			if (arbol.getData() == 1) {
				caminoFiltradoMaximo.add(elemento);
				caminoActual.remove(caminoActual.size() - 1);
			}
				
				
			}
			else {
				for  (GT<I> hijo: arbol.getChildren()) {
					costoFM = BuscarCaminoFiltradoMax(hijo,caminoActual,caminoFM,nivel+1,costoActual,costoFM);
				}
				
				if (arbol.getData() == 1) {
					caminoActual.remove(caminoActual.size() - 1);
			}
			}
		}	
	}	
}




