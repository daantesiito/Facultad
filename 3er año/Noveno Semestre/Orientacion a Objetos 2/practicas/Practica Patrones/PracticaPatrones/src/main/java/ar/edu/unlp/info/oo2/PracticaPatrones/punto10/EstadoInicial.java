package ar.edu.unlp.info.oo2.PracticaPatrones.punto10;

public class EstadoInicial extends CalculadoraStates {

	public String getResultado() {
		return this.resultado;
	}
	
	public void mas(Calculadora c, double valor) {
		c.setState(new EstadoSumando());
	}
	
	public void menos(Calculadora c, double valor) {
		c.setState(new EstadoRestando());
	}
	
	public void multiplicacion(Calculadora c, double valor) {
		c.setState(new EstadoMultiplicando());
	}
	
	public void division(Calculadora c, double valor) {
		c.setState(new EstadoDividiendo());
	}

	public void setValor(double unValor, Calculadora c) {
		c.setValorAcumulado(unValor);
	}
	
}
