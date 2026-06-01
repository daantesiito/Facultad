package ar.edu.unlp.info.oo2.PracticaPatrones.punto14;

public abstract class BuilderEquipo {
	
	protected Equipo computadora;
	protected Catalogo catalogo;
	
	public BuilderEquipo(Catalogo catalogo) {
		this.catalogo = catalogo;
	}

	public abstract void buildProcesador();
	
	public abstract void buildMemoriaRam();
	
	public abstract void buildDisco();
	
	public abstract void buildGrafica();
	
	public abstract void buildGabinete();
	
	public void newEquipo() {
		this.computadora = new Equipo();
	}
	
	public Equipo getEquipo() {
		return this.computadora;
	}
	
}
