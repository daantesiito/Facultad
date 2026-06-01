package ar.edu.unlp.info.oo1.ejercicio2;

import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

public class DatabaseAccessProxy implements DatabaseAccess {

	private DatabaseRealAccess database;
	private String contrasena;
	private boolean isLogged;
	
	private Logger logger = Logger.getLogger(DatabaseAccessProxy.class.getName());
	
	public DatabaseAccessProxy(DatabaseRealAccess database, String contrasena) {
		this.database = database;
		this.contrasena = contrasena;
		this.isLogged = false;
	}
	
	public void login(String pswAttempt) {
		if (this.contrasena.equals(pswAttempt)) {
			this.isLogged = true;
		} else {
			this.isLogged = false;
		}
	}
	
	public void logout() {
		this.isLogged = false;
	}
	
	public boolean checkAccess() {
		return this.isLogged;
	}

	public Collection<String> getSearchResults(String queryString) {
		if (!this.checkAccess()) {
			logger.severe("Acceso Invalido");
			throw new RuntimeException("Acceso denegado");
		}
		logger.info("Acceso valido");
		// Si está logueado, delega la acción al objeto real
		return this.database.getSearchResults(queryString);
	}

	public int insertNewRow(List<String> rowData) {
		if (!this.checkAccess()) {
			logger.severe("Acceso Invalido");
			throw new RuntimeException("Acceso denegado");
		}
		logger.warning("Acceso valido");
		return this.database.insertNewRow(rowData);
	}

}
