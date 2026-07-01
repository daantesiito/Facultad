package ar.edu.unlp.info.oo2.PracticaPatrones.punto14;

public class main {
	
	Empleado dir;
	
	BuilderEquipo pc;
	
	public void main() {
		
		dir = new Empleado();
		
		pc = new ConcreteBuilderGamer(null);
		
		dir.setBuilder(pc);
		
		Equipo computadora = dir.armarEquipo();
	}
}
