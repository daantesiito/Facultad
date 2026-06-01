package ar.edu.unlp.info.oo2.PracticaPatrones.punto10;

public class Calculadora {
	
	private double valorAcumulado;
	private CalculadoraStates estado; // Guarda una referencia al estado actual
	
	public Calculadora() {
		this.valorAcumulado = 0;
		this.estado = new EstadoInicial(); // Toda calculadora nace en estado inicial
	}
	
    // --- Getters y Setters para que los estados puedan hacer las cuentas ---
	public void setValorAcumulado(double valor) {
		this.valorAcumulado = valor;
	}
	public double getValorAcumulado() {
		return this.valorAcumulado;
	}
	public void setState(CalculadoraStates newState) {
		this.estado = newState;
	}

    // --- Delegación de todos los mensajes al estado pasándose a sí misma (this) ---
	public String getResultado() {
		return this.estado.getResultado(this);
	}
	public void borrar() {
		this.estado.borrar(this);
	}
	public void setValor(double unValor) {
		this.estado.setValor(unValor, this);
	}
	public void mas() {
		this.estado.mas(this);
	}
    public void menos() {
		this.estado.menos(this);
	}
    // (Añadirías multiplicacion y division igual que arriba)
}