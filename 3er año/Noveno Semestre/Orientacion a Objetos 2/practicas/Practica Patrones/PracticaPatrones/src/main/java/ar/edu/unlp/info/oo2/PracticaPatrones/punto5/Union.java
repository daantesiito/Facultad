package ar.edu.unlp.info.oo2.PracticaPatrones.punto5;

import java.util.ArrayList;
import java.util.List;

public class Union extends ElementoQuimico{
	
	private List<ElementoQuimico> componentes;
	
	public Union(ElementoQuimico e1, ElementoQuimico e2) {
		componentes = new ArrayList<>();
		this.componentes.add(e1);
		this.componentes.add(e2);
	}
	
	public void addElemento(ElementoQuimico e) {
		this.componentes.add(e);
	}
	
	public double pesoMolecular() {
		return this.componentes.stream().mapToDouble(ElementoQuimico::pesoMolecular).sum();
	}
	
	public double carga() {
		return this.componentes.stream().mapToDouble(ElementoQuimico::carga).sum();
	}
	
	public boolean esMetal() {
		return false;
	}
	
	public String formula() {
		return this.componentes.stream().map(ElementoQuimico::formula).reduce("", String::concat);
	}
	
	public boolean esValida() {
		
		boolean cumpleNoMetal = this.componentes.stream().anyMatch(ElementoQuimico::esMetal);
		
		boolean esValidaLista = this.componentes.stream().allMatch(ElementoQuimico::esValida);
		
		return esValidaLista && cumpleNoMetal;
	}
}
