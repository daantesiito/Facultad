package ar.edu.unlp.info.oo2.PracticaPatrones.punto14;

import java.util.ArrayList;
import java.util.List;

public class Catalogo {

	private List<Componente> componentes;
	
	public Catalogo() {
		this.componentes = new ArrayList<Componente>();
	}
	
	public void addComponente(Componente newComponente) {
		this.componentes.add(newComponente);
	}
	
	public Componente getComponente(String desc) {
		for (Componente c : componentes) {
			if (c.getDescripcion().equals(desc)) {
				return c;
			}
		}
		return null;
	}
	
}
