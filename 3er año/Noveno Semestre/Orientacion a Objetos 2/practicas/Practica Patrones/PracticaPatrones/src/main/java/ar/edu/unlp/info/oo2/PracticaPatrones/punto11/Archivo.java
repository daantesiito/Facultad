package ar.edu.unlp.info.oo2.PracticaPatrones.punto11;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Archivo extends ComponentFileSystem {
	
	private int tamano;
	
	public Archivo(String nombre, LocalDate fecha, int tamano) {
		super(nombre,fecha);
		this.tamano = tamano;
	}
	
	public void setTamano(int tamano) {
		this.tamano = tamano;
	}
	
	public int tamanoTotalOcupado() {
		return this.tamano;
	}
	
	public Archivo archivoMasGrande() {
		return this;
	}
	
	public Archivo archivoMasNuevo() {
		return this;
	}
	
	public ComponentFileSystem buscar(String nombre) {
		if (this.nombre == nombre) {
			return this;
		} else {
			return null;
		}
	}
	
	
	public List<ComponentFileSystem> buscarTodos(String nombre) {
		List<ComponentFileSystem> lista = new ArrayList<ComponentFileSystem>();
		if (this.nombre == nombre) {
			lista.add(this);
		}
		return lista;
	}
	
	
	public String listadoDeContenido() {
		return this.nombre;
	}
	
	
}
