package ar.edu.unlp.info.oo2.PracticaPatrones.punto11;

import java.time.LocalDate;
import java.util.List;

public abstract class ComponentFileSystem {
	
	protected String nombre;
	protected LocalDate fecha;

	public ComponentFileSystem(String nombre, LocalDate fecha) {
		this.nombre = nombre;
		this.fecha = fecha;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public abstract int tamanoTotalOcupado();
	
	
	public abstract Archivo archivoMasGrande();
	
	
	public abstract Archivo archivoMasNuevo();
	
	
	public abstract ComponentFileSystem buscar(String nombre);
	
	
	public abstract List<ComponentFileSystem> buscarTodos(String nombre);
	
	
	public abstract String listadoDeContenido();
	
}
