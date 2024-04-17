package practica1.tp1.ejercicio7;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ejercicio7e {
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		List<Estudiante> listaEstudiantes = new ArrayList<>();
		
		for (int i = 0; i < 4 ;i++) {
			System.out.println("Ingrese el nombre del estudiante: ");
			
			String nombre = scanner.next();
			
			if (existe(nombre, listaEstudiantes) == false) {
				
				Estudiante estudiante = new Estudiante();
				
				estudiante.setNombre(nombre);
				
				System.out.println("Ingrese la edad del estudiante: ");
				
				int edad = scanner.nextInt();
				
				estudiante.setEdad(edad);
				
				listaEstudiantes.add(estudiante);
			}
			else {
				System.out.println("Estudiante existente! ");
				i -= 1;
			}
		}
		
		List<Estudiante> listaEstudiantesCopy = new ArrayList<>(listaEstudiantes);
		
		System.out.println("Lista Estudiantes: ");
		imprimirLista(listaEstudiantes);
		
		System.out.println("Lista Estudiantes Copia: ");
		imprimirLista(listaEstudiantesCopy);
		
	}
	
	public static boolean existe(String nombre, List<Estudiante> lista) {
		
		for (Estudiante estudiante : lista) {
			if (estudiante.getNombre().equals(nombre)) {
				return true;
			}
		}
		return false;
		
	}
	
	public static void imprimirLista(List<Estudiante> lista) {
		for (Estudiante estudiante : lista) {
			System.out.println("Nombre: " + estudiante.getNombre() + ", Edad: " + estudiante.getEdad());
		}
	}
}