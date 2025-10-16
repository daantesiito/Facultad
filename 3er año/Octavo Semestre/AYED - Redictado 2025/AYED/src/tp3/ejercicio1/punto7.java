package tp3.ejercicio1;

import java.util.LinkedList;
import java.util.List;

public class punto7 {

	private GeneralTree<Integer> arbol;
	
	public List<Integer> caminoAHojaMasLejana() {
		LinkedList<Integer> lista = new LinkedList<Integer>();
		LinkedList<Integer> listaMax = new LinkedList<Integer>();
		if (arbol.isEmpty())
			return listaMax;
		return caminoAHojaMasLejana(lista, listaMax, arbol);
	}
	
	private LinkedList<Integer> caminoAHojaMasLejana(LinkedList<Integer> lista, LinkedList<Integer> listaMax, GeneralTree<Integer> arbol) {
		lista.add(arbol.getData());
		if (arbol.isLeaf()) {
			if (lista.size() > listaMax.size()) {
				listaMax.clear();
				listaMax.addAll(lista);
			}
			lista.removeLast();
		}
		else
			if (arbol.hasChildren()) {
				for (GeneralTree<Integer> c : arbol.getChildren()) 
					caminoAHojaMasLejana(lista, listaMax, c);
			}
		return listaMax;
	}
	
}
