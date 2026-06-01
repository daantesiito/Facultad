package ar.edu.unlp.info.oo1.ejercicio1;

import java.io.PrintWriter;
import java.util.Random;

public class PasswordServer extends SingleThreadTCPServer {

    public void handleMessage(String message, PrintWriter out) {
        // Asumimos que el cliente envía los argumentos separados por espacio
        String[] args = message.split(" "); 
        
        if (args.length < 3) {
        	out.println("Falta de argumentos");
        	return;
        }
        
        String letras = args[1];
        String numeros = args[2];
        String especiales = args[3];
        
        String pwd = this.createPassword(letras,numeros,especiales);
        
        out.println(pwd);
	}

	private String createPassword(String letras, String numeros, String especiales) {
		Random rand = new Random();
		StringBuilder pwd = new StringBuilder();
		
		pwd.append(numeros.charAt(rand.nextInt(numeros.length())));
		
		pwd.append(especiales.charAt(rand.nextInt(especiales.length())));
		
		for (int i = 0; i < 6; i++) {
			pwd.append(letras.charAt(rand.nextInt(letras.length())));
		}
		
		return pwd.toString();
	}

}
