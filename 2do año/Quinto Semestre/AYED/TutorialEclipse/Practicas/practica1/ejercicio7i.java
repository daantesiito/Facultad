package practica1;

import java.util.LinkedList;

public class ejercicio7i {
	
	public static int sumarLinkedList(LinkedList<Integer> lista) {
		int suma = sumaRecursiva(lista,0);
		return suma;
	}

	public static int sumaRecursiva(LinkedList<Integer> lista, int i) {
		
		if (i == lista.size()) {
			return 0;
		}
		
		int sumaRestante = sumaRecursiva(lista,i+1);
		
		int suma = lista.get(i) + sumaRestante;
		
		return suma;
		
	}
	
	public static void main(String[] args) {
		LinkedList<Integer> lista = new LinkedList<Integer>();
		
		for (int i = 1; i < 10; i++) {
			lista.add(i);
		}
		
		System.out.println(sumarLinkedList(lista));;
		
	}
	
	
}