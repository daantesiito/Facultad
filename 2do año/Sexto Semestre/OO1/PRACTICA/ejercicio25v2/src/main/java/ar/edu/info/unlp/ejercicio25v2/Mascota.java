package ar.edu.info.unlp.ejercicio25v2;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Mascota {
	
	private String nombre;
	private LocalDate fechaNacimiento;
	private String especie;
	private ArrayList<Servicio> servicios;
	
	public Mascota(String nombre, LocalDate fechaNacimiento, String especie) {
		this.nombre = nombre;
		this.fechaNacimiento = fechaNacimiento;
		this.especie = especie;
		this.servicios = new ArrayList<Servicio>();
	}
	
	public ConsultaMedica altaConsulta(Medico medico) {
		ConsultaMedica consulta = new ConsultaMedica(this, medico, LocalDate.now());
		this.servicios.add(consulta);
		return consulta;
	}
	
	public Vacunacion altaVacunacion(Medico medico, String vacuna, double costo) {
		Vacunacion vacunacion = new Vacunacion(this, medico, vacuna, costo, LocalDate.now());
		this.servicios.add(vacunacion);
		return vacunacion;
	}
	
	public ServicioDeGuarderia altaServicioDeGuarderia(int cantDias) {
		ServicioDeGuarderia guarderia = new ServicioDeGuarderia(this, cantDias, LocalDate.now());
		this.servicios.add(guarderia);
		return guarderia;
	}
	
	public double aplicaDescuento() {
		if (this.servicios.size() > 5)
			return 0.9;
		return 1;
	}
	
	public ArrayList<Servicio> serviciosEnFecha(LocalDate fecha) {
		return this.servicios.stream() .filter(s -> s.getFecha().equals(fecha)).collect(Collectors.toCollection(ArrayList::new));
	}
	
	public double montoRecaudadoEnFecha(LocalDate fecha) {
		ArrayList<Servicio> serviciosFecha = this.serviciosEnFecha(fecha);
		return serviciosFecha.stream().mapToDouble(s -> s.costoDeServicio()).sum();
	}

}
