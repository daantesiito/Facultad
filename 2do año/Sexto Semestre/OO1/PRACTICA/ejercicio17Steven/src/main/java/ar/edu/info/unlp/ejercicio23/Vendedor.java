package ar.edu.info.unlp.ejercicio23;

import java.util.ArrayList;

public class Vendedor extends Persona {
	
	private ArrayList<Producto> productos;
	
	public Vendedor(String nombre, String direccion) {
		super(nombre, direccion);
		this.productos = new ArrayList<>();
	}

}
