package ar.edu.info.unlp.ejercicio25;

import java.time.LocalDate;
import java.util.ArrayList;

public class Mascota {
	
	private String nombre;
	private LocalDate fnac;
	private String especie;
	private ArrayList<ServicioMedico> servicios;
	
	public Mascota(String nombre, LocalDate fnac, String especie) {
		this.nombre = nombre;
		this.fnac = fnac;
		this.especie = especie;
		this.servicios = new ArrayList<ServicioMedico>();
	}
	
	public ConsultaMedica altaConsultaMedica(Medico medico) {
		ConsultaMedica consulta = new ConsultaMedica(medico,this);
		this.servicios.add(consulta);
		return consulta;
	}
	
	public Vacunacion altaVacunacion(Medico medico, String nombreVacuna, double costoVacuna) {
		Vacunacion vacuna = new Vacunacion(medico,this,nombreVacuna,costoVacuna);
		this.servicios.add(vacuna);
		return vacuna;
	}
	
	public ServicioDeGuarderia altaServicioDeGuarderia(int cantDias) {
		ServicioDeGuarderia guarderia = new ServicioDeGuarderia(this,cantDias);
		this.servicios.add(guarderia);
		return guarderia;
	}
	
	public boolean tieneDescuento() {
		return servicios.size() > 5;
	}
	
	public double recaudacionGenerada() {
		return this.servicios.stream().mapToDouble(servicio -> servicio.calcularCosto()).sum();
	}

}
