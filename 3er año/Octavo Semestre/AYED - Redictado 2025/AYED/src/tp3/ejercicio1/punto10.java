package tp3.ejercicio1;

import java.util.LinkedList;
import java.util.List;

public class punto10 {

	public static List<Integer> resolver(GeneralTree<Integer> arbol) {
		LinkedList<Integer> lista = new LinkedList<Integer>();
		LinkedList<Integer> listaMax = new LinkedList<Integer>();
		if (arbol.isEmpty())
			return null;
		int nivel = 0;
		int num = 0;
		int numMax = 0;
		recorrido(arbol, lista, listaMax, nivel, num, numMax);
		return listaMax;
	}
	
	private static void recorrido(GeneralTree<Integer> arbol, LinkedList<Integer> lista, LinkedList<Integer> listaMax, int nivel, int num, int numMax) {
		if (arbol.getData() == 1) {
			lista.add(1);
			num += 1*nivel;
			
		}
		if (arbol.isLeaf()) {
			if (num > numMax) {
				listaMax.clear();
				listaMax.addAll(lista);
				numMax = num;
			}
		}
		if (arbol.hasChildren()) {
			for (GeneralTree<Integer> c : arbol.getChildren()) {
				recorrido(c, lista, listaMax, nivel+1, num, numMax);
			}
		}
		if (arbol.getData() == 1) {
			lista.removeLast();
		}
	}
	
}
