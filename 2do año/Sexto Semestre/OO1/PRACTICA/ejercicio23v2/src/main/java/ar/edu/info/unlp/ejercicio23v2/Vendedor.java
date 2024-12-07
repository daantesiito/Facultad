package ar.edu.info.unlp.ejercicio23v2;

import java.util.ArrayList;

public class Vendedor extends Usuario {

    private ArrayList<Producto> productos;

    public Vendedor(String nombre, String direccion) {
        super(nombre,direccion);
        this.productos = new ArrayList<Producto>();
    }
}
