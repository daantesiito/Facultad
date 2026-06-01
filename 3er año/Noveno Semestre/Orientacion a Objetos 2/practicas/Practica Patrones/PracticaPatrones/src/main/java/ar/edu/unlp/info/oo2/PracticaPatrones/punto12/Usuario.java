package ar.edu.unlp.info.oo2.PracticaPatrones.punto12;

import java.util.ArrayList;
import java.util.List;

public class Usuario {

	private String nombre;
	private List<AutoEnAlquilerContext> autos;
	
	public Usuario(String nombre) {
		this.nombre = nombre;
		this.autos = new ArrayList<AutoEnAlquilerContext>();
	}
	
}
