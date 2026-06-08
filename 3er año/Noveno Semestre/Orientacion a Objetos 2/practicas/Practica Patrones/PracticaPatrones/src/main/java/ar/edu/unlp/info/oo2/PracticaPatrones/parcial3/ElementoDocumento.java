package ar.edu.unlp.info.oo2.PracticaPatrones.parcial3;

public interface ElementoDocumento {

	public String toString();
	
	public boolean buscar(String texto);
	
	public Documento traducir();
	
}
