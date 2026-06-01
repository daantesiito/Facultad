package ar.edu.unlp.info.oo2.PracticaPatrones.punto14;

public class ConcreteBuilderIntermedio extends BuilderEquipo {

	public ConcreteBuilderIntermedio(Catalogo catalogo) {
		super(catalogo);
	}

	public void buildProcesador() {
		Componente c = catalogo.getComponente("Procesador Intermedio");
		this.computadora.addComponente(c);
	}

	public void buildMemoriaRam() {
		Componente c = catalogo.getComponente("16 GB");
		this.computadora.addComponente(c);
	}

	public void buildDisco() {
		Componente c = catalogo.getComponente("SSD 500 GB");
		this.computadora.addComponente(c);
	}

	public void buildGrafica() {
		Componente c = catalogo.getComponente("GTX 1650");
		this.computadora.addComponente(c);
	}

	public void buildGabinete() {
		Componente c = catalogo.getComponente("Gabinete Intermedio");
		this.computadora.addComponente(c);
	}

}
