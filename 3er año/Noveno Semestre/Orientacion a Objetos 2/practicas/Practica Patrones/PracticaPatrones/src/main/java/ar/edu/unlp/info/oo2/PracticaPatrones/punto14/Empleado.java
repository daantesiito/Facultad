package ar.edu.unlp.info.oo2.PracticaPatrones.punto14;

public class Empleado { 
	
	private BuilderEquipo builder;
	
	public Equipo armarEquipo() {
		
		builder.newEquipo(); 
		
		builder.buildProcesador();
		builder.buildMemoriaRam();
		builder.buildDisco();
		builder.buildGabinete();
		builder.buildGrafica();
		
		return builder.getEquipo();
	}
	
	public void setBuilder(BuilderEquipo builder) {
		this.builder = builder;
	}
	
}