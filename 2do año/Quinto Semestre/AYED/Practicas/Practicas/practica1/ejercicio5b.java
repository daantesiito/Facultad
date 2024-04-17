package practica1;

public class ejercicio5b {
	
	public static void CalcularMaxMinProm(int[] numeros, int[] resultados) {
		int max = -1;
		int min = 9999;
		int suma = 0;
		
		for (int i = 0; i < numeros.length; i++) {
			
			if (numeros[i] > max) {
				max = numeros[i];
			}
			
			if (numeros[i] < min) {
				min = numeros[i];
			}
			
			suma = suma + numeros[i];
			
		}
		
		resultados[0] = max;
		resultados[1] = min;
		resultados[2] = suma / numeros.length;
	}
	
}