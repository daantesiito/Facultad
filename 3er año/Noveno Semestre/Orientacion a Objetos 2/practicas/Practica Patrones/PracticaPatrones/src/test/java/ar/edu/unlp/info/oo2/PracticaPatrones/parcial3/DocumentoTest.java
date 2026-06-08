package ar.edu.unlp.info.oo2.PracticaPatrones.parcial3;

public class DocumentoTest {

	private Documento documento;
	
	public void setUp() {
		
		Seccion raiz = new Seccion("Orientacion a objetos");
		
		Parrafo parrafo = new Parrafo("Temas de la materia");
		
		raiz.addElemento(parrafo);
		
		Listas lista = new Listas();
		this.lista.agregarItem("Patrones de diseño");
		this.lista.agregarItem("Refactoring de codigo");
		
		raiz.addElemento(lista);
		
		Seccion seccion2 = new Seccion("Arquitectura de servicios");
		Parrafo parrafo2 = new Parrafo("Arranca el semestre que viene");
		
		seccion2.addElemento(parrafo2);
		
		documento = new Documento("Plan de Estudios", "Pedro", raiz);
		
	}
	
}
