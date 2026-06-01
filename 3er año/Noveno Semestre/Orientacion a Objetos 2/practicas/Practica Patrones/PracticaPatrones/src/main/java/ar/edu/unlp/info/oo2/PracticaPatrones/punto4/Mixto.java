package ar.edu.unlp.info.oo2.PracticaPatrones.punto4;

import java.util.ArrayList;
import java.util.List;

public class Mixto extends Topografia{

	private List<Topografia> componentes;
	
	public Mixto(Topografia t1, Topografia t2, Topografia t3, Topografia t4) {
		this.componentes = new ArrayList<>();
		this.componentes.add(t1);
		this.componentes.add(t2);
		this.componentes.add(t3);
		this.componentes.add(t4);
	}

	@Override
	public double proporcionAgua() {
		double suma = 0;
		for (Topografia componente : this.componentes) {
			suma = suma + componente.proporcionAgua();
		}
		return suma / 4.0;
	}
	
}