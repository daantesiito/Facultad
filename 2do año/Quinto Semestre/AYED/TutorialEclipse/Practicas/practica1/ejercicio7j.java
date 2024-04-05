package practica1;

import java.util.ArrayList;

public class ejercicio7j {
	
	public static ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1,ArrayList<Integer> lista2) {
		
		ArrayList<Integer> listaOrdenada = new ArrayList<Integer>();
		
		int i = 0;
		int i2 = 0;
		
		while (i < lista1.size() && i2 < lista2.size()) {
			if (lista1.get(i) <= lista2.get(i2)) {
				listaOrdenada.add(lista1.get(i));
				i++;
			}
			else {
				listaOrdenada.add(lista2.get(i2));
				i2++;
			}
		}
		
		while (i < lista1.size()) {
			listaOrdenada.add(lista1.get(i));
			i++;
		}
		
		while (i2 < lista2.size()) {
			listaOrdenada.add(lista2.get(i2));
			i2++;
		}
		
		return listaOrdenada;
	}

	public static void main(String[] args) {
		
		ArrayList<Integer> lista1 = new ArrayList<Integer>();
		
		lista1.add(2);
		lista1.add(3);
		lista1.add(5);
		lista1.add(9);
		
		ArrayList<Integer> lista2 = new ArrayList<Integer>();
		
		lista2.add(1);
		lista2.add(4);
		lista2.add(8);
		lista2.add(12);
		
		ArrayList<Integer> lista3 = combinarOrdenado(lista1,lista2);
		
		System.out.println("Lista 1: " + lista1);
        System.out.println("Lista 2: " + lista2);
        System.out.println("Lista combinada ordenadamente: " + lista3);
		
	}
}