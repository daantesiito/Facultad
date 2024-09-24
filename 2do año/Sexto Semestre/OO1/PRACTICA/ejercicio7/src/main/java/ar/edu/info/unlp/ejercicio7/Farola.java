package ar.edu.info.unlp.ejercicio7;

import java.util.ArrayList;

public class Farola {
	
	private boolean encendido;
	private ArrayList<Farola> neighbors;
	
	/*
	* Crear una farola. Debe inicializarla como apagada
	*/
	
	public Farola () {
		this.encendido = false;
		neighbors = new ArrayList<>();
	}
	
	/*
	* Crea la relación de vecinos entre las farolas. La relación de vecinos entre las farolas es recíproca, es decir el receptor del mensaje será vecino de otraFarola, al igual que otraFarola también se convertirá en vecina del receptor del mensaje
	*/
	
	public void pairWithNeighbor(Farola otraFarola) {
		if (!this.neighbors.contains(otraFarola)) {
			this.neighbors.add(otraFarola);
			otraFarola.pairWithNeighbor(this);
		}
	}
	
	/*
	* Retorna sus farolas vecinas
	*/
	
	public ArrayList<Farola> getNeighbors () {
		return neighbors;
	}

	/*
	* Si la farola no está encendida, la enciende y propaga la acción.
	*/
	
	public void turnOn() {
		if (this.isOff()) {
			this.encendido = true;
			if (!neighbors.isEmpty()) {
				for (Farola f: neighbors) 
					f.turnOn();
			}
		}
	}

	/*
	* Si la farola no está apagada, la apaga y propaga la acción.
	*/
	
	public void turnOff() {
		if (this.isOn()) {
			this.encendido = false;
			if (!neighbors.isEmpty()) {
				for (Farola f: neighbors) 
					f.turnOff();
			}
			
		}
	}
	
	/*
	* Retorna true si la farola está encendida.
	*/
	
	public boolean isOn() {
		if (this.encendido == true) 
			return true;
		else
			return false;
	}
	
	public boolean isOff() {
		if (this.encendido == false) 
			return true;
		else
			return false;
	}



}