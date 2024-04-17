package practica1.tp1.ejercicio7;

import java.util.ArrayList;
import java.util.List;

public class ejercicio7d {
	
	public static void main(String[] args) {
		
		List<Estudiante> listaEstudiantes = new ArrayList<>();
		Estudiante estudiante1 = new Estudiante();
		estudiante1.setNombre("Dante");
		estudiante1.setEdad(19);
		listaEstudiantes.add(estudiante1);
		
		Estudiante estudiante2 = new Estudiante();
		estudiante2.setNombre("Tomas");
		estudiante2.setEdad(20);
		listaEstudiantes.add(estudiante2);
		
		Estudiante estudiante3 = new Estudiante();
		estudiante3.setNombre("Mayu");
		estudiante3.setEdad(21);
		listaEstudiantes.add(estudiante3);
		
		List<Estudiante> listaEstudiantesCopy = new ArrayList<>(listaEstudiantes);
		
		System.out.println("Lista Estudiantes: ");
		imprimirLista(listaEstudiantes);
		
		System.out.println("Lista Estudiantes Copia: ");
		imprimirLista(listaEstudiantesCopy);
		
		System.out.println("----------------------------");
		
		estudiante2.setNombre("Juan Cruz");
		
		System.out.println("Lista Estudiantes: ");
		imprimirLista(listaEstudiantes);
		
		System.out.println("Lista Estudiantes Copia: ");
		imprimirLista(listaEstudiantesCopy);
		
	}
	
	public static void imprimirLista(List<Estudiante> lista) {
		for (Estudiante estudiante : lista) {
			System.out.println("Nombre: " + estudiante.getNombre() + ", Edad: " + estudiante.getEdad());
		}
	}
}