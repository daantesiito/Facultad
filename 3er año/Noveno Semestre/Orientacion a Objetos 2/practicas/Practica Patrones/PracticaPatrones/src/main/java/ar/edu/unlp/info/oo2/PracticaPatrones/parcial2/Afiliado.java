package ar.edu.unlp.info.oo2.PracticaPatrones.parcial2;

import java.time.LocalDate;
import java.util.ArrayList;

public class Afiliado {

	private String nombre;
	private int familiaresACargo;
	private double salario;
	private LocalDate fechaNacimiento;
	private ArrayList<PlanMedico> previos;
	private PlanMedico plan;
	private Coseguro coseguro;
	
	public Afiliado(String n, int f, double s, LocalDate fecha, PlanMedico plan) {
		this.nombre = n;
		this.familiaresACargo = f;
		this.salario = s;
		this.fechaNacimiento = fecha;
		this.previos = new ArrayList<PlanMedico>();
		this.plan = plan;
		this.coseguro = null;
	}
	
	public double calcularMonto() {
		return this.plan.calcularMonto(this.familiaresACargo, this.coseguro, this.salario);
	}

}
