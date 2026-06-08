package ar.edu.unlp.info.oo2.PracticaPatrones.punto14;

public class Empleado { 
	
	public Equipo armarEquipo(BuilderEquipo builder) {
		
		builder.newEquipo(); 
		
		builder.buildProcesador();
		builder.buildMemoriaRam();
		builder.buildDisco();
		builder.buildGabinete();
		builder.buildGrafica();
		
		return builder.getEquipo();
	}
	
}