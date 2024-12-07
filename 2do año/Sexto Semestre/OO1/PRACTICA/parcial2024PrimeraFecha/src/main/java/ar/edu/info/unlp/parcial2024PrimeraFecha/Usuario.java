package ar.edu.info.unlp.parcial2024PrimeraFecha;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.stream.Collectors;

import ar.edu.info.unlp.ejercicio17.DateLapse;

public class Usuario {
	
	private String nombre;
	private ArrayList<Entrada> entradas;
	
	public Usuario(String nombre) {
		this.nombre = nombre;
		this.entradas = new ArrayList<Entrada>();
	}
	
	public Entrada comprarEntrada(Evento evento, boolean seguro) {
		Entrada entrada = new Entrada(evento,seguro);
		this.entradas.add(entrada);
		return entrada;
	}
	
	public ArrayList<Entrada> entradasEnPeriodo(DateLapse periodo) {
		return this.entradas.stream().filter(entrada -> entrada.getEvento().getFecha().overlaps(periodo).collect(Collectors.toList()));
	}
	
	public double montoEnPeriodo(DateLapse periodo) {
		return this.entradasEnPeriodo(periodo).stream().mapToDouble(entrada -> entrada.asistencia(fecha)).sum();
	}
	
	public Entrada entradaMasCercana() { 
		return this.entradas.stream() .sorted(Comparator.comparing(e -> e.getEvento().getFecha())).findFirst().orElse(null);
	}

}
