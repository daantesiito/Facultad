package ar.edu.unlp.info.oo2.PracticaPatrones.punto10;

public abstract class CalculadoraStates {
	
	protected String resultado;

	public String getResultado(Calculadora c) {
		return this.resultado;
	}
	
	public void borrar(Calculadora c) {
		c.setValorAcumulado(0);
		c.setState(new EstadoInicial());
	}
	 
	public abstract void setValor(double unValor, Calculadora c);
	 
	public void mas(Calculadora c) {
		c.setState(new EstadoError());
	}
	
	public void menos(Calculadora c) {
		c.setState(new EstadoError());
	}
	
	public void multiplicacion(Calculadora c) {
		c.setState(new EstadoError());
	}
	
	public void division(Calculadora c) {
		c.setState(new EstadoError());
	}
}
