package ar.edu.unlp.info.oo2.PracticaPatrones.punto14;

public class ConcreteBuilderBasico extends BuilderEquipo {
	
	public ConcreteBuilderBasico(Catalogo catalogo) {
		super(catalogo);
	}

	public void buildProcesador() {
		Componente c = catalogo.getComponente("Procesador Basico");
		this.computadora.addComponente(c);
	}

	public void buildMemoriaRam() {
		Componente c = catalogo.getComponente("8 GB");
		this.computadora.addComponente(c);
	}

	public void buildDisco() {
		Componente c = catalogo.getComponente("HDD 500 GB");
		this.computadora.addComponente(c);
	}

	public void buildGrafica() {
		Componente c = catalogo.getComponente("Integrada");
		this.computadora.addComponente(c);
	}

	public void buildGabinete() {
		Componente c = catalogo.getComponente("Gabinete Estandar");
		this.computadora.addComponente(c);
	}

}
