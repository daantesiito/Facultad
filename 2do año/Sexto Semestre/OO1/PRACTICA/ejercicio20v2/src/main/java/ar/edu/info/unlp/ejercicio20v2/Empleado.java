package ar.edu.info.unlp.ejercicio20v2;

import java.time.LocalDate;
import java.util.ArrayList;

public class Empleado {
	
	private String nombre;
	private String apellido;
	private String CUIL;
	private LocalDate Fnac;
	private boolean hijos;
	private boolean conyuge;
	private ArrayList<Contrato> contratos;
	private Contrato contratoActivo;

	public Empleado(String nombre, String apellido, String CUIL, LocalDate Fnac, boolean hijos, boolean conyuge, Contrato contratoActivo) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.CUIL = CUIL;
		this.Fnac = Fnac;
		this.hijos = hijos;
		this.conyuge = conyuge;
		this.contratos = new ArrayList<Contrato>();
		this.contratoActivo = contratoActivo;
	}
	
	public ReciboDeSueldo generarReciboDeSueldo() {
		return new ReciboDeSueldo(this.nombre, this.apellido, this.CUIL, this.contratoActivo.calcularAntiguedad(), this.calcularMontoConAntiguedad());
	}
	
	public double calcularSumaDeAntiguedad() {
		return this.contratos.stream().mapToDouble(contrato -> contrato.calcularAntiguedad()).sum();
	}
	
	public double calcularMontoConAntiguedad() {
		double antiguedad = this.calcularSumaDeAntiguedad();
		double porcentaje = 0;
		if (antiguedad >= 20)
			porcentaje = 2;
		else if (antiguedad >= 15)
			porcentaje = 1.7;
		else if (antiguedad >= 10)
			porcentaje = 1.5;
		else if (antiguedad >= 5)
			porcentaje = 1.3;
		return this.contratoActivo.calcularMonto() * porcentaje;
	}
	
}
