package ar.edu.unlp.info.oo2.PracticaPatrones.parcial3;

import java.util.ArrayList;

public class Seccion implements ElementoDocumento {
	
	private String titulo;
	private ArrayList<ElementoDocumento> elementos;

	public void addElemento(ElementoDocumento el) {
		this.elementos.add(el);
	}
	
	public boolean buscar(String texto) {
		// TODO Auto-generated method stub
		return false;
	}

	public Documento traducir() {
		// TODO Auto-generated method stub
		return null;
	}

}
