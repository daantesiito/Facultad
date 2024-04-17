package practica1;

import java.util.ArrayList;

public class ejercicio7f{
	
	public static void main(String[] args) {
		ArrayList<Integer> listaNumeros = new ArrayList<>();
		
		int num1 = 3;
		listaNumeros.add(num1);
		int num2 = 4;
		listaNumeros.add(num2);
		int num3 = 4;
		listaNumeros.add(num3);
		int num4 = 3;
		listaNumeros.add(num4);
		
		if (esCapicua(listaNumeros)) {
			System.out.println("Es capicua!");
		}
		else {
			System.out.println("No es capicua!");
		}
		
	}
	
	public static boolean esCapicua(ArrayList<Integer> lista) {
		
		int inicio = 0;
		int fin = lista.size()-1;
		
		while (inicio <= fin) {
			
			if (!lista.get(inicio).equals(lista.get(fin))) {
				return false;
			}
			
			inicio ++;
			fin --;
			
		}
		
		return true;
		
	}
	
}
