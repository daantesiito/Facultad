package tp1.ejercicio7;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class TestArrayList {
	
	public static void main(String[] args) {
		
		List<Integer> numeros = new ArrayList<>();
		
		Scanner scanner = new Scanner(System.in);
		
		for (int i = 0; i < 5; i++) {
			
			System.out.print("Ingrese un numero: ");
			
			int numero = scanner.nextInt();
			
			numeros.add(numero);
		}
		
		System.out.print("Contenido de la lista: ");
		
		for (int i = 0; i < numeros.size(); i++) {
			System.out.println(numeros.get(i));
		
		// Se puede imprimir la lista de esta manera:	
		// System.out.println("Contenido de la lista:");
	    //    for (Integer numero : numeros) {
	    //        System.out.println(numero);
			
			
		}
		
	}
	
}