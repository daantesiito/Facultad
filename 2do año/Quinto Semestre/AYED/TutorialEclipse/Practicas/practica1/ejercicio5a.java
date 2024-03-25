package practica1;

public class ejercicio5a {
	
	public static int CalcularMax(int[] numeros) {
		int max = -1;
		for (int i = 0; i < numeros.length; i++) {
			if (numeros[i] > max) {
				max = numeros[i];
			}
		}
		return max;
	}
	
	public static int CalcularMin(int[] numeros) {
		int min = 9999;
		for (int i = 0; i < numeros.length; i++) {
			if (numeros[i] < min) {
				min = numeros[i];
			}
		}
		return min;
	}
	
	public static double CalcularPromedio(int[] numeros) {
		double promedio = 0;
		int totalNum = 0;
		for (int i = 0; i < numeros.length; i++) {
			totalNum = totalNum + numeros[i];
		}
		promedio = totalNum / numeros.length;
		
		return promedio;
	}
	
	
	
}