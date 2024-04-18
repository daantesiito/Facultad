import java.util.List;

3. a: recursivo para abajo
b. iterativo
c. contadores iterativo, para informar luego

4.a: nivel 1: 14/1: 14, nivel 2: 13+25+10 / 3: 16, etc. devolver el mayor promedio. recorrido iterativo por niveles, ir sumando el contenido y contando la cantidad de nodos

5. el esAcestro lo recibe un arbol generaltree. 
tengo que preguntar por los dos. si yo pregunto solo por M, cuando lo encuentre tengo que volver en su recorrido preguntando por el n.
si pregunto por los dos y encuentro solo el m, ya es falso.
si es n, pregunto si en el arbol abajo esta.

6. recursivo, caso base es la hoja

7. la hoja define si es mayor el camino o no.  
public class Caminos() {
	
	public List<Integer> caminoAHojaMasLejana() {
		
		private List<Integer> camAct = new LinkedList<Integer>();
		
		private List<Integer> camMax = new LinkedList<Integer>();
		
		if (!this.isEmpty()) 
			camRec(a,camAct,camMax);
			
		return camMax;
		
	}
	
	private static void camRec(GeneralTree<Integer> arbol, List<Integer> camAct, List<Integer> camMax) {
		camAct.add(arbol.getData());
		
		if (arbol.isLeaf()) {
			if camAct.size() > caMax.size() {
				camMax.removeAll(camMax);
				camMax.addAll(camAct);
			}
		} else {
			GeneralTree<Integer> hijos = arbol.getChildren();
			for (GeneralTree<Integer> h: hijos) {
				camRec(h,camAct,camMax)
				camAct.remove(camAct.size() - 1);
				
			}
		}
	}
	
}



ejercicio 7 practica 2:
	private void buscar(binaryTree<Integer> ao, binaryTree<Integer> ac, int num) {
		if (ao.getData().equals(num)) {
			ac = ao; //aca devuelve desde el dato a buscar, si el arbol tiene 10-7-6-9, buscando el 6, te queda 6-9.
		} else {
			if (ao.hasLeftChild())
				buscar(ao.getLeftChild(),ac);
			if (ac == null) and (ao.hasRightChild())
				buscar(ao.getRightChild());
			
				
		}
	}
}