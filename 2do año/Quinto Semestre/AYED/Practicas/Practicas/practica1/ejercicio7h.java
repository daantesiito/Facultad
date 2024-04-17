package practica1;

import java.util.ArrayList;

public class ejercicio7h {
	
	public static void invertirArrayList(ArrayList<Integer> lista) {
		generarRecursividad(lista, lista.size()-1, 0);
	}
	
	private static void generarRecursividad(ArrayList<Integer> lista, int fin, int i) {
		
		if (i < fin) {
			
			int num = lista.get(i);
			int numFin = lista.get(fin);
			
			lista.set(numFin, num);
			lista.set(num, numFin);
						
			i++;
			fin--;
			
			generarRecursividad(lista, fin, i);
		}
	}
	
	public static void main(String[] args) {
		
		ArrayList<Integer> lista = new ArrayList<Integer>();
		
		for (int i = 0; i < 10; i++) {
			lista.add(i);
		}
		
		System.out.println("Lista: ");
		System.out.println(lista);
		System.out.println("Lista Inversa: ");
		invertirArrayList(lista);
		System.out.println(lista);
	}
	
}