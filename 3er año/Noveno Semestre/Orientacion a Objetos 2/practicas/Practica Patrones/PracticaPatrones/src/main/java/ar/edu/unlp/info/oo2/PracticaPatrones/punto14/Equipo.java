package ar.edu.unlp.info.oo2.PracticaPatrones.punto14;

import java.util.ArrayList;
import java.util.List;

public class Equipo {

	private List<Componente> componentes;
	
	public Equipo() {
		this.componentes = new ArrayList<Componente>();
	}
	
	public void addComponente(Componente c) {
		this.componentes.add(c);
	}
	
	public double calcularPrecioTotal() {
		double total = 0;
		for (Componente c : componentes) {
			total += c.getPrecio();
		}
		return total;
	}
	
	public double calcularConsumo() {
		double total = 0;
		for (Componente c : componentes) {
			total += c.getConsumo();
		}
		return total * 1.21;
	}
	
}
