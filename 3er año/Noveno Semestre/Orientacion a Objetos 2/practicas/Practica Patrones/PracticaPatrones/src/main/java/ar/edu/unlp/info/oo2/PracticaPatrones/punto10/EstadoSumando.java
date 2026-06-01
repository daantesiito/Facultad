package ar.edu.unlp.info.oo2.PracticaPatrones.punto10;

public class EstadoSumando extends CalculadoraStates {

	public void setValor(double unValor, Calculadora c) {
		double resultado = c.getValorAcumulado() + unValor;
		c.setValorAcumulado(resultado);
		c.setState(new EstadoInicial());
	}
	
}
