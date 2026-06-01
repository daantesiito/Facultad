package ar.edu.unlp.info.oo2.PracticaPatrones.punto11;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Directorio extends ComponentFileSystem {

	private List<ComponentFileSystem> contenido;
	
	public Directorio(String nombre, LocalDate fecha) {
		super(nombre, fecha);
		this.contenido = new ArrayList<ComponentFileSystem>();
	}
	
	public int tamanoTotalOcupado() {
		int tamanoTotal = 32;
		for (ComponentFileSystem a : contenido) {
			tamanoTotal += a.tamanoTotalOcupado();
		}
		return tamanoTotal;
	}
	
	public Archivo archivoMasGrande() {
		Archivo archMax = null;
		for (ComponentFileSystem a : contenido) {
			Archivo archTemp = a.archivoMasGrande();
			
			if (archTemp != null) {
				if (archMax == null || archTemp.tamanoTotalOcupado() > archMax.tamanoTotalOcupado()) {
					archMax = archTemp;
				}
					
			}
			
		}
		return archMax;
	}
	
	public Archivo archivoMasNuevo() {
		Archivo archMax = null;
		for (ComponentFileSystem a : contenido) {
			Archivo archTemp = a.archivoMasNuevo();
			
			if (archTemp != null) {
				if (archMax == null || archTemp.getFecha().isAfter(archMax.getFecha())) {
					archMax = archTemp;
				}
			}
		}
		return archMax;	
	}
	
	public ComponentFileSystem buscar(String nombre) {
		if (this.nombre.equals(nombre)) {
			return this;
		}
		for (ComponentFileSystem a : contenido) {
			ComponentFileSystem archCoincide = a.buscar(nombre);
			if (archCoincide != null) {
				return archCoincide;
			}
		}
		return null;
	}
	
	
	public List<ComponentFileSystem> buscarTodos(String nombre) {
		List<ComponentFileSystem> lista = new ArrayList<ComponentFileSystem>();
		
		if (this.nombre.equals(nombre)) {
			lista.add(this);
		}
		
		for (ComponentFileSystem a : contenido) {
			
			List<ComponentFileSystem> archCoincide = a.buscarTodos(nombre);
			
			lista.addAll(archCoincide);
			
		}
		return lista;
	}
	
	
	public String listadoDeContenido(String pathAcumulado) {
		String strTotal = pathAcumulado + this.nombre;
		
		for (ComponentFileSystem a : contenido) {
			String strCoincide = a.listadoDeContenido();
			strTotal += strCoincide;
		}
		return strTotal;
	}
}
