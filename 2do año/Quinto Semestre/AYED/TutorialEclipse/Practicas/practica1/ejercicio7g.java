package practica1;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ejercicio7g {
	public List<Integer> calcularSucesion(int n) {
		
		List<Integer> sucesion = new ArrayList<>();
		
		sucesion.add(n);
		
		generarSucesion(n,sucesion);
		
		return sucesion;
	}
	
	public void generarSucesion(int n, List<Integer> sucesion) {
		
		if (n == 1) {
			return;
		}
		
		if (n % 2 == 0) {
			n = (n / 2);
		}
		else {
			n = (3 * n) + 1;
		}
		
		sucesion.add(n);
		generarSucesion(n,sucesion);
	}
	
	public static void main(String[] args) {
		
		ejercicio7g sus = new ejercicio7g();
		
		List<Integer> sucesion = sus.calcularSucesion(6);
		
		System.out.println("Sucesión:");
		
	    for (int i = 0; i < sucesion.size(); i++) {
	    	
	        System.out.print(sucesion.get(i) + " ");
	    }
		
	}
	
}