package ar.edu.unlp.info.oo2.PracticaPatrones.punto14;

public class ConcreteBuilderGamer extends BuilderEquipo {
	
	public ConcreteBuilderGamer(Catalogo catalogo) {
		super(catalogo);
	}

	public void buildProcesador() {
		Componente c = catalogo.getComponente("Procesador Gamer");
		this.computadora.addComponente(c);
	}

	public void buildMemoriaRam() {
		Componente c = catalogo.getComponente("32 GB");
		Componente c2 = catalogo.getComponente("32 GB");
		this.computadora.addComponente(c);
		this.computadora.addComponente(c2);
	}

	public void buildDisco() {
		Componente c = catalogo.getComponente("SSD 500 GB");
		Componente c2 = catalogo.getComponente("SSD 1000 GB");
		this.computadora.addComponente(c);
		this.computadora.addComponente(c2);
	}

	public void buildGrafica() {
		Componente c = catalogo.getComponente("RTX 4090");
		this.computadora.addComponente(c);
	}

	public void buildGabinete() {
		Componente c = catalogo.getComponente("Gabinete Gamer");
		this.computadora.addComponente(c);
	}

}
