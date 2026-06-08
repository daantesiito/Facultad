package ar.edu.unlp.info.oo2.PracticaPatrones.parcial3;

import java.util.ArrayList;

import com.sun.java.accessibility.util.Translator;

public class Documento {

	private String titulo;
	private String autor;
	private Seccion raiz;
	
	public Documento(String t, String a) {
		this.titulo = t;
		this.autor = a;
	}
	
	public String toString() {
		return this.titulo + this.autor + this.raiz.toString();
	}
	
	public boolean buscar(String texto) {
		return this.raiz.buscar(texto);
	}
	
	public Documento traducir() {
		return new Documento(
	            Translator.translate(this.titulo), 
	            this.autor, 
	            (Seccion) this.raiz.traducir()
	        );
	}
	
}
