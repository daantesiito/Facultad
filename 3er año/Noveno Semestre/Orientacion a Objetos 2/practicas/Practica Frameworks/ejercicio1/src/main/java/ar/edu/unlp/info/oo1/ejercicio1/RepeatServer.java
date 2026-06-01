package ar.edu.unlp.info.oo1.ejercicio1;

import java.io.PrintWriter;

public class RepeatServer extends SingleThreadTCPServer {

	public void handleMessage(String message, PrintWriter out) {
		
	
		String[] args = message.split(" ");
				
		if (args.length < 2 || args[1].isEmpty() || args[2].isEmpty()){
			out.println("Error: Faltan argumentos requeridos.");
			return;
		}
		
		String stringRepetir = args[1];
		int cantVeces;
		
		try {
			cantVeces = Integer.parseInt(args[2]);
			if (cantVeces <= 0) {
			    throw new NumberFormatException();
			}
		} catch (NumberFormatException e) {
			out.println("Error: La cantidad de veces debe ser un entero mayor a 0.");
			return;
		}
		
		String especial = (args.length >= 3) ? args[1] : " ";
		
		String repeat = this.repeatMessage(stringRepetir, cantVeces, especial);
		
		out.println(repeat);
		
	}
	
	private String repeatMessage(String stringRepetir, int cantVeces, String especial) {
		if (cantVeces == 1) {
			return stringRepetir;
		}
		return (stringRepetir + especial).repeat(cantVeces - 1) + stringRepetir;
	}

}
