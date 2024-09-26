package ar.edu.info.unlp.ejercicio11;

import java.util.ArrayList;
import java.util.List;

public class Inversor {
	
	private String nombre;

	private List<Inversion> inversiones;
	
	public Inversor(String nombre) {
		this.nombre = nombre;
		this.inversiones = new ArrayList<Inversion>();
	}

	public double saldoTotal() {
		double total = 0;
		for (Inversion i: inversiones) {
			total += i.valorActual();
		}
		return total;
	}
	
	public void añadirInversion(Inversion i) {
		this.inversiones.add(i);
	}
}
