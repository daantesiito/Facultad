package ar.edu.info.unlp.ejercicio6;

import java.sql.Date;

public class Mamifero {
	
	private String identificador;
	private String especie;
	private Date fechaNacimiento;
	private Mamifero padre;
	private Mamifero madre;
	
	public Mamifero(String identificador) {
		super();
		this.identificador = identificador;
		this.especie = "";
		this.fechaNacimiento = null;
		this.padre = null;
		this.madre = null;
	}
	
	public Mamifero() {

	}

	public String getIdentificador() {
		return identificador;
	}

	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}

	public String getEspecie() {
		return especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	
	public Mamifero getPadre() {
		return padre;
	}

	public void setPadre(Mamifero padre) {
		this.padre = padre;
	}

	public Mamifero getMadre() {
		return madre;
	}

	public void setMadre(Mamifero madre) {
		this.madre = madre;
	}

	public Mamifero getAbueloMaterno() {
		if (this.madre != null) {
			if (this.madre.getPadre() != null) 
				return this.madre.getPadre();
		}
		return null;
	}
	
	public Mamifero getAbuelaMaterna() {
		if (this.madre != null) {
			if (this.madre.getMadre() != null) 
				return this.madre.getMadre();
		}
		return null;
	}
	
	public Mamifero getAbueloPaterno() {
		if (this.padre != null) {
			if (this.padre.getPadre() != null) 
				return this.padre.getPadre();
		}
		return null;
	}
	
	public Mamifero getAbuelaPaterna() {
		if (this.padre != null) {
			if (this.padre.getMadre() != null) 
				return this.padre.getMadre();
		}
		return null;
	}
	
    public boolean tieneComoAncestroA(Mamifero unMamifero) {
        if (!this.equals(unMamifero)) {
            return this.buscarAncestro(unMamifero);
        }
        else 
            return false;
    }
    
    private boolean buscarAncestro(Mamifero unMamifero) {
        boolean encontre = false;
        
        if (this.equals(unMamifero)) {
            return true;
        }
        else {
            if (this.getPadre() != null) 
                encontre = this.getPadre().buscarAncestro(unMamifero);
            if (this.getMadre() != null && encontre != true) 
                encontre = this.getMadre().buscarAncestro(unMamifero);
        }
        return encontre;
    }
}
